Include("\\script\\mod\\expand_box\\expand_box_head.lua");
Include("\\script\\mod\\store_box\\store_box_head.lua");
THIS_FILE = "\\script\\mod\\expand_box\\expand_box.lua";

g_tbInBagItems = {}
g_nStoreId = STORE_ID_EXPAND_BOX;

function main()
	if GetItemCount(key[1],key[2],key[3]) < 1 then 
		Talk(1,"","Kh«ng cã ch×a khãa, kh«ng thÓ më r­¬ng!\n(<color=gray>Thö hái thñ khè xem sao.<color>)");
		return 0;
	end
	local nNpcIndex = GetTargetNpc();
	local m,x,y = GetNpcWorldPos(nNpcIndex);
	
	--print(GetNpcName(nNpcIndex));
	--print(getBoxId(m,x-3,y).."-"..GetTask(TASK_BOX_ID));
	
	if GetNpcName(nNpcIndex) == "R­¬ng ®å" and getBoxId(m,x-3,y) == GetTask(TASK_BOX_ID) then
		OpenBox();
		return 1;
	end
	
	-- print(getBoxId(m,x,y));
	if getBoxId(m,x,y) ~= GetTask(TASK_BOX_ID) then 
		Talk(1,"","Kh«ng ®óng ch×a khãa, kh«ng thÓ më r­¬ng!");
		return 0;
	end
	
	
	--if DelItem(key[1],key[2],key[3],1) ~= 1 then
		--Talk(1,"","Kh«ng cã ch×a khãa, kh«ng thÓ më r­¬ng!\n(<color=gray>Thö hái thñ khè xem sao.<color>)");
		--return 0;
	--end
	
	init(1);
	
	local tbSay = {
		"\n>> §Æt vµo khay/putintray",
		"\n>> CÊt ®å vµo/showThingsIn",
		"\n>> LÊy ®å ra/showThingsOut",
		"\n>> §Ëy r­¬ng l¹i/nothing",
	}
	Say("",getn(tbSay),tbSay);
end;

-------------------------------------------------------------------------------
function putintray()
	PutinItemBox("CÊt ®å vµo r­¬ng", MaxPutinCount, "X¸c nhËn ®Æt ®å vµo r­¬ng", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if GetItemSpecialAttr(idx,"LOCK") == 1 then --Ëø¶¨ÅÐ¶Ï
		Talk(1,"","VËt phÈm ®· khãa kh«ng thÓ cÊt vµo r­¬ng!");
		return 0;
	end
	if genre ~= 2 then 
		Talk(1,"","VËt nµy kh«ng phï hîp cÊt vµo r­¬ng.");
		return 0;
	end
	
	local nCount = GetItemParam(idx, 1) -- Get from archive_box.lua, seem not to work
	local nItemMapID = GetItemParam(idx, 0)
	
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
	
	xb_puttrayin(t,g_nStoreId);
	
end


-------------------------------------------------------------------------------

nPageIn = 1;

function showThingsIn(nNav)
	if nNav == nil then
		nNav = 0;
		nPageIn = 1;
	end
	
	g_tbInBagItems = getAllowItems();
	
	local tExceptItems = {{"Ch×a Khãa R­¬ng",{2,1,29005}}} -- only for expand_box (store-box) not for carriage
	g_tbInBagItems = removeItemsFromTable(tExceptItems, g_tbInBagItems)
	
	--print(getn(g_tbInBagItems))
	local t = g_tbInBagItems;

	nPageIn = xb_generateNavigation(g_nStoreId,nPageIn,nNav,t,DIRECT_PUTIN);
	
end;

nPageOut = 1;

function showThingsOut(nNav)
	if nNav == nil or nNav == 0 then
		nNav = 0;
		nPageOut = 1;
	end
	
	local t = TB_ITEMS;
	
	nPageOut = xb_generateNavigation(g_nStoreId,nPageOut,nNav,t,DIRECT_TAKEOUT);
	
end;

function putthispage(nBegin,nEnd)
	xb_putthispage(g_tbInBagItems,nBegin,nEnd,g_nStoreId,nNpcIndex)
end;

function putonein(nInTableItemIndex)
	xb_putonein(g_tbInBagItems,nInTableItemIndex,g_nStoreId,nNpcIndex)
end;

function putallin()
	xb_putallin(g_tbInBagItems,g_nStoreId,nNpcIndex)
end;

function takethispage(nBegin,nEnd)
	xb_takethispage(nBegin,nEnd,g_nStoreId,nNpcIndex)
end;

function takeoneout(nInTableItemIndex)
	xb_takeoneout(nInTableItemIndex,g_nStoreId,nNpcIndex)
end;

function takeallout()
	xb_takeallout(g_nStoreId,nNpcIndex)
end;

--function nothing() end; Disable this line to use store_box_head.lua/nothing() function to recover the key