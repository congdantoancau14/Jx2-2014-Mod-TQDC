function main()
	--Say("Thanh Kh� L�c Minh c�a b�n ti�m n�i danh xa g�n, c� nhi�u v� anh h�ng l�n l�i ��n ��y ch� v� m�t b�nh tr� ngon n�y!",0)
	local szSay = "Thanh Kh� L�c Minh c�a b�n ti�m n�i danh xa g�n, c� nhi�u v� anh h�ng l�n l�i ��n ��y ch� v� m�t b�nh tr� ngon n�y!"
	local tSay = {}
	tinsert(tSay,"Ta �ang ki�m ��a m�ng x�o ��y/buy");
	tinsert(tSay,"Ta ti�n ���ng gh� ch�i th�i!/nothing");
	Say(szSay,getn(tSay),tSay)
end

function buy();
	SetFightState(0);
	Sale(5)
end

function nothing()
	SetFightState(1);
end;