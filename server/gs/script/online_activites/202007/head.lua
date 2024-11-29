
TASK_FIREINDEX = 1000 -- Index cña ®èng löa
TASK_GETFIRECOUNT = 1002 -- §Õm sè ®èng löa ®· ®èt
TASK_BONFIRE_CREATEDTIME = 1003; -- Thêi ®iÓm ®èt ®èng löa Task_id 
TASK_NEWFIRE_LIFETIME = 1004; -- Sinh mÖnh ®èng löa sau khi thªm cñi

TASK_OVENINDEX = 1005 -- Index cña lß n­íng
TASK_OVEN_HIREDTIME = 1006; -- Thêi ®iÓm Thuª Lß n­íng Task_id
TASK_OVENTYPE = 1007; -- KÝch cì lß n­íng
TASK_OVEN_CREATEDTIME = 1008; --Thêi ®iÓm t¹o npc_lonuong
--xx-- Thêi gian cßn l¹i cña lß

OVEN_LIFETIME = 1 * 60; -- Sinh mÖnh cña lß n­íng: 1 phót
FIRE_LIFETIME = 5 * 60; -- Sinh mÖnh cña ®èng löa: 5 phót
MAXFIRE_LIFETIME = 600 -- HiÖu suÊt tèi ®a cña ®èng löa: 10 phót

tDecorators = {
	[1] = {
		["mater"] = {
			{"Cñi",{2,1,30235},100,0,{ -- Tªn_vËt_phÈm, {g,d,p}, sè_l­îng_yªu_cÇu, kh«ng_tiªu_hao, vËt_thay_thª
					{"Cñi",{2,1,30022},100},
					{"Cñi",{2,1,30264},100},
					{"Cñi kh«",{2,1,30330},100}, 
					{"Cñi kh«",{2,1,30768},100},
				}}, 
			{"§¸ löa",{2,0,170},1,0},
		},
		["npc"] = {
			{"Löa tr¹i"},
		},
		["desc"] = {
			{
				"§èng löa, cã nhiÒu t¸c dông.\n"
				.."* Duy tr× nhiÖt ®é c¬ thÓ trong kh«ng khÝ l¹nh\n"
				.."* Duy tr× cho lß n­íng\n"
				.."* T¹o ¸nh s¸ng nh©n t¹o, thay thÕ ¸nh s¸ng mÆt trêi vµo ban ®ªm\n"
				.."* Hong kh« ®å bÞ ­ít\n"
				.."X©y dùng cÇn cã cñi (khai th¸c t¹i Linh B¶o S¬n) "
				.."vµ ®¸ löa (cã ®­îc tõ Tµng KiÕm khi ®¸nh b¹i Tæng Qu¶n ngo¹i viÖn)"
			}
		}
	},
}


tCheBien = {
	[1] = {
		["mater"] = {
			{"Bét m×",{2,1,30233},10},
			{"Nh©n b¸nh",{2,1,30234},10},
			--{"Cñi",{2,1,30235},10},
		},
		["products"] = {
			{"B¸nh Trung Thu",{2,1,30236},1},
			{"B¸nh Trung Thu ®· n­íng chÝn",{2,1,30237},1},
			{"B¸nh Trung Thu ch­a chÝn",{2,1,30238},1},
		},
		["desc"] = {
			{"H»ng Nga du ch¬i ë TuyÒn Ch©u. Lµm b¸nh tÆng H»ng Nga th«i! "
				.."Nguyªn liÖu gåm Bét m× vµ nh©n b¸nh. CÇn cã lß n­íng ®Ó n­íng b¸nh."}
		},
		["tool"] = {
			{"Lß n­íng nhá", 10}, -- Tªn_c«ng_cô, hiÖu_suÊt
			{"Lß n­íng lín", 100},
			{"Lß n­íng siªu lín", 999},
		},
	},
	[2] = {
		["mater"] = {
			{"§­êng c¸t",{2,1,30062},10},
			{"Hép s÷a",{2,1,30063},5},
			{"Lä h­¬ng",{2,1,30064},5},
			{"GiÊy gãi kÑo",{2,1,30065},10},
		},
		["products"] = {
			{"KÑo s÷a",{2,1,30066},10},
		},
		["desc"] = {
			{"KÑo s÷a rÊt ngon vµ bæ. Kh«ng chØ trÎ con mµ ng­êi lín cu~ng thÝch ¨n.\n"
				.."Nguyªn liÖu gåm §­êng c¸t, Hép s÷a, Lä h­¬ng vµ giÊy gãi. Cu~ng cÇn cã lß n­íng ®Ó nÊu kÑo."}
		},
		["tool"] = {
			{"Lß n­íng nhá", 10}, -- Tªn_c«ng_cô, hiÖu_suÊt
			{"Lß n­íng lín", 100},
			{"Lß n­íng siªu lín", 999},
		},
	},
	[3] = {
		["mater"] = {
			{"M¨ng",{1,3,21},10},
		},
		["products"] = {
			{"M¨ng xµo",{1,1,6},2},
		},
		["desc"] = {
			{"M¨ng xµo lµ mãn dÔ ¨n, nhiÒu ng­êi thÝch. ChÕ biÕn còng kh«ng khã. Nguyªn liÖu cã thÓ ®Õn Vò Di s¬n t×m kiÕm."}
		},
		["tool"] = {
			{"Lß n­íng nhá", 10}, -- Tªn_c«ng_cô, hiÖu_suÊt
			{"Lß n­íng lín", 100},
			{"Lß n­íng siªu lín", 999},
		},
	},
	
}


tOvenSizes = {
	[1] = {"Lß n­íng nhá", "Lß n­íng nhá",20000,10}, -- tªn_m«_h×nh, tªn_hiÓn_thÞ, gi¸_tiÒn, søc_chøa (c«ng_suÊt)
	[2] = {"Lß n­íng lín", "Lß n­íng lín",200000,100},
	[3] = {"Lß n­íng b¸nh", "Lß n­íng siªu lín",600000,1000},
}

tOvenItem = {"Lß n­íng b¸nh",{2,0,517}}
OVEN_EXPIRETIME = 7 -- days

function rent_oven()
	tbSay = {}
	for i=1, getn(tOvenSizes) do
		tinsert(tbSay, format("Thuª %s (gi¸ %d vµng, søc chøa %d)/#get_oven(%d)", 
			tOvenSizes[i][2],tOvenSizes[i][3]/10000,tOvenSizes[i][4],i));
	end
	tinsert(tbSay, "Ta sÏ thuª sau/nothing");
	Say("----- Chän kÝch th­íc lß -----"
		..format("\nLo¹i lß nµy ta chØ b¶o hµnh nÊu n­íng hÕt c«ng suÊt trong %d ngµy.",OVEN_EXPIRETIME),getn(tbSay),tbSay);
end;


function get_oven(nType)
	SetTask(TASK_OVENTYPE, nType)
	SetTask(TASK_OVEN_HIREDTIME,GetTime());
	if Pay(tOvenSizes[nType][3]) == 1 then
		local nResult, nIndex = AddItem(tOvenItem[2][1],tOvenItem[2][2],tOvenItem[2][3],1);
		SetItemExpireTime(nIndex,OVEN_EXPIRETIME*24*3600);
	else
		Talk(1,"","Ng­¬i kh«ng ®ñ ti?n råi!")
		return 0;
	end
end;

function isOvenExpire()
	if (GetTime() - GetTask(TASK_OVEN_HIREDTIME))/3600/24 >= OVEN_EXPIRETIME then
		return 1;
	else
		return 0;
	end
end

function createLoNuong(nType)
	--SetTask(TASK_OVENTYPE, nType)
	
	local nIndex = CreateNpc(tOvenSizes[nType][1], tOvenSizes[nType][2], GetWorldPos());
	SetNpcScript(nIndex,"\\script\\online_activites\\202007\\lonuong.lua");
	SetTask(TASK_OVENINDEX,nIndex);
	SetTask(TASK_OVEN_CREATEDTIME,GetTime());
	SetNpcLifeTime(nIndex,OVEN_LIFETIME)
	StartTimeGuage(tOvenSizes[nType][2],OVEN_LIFETIME,0,nIndex)
	
end;


function createtLuaTrai()
	local tLuaTrai = tDecorators[1];
	local nMax, tResult = countItems(tLuaTrai["mater"]);
	if nMax > 0 then
		if GetTime() - GetTask(TASK_BONFIRE_CREATEDTIME) < FIRE_LIFETIME and GetTask(TASK_BONFIRE_CREATEDTIME) ~= 0 then
			Talk(1,"","B¹n ®· cã 1 ®èng löa råi, kh«ng cÇn l·ng phÝ cñi.");
			return 0;
		end;
		local nDelResult, tDel = delItems(tLuaTrai["mater"]);
		if nDelResult == 1 then
			local map,x,y = GetWorldPos();
			x = random(x-2,x+2)
			y = random(y-2,y+2)
			local npcFireIndex = CreateNpc("Löa tr¹i","§èng löa",map,x,y);
			SetNpcScript(npcFireIndex,"\\script\\online_activites\\202007\\donglua.lua");
			SetNpcLifeTime(npcFireIndex,FIRE_LIFETIME)
			SetTask(TASK_FIREINDEX,npcFireIndex);
			SetTask(TASK_BONFIRE_CREATEDTIME,GetTime());
			
			local nTimeLeftNeedWood = FIRE_LIFETIME-FIRE_LIFETIME*0.2;
			StartTimeGuage("Thªm cñi",nTimeLeftNeedWood,0,npcFireIndex)
			
			local nOvenIndex = GetTask(TASK_OVENINDEX);
			StopTimeGuage(nOvenIndex);		
			StartTimeGuage("Lß n­íng",nTimeLeftNeedWood+OVEN_LIFETIME,0,nOvenIndex);
			SetNpcLifeTime(nOvenIndex,nTimeLeftNeedWood+OVEN_LIFETIME)
		else
			Msg2Player("Cã vÊn ®Ò trong qu¸ tr×nh xö lÝ nguyªn liÖu.");
		end
	else
		local szNguyenLieu = "";
		for i=1, getn(tLuaTrai["mater"]) do
			szNguyenLieu = szNguyenLieu..format("* %s %s",
				colorize("green",tLuaTrai["mater"][i][1]),
				"x"..colorize("yellow",tLuaTrai["mater"][i][3]))..enter;
		end
		Talk(1,"",gf_Colorize(tLuaTrai["desc"][1][1],"gray")..enter.."Kh«ng ®ñ nguyªn liÖu."..enter..szNguyenLieu);
	end
end;
