Include("\\script\\item\\item_yunling_box.lua")
function main()
	local player = "";
	if GetSex() == 1 then 
		player = "T¹i h¹";
	else
		player = "TiÓu n÷";
	end
	local tDialog = 
	{
		"\nTa muèn nãi vÒ chuyÖn Tñ Thiªn BiÕn TiÕu Y/NpcTalkMain",
		"\nTa muèn biÕt vÒ Nguån gèc UÈn Linh /cixiu_laiyuan",
		"\nTa muèn l·nh gi¸o ph­¬ng ph¸p thªu/cixiu_fangfa",
		format("\n%s xin c¸o tõ/nothing",player),
	};
	Say("<color=green>L­u T­ Anh:<color>Thªu lµ tuyÖt nghÖ cña tiÓu n÷, UÈn Linh ®­îc ta thªu kh«ng nh÷ng ®Ñp mµ cßn bÒn n÷a. ",getn(tDialog),tDialog);
end

function cixiu_laiyuan()
	local tDialog = 
	{
		"\n Ph¶n håi/main",
		"\n rót lui/nothing",
	};
	Say("<color=green>L­u T­ Anh:<color>tham gia ¶i V¹n KiÕm Tròng vµ Th«ng Thiªn HuyÔn C¶nh sÏ ngÉu nhiªn nhËn ®­îc UÈn Linh; cã thÓ ®æi Cæ Linh Th¹ch hoÆc Cæ Linh Ngäc thµnh UÈn Linh chç NhËt NguyÖt ThÇn Gi¸o H¾c Tæng Qu¶n ë Ph­îng T­êng Phñ vµ Th¸nh N÷ NhËm Doanh Doanh ë D­¬ng Ch©u.",getn(tDialog),tDialog);
end

function cixiu_fangfa()
	local tDialog = 
	{
		"\n Ph¶n håi/main",
		"\n rót lui/nothing",
	};
	Say("<color=green>L­u T­ Anh: <color>nhÊp chuét ph¶i vµo UÈn Linh trong hµnh trang ®Ó më giao diÖn thªu, cho ngo¹i trang vµ UÈn Linh t­¬ng øng vµo ®Ó thªu.",getn(tDialog),tDialog);
end

function nothing()
end