----------------------------------------------------------------
-- observer �¼�ģʽ
-- by windle
--
-- Ŀ��: ��װ�仯, �Ѹ��־������ֵĲ���ʽ�޸ļ�������
-- ʹ��:
--	1. �����¼�: ��head�ļ���EVENTID�ж���һ�����ֺ�, ��ͳһ�¼���ʶ
--	2. ע���¼�hook: ��ObserverImpt:init��ע���¼�
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

-- �¼����� --------------------------------------------------
-- ����ϵͳ
SYSEVENT_GAMESERVER_START           = 1	--gs�����¼�           --data=0                   
SYSEVENT_PLAYER_LOGIN               = 2	--login�¼�            --data=ExchangeComing         
SYSEVENT_PLAYER_LOGOUT              = 3	--logout�¼�           --data=0                     
SYSEVENT_DAILY_CLEAR                = 4	--ÿ�������¼�         --data={LastDate,CurDate}     
SYSEVENT_WEEKLY_CLEAR               = 5	--ÿ�������¼�         --data={LastWeek,CurWeek}     
SYSEVENT_MONTHLY_CLEAR              = 6	--ÿ�������¼�         --data={LastMonth,CurMonth}  
SYSEVENT_GTASK                      = 7 --gtask�¼�						 --data={name, category}

--�ؿ��¼�
SYSEVENT_LIANGSHAN_STAGE_FINISH     = 101	--��ɽ							--data=nStage {1..8}                                                           
SYSEVENT_LIANGSHAN_TASK_AWARD       = 102                     --data=nTaskIdx {1..3}                                                           
SYSEVENT_DIXUANGONG_STAGE_FINISH    = 101	--������            --data=nStage {1..7}                                                           
SYSEVENT_DIXUANGONG_TASK_AWARD      = 102                     --data=nTaskIndex {1..3}                                                       
SYSEVENT_WANJIANZHONG_STAGE_FINISH  = 301	--��ڣ            --data=nStage {1..4}                                                         
SYSEVENT_WANJIANZHONG_TASK_AWARD    = 302                     --data=nTaskIndex {1..4} {daily_pass,daily_fanpai,weekly_pass,weekly_fanpai}   
SYSEVENT_CANGJIAN_STAGE_FINISH      = 401	--�ؽ�ɽׯ                                                                                           
SYSEVENT_TAIYI_NOR_STAGE_FINISH     = 501	--̫һ��            --data=nStage {1..6}                                                           
SYSEVENT_TAIYI_HARD_STAGE_FINISH    = 502                     --data=nStage {1..6}                                                           
SYSEVENT_TAIXU_STAGE_FINISH         = 601	--̫��þ�          --data=nStage {1..8}                                                             
                                                              --data={nG,nD,nP,nNum}                                                             
SYSEVENT_GLOBAL_COST_IB         	= 10001	--����IB

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
