Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_head.lua")
Include("\\script\\online_activites\\2010_11\\activity_02\\head.lua");
Include("\\script\\online\\qingming\\qingming_head.lua");

function OnUse(nItemIdx)
	local tbSay = {
		"Ho¹t ®éng Trung Thu 2008/get_mooncake_08_info",
		"Ho¹t ®éng Trung Thu 2009/get_new_year_09_info",
		"Ho¹t ®éng D©ng tÆng hoa H­íng D­¬ng/get_sunflower_info",
		"Ho¹t ®éng tiÕt Thanh Minh/get_qingming_info",
	}
	
	tinsert(tbSay, "§ãng cÈm nang/nothing");
	Say("CÈm nang nµy chØ ghi chÐp s¬ sµi vÒ mét sè ho¹t ®éng. Xin h·y ®Õn t×m §¹i sø ho¹t ®éng ®Ó vÊn thªm vÒ c¸c ho¹t ®éng kh¸c.",getn(tbSay),tbSay);
end

function nothing() end

