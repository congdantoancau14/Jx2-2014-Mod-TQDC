--²âÊÔÓÃ½Å±¾
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");

TMain = {};
Talk_1 = {};
Talk_1_1 = {};
Talk_1_2 = {};
Talk_1_3 = {};

TMain.msg = "<color=green>Liªn Minh Th­¬ng Héi Sø<color>: Ng­êi trong th­¬ng héi chóng t«i l©u nay rÊt thİch kú tr©n dŞ b¶o, lÇn nµy liªn minh th­¬ng héi kÕt giao giang hå hµo kiÖt, mong c¸c vŞ cã thÓ gióp chóng t«i thu thËp thªm nhiÒu b¶o bèi, chóng t«i sÏ hËu ta sau!";
TMain.sel = {
	{"Ta muèn t×m hiÓu danh väng Liªn Minh Th­¬ng Héi", Talk_1},
	{"Ra khái", "nothing",},
};

Talk_1.msg = "<color=green>Liªn Minh Th­¬ng Héi Sø<color>: Ng­êi trong th­¬ng héi chóng t«i l©u nay rÊt thİch kú tr©n dŞ b¶o, lÇn nµy liªn minh th­¬ng héi kÕt giao giang hå hµo kiÖt, mong c¸c vŞ cã thÓ gióp chóng t«i thu thËp thªm nhiÒu b¶o bèi, chóng t«i sÏ hËu ta sau!";
Talk_1.sel = {
	{"Lµm sao nhËn ®­îc danh väng Liªn Minh Th­¬ng Héi?", Talk_1_1},
	{"Lµm sao xem danh väng Liªn Minh Th­¬ng Héi?", Talk_1_2},
	{"Lµm sao ®æi th­ëng danh väng Liªn Minh Th­¬ng Héi?", Talk_1_3},
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
};

Talk_1_1.msg = "<color=green>Liªn Minh Th­¬ng Héi Sø<color>: Hoµn thµnh chuçi nhiÖm vô liªn minh th­¬ng héi ban ®Çu ë chç <color=green>Chñ tiÒn trang V¹n gia TiÒn Phu Nh©n<color> vµ nhiÖm vô liªn minh th­¬ng héi h»ng ngµy, ®Òu cã thÓ t¨ng danh väng Liªn Minh Th­¬ng Héi.";
Talk_1_1.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_2.msg = "<color=green>Liªn Minh Th­¬ng Héi Sø<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn sÏ thÊy ®­îc tÊt c¶ danh väng hiÖn t¹i cña b¶n th©n.";
Talk_1_2.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_3.msg = "<color=green>Liªn Minh Th­¬ng Héi Sø<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn nhÊp nót PhÇn th­ëng danh väng liªn minh th­¬ng héi, sÏ xuÊt hiÖn giao diÖn phÇn th­ëng danh väng, nhÊp chuét ®«i vµo vËt phÈm muèn ®æi lµ ®­îc!";
Talk_1_3.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

function main()
	temp_Talk(TMain);
end
