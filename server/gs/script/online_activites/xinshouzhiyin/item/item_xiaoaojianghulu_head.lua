tChoosenMoneyInfo = {}
enter = "<enter>";
space = " ";

VET_201203_GONGLI_ID = 59
VET_201302_VALENTINE = 82


tHandMade = {
	[1] = {
		["mater"] = {
			{"Mao ng�u b�",{2,1,287},10}, -- {T�n_v�t_ph�m, {g,d,p}, s�_l��ng_y�u_c�u}
			{"D�y tua",{2,1,327},1},
			{"Tr�c ��ng",{2,1,1131},1},
		},
		["target_item"] = {
			{"Mi�u L�nh t�n ti�u",{2,0,367},1} -- {T�n_v�t_ph�m, {g,d,p}, s�_l��ng_s�n_xu�t}
		},
		["desc"] = {
			{"Mi�u L�nh t�n ti�u l� v�t ph�m d�ng �� tri�u g�i Mi�u L�nh l�c s�. "
				.."Tr�n ng��i c�a m�i m�t Mi�u L�nh l�c s� c� m�t �t to�i th�ch."}
		}
	},
	[2] = {
		["mater"] = {
			{"To�i th�ch",{2,1,316},1},
			{"Ti�u ��c nang",{2,1,309},1},
		},
		["target_item"] = {
			{"�n th�ch",{2,1,72},1}
		},
		["desc"] = {
			{"�n th�ch l� lo�i �� quy' hi�m, c� m�u s�c s�c s�~ do ��c d��c t�o th�nh."
				.."�� ch� t�o vi�n �� n�y th� c�n c� �� v�n (To�i th�ch) v� t�i ��c d��c nh� (ti�u ��c nang)."}
		}
	},
	[3] = {
		["mater"] = {
			{"Huy�t bao",{2,1,286},1},
			{"Ch� t�",{2,2,62},1},
			{"Dao",{0,200,12},1,1},
		},
		["target_item"] = {
			{"d�y tua",{2,1,281},10}
		},
		["desc"] = {
			{"R�ch huy�t bao th�nh c�c m�nh thanh d�i, d�ng ch� t� b�n l�i th�nh d�y tua, "
				.."c� th� d�ng �� bu�c �� v�t. R�t h�u d�ng."}
		}
	},
	
}

tKhaiThac = {
	[1] = {
		["tool"] = {
			{"D�y th�p",{2,1,327},1}, -- {T�n_v�t_ph�m, {g,d,p}, s�_l��ng_y�u_c�u}
			{"R�u s�t",{0,200,14},1,1} -- {T�n_v�t_ph�m, {g,d,p}, s�_l��ng_y�u_c�u, kh�ng_ti�u_hao}
		},
		["target_item"] = {
			{"�ng tr�c",{2,1,1131},10} -- {T�n_v�t_ph�m, {g,d,p}, s�_l��ng_s�n_v�t}
		},
		["map"] = {
			{"���ng M�n",305}
		},
		["desc"] = {
			{"���ng M�n nhi�u tre. Ch� c�n m�t c�y r�u s�t th�ng th��ng l� c� th� ch�t ���c m�t �t tre, "
				.."d�ng d�y th�p bu�c l�i th�nh b� �� d� d�ng mang v�c. "
				.."D�y th�p c� th� m��n c�a C�n ��t B�, �ang s�ng � Thi�n T�m Th�p"}
		},
	},
	[2] = {
		["tool"] = {
			{"D�y th�p",{2,1,327},1},
			{"R�u s�t",{0,200,14},1,1}
		},
		["target_item"] = {
			{"C�i",{2,1,30235},10} 
		},
		["map"] = {
			{"Linh B�o S�n",218}
		},
		["desc"] = {
			{"Linh B�o S�n l� n�i cho ph�p khai th�c l�m s�n."
				.."Ch� c�n m�t c�y r�u s�t th�ng th��ng l� c� th� ch�t ���c m�t �t c�i, "
				.."d�ng d�y th�p bu�c l�i th�nh b� �� d� d�ng mang v�c. "
				.."D�y th�p c� th� m��n c�a C�n ��t B�, �ang s�ng � Thi�n T�m Th�p"}
		},
	},
}
tExchange = {
	[1] = {
		["source"] = {
			{"Ng�n phi�u",{2,1,145},1,100} -- {T�n_lo�i_ti�n, {g,d,p}, t�_l�_g�c, t�_l�_ng�n}
		},
		["target"] = {
			{"Ti�n l�",{2,1,198},100}, -- {T�n_lo�i_ti�n, {g,d,p}, x�p_ch�ng}
		},
	},
	[2] = {
		["source"] = {
			{"��i ng�n phi�u",{2,1,199},1,10},
		},
		["target"] = {
			{"Ng�n phi�u",{2,1,145},1}
		},
	},
	[3] = {
		["source"] = {
			{"Kim chuy�n",{2,1,144},1,10},
		},
		["target"] = {
			{"��i ng�n phi�u",{2,1,199},1},
		},
	},
	[4] = {
		["source"] = {
			{"Kim chuy�n",{2,1,144},1,1000},
			{"��i ng�n phi�u",{2,1,199},1,100},
			{"Ng�n phi�u",{2,1,145},1,10},
		},
		["target"] = {
			{"Xu",{2,1,30230},2000}
		},
	},
	[5] = {
		["source"] = {
			{"Ho�ng kim ��i ng�n phi�u",{2,1,30490},1,1},
		},
		["target"] = {
			{"Kim chuy�n",{2,1,144},1},
		},
	},
}


tbBangCaoCap = {
	[1] = {"-��Hotel"},
	[6] = {"T�H�i"},
	[7] = {"H�o H�u"},
	[8] = {"=HeoCon!"},
	[11] = {"�Family"},
	[12] = {"��Gi㕰�"},
	[19] = {"MatTri"},
	[25] = {"Ngh� S�"},
	[33] = {"=-V�EmL�"},
	[38] = {"�PDHouse"},
	[63] = {"Ph�cH�ng"},
	[75] = {"_W-A-F_"},
}
tbBangSieuCap = {
	[2] = {"�Heroic"},
	[17] = {"Tinh V�"},
	[23] = {"!i-Max!"},
	[29] = {"C�ng T�"},
	[32] = {"Th�n�H�"},
	[33] = {"�M�tTr�-"},
	[53] = {"T�*Ngh�a"},
	[66] = {"=-Ng�Long"},
}

tbNguyenLieuVote = {
	[1] = {1, "v�ng", 1, 0},
	[2] = {{2,1,539,1}, "Ho�ng Kim ��i H�ng Bao 999 v�ng", 1100, 0 },
	[3] = {{2,1,30229,1}, "B�ch Kim ��i H�ng Bao 4000 v�ng", 4500, 0 },
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
	return nMax, tResult; -- tResult l�u s� l��ng chi ti�t; nMax l�u s� l��ng cao nh�t co' th� s�n xu�t
end;