--四灵神兽接口脚本

Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201112_SILINDOGZ_FRUITS = {
	{2,1,30164},
	{2,1,30165},
	{2,1,30166},
	{2,1,30167},
	{2,1,30168},
	{2,1,30169},
	{2,1,30170},
	{2,1,30171},
	{2,1,30172},
	{2,1,30173},
	{2,1,30174},
	{2,1,30175},
	{2,1,30176},
	{2,1,30177},
	{2,1,30178},
	{2,1,30179},
	{2,1,30180},
	{2,1,30181},
	{2,1,30182},
	{2,1,30183},
}

VET_201112_SILINDOGZ_AWARD = {
	{1, 18, "B祅 Long b輈h", {2, 1, 1000, 2}, 7 * 24 * 3600},
    	{1, 3, "Ho祅g Kim Чi H錸g Bao (tr鑞g)", {2, 1, 538, 1}, 7 * 24 * 3600},
    	{1, 9, "V� s�", {2, 0, 225, 2}, 0},
    	{1, 39, "Qu� Hoa T鰑", {2, 0, 189, 68}, 0},
    	{1, 10, "H錸g bao", {2, 1, 508, 1}, 0},
    	{1, 21, " я", {2, 1, 30178, 6}, 0},
}

VET_201112_SILINDOGZ_ID = 54
VET_201112_SILINDOGZ_COST = 68  
VET_201112_SILINDOGZ_DAYTIME = 1
VET_201112_SILINDOGZ_TOTALTIME = 20

VET_201112_SILINDOGZ_TASK = TaskManager:Create(9,13);
VET_201112_SILINDOGZ_TASK.DayTime = 1;
VET_201112_SILINDOGZ_TASK.ToTalTime = 2;
VET_201112_SILINDOGZ_TASK.DaySeq = 3;

----------------------------------------
--interface for vn
VET_201112_SILINDOGZ_TABLE = "Nh� Th莕 Th� gh衟 gi髉 ta M﹎ Ng� Qu�/blag_blessing";
VET_201112_SILINDOGZ_EXIT = "Kh玭g c莕 u/do_nothing";
--example:
--Include("this File")
--function main()
--local tbSay = {};
--	local nSaySize = 0;
--	local szSayHead = "M﹎ Ng� Qu� cho n╩ m韎 2012"
--	local nDate = tonumber(date("%Y%m%d"))
-- 	if nDate >= 20120113 and nDate <= 20120201 then
--		tinsert(tbSay,"уng �/blag_blessing");
--		tinsert(tbSay,VET_201112_SILINDOGZ_EXIT);  --[Optional]
--	end
--	nSaySize = getn(tbSay);
--	Say(szSayHead, nSaySize, tbSay);
--end
----------------------------------------

function blag_blessing()
	if gf_CheckEventDateEx(VET_201112_SILINDOGZ_ID) ~= 1 then
		Talk(1,"","Ho箃 ng  h誸 h筺!");
		return 0;
	end
	Say(format("Thi誹 hi謕 c莕 giao n閜 <color=green>5<color> lo筰 tr竔 c﹜ (M鏸 lo筰 <color=green>10<color> qu�) + %d v祅g",VET_201112_SILINDOGZ_COST),2,"X竎 nh薾/ensure","в ta suy ngh� l筰/do_nothing")
end

function do_nothing()
end

function ensure()
	local nLevel = GetLevel()
    if nLevel < 79  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh﹏ v藅 c蕄 79 tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 1 k� n╪g c蕄 55 m韎 c� th� tham gia");
		return 0
	end
	--隔天更新次数
	if VET_201112_SILINDOGZ_TASK:GetTask(VET_201112_SILINDOGZ_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201112_SILINDOGZ_TASK:SetTask(VET_201112_SILINDOGZ_TASK.DaySeq,zgc_pub_day_turn());
		VET_201112_SILINDOGZ_TASK:SetTask(VET_201112_SILINDOGZ_TASK.DayTime,0);
	end
	if VET_201112_SILINDOGZ_TASK:GetTask(VET_201112_SILINDOGZ_TASK.DayTime) >= VET_201112_SILINDOGZ_DAYTIME then 
		Talk(1,"",format("M﹎ ng� qu� ch骳 ph骳 t誸 xu﹏ m鏸 ng祔 ch� c� th� nh薾 頲 <color=green>%d<color> l莕",VET_201112_SILINDOGZ_DAYTIME));
		return 0;
	end
	if VET_201112_SILINDOGZ_TASK:GetTask(VET_201112_SILINDOGZ_TASK.ToTalTime) >= VET_201112_SILINDOGZ_TOTALTIME then 
		Talk(1,"",format("M﹎ ng� qu� ch骳 ph骳 m鏸 nh﹏ v藅 gi韎 h筺 gh衟 <color=green>%d<color> l莕",VET_201112_SILINDOGZ_TOTALTIME));
		return 0;
	end
	if GetCash() < VET_201112_SILINDOGZ_COST*10000 then
		Talk(1,"",format("Ng﹏ lng trong h祅h trang kh玭g  <color=green>%d<color> v祅g",VET_201112_SILINDOGZ_COST));
		return 0;
	end
	local nTag = 0;
	local nCount = 0;
	local tPosInfo;
	for _,tPosInfo in VET_201112_SILINDOGZ_FRUITS do 
		if GetItemCount(tPosInfo[1],tPosInfo[2],tPosInfo[3]) >= 10 then
			nCount = nCount + 1;
		end
	end
	if nCount < 5 then
		Talk(1,"","C莕 5 lo筰 tr竔 c﹜ b蕋 k�, m鏸 lo筰 <color=green>10<color> qu�.");
		return 0;
	end
	Pay(VET_201112_SILINDOGZ_COST*10000);
	nCount = 0;
	for _,tPosInfo in VET_201112_SILINDOGZ_FRUITS do 
		if GetItemCount(tPosInfo[1],tPosInfo[2],tPosInfo[3]) >= 10 and nCount < 5 then
			DelItem(tPosInfo[1],tPosInfo[2],tPosInfo[3],10);
			nCount = nCount + 1;
		end
	end
	VET_201112_SILINDOGZ_TASK:SetTask(VET_201112_SILINDOGZ_TASK.DayTime,1);
	VET_201112_SILINDOGZ_TASK:SetTask(VET_201112_SILINDOGZ_TASK.ToTalTime,VET_201112_SILINDOGZ_TASK:GetTask(VET_201112_SILINDOGZ_TASK.ToTalTime)+1);
	gf_Modify("Exp",20000000);
	gf_EventGiveRandAward(VET_201112_SILINDOGZ_AWARD,100,1,"Mam Ngu Qua","Ph莕 thng M﹎ ng� qu�");	
end