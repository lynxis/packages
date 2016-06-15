# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-keyring
PKG_VERSION:=9.0
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=UNKNOWN

PKG_SOURCE:=keyring-9.0.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/k/keyring/
PKG_MD5SUM:=7b88030ba5936e95b71c04a069ba111c

PKG_BUILD_DIR:=$(BUILD_DIR)/keyring-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-keyring
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-keyring
  URL:=http://pypi.python.org/keyring
  DEPENDS:=+python 
endef

define Package/python-keyring/description
	Store and access your passwords safely.
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-keyring))
$(eval $(call BuildPackage,python-keyring))