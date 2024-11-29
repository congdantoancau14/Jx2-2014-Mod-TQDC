

Include("\\script\\lib\\transport_head.lua")

function main()

	Say("<color=green>§o¹n Hßa HuyÒn<color>: C¸c h¹ cã viÖc g× kh«ng?",2,
	"§i Thiªn Long tù/tianlongsi",
	"Rêi khái/no")

end

function tianlongsi()
	CleanInteractive();
	NewWorld(6000,1500,3000);
	SetFightState(0);
end;

function no()
end;


