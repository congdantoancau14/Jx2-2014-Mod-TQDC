--function main()
--	Talk(1,"","<color=green>��ͯ<color>���Ҷ��Ӻö�����")
--end;

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho�t ��ng trung thu : ".."Ti�u ��ng"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>Ti�u ��ng<color>: "
szSexName = "";

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	szSexName = getSex();
	local selTab = {
				"Ta s� �l� xה cho ��, �� ��i cho ta 1 c�y N�n V�ng nh�!/bug_candle",
				"Ta s� quay l�i sau.!/no",
				}
	Say(g_szInfoHead..szSexName.." t�m �� c� chuy�n g� sao?",getn(selTab),selTab);
end

function bug_candle()
	if GetCash() < 1000 then
		Say(g_szInfoHead..format("�� kh�ng ��i ��u v� %s ch�a l� x� cho ��.",szSexName),1,"�i! Ta qu�n m�t./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead..szSexName.." tay c�p n�ch mang th� kia th� c� 1 c�y n�n c�ng ch�ng c�m th�m ���c ��u!")
		return
	end
	if pay_ex(1000) == 1 then
		add_item_ex("N�n v�ng",2,1,30029,1)
	else
		Say(g_szInfoHead..format("�� kh�ng ��i ��u v� %s ch�a l� x� cho ��.",szSexName),1,"�i! Ta qu�n m�t./no")
		return
	end
end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
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
		return "��i ca";
	elseif sex == 2 then
		return "��i t�";
	else
		return "��i hi�p";
	end
end;

function no()
end

