Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\202007\\head.lua");
Include("\\script\\online_activites\\xinshouzhiyin\\item\\item_xiaoaojianghulu_head.lua"); -- countItems

nOvenType = 0;

function main()
	-- Talk(1,"","L� n��ng �ang ch�. Kh�ng co'ng�n l�a tr�i duy tr�, l� n��ng s� d� bi. t�t. Th�i gian c�n l�i...");
	nOvenType = GetTask(TASK_OVENTYPE);
	local nFireTime = 0;
	if GetTask(TASK_NEWFIRE_LIFETIME) then
		nFireTime = GetTask(TASK_NEWFIRE_LIFETIME)
	elseif GetTask(TASK_BONFIRE_CREATEDTIME) then
		nFireTime = GetTask(TASK_BONFIRE_CREATEDTIME)
	end
	local nTimeLeft = OVEN_LIFETIME - (GetTime() - GetTask(TASK_OVEN_CREATEDTIME)) + nFireTime;
	local szNpcName = GetTargetNpcName();
	local szHeader = format("---- %s ----\n",gf_FixColor(szNpcName,2))
		.."N�u kh�ng c� ng�n l�a duy tr� th� s� b� t�t.\n"
		.."L� n��ng c�n ���c duy tr� � nhi�t �� th�ch h�p, n�u kh�ng s� l�m b�nh ch�y ho�c kh�ng ch�n ��u.\n"
		.."Th�i gian c�n l�i: "..gf_FixColor(Get_Time_String(nTimeLeft),4);
	
	local tSay = {
		format("N��ng %d b�nh Trung Thu/#nuong(1)",tOvenSizes[nOvenType][4]*tCheBien[1]["products"][1][3]),
		format("N�u %d k�o s�a/#nuong(2)",tOvenSizes[nOvenType][4]*tCheBien[2]["products"][1][3]),
		format("L�m %d ��a m�ng x�o/#nuong(3)",tOvenSizes[nOvenType][4]*tCheBien[3]["products"][1][3]),
		"Chu�n b� th�m ��/nothing"
	}
	Say(szHeader,getn(tSay),tSay);
end;

function nuong(nProductType)
	tItem = tCheBien[nProductType];
	local nMax, tCount = countItems(tItem["mater"]);
	
	if nMax > 0 then
		if nMax > tOvenSizes[nOvenType][4] then
			nMax = tOvenSizes[nOvenType][4];
		end
		Msg2Player("nMax: "..nMax);
		local nDel, tDel = delItems(tItem["mater"], nMax);
		if nDel ~= 1 then
			Talk(1,"","H�nh nh� �� x�y ra v�n �� v�i nguy�n li�u.");
		else
			local nProducts = getn(tItem["products"]);
			for i=1, nMax do
				local r = random(1,nProducts);
				AddItem(tItem["products"][r][2][1],
					tItem["products"][r][2][2],
					tItem["products"][r][2][3],
					tItem["products"][r][3]);
			end
			Msg2Player("Ra l� th�nh c�ng. T�ng l��ng s�n ph�m: "..nMax);
		end
		
	else
		local szMes = "Ti�t! Ta ch�a chu�n b� ��y �� nguy�n li�u r�i!"..enter
				..gf_Colorize(tItem["desc"][1][1],"gray")..enter;
		for i=1, getn(tCount) do
			if tCount[i] == 0 then
				szMes = szMes.."* "..colorize("red",tItem["mater"][i][1])..space
									..colorize("yellow",tItem["mater"][i][3])..enter;
			else
				szMes = szMes.."* "..colorize("green",tItem["mater"][i][1])..space
									..colorize("yellow",tItem["mater"][i][3])..enter;
			end
		end
		Talk(1,"",szMes);
	end
end;

function nothing()
end;