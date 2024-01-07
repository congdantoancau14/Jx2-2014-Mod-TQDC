--塞北双鹰陆云燃
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\lib\\define.lua")
tInfo = {
	["Tr筰 B綾 Song g L鬰 Nhi猲 Phong"]	= {923,"Tr筰 B綾 Song g L鬰 Nhi猲 Phong",	"Tr筰 B綾 Song g L鬰 Nhi猲 Phong",TASKID_SW_USE_ANTIDOTE,1},--任务编号，模版名，显示名，TASKID（需要设为1）
	["Chi課 M� Ch箉 Xa"]			= {945,"Chi課 M� Ch箉 Xa",			"Chi課 M� Ch箉 Xa",nil,nil,{"C莔 d﹜ cng c馻 chi課 m�/#get_horse(走远的战马)"}},
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
			Say("Chi課 M� Ch箉 Xa:",getn(tFollow[6]),tFollow[6]);
			return 0;
		else
			get_horse(nNpcName)
		end
	end
end
