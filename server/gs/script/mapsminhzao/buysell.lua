
Include("\\script\\faction\\npc\\buy_sell_main.lua")
function main()
	local sDiaHead,tDiaSel = faction_buysell_main(9)
	Say(sDiaHead,getn(tDiaSel),tDiaSel)
end