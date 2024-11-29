--²âÊÔÓÃ½Å±¾
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
Talk_2 = {};
TMain.msg = "<color=green>Danh väng ChiÕt Xung X·<color>:  ";
TMain.sel = {
	{"Ta muèn nép t×nh b¸o n­íc ®Şch",Talk_2},
	{"Ta muèn t×m hiÓu danh väng ChiÕt Xung X·", Talk_1},
	{"Ra khái", "nothing",},
};

Talk_1.msg = "<color=green>Danh väng ChiÕt Xung X·<color>:  ";
Talk_1.sel = {
	{"Lµm sao nhËn ®­îc danh väng ChiÕt Xung X·?", Talk_1_1},
	{"Lµm sao xem danh väng ChiÕt Xung X· cña ta?", Talk_1_2},
	{"Lµm sao ®æi th­ëng danh väng ChiÕt Xung X·?", Talk_1_3},
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
};

Talk_1_1.msg = "<color=green>danh väng ChiÕt Xung X·<color>: B¹n cã 3 c¸ch ®Ó nhËn ®­îc danh väng ChiÕt Xung X·, hoµn thµnh nhiÖm vô chİnh cña phe; hoµn thµnh nhiÖm vô h»ng ngµy cña phe; hoµn thµnh nhiÖm vô danh väng ngÉu nhiªn ë chç <color=green>Danh Väng Th­¬ng Nh©n<color>.";
Talk_1_1.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_2.msg = "<color=green>Danh väng ChiÕt Xung X·<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn sÏ thÊy ®­îc tÊt c¶ danh väng hiÖn t¹i cña b¶n th©n.";
Talk_1_2.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_3.msg = "<color=green>Danh väng ChiÕt Xung X·<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn nhÊp nót PhÇn th­ëng danh väng ChiÕt Xung X·, sÏ xuÊt hiÖn giao diÖn phÇn th­ëng danh väng, nhÊp chuét ®«i vµo vËt phÈm muèn ®æi lµ ®­îc!";
Talk_1_3.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

function main()
	temp_Talk(TMain);
end
