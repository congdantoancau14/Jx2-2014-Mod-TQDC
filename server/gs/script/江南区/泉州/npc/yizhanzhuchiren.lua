Include("\\script\\online\\eating\\eating_head.lua")
Include("\\script\\item\\horse_head.lua")
npc_name = "<color=green>Ch� qu�n tr�<color>: "
nGoInTime = 0; -- l�u th�i gian ti�n v�o d�ch tr�m

function main()

	local nGoInFlag = GetTask(TSK_GOIN)
	if nGoInFlag ~= 1 then
		Say(npc_name.."Kh�ch quan mu�n t�m ch� ngh� ch�n sao? Ch� <color=white>10 l��ng b�c<color> th�i.",3,
		"��ng v�y, h�y s�p x�p cho ta/gotoYiZhan",
		"Ta mu�n tham quan d�ch tr�m/canguan",
		"T�i h� ch� gh� ngang th�i/nothing")
	else
		Say(npc_name.."Kh�ch quan mu�n r�i �i sao?",2,
		-- "Ta ngh� � ��y ���c m�y canh gi� r�i?",
		"��ng v�y, ta c� vi�c c�n ra ngo�i/leaveYiZhan",
		"Kh�ng ph�i. Ta v�n mu�n n�n l�i m�t l�c/nothing")
	end
end;

function leaveYiZhan()
	NewWorld(100,1472,2865)
	SetTask(TSK_GOIN, 0);
	ET_OnGetup()
	RestorePlayerState()
end;

function gotoYiZhan()
	-- local g,d,pHorse = GetPlayerEquipInfo(10)
	-- if pHorse ~= 0 then 
		-- Talk(1,"",npc_name.."Phi�n kh�ch quan xu�ng ng�a tr��c.")
		-- return 0;
	-- end
	if Pay(1000) ~= 1 then
		Talk(1,"",npc_name.."Kh�ng c� ti�n th� �i ch� kh�c ng� �i. Ch� ta kh�ng ch�a kh� r�ch �o �m.")
		return 0;
	end
	NewWorld(803,1600,3200)
	SetTask(TSK_GOIN, 1);
	ET_OnSleep()
	SetPlayerState()
end;

function canguan()
	nGoInTime = GetTime()
	SetTask(TSK_GOIN, 1);
	SetPos(1474,2861)
end;

function SetPlayerState()
	LeaveTeam();	--�뿪����
	-- SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetFightState(0);	--��ƽ״̬
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
	ForbitTrade(1);	--��ֹ����
	StallEnable(0);	--��ֹ��̯
	OpenFriendliness(0);	--�����Ӻøж�
	SetDeathPunish(0);	--�������ͷ�
	InteractiveEnable(0);	--��ֹ����
	UseDummy(0,1);	--��������Ч��
	ForbitLevelUp(1);	--��ֹ����
	ForbitAddProp(1);	--��ֹ����Ǳ�ܵ�
	ForbidChangePK(0);	--����ת��PK״̬��������˴�ʱ���д裬�ǲ���ת��PK״̬�ģ�����������ָ����������ת��PK״̬��
	UseSkillEnable(0);	--��ֹ�书
	if GetRidingState() == 1 then 
		RestoreCarry()
	end
	UnEquipAtPosition(10);
	KillFollower();		--ɾ������NPC
	SetPlayerRestrictions(0,1);	--������Ʒʹ��
	-- SetPlayerRestrictions(1,1);	--������Ʒʹ��
	-- SetPlayerRestrictions(2,1);	--������Ʒʹ��
	ForbidChangePK(1);	--��ֹת��PK״̬
	ForbidRiding(1);
	ForbidRead(1)	--��������
end;

function RestorePlayerState()
	LeaveTeam();	--�뿪����
	SetFightState(0);	--��ƽ״̬
	SetDeathScript("");	--��������ű�
	SetTempRevPos(0,0,0);	--ɾ����ʱ������
	ForbidChangePK(0);	--����ת��PK״̬
	SetPKFlag(0,0);	--��PK״̬
	local nVersion,nCurGs = GetRealmType();
	if nCurGs ~= 1 then
		ForbitTrade(0);	--������
		StallEnable(1);	--�����̯
	end
	OpenFriendliness(1);	--�����Ӻøж�
	SetDeathPunish(1);	--�������ͷ�
	InteractiveEnable(1);	--������
	SetLockCurTitle(1);	--�ɸ����ƺ�
	SetPlayerRestrictions(0,0);
	-- SetPlayerRestrictions(1,0);
	-- SetPlayerRestrictions(2,0);
	-- DesaltPlayer(0,0);
	ForbitLevelUp(0);
	ForbitAddProp(0);
	UseSkillEnable(1);
	UseScrollEnable(1);	--����ʹ�ûس�
	ForbidRiding(0);
	ForbidRead(0)	--������
end;

function nothing()
end;