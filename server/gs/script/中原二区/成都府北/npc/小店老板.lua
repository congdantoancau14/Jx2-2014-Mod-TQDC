function main()
	--Say("Thanh Khª Lôc Minh cña bæn tiÖm næi danh xa gÇn, cã nhiÒu vŞ anh hïng lÆn léi ®Õn ®©y chØ v× mét b×nh trµ ngon nµy!",0)
	local szSay = "Thanh Khª Lôc Minh cña bæn tiÖm næi danh xa gÇn, cã nhiÒu vŞ anh hïng lÆn léi ®Õn ®©y chØ v× mét b×nh trµ ngon nµy!"
	local tSay = {}
	tinsert(tSay,"Ta ®ang kiÕm ®Üa m¨ng xµo ®©y/buy");
	tinsert(tSay,"Ta tiÖn ®­êng ghĞ ch¬i th«i!/nothing");
	Say(szSay,getn(tSay),tSay)
end

function buy();
	SetFightState(0);
	Sale(5)
end

function nothing()
	SetFightState(1);
end;