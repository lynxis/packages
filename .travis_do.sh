#!/bin/bash
#
# MIT Alexander Couzens <lynxis@fe80.eu>

set -e

SDK_HOME="$HOME/sdk"
SDK_PATH=https://downloads.lede-project.org/snapshots/targets/ar71xx/generic/
SDK=lede-sdk-ar71xx-generic_gcc-5.4.0_musl.Linux-x86_64
PACKAGES_DIR="$PWD"

echo_red()   { printf "\033[1;31m$*\033[m\n"; }
echo_green() { printf "\033[1;32m$*\033[m\n"; }
echo_blue()  { printf "\033[1;34m$*\033[m\n"; }

exec_status() {
	PATTERN="$1"
	shift
	("$@" 2>&1) | tee logoutput
	R=${PIPESTATUS[0]}
	if [ $R -ne 0 ]; then
		echo_red   "=> '$*' failed (return code $R)"
		return 1
	fi
	if grep -qE "$PATTERN" logoutput; then
		echo_red   "=> '$*' failed (log matched '$PATTERN')"
		return 1
	fi

	echo_green "=> '$*' successful"
	return 0
}

# download will run on the `before_script` step
# The travis cache will be used (all files under $HOME/sdk/). Meaning
# We don't have to download the file again
download_sdk() {
	mkdir -p "$SDK_HOME"
	cd "$SDK_HOME"

	echo_blue "=== download SDK"
	wget "$SDK_PATH/sha256sums" -O sha256sums
	wget "$SDK_PATH/sha256sums.gpg" -O sha256sums.asc

	# LEDE Build System (LEDE GnuPG key for unattended build jobs)
	gpg --recv 0xCD84BCED626471F1
	# LEDE Release Builder (17.01 "Reboot" Signing Key)
	gpg --recv 0x833C6010D52BBB6B
	gpg --verify sha256sums.asc
	grep "$SDK" sha256sums > sha256sums.small

	# if missing, outdated or invalid, download again
	if ! sha256sum -c ./sha256sums.small ; then
		wget "$SDK_PATH/$SDK.tar.xz" -O "$SDK.tar.xz"
	fi

	# check again and fail here if the file is still bad
	sha256sum -c ./sha256sums.small
	echo_blue "=== SDK is up-to-date"
}

# test_package will run on the `script` step.
# test_package call make download check for very new/modified package
test_packages2() {
	# search for new or modified packages. PKGS will hold a list of package like 'admin/muninlite admin/monit ...'
	PKGS=$(git diff --diff-filter=d --name-only "$TRAVIS_COMMIT_RANGE" | grep 'Makefile$' | grep -v '/files/' | awk -F'/Makefile' '{ print $1 }')

	if [ -z "$PKGS" ] ; then
		echo_blue "No new or modified packages found!"
		return 0
	fi

	echo_blue "=== Found new/modified packages:"
	for pkg in $PKGS ; do
		echo "===+ $pkg"
	done

	echo_blue "=== Setting up SDK"
	tmp_path=$(mktemp -d)
	cd "$tmp_path"
	tar Jxf "$SDK_HOME/$SDK.tar.xz" --strip=1

	# use github mirrors to spare lede servers
	cat > feeds.conf <<EOF
src-git base https://github.com/lede-project/source.git
src-link packages $PACKAGES_DIR
src-git luci https://github.com/openwrt/luci.git
EOF

	# enable BUILD_LOG
	sed -i '1s/^/config BUILD_LOG\n\tbool\n\tdefault y\n\n/' Config-build.in

	./scripts/feeds update -a
	./scripts/feeds install -a
	make defconfig
	echo_blue "=== Setting up SDK done"

	RET=0
	# E.g: pkg_dir => admin/muninlite
	# pkg_name => muninlite
	for pkg_dir in $PKGS ; do
		pkg_name=$(echo "$pkg_dir" | awk -F/ '{ print $NF }')
		echo_blue "=== $pkg_name: Starting quick tests"

		exec_status 'WARNING|ERROR' make "package/$pkg_name/download" V=s || RET=1
		exec_status 'WARNING|ERROR' make "package/$pkg_name/check" V=s || RET=1

		echo_blue "=== $pkg_name: quick tests done"
	done

	[ $RET -ne 0 ] && return $RET

	for pkg_dir in $PKGS ; do
		pkg_name=$(echo "$pkg_dir" | awk -F/ '{ print $NF }')
		echo_blue "=== $pkg_name: Starting compile test"

		# we can't enable verbose built else we often hit Travis limits
		# on log size and the job get killed
		exec_status '^ERROR' make "package/$pkg_name/compile" -j$(nproc)

		echo_blue "=== $pkg_name: compile test done"

		echo_blue "=== $pkg_name: begin compile logs"
		cat logs/package/feeds/packages/$pkg_name/compile.txt
		echo_blue "=== $pkg_name: end compile logs"
	done

	return 0
}

test_commits() {
	RET=0
	for commit in $(git rev-list ${TRAVIS_COMMIT_RANGE/.../..}); do
		echo_blue "=== Checking commit '$commit'"
		if git show --format='%P' -s $commit | grep -qF ' '; then
			echo_red "Pull request should not include merge commits"
			RET=1
		fi

		author="$(git show -s --format=%aN $commit)"
		if echo $author | grep -q '\S\+\s\+\S\+'; then
			echo_green "Author name ($author) seems ok"
		else
			echo_red "Author name ($author) need to be your real name 'firstname lastname'"
			RET=1
		fi

		subject="$(git show -s --format=%s $commit)"
		if echo "$subject" | grep -q -e '^[0-9A-Za-z,/-]\+: ' -e '^Revert '; then
			echo_green "Commit subject line seems ok ($subject)"
		else
			echo_red "Commit subject line MUST start with '<package name>: ' ($subject)"
			RET=1
		fi

		body="$(git show -s --format=%b $commit)"
		sob="$(git show -s --format='Signed-off-by: %aN <%aE>' $commit)"
		if echo "$body" | grep -qF "$sob"; then
			echo_green "Signed-off-by match author"
		else
			echo_red "Signed-off-by is missing or doesn't match author (should be '$sob')"
			RET=1
		fi
	done

	return $RET
}

test_packages() {
	test_commits && test_packages2 || return 1
}

echo_blue "=== Travis ENV"
env
echo_blue "=== Travis ENV"

while true; do
	# if clone depth is too small, git rev-list / diff return incorrect or empty results
	C="$(git rev-list ${TRAVIS_COMMIT_RANGE/.../..} | tail -n1)" 2>/dev/null
	[ -n "$C" -a "$C" != "a22de9b74cf9579d1ce7e6cf1845b4afa4277b00" ] && break
	echo_blue "Fetching 50 commits more"
	git fetch origin --deepen=50
done

if [ "$TRAVIS_PULL_REQUEST" = false ] ; then
	echo "Only Pull Requests are supported at the moment." >&2
	exit 0
fi


if [ $# -ne 1 ] ; then
	cat <<EOF
Usage: $0 (download_sdk|test_packages)

download_sdk - download the SDK to $HOME/sdk.tar.xz
test_packages - do a make check on the package
EOF
	exit 1
fi

$@
