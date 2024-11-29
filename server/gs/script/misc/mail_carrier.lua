-- mail_carrier.lua
-- ” µ›‘±

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

THE_FILE = "\\script\\misc\\mail_carrier.lua";
NPC_NAME = "<color=green>ChÒ B≠u cÙc<color>: ";

------------------------------------------------------------------------
function main()
	player_rolename = GetName();
	player_rolename = totelex(player_rolename);
	
	local tSays = {
		"Ta muËn gˆi ›t ÆÂ/sendthing",
		"Ta Æ’n nhÀn ÆÂ/takething",
		"Quay lπi sau!/nothing"
	}
	
	Say( NPC_NAME.."Qu˝ kh∏ch Æ’n nhÀn th≠ ph∂i kh´ng?",getn(tSays),tSays);
end;
------------------------------------------------------------------------
function sendthing()
	local tSays = {
		"Ta muËn gˆi ›t ÆÂ, l∏t c„ ng≠Íi Æ’n l y/sendtemp",
		"Ta muËn gˆi cho ng≠Íi c„ t™n.../sendto",
		"Quay lπi sau!/nothing"
	}
	
	Say( NPC_NAME.."Qu˝ kh∏ch muËn gˆi cho ai?",getn(tSays),tSays);
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
	AskClientForString("_sendto_callback", "T™n ng≠Íi nhÀn", 1, 32, "NhÀp t™n ng≠Íi nhÀn");
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
		"Ta muËn nhÀn ÆÂ ta ng≠Íi gˆi hÂi n∑y/taketemp",
		"Nghe n„i c„ ng≠Íi gˆi ÆÂ cho ta/showSenders",
		"Quay lπi sau!/nothing"
	}
	
	Say( NPC_NAME.."Qu˝ kh∏ch nhÀn ÆÂ tı ai?",getn(tSays),tSays);
end;

function taketemp()
	g_storebox = "temp";
	makeDirectory(g_tbDirectoryName[g_nStoreId]..g_storebox.."/")
	showSenders(1)
	
	-- szStoreFileName = format("temp/%s.txt",player_rolename);
	-- -- init(g_nStoreId);	-- Store items with player rolename as filename
	-- init(g_nStoreId,szStoreFileName); -- Store items with npcindex as filename
	-- --init(g_nStoreId,0); -- Store items with playername npcindex as filename
	-- showThingsOut(0);
end;


function takefrom(nSenderIndex)
	local szSender = tSenders[nSenderIndex][2];
	local szTakeFrom = totelex(szSender);
	szStoreFileName = format("%s/%s.txt",g_storebox,szTakeFrom);
	print(szStoreFileName)
	-- init(g_nStoreId);	-- Store items with player rolename as filename
	init(g_nStoreId,szStoreFileName); -- Store items with npcindex as filename
	--init(g_nStoreId,0); -- Store items with playername npcindex as filename
	showThingsOut(0);
end;
------------------------------------------------------------------------

function showSenders(temp)
	local szSender = "";
	inboxfilepath = g_tbDirectoryName[g_nStoreId]..player_rolename.."/inbox.txt";
	tSenders = getSenders(player_rolename);
	
	if temp == 1 then
		inboxfilepath = g_tbDirectoryName[g_nStoreId].."temp/senders.txt";
		tSenders = getSenders();
	end
	--print(inboxfilepath)
	
	if getn(tSenders) == 0 then
		Talk(1,"",NPC_NAME.."Kh´ng c„ ai gˆi ÆÂ cho c∏c hπ c∂!");
		return 0;
	end
	
	local tSays = {}
	for i=1,getn(tSenders) do
		tinsert(tSays,format("ThÍi gian: [%s] : %s/#takefrom(%d)",tSenders[i][1],telex2tones(tSenders[i][2]),i));
	end;
	tinsert(tSays,"Kh´ng nhÀn n˜a/nothing");
	
	Say( NPC_NAME.."Qu˝ kh∏ch nhÀn ÆÂ tı ai?",getn(tSays),tSays);
	
	--takefrom(szSender);
end;

function getSenders()
	local tSenders = {}
	--print("getSenders>>inboxfilepath",inboxfilepath);
	local TB_DATAITEMS = new(KTabFile, inboxfilepath);
	local nCount = TB_DATAITEMS:getRow();
	-- print("nCount",nCount);
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
	TabFile_Unload(ITEM_FILEPATH); -- THIS IS VERY IMPORTANT COMMAND !!! PLEASE TAKE NOTICE THAT AND REMEMBER IT!!!
	return tSenders, k;
end;
------------------------------------------------------------------------

function putintray()
	PutinItemBox("ß∆t ÆÂ vµo g„i hµng", MaxPutinCount, "X∏c nhÀn Æ∆t ÆÂ gˆi Æi", THE_FILE, 1);
end;


function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if GetItemSpecialAttr(idx,"LOCK") == 1 then --À¯∂®≈–∂œ
		Talk(1,"","VÀt ph»m Æ∑ kh„a kh´ng th” gˆi Æi!");
		return 0;
	end
	if genre ~= 2 and genre ~= 1 then 
		Talk(1,"","VÀt nµy kh´ng phÔ hÓp b· vµo g„i hµng");
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
	
	nPageOut = xb_generateNavigation(g_nStoreId,nPageOut,nNav,t,DIRECT_TAKEOUT);
	
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
	Say( NPC_NAME.."Qu˝ kh∏ch Æ’n nhÀn th≠ ph∂i kh´ng?",
		3,
		"NhÀn th≠/query_mail_list",
		"H≠Ìng d…n giao dﬁch ti“n xu/trade_gold_coin_help",
		"Quay lπi sau!/nothing"
	);
end

function trade_gold_coin_help()
	Say( NPC_NAME.."C∏c thao t∏c giao dﬁch c„ li™n quan Æ’n ti“n Xu Æ“u ph∂i th´ng qua B≠u cÙc Æ” gˆi ho∆c nhÀn. Sau khi song ph≠¨ng x∏c Æﬁnh hoµn t t giao dﬁch, h÷ thËng sœ th´ng b∏o d≠Ìi h◊nh th¯c th≠ cho hai b™n. ChÛ ˝: n’u r≠¨ng trong trπng th∏i kh„a th◊ sœ kh´ng th” th˘c hi÷n giao dﬁch!",
		1,
		"Bi’t rÂi!/main" );
end

-- nMailCount µ±«∞»°œ¬¿¥µƒ” º˛¡–±Ì÷–”–∂‡…Ÿ∑‚” º˛
-- nMaxMailCount “ªπ≤”–∂‡…Ÿ∑‚” º˛
-- nNewMailCount –¬” º˛£®Œ¥∂¡” º˛£©µƒ ˝¡ø
function query_mail_list(nMailCount, nMaxMailCount, nNewMailCount)
	if nMailCount == 0 then
		Say("Kh∏ch quan hi÷n ch≠a c„ th≠ nµo!", 0);
		return
	end

	local tMailList = QueryMailList(THE_FILE, "query_mail_list");
	if tMailList == nil then
		return
	end
	if tMailList == 0 then
		Say("Kh∏ch quan hi÷n ch≠a c„ th≠ nµo!", 0);
		return
	end

	local nCount = getn(tMailList)
	if nCount == 0 then
		Say("Kh∏ch quan hi÷n ch≠a c„ th≠ nµo!", 0);
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
	tSayNote[nCount+1] = "K’t thÛc ÆËi thoπi/nothing";
	local msg = "";
	if nMailCount > 6 then
		msg = format("Bπn c„ %d th≠ mÌi, hi÷n tπi chÿ c„ th” hi”n thﬁ 6 th≠ mÌi nh t, h∑y nhanh ch„ng d‰n d—p chÁ trËng. \n 6 th≠ mÌi nh t: ", nMailCount);
	else
		msg = "Danh s∏ch th≠ cÒa bπn: "
	end
	Say(msg, nCount + 1, tSayNote);
end

function nothing()
end

function receive_mail(lowid, highid)
	if lowid == 0 and highid == 0 then
		Say(NPC_NAME.."Kh∏ch quan hi÷n ch≠a c„ th≠ nµo!", 0)
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
		szMsg = szMsg .."NÈi dung: "..tMail.Attachments._zw_.."\n";
	end
	if tMail.Attachments._wj_ then
		local nCount = tMail.Attachments.obj_count;
		if nCount == nil then
			nCount = 0;
		end
		szMsg = szMsg.."Th´ng tin vÀt ph»m: "..tMail.Attachments._wj_.."\n";
		tSelNode[1] = format("NhÀn vÀt ph»m/#pickup(%d,%d)", uId, nCount);
	end
	if tMail.Attachments._gbi then
		szMsg = szMsg .."Tin t¯c Ti“n xu: "..tMail.Attachments._gbi.."\n";
	end
	if getn(tSelNode) == 0 then
		--tSelNode[1] = format("…æ≥˝” º˛/#DelMail(%d, %s, %s)", uId, THE_FILE, "nothing");
		tSelNode[1] = format("X„a th≠/#pickup(%d, %d)", uId, 0);
	end
	tSelNode[getn(tSelNode)+1] = "K’t thÛc ÆËi thoπi/nothing";

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

