Include("\\script\\online\\viet_event\\200908\\quockhanh\\quockhanh_head.lua")

function main()
	local szSex = "";
	if GetSex() == 1 then
		szSex = "Ch�";
	else
		szSex = "C�";
	end
	Say("� ��y ��ng vui nh�n nh�p qu�!",1,"Con c� mu�n ���c "..szSex.." cho k�o kh�ng? :)/nothing")
end;

function nothing()
end;