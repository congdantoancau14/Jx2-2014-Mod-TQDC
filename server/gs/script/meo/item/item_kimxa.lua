function OnUse()
	if DelItem(2,1,31231,1) == 1 then 
		local nPos = random(152,154);
		local nType = random(26,28);
		AddItem(0,nPos,nType,1);
	end
end;