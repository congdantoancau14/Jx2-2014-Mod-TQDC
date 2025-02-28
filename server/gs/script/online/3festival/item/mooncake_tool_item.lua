--File name:mooncake_tool_item.lua 
--Describe:三节连过，制造月饼的东东
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
Include("\\script\\lib\\time.lua")
Include("\\script\\online_activites\\202007\\head.lua")

function OnUse()
	local nType = GetTask(TASK_OVENTYPE);
	if nType ~= nil and nType ~= 0 and isOvenExpire() == 0 then
		createLoNuong(nType);
		return 0;
	end
	local nDate = tonumber(date("%m%d"))
	if nDate < 0801 then
		Talk(1,"","T誸 Trung Thu ch璦 n, l祄 b竛h c騨g c� � ngh躠 g�");
		return 0;
	end;
	if nDate > 1007 then
		Talk(1,"","T誸 Trung Thu  qua, ti誴 t鬰 l祄 b竛h c騨g ch糿g c遪 � ngh躠");
		return 0;
	end;
	local nTimeElapse = GetTime()-GetTask(TASK_FIREUP_TIME);
	local bTempChecked = GetTask(TASK_TEMPERATURE_CHECKED);
	if nTimeElapse >= COOKING_TIME and GetTask(TASK_FIREUP_TIME) ~= 0 then	--时间到，可以取月饼了
		local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
		if nCurTemp <= 0 then	--如果温度低于0度
			local selTab = {
						"M� l� xem th�/open_stove",
						}
			Say("L鯽 trong l� c馻 b筺  t総, ch綾 b竛h Trung Thu c騨g  h�.",getn(selTab),selTab);
			return 0;
		end;
		local selTab = {
					"L蕐 b竛h Trung Thu ra/get_mooncake",
					"Th猰 nhi猲 li謚/ask_fuel",
					"T筸 th阨 kh玭g l蕐 b竛h ra/nothing",
					}
		Say("B竛h Trung Thu c馻 b筺  l祄 xong. B筺 mu鑞 l蕐 ch髇g ra ch�? Nghe n鉯 khi nhi謙  l� l� 180  l� c� th� l蕐 b竛h ra, n誹 b筺 kh玭g bi誸 l祄 sao kh鑞g ch� nhi謙 , Kh竛h 觧 S� Gi� c� b竛 m閠 s� nguy猲 li謚 ch輓h, b筺 c� th� mua th� xem.",getn(selTab),selTab);
	elseif GetTask(TASK_FIREUP_TIME) == 0 then	--开始制作
		local selTab = {
					"Ta mu鑞 th� xem!/ask_main_res",
					"Sau n祔 s� th�!/nothing",
					}
		Say("B筺 mu鑞 b総 u l祄 b竛h Trung Thu? Ch� �: Th阨 gian l� c� hi謚 l鵦 l� <color=yellow>11/9 n 7/10<color>.",getn(selTab),selTab);	
	else	--制作过程中
		local selTab = {
					"Ta mu鑞 xem nhi謙  l�/see_temperature",
					"Ta mu鑞 th猰 nhi猲 li謚/ask_fuel",
					"Ta mu鑞 d飊g l� n祔/give_up",
					"Kh玭g c� g�/nothing",
					}
		local sTimeStr = "";
		if bTempChecked == 1 or nTimeElapse > 3*60 then	--如果看过温度或超过3分钟
			tremove(selTab,1);
		else
			sTimeStr = "Ch� �: Sau <color=yellow>"..Get_Time_String(COOKING_TIME-GetTime()+GetTask(TASK_FIREUP_TIME)-120).."<color> sau kh玭g th� 畂 nhi謙 ."
		end;
		Say("в t﹎ m韎 c� th� l祄 ra b竛h Trung Thu h秓 h筺g. Sau <color=yellow>"..Get_Time_String(COOKING_TIME-GetTime()+GetTask(TASK_FIREUP_TIME)).."<color> m韎 c� th� l蕐 b竛h ra."..sTimeStr,getn(selTab),selTab);
	end;
end;

function ask_main_res()	--询问加入什么主料
	local selTab = {
				"Ng.li謚 ch輓h1/#ask_sub_res(1)",
				"Ng.li謚 ch輓h2/#ask_sub_res(2)",
				"Ng.li謚 ch輓h3/#ask_sub_res(3)",
				"T筸 th阨 ch璦 c莕!/cancel",
				}
	Say("B筺 mu鑞 th猰 nguy猲 li謚 n祇 v祇?",getn(selTab),selTab);
end;

function ask_sub_res(nMainResType)	--询问加入什么辅料
	if nMainResType ~= 0 then
		if GetItemCount(tMaterial[nMainResType][2],tMaterial[nMainResType][3],tMaterial[nMainResType][4]) == 0  then
			Talk(1,"ask_main_res","B筺 kh玭g c� nguy猲 li謚 n祔!");
			return 0;
		end;
	end;
	SetTaskTemp(TT_MAIN_RES,nMainResType)
	local selTab = {
				"Ph� li謚1/#ask_fire_seed(1)",
				"Ph� li謚2/#ask_fire_seed(2)",
				"Ph� li謚3/#ask_fire_seed(3)",
				"T筸 th阨 ch璦 c莕!/cancel",
				}
	Say("B筺 mu鑞 cho ph� li謚 n祇 v祇?",getn(selTab),selTab);
end;

function ask_fire_seed(nSubResType)	--询问加入什么燃料
	if nSubResType ~= 0 then
		if GetItemCount(tMaterial[nSubResType+3][2],tMaterial[nSubResType+3][3],tMaterial[nSubResType+3][4]) == 0 then
			Talk(1,"#ask_sub_res("..GetTaskTemp(TT_MAIN_RES)..")","B筺 kh玭g c� lo筰 ph� li謚 n祔!");
			return 0;
		end;
	end;
	SetTaskTemp(TT_SUB_RES,nSubResType)
	local selTab = {
				"S� d鬾g than  t╪g nhi謙 /#final_confirm(1)",
				"D飊g c駃  t╪g nhi謙 /#final_confirm(2)",
				"T筸 th阨 ch璦 c莕!/cancel",
				}
	Say("B筺 mu鑞 d飊g lo筰 nhi猲 li謚 n祇  t╪g nhi謙  l�?",getn(selTab),selTab);
end;

function final_confirm(nFireSeedType)
	if GetItemCount(tMaterial[nFireSeedType+6][2],tMaterial[nFireSeedType+6][3],tMaterial[nFireSeedType+6][4]) == 0 then
		Talk(1,"#ask_fire_seed("..GetTaskTemp(TT_SUB_RES)..")","B筺 kh玭g c� lo筰 nhi猲 li謚 n祔");
		return 0;
	end;
	local selTab = {
				"уng �/begin_to_make",
				"Ta suy ngh� l筰!/cancel",
				}
	SetTaskTemp(TT_FIRE_SEED,nFireSeedType)
	local sContent = "";
	local nMainRes = GetTaskTemp(TT_MAIN_RES);
	local nSubRes = GetTaskTemp(TT_SUB_RES);
	local nFireSeed = nFireSeedType;
	sContent = sContent.."B筺  cho <color=yellow>"..tMaterial[nMainRes][1].."<color> v� <color=yellow>"..tMaterial[nSubRes+3][1].."<color> v祇,";
	sContent = sContent.."s� d鬾g <color=yellow>"..tMaterial[nFireSeed+6][1].."<color>  t╪g nhi謙  l�.";
	Say(sContent.."B筺 mu鑞 d飊g s� nguy猲 li謚 n祔  l祄 b竛h Trung Thu?",getn(selTab),selTab);
end;

function begin_to_make()
	local nRandTemp = 0;
	local nCurTemp = 0;
	local nMainRes = GetTaskTemp(TT_MAIN_RES);
	local nSubRes = GetTaskTemp(TT_SUB_RES);
	local nFireSeed = GetTaskTemp(TT_FIRE_SEED);
	if DelItem(tMaterial[nMainRes][2],tMaterial[nMainRes][3],tMaterial[nMainRes][4],1) == 1 and DelItem(tMaterial[nSubRes+3][2],tMaterial[nSubRes+3][3],tMaterial[nSubRes+3][4],1) == 1 and DelItem(tMaterial[nFireSeed+6][2],tMaterial[nFireSeed+6][3],tMaterial[nFireSeed+6][4],1) == 1 then
		if GetTaskTemp(TT_FIRE_SEED) == 1 then
			--nRandTemp = random(550,650);
			nRandTemp = 600;
		elseif GetTaskTemp(TT_FIRE_SEED) == 2 then
			--nRandTemp = random(250,350);
			nRandTemp = 300;
		end;
		SetTask(TASK_MAIN_RES,nMainRes);
		SetTask(TASK_SUB_RES,nSubRes);
		SetTask(TASK_FIREUP_TIME,GetTime());
		SetTask(TASK_ADD_FUEL_TIME,GetTime());
		SetTask(TASK_TEMPERATURE,nRandTemp);
		Talk(1,"","B筺  nh鉳 l鯽 l� th祅h c玭g, khi th猰 nhi猲 li謚 ch� � <color=yellow>nhi謙  c馻 l�<color>, ng  l鯽 t総 ho芻 b竛h ch竬 kh衪.");
	end;
end;

function cancel()
	SetTaskTemp(TT_MAIN_RES,0);
	SetTaskTemp(TT_SUB_RES,0);
	SetTaskTemp(TT_FIRE_SEED,0);
end;

function give_up()
	local selTab = {
				"уng �/confirm_give_up",
				"в ta suy ngh�!/OnUse",
				}
	Say("B筺 kh玭g mu鑞 d飊g l� n祔?",getn(selTab),selTab);
end;

function confirm_give_up()
	SetTask(TASK_MAIN_RES,0);
	SetTask(TASK_SUB_RES,0);
	SetTask(TASK_FIREUP_TIME,0);
	SetTask(TASK_ADD_FUEL_TIME,0);
	SetTask(TASK_TEMPERATURE,0);
	SetTask(TASK_TEMPERATURE_CHECKED,0);
	Say("B筺 c� th� b総 u l祄 b竛h l筰!",0);
end;

function ask_fuel()
	local selTab = {
				"Ta mu鑞 th猰 than/#add_fuel(1)",
				"Ta mu鑞 th猰 c駃/#add_fuel(2)",
				"Kh玭g c莕 u!/cancel",
				}
	Say("B筺 mu鑞 th猰 lo筰 nhi猲 li謚 n祇?",getn(selTab),selTab);
end;

function add_fuel(nFuelType)
	if GetItemCount(tMaterial[nFuelType+6][2],tMaterial[nFuelType+6][3],tMaterial[nFuelType+6][4]) == 0 then
		Talk(1,"OnUse","B筺 kh玭g c� lo筰 nhi猲 li謚 n祔");
		return 0;
	end;
	if DelItem(tMaterial[nFuelType+6][2],tMaterial[nFuelType+6][3],tMaterial[nFuelType+6][4],1) == 1 then
		local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
		local nRandTemp = 0;
		if nFuelType == 1 then
			--nRandTemp = random(550,650);
			nRandTemp = 600;
		else
			--nRandTemp = random(250,350);
			nRandTemp = 300;
		end;
		local nTotalTemp = nCurTemp+nRandTemp;
		if nTotalTemp > 900 then
			SetTask(TASK_MAIN_RES,0);
			SetTask(TASK_SUB_RES,0);
			SetTask(TASK_FIREUP_TIME,0);
			SetTask(TASK_ADD_FUEL_TIME,0);
			SetTask(TASK_TEMPERATURE,0);
			SetTask(TASK_TEMPERATURE_CHECKED,0);
			AddItem(tMoonCake[19][2],tMoonCake[19][1],tMoonCake[19][4],1);
			Say("Nhi謙  l� cao h琻 900 , b竛h Trung Thu  b� ch竬 h誸. B筺 nh薾 頲 1 <color=yellow>"..tMoonCake[19][1].."<color>",0);
			return 0;
		end;
		SetTask(TASK_TEMPERATURE,nTotalTemp);
		SetTask(TASK_ADD_FUEL_TIME,GetTime());
		Say("B筺  th猰 m閠 輙 nhi猲 li謚 v祇, nhi謙  l� t╪g l猲 <color=yellow>"..nRandTemp.."<color> ",0);
	end;
end;

function see_temperature()	--查看温度
	local selTab = {
				"уng �/confirm_see_temperature",
				"Ch璦 c莕 xem v閕!/OnUse",
				}
	Say("Trong qu� tr譶h l祄 b竛h ch� c� th� xem nhi謙  1 l莕, b筺 mu鑞 xem ch�?",getn(selTab),selTab);
end;

function confirm_see_temperature()
	local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
	SetTask(TASK_TEMPERATURE_CHECKED,1);
	Talk(1,"OnUse","Nhi謙  c馻 l� l�: <color=yellow>"..nCurTemp.."<color> ");
end;

function get_mooncake()
	local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
	local nMaterial1 = GetTask(TASK_MAIN_RES);
	local nMaterial2 = GetTask(TASK_SUB_RES);
	SetTask(TASK_MAIN_RES,0);
	SetTask(TASK_SUB_RES,0);
	SetTask(TASK_FIREUP_TIME,0);
	SetTask(TASK_ADD_FUEL_TIME,0);
	SetTask(TASK_TEMPERATURE,0);
	SetTask(TASK_TEMPERATURE_CHECKED,0);
	Give_MoonCake(nMaterial1,nMaterial2,nCurTemp);
end;

function get_temperature(nInitTemp,nElapseTime)	--根据初始温度和经过时间得到目前的温度
	local nTemp = 0;
	local nTime1 = sqrt((40000000+3)/nInitTemp);
	local nTime2 = nElapseTime + nTime1;
	nTemp = 40000000/(nTime2)^2 - 3;
	if nTemp < 0 then
		nTemp = 0;
	end; 
	return floor(nTemp)
end;

function open_stove()	--温度降到0度后打开炉子
	if random(1,100) < 50 then
		AddItem(tMoonCake[11][2],tMoonCake[11][3],tMoonCake[11][4],1);
		Say("B筺 nh薾 頲 1 <color=yellow>"..tMoonCake[11][1].."<color>, kh玭g bi誸 m飅 v� th� n祇?",0);
	else
		Say("B筺 ki觤 tra s� qua b竛h Trung Thu trong l� r錳 k誸 lu薾: B竛h Trung Thu n祔 kh玭g th� ╪ 頲 r錳!",0);
	end;
	SetTask(TASK_MAIN_RES,0);
	SetTask(TASK_SUB_RES,0);
	SetTask(TASK_FIREUP_TIME,0);
	SetTask(TASK_ADD_FUEL_TIME,0);
	SetTask(TASK_TEMPERATURE,0);
	SetTask(TASK_TEMPERATURE_CHECKED,0);
end;