-- name: mouse_big_gift.lua
-- desc: 鼠年大红包(越南版)
-- auth: windle
-- date: 2008-1-4

Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nIdx)
	Say("B筺 c� mu鑞 s� d鬾g kh玭g?",
		2,
		"Mu鑞/#use_gift("..nIdx..")",
		"Ta ch璦 mu鑞 s� d鬾g./end_dialog")
end

-- 5%概率获得年兽坐骑
-- 100%概率获得 新年装礼盒 （活动四）
function use_gift(nIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20480229 then
		Msg2Player("V藅 ph萴  qu� h筺, kh玭g th� s� d鬾g.");
		return
	end
	if gf_JudgeRoomWeight(3, 20) ~= 1 then
		Msg2Player(STR_OVERWEIGHT);
		return
	end
	if DelItemByIndex(nIdx, 1) ~= 1 then
		return
	end
	local nRet, nItem = 0, 0;
	gf_SetLogCaption("[viet_newyear][mouse_big_gift]");
	local nr = random(1, 100)
	if nr < 4 then
		nRet, nItem = gf_AddItemEx( {0, 105, 33, 1, 1, -1, -1, -1, -1, -1, -1}, "Ni猲 th�" );
		if nRet ~= 0 and nItem ~= 0 then
			SetItemExpireTime(nItem, 3600 * 24);
		end
	elseif nr > 20 + 3 then
		return
	end
	
	nRet, nItem = gf_AddItemEx( {2,1,30000,1,1}, "H閜 qu� 竜 n╩ m韎" );
	if nRet ~= 0 and nItem ~= nil then
		nRet = gf_setItemExpireDate(nItem, 2008, 2, 17, 24);
		if nRet ~= 1 then
			WriteLog("Th阨 h筺 s� d鬾g h閜 qu� 竜 n╩ m韎 th蕋 b筰: date = 2008, 2, 17, 24");
		end
	end
	gf_SetLogCaption("");
end

function end_dialog()
end

