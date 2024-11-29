Include("\\script\\missions\\tong_mission\\main_function.lua");

function main()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx <= 0 then
		return 0;
	end;
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"","ViÖn trî ngo¹i bang kh«ng thÓ nhÆt b¶o r­¬ng.");
		return 0;
	end;
	local nCurJob = IsTongMember();
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"","B¶o r­¬ng ph¶i ®­îc më bëi Bang chu, Phã bang chñ, Tr­ëng l·o.");
		return 0;
	end;
	local nParam2 = GetUnitCurStates(nNpcIdx,2);	
	local nStage = GetUnitCurStates(nNpcIdx,1);	
	local nNeedRoom = 2;
	if nStage == MAX_STAGE then
		nNeedRoom = 7;	--µÚ6¹ØÐèÒª7¸ö¿Õ¼ä
	end;
	if gf_JudgeRoomWeight(nNeedRoom,50,"") == 0 then
		return 0;
	end;
	if nParam2 ~= 1 then	--Èç¹ûÎ´±»Ê°È¡
		TM_SetUnitCurStates(nNpcIdx,2,1);	--ÉèÖÃÒÑ±»Ê°È¡
		SetNpcLifeTime(nNpcIdx,0);
		
		AddItem(2,1,30410,20)
		AddItem(2,1,30390,100);
		AddItem(2,1,30687,10);
		
		if nStage == MAX_STAGE then	--Èç¹ûÊÇµÚ6¹Ø£¬ÔòÔÙ¸ø1ÖÁ5¹ØµÄÏä×Ó¸÷1¸ö
			AddItem(2,1,30770	,5);
			Msg2MSAll(MISSION_ID,GetName().." Më b¶o r­¬ng cña ¶i "..nStage..", thu ®­îc 5 Háa Phông Tinh Hoa");
		end
		Msg2MSAll(MISSION_ID,GetName().." Më b¶o r­¬ng cña ¶i "..nStage..", thu ®­îc 20 M¶nh Thiªn M«n, 100 M¶nh Thiªn Cang, 10 Th¸i NhÊt LÖnh");
		SetMissionV(MV_GET_BOX,0);
		SendTongMessage(GetName().." NhÆt ®­îc r­¬ng cña ¶i"..nStage..".	");
		WriteLog("[Bang héi v­ît ¶i]: "..GetName().." NhÆt ®­îc thø"..nStage..".	");
	end;
end;