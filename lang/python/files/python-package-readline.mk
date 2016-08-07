#
# Copyright (C) 2016 Alexander Couzens <lynxis@fe80.eu>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Package/python-readline
$(call Package/python/Default)
  TITLE:=Python $(PYTHON_VERSION) readline
  DEPENDS:=+python-light +libreadline +libncursesw
endef

$(eval $(call PyBasePackage,python-readline, \
	/usr/lib/python$(PYTHON_VERSION)/lib-dynload/readline.so \
))
