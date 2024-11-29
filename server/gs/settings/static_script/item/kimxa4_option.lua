KXDH = {
	[1] = {
		[1056] = "Linh ho�t B",
		[1057] = "Th�n ph�p B",
	},
	[2] = {
		[1069] = "S�c m�nh B",
		[1070] = "G�n c�t B",
		[1071] = "N�i c�ng B",
		[1072] = "Sinh l�c B",
		[1073] = "T� l� sinh l�c B",
	},
	[3] = {
		[1079] = "Linh ho�t B",
		[1080] = "Th�n ph�p B",
	},
	[4] = {
		[1] = {
			[1092] = "Ph�n ��n ngo�i c�ng/1%B",
			[1093] = "Ph�n ��n n�i c�ng/1%B",
			[1094] = "T�ng s�t th��ng/1B",
			[1095] = "K�m theo ��c s�t/1B",
			[1096] = "T�ng s�t th��ng c� ��c/1B",
		},
		[2] = {
			[1108] = "Ph�n ��n ngo�i c�ng/1%B",
			[1109] = "Ph�n ��n n�i c�ng/1%B",
			[1110] = "T�ng s�t th��ng/1B",
			[1111] = "K�m theo ��c s�t/1B",
			[1112] = "T�ng s�t th��ng c� ��c/1B",
		},
		[3] = {
			[1123] = "T�ng t�c �� xu�t chi�u/1%B",
			[1124] = "Kh�ng t�t c� B",
			[1125] = "T�ng ch� m�nh/1%B",
		}
	}
}

KXTH = {
	[1] = {
		[1129] = "S�c m�nh B",
	},
	[2] = {
		[1143] = "Linh ho�t B",
		[1144] = "Th�n ph�p B",
		[1145] = "G�n c�t B",
		[1146] = "N�i c�ng B",
		[1147] = "Sinh l�c B",
		[1148] = "T� l� sinh l�c B",
	},
	[3] = {
		[1156] = "S�c m�nh B",
		[1157] = "G�n c�t B",
		[1158] = "Sinh l�c %B",
	},
	[4] = {
		[1] = {
			[1168] = "Ph�n ��n ngo�i c�ng/1B",
			[1169] = "Ph�n ��n n�i c�ng/1B",
			[1170] = "T�ng ngo�i c�ng/1%B",
			[1171] = "T�ng c�ng k�ch ngo�i c�ng/1B",
		},
		[2] = {
			[1181] = "Ph�n ��n ngo�i c�ng/1B",
			[1182] = "Ph�n ��n n�i c�ng/1B",
			[1183] = "T�ng ngo�i c�ng/1%B",
			[1184] = "T�ng c�ng k�ch ngo�i c�ng/1B",
		},
		[3] = {
			[1194] = "T�c �� di chuy�n/1%B",
			[1195] = "T�ng t�c �� xu�t chi�u/1%B",
			[1196] = "H�t sinh l�c B",
			[1197] = "Gi�m th� th��ng/1%B",
		}
	}
}

KXVD = {
	[1] = {
		[1201] = "N�i c�ng B",
	},
	[2] = {
		[1213] = "Linh ho�t B",
		[1214] = "Th�n ph�p B",
		[1215] = "G�n c�t B",
		[1216] = "Sinh l�c B",
		[1217] = "T� l� sinh l�c B",
	},
	[3] = {
		[1225] = "Linh ho�t B",
		[1226] = "Th�n ph�p B",
		[1227] = "N�i c�ng B",
	},
	[4] = {
		[1] = {
			[1237] = "T�ng n�i c�ng/1%B",
			[1238] = "T�ng c�ng k�ch n�i c�ng/1B",
			[1239] = "N�i c�ng l�n nh�t tr�n v� kh� t�ng/1B",
			[1240] = "N�i c�ng nh� nh�t tr�n v� kh� t�ng/1B",
		},
		[2] = {
			[1250] = "T�ng n�i c�ng/1%B",
			[1251] = "T�ng c�ng k�ch n�i c�ng/1B",
			[1252] = "N�i c�ng l�n nh�t tr�n v� kh� t�ng/1B",
			[1253] = "N�i c�ng nh� nh�t tr�n v� kh� t�ng/1B",
		},
		[3] = {
			[1263] = "T�c �� di chuy�n/1%B",
			[1264] = "T�ng t�c �� xu�t chi�u/1%B",
			[1265] = "Gi�m th� th��ng/1%B",
			[1266] = "T�ng ch� m�nh/1%B",
		}
	}
}


function OnUse()
	showKX4();
end;

function showKX4()
	tSay = {
		"Du hi�p/#getRandomKX4(26)",
		"Thi�t huy�t/#getRandomKX4(27)",
		"V�n du/#getRandomKX4(28)",
	}
	tinsert(tSay,"Ch�a mu�n nh�n/nothing");
	Say("Ch�n lo�i kim x�",getn(tSay),tSay);
end;

function getRandomKX4(nSet)
	
	local tSet = {};
	if nSet == 26 then tSet = KXDH
	elseif nSet == 27 then tSet = KXTH
	elseif nSet == 28 then tSet = KXVD end;
	
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("Nh�n kim x� th�nh c�ng!");
	end;
end;

function addSetofKX(tSet, nSet)
	local r1,r2,r3,r4,r5,r6;
	-- Add Phi phong
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,1);
	AddKX(152,nSet,r1,r2,r3,r4,r5,r6);
	-- Add Huy ch��ng
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,2);
	AddKX(153,nSet,r1,r2,r3,r4,r5,r6);
	-- Add Chi�n h�i
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,3);
	AddKX(154,nSet,r1,r2,r3,r4,r5,r6);
	return 1;
end

function getIndexs(tList,nPos)
	local tSubList = {}
	local nListLen = getn(tList);
	
	if nPos == 1 then
		tSubList = tList[nListLen][1];
	elseif nPos == 2 then
		if getn(tList[nListLen]) == 3 then
			tSubList = tList[nListLen][2];
		else
			tSubList = tList[nListLen][1];
		end
	elseif nPos == 3 then
		if getn(tList[nListLen]) == 3 then 
			tSubList = tList[nListLen][3];
		else
			tSubList = tList[nListLen][2];
		end
	end
	
	local r1,r2,r3,r4,r5,r6;
	if nListLen == 6 then 			
		r1 = getRandomIndex(tList[1]);
		r2 = getRandomIndex(tList[2]);
		r3 = getRandomIndex(tList[3]);
		r4 = getRandomIndex(tList[4]);
		r5 = getRandomIndex(tList[5]);
		r6 = getRandomIndex(tSubList);
		-- print(r1,r2,r3,r4,r5,r6);
	elseif nListLen == 4 then 
		r1 = getRandomIndex(tList[1]);
		r2 = getRandomIndex(tList[2]);
		r3 = getRandomIndex(tList[3]);
		r4 = getRandomIndex(tSubList);
	end
		
	return r1,r2,r3,r4,r5,r6;
end;

function chooseOption(r1,r2,r3,r4,r5,r6)
	
end;

function getRandomIndex(tList)
	local nIndexResult = -1;
	if tList == nil then 
		return 0
	end
	local nRandNum = random(tlen(tList));
	local i = 0;
	for k,v in tList do 
		i = i+1;
		if i == nRandNum then
			nIndexResult = k;
			break
		end
	end
	return nIndexResult;
end;

function tlen(tList)
	local i = 0;
	for k,v in tList do 
		i = i+1;
	end
	return i;
end;

function AddKX(nType,nSet,ID1,ID2,ID3,ID4,ID5,ID6)
	local nResult,nItemIndex = AddItem(0,nType,nSet,1,4,-1,-1,-1,-1,-1,-1,0,15)
    FeedItem(nItemIndex,1000000)
	if ID5 ~= nil and ID6 ~= nil then 
		SetItemFeedUpAttrs(nItemIndex,ID1,ID2,ID3,ID4,ID5,ID6);
	else
		SetItemFeedUpAttrs(nItemIndex,ID1,ID2,0,ID3,0,ID4);
	end
end

