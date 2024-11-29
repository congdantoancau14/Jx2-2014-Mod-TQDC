--some npc

tTongNpcTalk = {
	{"Tr­ëng l·o B¸ch HiÓu Sinh","Vâ L©m Minh lµ liªn minh tù ph¸t cña vâ l©m nh©n sÜ trung nguyªn ®Ó chèng l¹i Thiªn ¢m Gi¸o."},
	{"Ých B¶o Trai - Gia C¸t Kú","Ých B¶o Trai lµ kho cña bang ph¸i, bang ph¸i cã thÓ dù tr÷ bao nhiªu tiÒn quü th× ph¶i phô thuéc vµo cÊp cña Ých B¶o Trai."},
	{"ThiÕu chñ Tµng KiÕm DiÖp Tö Kh­u","ThiÕt DiÖn huynh ®Ö ®õng lo, ta ®· b¶o H¹o NhËt Doanh dÉn theo ng­êi ®i viÖn trî §Þa S¸t vµ TuyÖt T×nh."},
	{"Th­ëng thiÖn ph¹t ¸c sø - Hµn §an T©m","Th­ëng thiÖn ph¹t ¸c ®­êng, gÆp thiÖn sÏ th­ëng, gÆp ¸c sÏ ph¹t."},
	{"B¶o Ch©u Kim Cang cña ThiÕu L©m","Ta kh«ng vµo ®Þa ngôc th× ai vµo ®Þa ngôc."},
	{"TrÇn Tr¸c H¹o-Ngäc diÖn th­ sinh cña Vâ §ang","Vâ nghÖ cña D­¬ng t­íng qu©n qu¶ nhiªn cao c­êng, chóng ta lµm l¹i nµo."},
	{"D­¬ng gia gi¸o ®Çu D­¬ng Tam B¶o","TrÇn huynh ®Ö lµ ng­êi hµo phãng, tû vâ víi huynh Êy thËt lµ vui."},
	{"Träng Khai Vinh-Tr­ëng l·o h×nh ®­êng cña C¸i Bang","Huynh ®Ö C¸i Bang ë kh¾p thiªn h¹, hµnh ®éng cña Thiªn ¢m Gi¸o th× lµm sao qua ®­îc m¾t cña ta."},
	{"§­êng Méng L©m-Ngäc diÖn tri thï cña §­êng M«n","Lµm sao ®Ó hãa gi¶i thÊt trïng thÊt hoa ®éc cña Thiªn ¢m Gi¸o?"},
	{"TÇn V« MÖnh-T¶ hé ph¸p cña Ngò §éc","Ph¶i cÈn thËn ng­êi cña Thiªn ¢m m­în x¸c hoµn hån, s¾p xÕp gian tÕ."},
	{"Thóy Yªn lôc y tiªn tö Tiªu Së Së","Phi Yªn tû tû, ta nhÊt ®Þnh sÏ cøu tû ra."},
	{"Minh Gi¸o Kim Mao S­ V­¬ng-Hïng B¸ Thiªn","Bé 'û Thiªn §å Long Ký' qu¶ thËt lµ rung ®éng ®Õn lßng ng­êi, khiÕn ng­êi ta muèn ngõng mµ kh«ng ®­îc."},
	{"Ng« BÊt Duy-Tö hµ thiªn s­ cña C«n L«n","B¨ng T©m c« n­¬ng, kh«ng cÇn lo l¾ng. §Þa S¸t vµ TuyÖt T×nh cã vâ c«ng cao c­êng, bän tiÓu tÆc cña Thiªn ¢m kh«ng lµm g× ®­îc ®©u."},
	{"Tø ®¹i danh bé - ThiÕt DiÖn","Kh«ng ngê trªn ®­êng ®i l¹i bÞ bän Thiªn ¢m Gi¸o chÆn ®­êng."},
	{"Tø §¹i Danh Bæ-TuyÖt T×nh","Thiªn ¢m tiÓu tÆc, ta vµ ng­¬i quyÕt ®Êu ®Õn cïng."},
	{"Tø ®¹i danh bé - B¨ng T©m","§Þa S¸t vµ TuyÖt T×nh lµ v× b¶o vÖ chóng t«i mµ chñ ®éng chÆn hËu, ®õng nªn x¶y ra chuyÖn nhÐ!"},
	{"Tø §¹i Danh Bæ-§Þa S¸t","Bän thá ®Õ Thiªn ¢m Gi¸o, h·y ®Õn ®¹i chiÕn 300 hiÖp víi gia gia nµo."},
	{"Vâ L©m Minh Hé VÖ","N¬i dãng qu©n cña Vâ L©m Minh, kh«ng phËn sù miÔn vµo!"},
};

function main()
	local nNpcName = GetTargetNpcName();
	for i = 1,getn(tTongNpcTalk) do
		if nNpcName == tTongNpcTalk[i][1] then
			Talk(1,"","<color=green>"..nNpcName.."<color>: "..tTongNpcTalk[i][2]);
			return 0;
		end	
	end
	if nNpcName == "Thñ Khè" then
		OpenBox()
		EnableBoxLock(1)
	elseif nNpcName == "TiÖm T¹p Hãa" then
		Sale(35)
	elseif nNpcName == "Chñ D­îc ®iÕm" then
		Sale(30)
	end
end
