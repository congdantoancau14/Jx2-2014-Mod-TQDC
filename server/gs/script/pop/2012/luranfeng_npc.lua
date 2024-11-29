--²âÊÔÓÃ½Å±¾
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");
Include("\\script\\lib\\define.lua");

TMain = {};
Talk_1 = {};
Talk_1_1 = {};
Talk_1_2 = {};
Talk_1_3 = {};
Talk_1_4 = {};
TMain.msg = "<color=green>Tr¹i B¾c Song ¦ng Lôc Nhiªn Phong<color>:";
TMain.sel = {
	{"Lµm sao nhËn ®­îc danh väng §¹i Danh Phñ?", Talk_1_1},
	{"Lµm sao xem danh väng §¹i Danh Phñ cña ta?", Talk_1_2},
	{"Lµm sao ®æi th­ëng danh väng §¹i Danh Phñ?", Talk_1_3},
	{"Ta muèn xem sè lÇn hoµn thµnh nhiÖm vô danh väng tuÇn hoµn cña tuÇn nµy",Talk_1_4},
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
};



Talk_1_1.msg = "<color=green>Tr¹i B¾c Song ¦ng Lôc Nhiªn Phong<color>: Hoµn thµnh nhiÖm vô ban ®Çu §¹i Danh Phñ ë chç <color=green>C¸o ThŞ TriÒu §×nh<color> vµ nhiÖm vô h»ng ngµy ë chç Tr¹i B¾c Song ¦ng Ngu MÆc S¬n vµ nhiÖm vô tuÇn hoµn (TuÇn), ®Òu cã thÓ t¨ng danh väng §¹i Danh Phñ.";
Talk_1_1.sel = {
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
}

Talk_1_2.msg = "<color=green>Tr¹i B¾c Song ¦ng Lôc Nhiªn Phong<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn sÏ thÊy ®­îc tÊt c¶ danh väng hiÖn t¹i cña b¶n th©n.";
Talk_1_2.sel = {
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
}

Talk_1_3.msg = "<color=green>Tr¹i B¾c Song ¦ng Lôc Nhiªn Phong<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn nhÊp nót PhÇn th­ëng danh väng liªn minh th­¬ng héi, sÏ xuÊt hiÖn giao diÖn phÇn th­ëng danh väng, chän khung danh väng §¹i Danh Phñ, sau ®ã chän vËt phÈm muèn ®æi, nhÊp nót ta muèn ®æi lµ ®­îc.";
Talk_1_3.sel = {
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
}

Talk_1_4.sel = {
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
}

function main()
	Talk_1_4.msg = format("<color=green>Tr¹i B¾c Song ¦ng Lôc Nhiªn Phong<color>: NhiÖm vô danh väng tuÇn hoµn (TuÇn) ®· hoµn thµnh <color=green>%d<color> lÇn, tuÇn nµy cßn cã thÓ hoµn thµnh <color=green>%d<color> lÇn.",GetTask(TASKID_SW_REPEAT_TASK_1),20-GetTask(TASKID_SW_REPEAT_TASK_1));
	temp_Talk(TMain);
end
