

Include("\\script\\lib\\transport_head.lua")

function main()

	Say("<color=green>Xa phu T�y V�c<color>: Ta c� th� nhanh ch�ng ��a ng��i ��n Th�t L�c Nhai, mi�n ph� nhe'!",2,
	"��n Th�t L�c nhai/shiluoya",
	"K�t th�c ��i tho�i/no")

end

function shiluoya()
	CleanInteractive();
	NewWorld(6300,1500,3000);
	SetFightState(0);
end;

function no()
end;


