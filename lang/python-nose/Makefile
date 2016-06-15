# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-nose
PKG_VERSION:=1.3.7
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=GNU LGPL

PKG_SOURCE:=nose-1.3.7.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/n/nose/
PKG_MD5SUM:=4d3ad0ff07b61373d2cefc89c5d0b20b

PKG_BUILD_DIR:=$(BUILD_DIR)/nose-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-nose
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-nose
  URL:=http://pypi.python.org/nose
  DEPENDS:=+python 
endef

define Package/python-nose/description
	nose extends unittest to make testing easier
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-nose))
$(eval $(call BuildPackage,python-nose))