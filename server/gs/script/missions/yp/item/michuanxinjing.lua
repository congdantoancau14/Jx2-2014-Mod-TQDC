--²Ø½£ÃØ´«ÐÄ¾­
Include("\\script\\missions\\yp\\award.lua")
Include("\\script\\tmp_task_id_def.lua")

g_nReadTime = 4*60;

tItemInfo = {
	{"Tµng KiÕm BÝ TruyÒn T©m Kinh",2,95,823},
	{"B¸ch HiÓu Sinh BÝ Ph¸p",2,95,824},
}

function OnUse(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	local nType = 0;
	for i = 1,getn(tItemInfo) do
		if g == tItemInfo[i][2] and d == tItemInfo[i][3] and p == tItemInfo[i][4] then
			nType = i;
			break;
		end
	end
	if nType == 0 then return 0; end
	
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then 
		Talk(1,"","CÇn ph¶i gia nhËp thÕ lùc míi ®­îc dïng vËt phÈm nµy!");
		return 0;
	end
	if tMainMapID[nCamp][1] ~= nMapID then
--		print(nCamp)
--		print("tMainMapID[nCamp][1]",tMainMapID[nCamp][1],nMapID)
		Talk(1,"","VËt phÈm nµy chØ ®­îc dïng ë b¶n ®å thÕ lùc t­¬ng øng cña ®¹i hiÖp!");
		return 0;
	end
	local nBookType = GetTask(TASK_FIELD_PVP_READ_TYPE);
	if nBookType ~= 0 and nBookType ~= nType then
		Talk(1,"","  "..tItemInfo[nBookType][1].."VÉn ch­a ®äc xong!");
		return 0;
	end
	local nReadTime = GetTask(TASK_FIELD_PVP_READING_TIME);
	if nReadTime ~= 0 and nReadTime >= g_nReadTime then
		Say("",
			2,
			"\n NhËn phÇn th­ëng/#bk_getAward("..nType..",2)",
			"\nKÕt thóc ®èi tho¹i/nothing")	
		return 1;	
	end
	local nDistance = 0;
	local nTime = tonumber(date("%H%M"));
	for i=1,getn(tCreatTime) do
		if nTime >= tCreatTime[i] and nTime < tCreatTime[i]+15 then --15·ÖÖÓÄÚ
			for k = 1,getn(tPos[nMapID].chd) do
				local d = abs(nPosX-tPos[nMapID].chd[k][1])+abs(nPosY-tPos[nMapID].chd[k][2])
				if nDistance == 0 or nDistance > d then
					nDistance = d;
				end
			end
		end
	end
	if nDistance == 0 then
		Talk(1,"","Kh«ng ph¶i thêi gian truyÒn ®¹o kh«ng thÓ tham ngé!");
		return 0;
	end
	if nDistance > 40 then
		Talk(1,"","VËt phÈm nµy ph¶i ®øng gÇn §iÓm Cñi Löa míi ®­îc sö dông!");
		return 0;
	end
	if nReadTime ~= 0 and nReadTime < g_nReadTime then
--		if GetTask(TASK_FIELD_PVP_READ_AWARD) ~= 1 then
--			Say("",
--				2,
--				"\nÁìÈ¡½±Àø/#bk_getAward("..nType..",1)",
--				"\n½áÊø¶Ô»°/nothing")
--			if GetTaskTemp(TEMP_FIELD_PVP_READ_STATE) ~= 0 then --¶ÁÊé×´Ì¬ÖÐ
--				return 1;
--			end
		if GetTaskTemp(TEMP_FIELD_PVP_READ_STATE) ~= 0 then --¶ÁÊé×´Ì¬ÖÐ
			Talk(1,"","H·y kiªn nhÉn ®äc xong.");
			return 1;
		end
	elseif nReadTime ~= 0 and nReadTime >= g_nReadTime then
		Say("",
			2,
			"\n NhËn phÇn th­ëng/#bk_getAward("..nType..",2)",
			"\nKÕt thóc ®èi tho¹i/nothing")	
		return 1;
	elseif GetTaskTemp(TEMP_FIELD_PVP_READ_STATE) ~= 0 then
		Talk(1,"","H·y kiªn nhÉn ®äc xong.");
		return 1;		
	end
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	NpcCommand(nPidxNpc,14,0,0,0); --´ò×ø
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetTask(TASK_FIELD_PVP_READ_STAR_TIME,GetTime());
	SetTask(TASK_FIELD_PVP_READ_TYPE,nType);
	SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,1);
	nSecond = g_nReadTime-nReadTime
	SetCurrentNpcSFX(nPidxNpc,973,2,0,nSecond); --ÌØÐ§
	DoWait(123,124,nSecond);
end

function bk_readSuc()
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,0);
	SetTask(TASK_FIELD_PVP_READING_TIME,g_nReadTime);
	Msg2Player("S¸ch ®· nghiªn cøu hoµn tÊt, h·y nhÊp ®Ó nhËn th­ëng!");
end

function bk_readFail()
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,0);
	local nReadTime = GetTime();
	SetTask(TASK_FIELD_PVP_READING_TIME,GetTask(TASK_FIELD_PVP_READING_TIME)+nReadTime-GetTask(TASK_FIELD_PVP_READ_STAR_TIME));
	return 0;
end

function bk_getAward(nType,nAward)
	if nAward == 1 and GetTask(TASK_FIELD_PVP_READ_AWARD) ~= 1 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		SetTask(TASK_FIELD_PVP_READ_AWARD,1);
		bk_giveAward(nType);
	end
	if nAward == 2 then
		if gf_Judge_Room_Weight(3,10,"") ~= 1 then
			return 0;
		end		
		if DelItem(tItemInfo[nType][2],tItemInfo[nType][3],tItemInfo[nType][4],1) == 1 then
			SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,0);
			SetTask(TASK_FIELD_PVP_READING_TIME,0);
			SetTask(TASK_FIELD_PVP_READ_STAR_TIME,0);
			SetTask(TASK_FIELD_PVP_READ_TYPE,0);
			SetTask(TASK_FIELD_PVP_READ_AWARD,0);
			bk_giveAward(nType);
		end
	end
end

function bk_giveAward(nType)
	if nType == 1 then
		yp_aw_giveAward_2();
	elseif nType == 2 then
		yp_aw_giveAward_3();
	end
end