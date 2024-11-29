
Include("\\script\\online\\eating\\eating_head.lua")
Include("\\script\\item\\horse_head.lua")

FIGHT_STATE = 3069 -- MODDED. MAYBE IT IS CONFLICT WITH OTHERS

function main()
	local nGoInFlag = GetTask(TSK_GOIN)
	Say("",3,"D�ng ch�n ngh� ng�i/rest","Ta �� ngh� ng�i ���c bao l�u r�i nh�?/askSleepInfo","R�i �i/leave")
end;


function askSleepInfo()
	Talk(1,"",format("H�nh nh� ta �� ngh� ���c %s ph�t",getSleepVolume(1)));
end;

function leave()
	local nIndex = GetTargetNpc()
	local m,x,y = GetNpcWorldPos(nIndex);
	NewWorld(m,x,y+2);
	SetTask(TSK_GOIN, 0);
	ET_OnGetup()
	RestorePlayerState()
end;

function rest()
	local nIndex = GetTargetNpc()
	local m,x,y = GetNpcWorldPos(nIndex);
	NewWorld(m,x,y-2);
	SetTask(TSK_GOIN, 1);
	ET_OnSleep()
	SetPlayerState()
end;

function SetPlayerState()
	LeaveTeam();	--�뿪����
	-- SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetTask(FIGHT_STATE,GetFightState());
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
	--SetFightState(0);	--��ƽ״̬
	SetFightState(GetTask(FIGHT_STATE));
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