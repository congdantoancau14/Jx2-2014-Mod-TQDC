--by liubo
--ƒæœ‰Ω≈±æ
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\vng\\config\\vng_feature.lua")

function OnUse(nItem)
--	Talk(1, "", "T›nh n®ng tπm Æ„ng Æ” b∂o tr◊. Bπn vui lﬂng quay lπi sau !!")
--	do return end

	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	
	if tbGioiHanThanTaiBaoRuong[nNation] ~= nil then
		if nDate < tbGioiHanThanTaiBaoRuong[nNation] then
			Talk(1,"","ThÍi Æi”m hi÷n tπi ch≠a cho ph–p ÆÊi r≠¨ng, c∏c hπ h∑y sˆ dÙng sau nh–.")
			do	return	end
		end
	end
	
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[3])
		return 0
	end
	if gf_Judge_Room_Weight(1,200," ") ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[4])
        return 0
    end	
	local nNum = GetItemCount(2,1,30340)
	if nNum < 25 then
		Talk(1,"",tSTRING_TREASUER_BOX[1])
		return 0
	end
	local nNum1 = GetItemCount(2,1,30230)
	if nNum1 < 20 then
		Talk(1,"","SË l≠Óng Xu vÀt ph»m trong hµnh trang thi’u hi÷p kh´ng ÆÒ <color=green>20<color>")
		return 0
	end
	Say(tSTRING_TREASUER_BOX[6],3,
		"X∏c Æﬁnh n©ng c p thµnh 1 Tµng R≠¨ng (tËn 25 MÈc R≠¨ng + 20 Xu vÀt ph»m)/to_upgrade",
		"X∏c Æﬁnh n©ng c p thµnh 4 Tµng R≠¨ng (tËn 100 MÈc R≠¨ng + 80 Xu vÀt ph»m)/to_upgrade2",
		"Tπm thÍi ch≠a ÆÊi/do_nothing")
end

function to_upgrade2()
--	if Pay(500000) ==  0 then
--		Talk(1,"",tSTRING_TREASUER_BOX[2])
--		return 0
--	end
	if DelItem(2,1,30340,100) == 0 or DelItem(2,1,30230,80) == 0 then
		return 0
	end
	gf_AddItemEx2({2,1,30341,4},"Tµng R≠¨ng (N©ng c p MÈc R≠¨ng)","Than Tai Bao Ruong","N©ng c p MÈc R≠¨ng",0,1)
	
--=========== Nhiem vu lam giau ============
	if CFG_NhiemVuLamGiau == 1 then
		if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 11) == 0 then
			gf_SetTaskBit(TSK_LAMGIAU, 11, 1, 0)
			TaskTip("Hoµn thµnh nhi÷m vÙ lµm giµu: Gh–p 1 tµng r≠¨ng.")
		end
	end
end

function to_upgrade()
--	if Pay(500000) ==  0 then
--		Talk(1,"",tSTRING_TREASUER_BOX[2])
--		return 0
--	end
	if DelItem(2,1,30340,25) == 0 or DelItem(2,1,30230,20) == 0 then
		return 0
	end
	gf_AddItemEx2({2,1,30341,1},"Tµng R≠¨ng (N©ng c p MÈc R≠¨ng)","Than Tai Bao Ruong","N©ng c p MÈc R≠¨ng",0,1)
	
--=========== Nhiem vu lam giau ============
	if CFG_NhiemVuLamGiau == 1 then
		if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 11) == 0 then
			gf_SetTaskBit(TSK_LAMGIAU, 11, 1, 0)
			TaskTip("Hoµn thµnh nhi÷m vÙ lµm giµu: Gh–p 1 tµng r≠¨ng.")
		end
	end
end

function do_nothing()
end