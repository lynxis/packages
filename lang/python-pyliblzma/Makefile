# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-pyliblzma
PKG_VERSION:=0.5.3
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=LGPL 3

PKG_SOURCE:=pyliblzma-0.5.3.tar.bz2
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/p/pyliblzma/
PKG_MD5SUM:=500f61116ee1ab4063b49c121786863a

PKG_BUILD_DIR:=$(BUILD_DIR)/pyliblzma-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-pyliblzma
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-pyliblzma
  URL:=http://pypi.python.org/pyliblzma
  DEPENDS:=+python +liblzma
endef

define Package/python-pyliblzma/description
	Python bindings for liblzma
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-pyliblzma))
$(eval $(call BuildPackage,python-pyliblzma))