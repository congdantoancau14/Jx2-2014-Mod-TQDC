Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_TongBoxScript = {
	"\\script\\missions\\liangshan\\npc\\box_tong1.lua",
	"\\script\\missions\\liangshan\\npc\\box_tong2.lua",
	"\\script\\missions\\liangshan\\npc\\box_tong3.lua",
	nil,
	"\\script\\missions\\liangshan\\npc\\box_tong5.lua",
	"\\script\\missions\\liangshan\\npc\\box_tong6.lua",
	"\\script\\missions\\liangshan\\npc\\box_tong7.lua",
}

T_TONG_BOX_IDX = {}
function remove_tong_box()
	for i,v in T_TONG_BOX_IDX do
		if GetNpcName(i) == "Rng уng" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_TONG_BOX_IDX = {}
end

function create_box_tong(m,x,y, nBoxId)
	if not T_TongBoxScript[nBoxId] then
		return
	end
	--local m, x, y = GetNpcWorldPos(nNpcIdx);
	--天阴密箱1个
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("tongbaoxiang", "Rng уng", m, x2, y2);
	if npc and npc > 0 then
		T_TONG_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_TongBoxScript[nBoxId]);
	else
		print("create ls tongbaoxiang fail")
	end
end
        
--tClause1 = {
--    {{"小传功丹"    ,{2,1,30312,1,4}},30000},
--    {{"修真要诀残页"    ,{2,1,30315,1,4}},10000},
--    {{"1级铁晶"    ,{2,1,30533,1,4}},45000},
--    {{"2级铁晶"    ,{2,1,30534,1,4}},15000},
--}
--tClause2 = {
--    {{"小传功丹"    ,{2,1,30312,1,4}},10000},
--    {{"修真要诀残页"    ,{2,1,30315,1,4}},10000},
--    {{"1级铁晶"    ,{2,1,30533,1,4}},40000},
--    {{"2级铁晶"    ,{2,1,30534,1,4}},30000},
--    {{"铜制徽章"    ,{0,153,1,1,4}},10000},
--}
--tClause3 = {
--    {{"四灵归元丹"    ,{2,1,30352,1,4}},5000},
--    {{"培元丹"    ,{2,1,30351,1,4}},10000},
--    {{"传功丹"    ,{2,1,30313,1,4}},10000},
--    {{"修真要诀残页"    ,{2,1,30315,1,4}},5000},
--    {{"1级铁晶"    ,{2,1,30533,1,4}},20000},
--    {{"2级铁晶"    ,{2,1,30534,1,4}},10000},
--    {{"3级铁晶"    ,{2,1,30535,1,4}},10000},
--    {{"铜制徽章"    ,{0,153,1,1,4}},15000},
--    {{"铁制徽章"    ,{0,153,2,1,4}},15000},
--} 
--tClause5 = {
--    {{"四灵归元丹"    ,{2,1,30352,1,4}},5000},
--    {{"培元丹"    ,{2,1,30351,1,4}},5000},
--    {{"传功丹"    ,{2,1,30313,1,4}},5000},
--    {{"修真要诀残页"    ,{2,1,30315,1,4}},5000},
--    {{"1级铁晶"    ,{2,1,30533,1,4}},10000},
--    {{"2级铁晶"    ,{2,1,30534,1,4}},10000},
--    {{"3级铁晶"    ,{2,1,30535,1,4}},10000},
--    {{"铜制徽章"    ,{0,153,1,1,4}},15000},
--    {{"铁制徽章"    ,{0,153,2,1,4}},20000},
--    {{"玉制徽章"    ,{0,153,3,1,4}},15000},
--} 
--tClause6 = {
--    {{"武林早报"    ,{2,1,30314,1,4}},5000},
--    {{"师门圣物"    ,{2,1,30311,1,4}},5000},
--    {{"传功丹"    ,{2,1,30313,1,4}},5000},
--    {{"修真要诀残页"    ,{2,1,30315,1,4}},5000},
--    {{"1级铁晶"    ,{2,1,30533,1,4}},10000},
--    {{"2级铁晶"    ,{2,1,30534,1,4}},10000},
--    {{"3级铁晶"    ,{2,1,30535,1,4}},10000},
--    {{"铜制徽章"    ,{0,153,1,1,4}},15000},
--    {{"铁制徽章"    ,{0,153,2,1,4}},20000},
--    {{"玉制徽章"    ,{0,153,3,1,4}},15000},
--} 
--tClause7 = {
--    {{"武林早报"    ,{2,1,30314,1,4}},5000},
--    {{"师门圣物"    ,{2,1,30311,1,4}},5000},
--    {{"传功丹"    ,{2,1,30313,1,4}},5000},
--    {{"修真要诀残页"    ,{2,1,30315,1,4}},5000},
--    {{"1级铁晶"    ,{2,1,30533,1,4}},10000},
--    {{"2级铁晶"    ,{2,1,30534,1,4}},10000},
--    {{"3级铁晶"    ,{2,1,30535,1,4}},10000},
--    {{"铜制徽章"    ,{0,153,1,1,4}},15000},
--    {{"铁制徽章"    ,{0,153,2,1,4}},20000},
--    {{"玉制徽章"    ,{0,153,3,1,4}},15000},
--}

tClause = {
	"LS_tong1",
	"LS_tong2",
	"LS_tong3",
	nil,
	"LS_tong4",
	"LS_tong5",
	"LS_tong6",
}

function on_open(nStage)
	--local tItem = gf_RandRate(tClause[nStage], nil, 2)[1];
	local nAwardId = CustomAwardSelectOne(tClause[nStage])
	local _type,tInfo = CustomAwardGetAwardInfo2(nAwardId)
	if tInfo then
		gf_ThrowDice(tInfo, nil, nil, nil, nil, GetTargetNpc());
    	SetNpcLifeTime(GetTargetNpc(), 0);
    	SetNpcScript(GetTargetNpc(), "");
    	gf_TeamOperateEX(vaf_award_api, "tLiangShanTongBox")
	end
end

