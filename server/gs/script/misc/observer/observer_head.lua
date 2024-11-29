----------------------------------------------------------------
-- observer 事件模式
-- by windle
--
-- 目的: 封装变化, 把各种经常出现的插入式修改集中起来
-- 使用:
--	1. 定义事件: 在head文件的EVENTID中定义一个数字宏, 以统一事件标识
--	2. 注册事件hook: 在ObserverImpt:init中注册事件
Include("\\script\\lib\\string.lua")

--rege event handler
--reg function in 
--\settings\static_script\misc\observer\observer_ksg_reg.lua
--\script\ks2vng\misc\observer\observer_vng_reg.lua

--usage : add event
--Include("\\script\\misc\\observer\\observer_head.lua")
--Observer:onEvent(SYSEVENT_PLAYER_LOGIN, ExchangeComing)
--Observer:onTeamEvent(SYSEVENT_PLAYER_LOGIN, ExchangeComing)

OBSERVER_DEGUG = 0

-- 事件定义 --------------------------------------------------
-- 基础系统
SYSEVENT_GAMESERVER_START           = 1	--gs启动事件           --data=0                   
SYSEVENT_PLAYER_LOGIN               = 2	--login事件            --data=ExchangeComing         
SYSEVENT_PLAYER_LOGOUT              = 3	--logout事件           --data=0                     
SYSEVENT_DAILY_CLEAR                = 4	--每日清理事件         --data={LastDate,CurDate}     
SYSEVENT_WEEKLY_CLEAR               = 5	--每周清理事件         --data={LastWeek,CurWeek}     
SYSEVENT_MONTHLY_CLEAR              = 6	--每月清理事件         --data={LastMonth,CurMonth}  
SYSEVENT_GTASK                      = 7 --gtask事件						 --data={name, category}

--关卡事件
SYSEVENT_LIANGSHAN_STAGE_FINISH     = 101	--梁山							--data=nStage {1..8}                                                           
SYSEVENT_LIANGSHAN_TASK_AWARD       = 102                     --data=nTaskIdx {1..3}                                                           
SYSEVENT_DIXUANGONG_STAGE_FINISH    = 101	--地玄宫            --data=nStage {1..7}                                                           
SYSEVENT_DIXUANGONG_TASK_AWARD      = 102                     --data=nTaskIndex {1..3}                                                       
SYSEVENT_WANJIANZHONG_STAGE_FINISH  = 301	--万剑冢            --data=nStage {1..4}                                                         
SYSEVENT_WANJIANZHONG_TASK_AWARD    = 302                     --data=nTaskIndex {1..4} {daily_pass,daily_fanpai,weekly_pass,weekly_fanpai}   
SYSEVENT_CANGJIAN_STAGE_FINISH      = 401	--藏剑山庄                                                                                           
SYSEVENT_TAIYI_NOR_STAGE_FINISH     = 501	--太一塔            --data=nStage {1..6}                                                           
SYSEVENT_TAIYI_HARD_STAGE_FINISH    = 502                     --data=nStage {1..6}                                                           
SYSEVENT_TAIXU_STAGE_FINISH         = 601	--太虚幻境          --data=nStage {1..8}                                                             
                                                              --data={nG,nD,nP,nNum}                                                             
SYSEVENT_GLOBAL_COST_IB         	= 10001	--消耗IB

--------------------------------------------------------------

Observer = Observer or {}
Observer.szVM = "\\script\\misc\\observer\\observer.lua"

function Observer:onEvent(id, data)
	local sCall = format("ObserverImpt:onEvent(%d, %s)", tonumber(id), Val2Str(data));
	SendScript2VM(self.szVM, sCall);
end

function Observer:show_regs()
	local sCall = format("ObserverImpt:show_regs()");
	SendScript2VM(self.szVM, sCall);
end

function Observer:onTeamEvent(id, data)
	local nCount = GetTeamSize();
	if nCount < 1 then
		self:onEvent(id, data);
	else
		local oldPlayerIndex = PlayerIndex;
		for i = 1, nCount do
			PlayerIndex = GetTeamMember(i);
			self:onEvent(id, data);
		end
		PlayerIndex = oldPlayerIndex;
	end
end
