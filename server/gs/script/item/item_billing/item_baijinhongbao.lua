function main()
	
end


function OnUse(nItemIdx)
    if DelItemByIndex(nItemIdx, 1) == 1 then
        Earn(40000000)
    end
end