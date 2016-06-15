# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-versiontools
PKG_VERSION:=1.9.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=UNKNOWN

PKG_SOURCE:=versiontools-1.9.1.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/v/versiontools/
PKG_MD5SUM:=602b7db8eea30dd29a1d451997adf251

PKG_BUILD_DIR:=$(BUILD_DIR)/versiontools-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-versiontools
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-versiontools
  URL:=http://pypi.python.org/versiontools
  DEPENDS:=+python 
endef

define Package/python-versiontools/description
	Smart replacement for plain tuple used in __version__
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-versiontools))
$(eval $(call BuildPackage,python-versiontools))