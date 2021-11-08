#
# Copyright (C) 2011-2020 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=srt
PKG_VERSION:=1.4.4
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Haivision/srt/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=93f5f3715bd5bd522b8d65fc0d086ef2ad49db6a41ad2d7b35df2e8bd7094114

PKG_MAINTAINER:=
PKG_LICENSE:=MPL-2.0
# PKG_LICENSE_FILES:=LICENSE.md

PKG_BUILD_DEPENDS:=
# PKG_CONFIG_DEPENDS:=CONFIG_BUILD_PATENTED

include $(INCLUDE_DIR)/package.mk
# include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/srt
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libatomic +libstdcpp +libopenssl +libnettle
  TITLE:=Secure Reliable Transport UDP streaming library
  URL:=https://github.com/Haivision/srt
  USERID:=srt:srt
endef

define Package/srt/description
  SRT is a latency-aware UDP transport mechanism optimized for video streams. It detects and compensates for jitter and bandwidth fluctuations due to network congestion. It mitigates packet loss and supports AES encryption.
endef

define Package/srt/conffiles
/etc/config/srt
endef

CMAKE_OPTIONS += \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_SYSCONFDIR=/etc \
	-DCMAKE_INSTALL_LOCALSTATEDIR=/var \
	-DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
	-DCMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY=ON

TARGET_CFLAGS += \
	-ffunction-sections \
	-fdata-sections \
	-flto

TARGET_LDFLAGS += -Wl,--gc-sections

define Package/srt/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/srt-ffplay $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/srt-file-transmit $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/srt-live-transmit $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/srt-tunnel $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/libsrt.so $(1)/usr/lib/libsrt.so
endef

$(eval $(call BuildPackage,srt))
