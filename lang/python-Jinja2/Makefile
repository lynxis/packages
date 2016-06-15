# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-Jinja2
PKG_VERSION:=2.8
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=BSD

PKG_SOURCE:=Jinja2-2.8.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/J/Jinja2/
PKG_MD5SUM:=edb51693fe22c53cee5403775c71a99e

PKG_BUILD_DIR:=$(BUILD_DIR)/Jinja2-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-Jinja2
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-Jinja2
  URL:=http://pypi.python.org/Jinja2
  DEPENDS:=+python +python-MarkupSafe
endef

define Package/python-Jinja2/description
	A small but fast and easy to use stand-alone template engine written in pure python.
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-Jinja2))
$(eval $(call BuildPackage,python-Jinja2))