--=============================================
--create by baiyun 2009.11.13
--describe:Ô½ÄÏ°æ12ÔÂ·Ý»î¶¯±ùÀäÎ×Ê¦³õÊ¼»¯½Å±¾
--============================================
Include("\\script\\lib\\globalfunctions.lua");
t_wushi_sets = {
	{"T©y Thµnh §«", {308, 1437, 3139}},
	{"B¾c Thµnh §«", {301, 1553, 3083}},
};
function main()
	local nDate = tonumber(date("%y%m%d"));
	local nDay = tonumber(date("%w"));
	if nDate >= 100117 or nDate < 091218 then
		return 0;
	end
	local nRandSet = random(1, 2);
	local nNpcIndex = CreateNpc("Phï thñy b¨ng gi¸", "Phï thñy b¨ng gi¸", gf_UnPack(t_wushi_sets[nRandSet][2]));
	SetNpcLifeTime(nNpcIndex, 115 * 60);
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\3\\death_binglengwushi.lua");
	--AddUnitStates(nNpcIndex, 6, GetTime());--¼ÇÂ¼NPC´´½¨µÄÊ±¼ä
	AddGlobalNews(format("Phï Thñy B¨ng Gi¸ ®· xuÊt hiÖn t¹i  %s. Vâ l©m l¹i s¾p cã mét ®ît b¨ng gi¸. C¸c h¹ h·y mau mau ®i thu phôc ¶ ®Ó tr¸nh mét ®ît b·o tuyÕt cã thÓ sÏ x¶y ra!", t_wushi_sets[nRandSet][1]));
end

