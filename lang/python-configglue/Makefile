#
# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-configglue
PKG_VERSION:=1.1.3
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=BSD-2-Clause

PKG_SOURCE:=configglue-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/c/configglue/
PKG_MD5SUM:=d611c78cc94f7c2feb9ad8129884e492

PKG_BUILD_DIR:=$(BUILD_DIR)/configglue-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-configglue
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-configglue
  URL:=http://configglue.sourceforge.net
  DEPENDS:=+python
endef

define Package/python-configglue/description
	serial port python bindings
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

$(eval $(call PyPackage,python-configglue))
$(eval $(call BuildPackage,python-configglue))
