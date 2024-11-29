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
		szSay = "Nh� ��i th�n gi�p xu�t h�n quan chi�n/chuhun";
	else
		szSay = "Nh� ��i th�n gi�p xu�t h�n quan chi�n (h�a 49 l��ng v�ng)/chuhun";
	end
	Say("<color=black>H�c V� Th��ng<color>: C�c h� c� vi�c g�!",2,szSay,
		"Kh�ng c� vi�c g�/nothing");
end;

function checkCostFee(nMap)
	if tMap[nMap][2] ~= 0 then return 1 else return 0 end
end;

function chuhun()
	local nMap = GetWorldPos();
	if checkCostFee(nMap) ~= 0 and (nHour < 0800 or (nHour >= 1200 and nHour < 1900) or nHour >= 2300) then
		local nPay = Pay(tMap[nMap][2]);
		if nPay ~= 1 then
			Talk(1,"","Kh�ng �� ho�ng kim xu�t h�n.");
			return 0;
		end
	end
	NewWorld(tMap[nMap][1][1],tMap[nMap][1][2],tMap[nMap][1][3]);
	CastState("state_illusion_latent",0,99999,1);
	SetFightState(0);
	UseSkillEnable(0);
	SetTask(TASK_SKILLDISABLE,1);
	Talk(1,"","Xu�t h�n quan chi�n: H�n l�a kh�i x�c, v� h�nh v� d�ng, m�i k� n�ng v� c�ng �� v� hi�u, ch� c�n t�c ��.");
	Msg2Player("Ch� �� v� h�nh. Trong b�n �� hi�n t�i, ng��i ch�i kh�c kh�ng th� nh�n th�y b�n th�n. K� n�ng b� v� hi�u");
end;