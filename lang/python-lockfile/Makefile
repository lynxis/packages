# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-lockfile
PKG_VERSION:=0.12.2
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=

PKG_SOURCE:=lockfile-0.12.2.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/l/lockfile/
PKG_MD5SUM:=a6a1a82957a23afdf44cfdd039b65ff9

PKG_BUILD_DIR:=$(BUILD_DIR)/lockfile-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-lockfile
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-lockfile
  URL:=http://pypi.python.org/lockfile
  DEPENDS:=+python 
endef

define Package/python-lockfile/description
	Platform-independent file locking module
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-lockfile))
$(eval $(call BuildPackage,python-lockfile))