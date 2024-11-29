

Include("\\script\\lib\\transport_head.lua")

function main()

	Say("<color=green>C¸t Kh©m XÝch Ba<color>: C¸c h¹ cã viÖc g× kh«ng?",2,
	"§i Quúnh KÕt/qiongjie",
	"Rêi khái/no")

end

function qiongjie()
	CleanInteractive();
	NewWorld(6100,1700,3200);
	SetFightState(0);
end;

function no()
end;


