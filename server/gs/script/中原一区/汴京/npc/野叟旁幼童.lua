--function main()
--	Talk(1,"","<color=green>Ó×Í¯<color>£ºÎÒ¶Ç×ÓºÃ¶ö¡­¡­")
--end;

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho¹t ®éng trung thu : ".."TiÓu ®ång"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szInfoHead = "<color=green>TiÓu ®ång<color>: "
szSexName = "";

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	szSexName = getSex();
	local selTab = {
				"Ta sÏ “l× x×” cho ®Ö, ®Ö ®æi cho ta 1 c©y NÕn Vµng nhÐ!/bug_candle",
				"Ta sÏ quay l¹i sau.!/no",
				}
	Say(g_szInfoHead..szSexName.." t×m ®Ö cã chuyÖn g× sao?",getn(selTab),selTab);
end

function bug_candle()
	if GetCash() < 1000 then
		Say(g_szInfoHead..format("§Ö kh«ng ®æi ®©u v× %s ch­a l× x× cho ®Ö.",szSexName),1,"¤i! Ta quªn mÊt./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead..szSexName.." tay c¾p n¸ch mang thÕ kia th× c¶ 1 c©y nÕn còng ch¼ng cÇm thªm ®­îc ®©u!")
		return
	end
	if pay_ex(1000) == 1 then
		add_item_ex("NÕn vµng",2,1,30029,1)
	else
		Say(g_szInfoHead..format("§Ö kh«ng ®æi ®©u v× %s ch­a l× x× cho ®Ö.",szSexName),1,"¤i! Ta quªn mÊt./no")
		return
	end
end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
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
		return "®¹i ca";
	elseif sex == 2 then
		return "®¹i tû";
	else
		return "®¹i hiÖp";
	end
end;

function no()
end

