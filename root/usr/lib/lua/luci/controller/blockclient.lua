module("luci.controller.blockclient", package.seeall)

function index()
    -- 注册到服务菜单
    entry({"admin", "services", "blockclient"}, 
        cbi("services/blockclient"),  -- 路径修改为services
        _("Block Clients"), 
        60
    ).dependent = true
    
    -- 保留其他回调逻辑...
end
