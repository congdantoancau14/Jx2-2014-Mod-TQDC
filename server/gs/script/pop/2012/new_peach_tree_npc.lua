--	["桃树"] 		 = {{928,947,},	{2,96,129,1,4},"新鲜的桃子",}, -- 【NPC name】={{taskid,},[{item info}],"item name",[sTalkMsg]} 
Include("\\script\\online\\template\\flash_npc.lua");
Include("\\script\\class\\mem.lua")
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\misc\\autocleaner\\autocleaner_head.lua")

tPeachTree = { --
	nstartDate = 20120301, --活动开始时间
	nEndDate = 20301230, --活动结束时间
	nCheckRoute = 0,  --是否要加入流派
	strNpcMod = "Уo Hoa th�",  --Npc模板
	strNpcName = "Nh竛h Уo", --npc名字
	nCampType = 1,   --对话npc还是战斗npc
	nNeedRoom = 0,   --如果是对话npc，需要判断背包空间（根据奖励而定）
	nNeedWeight = 0, --如果是对话npc，需要判断背包负重（根据奖励而定）
	strThisFile = "\\script\\pop\\2012\\new_peach_tree_npc.lua",  
	tNpcPos = {
		[5079]={
{4062,11255},	
{4051,11269},	
{4018,11255},	
{4030,11276},	
{4047,11290},	
{4066,11287},	
{4046,11302},	
{4023,11306},	
{3995,11195},	
{3974,11165},	
{4017,11200},	
{4011,11156},	
{4009,11137},	
{4097,11159},	
{4087,11154},	
{4073,11148},	
{4066,11158},	
{4106,11156},	
{3975,11076},	
{3984,11070},	
{4028,11086},	
{4041,11081},	
{4035,11068},	
{4025,11057},	
{4011,11044},	
{4061,11001},	
{4070,11036},	
{4045,11008},	
{4050,10991},	
{3992,11000},	
{3985,10910},	
{3973,10912},	
{3996,10910},	
{4016,10936},	
{4026,10924},	
{4032,10917},	
{4160,10988},	
{4187,10971},	
{4200,10968},	
{4207,10945},	
{4216,10941},	
{4227,10932},	
{4240,10955},	
{4255,10962},	
{4274,10974},	
{4284,10990},	
{4282,11016},	
{4310,11021},	
{4285,11030},	
{4268,11022},	
		
			},
	},
	-- 需要实现以下接口函数
	onTalk = nil,						--对话npc入口
	giveDeathAward = nil,	  --杀死npc奖励入口
	giveTalkAward = nil,		--对话npc奖励入口
};

tPeachTree = inherit(tFlashNpcInfo,tPeachTree);

function main()
	autoclean();
	tPeachTree:npc_main();
end

function tPeachTree.create_tree_npc()
	tPeachTree:createFlashNpc(5079,20);
end
	

function tPeachTree:giveTalkAward()
	gf_AddItemEx({2,96,130,1,4},"H箃 gi鑞g c﹜ o");
end
	
tTaskId = {928,947}
function tPeachTree:onTalk()
	local nHasTask = 0;
	if BigGetItemCount(2,96,130) >= 5 then
		Talk(1,"","Thi誹 hi謕  thu th藀  h箃 gi鑞g r錳, h穣 mang 甶 gieo tr錸g n祇!");
		return 0;
	end
	
	for i = 1,getn(tTaskId) do
		if tGtTask:check_cur_task(tTaskId[i]) == 1 then
			nHasTask = 1;
			break;
		end
	end
	if nHasTask ~= 1 then
			return 0;
	end
	if gf_Judge_Room_Weight(1,10,"Nh竛h Уo") ~= 1 then return 0; end
	tPeachTree:talkCallBack(); 
end
