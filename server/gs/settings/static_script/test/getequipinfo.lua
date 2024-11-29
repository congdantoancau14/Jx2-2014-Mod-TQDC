
THIS_FILE = "\\settings\\static_script\\test\\getequipinfo.lua";

function OnUse()
	showtray();
end;

function main()

    GEI_Showtray();
end;

function GEI_Showtray()

	local MaxPutinCount = 5;
	PutinItemBox("Hi�n thu�c t�nh trang b�", MaxPutinCount, "X�c nh�n v�t ph�m �� ��t v�o?", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if genre ~= 0 and (detail ~= 100 or detail ~= 101 or detail ~= 103 or (detail < 0 and detail > 14)) then 
		Talk(1,"","Trang b� kh�ng ph� h�p!");
		return 0;
	end
	return 1;
end
	
function OnPutinComplete(param)
	if param ~= 1 then
		return 0;
	end
	local t = GetPutinItem()
	
	-- for i=1, getn(t) do
		-- for j=1,getn(t[i]) do
			-- print(format("t[%d][%d] = ",i,j)..t[i][j]);
		-- end
	-- end
	
	-- local tItem = {t[1][5],{t[1][2],t[1][3],t[1][4]}}
	showEquipInfo(t[1]);
end



function showEquipInfo(tItem)
	
	local nItemIndex = tItem[1];
	local g,d,p = tItem[2],tItem[3],tItem[4];
	-- print(g,d,p);
	-- local nItemIndex = GetItemIndex(g,d,p);
	local szItemName = tItem[5];
	local nEnhance = GetEquipAttr(nItemIndex,2)
	local nIsDing7 = GetItemSpecialAttr(nItemIndex,"DING7")
	local nIsDing10 = GetItemSpecialAttr(nItemIndex,"DING10")
	local nZhuangbeiLv = GetEquipLevel(nItemIndex); --��ȡ��ǰװ���ȼ�
	local nLingqi = GetItemMaxLingQi(nItemIndex);   --��ȡ����ֵ
	
	local nMofa1,nLv1 = GetItemAttr(nItemIndex,1)
	local nMofa2,nLv2 = GetItemAttr(nItemIndex,2)
	local nMofa3,nLv3 = GetItemAttr(nItemIndex,3)
	-- print("nMofa",nMofa1,nMofa2,nMofa3);
	local nScrollIndex = tonumber(nItemIndex)
	local nLeft = AbradeItem(nScrollIndex, 0)
	
	local string = "\n----------- Th�ng tin trang b� -----------\n"
		..format("Name: <color=gold>%s<color>\n",szItemName)
		..format("gdp: [ %d,%d,%d ]\n",g,d,p)
		..format("C��ng h�a: %d\n",nEnhance)
		..format("��nh h�n 7: %d\n",nIsDing7)
		..format("��nh h�n 10: %d\n",nIsDing10)
		..format("C�p trang b�: %d\n",nZhuangbeiLv)
		..format("Linh kh�: %d\n",nLingqi)
		..format("Thu�c t�nh 1/Level: %d/%d\n",nMofa1,nLv1)
		..format("Thu�c t�nh 2/Level: %d/%d\n",nMofa2,nLv2)
		..format("Thu�c t�nh 3/Level: %d/%d\n",nMofa3,nLv3)
		..format("�� hao m�n/Level: %d\n",nLeft)
		.."------------------------------------------";
		
	Talk(1,"",string);
	print(string);
	local file = openfile("equipinfo.txt","w");
	write(file,string);
	closefile(file);
	
	--local nAdd = AddItem(g,d,p,1,1,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,-1,15)


	-- AbradeItem(nScrollIndex, -10)
	
	-- if DelItemByIndex(nRightIdx, -1) == 1 then
		-- local nRet, nAddIdx = AddItem(0,102,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
		-- if nRet == 1 and nAddIdx > 0 then
			-- SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
			-- WriteLog(GetName().."��i Th�nh Ch� kim �n;"..(8013+nBody))
		-- end
	-- end
	
	local nEquipPos = 0
	
	local nEquipIDX = GetPlayerEquipIndex(nEquipPos)
	local szItemName = GetItemName(tEquipInfo[1], tEquipInfo[2], tEquipInfo[3])
	local nEquipG, nEquipD, nEquipP = GetPlayerEquipInfo(nEquipPos)
	
	local nEquipEnhance = GetEquipAttr(nEquipIDX, 2)
	local nEquipEnhanceFail = GetEquipAttr(nEquipIDX, 3)

	if 1 == _JX2WZ then
		nEquipDing5 = GetItemSpecialAttr(nEquipIDX, "DING5")
	end


	nEquipLingqi = GetItemMaxLingQi(nEquipIDX)
	if 0 >= nEquipLingqi then
		Talk(1, "", format("[%s] kh�ng ph�i l� trang b� B�t Qu�i.", szItemName))
		return 0
	end
	local nAttribute, _ = GetItemAttr(nEquipIDX, 1)
	if 0 ~= nAttribute then
		Talk(1, "", format("H�y r�t Linh Th�ch trong [%s] mang tr�n ng��i.", szItemName))
		return
	end

	if 1 == GetItemSpecialAttr(nIndex, "LOCK") then
		Talk(1, "", format("�� ��m b�o t�i s�n c�a c�c h�, h�y m� kh�a [%s].", szItemName))
		return 0
	end

	return 1;
end;

function ItemLockAlert()
	local isfirst, haveitemunlock, bForceUnlock = GetItemLockStatus()
	if isfirst > 0 then
		Say("H� th�ng kh�a v�t ph�m gi�p b�o qu�n t�i kho�n \n Trong h�nh trang th�m n�t kh�a v�t ph�m, ch� c�n thi�t l�p m�t m� ban ��u l� c� th� kh�a v�t ph�m. �� bi�t th�m chi ti�t nh�n F1.", 0)
	end

	if haveitemunlock > 0 then
		Msg2Player("B�n hi�n c� v�t ph�m �ang m� kh�a")
	end

	if bForceUnlock > 0 then
		Msg2Player("Trang b� kh�a �ang � tr�ng th�i ch� ��nh m�")
	end
end

