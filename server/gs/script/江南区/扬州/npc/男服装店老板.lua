tItems = {
	[1] = {"gÊm lam",{2,1,15},1400},
	[2] = {"gÊm vµng",{2,1,54},1700},
	[3] = {"v¶i lôa cao cÊp",{2,1,30360},90000},
	[4] = {"t¬ lôa §¹i Lý",{2,95,929},80000},
	[5] = {"hép gÊm",{2,0,168},500000},
}
item = {}

function main()
		if random(1,15) == 1 then
			NpcChat(GetTargetNpc(),"Kh¶m n¹m linh th¹ch dïng ®Ó lµm trang bÞ B¸t Qu¸i ®· xuÊt hiÖn trªn giang hå, ta s¾p cã mèi lµm ¨n råi ®©y!");
		end;	
			
		local szPlayerName = GetName()
		Say(GetTargetNpc()..": V¶i voc ë D­¬ng Ch©u th× kh«ng thiÕu. Nh­ng nghe nãi vïng Trung Nguyªn cã lo¹i v¶i cao cÊp do thî dÖt næi tiÕng CÈm N­¬ng ®Æc chÕ"
			.."hay T©y Nam cu~ng cã mét lo¹i lôa hoµng thÊt §¹i Lý. Ch¼ng hay c¸c h¹ cã thÓ hîp t¸c, cung cÊp c¸c lo¹i v¶i cho bæn ®iÕm hay kh«ng?", 3,
			szPlayerName..": Ta muèn mua trang phôc/muaTrangPhuc",
			szPlayerName..": Ta muèn cung cÊp cho «ng mét it v¶i voc/choose",
			szPlayerName..": Ch¼ng hay d¹o nµy l·o b¶n lµm ¨n thÕ nµo/nothing"
		)
end;

function choose()
	
	local tSay = {}
	for i=1, getn(tItems) do
		tinsert(tSay,format("Ta cã mét it %s/#supply(%d)",tItems[i][1],i))
	end
	tinsert(tSay, "Ta nãi ch¬i th«i, hihi!/nothing")
	Say("§­îc lµm ¨n víi c¸c h¹ lµ vinh h¹nh cña bæn tiÖm?",getn(tSay),tSay)
end;

function supply(id)
	local nCount = GetItemCount(tItems[id][2][1], tItems[id][2][2], tItems[id][2][3]);
	item = {tItems[id][2][1], tItems[id][2][2], tItems[id][2][3], tItems[id][3]};
	AskClientForNumber("_request_number_call_back",1,nCount,"C¸c h¹ muèn b¸n mÊy tÊm?");
end;

function _request_number_call_back(nNum)
	if nNum < 1 then
		Msg2Player("§· hñy bá giao dÞch");
		return
	end
	local nDelResult = DelItem(item[1],item[2],item[3],nNum)
	if nDelResult then
		Earn(item[4] * nNum)
		Msg2Player("Giao dÞch thµnh c«ng!");
		Say("Cã hµng l¹i tíi chç ta nhe'",1,"§­îc th«i!/nothing")
	end
end;

function getItem()
	return item
end;

function nothing()
end;

function muaTrangPhuc()
	Sale(43)
end;