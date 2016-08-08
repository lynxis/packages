# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-daemon
PKG_VERSION:=2.1.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=Apache-2

PKG_SOURCE:=python-daemon-2.1.1.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/p/python-daemon/
PKG_MD5SUM:=72e2acf2c3d69c7fa75a6625d06adfd0

PKG_BUILD_DIR:=$(BUILD_DIR)/python-daemon-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-daemon
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-daemon
  URL:=http://pypi.python.org/python-daemon
  DEPENDS:=+python 
endef

define Package/python-daemon/description
	Library to implement a well-behaved Unix daemon process.
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-daemon))
$(eval $(call BuildPackage,python-daemon))