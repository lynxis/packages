#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nodogsplash2
PKG_FIXUP:=autoreconf
PKG_VERSION:=2.1.5
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/lynxis/nodogsplash.git
PKG_SOURCE_VERSION:=36e8a1af8bfff6e27d87ac145559ce4080ace46b
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.gz
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk


define Package/nodogsplash
  SECTION:=config
  CATEGORY:=network
  DEPENDS:=+libpthread +iptables-mod-ipopt +libmicrohttpd-no-ssl
  TITLE:=Open public network gateway daemon
  URL:=https://github.com/nodogsplash/nodogsplash
endef

define Package/nodogsplash/description
	Nodogsplash
endef

define Package/nodogsplash/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nodogsplash $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ndsctl $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/nodogsplash.init $(1)/etc/init.d/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/nodogsplash.config $(1)/etc/config/nodogsplash

	$(INSTALL_DIR) $(1)/usr/lib/nodogsplash/
	$(INSTALL_DIR) $(1)/usr/lib/nodogsplash/htdocs

	$(INSTALL_DIR) $(1)/etc/nodogsplash/htdocs
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/splash.html $(1)/etc/nodogsplash/htdocs/
endef

define Package/nodogsplash/conffiles
/etc/config/nodogsplash
/etc/nodogsplash/nodogsplash.conf
/etc/nodogsplash/htdocs
endef

$(eval $(call BuildPackage,nodogsplash2))
