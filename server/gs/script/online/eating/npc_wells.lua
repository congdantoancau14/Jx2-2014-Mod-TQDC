

function main()
	Say("",3,"L�y n��c v�o h� l�/#getWater(1)","L�y n��c v�o b�u da/#getWater(2)","R�i �i/nothing")
end;

function getWater(nType)
	if nType == 1 then 
		if DelItem(2,1,29011,1) ~= 1 then 
			Talk(1,"",GetName()..": Ch�t th�t, ta qu�n m�t h� l� r�i...")
			return 0;
		else
			AddItem(2,1,29009,1)
		end
	elseif nType == 2 then 
		if DelItem(2,1,29012,1) ~= 1 then 
			Talk(1,"",GetName()..": Ch�t th�t, ta qu�n m�t b�u da r�i...")
			return 0;
		else
			AddItem(2,1,29010,1)
		end
	end
	return 1;
end;

function nothing() end;