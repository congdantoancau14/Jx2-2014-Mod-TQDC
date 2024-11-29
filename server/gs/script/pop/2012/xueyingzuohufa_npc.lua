--ÑªÓ¡ÓÒ»¤·¨
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");

TMain = {};
Talk_1 = {};
Talk_1_1 = {};
Talk_1_2 = {};
Talk_1_3 = {};

TMain.msg = "<color=green>HuyÕt Ên H÷u Hé Ph¸p<color>: ";
TMain.sel = {
	{"Ta muèn t×m hiÓu danh väng HuyÕt Ên M«n", Talk_1},
	{"Ra khái", "nothing",},
};

Talk_1.msg = "<color=green>HuyÕt Ên H÷u Hé Ph¸p<color>:  ";
Talk_1.sel = {
	{"Lµm sao nhËn ®­îc danh väng HuyÕt Ên M«n?", Talk_1_1},
	{"Lµm sao xem danh väng HuyÕt Ên M«n cña ta?", Talk_1_2},
	{"Lµm sao ®æi th­ëng danh väng HuyÕt Ên M«n?", Talk_1_3},
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
};

Talk_1_1.msg = "<color=green>HuyÕt Ên H÷u Hé Ph¸p<color>: Hoµn thµnh <color=green>HuyÕt Ên M«n Chñ-¢u D­¬ng HuyÕt Ên<color>";
Talk_1_1.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_2.msg = "<color=green>HuyÕt Ên H÷u Hé Ph¸p<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn sÏ thÊy ®­îc tÊt c¶ danh väng hiÖn t¹i cña b¶n th©n.";
Talk_1_2.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_3.msg = "<color=green>HuyÕt Ên H÷u Hé Ph¸p<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn nhÊp nót PhÇn th­ëng danh väng HuyÕt Ên M«n, sÏ xuÊt hiÖn giao diÖn phÇn th­ëng danh väng, nhÊp chuét ®«i vµo vËt phÈm muèn ®æi lµ ®­îc!";
Talk_1_3.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

function main()
	temp_Talk(TMain);
end
