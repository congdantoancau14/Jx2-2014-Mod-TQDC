
-- ====================== ÎÄ¼þÐÅÏ¢ ======================
-- ¶ÔÓ¦NPCÃû³Æ£ºÖÓ·Å
-- Edited by lizhi
-- 2005-8-4 21:37
-- ======================================================

Include("\\script\\task\\world\\lizhi_ÈªÖÝ\\task_head.lua")
Include("\\script\\task\\world\\lizhi_ÈªÖÝ\\18¼¶\\task_main.lua");
THIS_FILE = "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\ÖÓ·Å.lua";
npc_name = "<color=green>Chung Phãng<color>: ";

tbMaterials = {
	{"M¶nh thiªn th¹ch",{2,2,7},500},
	{"Thiªn th¹ch",{2,2,8},300},
	{"Thiªn th¹ch tinh th¹ch",{2,1,1009},500},
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
		local szSay = npc_name.."Sèng trªn ®êi ph¶i biÕt gi¶ ngu th× cuéc sèng sÏ yªn b×nh h¬n. L·o L­u næi tiÕng trªn giang hå mµ c¸c ng­¬i tõng biÕt cã tµi ®Þnh hån vµ c­êng hãa vò khÝ lªn ®Õn cÊp 7 ph¶i kh«ng? "
			.."ChØ cÇn ®­a cho ta "..szMaterial.."th× ta cã thÓ c­êng hãa trang bÞ cña ng­¬i, lªn cùc ®¹i ng­¬i cã tin kh«ng?";
		Say(szSay,2,
			"Thö míi biÕt ®­îc/try_force",
			"Lµm sao tin ®­îc/nothing"
		)
    end;
end;

function try_force()
	local MaxPutinCount = 1;
	PutinItemBox("C­êng hãa vËt phÈm", MaxPutinCount, npc_name.."Ng­¬i x¸c nhËn vËt phÈm ®· ®Æt vµo?", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if genre ~= 0 and (detail ~= 100 or detail ~= 101 or detail ~= 103 or (detail < 0 and detail > 14)) then 
		Talk(1,"",npc_name.."§­a trang bÞ vµo khay cho ta tr­íc. Nguyªn liÖu c­êng hãa cø ®Ó trong hµnh trang. Ta sÏ ®Õm cho ng­¬i sau khi kiÓm tra xong trang bÞ ®·.");
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
			print("error: thiÕu",t[i][1]);
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
	local nZhuangbeiLv = GetEquipLevel(nItemIndex); --»ñÈ¡µ±Ç°×°±¸µÈ¼¶
	local nLingqi = GetItemMaxLingQi(nItemIndex);   --»ñÈ¡ÁéÆøÖµ
	
	local nMofa1,nLv1 = GetItemAttr(nItemIndex,1)
	local nMofa2,nLv2 = GetItemAttr(nItemIndex,2)
	local nMofa3,nLv3 = GetItemAttr(nItemIndex,3)
	-- print("nMofa",nMofa1,nMofa2,nMofa3);
	
	if nEnhance == 15 then 
		Talk(1,"",npc_name.."Trang bÞ ®· ®¹t cùc ®¹i mµ ng­¬i cßn muèn c­êng hãa g× n÷a???")
		return 0;
	end
	
	if count_materials(tbMaterials) == 0 then 
		Talk(1,"",npc_name.."Ng­¬i chuÈn bÞ ch­a ®ñ nguyªn liÖu råi! Khi nµo ®ñ th× h·y quay l¹i.")
		return 0;
	else
		if del_materials(tbMaterials) ~= 1 then 
			Talk(1,"",npc_name.."H×nh nh­ cã sù gian lËn nµo ë ®©y!")
			print("error: del_materials failed!");
			return 0;
		end
	end
	
	if DelItemByIndex(nItemIndex,-1) ~= 1 then 
		Talk(1,"",npc_name.."H×nh nh­ cã sù gian lËn nµo ë ®©y!")
		print(format("error: DelItemByIndex(%d) failed!",nItemIndex))
		return 0;
	end
	local nAdd = AddItem(g,d,p,1,1,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,-1,15)
	if nAdd == 1 then 
		Talk(2,"",
			npc_name.."Trang bÞ cña ng­¬i ®©y!",
			player.."Qu¶ thËt lîi h¹i! §a t¹ tiÒn bèi!"
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
			-- WriteLog(GetName().."§æi Thµnh Chñ kim Ên;"..(8013+nBody))
		-- end
	-- end
	return 1;
end;

function player_talk()
	Talk(1,"",player.."§a t¹ tiÒn bèi! ThËt kh«ng ngê!")
end;

function nothing() end;