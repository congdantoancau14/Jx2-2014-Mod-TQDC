Include("\\script\\online_activites\\202007\\head.lua");
Include("\\script\\online_activites\\xinshouzhiyin\\item\\item_xiaoaojianghulu_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function main()
	local npcIdx,npcModel,npcName = GetTriggeringUnit();

	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName,1,nNameLen) then
		bJudgeByName = 1;
	end;
	
	local nNpcFireIndex = GetTargetNpc();
	
	if bJudgeByName == 0 then
		if GetTime() - GetTask(TASK_BONFIRE_CREATEDTIME) > FIRE_LIFETIME or GetTask(TASK_BONFIRE_CREATEDTIME) == 0 
			or nNpcFireIndex ~= GetTask(TASK_FIREINDEX) then
			--Talk(1,"","§èng löa cña ai ®©y?");
			Say("§èng löa cña ai ®©y",2,"Thªm cñi gióp ng­êi/givewood","Th«i kÖ/nothing");
			return 0;
		end;
	end;

	local nTimePassed = GetTime() - GetTask(TASK_BONFIRE_CREATEDTIME);
	local nTimeLeft = 0; -- Time left need to burn
	
	if GetTask(TASK_NEWFIRE_LIFETIME) ~= 0 then
		nTimeLeft = GetTask(TASK_NEWFIRE_LIFETIME) - nTimePassed;
	else
		nTimeLeft = FIRE_LIFETIME - nTimePassed;
	end
	
	local nDisplayTimeLeft = nTimeLeft - FIRE_LIFETIME/5;
	if nTimeLeft ~= 0 and nTimeLeft > MAXFIRE_LIFETIME then
		Talk(1,"","§èng löa ®ang ch¸y ná, t¹m thêi kh«ng cÇn thªm cñi, tr¸nh l·ng phÝ. "
			.."NÕu sau <color=yellow>"..Get_Time_String(nDisplayTimeLeft)
			.."<color> sau kh«ng thªm cñi, ®èng löa sÏ lôi tµn mµ t¾t ®i. Thêi gian thªm cñi lÇn sau cßn <color=yellow>"
			..Get_Time_String(nDisplayTimeLeft - (FIRE_LIFETIME + (FIRE_LIFETIME-FIRE_LIFETIME/5))).."<color>.");
		return 0;
	end;

	
	local sSaySth = "";
	local selTab = {};
	

	tinsert(selTab,"Cho thªm 10 bã cñi/givewood");
	tinsert(selTab,"T¹m thêi ch­a cho./nothing");
	sSaySth = "§èng löa ®ang cÇn thªm cñi. NÕu sau <color=yellow>"
		..Get_Time_String(nDisplayTimeLeft)
		.."<color> sau kh«ng thªm cñi, ®èng löa sÏ bÞ t¾t.";

	Say(sSaySth,getn(selTab),selTab);
end;

function givewood()

	local nNpcFireIndex = GetTask(TASK_FIREINDEX);
	if nNpcFireIndex == 0 then
		WriteLog("[Lçi ho¹t ®éng ®èt löa n­íng b¸nh]:"..GetName().."Lóc thªm cñi, TASK_FIREINDEX biÕn l­îng nhiÖm vô lµ 0");
		return 0;
	end;
	
	local nDelResult, tDel = delItems(tDecorators[1]["mater"],0.1,1);
	
	if nDelResult ~= 1 then
		Talk(1,"","Kh«ng ®ñ cñi råi!");
		return 0;
	end;
	
	--SetNpcLifeTime(nNpcFireIndex,MAXFIRE_LIFETIME);
	--SetTask(TASK_BONFIRE_CREATEDTIME,GetTime());
	
	local nTimePassed = GetTime() - GetTask(TASK_BONFIRE_CREATEDTIME);
	local nFIRE_LIFETIME = 0; -- New FIRE_LIFETIME
	-- if GetTask(TASK_NEWFIRE_LIFETIME) == 0 then
		-- nFIRE_LIFETIME = FIRE_LIFETIME-nTimePassed + FIRE_LIFETIME/5;
	-- else
		-- nFIRE_LIFETIME = GetTask(TASK_NEWFIRE_LIFETIME) - nTimePassed + FIRE_LIFETIME/5;
	-- end
	Msg2Player("nTimePassed: "..nTimePassed);
	if GetTask(TASK_NEWFIRE_LIFETIME) ~= 0 then
		nTimeLeft = GetTask(TASK_NEWFIRE_LIFETIME) - nTimePassed;
		nFIRE_LIFETIME = GetTask(TASK_NEWFIRE_LIFETIME) + FIRE_LIFETIME/5;
	else
		nTimeLeft = FIRE_LIFETIME - nTimePassed;
		nFIRE_LIFETIME = FIRE_LIFETIME + FIRE_LIFETIME/5;
	end
	
	
	
	StopTimeGuage(nNpcFireIndex);
	StartTimeGuage("Thªm cñi",nFIRE_LIFETIME-FIRE_LIFETIME/5,0,nNpcFireIndex);
	SetTask(TASK_NEWFIRE_LIFETIME,nFIRE_LIFETIME);
	SetNpcLifeTime(nNpcFireIndex,nFIRE_LIFETIME);
	--SetTask(TASK_BONFIRE_CREATEDTIME,GetTime());	
	
	-- Lß n­íng
	local nOvenIndex = GetTask(TASK_OVENINDEX);
	StopTimeGuage(nOvenIndex);
	StartTimeGuage("Lß n­íng",nFIRE_LIFETIME+OVEN_LIFETIME,0,nOvenIndex);
	SetNpcLifeTime(nOvenIndex,nFIRE_LIFETIME+OVEN_LIFETIME);
end;

function nothing()

end;

