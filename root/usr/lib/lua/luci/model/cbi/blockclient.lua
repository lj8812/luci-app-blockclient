m = Map("blockclient", translate("客户端上网控制"), translate("通过IP或MAC地址禁止客户端上网"))

s = m:section(TypedSection, "rule", translate("禁止规则"))
s.addremove = true
s.anonymous = true

ip = s:option(Value, "ip", translate("IP地址"))
ip.datatype = "ip4addr"
ip.optional = true

mac = s:option(Value, "mac", translate("MAC地址"))
mac.datatype = "macaddr"
mac.optional = true

return m
