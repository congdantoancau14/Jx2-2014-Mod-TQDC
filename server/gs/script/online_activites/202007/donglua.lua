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
			--Talk(1,"","��ng l�a c�a ai ��y?");
			Say("��ng l�a c�a ai ��y",2,"Th�m c�i gi�p ng��i/givewood","Th�i k�/nothing");
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
		Talk(1,"","��ng l�a �ang ch�y n�, t�m th�i kh�ng c�n th�m c�i, tr�nh l�ng ph�. "
			.."N�u sau <color=yellow>"..Get_Time_String(nDisplayTimeLeft)
			.."<color> sau kh�ng th�m c�i, ��ng l�a s� l�i t�n m� t�t �i. Th�i gian th�m c�i l�n sau c�n <color=yellow>"
			..Get_Time_String(nDisplayTimeLeft - (FIRE_LIFETIME + (FIRE_LIFETIME-FIRE_LIFETIME/5))).."<color>.");
		return 0;
	end;

	
	local sSaySth = "";
	local selTab = {};
	

	tinsert(selTab,"Cho th�m 10 b� c�i/givewood");
	tinsert(selTab,"T�m th�i ch�a cho./nothing");
	sSaySth = "��ng l�a �ang c�n th�m c�i. N�u sau <color=yellow>"
		..Get_Time_String(nDisplayTimeLeft)
		.."<color> sau kh�ng th�m c�i, ��ng l�a s� b� t�t.";

	Say(sSaySth,getn(selTab),selTab);
end;

function givewood()

	local nNpcFireIndex = GetTask(TASK_FIREINDEX);
	if nNpcFireIndex == 0 then
		WriteLog("[L�i ho�t ��ng ��t l�a n��ng b�nh]:"..GetName().."L�c th�m c�i, TASK_FIREINDEX bi�n l��ng nhi�m v� l� 0");
		return 0;
	end;
	
	local nDelResult, tDel = delItems(tDecorators[1]["mater"],0.1,1);
	
	if nDelResult ~= 1 then
		Talk(1,"","Kh�ng �� c�i r�i!");
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
	StartTimeGuage("Th�m c�i",nFIRE_LIFETIME-FIRE_LIFETIME/5,0,nNpcFireIndex);
	SetTask(TASK_NEWFIRE_LIFETIME,nFIRE_LIFETIME);
	SetNpcLifeTime(nNpcFireIndex,nFIRE_LIFETIME);
	--SetTask(TASK_BONFIRE_CREATEDTIME,GetTime());	
	
	-- L� n��ng
	local nOvenIndex = GetTask(TASK_OVENINDEX);
	StopTimeGuage(nOvenIndex);
	StartTimeGuage("L� n��ng",nFIRE_LIFETIME+OVEN_LIFETIME,0,nOvenIndex);
	SetNpcLifeTime(nOvenIndex,nFIRE_LIFETIME+OVEN_LIFETIME);
end;

function nothing()

end;

