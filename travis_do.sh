#!/bin/sh
#
# MIT Alexander Couzens <lynxis@fe80.eu>

set -e

SDK=lede-sdk-ar71xx-generic_gcc-5.4.0_musl.Linux-x86_64
PACKAGES_DIR=$PWD

# download will run on the `before_script` step
download_sdk() {
	wget https://downloads.lede-project.org/snapshots/targets/ar71xx/generic/$SDK.tar.xz -O $HOME/sdk.tar.gz
}

# test_package will run on the `script` step
test_packages() {
	# search for new or modified packages. PKGS will hold a list of package like 'admin/muninlite admin/monit ...'
	PKGS=$(git diff --stat origin/master | grep Makefile | grep -v '/files/' | awk '{ print $1}' | awk -F'/Makefile' '{ print $1 }')

	if [ -z "$PKGS" ] ; then
		echo "No new or modified packages found!" >&2
		exit 1
	fi

	# E.g: pkg_dir => admin/muninlite
	#      pkg_name => muninlite
	for pkg_dir in $PKGS ; do
		local pkg_name
		pkg_name=$(echo $pkg_dir | awk -F/ '{ print $NF }')

		# create a clean sdk for every package
		mkdir -p $HOME/tmp/$pkg_name/
		cd $HOME/tmp/$pkg_name/
		tar Jxf $HOME/sdk.tar.gz
		cd $SDK

		cat > feeds.conf <<EOF
src-git base https://git.lede-project.org/source.git
src-link packages $PACKAGES_DIR
src-git luci https://git.lede-project.org/project/luci.git
src-git routing https://git.lede-project.org/feed/routing.git
src-git telephony https://git.lede-project.org/feed/telephony.git
EOF
		./scripts/feeds update
		./scripts/feeds install $pkg_name

		make package/$pkg_name/download
		make package/$pkg_name/check V=s | grep -q WARNING && exit 1
	done
}

export

# for now we only build PR
if [ "$TRAVIS_PULL_REQUEST" = false ] ; then
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
