

Include("\\script\\lib\\transport_head.lua")

function main()

	Say("<color=green>Xa phu T©y V˘c<color>: Ta c„ th” nhanh ch„ng Æ≠a ng≠¨i Æ’n Th t Lπc Nhai, mi‘n ph› nhe'!",2,
	"ß’n Th t Lπc nhai/shiluoya",
	"K’t thÛc ÆËi thoπi/no")

end

function shiluoya()
	CleanInteractive();
	NewWorld(6300,1500,3000);
	SetFightState(0);
end;

function no()
end;


