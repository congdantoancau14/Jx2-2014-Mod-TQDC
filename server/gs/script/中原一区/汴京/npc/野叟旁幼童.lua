--function main()
--	Talk(1,"","<color=green>幼童<color>：我肚子好饿……")
--end;

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho箃 ng trung thu : ".."Ti觰 ng"		--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>Ti觰 ng<color>: "
szSexName = "";

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	szSexName = getSex();
	local selTab = {
				"Ta s� 搇� x讛 cho ,  i cho ta 1 c﹜ N課 V祅g nh�!/bug_candle",
				"Ta s� quay l筰 sau.!/no",
				}
	Say(g_szInfoHead..szSexName.." t譵  c� chuy謓 g� sao?",getn(selTab),selTab);
end

function bug_candle()
	if GetCash() < 1000 then
		Say(g_szInfoHead..format("е kh玭g i u v� %s ch璦 l� x� cho .",szSexName),1,"! Ta qu猲 m蕋./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead..szSexName.." tay c緋 n竎h mang th� kia th� c� 1 c﹜ n課 c騨g ch糿g c莔 th猰 頲 u!")
		return
	end
	if pay_ex(1000) == 1 then
		add_item_ex("N課 v祅g",2,1,30029,1)
	else
		Say(g_szInfoHead..format("е kh玭g i u v� %s ch璦 l� x� cho .",szSexName),1,"! Ta qu猲 m蕋./no")
		return
	end
end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Pay("..nNum..") Failed, return value = "..nRetCode);
		return 0
	end
end

function getSex()
	local sex = GetSex();
	if sex == 1 then 
		return "i ca";
	elseif sex == 2 then
		return "i t�";
	else
		return "i hi謕";
	end
end;

function no()
end

