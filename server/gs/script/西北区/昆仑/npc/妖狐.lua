Include("\\script\\task\\huofengtask\\npc_enter_wanlingtai.lua")
TB_FOX_DIALOG = {
	"<color=green>Hå Yªu<color>: Lµ ai lµm, ta sÏ kh«ng tha!",
	"<color=green>Hå Yªu<color>: TrËn ph¸p nµy ngµy cµng m¹nh, ta kh«ng thÓ cö ®éng!",
	"<color=green>Hå Yªu<color>: Ai tíi cøu ta! Ta...kiÖt søc råi...",
}
function main()
	if tGtTask:check_task_isfinish(270) ~= 1 then
		Talk(1,"",TB_FOX_DIALOG[random(getn(TB_FOX_DIALOG))])
	else
		npc_talk_main()
	end
end
