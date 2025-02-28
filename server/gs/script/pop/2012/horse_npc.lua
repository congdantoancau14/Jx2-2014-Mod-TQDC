Include("\\script\\online\\template\\flash_npc.lua");
Include("\\script\\class\\mem.lua")
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\misc\\autocleaner\\autocleaner_head.lua")

tHorse = { --走远的战马
	nstartDate = 20120301, --活动开始时间
	nEndDate = 20301230, --活动结束时间
	nCheckRoute = 0,  --是否要加入流派
	strNpcMod = "Chi課 M� Ch箉 Xa",  --Npc模板
	strNpcName = "Chi課 M� Ch箉 Xa", --npc名字
	nCampType = 1,   --对话npc还是战斗npc
	nNeedRoom = 0,   --如果是对话npc，需要判断背包空间（根据奖励而定）
	nNeedWeight = 0, --如果是对话npc，需要判断背包负重（根据奖励而定）
	strThisFile = "\\script\\pop\\2012\\horse_npc.lua",  
	tNpcPos = {
		[5079]={
{4008,11174},	
{4100,11298},	
{4095,11297},	
{4082,11282},	
{4080,11314},	
{4067,11312},	
{4005,11238},	
{3982,11318},	
{3995,11299},	
{3989,11282},	
{4025,11281},	
{3954,11294},	
{3970,11318},	
{3975,11267},	
{3984,11256},	
{3980,11210},	
{3985,11116},	
{4027,11155},	
{4054,11129},	
{4069,11127},	
{4056,11155},	
{4049,11175},	
{4044,11183},	
{4056,11172},	
{3988,11046},	
{4003,11061},	
{4013,11071},	
{4015,11032},	
{4021,11030},	
{4031,11020},	
{4032,11003},	
{4045,11006},	
{3971,10981},	
{3979,10968},	
{3991,10979},	
{4007,10987},	
{4022,10964},	
{4013,10953},	
{4009,10945},	
{4063,10921},	
{4073,10927},	
{4056,10939},	
{4048,10927},	
{4028,11017},	
{4034,11026},	
{4106,11030},	
{4119,11025},	
{4138,11013},	
{4144,11019},	
{4159,11031},			
			},
	},
	-- 需要实现以下接口函数
	onTalk = nil,						--对话npc入口
	giveDeathAward = nil,	  --杀死npc奖励入口
	giveTalkAward = nil,		--对话npc奖励入口
};

tHorse = inherit(tFlashNpcInfo,tHorse);

function main()
	autoclean();
	tHorse:npc_main();
end

function tHorse:giveTalkAward()
	if GetFollower() ~= 0 then
		return 0;
	end
	print(SummonNpc("Chi課 M� Ch箉 Xa","Chi課 M� Ch箉 Xa"));
end

function get_horse()

	if GetFollower() ~= 0 then
		Talk(1,"","Чi hi謕 h穣 h駓 b� th� nu玦 hi謓 t筰 r錳 m韎 n nh薾 chi課 m�!");
		return 0;
	end
	tHorse:talkCallBack(); 
end
        
function tHorse.create_horse_npc()
	tHorse:createFlashNpc(5079,20);
end
	
 
function tHorse:onTalk()
	if tGtTask:check_cur_task(945) ~= 1 then return 0;	end;
	if GetFollower() ~= 0 then 
		local nIdx =  GetFollower();
		if GetNpcName(nIdx) == "Chi課 M� Ch箉 Xa" then
			Talk(1,"","Ch糿g ph秈 ngi  c� m閠 con chi課 m� r錳 sao? H穣 d蒼 chi課 m� v� chu錸g r錳 quay l筰 t譵 ta!")
			return 0;
		else       
			KillFollower();
		end
	end
	Say("Chi課 M� Ch箉 Xa: ",2,
		{"C莔 d﹜ cng c馻 chi課 m�/get_horse",
		"K誸 th骳 i tho筰/nothing",}
		)	
end
