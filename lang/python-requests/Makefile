# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-requests
PKG_VERSION:=2.9.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=Apache 2.0

PKG_SOURCE:=requests-2.9.1.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/r/requests/
PKG_MD5SUM:=0b7f480d19012ec52bab78292efd976d

PKG_BUILD_DIR:=$(BUILD_DIR)/requests-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-requests
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-requests
  URL:=http://pypi.python.org/requests
  DEPENDS:=+python 
endef

define Package/python-requests/description
	Python HTTP for Humans.
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-requests))
$(eval $(call BuildPackage,python-requests))