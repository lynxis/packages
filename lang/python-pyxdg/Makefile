# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-pyxdg
PKG_VERSION:=0.25
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=UNKNOWN

PKG_SOURCE:=pyxdg-0.25.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/p/pyxdg/
PKG_MD5SUM:=bedcdb3a0ed85986d40044c87f23477c

PKG_BUILD_DIR:=$(BUILD_DIR)/pyxdg-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-pyxdg
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-pyxdg
  URL:=http://pypi.python.org/pyxdg
  DEPENDS:=+python 
endef

define Package/python-pyxdg/description
	PyXDG contains implementations of freedesktop.org standards in python.
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-pyxdg))
$(eval $(call BuildPackage,python-pyxdg))