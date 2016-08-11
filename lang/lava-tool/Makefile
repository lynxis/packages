# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lava-tool
PKG_VERSION:=0.14
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=LGPLv3

PKG_SOURCE_URL:=https://git.linaro.org/lava/lava-tool.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=release-0.14
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/

PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/lava-tool
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=lava-tool
  URL:=http://validation.linaro.org
  DEPENDS:=+python +python-yaml +python-argparse +python-argcomplete +python-keyring +python-json-schema-validator +python-pyxdg +python-Jinja2 +python-setuptools +python-readline +python-lockfile
endef

define Package/lava-tool/description
	Testing lava
endef

define PyPackage/lava-tool/filespec
+|$(PYTHON_PKG_DIR)
+|/usr/bin
endef

define Build/Compile
	$(call Build/Compile/PyMod,,\
		install --prefix=/usr --root=$(PKG_INSTALL_DIR),)
endef

$(eval $(call PyPackage,lava-tool))
$(eval $(call BuildPackage,lava-tool))
