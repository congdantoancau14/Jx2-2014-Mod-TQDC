Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\missions\\yp\\yp_head.lua")

thisFile = "\\script\\missions\\yp\\qmy\\mission.lua";

tbSLY = { 
	name = "ThÊt L¹c Nhai",
--	timerID = 79,
	missionID = 81,
	realMapID = 6300,
	dynamicMap = 0,
	
	--ÒÔÏÂÎªmissionV±äÁ¿
	mv1 = 1, --1-10²Ø±¦Í¼µãµÄÎ»ÖÃ
	mv2 = 2,
	mv3 = 3,
	mv4 = 4,
	mv5 = 5,
	mv6 = 6,
	mv7 = 7,
	mv8 = 8,
	mv9 = 9,
	mv10 = 10,
	mv11 = 11, --±£»¤ÊÆÁ¦¿ª¹Ø
	mv12 = 12, --Ë¢ÁË¶àÉÙ´Î±¦²Ø
	mv13 = 13,
}
tbSLY = gf_CopyInherit(missionHead, tbSLY)

firePhases = {
	timerID = 115,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7Ìì£¿
};
firePhases = gf_CopyInherit(phaseBase,firePhases)

function yp_rebornBiaoche(m,nNewPosX,nNewPosY)
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 1 then
		qmy_enter(m,nNewPosX,nNewPosY);	
		return 0;
	end	
	local nOldNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nOldNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nOldNpcIdx);
	if nOldNpcIdx == 0 or nOldNpcID ~= nCurNpcID then
		Msg2Player("Tiªu Xa cña ng­¬i bÞ ph¸ hñy hoÆc qu¸ thêi gian vËn tiªu vÉn ch­a ®Õn ®Ých, vËn tiªu thÊt b¹i!");
		Talk(1,"","Tiªu Xa cña ng­¬i bÞ ph¸ hñy hoÆc qu¸ thêi gian vËn tiªu vÉn ch­a ®Õn ®Ých, vËn tiªu thÊt b¹i!");
		SetTask(TASK_FIELD_PVP_CAR_RAND,0)
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		qmy_enter(m,nNewPosX,nNewPosY);	
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nOldNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	local nBCType = GetTask(TASK_FIELD_PVP_CAR_RAND)
	if nBCType == 0 then
		qmy_enter(m,nNewPosX,nNewPosY);	
		return 0;
	end
	if nDistance > 30 then
		qmy_enter(m,nNewPosX,nNewPosY);	
		return 0;
	end
	local nNpcIdx = CreateNpc(tBiaoChe[nBCType][1],format("%s - %s",GetName(),tBiaoChe[nBCType][2]),m,nNewPosX,nNewPosY);
	if nNpcIdx ~= 0 then
		SetNpcRemoveScript(nOldNpcIdx,"");
		SetNpcLifeTime(nOldNpcIdx,0)
		local nNpcID = GetNpcID(nNpcIdx);
		local nCurLife = GetTask(TASK_FIELD_PVP_CAR_LIFE);
		local nLifeTime = 30*60-(GetTime()-GetTask(TASK_FIELD_PVP_CAR_LIFETIME));
		if nLifeTime > 30*60 then
			nLifeTime = 30*60;
		elseif nLifeTime <= 0 then
			nLifeTime = 1;
		end
		ModifyNpcData(nNpcIdx,0,nCurLife,0); --ÉèÖÃµ±Ç°ÉúÃüÖµ
		SetNpcLifeTime(nNpcIdx,nLifeTime);   --ÉèÖÃµ±Ç°´æÔÚÊ±¼ä
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if tAllCamp[nCamp] then
			SetCampToNpc(nNpcIdx,tAllCamp[nCamp]);
		end
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcRemoveScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetTask(TASK_FIELD_PVP_CAR_IDX,nNpcIdx);
		SetTask(TASK_FIELD_PVP_CAR_ID,nNpcID);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,GetTime());	
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		SetNpcTempData(nNpcIdx, 1, nBCType)
	end
	qmy_enter(m,nNewPosX,nNewPosY);	
end

function qmy_enter(m,nNewPosX,nNewPosY)
	SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua", "enter()")
	NewWorld(m,nNewPosX,nNewPosY);
end