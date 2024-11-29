
-- ====================== �ļ���Ϣ ======================
-- ��ӦNPC���ƣ��ӷ�
-- Edited by lizhi
-- 2005-8-4 21:37
-- ======================================================

Include("\\script\\task\\world\\lizhi_Ȫ��\\task_head.lua")
Include("\\script\\task\\world\\lizhi_Ȫ��\\18��\\task_main.lua");
THIS_FILE = "\\script\\������\\Ȫ��\\npc\\�ӷ�.lua";
npc_name = "<color=green>Chung Ph�ng<color>: ";

tbMaterials = {
	{"M�nh thi�n th�ch",{2,2,7},500},
	{"Thi�n th�ch",{2,2,8},300},
	{"Thi�n th�ch tinh th�ch",{2,1,1009},500},
}

player = ""

function main()
    player = format("<color=green>%s<color>: ",GetName())
	
    local nLevel = 0;
    local nStep = 0;
    
    nStep = GetTask(TASK_LEV_18_ID);
    if (nStep == 100) then
        task_000_00();
    elseif (nStep == 1) then
        task_001_01();
    elseif (nStep == 2) then
        task_002_00();
    elseif (nStep == 3 or nStep == 4) then
        task_003_01();
    else
		local szMaterial = "";
		for i=1,getn(tbMaterials) do 
			szMaterial = szMaterial..format("<color=yellow>%d %s<color>, ",tbMaterials[i][3],tbMaterials[i][1])
		end
        -- can_not_accept_task();
		local szSay = npc_name.."S�ng tr�n ��i ph�i bi�t gi� ngu th� cu�c s�ng s� y�n b�nh h�n. L�o L�u n�i ti�ng tr�n giang h� m� c�c ng��i t�ng bi�t c� t�i ��nh h�n v� c��ng h�a v� kh� l�n ��n c�p 7 ph�i kh�ng? "
			.."Ch� c�n ��a cho ta "..szMaterial.."th� ta c� th� c��ng h�a trang b� c�a ng��i, l�n c�c ��i ng��i c� tin kh�ng?";
		Say(szSay,2,
			"Th� m�i bi�t ���c/try_force",
			"L�m sao tin ���c/nothing"
		)
    end;
end;

function try_force()
	local MaxPutinCount = 1;
	PutinItemBox("C��ng h�a v�t ph�m", MaxPutinCount, npc_name.."Ng��i x�c nh�n v�t ph�m �� ��t v�o?", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if genre ~= 0 and (detail ~= 100 or detail ~= 101 or detail ~= 103 or (detail < 0 and detail > 14)) then 
		Talk(1,"",npc_name.."��a trang b� v�o khay cho ta tr��c. Nguy�n li�u c��ng h�a c� �� trong h�nh trang. Ta s� ��m cho ng��i sau khi ki�m tra xong trang b� ��.");
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
	force_item(t[1]);
end

function count_materials(t)
	local nRes = 1;
	for i=1,getn(t) do 
		if GetItemCount(t[i][2][1],t[i][2][2],t[i][2][3]) < t[i][3] then 
			print("error: thi�u",t[i][1]);
			nRes = 0;
			break;
		end
	end
	return nRes;
end;

function del_materials(t)
	local nRes = 1;
	for i=1,getn(t) do 
		if DelItem(t[i][2][1],t[i][2][2],t[i][2][3],t[i][3]) ~= 1 then 
			nRes = 0;
			break;
		end
	end
	return nRes;
end;

function force_item(tItem)
	
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
	
	if nEnhance == 15 then 
		Talk(1,"",npc_name.."Trang b� �� ��t c�c ��i m� ng��i c�n mu�n c��ng h�a g� n�a???")
		return 0;
	end
	
	if count_materials(tbMaterials) == 0 then 
		Talk(1,"",npc_name.."Ng��i chu�n b� ch�a �� nguy�n li�u r�i! Khi n�o �� th� h�y quay l�i.")
		return 0;
	else
		if del_materials(tbMaterials) ~= 1 then 
			Talk(1,"",npc_name.."H�nh nh� c� s� gian l�n n�o � ��y!")
			print("error: del_materials failed!");
			return 0;
		end
	end
	
	if DelItemByIndex(nItemIndex,-1) ~= 1 then 
		Talk(1,"",npc_name.."H�nh nh� c� s� gian l�n n�o � ��y!")
		print(format("error: DelItemByIndex(%d) failed!",nItemIndex))
		return 0;
	end
	local nAdd = AddItem(g,d,p,1,1,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,-1,15)
	if nAdd == 1 then 
		Talk(2,"",
			npc_name.."Trang b� c�a ng��i ��y!",
			player.."Qu� th�t l�i h�i! �a t� ti�n b�i!"
		)
	else
		print("error: Added item failed!");
		return 0;
	end

	-- local nScrollIndex = tonumber(nItemIndex)
	-- local nLeft = AbradeItem(nScrollIndex, 0)
	-- AbradeItem(nScrollIndex, -10)
	
	-- if DelItemByIndex(nRightIdx, -1) == 1 then
		-- local nRet, nAddIdx = AddItem(0,102,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
		-- if nRet == 1 and nAddIdx > 0 then
			-- SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
			-- WriteLog(GetName().."��i Th�nh Ch� kim �n;"..(8013+nBody))
		-- end
	-- end
	return 1;
end;

function player_talk()
	Talk(1,"",player.."�a t� ti�n b�i! Th�t kh�ng ng�!")
end;

function nothing() end;