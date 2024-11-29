function main()
	--Say("Thanh Khª Lôc Minh cña bæn tiÖm næi danh xa gÇn, cã nhiÒu vŞ anh hïng lÆn léi ®Õn ®©y chØ v× mét b×nh trµ ngon nµy!",0)
	local szSay = "Thanh Khª Lôc Minh cña bæn tiÖm næi danh xa gÇn, cã nhiÒu vŞ anh hïng lÆn léi ®Õn ®©y chØ v× mét b×nh trµ ngon nµy!"
	local tSay = {}
	tinsert(tSay,"Ta ®ang kiÕm ®Üa m¨ng xµo ®©y/#Sale(5)");
	tinsert(tSay,"Ta tiÖn ®­êng ghĞ ch¬i th«i!/nothing");
	Say(szSay,getn(tSay),tSay)
end

function nothing()
end;