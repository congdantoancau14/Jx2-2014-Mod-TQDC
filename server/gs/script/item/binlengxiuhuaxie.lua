
Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItem)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch�a ho�n th�nh nhi�m v� ph�c sinh ��ng h�nh, t�m th�i kh�ng th� m�!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("S� l��ng b�n ��ng h�nh hi�n t�i v��t qu� 5");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		AddPet(34);
		Msg2Player(format("Ng��i nh�n ���c [%s] b�n ��ng h�nh", "B�ng N�"));
	end
end

-- --ÿ�����Ĺ̶���������
-- --4��ʵս�ĵ�
-- --20��ʦ�Ź��׶�
-- --1����ʯ����
-- --ÿ�����������������
-- --1������ɢ����10%��ÿ��5�����صã�
-- --1������赡���10%��ÿ��10�����صã�
-- --1�����6����ʯ����10%��ÿ��10�����صã�
-- --1��7����ʯ�䷽����10%��ÿ��10�����صã�
-- --50��̫�׻�Ԫ��ͼ����2,0,1082������99��ÿ��20�����ص�
-- --3��ʦ�Ÿ߼��ؼ�����ÿ��40�����ص�
-- --1���׻����ꡪ��ÿ��100�����ص�
-- Include("\\script\\lib\\lingshi_head.lua");
-- Include("\\script\\lib\\globalfunctions.lua");
-- TSK_USE_GLORY_BAG_TIME = 593;

-- function OnUse(nItemIdx)
	-- use(nItemIdx);
-- end;

-- function use(nItemIdx)
	-- if gf_JudgeRoomWeight(11,150,"") == 1 then
		-- if DelItemByIndex(nItemIdx,1) == 1 then
			-- get_item();
		-- end;
	-- end;
-- end;

-- function get_item()
	-- Say("File b� x�a, �ang c� t�m v� kh�i ph�c l�i! Path: script\/item\/binlengxiuhuaxie.lua")
-- end;

-- function nothing()

-- end;