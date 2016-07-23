# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-configglue
PKG_VERSION:=1.1.3.post0
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=BSD License

PKG_SOURCE:=configglue-1.1.3.post0.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/c/configglue/
PKG_MD5SUM:=ecc6016f66fc5043618cf8bed1c7e087

PKG_BUILD_DIR:=$(BUILD_DIR)/configglue-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python python-setuptools

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-configglue
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-configglue
  URL:=http://pypi.python.org/configglue
  DEPENDS:=+python +python-pyxdg
endef

define Package/python-configglue/description
	Glue to stick OptionParser and ConfigParser together
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-configglue))
$(eval $(call BuildPackage,python-configglue))
