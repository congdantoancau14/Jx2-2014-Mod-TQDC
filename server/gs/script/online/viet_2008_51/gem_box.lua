-- 宝石箱

Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");

tItems = 
{
--		{ 概率, "名字", {G1, G2, G3, 数量} },
		{  6, "Ng� Linh Th筩h", { 2, 1, 30005, 1, 1} },
		{ 47, "Lam Tinh Th筩h", { 2, 1, 30006, 1, 1} },
		{ 47, "Ho祅g B秓 Th筩h", { 2, 1, 30007, 1, 1} },
};

function OnUse(nItemIdx)
	-- local nDate = tonumber(date("%Y%m%d"));
	-- if nDate >= DATE_2008_51_START_GEM and nDate <= DATE_2008_51_ITEM_END then
		-- Say("M� b秓 rng s� ng蓇 nhi猲 nh薾 頲 1 vi猲 Ng� Linh Th筩h, Lam Tinh Th筩h ho芻 Ho祅g B秓 Th筩h, c� ng � m� b秓 rng kh玭g?\nTh阨 h筺 s� d鬾g: <color=red>24h00 31-05-2008<color>",
			-- 2,
			-- format("M�/#OnOpen(%d)", nItemIdx),
			-- "Kh玭g c莕 u/nothing");
	-- end
	OnOpen(nItemIdx);
end

function OnOpen(nItemIdx)
	local nItem = 0;
	-- if GetLevel() < 20 then
		-- Say("ьi n c蕄 20 h穣 gh� l筰..", 0);
		-- return
	-- end
	if CheckWeight() ~= 1 then
		Say(STR_OVERWEIGHT, 0);
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		nItem = GetRandomItem(tItems)
		gf_SetLogCaption("viet_2008_51_gembox");
		gf_AddItemEx( tItems[nItem][3], tItems[nItem][2] );
		gf_SetLogCaption("");
	end
end

function CheckWeight()
	return gf_Judge_Room_Weight(1, 20);
end