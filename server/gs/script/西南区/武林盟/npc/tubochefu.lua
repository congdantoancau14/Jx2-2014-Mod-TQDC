

Include("\\script\\lib\\transport_head.lua")

function main()

	Say("<color=green>C�t Kh�m X�ch Ba<color>: C�c h� c� vi�c g� kh�ng?",2,
	"�i Qu�nh K�t/qiongjie",
	"R�i kh�i/no")

end

function qiongjie()
	CleanInteractive();
	NewWorld(6100,1700,3200);
	SetFightState(0);
end;

function no()
end;


