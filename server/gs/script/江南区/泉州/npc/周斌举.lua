--  ÎÄ¼þËµÃ÷
--  ¶ÔÓ¦NPCÃû³Æ£ºÖÜ±ó¾Ù
--  created by lizhi
--  2005-8-4 15:14

Include("\\script\\task\\world\\lizhi_ÈªÖÝ\\14¼¶\\task_main.lua");
Include("\\script\\online\\activity_ambassador.lua");
tColor = {"red","green","yellow"};
tRecovers = {
	[1] = {
		["mater"] = {
			{"Bi' phæ cu~ n¸t",{2,1,30088},1},
			{"Phôc nguyªn thuËt",{2,1,30089},1,1}
		},
		["target_item"] = {
			{"Tr­êng sinh phæ",{2,1,30090},1}
		}
	},
	[2] = {
		["mater"] = {
			{"Hoa",{2,1,30447},1},
			{"H¶o",{2,1,30448},1},
			{"NguyÖt",{2,1,30449},1},
			{"Viªn",{2,1,30450},1,},
			{"Bót l«ng",{2,1,30451},1,1},
			{"Mùc Tµu",{2,1,30473},1,1},
		},
		["target_item"] = {
			{"Phæ thiªn ®ång kh¸nh",{2,1,30446},1}
		}
	},
}

tChoosen = {}

function main()
    
    local nLevel = 0;
    local nStep = 0;
    local szTalk = {
        "Chu B©n Cö: Giai kh«ng tr÷ lËp, tóc ®iÓu quy phi cÊp. Hµ xö thÕ quy tr×nh? Tr­êng ®×nh liªn ®o¶n ®×nh."
    };

    nStep = GetTask(TASK_LEV_14_ID);
    if (nStep == 1) then
        task_001_02();
    elseif (nStep == 2) then
        task_002_01();
    elseif (nStep == 3) then
        task_003_01();
    else
        --TalkEx("", szTalk);
		showActivities();
    end;	

end;

function showActivities()
	local tbSay = {};
	
	for i=1,getn(tRecovers) do
		tinsert(tbSay,"Kh«i phôc "..tRecovers[i]["target_item"][1][1]..format("/#recover(%d)",i));
	end
	tinsert(tbSay, "Ho¹t ®éng ch÷ viÕt thÊt l¹c/showChuVietThatLac");
	tinsert(tbSay, "T¸ch mét sè rang bÞ \/ vËt phÈm/_equip_recycle");
	tinsert(tbSay, "\nTho¸t/nothing");
	local szTitle = "<color=green>Chu B©n Cö<color>: ".."Mäi vËt nª'u r¸p vµo ®­îc th× ®ª`u co' c¸ch ph¸ gi¶i."
			.."Co' ch¨ng lµ mét sè vËt ®­îc thiª't kª' tù hñy hoÆc thiª't kª' 1 chiª`u, "
			.."ph¸ ra sÏ ph¶i chiu. mét sè tæn thÊt nhÊt ®i.nh hoÆc vËt sÏ kh«ng nguyªn vÑn nh­ ban ®Çu th«i.\n"
			.."T­¬ng tù, mét vËt bi. r¸ch n¸t cu~ng co' thÓ kh«i phôc. "
			.."Nguyªn d¹ng ®­îc kh«i phôc bao nhiªu phÇn th× ph¶i xem duyªn trêi råi. "
			.."Tuy vËy, co' thÓ nghÜ ®ª'n viÖc t¹o ra vËt phÈm t­¬ng tù.";
	Say(szTitle, getn(tbSay), tbSay);

end;

function recover(id)
	local tItem = tRecovers[id];
	tChoosen = tRecovers[id];
	local tCount = {}
	local nEnough = 1;
	local nMax = 2000;
	for i=1, getn(tItem["mater"]) do
		local nCount = GetItemCount(tItem["mater"][i][2][1],tItem["mater"][i][2][2],tItem["mater"][i][2][3]);
		if nCount < tItem["mater"][i][3] then
			nEnough = 0;
			nMax = 0;
			tCount[i] = {["count"] = nCount, ["enough"] = 0};
		else
			if tItem["mater"][i][4] ~=1 and  nCount < nMax then
				nMax = nCount;
			end
			tCount[i] = {["count"] = nCount, ["enough"] = 1};
		end
	end
	
	if nEnough == 0 then
		local szListCounter = "";
		local enter = "<enter>";
		local space = " ";
		for i=1, getn(tCount) do
			local nColor = tCount[i]["enough"]+1;
			local szColor = tColor[nColor];
			szListCounter = szListCounter.."* "
				..colorize(szColor,tItem["mater"][i][1])..space
				..colorize(tColor[3],tItem["mater"][i][3])..enter;
		end
		Talk(1,"","C¸c h¹ ch­a chuÈn bi. ®ñ nguyªn liÖu, ta e kh«ng thÓ gióp b»ng h÷u kh«i phôc "
			..colorize(tColor[3],tItem["target_item"][1][1])..enter
			..szListCounter
			);
	else
		AskClientForNumber("_request_number_call_back",1,nMax,"NhËp sè l­îng cÇn kh«i phôc");
	end
end;

function colorize(color,any)
	any = tostring(any);
	return format("<color=%s>%s<color>",color,any);
end;

function _request_number_call_back(nNum)
	if nNum < 1 then
		return
	end
	
	local tDel = {}
	local nDelResult = 1;
	for i=1, getn(tChoosen["mater"]) do
		local item = tChoosen["mater"][i];
		if item[4] ~= 1 then
			local nDel = DelItem(item[2][1], item[2][2], item[2][3], item[3]*nNum);
			if nDel ~= 1 then
				nDelResult = 0;
			end
		end
	end
	
	local szMes = "";
	if nDelResult == 0 then
		Talk(1,"","Kh«i phôc thÊt b¹i. Co' thÓ ®· bi. tæn thÊt mét sè vËt phÈm trong qu¸ tr×nh kh«i phôc");
	else
		AddItem(
			tChoosen["target_item"][1][2][1],
			tChoosen["target_item"][1][2][2],
			tChoosen["target_item"][1][2][3],
			tChoosen["target_item"][1][3] * nNum
			)
		Msg2Player("Kh«i phôc thµnh c«ng "..nNum.." "..tChoosen["target_item"][1][1]);
	end
end;

function _equip_recycle()
	SendScript2Client("Open[[EquipRecycle]]");
end

function showChuVietThatLac()
	local g_Act_Count = 0;
	local g_Act_Dialog = {};
	local g_Act_Title = {};
	local g_Act_Select = {};
	
	
	--×·»Ø´ó×ÖÌû´ó×÷Õ½
	if dzt_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Kh«i phôc Tù ThiÕp";
		for i=1, getn(DZT_DIALOG_TABLE) do 
			tinsert(g_Act_Dialog[g_Act_Count], DZT_DIALOG_TABLE[i]);
		end
		g_Act_Title[g_Act_Count] = DZT_NPC..DZT_TITLE;
	end
	
	
	if g_Act_Count == 1 then
		if getn(g_Act_Dialog[g_Act_Count]) > 0 then
			tinsert(g_Act_Dialog[g_Act_Count], "\nTho¸t/nothing");
			Say(g_Act_Title[g_Act_Count], getn(g_Act_Dialog[g_Act_Count]), g_Act_Dialog[g_Act_Count]);
		end
	else
		local tbSay = {};
		for i = 1, getn(g_Act_Select) do
			tinsert(tbSay, format("\n%s/#aa_SayDialog(%d)", g_Act_Select[i], i));
		end
		tinsert(tbSay, "\nTho¸t/nothing");
		local szTitle = "Danh s¸ch ho¹t ®éng";
		Say(szTitle, getn(tbSay), tbSay);
	end
end;