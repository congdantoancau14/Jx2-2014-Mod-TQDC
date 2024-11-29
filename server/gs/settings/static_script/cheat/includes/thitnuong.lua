Include("\\script\\online\\viet_event\\200909\\2\\init_denglong.lua");

function showlistLoNuong()
	local tSay = {}
	for i=0, getn(t_denglong_sets) do
		tinsert(tSay, "* Khëi ®éng lß n­íng t¹i "..t_denglong_sets[i][1]..format("/#khoidongLonuong(%d)",i))
	end
	tinsert(tSay, "Tho¸t/nothing");
	Say(g_szTitle.."Lùa chän lß n­íng", getn(tSay), tSay);
end;

function khoidongLonuong(nDay)
	create_npcs(nDay);
end;