--Thªm tµi kho¶n GM d­íi d¹ng
--[Tªn tµi kho¶n] = 1
--Tªn tµi kho¶n, kh«ng ph¶i tªn nh©n vËt trong game

List_GM_Account = {
	["test"] = 1,
	["insac96"] = 1,
	["f1"] = 1,
	["f4"] = 1,
	["ft"] = 1,
	["l1"] = 1,
	["l2"] = 1,
	["l3"] = 1,
	["l4"] = 1,
	["t1"] = 1,
}

function CheckName(nName) 
	if not List_GM_Account[nName]  or List_GM_Account[nName] == 0 then return 0 end
	return 1
end
