Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\lib\\vnglib_function.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua")
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

function SelectSay()	
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "<color=green>C�m Nang S� Ki�n:<color> D��i ��y l� c�c s� ki�n �ang di�n ra tr�n m�y ch�, th�ng tin chi ti�t vui l�ng xem tr�n trang ch�."
    szSayHead = szSayHead.." B�n �ang l� th�n d�n c�a <color=yellow>Qu�n H�<color> qu�c"
	
	local nDate = CheckDate();
	tinsert(tbSayDialog, "S� Ki�n Th�ng "..nDate..": "..Event_List[nDate]["name"].."/EventMain");
	
	if vc_IsVipCardOpen() ~= 0 then
		tinsert(tbSayDialog, "\n"..vc_GetMainTitle()) 
	end
	tinsert(tbSayDialog,"\nPh�o Hoa m�ng phi�n b�n m�i/VET_201106_Give_Fire")		
	tinsert(tbSayDialog,"\nNh�n th��ng t�ch l�y online/IpBonus")
	tinsert(tbSayDialog,"\nK�t th�c ��i tho�i/nothing"	)	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
  --Nh�n ph�o hoa m�ng phi�n b�n TMT
function VET_201106_Give_Fire()
	local tbSayDialog = {}
	local nSaySize = 0
	local szSayHead ="Nh�n ph�o hoa m�i ng�y. ��i hi�p c� th� s� d�ng ch�c n�ng VIP �� nh�n ��i �i�m khi s� d�ng ph�o hoa."
	
	tinsert(tbSayDialog,"Nh�n ph�o hoa m�i ng�y/Confirm_VET_201106_Give_Fire")	
	tinsert(tbSayDialog,"K�ch ho�t s� d�ng ph�o hoa d�ng VIP (ti�u hao 12 Xu v�t ph�m)/Active_VET_201106_Give_Fire")		
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function Active_VET_201106_Give_Fire()
	VietResetDate()
	if GetTask(TSK_ACTIVE_VIP_PHAOHOA) == 1 then
		Talk(1, "", "H�m nay b�n �� k�ch ho�t s� d�ng ph�o hoa d�ng VIP r�i !!!!")
		return
	end
	if GetTask(TSK_ACTIVE_VIP_PHAOHOA) ~= 0 then
		Talk(1, "", "H�m nay b�n �� k�ch ho�t s� d�ng ph�o hoa d�ng Th��ng r�i !!!!")
		return
	end

	if GetItemCount(2,1,30230) < 12 then
		Talk(1, "", "��i hi�p kh�ng mang theo �� Xu v�t ph�m �� kick ho�t VIP?")
		return
	end
	DelItem(2,1,30230,12)
	SetTask(TSK_ACTIVE_VIP_PHAOHOA, 1)
	gf_WriteLogEx("KICK HOAT VIP", "kick ho�t th�nh c�ng", 1, "VIP ph�o hoa")
end


function Confirm_VET_201106_Give_Fire()
	local nUsedDate = floor(GetTask(TSK_DAHONGBAO_201101) / 1000)
	local nDate = tonumber(date("%y%m%d"))
	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
        	return
    end	
	if GetLevel() < 50 then
		Talk(1, "", "��ng c�p 50 tr� l�n m�i c� th� tham gia ho�t ��ng n�y!")
		return
	end
	
	if nDate > 251230 then
		Talk(1,"","�� h�t th�i h�n s� ki�n!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	local nCount = floor(mod(GetTask(TSK_DAHONGBAO_201101), 1000) / 100)
	local nMaxRecv = 120
	if nCount >= 1 then
		Talk(1,"","H�m nay ��i hi�p �� h�t l�n nh�n ph�o hoa !!!")
		return
	end
	
	if nCount == 1 then
		if GetCash() < 1600000 then
			Talk(1,"","��i hi�p kh�ng mang theo �� v�ng !!!")
			return
		end
		Pay(1600000)
		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "Ph�o Hoa m�ng phi�n b�n m�i l�n 2", "Phao hoa phien ban moi thang 6", "nh�n "..nMaxRecv.." Ph�o hoa")
	elseif nCount ==2 then
			if GetItemCount(2,1,30230) < 40 then
			Talk(1,"","��i hi�p kh�ng mang theo �� Xu v�t ph�m !!!")
			return
		end
		DelItem(2,1,30230,40)
		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "Ph�o Hoa m�ng phi�n b�n m�i l�n 3", "Phao hoa phien ban moi thang 6", "nh�n "..nMaxRecv.." Ph�o hoa")
	else
		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "Nh�n Ph�o Hoa m�i ng�y", "Phao hoa CNDSK 2013 bk", "nh�n "..nMaxRecv.." Ph�o hoa")
		gf_WriteLogEx("Phao hoa CNDSK 2013", "nh�n 120 ph�o hoa", 1, "Nh�n Ph�o Hoa m�i ng�y")
	end
	
	Msg2Player("B�n nh�n ���c "..nMaxRecv.." ph�o hoa.")
	SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 100)
end
function nothing()
end
  

 