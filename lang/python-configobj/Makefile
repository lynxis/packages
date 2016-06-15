# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-configobj
PKG_VERSION:=5.0.6
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=UNKNOWN

PKG_SOURCE:=configobj-5.0.6.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/c/configobj/
PKG_MD5SUM:=e472a3a1c2a67bb0ec9b5d54c13a47d6

PKG_BUILD_DIR:=$(BUILD_DIR)/configobj-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-configobj
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-configobj
  URL:=http://pypi.python.org/configobj
  DEPENDS:=+python +python-six
endef

define Package/python-configobj/description
	Config file reading, writing and validation.
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-configobj))
$(eval $(call BuildPackage,python-configobj))