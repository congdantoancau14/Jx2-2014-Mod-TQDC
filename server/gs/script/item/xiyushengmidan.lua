Include("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\task\\global_task\\gtask_head.lua")

function OnUse(nItem)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch�a ho�n th�nh nhi�m v� ph�c sinh ��ng h�nh, t�m th�i kh�ng th� m�!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("S� l��ng b�n ��ng h�nh hi�n t�i v��t qu� 5");
		return 0;
	end
	if DelItemByIndex(nItem, 1)==1 then
		AddPet(37)
		Talk(1,"","Ch�c m�ng b�n nh�n ���c 1 th� c�ng Ti�u Ho�n H�ng")
	end
	
--	local nRet = CustomAwardSelectOne("dijidan")
--	if nRet > 0 then
--		if DelItemByIndex(nItem, 1) == 1 then
--			CustomAwardGiveOne(nRet);
--		end
--	end
end