#
# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_PYTHON_NAME:=argcomplete
PKG_NAME:=python-$(PKG_PYTHON_NAME)
PKG_VERSION:=1.1.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=Apache-2.0

PKG_SOURCE:=$(PKG_PYTHON_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/a/argcomplete/
PKG_MD5SUM:=89a3839096c9f991ad33828e72d21abf

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_PYTHON_NAME)-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-argcomplete
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-argcomplete
  URL:=http://argcomplete.sourceforge.net
  DEPENDS:=+python
endef

define Package/python-argcomplete/description
	serial port python bindings
endef

define PyPackage/$(PKG_NAME)/filespec
+|$(PYTHON_PKG_DIR)/$(PKG_PYTHON_NAME)-$(PKG_VERSION)-py2.7.egg
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/python-argcomplete/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call PyPackage,python-argcomplete))
$(eval $(call BuildPackage,python-argcomplete))
