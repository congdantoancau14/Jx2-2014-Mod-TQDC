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
		if GetTime() - GetTask(TASK_BURNFIRETIME) > FIRELIFETIME or GetTask(TASK_BURNFIRETIME) == 0 
			or nNpcFireIndex ~= GetTask(TASK_FIREINDEX) then
			--Talk(1,"","��ng l�a c�a ai ��y?");
			Say("��ng l�a c�a ai ��y",2,"Th�m c�i gi�p ng��i/givewood","Th�i k�/nothing");
			return 0;
		end;
	end;

	local nTimePassed = GetTime() - GetTask(TASK_BURNFIRETIME);
	local nTimeLeft = 0; -- Time left need to burn
	
	if GetTask(TASK_NEWFIRELIFETIME) ~= 0 then
		nTimeLeft = GetTask(TASK_NEWFIRELIFETIME) - nTimePassed;
	else
		nTimeLeft = FIRELIFETIME - nTimePassed;
	end
	
	local nDisplayTimeLeft = nTimeLeft - FIRELIFETIME/5;
	if nTimeLeft ~= 0 and nTimeLeft > MAXFIRELIFETIME then
		Talk(1,"","��ng l�a �ang ch�y n�, t�m th�i kh�ng c�n th�m c�i, tr�nh l�ng ph�. "
			.."N�u sau <color=yellow>"..Get_Time_String(nDisplayTimeLeft)
			.."<color> sau kh�ng th�m c�i, ��ng l�a s� l�i t�n m� t�t �i. Th�i gian th�m c�i l�n sau c�n <color=yellow>"
			..Get_Time_String(nDisplayTimeLeft - (FIRELIFETIME + (FIRELIFETIME-FIRELIFETIME/5))).."<color>.");
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
	
	--SetNpcLifeTime(nNpcFireIndex,MAXFIRELIFETIME);
	--SetTask(TASK_BURNFIRETIME,GetTime());
	
	local nTimePassed = GetTime() - GetTask(TASK_BURNFIRETIME);
	local nFireLifeTime = 0; -- New firelifetime
	-- if GetTask(TASK_NEWFIRELIFETIME) == 0 then
		-- nFireLifeTime = FIRELIFETIME-nTimePassed + FIRELIFETIME/5;
	-- else
		-- nFireLifeTime = GetTask(TASK_NEWFIRELIFETIME) - nTimePassed + FIRELIFETIME/5;
	-- end
	Msg2Player("nTimePassed: "..nTimePassed);
	if GetTask(TASK_NEWFIRELIFETIME) ~= 0 then
		nTimeLeft = GetTask(TASK_NEWFIRELIFETIME) - nTimePassed;
		nFireLifeTime = GetTask(TASK_NEWFIRELIFETIME) + FIRELIFETIME/5;
	else
		nTimeLeft = FIRELIFETIME - nTimePassed;
		nFireLifeTime = FIRELIFETIME + FIRELIFETIME/5;
	end
	
	
	
	StopTimeGuage(nNpcFireIndex);
	StartTimeGuage("Th�m c�i",nFireLifeTime-FIRELIFETIME/5,0,nNpcFireIndex);
	SetTask(TASK_NEWFIRELIFETIME,nFireLifeTime);
	SetNpcLifeTime(nNpcFireIndex,nFireLifeTime);
	--SetTask(TASK_BURNFIRETIME,GetTime());	
	
	-- L� n��ng
	local nOvenIndex = GetTask(TASK_OVENINDEX);
	StopTimeGuage(nOvenIndex);
	StartTimeGuage("L� n��ng",nFireLifeTime+OVENLIFETIME,0,nOvenIndex);
	SetNpcLifeTime(nOvenIndex,nFireLifeTime+OVENLIFETIME);
end;

function nothing()

end;

