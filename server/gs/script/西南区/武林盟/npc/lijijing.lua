

Include("\\script\\lib\\transport_head.lua")

function main()

	Say("<color=green>Ly' KÕ Tinh<color>: C¸c h¹ cã viÖc g× kh«ng?",2,
	"§i H­ng Kh¸nh/xingqing",
	"Rêi khái/no")

end

function xingqing()
	CleanInteractive();
	NewWorld(6200,1500,3000);
	SetFightState(0);
end;

function no()
end;


