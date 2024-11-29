Include("\\script\\system_switch_config.lua")

function ObserverImpt:ksg_reg()
	--self:register(OE_GameSvr_Startup, "vng_onstart1", example_event_handler_gs_start);
	--self:register(OE_GameSvr_Startup,	"vng_onstart2","\\script\\ks2vng\\misc\\observer\\observer_vng_reg.lua", "example_event_handler_gs_start2");

	self:register(SYSEVENT_PLAYER_LOGIN, "add_tifyzhiyin", add_tifyzhiyin)
	self:register(SYSEVENT_GLOBAL_COST_IB, "_on_cost_ib_item", _on_cost_ib_item)
	self:register(SYSEVENT_GAMESERVER_START, "huofentask_svr_start", "\\script\\task\\huofengtask\\server_start.lua", "on_server_start")
	self:register(SYSEVENT_PLAYER_LOGIN, "res_protect_login", "\\script\\gongcheng\\npc\\conf_res_protect.lua", "on_player_login")
	self:register(SYSEVENT_DAILY_CLEAR, "itemfushengdan_daily_clear", "\\settings\\static_script\\item\\item_fushengdan_impl.lua", "on_daily_clear")
	self:register(SYSEVENT_GAMESERVER_START, "catch_fish_svr_start", "\\script\\online\\201504_catch_fish\\server_start.lua", "on_server_start")
	--self:register(SYSEVENT_DAILY_CLEAR, "catch_fish_daily_clear", "\\script\\online\\201504_catch_fish\\server_start.lua", "on_daily_clear")
	self:register(SYSEVENT_PLAYER_LOGIN, "catch_fish_login", "\\script\\online\\201504_catch_fish\\server_start.lua", "on_player_login")
	self:register(SYSEVENT_DAILY_CLEAR, "1505activity_daily_clear", "\\script\\online_activites\\201505feedpet\\main.lua", "on_daily_clear")
	self:register(SYSEVENT_GTASK, "gtask_event", "\\script\\task\\global_task\\gtask_event.lua", "GtaskOnEvent")
	self:register(SYSEVENT_GAMESERVER_START, "pop_svr_start", "\\script\\missions\\yp\\vn\\server_start.lua", "on_server_start")
	self:register(SYSEVENT_PLAYER_LOGIN, "pop_login", "\\script\\missions\\yp\\vn\\player_login.lua", "on_player_login")
	self:register(SYSEVENT_WEEKLY_CLEAR, "equipshop_clear", "\\script\\equip_shop\\equip_shop.lua", "on_weekly_clear")
	--self:register(SYSEVENT_WEEKLY_CLEAR, "equipshop_clear", "\\script\\equip_shop\\equip_shop.lua", "on_daily_clear")

end

function add_tifyzhiyin(id, data)
	if IsExpSvrSystemOpen() == 1 then
		--体服指引（正式版本要删除）---------------------------
    	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then
    		AddItem(2,1,30644,1)
    	end
	end
end

--消耗IB Item
function _on_cost_ib_item(id, data)
	local nG, nD, nP, nNum = data[1],data[2],data[3],data[4]
	nNum = nNum or 1
	if nG==2 and nD == 97 and nP == 236 then --天骄令
		--CDKey消耗的天骄令计数
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("_ck_SetCostIB(%d)", nNum))
	end
end


