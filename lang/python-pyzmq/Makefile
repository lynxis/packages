# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-pyzmq
PKG_VERSION:=15.2.0
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=LGPL+BSD

PKG_SOURCE:=pyzmq-15.2.0.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/p/pyzmq/
PKG_MD5SUM:=9722046c27475441d47ac17a98c665bb

PKG_BUILD_DIR:=$(BUILD_DIR)/pyzmq-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-pyzmq
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-pyzmq
  URL:=http://pypi.python.org/pyzmq
  DEPENDS:=+python +libzmq +libstdcpp
endef

define Package/python-pyzmq/description
	Python bindings for 0MQ
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-pyzmq))
$(eval $(call BuildPackage,python-pyzmq))