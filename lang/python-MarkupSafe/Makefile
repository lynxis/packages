# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-MarkupSafe
PKG_VERSION:=0.23
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=BSD

PKG_SOURCE:=MarkupSafe-0.23.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/M/MarkupSafe/
PKG_MD5SUM:=f5ab3deee4c37cd6a922fb81e730da6e

PKG_BUILD_DIR:=$(BUILD_DIR)/MarkupSafe-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-MarkupSafe
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-MarkupSafe
  URL:=http://pypi.python.org/MarkupSafe
  DEPENDS:=+python 
endef

define Package/python-MarkupSafe/description
	Implements a XML/HTML/XHTML Markup safe string for Python
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-MarkupSafe))
$(eval $(call BuildPackage,python-MarkupSafe))