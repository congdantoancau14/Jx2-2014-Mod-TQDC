Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\lib\\vnglib_function.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua")
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

function SelectSay()	
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "<color=green>CÈm Nang Sù KiÖn:<color> D­íi ®©y lµ c¸c sù kiÖn ®ang diÔn ra trªn m¸y chñ, th«ng tin chi tiÕt vui lßng xem trªn trang chñ."
    szSayHead = szSayHead.." B¹n ®ang lµ thÇn d©n cña <color=yellow>Qu¸n Hæ<color> quèc"
	
	local nDate = CheckDate();
	tinsert(tbSayDialog, "Sù KiÖn Th¸ng "..nDate..": "..Event_List[nDate]["name"].."/EventMain");
	
	if vc_IsVipCardOpen() ~= 0 then
		tinsert(tbSayDialog, "\n"..vc_GetMainTitle()) 
	end
	tinsert(tbSayDialog,"\nPh¸o Hoa mõng phiªn b¶n míi/VET_201106_Give_Fire")		
	tinsert(tbSayDialog,"\nNhËn th­ëng tÝch lòy online/IpBonus")
	tinsert(tbSayDialog,"\nKÕt thóc ®èi tho¹i/nothing"	)	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
  --NhËn ph¸o hoa mõng phiªn b¶n TMT
function VET_201106_Give_Fire()
	local tbSayDialog = {}
	local nSaySize = 0
	local szSayHead ="NhËn ph¸o hoa mçi ngµy. §¹i hiÖp cã thÓ sö dông chøc n¨ng VIP ®Ó nh©n ®«i ®iÓm khi sö dông ph¸o hoa."
	
	tinsert(tbSayDialog,"NhËn ph¸o hoa mçi ngµy/Confirm_VET_201106_Give_Fire")	
	tinsert(tbSayDialog,"KÝch ho¹t sö dông ph¸o hoa d¹ng VIP (tiªu hao 12 Xu vËt phÈm)/Active_VET_201106_Give_Fire")		
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function Active_VET_201106_Give_Fire()
	VietResetDate()
	if GetTask(TSK_ACTIVE_VIP_PHAOHOA) == 1 then
		Talk(1, "", "H«m nay b¹n ®· kÝch ho¹t sö dông ph¸o hoa d¹ng VIP råi !!!!")
		return
	end
	if GetTask(TSK_ACTIVE_VIP_PHAOHOA) ~= 0 then
		Talk(1, "", "H«m nay b¹n ®· kÝch ho¹t sö dông ph¸o hoa d¹ng Th­êng råi !!!!")
		return
	end

	if GetItemCount(2,1,30230) < 12 then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo ®ñ Xu vËt phÈm ®Ó kick ho¹t VIP?")
		return
	end
	DelItem(2,1,30230,12)
	SetTask(TSK_ACTIVE_VIP_PHAOHOA, 1)
	gf_WriteLogEx("KICK HOAT VIP", "kick ho¹t thµnh c«ng", 1, "VIP ph¸o hoa")
end


function Confirm_VET_201106_Give_Fire()
	local nUsedDate = floor(GetTask(TSK_DAHONGBAO_201101) / 1000)
	local nDate = tonumber(date("%y%m%d"))
	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
        	return
    end	
	if GetLevel() < 50 then
		Talk(1, "", "§¼ng cÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng nµy!")
		return
	end
	
	if nDate > 251230 then
		Talk(1,"","§· hÕt thêi h¹n sù kiÖn!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	local nCount = floor(mod(GetTask(TSK_DAHONGBAO_201101), 1000) / 100)
	local nMaxRecv = 120
	if nCount >= 1 then
		Talk(1,"","H«m nay ®¹i hiÖp ®· hÕt lÇn nhËn ph¸o hoa !!!")
		return
	end
	
	if nCount == 1 then
		if GetCash() < 1600000 then
			Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ vµng !!!")
			return
		end
		Pay(1600000)
		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "Ph¸o Hoa mõng phiªn b¶n míi lÇn 2", "Phao hoa phien ban moi thang 6", "nhËn "..nMaxRecv.." Ph¸o hoa")
	elseif nCount ==2 then
			if GetItemCount(2,1,30230) < 40 then
			Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ Xu vËt phÈm !!!")
			return
		end
		DelItem(2,1,30230,40)
		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "Ph¸o Hoa mõng phiªn b¶n míi lÇn 3", "Phao hoa phien ban moi thang 6", "nhËn "..nMaxRecv.." Ph¸o hoa")
	else
		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "NhËn Ph¸o Hoa mçi ngµy", "Phao hoa CNDSK 2013 bk", "nhËn "..nMaxRecv.." Ph¸o hoa")
		gf_WriteLogEx("Phao hoa CNDSK 2013", "nhËn 120 ph¸o hoa", 1, "NhËn Ph¸o Hoa mçi ngµy")
	end
	
	Msg2Player("B¹n nhËn ®­îc "..nMaxRecv.." ph¸o hoa.")
	SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 100)
end
function nothing()
end
  

 