# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-argparse
PKG_VERSION:=1.4.0
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=Python Software Foundation License

PKG_SOURCE:=argparse-1.4.0.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/a/argparse/
PKG_MD5SUM:=08062d2ceb6596fcbc5a7e725b53746f

PKG_BUILD_DIR:=$(BUILD_DIR)/argparse-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-argparse
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-argparse
  URL:=http://pypi.python.org/argparse
  DEPENDS:=+python 
endef

define Package/python-argparse/description
	Python command-line parsing library
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-argparse))
$(eval $(call BuildPackage,python-argparse))