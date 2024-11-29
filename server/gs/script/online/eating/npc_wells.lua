

function main()
	Say("",3,"LÊy n­íc vµo hå l«/#getWater(1)","LÊy n­íc vµo bÇu da/#getWater(2)","Rêi ®i/nothing")
end;

function getWater(nType)
	if nType == 1 then 
		if DelItem(2,1,29011,1) ~= 1 then 
			Talk(1,"",GetName()..": ChÕt thËt, ta quªn mÊt hå l« råi...")
			return 0;
		else
			AddItem(2,1,29009,1)
		end
	elseif nType == 2 then 
		if DelItem(2,1,29012,1) ~= 1 then 
			Talk(1,"",GetName()..": ChÕt thËt, ta quªn mÊt bÇu da råi...")
			return 0;
		else
			AddItem(2,1,29010,1)
		end
	end
	return 1;
end;

function nothing() end;