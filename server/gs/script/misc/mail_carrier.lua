-- mail_carrier.lua
-- ÓÊµÝÔ±

--Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\mod\\expand_box\\expand_box_head.lua");
MAX_ITEM = MAX_CARRIAGE_ITEMS;
g_tbInBagItems = {}
g_nStoreId = STORE_ID_MAIL;
nNpcIndex = nil;
szStoreFileName = "unknown";
player_rolename = "";
outboxfilepath = "";
inboxfilepath = "";
g_send_to = "";
g_storebox = "";
g_mailboxname = "";

THE_FILE = "\\script\\misc\\mail_carrier.lua";
NPC_NAME = "<color=green>Chñ B­u côc<color>: ";

g_tSenders = {}

------------------------------------------------------------------------
function main()
	player_rolename = GetName();
	player_rolename = totelex(player_rolename);
	
	local tSays = {
		"Ta muèn göi Ýt ®å/sendthing",
		"Ta ®Õn nhËn ®å/takething",
		"Quay l¹i sau!/nothing"
	}
	
	Say( NPC_NAME.."Quý kh¸ch ®Õn nhËn th­ ph¶i kh«ng?",getn(tSays),tSays);
end;
------------------------------------------------------------------------
function sendthing()
	local tSays = {
		"Ta muèn göi Ýt ®å, l¸t cã ng­êi ®Õn lÊy/sendtemp",
		"Ta muèn göi cho ng­êi cã tªn.../sendto",
		"Quay l¹i sau!/nothing"
	}
	
	Say( NPC_NAME.."Quý kh¸ch muèn göi cho ai?",getn(tSays),tSays);
end;

function sendtemp()
	--szStoreFileName = player_rolename.."/"..player_rolename;
	g_storebox = "temp";
	szStoreFileName = format("%s/%s.txt",g_storebox,player_rolename);
	outboxfilepath = g_tbDirectoryName[g_nStoreId]..player_rolename.."/outbox.txt";
	g_send_to = "temp";
	inboxfilepath = g_tbDirectoryName[g_nStoreId]..g_send_to.."/senders.txt";
	makeDirectory(g_tbDirectoryName[g_nStoreId]..player_rolename.."/");
	makeDirectory(g_tbDirectoryName[g_nStoreId]..g_storebox.."/");
	-- init(g_nStoreId);	-- Store items with player rolename as filename
	init(g_nStoreId,szStoreFileName); -- Store items with npcindex as filename
	--init(g_nStoreId,0); -- Store items with playername npcindex as filename
	
	putintray();
end;

-------------------------------------------------------------------------------

function sendto()
	AskClientForString("_sendto_callback", "Tªn ng­êi nhËn", 1, 32, "NhËp tªn ng­êi nhËn");
end;

function _sendto_callback(szInput)
	g_send_to = totelex(szInput);
	-- print("["..g_send_to.."]");
	-- Msg2Player(g_send_to);
	outboxfilepath = g_tbDirectoryName[g_nStoreId]..player_rolename.."/outbox.txt";
	inboxfilepath = g_tbDirectoryName[g_nStoreId]..g_send_to.."/inbox.txt";
	makeDirectory(g_tbDirectoryName[g_nStoreId]..player_rolename.."/");
	makeDirectory(g_tbDirectoryName[g_nStoreId]..g_send_to.."/");
	g_storebox = g_send_to;
	szStoreFileName = format("%s/%s.txt",g_storebox,player_rolename);
	-- do this before call to init() function because the szStoreFileName will become filename there
	makeDirectory(g_tbDirectoryName[g_nStoreId]..g_send_to.."/",player_rolename..".txt") 
	-- init(g_nStoreId);	-- Store items with player rolename as filename
	init(g_nStoreId,szStoreFileName); -- Store items with npcindex as filename
	--init(g_nStoreId,0); -- Store items with playername npcindex as filename
	
	-- prepare items to send:
	putintray();
end;
------------------------------------------------------------------------
function takething()
	g_storebox = player_rolename;
	local tSays = {
		"Ta muèn nhËn ®å cã ng­êi göi håi n·y/taketemp",
		"Nghe nãi cã ng­êi göi ®å cho ta/showSenders",
		"Quay l¹i sau!/nothing"
	}
	
	Say( NPC_NAME.."Quý kh¸ch nhËn ®å tõ ai?",getn(tSays),tSays);
end;

function taketemp()
	g_storebox = "temp";
	makeDirectory(g_tbDirectoryName[g_nStoreId]..g_storebox.."/")
	showSenders()
	
	-- szStoreFileName = format("temp/%s.txt",player_rolename);
	-- -- init(g_nStoreId);	-- Store items with player rolename as filename
	-- init(g_nStoreId,szStoreFileName); -- Store items with npcindex as filename
	-- --init(g_nStoreId,0); -- Store items with playername npcindex as filename
	-- showThingsOut(0);
end;


function takefrom(nSenderIndex)
	local szSender = g_tSenders[nSenderIndex][2];
	local szTakeFrom = totelex(szSender);
	szStoreFileName = format("%s/%s.txt",g_storebox,szTakeFrom);
	print(szStoreFileName)
	g_mailboxname = szTakeFrom;
	-- init(g_nStoreId);	-- Store items with player rolename as filename
	init(g_nStoreId,szStoreFileName); -- Store items with npcindex as filename
	--init(g_nStoreId,0); -- Store items with playername npcindex as filename
	showThingsOut(0);
end;
------------------------------------------------------------------------

nPage = 1;
nItemsPerPage = 25;

function showSenders(nNav)
	local szSender = "";
	local nSenders = 0;
	
	if g_storebox == "temp" then
		inboxfilepath = g_tbDirectoryName[g_nStoreId].."temp/senders.txt";
		g_tSenders = getSenders();
		nSenders = getn(g_tSenders);
		if nSenders == 0 then
			Talk(1,"",NPC_NAME.."HiÖn kh«ng cã ai göi ®å ë ®©y!");
			return 0;
		end
	else
		inboxfilepath = g_tbDirectoryName[g_nStoreId]..player_rolename.."/inbox.txt";
		g_tSenders = getSenders(player_rolename);
		nSenders = getn(g_tSenders);
		if nSenders == 0 then
			Talk(1,"",NPC_NAME.."Kh«ng cã ai göi ®å cho c¸c h¹ c¶!");
			return 0;
		end
	end
	--print(inboxfilepath)

	nNav = nNav or 0;
	nPage = nPage + nNav;
	local nPages = ceil(nSenders/nItemsPerPage);
	local nBegin = (nPage-1) * nItemsPerPage + 1;
	local nEnd = nBegin + nItemsPerPage;
	if nSenders < nEnd then
		nEnd = nSenders;
	end
	
	local nMaxItems = nSenders;
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."Tæng céng <color=yellow>%d<color> ng­êi göi. §ang hiÓn thÞ: %d - %d"
		,nPage,nPages,nMaxItems,nBegin,nEnd);
	
	local tbSay = {}
	for i=nBegin,nEnd do
		tinsert(tbSay,format("[%d] Thêi gian: [%s] : %s/#takefrom(%d)",i,g_tSenders[i][1],telex2tones(g_tSenders[i][2]),i));
	end;
	-- insert page navigation
	if nPage < nPages then 
		tinsert(tbSay, format(">> Trang kÕ >>/#showSenders(%d)",1))
	else
		tinsert(tbSay, format("<<<< Trang ®Çu <<<</#showSenders(%d)",-nPages+1))
	end
	if nPage > 1 then 
		tinsert(tbSay, format("<< Trang tr­íc <</#showSenders(%d)",-1))
	else
		tinsert(tbSay, format(">>>> Trang cuèi >>>>/#showSenders(%d)",nPages-nPage))
	end
	-- close dialog
	tinsert(tbSay,"Kh«ng nhËn n÷a/nothing");
	-- show dialog
	Say( NPC_NAME.."Quý kh¸ch nhËn ®å tõ ai?\n"..szHead,getn(tbSay),tbSay);
	
	--takefrom(szSender);
end;



function getSenders()
	local tSenders = {}
	print("getSenders>>inboxfilepath",inboxfilepath);
	local TB_DATAITEMS = new(KTabFile, inboxfilepath);
	local nCount = TB_DATAITEMS:getRow();
	print("nCount",nCount);
	local k = 0;
	for i=1,nCount do
		local sDate = TB_DATAITEMS:getCell(i,1);
		local sName = TB_DATAITEMS:getCell(i,2);

		if sName ~= "" then
			k = k+1;
			tSenders[k] = {sDate,sName}
		end
	end
	-- print("k",k);
	TabFile_Unload(inboxfilepath); -- THIS IS VERY IMPORTANT COMMAND !!! PLEASE TAKE NOTICE THAT AND REMEMBER IT!!!
	return tSenders, k;
end;
------------------------------------------------------------------------

function putintray()
	PutinItemBox("§Æt ®å vµo gãi hµng", MaxPutinCount, "X¸c nhËn ®Æt ®å göi ®i", THE_FILE, 1);
end;


function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if GetItemSpecialAttr(idx,"LOCK") == 1 then --Ëø¶¨ÅÐ¶Ï
		Talk(1,"","VËt phÈm ®· khãa kh«ng thÓ göi ®i!");
		return 0;
	end
	--if genre ~= 2 and genre ~= 1 then 
		--Talk(1,"","VËt nµy kh«ng phï hîp bá vµo gãi hµng");
		--return 0;
	--end
	
	local nCount = GetItemParam(idx, 1) -- Get from archive_box.lua, seem not to work
	local nItemMapID = GetItemParam(idx, 0)
	
	return 1;
end
	
function OnPutinComplete(param)

	if param ~= 1 then
		return 0;
	end
	local t = GetPutinItem()
	
	for i=1, getn(t) do
		for j=1,getn(t[i]) do
			--print(format("t[%d][%d] = ",i,j)..t[i][j]);
		end
	end
	
	--print(getn(t))
	
	xb_puttrayin(t,g_nStoreId,szStoreFileName);
	writetomailbox(inboxfilepath,telex2tones(player_rolename))
	writetomailbox(outboxfilepath,telex2tones(g_send_to))
end


function burnletterformmailbox(file_path, mailboxname)
	local file = openfile(file_path, "w");
	print(file_path,file);
	
	for i=1, getn(g_tSenders) do
		if g_tSenders[i] == nil then
			break;
		end
		print(g_tSenders[i][2],mailboxname)
		if g_tSenders[i][2] == mailboxname then
			tremove(g_tSenders,i);
			i = i-1;
			print("removed",mailboxname);
		end
	end
	
	local string = tabletostring(g_tSenders);
	
	write(file,string);
	closefile(file)
end;

function tabletostring(table)
	local string = "";
	for i=1, getn(table) do
		string = string..table[i][1]..tab..table[i][2]..endl
	end
	return string;
end;

function writetomailbox(file_path, mailboxname)
	local file = openfile(file_path, "a+");
	--print(file_path,file);
	
	string = date("%y%m%d%H%M%S")..tab..mailboxname..endl
	
	write(file,string);
	closefile(file)
end;


------------------------------------------------------------------------

nPageIn = 1;

function showThingsIn(nNav)
	if nNav == nil then
		nNav = 0;
		nPageIn = 1;
	end
	
	g_tbInBagItems = getAllowItems();
		
	--print(getn(g_tbInBagItems))
	local t = g_tbInBagItems;

	nPageIn = xb_generateNavigation(g_nStoreId,nPageIn,nNav,t,DIRECT_PUTIN);
	
end;

nPageOut = 1;

function showThingsOut(nNav)
	if nNav == nil then
		nNav = 0;
		nPageOut = 1;
	end
	
	local t = TB_ITEMS;
	
	if getn(t) == 0 then
		Talk(1,"",NPC_NAME.."Xin th«ng c¶m. Hµng trong ®¬n ®· ®­îc lÊy hÕt ®i! Chóng t«i sÏ thanh lÝ hãa ®¬n!");
		burnletterformmailbox(inboxfilepath,g_mailboxname);
	else
		nPageOut = xb_generateNavigation(g_nStoreId,nPageOut,nNav,t,DIRECT_TAKEOUT);
	end
	
end;


function putthispage(nBegin,nEnd)
	xb_putthispage(g_tbInBagItems,nBegin,nEnd,g_nStoreId,szStoreFileName)
end;

function putonein(nInTableItemIndex)
	xb_putonein(g_tbInBagItems,nInTableItemIndex,g_nStoreId,szStoreFileName)
end;

function putallin()
	xb_putallin(g_tbInBagItems,g_nStoreId,szStoreFileName)
end;

function takethispage(nBegin,nEnd)
	xb_takethispage(nBegin,nEnd,g_nStoreId,szStoreFileName)
end;

function takeoneout(nInTableItemIndex)
	xb_takeoneout(nInTableItemIndex,g_nStoreId,szStoreFileName)
end;

function takeallout()
	xb_takeallout(g_nStoreId,szStoreFileName)
end;
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

function main2()
	Say( NPC_NAME.."Quý kh¸ch ®Õn nhËn th­ ph¶i kh«ng?",
		3,
		"NhËn th­/query_mail_list",
		"H­íng dÉn giao dÞch tiÒn xu/trade_gold_coin_help",
		"Quay l¹i sau!/nothing"
	);
end

function trade_gold_coin_help()
	Say( NPC_NAME.."C¸c thao t¸c giao dÞch cã liªn quan ®Õn tiÒn Xu ®Òu ph¶i th«ng qua B­u côc ®Ó göi hoÆc nhËn. Sau khi song ph­¬ng x¸c ®Þnh hoµn tÊt giao dÞch, hÖ thèng sÏ th«ng b¸o d­íi h×nh thøc th­ cho hai bªn. Chó ý: nÕu r­¬ng trong tr¹ng th¸i khãa th× sÏ kh«ng thÓ thùc hiÖn giao dÞch!",
		1,
		"BiÕt råi!/main" );
end

-- nMailCount µ±Ç°È¡ÏÂÀ´µÄÓÊ¼þÁÐ±íÖÐÓÐ¶àÉÙ·âÓÊ¼þ
-- nMaxMailCount Ò»¹²ÓÐ¶àÉÙ·âÓÊ¼þ
-- nNewMailCount ÐÂÓÊ¼þ£¨Î´¶ÁÓÊ¼þ£©µÄÊýÁ¿
function query_mail_list(nMailCount, nMaxMailCount, nNewMailCount)
	if nMailCount == 0 then
		Say("Kh¸ch quan hiÖn ch­a cã th­ nµo!", 0);
		return
	end

	local tMailList = QueryMailList(THE_FILE, "query_mail_list");
	if tMailList == nil then
		return
	end
	if tMailList == 0 then
		Say("Kh¸ch quan hiÖn ch­a cã th­ nµo!", 0);
		return
	end

	local nCount = getn(tMailList)
	if nCount == 0 then
		Say("Kh¸ch quan hiÖn ch­a cã th­ nµo!", 0);
		return
	end

	nMailCount = nCount;
	if nCount > 6 then
		nCount = 6;
	end
	local tSayNote = {};
	for i = 1, nCount do
		local y,m,d,h,n,s = GmTime(tMailList[i].time + 8 * 3600);
		local sz_time = format("%d:%d:%d %d-%d-%d", h,n,s,y,m,d);
		tSayNote[i] = format("%17s%17s%20s/#receive_mail(%d,%d)",
			tMailList[i].subject,
			tMailList[i].sender,
			sz_time,
			tMailList[i].lowid,
			tMailList[i].highid);
	end
	tSayNote[nCount+1] = "KÕt thóc ®èi tho¹i/nothing";
	local msg = "";
	if nMailCount > 6 then
		msg = format("B¹n cã %d th­ míi, hiÖn t¹i chØ cã thÓ hiÓn thÞ 6 th­ míi nhÊt, h·y nhanh chãng dän dÑp chç trèng. \n 6 th­ míi nhÊt: ", nMailCount);
	else
		msg = "Danh s¸ch th­ cña b¹n: "
	end
	Say(msg, nCount + 1, tSayNote);
end

function nothing()
end

function receive_mail(lowid, highid)
	if lowid == 0 and highid == 0 then
		Say(NPC_NAME.."Kh¸ch quan hiÖn ch­a cã th­ nµo!", 0)
		return
	end

	local tMail = ReceiveMail(lowid, highid, THE_FILE, "receive_mail");
	if tMail == nil or tMail == 0 then
		return
	end

	local uId = tMail.ID;

--	if tMail.Attachments.count <= 0 then
--		Say("empty content",0);
--		return
--	end

	local szMsg = "";
	local tSelNode = {};

	if tMail.Attachments._zw_ then
		szMsg = szMsg .."Néi dung: "..tMail.Attachments._zw_.."\n";
	end
	if tMail.Attachments._wj_ then
		local nCount = tMail.Attachments.obj_count;
		if nCount == nil then
			nCount = 0;
		end
		szMsg = szMsg.."Th«ng tin vËt phÈm: "..tMail.Attachments._wj_.."\n";
		tSelNode[1] = format("NhËn vËt phÈm/#pickup(%d,%d)", uId, nCount);
	end
	if tMail.Attachments._gbi then
		szMsg = szMsg .."Tin tøc TiÒn xu: "..tMail.Attachments._gbi.."\n";
	end
	if getn(tSelNode) == 0 then
		--tSelNode[1] = format("É¾³ýÓÊ¼þ/#DelMail(%d, %s, %s)", uId, THE_FILE, "nothing");
		tSelNode[1] = format("Xãa th­/#pickup(%d, %d)", uId, 0);
	end
	tSelNode[getn(tSelNode)+1] = "KÕt thóc ®èi tho¹i/nothing";

	Say( szMsg, getn(tSelNode), tSelNode );
end

function pickup(uId, nObjCount)
	if gf_Judge_Room_Weight(nObjCount, 0) == 0 then
		Say(STR_OVERWEIGHT, 0);
		return
	end
	local bDelResult = DelMail(uId, THE_FILE, "pickup_2");
end

function pickup_2(nRetCode, uID)
	if nRetCode > 0 then
		GetAttachments(uID);
		RemoveGSMailCache(uID)
	end
end

