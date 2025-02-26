module("luci.controller.blockclient", package.seeall)

function index()
    entry({"admin", "network", "blockclient"}, cbi("blockclient"), _("Block Clients"), 30)
end
