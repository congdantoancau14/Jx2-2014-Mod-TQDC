Include("\\script\\lib\\globalfunctions.lua")
-- Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
-- Include("\\script\\task_access_code_def.lua")
-- Include("\\script\\lib\\define.lua")


--==========================================================================================
tAllowItemList = {
	{0,103,-1, "Trang bT ??u"},  --¨ª¡¤2?¡Á¡ã¡À?
	{0,108,-1, "Trang bT ??u"},	 --¨ª¡¤2?¡Á¡ã¡À?
	{0,100,-1, "Trang bT tran"},
	{0,109,-1, "Trang bT tran"},
	{0,101,-1, "Trang bT d-¨ªi"},
	{0,110,-1, "Trang bT d-¨ªi"},
	{0,102,-1, "Gi¨ªi ch?"},
	{0,{0,14},-1, "V¨° khY"}, --???¡Â????
	{0,105,-1, "M¡¤"},
	{0,107,-1, "M?t tTch"},
	{0,112,-1, "M?t tTch"},
	{2,15,10, "Tan"},
	{2,3,7, "X? L?i Kim ??n"}, --¨¦¨¢¨¤??e¦Ì¡è
	{2,3,6}, --?¨²1?
	{2,3,222, "Tinh Luy?n Huy¨°n Thi?t"},
	{2,97,6, "Thian H-?ng Hoa"},
	{2,97,7, "Thanh L-?ng Th?o"},
	{2,97,8, "Tri¨°u Thian Tiau"},
	{2,97,9, "Qu? Hoa Ng-"},
	{2,97,10, "H?ng S?n Qu?"},
	{2,20,-1, "¡ìiau"},
	{2,0,1063, "Th?n M¨¦c V-?ng ¡ì?nh"},
	{2,3,4, "Ph? Ma Ch¨®"},
	{2,3,12, "Thian Ph?t Ch?u"},
--	{0,113,-1, "??¨º?"},
--	{0,114,-1, "??¨º?"},
--	{0,115,-1, "??¨º?"},
--	{0,116,-1, "??¨º?"},
	{2,11,-1, "?m khY"},
	{0,118,1},
	{0,118,2},
	{0,118,3},
	{0,117,1},
	{0,117,2},
	{0,117,3},
	{0,119,-1},
	{0,120,-1},
	{0,121,-1},
	{0,122,-1},
	
	{0,152,-1, "?o Cho¦Ìng"},
	{0,153,-1, "Huy Hi?u"},
	{0,154,-1, "Gi¦Ìy"},
	{2,97,236, "Thian Kiau L?nh"},
};

--??¨®¨¨???¡¤??¦Ì£¤
--?¨´?Y¨¢¡Â?¨¦??¨®¨¨¡ê?¦Ì¨²3¨¢D?a¨¢¡Â?¨¦¡ê?0?a?¨´¨®D¨¢¡Â?¨¦
tGiveItemList = {
	{{1,0,125,999},"Tiau Dao B1ch V?n T?n",0},
	{{1,0,126,999},"Tiau Dao V?n C¨¨m T?c",0},
	{{1,0,127,999},"Tiau Dao ¡ìo1n T?c Cao",0},
	{{1,0,128,999},"Tiau Dao ¡ì1i Ho¦Ìn ¡ì?n",0},
	{{1,0,129,999},"Tiau Dao Ph?c Th?y ¡ì?n",0},
	{{1,0,130,999},"Tiau Dao Quy Nguyan ¡ì?n",0},
	{{1,0,131,999},"Tiau Dao Ng?c Linh T?n",0},
	{{1,0,132,999},"Tiau Dao Ng?c L¨¦ Ho¦Ìn",0},
	{{1,0,133,999},"Tiau Dao T1o H?a T?n",0},
	{{1,0,134,999},"Tiau Dao C?u Chuy¨®n ¡ì?n",0},
	{{1,7,46,999},"Tiau Dao Ph? (H¨¢a K¨² L?n)",20},
	{{1,7,154,999},"Tiau Dao Ph? (Li?t Nham Li Long)",20},
	{{1,7,148,999},"Tiau Dao Ph? (Th-?ng Th?n Doanh Thian)",20},
	{{1,7,147,999},"Tiau Dao Ph? (B?c L?c L?m Minh Ch?)",20},
	{{1,7,10000,999},"Tiau Dao Ph? (Ng¨¦u nhian)",20},
	{{2,0,1063,1}, "Th?n M¨¦c V-?ng ¡ì?nh",21},
};

function OnUse()
	-- Say("",2,"Xãa/Del_Item_By_List","Kh«i phôc/Add_Item_By_List");
	print(Check_Item_By_List(2,1,1));
end;

function Del_Item_By_List()
	local tAllItem = GetAllItem(); --¨ª??¨°¨¦¨ª¨¦??¨´¨®D???¡¤¡ê¡§¡ã¨¹¨¤¡§2??a¡ê??¡Â¨°y
	local nID1,nID2,nID3 = 0,0,0;
	local nCount = 0;
	for i,v in tAllItem do
		nID1,nID2,nID3 = GetItemInfoByIndex(v);
		nCount = BigGetItemCount(nID1,nID2,nID3);
		if nCount ~= 0 then
			local nCheckItem = Check_Item_By_List(nID1,nID2,nID3);
			if nCheckItem == 0 then
				BigDelItem(nID1,nID2,nID3,nCount);
			end
		end
		-- Check_SuohunEquip(v); --?¨¬2¨¦???¨º??¨º?
	end
	-- for i = 0,16 do --¡ä?¡Á?¦Ì????¨º
		-- local nEquipIdx = GetPlayerEquipIndex(i);
		-- -- Check_SuohunEquip(nEquipIdx);
	-- end
end

function Check_Item_By_List(nID1,nID2,nID3)
	local tID = {nID1,nID2,nID3};
	for i = 1,getn(tAllowItemList) do
		local nCheck = 0;
		for j = 1,3 do
			if tAllowItemList[i][j] ~= -1 then
				if type(tAllowItemList[i][j]) == "table" then
					if tAllowItemList[i][j][1] > tID[j] or tAllowItemList[i][j][2] < tID[j] then
						nCheck = 1;
						break;
					end
				elseif tAllowItemList[i][j] ~= tID[j] then
					nCheck = 1;
					break;
				end
			end
		end
		if nCheck == 0 then --?£¤??
			return 1;
		end
	end
	return 0;
end

function Add_Item_By_List()
	local nRoute = GetPlayerRoute();
	for i = 1,getn(tGiveItemList) do
		if gf_Judge_Room_Weight(1,100) == 1 and GetItemCount(tGiveItemList[i][1][1], tGiveItemList[i][1][2], tGiveItemList[i][1][3]) == 0 then
			if tGiveItemList[i][3] == 0 then
				gf_AddItemEx(tGiveItemList[i][1],tGiveItemList[i][2]);
			elseif nRoute == tGiveItemList[i][3] then
				gf_AddItemEx(tGiveItemList[i][1],tGiveItemList[i][2]);
			end
		end
	end
end



