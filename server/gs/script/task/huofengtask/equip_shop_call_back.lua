Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online_activites\\task_values.lua")

t_need = {"H·a Di÷m Thπch",2,0,30076,1}
function _specialop_attrcheck_update_huofeng_lv2(nOldItemIdx)
	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --«ø7“‘…œ≤≈ƒ‹…˝º∂
		return 0
	end
	if tGtTask:check_cur_task(264) ~= 1 and tGtTask:check_task_isfinish(264) ~= 1 then
		return 0
	end
	if tGtTask:check_cur_task(264) == 1 and GetItemCount(t_need[2], t_need[3], t_need[4]) < t_need[5] then
		Talk(1, "", format("Tr™n ng≠Íi kh´ng c„ %d%s,kh´ng th” n©ng c p!", t_need[5], t_need[1]))
		return 0
	end
	return 1
end

function _specialop_attrsave_update_huofeng_lv2(nOldItemIdx)
	local t = {}
	--t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	return t
end
function _specialop_attrrestore_update_huofeng_lv2(nNewItemIdx, tSave)
	local nNum = GetItemCount(t_need[2], t_need[3], t_need[4])
	if nNum > 0 then
		DelItem(t_need[2], t_need[3], t_need[4], GetItemCount(t_need[2], t_need[3], t_need[4]))
	end
	if tGtTask:check_task_isfinish(264) ~= 1 then
		--DirectFinishGTask(264, 2)
		SetTask(VEIT_BATTLE_KILL_BOSS_COUNTER, 1)--ÕÍ≥…»ŒŒÒ
		Talk(1, "", "ChÛc mıng bπn Æ∑ nhÀn Æ≠Óc vÚ kh› H·a PhÙng c p 2, c„ th” hÂi b∏o t◊nh h◊nh vÌi H·a PhÙng Tˆ")
	end
    return 1
end


-------------------------------------------------------------------------------------------------

function _specialop_attrcheck_update_huofeng_lv3(nOldItemIdx)
	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --«ø7“‘…œ≤≈ƒ‹…˝º∂
		return 0
	end
	if tGtTask:check_task_isfinish(270) ~= 1 then
		Talk(1,"","Hoµn thµnh chuÁi nhi÷m vÙ H·a PhÙng mÌi Æ≠Óc n©ng c p!")
		return 0
	end
	return 1
end

function _specialop_attrsave_update_huofeng_lv3(nOldItemIdx)
	local t = {}
	--t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	return t
end
function _specialop_attrrestore_update_huofeng_lv3(nNewItemIdx, tSave)
--	local nEnhance = tSave.nEquipEnhance
--	local nNewEnhance = 0
--	if nEnhance > 0 then
--		if nEnhance >= 1 and nEnhance <=13 then
--			nNewEnhance = 0
--		elseif nEnhance >= 14 and nEnhance <=15 then
--			nNewEnhance = 7
--		end
--		if nNewEnhance > 0 then
--			SetItemEnhance(nNewItemIdx, nNewEnhance);
--		end
--    end
    return 1
end

-------------------------------------------------------------------------------------------------

function _specialop_attrcheck_update_huofeng_equip(nOldItemIdx)
	local nD = GetItemDetail(nOldItemIdx)
	--local nG, nD, nP = GetItemInfoByIndex(nOldItemIdx)
	if nD ~= 102 then--∑« ◊ Œ–Ë“™+7“‘…œ
    	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --«ø7“‘…œ≤≈ƒ‹…˝º∂
    		return 0
    	end
	end
	if GetFreeItemRoom() < 2 then
		return 0
	end
--	if tGtTask:check_task_isfinish(270) ~= 1 then
--		Talk(1,"","ÕÍ≥…ª∑Ôœµ¡–»ŒŒÒ≤≈ƒ‹…˝º∂£°")
--		return 0
--	end
	return 1
end

function _specialop_attrsave_update_huofeng_equip(nOldItemIdx)
	local t = {}
	t.tInfo = GetItemInfoByIndex(nOldItemIdx, 1)
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	t.nBind = 1
	if GetItemSpecialAttr(nOldItemIdx, "BIND") == 1 then
		t.nBind = 4
	end
	--t.nRandSeed				= GetItemRandSeed(nOldItemIdx)
	t.tGem 					= GetItemGemInfo(nOldItemIdx)
	--t.tFeed 				= GetItemFeedUpAttrs(nOldItemIdx)
	return t
end
function _specialop_attrrestore_update_huofeng_equip(nNewItemIdx, tSave)
--	local nEnhance = tSave.nEquipEnhance
--	local nNewEnhance = 0
--	if nEnhance > 0 then
--		if nEnhance >= 1 and nEnhance <=13 then
--			nNewEnhance = 0
--		elseif nEnhance >= 14 and nEnhance <=15 then
--			nNewEnhance = 7
--		end
--		if nNewEnhance > 0 then
--			SetItemEnhance(nNewItemIdx, nNewEnhance);
--		end
--    end
	local szItemName = GetItemName(nNewItemIdx)
	if random(1,10000) <= 1000 then --10%∏≈¬ ≥…π¶
		local szMsg = format("ChÛc mıng %s n©ng c p thµnh c´ng %s", GetName(), szItemName)
		Msg2Global(szMsg)
	else-- ß∞‹
		DelItemByIndex(nNewItemIdx, -1)--…æ≥˝ªªµΩµƒ◊∞±∏
		local tInfo = tSave.tInfo
		local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
			0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
		if 0 < tSave.nEquipDing10 then
    		SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
        	SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
        	for i,v in tSave.tGem do
        		SetItemGemInfo(nIndex, i, v)
        	end
        end
		AddItem(2,1,30770,1)--∏¯“ª∏ˆª∑Ôæ´ª™
		local szMsg = format("N©ng c p %s th t bπi, nhÀn Æ≠Óc 1 tinh hoa h·a phÙng Æ“n bÔ", szItemName)
		Talk(1, "", szMsg)
		Msg2Player(szMsg)
		return 0
	end
    return 1
end