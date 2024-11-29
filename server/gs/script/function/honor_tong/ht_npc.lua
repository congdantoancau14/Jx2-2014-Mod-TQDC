Include("\\script\\function\\honor_tong\\ht_head.lua")
Include("\\script\\lib\\talktmp.lua")

HTN_DIALOG = {
	"Giíi thiÖu Bang Héi Vinh Danh/htn_Infomation",
	"§¨ng ký tham gia Bang Héi Vinh Danh/htn_SignTong",
	"Cèng hiÖn x©y dùng bang héi/htn_BuildTong",
	"NhËn phÇn th­ëng xÕp h¹ng/htn_RankAward",
	"Xem ®iÓm cèng hiÕn bang ph¸i vµ xÕp h¹ng/htn_TongRank",
};

HTN_TITLE = "V× danh dù cña bang héi, c¸c thµnh viªn h·y nhanh chãng hµnh ®éng nµo!";

function htn_Infomation()
	local tSay = {
		"§iÒu kiÖn tham gia /htn_Info_JoinCondition",
		"Lµm sao cèng hiÕn x©y dùng bang héi/htn_Info_BuildTong",
		"Lµm sao nhËn ®­îc nguyªn liÖu/htn_Info_GetMaterial",
		"PhÇn th­ëng xÕp h¹ng bang héi/htn_Info_TongRank",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(HT_NPC..format("%s muèn t×m hiÓu th«ng tin g×?", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function htn_Info_JoinCondition()
	local tbBody = "\n";
	local tbSay = {};
	tbSay.msg = HT_NPC..tbBody;
	tbSay.sel = {
		{"\n Ph¶n håi", "htn_Infomation"},
		{"Ra khái","nothing"},
	};
	temp_Talk(tbSay);
end

function htn_Info_BuildTong()
	local tbBody = "Thµnh viªn bang héi cã thÓ ®Õn chç §¹i Sø Ho¹t §éng ®Ó nép [M¶nh LÖnh Bµi Bang Héi]*1, [XU ®¹o cô]*1, mçi lÇn cèng hiÕn x©y dùng bang héi sÏ nhËn ®­îc phÇn th­ëng EXP vµ ®¹o cô, ®ång thêi bang héi céng thªm 1 ®iÓm cèng hiÕn, ®iÓm cèng hiÕn quyÕt ®Þnh thø h¹ng cña bang héi, h¹ng cao sÏ nhËn ®­îc phÇn th­ëng thªm.";
	local tbSay = {};
	tbSay.msg = HT_NPC..tbBody;
	tbSay.sel = {
		{"\n Ph¶n håi", "htn_Infomation"},
		{"Ra khái","nothing"},
	};
	temp_Talk(tbSay);
end

function htn_Info_GetMaterial()
	local tDialog = {
		"Tham gia YÕn TiÖc Bang Héi nhËn ®­îc M¶nh LÖnh Bµi Bang Héi/htn_Info_GetMaterial",
		"Më R­¬ng Vµng §¹i ChiÕn (BOSS thÕ giíi):  nhËn ®­îc 05 M¶nh LÖnh Bµi Bang Héi/htn_Info_GetMaterial",
		"Më §¹i ChiÕn B¶o H¹p (BOSS thÕ giíi):  nhËn ®­îc 01 M¶nh LÖnh Bµi Bang Héi/htn_Info_GetMaterial",
		"¶i Th¸i NhÊt Th¸p:  nhËn ®­îc 01 M¶nh LÖnh Bµi Bang Héi/htn_Info_GetMaterial",
		"¶i Th¸i NhÊt Th¸p-Anh Hïng:  nhËn ®­îc 01 M¶nh LÖnh Bµi Bang Héi/htn_Info_GetMaterial",
		"¶i V¹n KiÕm Tròng:  nhËn ®­îc 01 M¶nh LÖnh Bµi Bang Héi/htn_Info_GetMaterial",
		"¶i §Þa HuyÒn Cung:  nhËn ®­îc 01 M¶nh LÖnh Bµi Bang Héi/htn_Info_GetMaterial",
		"¶i L­¬ng S¬n B¹c:  nhËn ®­îc 01 M¶nh LÖnh Bµi Bang Héi/htn_Info_GetMaterial",
		"V­ît ¶i Tö Quang C¸c nhËn ®­îc 02 M¶nh LÖnh Bµi Bang Héi/htn_Info_GetMaterial",
		"trë l¹i/htn_Infomation",
		"Ra khái/nothing",
	}
	Say(HT_NPC.."D­íi ®©y lµ nh÷ng c¸ch ®Ó nhËn ®­îc M¶nh LÖnh Bµi Bang Héi: ", getn(tDialog), tDialog);
end

function htn_Info_TongRank()
	local tbBody = format("§iÓm cèng hiÕn bang héi ®¹t %d ®iÓm sÏ nhËn ®­îc nhiÒu EXP vµ Vâ L©m TriÖu TËp LÖnh, Vâ L©m TriÖu TËp LÖnh dïng ®Ó triÖu håi BOSS §«ng Ph­¬ng BÊt B¹i, ®¸nh b¹i BOSS nhËn ®­îc R­¬ng Vµng Bang Ph¸i, më r­¬ng sÏ nhËn ®­îc phÇn th­ëng cùc phÈm, ngoµi ra bang héi h¹ng 1 cßn nhËn ®­îc danh hiÖu <color=gold>Bang Chñ Vinh Dù<color> vµ <color=gold>Bang Héi Vinh Danh<color>", HT_TONG_VALUE_LIMIT);
	local tbSay = {};
	tbSay.msg = HT_NPC..tbBody;
	tbSay.sel = {
		{"\n Ph¶n håi", "htn_Infomation"},
		{"Ra khái","nothing"},
	};
	temp_Talk(tbSay);
end

function htn_SignTong()
	local tSay = {
		"Ta muèn ®¨ng ký Bang Héi Vinh Danh/htn_SignTong_Deal",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(HT_NPC..format("ChØ cã bang chñ míi cã thÓ ®¨ng ký ho¹t ®éng Bang Héi Vinh Danh, %s muèn ®¨ng ký kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function htn_SignTong_Deal()
	if ht_CheckCondition() ~= 1 then
		return 0;
	end
	if ht_GetTimeFunc() ~= 1 then
		Say(HT_NPC.."HiÖn t¹i kh«ng ph¶i lµ thêi gian ®¨ng ký, tuÇn sau h·y quay l¹i!", 0);
		return 0;
	end
	if GetTongDuty() ~= 1 then
		Say(HT_NPC..format("%s kh«ng ph¶i bang chñ, kh«ng thÓ ®¨ng ký ho¹t ®éng Bang Héi Vinh Danh!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetCash() < HT_COST_GOLD*10000 then
		Say(HT_NPC..format("Trong tói kh«ng ®ñ %d vµng", HT_COST_GOLD), 0)
		return 0;
	end
	return ht_SignTong();
end

function htn_BuildTong()
	if ht_CheckCondition() ~= 1 then
		return 0;
	end
	if ht_GetTimeFunc() ~= 1 then
		Say(HT_NPC.."HiÖn t¹i kh«ng ph¶i lµ thêi gian giao nép, tuÇn sau h·y quay l¹i!", 0);
		return 0;
	end
	ht_buildTong_AskforClient();
end

function htn_TongRank()
	if ht_CheckCondition() ~= 1 then
		return 0;
	end
	ht_TongRank_Show();
end

function htn_RankAward()
	if ht_CheckCondition() ~= 1 then
		return 0;
	end
	if ht_GetTimeFunc() == 1 then
		Say(HT_NPC.."HiÖn t¹i lµ thêi gian cèng hiÕn x©y dùng bang héi, kh«ng thÓ nhËn th­ëng xÕp h¹ng bang héi!", 0);
		return 0;
	end
	if ht_GetTimeFunc() == 2 then
		Say(HT_NPC.."HÖ thèng ®ang cËp nhËt b¶ng xÕp h¹ng ®iÓm cèng hiÕn bang héi, h·y quay l¹i sau!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10,1) ~= 1 then
		return 0;
	end
	ht_GetRankAward();
end