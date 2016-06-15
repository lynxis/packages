# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-netifaces
PKG_VERSION:=0.10.4
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=MIT License

PKG_SOURCE:=netifaces-0.10.4.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/n/netifaces/
PKG_MD5SUM:=36da76e2cfadd24cc7510c2c0012eb1e

PKG_BUILD_DIR:=$(BUILD_DIR)/netifaces-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-netifaces
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-netifaces
  URL:=http://pypi.python.org/netifaces
  DEPENDS:=+python 
endef

define Package/python-netifaces/description
	Portable network interface information.
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-netifaces))
$(eval $(call BuildPackage,python-netifaces))