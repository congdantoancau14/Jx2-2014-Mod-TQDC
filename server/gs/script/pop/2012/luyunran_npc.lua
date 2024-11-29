--Èû±±Ë«Ó¥Â½ÔÆÈ¼
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\lib\\define.lua")
tInfo = {
	["Tr¹i B¾c Song ¦ng Lôc Nhiªn Phong"]	= {923,"Tr¹i B¾c Song ¦ng Lôc Nhiªn Phong",	"Tr¹i B¾c Song ¦ng Lôc Nhiªn Phong",TASKID_SW_USE_ANTIDOTE,1},--ÈÎÎñ±àºÅ£¬Ä£°æÃû£¬ÏÔÊ¾Ãû£¬TASKID£¨ÐèÒªÉèÎª1£©
	["ChiÕn M· Ch¹y Xa"]			= {945,"ChiÕn M· Ch¹y Xa",			"ChiÕn M· Ch¹y Xa",nil,nil,{"CÇm d©y c­¬ng cña chiÕn m·/#get_horse(×ßÔ¶µÄÕ½Âí)"}},
	}
function get_horse(nNpcName)
	if not tInfo[nNpcName] then
		return 0;
	end
	local tFollow = tInfo[nNpcName];
	tFollow[3] = tFollow[3] or tFollow[2]
	if GetFollower() ~= 0 then
--		KillFollower();
	end
	SummonNpc(tFollow[2],tFollow[3]);
	if tFollow[4]  then
		tFollow[5] = tFollow[5] or 1;
		SetTask(tFollow[4],tFollow[5]);
	end
end

function main()
	local nNpcIdx = GetTargetNpc();
	local nNpcName = GetNpcName(nNpcIdx);
	local tFollow ;
	if not tInfo[nNpcName] then
		return 0;
	end
	tFollow = tInfo[nNpcName];
	if tFollow[4]  then
		tFollow[5] = tFollow[5] or 1;
		if GetTask(tFollow[4]) == tFollow[5] then
			return 0;
		end
	end
	if tFollow[1] and tFollow[2] and 1 == tGtTask:check_cur_task(tFollow[1]) then
		if  tFollow[6] then
			Say("ChiÕn M· Ch¹y Xa:",getn(tFollow[6]),tFollow[6]);
			return 0;
		else
			get_horse(nNpcName)
		end
	end
end
