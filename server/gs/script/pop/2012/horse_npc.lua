Include("\\script\\online\\template\\flash_npc.lua");
Include("\\script\\class\\mem.lua")
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\misc\\autocleaner\\autocleaner_head.lua")

tHorse = { --×ßÔ¶µÄÕ½Âí
	nstartDate = 20120301, --»î¶¯¿ªÊ¼Ê±¼ä
	nEndDate = 20301230, --»î¶¯½áÊøÊ±¼ä
	nCheckRoute = 0,  --ÊÇ·ñÒª¼ÓÈëÁ÷ÅÉ
	strNpcMod = "ChiÕn M· Ch¹y Xa",  --NpcÄ£°å
	strNpcName = "ChiÕn M· Ch¹y Xa", --npcÃû×Ö
	nCampType = 1,   --¶Ô»°npc»¹ÊÇÕ½¶·npc
	nNeedRoom = 0,   --Èç¹ûÊÇ¶Ô»°npc£¬ÐèÒªÅÐ¶Ï±³°ü¿Õ¼ä£¨¸ù¾Ý½±Àø¶ø¶¨£©
	nNeedWeight = 0, --Èç¹ûÊÇ¶Ô»°npc£¬ÐèÒªÅÐ¶Ï±³°ü¸ºÖØ£¨¸ù¾Ý½±Àø¶ø¶¨£©
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
	-- ÐèÒªÊµÏÖÒÔÏÂ½Ó¿Úº¯Êý
	onTalk = nil,						--¶Ô»°npcÈë¿Ú
	giveDeathAward = nil,	  --É±ËÀnpc½±ÀøÈë¿Ú
	giveTalkAward = nil,		--¶Ô»°npc½±ÀøÈë¿Ú
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
	print(SummonNpc("ChiÕn M· Ch¹y Xa","ChiÕn M· Ch¹y Xa"));
end

function get_horse()

	if GetFollower() ~= 0 then
		Talk(1,"","§¹i hiÖp h·y hñy bá thó nu«i hiÖn t¹i råi míi ®Õn nhËn chiÕn m·!");
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
		if GetNpcName(nIdx) == "ChiÕn M· Ch¹y Xa" then
			Talk(1,"","Ch¼ng ph¶i ng­¬i ®· cã mét con chiÕn m· råi sao? H·y dÉn chiÕn m· vÒ chuång råi quay l¹i t×m ta!")
			return 0;
		else       
			KillFollower();
		end
	end
	Say("ChiÕn M· Ch¹y Xa: ",2,
		{"CÇm d©y c­¬ng cña chiÕn m·/get_horse",
		"KÕt thóc ®èi tho¹i/nothing",}
		)	
end
