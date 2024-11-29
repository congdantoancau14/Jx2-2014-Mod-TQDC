Include("\\script\\online\\viet_event\\200908\\quockhanh\\quockhanh_head.lua")

function main()
	local szSex = "";
	if GetSex() == 1 then
		szSex = "Chó";
	else
		szSex = "C«";
	end
	Say("ë ®©y ®«ng vui nhén nhÞp qu¸!",1,"Con cã muèn ®­îc "..szSex.." cho kÑo kh«ng? :)/nothing")
end;

function nothing()
end;