Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

szNpcName = gf_FixColor("Qu¶n lÝ cöa hiÖu",2)..": ";

function main()
	local szSay = szNpcName.."Hoan nghªnh b»ng h÷u ®Õn víi bæn ®iÕm."
		.."Ta phô tr¸ch qu¶n lÝ c¸c cöa hiÖu, qu¶n lÝ c¸c mÆt hµng trªn thÞ tr­êng ®Ó tr¸nh viÖc ®Çu c¬ ®Èy gi¸.";
	local tSay = {};
	for i=1,4 do
		tinsert(tSay, format("* C¸c cöa hiÖu khu: %d/#showShop(%d)",i,i));
	end
	tinsert(tSay,"§Õn Ngù c¸c/#show_equip_shop(2)");
	tinsert(tSay, "NhiÒu mÆt hµng qu¸!/nothing");
	Say(szSay,getn(tSay),tSay);
end;

function showShop(nPage)
	local szSay = "Khu cöa hiÖu thø "..nPage;
	local tSay = {};
	local tPage = {
		[1] = {1, 50},
		[2] = {51, 100},
		[3] = {101, 150},
		[4] = {151, 170},
	}
	for i=tPage[nPage][1],tPage[nPage][2] do
		tinsert(tSay, format("* Gian hµng thø: %d/#Sale(%d)",i,i));
	end
	Say(szSay,getn(tSay),tSay);
end

function nothing()
end;