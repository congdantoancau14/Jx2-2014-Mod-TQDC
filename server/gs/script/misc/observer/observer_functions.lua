Include("\\script\\ks2vng\\misc\\observer\\observer_vng_reg.lua")
Include("\\settings\\static_script\\misc\\observer\\observer_ksg_reg.lua")

function onGameStartup(id, data)
end

function onGameStartup2(id, data)
end

function ObserverImpt:Init()
	self:ksg_reg()
	self:vng_reg()
	--self:show_regs()
end

ObserverImpt:Init()
