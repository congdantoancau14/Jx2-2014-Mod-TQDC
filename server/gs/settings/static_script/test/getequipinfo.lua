
THIS_FILE = "\\settings\\static_script\\test\\getequipinfo.lua";

function OnUse()
	showtray();
end;

function main()

    GEI_Showtray();
end;

function GEI_Showtray()

	local MaxPutinCount = 5;
	PutinItemBox("Hi÷n thuÈc t›nh trang bﬁ", MaxPutinCount, "X∏c nhÀn vÀt ph»m Æ∑ Æ∆t vµo?", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if genre ~= 0 and (detail ~= 100 or detail ~= 101 or detail ~= 103 or (detail < 0 and detail > 14)) then 
		Talk(1,"","Trang bﬁ kh´ng phÔ hÓp!");
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
	local nZhuangbeiLv = GetEquipLevel(nItemIndex); --ªÒ»°µ±«∞◊∞±∏µ»º∂
	local nLingqi = GetItemMaxLingQi(nItemIndex);   --ªÒ»°¡È∆¯÷µ
	
	local nMofa1,nLv1 = GetItemAttr(nItemIndex,1)
	local nMofa2,nLv2 = GetItemAttr(nItemIndex,2)
	local nMofa3,nLv3 = GetItemAttr(nItemIndex,3)
	-- print("nMofa",nMofa1,nMofa2,nMofa3);
	local nScrollIndex = tonumber(nItemIndex)
	local nLeft = AbradeItem(nScrollIndex, 0)
	
	local string = "\n----------- Th´ng tin trang bﬁ -----------\n"
		..format("Name: <color=gold>%s<color>\n",szItemName)
		..format("gdp: [ %d,%d,%d ]\n",g,d,p)
		..format("C≠Íng h„a: %d\n",nEnhance)
		..format("ßﬁnh hÂn 7: %d\n",nIsDing7)
		..format("ßﬁnh hÂn 10: %d\n",nIsDing10)
		..format("C p trang bﬁ: %d\n",nZhuangbeiLv)
		..format("Linh kh›: %d\n",nLingqi)
		..format("ThuÈc t›nh 1/Level: %d/%d\n",nMofa1,nLv1)
		..format("ThuÈc t›nh 2/Level: %d/%d\n",nMofa2,nLv2)
		..format("ThuÈc t›nh 3/Level: %d/%d\n",nMofa3,nLv3)
		..format("ßÈ hao mﬂn/Level: %d\n",nLeft)
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
			-- WriteLog(GetName().."ßÊi Thµnh ChÒ kim  n;"..(8013+nBody))
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
		Talk(1, "", format("[%s] kh´ng ph∂i lµ trang bﬁ B∏t Qu∏i.", szItemName))
		return 0
	end
	local nAttribute, _ = GetItemAttr(nEquipIDX, 1)
	if 0 ~= nAttribute then
		Talk(1, "", format("H∑y rÛt Linh Thπch trong [%s] mang tr™n ng≠Íi.", szItemName))
		return
	end

	if 1 == GetItemSpecialAttr(nIndex, "LOCK") then
		Talk(1, "", format("ß” Æ∂m b∂o tµi s∂n cÒa c∏c hπ, h∑y mÎ kh„a [%s].", szItemName))
		return 0
	end

	return 1;
end;

function ItemLockAlert()
	local isfirst, haveitemunlock, bForceUnlock = GetItemLockStatus()
	if isfirst > 0 then
		Say("H÷ thËng kh„a vÀt ph»m giÛp b∂o qu∂n tµi kho∂n \n Trong hµnh trang th™m nÛt kh„a vÀt ph»m, chÿ c«n thi’t lÀp mÀt m∑ ban Æ«u lµ c„ th” kh„a vÀt ph»m. ß” bi’t th™m chi ti’t nh n F1.", 0)
	end

	if haveitemunlock > 0 then
		Msg2Player("Bπn hi÷n c„ vÀt ph»m Æang mÎ kh„a")
	end

	if bForceUnlock > 0 then
		Msg2Player("Trang bﬁ kh„a Æang Î trπng th∏i chÿ Æﬁnh mÎ")
	end
end

