Include("\\script\\online_activites\\chuhunguanzhan\\head.lua");
nHour = tonumber(date("%H%M"));

tMap = { -- [current_map] = {{target_map,x,y},cost_fee}
	[100] = {{108,1396,3202},490000},
	[300] = {{301,1594,3192},490000},
	[350] = {{218,1613,3639},0},
}

function main()
	local szSay = "";
	local nMap = GetWorldPos();
	if checkCostFee(nMap) == 0 or (nHour >= 0800 and nHour < 1200) or (nHour >= 1900 and nHour < 2300) then
		szSay = "Nhê ®¹i thÇn gióp xuÊt hån quan chiÕn/chuhun";
	else
		szSay = "Nhê ®¹i thÇn gióp xuÊt hån quan chiÕn (hãa 49 l­îng vµng)/chuhun";
	end
	Say("<color=black>H¾c V« Th­êng<color>: C¸c h¹ cã viÖc g×!",2,szSay,
		"Kh«ng cã viÖc g×/nothing");
end;

function checkCostFee(nMap)
	if tMap[nMap][2] ~= 0 then return 1 else return 0 end
end;

function chuhun()
	local nMap = GetWorldPos();
	if checkCostFee(nMap) ~= 0 and (nHour < 0800 or (nHour >= 1200 and nHour < 1900) or nHour >= 2300) then
		local nPay = Pay(tMap[nMap][2]);
		if nPay ~= 1 then
			Talk(1,"","Kh«ng ®ñ hoµng kim xuÊt hån.");
			return 0;
		end
	end
	NewWorld(tMap[nMap][1][1],tMap[nMap][1][2],tMap[nMap][1][3]);
	CastState("state_illusion_latent",0,99999,1);
	SetFightState(0);
	UseSkillEnable(0);
	SetTask(TASK_SKILLDISABLE,1);
	Talk(1,"","XuÊt hån quan chiÕn: Hån l×a khái x¸c, v« h×nh v« d¹ng, mäi kÜ n¨ng vâ c«ng ®· v« hiÖu, chØ cßn tèc ®é.");
	Msg2Player("ChÕ ®é v« h×nh. Trong b¶n ®å hiÖn t¹i, ng­êi ch¬i kh¸c kh«ng thÓ nh×n thÊy b¶n th©n. KÜ n¨ng bŞ v« hiÖu");
end;