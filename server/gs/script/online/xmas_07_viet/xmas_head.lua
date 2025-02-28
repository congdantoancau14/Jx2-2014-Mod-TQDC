--
-- 剑侠情缘网络版2
-- xmas_head.lua
-- 2007越南圣诞活动 npc脚本
-- 2007-12-12
-- by wuwei1
--

----
Include("\\script\\lib\\globalfunctions.lua");

TASKID_XMAS_PLANT_DATE	= nil;	-- 最近种树日期
TASKID_XMAS_PLANT_COUNT	= nil;	-- 本日种树数量
TASKID_XMAS_TREEINDEX	= nil;	-- 树npc index
TASKID_XMAS_PLANTTIME	= nil;	-- 当前种树时间
TASKID_XMAS_TREE_GROW	= 1558;	-- 当前树等级
TASKID_XMAS_TREE_SCOR	= 1559;	-- 等前树分数E
TASKID_XMAS_TREE_TYPE	= 1560;	-- 树种类
TASKID_XMAS_JH_GIFT		= 1561;	-- 种子领取日期
TASKID_XMAS_LAST_WATER_TIME = 1562; --上一次浇水时间

XMAS_TREE_TYPE			= nil;
XMAS_TREE_NAME			= nil;	-- 树名字
XMAS_PLANT_TREE_LIMIT	= nil;	-- 每日种树限制
XMAS_GATHER_TIME		= nil;	-- 收获时间
XMAS_GATHER_SCORE_LIMIT	= nil;	-- 最小奖励分数

XMAS_WATER_TIME 		= nil;	-- 浇水时间

XMAS_TREELIFETIME = 60*25;	-- 25分种


XMAS_TYPE_JH = 1;
XMAS_TYPE_ML = 2;
txmas_tree_mode = nil;

xmas_items = 
{
	["Nh竛h th玭g gi竜 h閕"] =			{2,	0,	573},
	["V藅 tr.tr� th玭g GH"] =		{2,	0,	577},
	["V藅 trang tr� 1"] =		{2,	0,	578},
	["V藅 trang tr� 2"] =		{2,	0,	579},
	["V藅 trang tr� 3"] =		{2,	0,	580},
	["V藅 trang tr� 4"] =		{2,	0,	581},
	["Nh竛h th玭g m� l�"] =		{2,	0,	574},
	["Nh竛h th玭g p"] =		{2,	0,	575},
	["Nh竛h th玭g BH"] =			{2,	0,	576},
	["V藅 tr.tr� th玭g BH 1"] =	{2,	0,	582},
	["V藅 tr.tr� th玭g BH 2"] =	{2,	0,	583},
	["V藅 tr.tr� th玭g BH 3"] =	{2,	0,	584},
}

tTreeItem = {
	--ID,			NAME,		, SCORE
	{2,	0,	577, "V藅 tr.tr� th玭g GH", 8},
	{2,	0,	578, "V藅 trang tr� 1", 1},
	{2,	0,	579, "V藅 trang tr� 2", 2},
	{2,	0,	580, "V藅 trang tr� 3", 3},
	{2,	0,	581, "V藅 trang tr� 4", 4}
};

xmas_npc_mode = {
	{
		"C﹜ Gi竛g sinh 1c",
		"C﹜ Gi竛g sinh 1b",
		"C﹜ Gi竛g sinh 1a",
	},
	{
		"C﹜ Gi竛g sinh 4c",
		"C﹜ Gi竛g sinh 4b",
		"C﹜ Gi竛g sinh 4a",
	}
};

Xmas_tree_SFX_table = {
	{946,937,940,943},
	{947,938,941,944},
	{948,939,942,945},
	{948,939,942,945},
};

function setup_global_value(ntype)
	TASKID_XMAS_JH_GIFT		= 1562
	
	if ntype == XMAS_TYPE_JH then
		TASKID_XMAS_PLANT_DATE	= 1550
		TASKID_XMAS_PLANT_COUNT	= 1551
		TASKID_XMAS_TREEINDEX	= 1552
		TASKID_XMAS_PLANTTIME	= 1557	--
		
		XMAS_TREE_NAME			= "C﹜ th玭g gi竜 h閕"
		XMAS_PLANT_TREE_LIMIT	= 1;
		XMAS_GATHER_TIME		= 17;
		XMAS_GATHER_SCORE_LIMIT	= 20;
		
		XMAS_WATER_TIME = {{5,10,15}, 2}
		txmas_tree_mode = xmas_npc_mode[1];
	elseif ntype == XMAS_TYPE_ML then
		TASKID_XMAS_PLANT_DATE	= 1554
		TASKID_XMAS_PLANT_COUNT	= 1555
		TASKID_XMAS_TREEINDEX	= 1556
		TASKID_XMAS_PLANTTIME	= 1557
		
		XMAS_TREE_NAME			= "C﹜ th玭g m� l�"
		XMAS_PLANT_TREE_LIMIT	= 4;
		XMAS_GATHER_TIME		= 16;
		XMAS_GATHER_SCORE_LIMIT	= 3;
		
		XMAS_WATER_TIME = {{5,7,9,11,13,15}, 1}
		txmas_tree_mode = xmas_npc_mode[2];
	--else	
	--	print("[xmas]: type error!\n");
	end
end

function xmas_v07_is_open()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20071222 and nDate <= 20480106 then
		return 1;
	else
		return 0;
	end
end

function Get_Time_String(nSecond)
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	nDay = floor(nSecond/(60*60*24));
	if nDay > 0 then
		sTime = sTime..nDay.."Thi猲";
	end;
	nHour = floor(mod(nSecond/(60*60),24));
	if nHour > 0 then
		sTime = sTime..nHour.."h ";
	end;
	nMin = floor(mod(nSecond/60,60));
	if nMin > 0 then
		sTime = sTime..nMin.." ph髏 ";
	end;
	nSec = mod(nSecond,60);
	if nSec >= 0 then
		sTime = sTime..nSec.." Gi﹜ ";
	end;
	return sTime;
end;

function nothing()

end;

function clear_xmas_state()
	local nTreeIdx = GetTask(TASKID_XMAS_TREEINDEX);
	SetNpcLifeTime(nTreeIdx,0);
	SetNpcScript(nTreeIdx,"");
	SetTask(TASKID_XMAS_TREEINDEX,	0);
	SetTask(TASKID_XMAS_PLANTTIME,	0);
end

function is_jh_xmas_tree()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx == 0 or nNpcIdx == nil then 
		WriteLog("[xmas_head]:"..GetName().."GetTargetNpc tr� tr� v� sai");
		return -1;
	end
	if nNpcIdx ~= GetTask(TASKID_XMAS_TREEINDEX) then
		WriteLog("[xmas_head]:"..GetName().."GetTargetNpc != TASKID_XMAS_TREEINDEX");
		return -1;
	end
	local sName = GetName();
	local nNameLen = strlen(sName);
	local npcName = GetTargetNpcName();
	if sName ~= strsub(npcName,1,nNameLen) then
		WriteLog("[xmas_head]:"..GetName().."T猲 c﹜ kh玭g kh韕");
		return -1;
	end
	if GetTime() - GetTask(TASKID_XMAS_PLANTTIME) > XMAS_TREELIFETIME 
		or GetTask(TASKID_XMAS_PLANTTIME) == 0 
	then
		WriteLog("[xmas_head]:"..GetName().."Th阨 gian tr錸g kh玭g ng");
		return -1;
	end
	if GetTask(TASKID_XMAS_TREE_TYPE) == 1 then
		return 1;
	else
		return 0;
	end
end

function give_work_award()
	local taward = {
		{ {2,	0,	574, 1, 1}, "Nh竛h th玭g m� l�",},
		{ {2,	0,	578, 1, 1}, "V藅 trang tr� 1",},
		{ {2,	0,	579, 1, 1}, "V藅 trang tr� 2",},
		{ {2,	0,	580, 1, 1}, "V藅 trang tr� 3",},
		{ {2,	0,	581, 1, 1}, "V藅 trang tr� 4",},
	};
	local r = random(1,100);
	local awardtype = 0;
	if r <= 15 then
		awardtype = 1;
	elseif r <= 45 then
		awardtype = 2;
	elseif r <= 70 then
		awardtype = 3;
	elseif r <= 90 then
		awardtype = 4;
	else
		awardtype = 5;
	end
	
	gf_SetLogCaption("xmas");
	gf_AddItemEx( taward[awardtype][1], taward[awardtype][2]);
	gf_SetLogCaption("");
end
