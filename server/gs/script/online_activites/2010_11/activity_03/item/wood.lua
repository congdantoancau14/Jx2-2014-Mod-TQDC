function OnUse(itemIndex)
	-- do return end
	if 1 == DelItemByIndex(itemIndex) then
		ModifyExp(1000);
	end
end