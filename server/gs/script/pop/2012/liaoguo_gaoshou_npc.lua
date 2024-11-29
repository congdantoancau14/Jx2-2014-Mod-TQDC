--ÁÉ¹ú¸ßÊÖ
Include("\\script\\lib\\globalfunctions.lua")

function fighting(nNpcIdx)
	if nNpcIdx then
		ChangeNpcToFight(nNpcIdx);
	end
end
function main()
	local nNpcIdx = GetTargetNpc();
	local strtab = {
		"Ngoan ngo·n giao ra cèng phÈm!/#fighting(" .. nNpcIdx .. ")",
		}
	Say("Cao Thñ Liªu Quèc:",
		getn(strtab),
		strtab)
end

function OnDeath(nNpcIdx)
	gf_AddItemEx({2,96,116,1,4},"Cèng phÈm bÞ mÊt");
	RemoveNpc(nNpcIdx);
end
