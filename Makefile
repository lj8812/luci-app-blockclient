include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-blockclient
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for Blocking Clients by IP/MAC
  PKGARCH:=all
  DEPENDS:=+luci-base +iptables
endef

define Package/$(PKG_NAME)/description
  LuCI interface to block clients by IP or MAC address.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
	po2lmo ./po/zh_Hans/blockclient.po $(PKG_BUILD_DIR)/blockclient.zh-cn.lmo
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./root/etc/config/blockclient $(1)/etc/config/blockclient

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/blockclient $(1)/etc/init.d/blockclient

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./root/usr/lib/lua/luci/controller/blockclient.lua $(1)/usr/lib/lua/luci/controller/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DATA) ./root/usr/lib/lua/luci/model/cbi/blockclient.lua $(1)/usr/lib/lua/luci/model/cbi/

	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./root/usr/share/rpcd/acl.d/blockclient.json $(1)/usr/share/rpcd/acl.d/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/blockclient.zh-cn.lmo $(1)/usr/lib/lua/luci/i18n/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
