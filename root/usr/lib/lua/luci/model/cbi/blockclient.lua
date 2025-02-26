m = Map("blockclient", translate("客户端上网控制"), 
    translate("实时生效配置，无需重启即可阻断网络连接"))

m.on_after_commit = function(self)
    os.execute("/etc/init.d/blockclient reload >/dev/null 2>&1")
end

s = m:section(TypedSection, "rule", translate("阻断规则"))
s.addremove = true
s.anonymous = true

ip = s:option(Value, "ip", translate("IP地址"))
ip.datatype = "ip4addr"
ip.optional = true

mac = s:option(Value, "mac", translate("MAC地址"))
mac.datatype = "macaddr"
mac.optional = true

return m
