function OnUse()
	getKx();
end;

function getKx()
	addKX(1); -- du hi?p
	addKX(2); -- thi?t huy?t
	addKX(3); -- v?n du
end;

function addKX(nType)
	if nType == 1 then
	end
	for i=1,3 do
		addKXVanDu(i);
	end
end;

function addKXDuHiep(nType)
	-- Tham kh?o equip_feed_attr_group.txt
	local id1=1201 -- d-?ng th¦Ình 1
	local id2=random(1213,1217) -- d-?ng th¦Ình 2
	local id3=random(1225,1227) -- m?kh?a 1
	-- m?kh?a 2	
	local id4pp=random(1237,1240) -- phi phong 
	local id4hc=random(1250,1253) -- huy ch-?ng
	local id4gg=random(1263,1266) -- giay gi?
	local id4 = 0;
	
	local nD = 0;
	local nP = 28
	if nType == 1 then
		nD = 152;
		id4 = id4pp;
	elseif nType == 2 then
		nD = 153;
		id4 = id4hc;
	elseif nType == 3 then
		nD = 154;
		id4 = id4gg;
	end
	addKXByParticular(nD,nP,id1,id2,id3,id4);
end;

function addKXThietHuyet(nType)
	-- Tham kh?o equip_feed_attr_group.txt
	local id1=1201 -- d-?ng th¦Ình 1
	local id2=random(1213,1217) -- d-?ng th¦Ình 2
	local id3=random(1225,1227) -- m?kh?a 1
	-- m?kh?a 2	
	local id4pp=random(1237,1240) -- phi phong 
	local id4hc=random(1250,1253) -- huy ch-?ng
	local id4gg=random(1263,1266) -- giay gi?
	local id4 = 0;
	
	local nD = 0;
	local nP = 28
	if nType == 1 then
		nD = 152;
		id4 = id4pp;
	elseif nType == 2 then
		nD = 153;
		id4 = id4hc;
	elseif nType == 3 then
		nD = 154;
		id4 = id4gg;
	end
	addKXByParticular(nD,nP,id1,id2,id3,id4);
end;

function addKXVanDu(nType)
	-- Tham kh?o equip_feed_attr_group.txt
	local id1=1201 -- d-?ng th¦Ình 1
	local id2=random(1213,1217) -- d-?ng th¦Ình 2
	local id3=random(1225,1227) -- m?kh?a 1
	-- m?kh?a 2	
	local id4pp=random(1237,1240) -- phi phong 
	local id4hc=random(1250,1253) -- huy ch-?ng
	local id4gg=random(1263,1266) -- giay gi?
	local id4 = 0;
	
	local nD = 0;
	local nP = 28
	if nType == 1 then
		nD = 152;
		id4 = id4pp;
	elseif nType == 2 then
		nD = 153;
		id4 = id4hc;
	elseif nType == 3 then
		nD = 154;
		id4 = id4gg;
	end
	addKXByParticular(nD,nP,id1,id2,id3,id4);
end;

function addKXByParticular(nD,nP,id1,id2,id3,id4)
	local nLevel = 15;
	local nG = 0;
	local nAdd,nIndex = AddItem(nG,nD,nP,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
	SetItemFeedUpAttrs(nIndex,id1,id2,0,id3,0,id4);
	FeedItem(nIndex,1000000)
end;

