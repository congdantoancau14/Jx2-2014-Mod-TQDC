Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\202007\\head.lua");
Include("\\script\\online_activites\\xinshouzhiyin\\item\\item_xiaoaojianghulu_head.lua");

nOvenType = 0;

function main()
	-- Talk(1,"","Lß n­íng ®ang chê. Kh«ng co'ngän löa tr¹i duy tr×, lß n­íng sÏ dÔ bi. t¾t. Thêi gian cßn l¹i...");
	nOvenType = GetTask(TASK_OVENTYPE);
	local nFireTime = 0;
	if GetTask(TASK_NEWFIRELIFETIME) then
		nFireTime = GetTask(TASK_NEWFIRELIFETIME)
	elseif GetTask(TASK_BURNFIRETIME) then
		nFireTime = GetTask(TASK_BURNFIRETIME)
	end
	local nTimeLeft = GetTime() - GetTask(TASK_HIREOVENTIME) + nFireTime;
	local szNpcName = GetTargetNpcName();
	local szHeader = format("---- %s ----\n",gf_FixColor(szNpcName,2))
		.."NÕu kh«ng cã ngän löa duy tr× th× sÏ bÞ t¾t.\n"
		.."Lß n­íng cÇn ®­îc duy tr× ë nhiÖt ®é thÝch hîp, nÕu kh«ng sÏ lµm b¸nh ch¸y hoÆc kh«ng chÝn ®Òu.\n"
		.."Thêi gian cßn l¹i: "..gf_FixColor(Get_Time_String(nTimeLeft),4);
	
	local tSay = {
		format("N­íng %d b¸nh Trung Thu/#nuong(1)",tOvens[nOvenType][4]*tCheBien[1]["products"][1][3]),
		format("N­íng %d kÑo s÷a/#nuong(2)",tOvens[nOvenType][4]*tCheBien[2]["products"][1][3]),
		"ChuÈn bÞ thªm ®·/nothing"
	}
	Say(szHeader,getn(tSay),tSay);
end;

function nuong(nProductType)
	tItem = tCheBien[nProductType];
	local nMax, tCount = countItems(tItem["mater"]);
	
	if nMax > 0 then
		if nMax > tOvens[nOvenType][4] then
			nMax = tOvens[nOvenType][4];
		end
		Msg2Player("nMax: "..nMax);
		local nDel, tDel = delItems(tItem["mater"], nMax);
		if nDel ~= 1 then
			Talk(1,"","H×nh nh­ ®· x¶y ra vÊn ®Ò víi nguyªn liÖu.");
		else
			local nProducts = getn(tItem["products"]);
			for i=1, nMax do
				local r = random(1,nProducts);
				AddItem(tItem["products"][r][2][1],
					tItem["products"][r][2][2],
					tItem["products"][r][2][3],
					tItem["products"][r][3]);
			end
			Msg2Player("Ra lß thµnh c«ng. Tæng l­îng s¶n phÈm: "..nMax);
		end
		
	else
		local szMes = "TiÖt! Ta ch­a chuÈn bÞ ®Çy ®ñ nguyªn liÖu råi!"..enter
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