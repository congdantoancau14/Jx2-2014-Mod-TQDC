tChoosenMoneyInfo = {}
enter = "<enter>";
space = " ";

VET_201203_GONGLI_ID = 59
VET_201302_VALENTINE = 82


tHandMade = {
	[1] = {
		["mater"] = {
			{"Mao ng­u b×",{2,1,287},10}, -- {Tªn_vËt_phÈm, {g,d,p}, sè_l­îng_yªu_cÇu}
			{"D©y tua",{2,1,327},1},
			{"Tróc ®ång",{2,1,1131},1},
		},
		["target_item"] = {
			{"Miªu LÜnh tÝn tiªu",{2,0,367},1} -- {Tªn_vËt_phÈm, {g,d,p}, sè_l­îng_s¶n_xuÊt}
		},
		["desc"] = {
			{"Miªu LÜnh tÝn tiªu lµ vËt phÈm dïng ®Ó triÖu gäi Miªu LÜnh lùc sÜ. "
				.."Trªn ng­êi cña mçi mét Miªu LÜnh lùc sÜ cã mét Ýt to¸i th¹ch."}
		}
	},
	[2] = {
		["mater"] = {
			{"To¸i th¹ch",{2,1,316},1},
			{"TiÓu ®éc nang",{2,1,309},1},
		},
		["target_item"] = {
			{"Ên th¹ch",{2,1,72},1}
		},
		["desc"] = {
			{"Ên th¹ch lµ lo¹i ®¸ quy' hiÕm, cã mµu s¾c sÆc s¬~ do ®éc d­îc t¹o thµnh."
				.."§Ó chÕ t¹o viªn ®¸ nµy th× cÇn cã ®¸ vôn (To¸i th¹ch) vµ tói ®éc d­îc nhá (tiÓu ®éc nang)."}
		}
	},
	[3] = {
		["mater"] = {
			{"HuyÕt bao",{2,1,286},1},
			{"ChØ t¬",{2,2,62},1},
			{"Dao",{0,200,12},1,1},
		},
		["target_item"] = {
			{"d©y tua",{2,1,281},10}
		},
		["desc"] = {
			{"R¹ch huyÕt bao thµnh c¸c m¶nh thanh dµi, dïng chØ t¬ bÖn l¹i thµnh d©y tua, "
				.."cã thÓ dïng ®Ó buéc ®å vËt. RÊt h÷u dông."}
		}
	},
	
}

tKhaiThac = {
	[1] = {
		["tool"] = {
			{"D©y thÐp",{2,1,327},1}, -- {Tªn_vËt_phÈm, {g,d,p}, sè_l­îng_yªu_cÇu}
			{"R×u s¾t",{0,200,14},1,1} -- {Tªn_vËt_phÈm, {g,d,p}, sè_l­îng_yªu_cÇu, kh«ng_tiªu_hao}
		},
		["target_item"] = {
			{"èng tróc",{2,1,1131},10} -- {Tªn_vËt_phÈm, {g,d,p}, sè_l­îng_s¶n_vËt}
		},
		["map"] = {
			{"§­êng M«n",305}
		},
		["desc"] = {
			{"§­êng M«n nhiÒu tre. ChØ cÇn mét c©y r×u s¾t th«ng th­êng lµ cã thÓ chÆt ®­îc mét Ýt tre, "
				.."dïng d©y thÐp buéc l¹i thµnh bã ®Ó dÔ dµng mang v¸c. "
				.."D©y thÐp cã thÓ m­în cña Cµn §¹t Bµ, ®ang sèng ë Thiªn TÇm Th¸p"}
		},
	},
	[2] = {
		["tool"] = {
			{"D©y thÐp",{2,1,327},1},
			{"R×u s¾t",{0,200,14},1,1}
		},
		["target_item"] = {
			{"Cñi",{2,1,30235},10} 
		},
		["map"] = {
			{"Linh B¶o S¬n",218}
		},
		["desc"] = {
			{"Linh B¶o S¬n lµ n¬i cho phÐp khai th¸c l©m s¶n."
				.."ChØ cÇn mét c©y r×u s¾t th«ng th­êng lµ cã thÓ chÆt ®­îc mét Ýt cñi, "
				.."dïng d©y thÐp buéc l¹i thµnh bã ®Ó dÔ dµng mang v¸c. "
				.."D©y thÐp cã thÓ m­în cña Cµn §¹t Bµ, ®ang sèng ë Thiªn TÇm Th¸p"}
		},
	},
}
tExchange = {
	[1] = {
		["source"] = {
			{"Ng©n phiÕu",{2,1,145},1,100} -- {Tªn_lo¹i_tiªn, {g,d,p}, tØ_lÖ_gèc, tØ_lÖ_ngän}
		},
		["target"] = {
			{"TiÒn lÎ",{2,1,198},100}, -- {Tªn_lo¹i_tiªn, {g,d,p}, xÕp_chång}
		},
	},
	[2] = {
		["source"] = {
			{"§¹i ng©n phiÕu",{2,1,199},1,10},
		},
		["target"] = {
			{"Ng©n phiÕu",{2,1,145},1}
		},
	},
	[3] = {
		["source"] = {
			{"Kim chuyªn",{2,1,144},1,10},
		},
		["target"] = {
			{"§¹i ng©n phiÕu",{2,1,199},1},
		},
	},
	[4] = {
		["source"] = {
			{"Kim chuyªn",{2,1,144},1,1000},
			{"§¹i ng©n phiÕu",{2,1,199},1,100},
			{"Ng©n phiÕu",{2,1,145},1,10},
		},
		["target"] = {
			{"Xu",{2,1,30230},2000}
		},
	},
	[5] = {
		["source"] = {
			{"Hoµng kim ®¹i ng©n phiÕu",{2,1,30490},1,1},
		},
		["target"] = {
			{"Kim chuyªn",{2,1,144},1},
		},
	},
}


tbBangCaoCap = {
	[1] = {"-°•Hotel"},
	[6] = {"TøH¶i"},
	[7] = {"H¶o H÷u"},
	[8] = {"=HeoCon!"},
	[11] = {"•Family"},
	[12] = {"°•Giã•°Ä"},
	[19] = {"MatTri"},
	[25] = {"NghÖ Sü"},
	[33] = {"=-V×EmLµ"},
	[38] = {"ÄPDHouse"},
	[63] = {"PhôcH­ng"},
	[75] = {"_W-A-F_"},
}
tbBangSieuCap = {
	[2] = {"ÄHeroic"},
	[17] = {"Tinh Vâ"},
	[23] = {"!i-Max!"},
	[29] = {"C«ng Tö"},
	[32] = {"ThÇnÅHæ"},
	[33] = {"ÄMÊtTrÝ-"},
	[53] = {"Tô*NghÜa"},
	[66] = {"=-NgùLong"},
}

tbNguyenLieuVote = {
	[1] = {1, "vµng", 1, 0},
	[2] = {{2,1,539,1}, "Hoµng Kim §¹i Hång Bao 999 vµng", 1100, 0 },
	[3] = {{2,1,30229,1}, "B¹ch Kim §¹i Hång Bao 4000 vµng", 4500, 0 },
}

function colorize(szColor, anyData)
	anyData = tostring(anyData);
	return format("<color=%s>%s<color>",szColor,anyData);
end;

-- table_to_del, number_items_to_del, index_of_item_to_del
function delItems(tItems, nNum, nIndex)
	if nNum == nil then
		nNum = 1;
	end

	local tDel = {}
	local nDelResult = 1;
	
	local forbegin = 1;
	local forend = 1;
	if nIndex ~= nil then
		forbegin = nIndex;
		forend = nIndex;
	else
		forend = getn(tItems)
	end
	
	for i=forbegin, forend do
		if tItems[i][4] ~= 1 then
			local nDel = DelItem(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3], tItems[i][3] * nNum);
			if nDel ~= 1 then
				if tItems[i][5] ~= nil then
					for j=1, getn(tItems[i][5]) do
						local tItem = tItems[i][5];
						if tItem[j][4] ~= 1 then
							nDel = DelItem(tItem[j][2][1],tItem[j][2][2],tItem[j][2][3], tItem[j][3] * nNum);
						end
						if nDel == 1 then
							break
						end
					end
					if nDel ~= 1 then
						nDelResult = 0;
					end
				else
					nDelResult = 0;
				end
			end
			tDel[i] = nDel;
		end
	end
	return nDelResult, tDel;
end;

function countItems(tItems)
	local tResult = {}
	local nMax = 2000;
	
	for i=1, getn(tItems) do
		local nCount = GetItemCount(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3]);	
		if nCount < tItems[i][3] then
			if tItems[i][5] ~= nil then
				local nLoop = 0;
				for j=1, getn(tItems[i][5]) do
					local t = tItems[i][5];
					nCount = nCount + GetItemCount(t[j][2][1],t[j][2][2],t[j][2][3]);
					if nCount >= t[j][3] then
						break
					end
					nLoop = nLoop + 1;
				end
				if nLoop == getn(tItems[i][5]) then
					nMax = 0;
				end
			else
				nMax = 0;
			end
		else
			nCount = floor(nCount/tItems[i][3]);
			if nCount < nMax then
				nMax = nCount;
			end
		end
		tResult[i] = nCount;		
	end
	return nMax, tResult; -- tResult l­u sè l­îng chi tiªt; nMax l­u sè l­îng cao nhÊt co' thÓ s¶n xuÊt
end;