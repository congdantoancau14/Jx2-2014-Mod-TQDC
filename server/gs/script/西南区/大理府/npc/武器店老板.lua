
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 武器店老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

function main()
	-- local tSay = {
		-- "Mua v� kh�/_buy_sale_equip",
		-- "Trang b� t竎h/_equip_recycle",
		-- "T筰 h� ch� xem qua th玦/nothing",
	-- }
	-- Say("<color=green>Ch� Ti謒 V� Kh�:<color> V� kh� � ch� c馻 ta v蒼 l� m苩 h祅g ph� bi課, kh玭g bi誸 m鉵 v� kh� c� thu閏 qu� s� nh� th� n祇!", getn(tSay), tSay);
	Sale(33);
end;

function _buy_sale_equip()
	Sale(33);
end

function _equip_recycle()
	SendScript2Client("Open[[EquipRecycle]]");
end

function nothing()
	--do nothing
end