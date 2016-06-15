# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-pexpect
PKG_VERSION:=4.0.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=ISC license

PKG_SOURCE:=pexpect-4.0.1.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/p/pexpect/
PKG_MD5SUM:=056df81e6ca7081f1015b4b147b977b7

PKG_BUILD_DIR:=$(BUILD_DIR)/pexpect-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-pexpect
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-pexpect
  URL:=http://pypi.python.org/pexpect
  DEPENDS:=+python 
endef

define Package/python-pexpect/description
	Pexpect allows easy control of interactive console applications.
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-pexpect))
$(eval $(call BuildPackage,python-pexpect))