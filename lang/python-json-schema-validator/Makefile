# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-json-schema-validator
PKG_VERSION:=2.4.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=None

PKG_SOURCE:=json-schema-validator-2.4.1.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/j/json-schema-validator/
PKG_MD5SUM:=7691b41739faaa8b0965279e72889932

PKG_BUILD_DIR:=$(BUILD_DIR)/json-schema-validator-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-json-schema-validator
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-json-schema-validator
  URL:=http://pypi.python.org/json-schema-validator
  DEPENDS:=+python +python-versiontools
endef

define Package/python-json-schema-validator/description
	JSON Schema Validator
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-json-schema-validator))
$(eval $(call BuildPackage,python-json-schema-validator))