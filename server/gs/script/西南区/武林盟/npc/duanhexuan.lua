

Include("\\script\\lib\\transport_head.lua")

function main()

	Say("<color=green>�o�n H�a Huy�n<color>: C�c h� c� vi�c g� kh�ng?",2,
	"�i Thi�n Long t�/tianlongsi",
	"R�i kh�i/no")

end

function tianlongsi()
	CleanInteractive();
	NewWorld(6000,1500,3000);
	SetFightState(0);
end;

function no()
end;


