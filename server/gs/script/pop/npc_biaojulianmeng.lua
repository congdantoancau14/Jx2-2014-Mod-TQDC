--²âÊÔÓÃ½Å±¾
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");

TMain = {};
Talk_1 = {};
Talk_1_1 = {};
Talk_1_2 = {};
Talk_1_3 = {};

TMain.msg = "<color=green>Liªn Minh Tiªu Côc Sø<color>: Thiªn ¢m Gi¸o lu«n ®èi ®Çu víi chóng ta, e r»ng lµ ®ang t×m S¬n Hµ X· T¾c §å. Xem ra kh«ng nh÷ng tiªu côc cña chóng ta gÆp n¹n, c¶ giang hå còng ®ang l©m nguy!";
TMain.sel = {
	{"Ta muèn t×m hiÓu danh väng Liªn Minh Tiªu Côc", Talk_1},
	{"Ra khái", "nothing",},
};

Talk_1.msg = "<color=green>Liªn Minh Tiªu Côc Sø<color>: Liªn minh tiªu côc cña chóng ta lu«n muèn dÜ hßa vi quı. Vµi th¸ng nay Thiªn ¢m Gi¸o ®i kh¾p n¬i ®èi ®Çu víi chóng ta, rÊt nhiÒu huynh ®Ö ®· bŞ h¹ ®éc thñ. MÊt tiªu lµ chuyÖn nhá, danh dù cña tiªu côc míi lµ chuyÖn lín, tÊt c¶ tiªu côc h·y hîp thµnh liªn minh tiªu côc, chiªu mé hµo kiÖt gióp ®ì chóng ta mét tay, sÏ cã quµ tÆng cho ng­êi hoµn thµnh!";
Talk_1.sel = {
	{"Lµm sao nhËn ®­îc danh väng Liªn Minh Tiªu Côc?", Talk_1_1},
	{"Lµm sao xem danh väng Liªn Minh Tiªu Côc cña ta?", Talk_1_2},
	{"Lµm sao ®æi th­ëng danh väng Liªn Minh Tiªu Côc?", Talk_1_3},
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
};

Talk_1_1.msg = "<color=green>Liªn Minh Tiªu Côc Sø<color>: Hoµn thµnh chuçi nhiÖm vô liªn minh tiªu côc ban ®Çu vµ nhiÖm vô h»ng ngµy ë chç <color=green>Tæng Tiªu §Çu Thiªn Hµnh Tiªu Côc-Thiªn Khëi<color>, ®Òu cã thÓ t¨ng danh väng Liªn Minh Tiªu Côc.";
Talk_1_1.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_2.msg = "<color=green>Liªn Minh Tiªu Côc Sø<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn sÏ thÊy ®­îc tÊt c¶ danh väng hiÖn t¹i cña b¶n th©n.";
Talk_1_2.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_3.msg = "<color=green>Liªn Minh Tiªu Côc Sø<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn nhÊp <color=yellow>nót PhÇn th­ëng danh väng Liªn Minh Tiªu Côc<color>, sÏ xuÊt hiÖn giao diÖn phÇn th­ëng danh väng, nhÊp chuét ®«i vµo vËt phÈm muèn ®æi lµ ®­îc!";
Talk_1_3.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

function main()
	temp_Talk(TMain);
end
