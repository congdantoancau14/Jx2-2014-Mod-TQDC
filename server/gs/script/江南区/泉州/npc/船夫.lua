---��������2����.lua---
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua");
function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Thuy�n Phu<color> v� %s n�y mu�n �i ��u?",sName),4,
		"��a ta �i C� ��o!/gudao",
		"��a ta �i H�i ngo�i C� ��o!/goHaiwaigudao",
		"��n T�y ��o (mi�n ph�)/xidao",
		"Kh�ng c�n ��u!/no"
	);	
end;

-- Thi�n Nhai h�i gi�c
function gudao()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti�n nh� quay l�i nh�!")
	else 
		NewWorld(117,1559,3163);
	end
end;

function goHaiwaigudao()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti�n nh� quay l�i nh�!")
	else 
		NewWorld(101,1559,3163);
	end
end

function moneygo()
	if GetCash() >=1000 then
		PrePay(1000)
		return 1
	else
		return 0
	end
end;

function xidao()
	if IsHaveTaskOrCanGet2(60, 62) == 1 then
		NewWorld(6014,1536,3291)
		SetFightState(1)
		return 1;
	end
	Talk(1,"","c�c h� kh�ng th� v�o khu v�c n�y.");
end

function no()
end;