

Include("\\script\\lib\\transport_head.lua")

function main()

	Say("<color=green>Ly' K� Tinh<color>: C�c h� c� vi�c g� kh�ng?",2,
	"�i H�ng Kh�nh/xingqing",
	"R�i kh�i/no")

end

function xingqing()
	CleanInteractive();
	NewWorld(6200,1500,3000);
	SetFightState(0);
end;

function no()
end;


