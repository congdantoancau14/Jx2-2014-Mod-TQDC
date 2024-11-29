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
Talk_1_4 = {};

TMain.msg = "<color=green>§¹o §ång DÜnh Chi<color>: LÇn nµy s­ huynh gÆp häa lín råi, xem ra sau nµy s­ huynh kh«ng thÓ ch¬i cïng víi ta ®­îc råi. HiÖn c¸c s­ b¸ ®Òu ®ang t×m huynh Êy, ng­¬i cã thÓ gióp ta ®i t×m kh«ng?";
TMain.sel = {
	{"Lµm sao nhËn ®­îcdanh väng Tö La S¬n?", Talk_1_1},
	{"Lµm sao xem danh väng Tö La S¬n cña ta?", Talk_1_2},
	{"Lµm sao ®æi th­ëng danh väng Tö La S¬n?", Talk_1_3},
	{"Ta muèn xem sè lÇn hoµn thµnh nhiÖm vô danh väng tuÇn hoµn cña tuÇn nµy",Talk_1_4},
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
};



Talk_1_1.msg = "<color=green>§¹o §ång DÜnh Chi<color>: Hoµn thµnh<color=green>§¹o Tr­ëng Tö La S¬n-Nguyªn H­ Tö<color>";
Talk_1_1.sel = {
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
}

Talk_1_2.msg = "<color=green>§¹o §ång DÜnh Chi<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn sÏ thÊy ®­îc tÊt c¶ danh väng hiÖn t¹i cña b¶n th©n.";
Talk_1_2.sel = {
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
}

Talk_1_3.msg = "<color=green>§¹o §ång DÜnh Chi<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn nhÊp nót PhÇn th­ëng danh väng liªn minh th­¬ng héi, sÏ xuÊt hiÖn giao diÖn phÇn th­ëng danh väng, chän khung danh väng §¹i Danh Phñ, sau ®ã chän vËt phÈm muèn ®æi, nhÊp nót ta muèn ®æi lµ ®­îc.";
Talk_1_3.sel = {
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
}
Talk_1_4.msg = format("<color=green>§¹o §ång DÜnh Chi<color>: NhiÖm vô danh väng tuÇn hoµn (TuÇn) ®· hoµn thµnh <color=green>%d<color> lÇn, tuÇn nµy cßn cã thÓ hoµn thµnh <color=green>%d<color> lÇn.",GetTask(200),20-GetTask(200));
Talk_1_4.sel = {
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
}

function main()
	temp_Talk(TMain);
end
