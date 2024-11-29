--ÌÒÊ÷ ¡¢ ¸÷ÖÖÊé
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

tInfo = {--¡¾NPC name¡¿={{taskid,},[{item info}],"item name",[sTalkMsg]} 
	["ThuËn theo tù nhiªn"] = {{927},			{2,96,122,1,4},	"ThuËn theo tù nhiªn",	"Nh©n ph¸p ®Þa, ®Þa ph¸p thiªn, thiªn ph¸p ®¹o, ®¹o ph¸p tù nhiªn. V¹n vËt ®Òu cã ®¹o, chóng ta nªn thuËn theo tù nhiªn, mäi thø ®Òu cã nh©n qu¶, kh«ng nªn nghÞch theo ý trêi. <color=yellow>Ng­¬i chän ®óng råi, ®©y chÝnh lµ gi¸o lý cña §¹o Gia<color>.",},
	["Kiªm tÕ thiªn h¹"] = {{927},			nil,						"",					"Xem ra ng­¬i vÉn ch­a hiÓu râ gi¸o lý cña chóng ta, <color=red>®©y kh«ng ph¶i lµ gi¸o lý cña §¹o Gia<color>.",},
	["Tõ bi lµm ®Çu"] = {{927},			nil,						"",					"Xem ra ng­¬i vÉn ch­a hiÓu râ gi¸o lý cña chóng ta, <color=red>®©y kh«ng ph¶i lµ gi¸o lý cña §¹o Gia<color>.",},
	["Tr­êng sinh bÊt l·o"] = {{927},			{2,96,125,1,4},	"Tr­êng sinh bÊt l·o",	"Tr­êng sinh bÊt l·o chi ®¹o, cè trÝ gi¶ d­ìng sinh d·. Th©n thÓ lµ vèn cña t©m linh, qu©n tö d­ìng sinh, kÐo dµi tuæi thä.<color=yellow>Ng­¬i chän ®óng råi, ®©y chÝnh lµ gi¸o lý cña §¹o Gia<color>.",},
	["Thanh tÞnh v« vi"] = {{927},			{2,96,126,1,4},	"Thanh tÞnh v« vi",	"Tù c­ vu v« tri, nhi dÜ chóng nh©n chi së tri vi tri; tù xö vu v« n¨ng, nhi dÜ chóng nh©n chi së n¨ng vi n¨ng; tù an vu v« vi, nhi dÜ chóng nh©n chi së vi vi vi. Phµm s¸t s¸t dÜ vi minh, táa táa dÜ vi n¨ng, ®« bÊt thÞ chÝ minh chi ®¹o. <color=yellow>Ng­¬i chän ®óng råi, ®©y chÝnh lµ gi¸o lý cña §¹o Gia<color>.",},
	["TrÝ h­ thñ tÜnh"] = {{927},			{2,96,127,1,4},	"TrÝ h­ thñ tÜnh",	"V¹n vËt tÞnh t¸c, ng« dÜ quan phôc. Phu vËt v©n v©n, c¸c phôc quy tÒ c¨n. Quy c¨n viÕt tÜnh, thÞ viÕt phôc mÖnh. Phôc mÖnh viÕt th­êng, tri th­êng viÕt minh. <color=yellow>Ng­¬i chän ®óng råi, ®©y chÝnh lµ gi¸o lý cña §¹o Gia<color>.",},
	["NiÕt bµn trïng sinh"] = {{927},			nil,						"",					"Xem ra ng­¬i vÉn ch­a hiÓu râ gi¸o lý cña chóng ta, <color=red>®©y kh«ng ph¶i lµ gi¸o lý cña §¹o Gia<color>.",},
	}
function main()
	local nNpcIdx = GetTargetNpc();
	local sNpcName = GetNpcName(nNpcIdx);
	if not tInfo or not tInfo[sNpcName] then
		return 0;
	end
	local tTask = tInfo[sNpcName][1];
	local nHasTask = 0;
	if type(tTask) ~= "table" then
		nHasTask = 1;
	end
	for i = 1,getn(tTask) do
		if 1 == tGtTask:check_cur_task(tTask[i])  then
			nHasTask = 1
			break;
		end
	end
	if nHasTask ~= 1 then
		return 0;
	end  

	if type(tInfo[sNpcName][2]) == "table" then 
		if gf_Judge_Room_Weight(1,10,sNpcName) ~= 1 then
			return 0;
		end
		gf_AddItemEx(tInfo[sNpcName][2],tInfo[sNpcName][3]);
	end
	
	if type(tInfo[sNpcName][4]) == "string" then
		Talk(1,"",tInfo[sNpcName][4]);
	end

end
