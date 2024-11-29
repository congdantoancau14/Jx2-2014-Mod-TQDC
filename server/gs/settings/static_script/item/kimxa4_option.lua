KXDH = {
	[1] = {
		[1056] = "Linh ho¹t B",
		[1057] = "Th©n ph¸p B",
	},
	[2] = {
		[1069] = "Søc m¹nh B",
		[1070] = "G©n cèt B",
		[1071] = "Néi c«ng B",
		[1072] = "Sinh lùc B",
		[1073] = "Tû lÖ sinh lùc B",
	},
	[3] = {
		[1079] = "Linh ho¹t B",
		[1080] = "Th©n ph¸p B",
	},
	[4] = {
		[1] = {
			[1092] = "Ph¶n ®ßn ngo¹i c«ng/1%B",
			[1093] = "Ph¶n ®ßn néi c«ng/1%B",
			[1094] = "T¨ng s¸t th­¬ng/1B",
			[1095] = "KÌm theo ®éc s¸t/1B",
			[1096] = "T¨ng s¸t th­¬ng cæ ®éc/1B",
		},
		[2] = {
			[1108] = "Ph¶n ®ßn ngo¹i c«ng/1%B",
			[1109] = "Ph¶n ®ßn néi c«ng/1%B",
			[1110] = "T¨ng s¸t th­¬ng/1B",
			[1111] = "KÌm theo ®éc s¸t/1B",
			[1112] = "T¨ng s¸t th­¬ng cæ ®éc/1B",
		},
		[3] = {
			[1123] = "T¨ng tèc ®é xuÊt chiªu/1%B",
			[1124] = "Kh¸ng tÊt c¶ B",
			[1125] = "T¨ng chÝ mÖnh/1%B",
		}
	}
}

KXTH = {
	[1] = {
		[1129] = "Søc m¹nh B",
	},
	[2] = {
		[1143] = "Linh ho¹t B",
		[1144] = "Th©n ph¸p B",
		[1145] = "G©n cèt B",
		[1146] = "Néi c«ng B",
		[1147] = "Sinh lùc B",
		[1148] = "Tû lÖ sinh lùc B",
	},
	[3] = {
		[1156] = "Søc m¹nh B",
		[1157] = "G©n cèt B",
		[1158] = "Sinh lùc %B",
	},
	[4] = {
		[1] = {
			[1168] = "Ph¶n ®ßn ngo¹i c«ng/1B",
			[1169] = "Ph¶n ®ßn néi c«ng/1B",
			[1170] = "T¨ng ngo¹i c«ng/1%B",
			[1171] = "Tæng c«ng kÝch ngo¹i c«ng/1B",
		},
		[2] = {
			[1181] = "Ph¶n ®ßn ngo¹i c«ng/1B",
			[1182] = "Ph¶n ®ßn néi c«ng/1B",
			[1183] = "T¨ng ngo¹i c«ng/1%B",
			[1184] = "Tæng c«ng kÝch ngo¹i c«ng/1B",
		},
		[3] = {
			[1194] = "Tèc ®é di chuyÓn/1%B",
			[1195] = "T¨ng tèc ®é xuÊt chiªu/1%B",
			[1196] = "Hót sinh lùc B",
			[1197] = "Gi¶m thä th­¬ng/1%B",
		}
	}
}

KXVD = {
	[1] = {
		[1201] = "Néi c«ng B",
	},
	[2] = {
		[1213] = "Linh ho¹t B",
		[1214] = "Th©n ph¸p B",
		[1215] = "G©n cèt B",
		[1216] = "Sinh lùc B",
		[1217] = "Tû lÖ sinh lùc B",
	},
	[3] = {
		[1225] = "Linh ho¹t B",
		[1226] = "Th©n ph¸p B",
		[1227] = "Néi c«ng B",
	},
	[4] = {
		[1] = {
			[1237] = "T¨ng néi c«ng/1%B",
			[1238] = "Tæng c«ng kÝch néi c«ng/1B",
			[1239] = "Néi c«ng lín nhÊt trªn vò khÝ t¨ng/1B",
			[1240] = "Néi c«ng nhá nhÊt trªn vò khÝ t¨ng/1B",
		},
		[2] = {
			[1250] = "T¨ng néi c«ng/1%B",
			[1251] = "Tæng c«ng kÝch néi c«ng/1B",
			[1252] = "Néi c«ng lín nhÊt trªn vò khÝ t¨ng/1B",
			[1253] = "Néi c«ng nhá nhÊt trªn vò khÝ t¨ng/1B",
		},
		[3] = {
			[1263] = "Tèc ®é di chuyÓn/1%B",
			[1264] = "T¨ng tèc ®é xuÊt chiªu/1%B",
			[1265] = "Gi¶m thä th­¬ng/1%B",
			[1266] = "T¨ng chÝ mÖnh/1%B",
		}
	}
}


function OnUse()
	showKX4();
end;

function showKX4()
	tSay = {
		"Du hiÖp/#getRandomKX4(26)",
		"ThiÕt huyÕt/#getRandomKX4(27)",
		"V©n du/#getRandomKX4(28)",
	}
	tinsert(tSay,"Ch­a muèn nhËn/nothing");
	Say("Chän lo¹i kim xµ",getn(tSay),tSay);
end;

function getRandomKX4(nSet)
	
	local tSet = {};
	if nSet == 26 then tSet = KXDH
	elseif nSet == 27 then tSet = KXTH
	elseif nSet == 28 then tSet = KXVD end;
	
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("NhËn kim xµ thµnh c«ng!");
	end;
end;

function addSetofKX(tSet, nSet)
	local r1,r2,r3,r4,r5,r6;
	-- Add Phi phong
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,1);
	AddKX(152,nSet,r1,r2,r3,r4,r5,r6);
	-- Add Huy ch­¬ng
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,2);
	AddKX(153,nSet,r1,r2,r3,r4,r5,r6);
	-- Add ChiÕn hµi
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

