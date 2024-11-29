--  �ļ�˵��
--  ��ӦNPC���ƣ��ܱ��
--  created by lizhi
--  2005-8-4 15:14

Include("\\script\\task\\world\\lizhi_Ȫ��\\14��\\task_main.lua");
Include("\\script\\online\\activity_ambassador.lua");
tColor = {"red","green","yellow"};
tRecovers = {
	[1] = {
		["mater"] = {
			{"Bi' ph� cu~ n�t",{2,1,30088},1},
			{"Ph�c nguy�n thu�t",{2,1,30089},1,1}
		},
		["target_item"] = {
			{"Tr��ng sinh ph�",{2,1,30090},1}
		}
	},
	[2] = {
		["mater"] = {
			{"Hoa",{2,1,30447},1},
			{"H�o",{2,1,30448},1},
			{"Nguy�t",{2,1,30449},1},
			{"Vi�n",{2,1,30450},1,},
			{"B�t l�ng",{2,1,30451},1,1},
			{"M�c T�u",{2,1,30473},1,1},
		},
		["target_item"] = {
			{"Ph� thi�n ��ng kh�nh",{2,1,30446},1}
		}
	},
}

tChoosen = {}

function main()
    
    local nLevel = 0;
    local nStep = 0;
    local szTalk = {
        "Chu B�n C�: Giai kh�ng tr� l�p, t�c �i�u quy phi c�p. H� x� th� quy tr�nh? Tr��ng ��nh li�n �o�n ��nh."
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
		tinsert(tbSay,"Kh�i ph�c "..tRecovers[i]["target_item"][1][1]..format("/#recover(%d)",i));
	end
	tinsert(tbSay, "Ho�t ��ng ch� vi�t th�t l�c/showChuVietThatLac");
	tinsert(tbSay, "T�ch m�t s� rang b� \/ v�t ph�m/_equip_recycle");
	tinsert(tbSay, "\nTho�t/nothing");
	local szTitle = "<color=green>Chu B�n C�<color>: ".."M�i v�t n�'u r�p v�o ���c th� ��`u co' c�ch ph� gi�i."
			.."Co' ch�ng l� m�t s� v�t ���c thi�'t k�' t� h�y ho�c thi�'t k�' 1 chi�`u, "
			.."ph� ra s� ph�i chiu. m�t s� t�n th�t nh�t �i.nh ho�c v�t s� kh�ng nguy�n v�n nh� ban ��u th�i.\n"
			.."T��ng t�, m�t v�t bi. r�ch n�t cu~ng co' th� kh�i ph�c. "
			.."Nguy�n d�ng ���c kh�i ph�c bao nhi�u ph�n th� ph�i xem duy�n tr�i r�i. "
			.."Tuy v�y, co' th� ngh� ��'n vi�c t�o ra v�t ph�m t��ng t�.";
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
		Talk(1,"","C�c h� ch�a chu�n bi. �� nguy�n li�u, ta e kh�ng th� gi�p b�ng h�u kh�i ph�c "
			..colorize(tColor[3],tItem["target_item"][1][1])..enter
			..szListCounter
			);
	else
		AskClientForNumber("_request_number_call_back",1,nMax,"Nh�p s� l��ng c�n kh�i ph�c");
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
		Talk(1,"","Kh�i ph�c th�t b�i. Co' th� �� bi. t�n th�t m�t s� v�t ph�m trong qu� tr�nh kh�i ph�c");
	else
		AddItem(
			tChoosen["target_item"][1][2][1],
			tChoosen["target_item"][1][2][2],
			tChoosen["target_item"][1][2][3],
			tChoosen["target_item"][1][3] * nNum
			)
		Msg2Player("Kh�i ph�c th�nh c�ng "..nNum.." "..tChoosen["target_item"][1][1]);
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
	
	
	--׷�ش���������ս
	if dzt_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Kh�i ph�c T� Thi�p";
		for i=1, getn(DZT_DIALOG_TABLE) do 
			tinsert(g_Act_Dialog[g_Act_Count], DZT_DIALOG_TABLE[i]);
		end
		g_Act_Title[g_Act_Count] = DZT_NPC..DZT_TITLE;
	end
	
	
	if g_Act_Count == 1 then
		if getn(g_Act_Dialog[g_Act_Count]) > 0 then
			tinsert(g_Act_Dialog[g_Act_Count], "\nTho�t/nothing");
			Say(g_Act_Title[g_Act_Count], getn(g_Act_Dialog[g_Act_Count]), g_Act_Dialog[g_Act_Count]);
		end
	else
		local tbSay = {};
		for i = 1, getn(g_Act_Select) do
			tinsert(tbSay, format("\n%s/#aa_SayDialog(%d)", g_Act_Select[i], i));
		end
		tinsert(tbSay, "\nTho�t/nothing");
		local szTitle = "Danh s�ch ho�t ��ng";
		Say(szTitle, getn(tbSay), tbSay);
	end
end;