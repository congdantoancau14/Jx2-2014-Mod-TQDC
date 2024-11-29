--

function main()
print("trap is called")
	local nResult = 0;
	while nResult ~= 1 do
		local nMap = random(100,8910);
		local nResult = NewWorld(nMap,180*8,180*16+2);
		if nResult == 0 then
			nResult = NewWorld(nMap,180*8,220*16+2);
		end
		if nResult == 0 then
			nResult = NewWorld(nMap,220*8,180*16+2);
		end
		if nResult == 0 then
			nResult = NewWorld(nMap,220*8,220*16+2);
		end
		if nResult == 0 then
			nResult = NewWorld(nMap,200*8,200*16+2);
		end
		if nResult == 1 then -- in the case while condition not work
			break
		end
	end
	SetFightState(1);
end;