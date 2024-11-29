-- name: mouse_litter_gift.lua
-- desc: 新年小红包(越南版)
-- auth: windle
-- date: 2008-1-4

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\春节活动\\newyear_head.lua");

function OnUse(nIdx)
	Say("B筺 c� mu鑞 s� d鬾g kh玭g?",
		2,
		"Mu鑞/#use_gift("..nIdx..")",
		"Ta ch璦 mu鑞 s� d鬾g./end_dialog")
end

-- 5.000 经验	
-- 10.000 经验	
-- 15.000 经验	
-- 1 金	
-- 2点声望	
-- 4点声望	
-- 6点声望	
-- 8点声望	
function use_gift(nIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20480229 then
		Msg2Player("V藅 ph萴  qu� h筺, kh玭g th� s� d鬾g.");
		return
	end
	-- if GetTask(TASKID_OPEN_LITTER_GIFT) >= nDate then
		-- Msg2Player("M鏸 ng祔 m鏸 nh﹏ v藅 ch� c� th� s� d鬾g 1 l莕!");
		-- return
	-- end
	if DelItemByIndex(nIdx, 1) ~= 1 then
		return
	end

	SetTask(TASKID_OPEN_LITTER_GIFT, nDate);

	gf_SetLogCaption("[viet_newyear][mouse_litter_gift]");
	local nGiftType = random(1,8);
	if nGiftType == 1 then
		gf_Modify("Exp", 5000);
	elseif nGiftType == 2 then
		gf_Modify("Exp", 10000);
	elseif nGiftType == 3 then
		gf_Modify("Exp", 15000);
	elseif nGiftType == 4 then
		gf_Modify("Money", 10000);
	elseif nGiftType == 5 then
		gf_Modify("Rep", 2);
	elseif nGiftType == 6 then
		gf_Modify("Rep", 4);
	elseif nGiftType == 7 then
		gf_Modify("Rep", 6);
	elseif nGiftType == 8 then
		gf_Modify("Rep", 8);
	else
		print("[mouse_litter_gift]Kh玭g th� n y nh�.!!!");
	end		
	gf_SetLogCaption("");
end

function end_dialog()
end

