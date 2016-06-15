# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-argcomplete
PKG_VERSION:=1.1.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Alexander Couzens <lynxis@fe80.eu>
PKG_LICENSE:=Apache Software License

PKG_SOURCE:=argcomplete-1.1.1.tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/a/argcomplete/
PKG_MD5SUM:=89a3839096c9f991ad33828e72d21abf

PKG_BUILD_DIR:=$(BUILD_DIR)/argcomplete-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-argcomplete
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-argcomplete
  URL:=http://pypi.python.org/argcomplete
  DEPENDS:=+python 
endef

define Package/python-argcomplete/description
	Bash tab completion for argparse
endef

$(eval $(call PyMod/Default))
$(eval $(call PyPackage,python-argcomplete))
$(eval $(call BuildPackage,python-argcomplete))