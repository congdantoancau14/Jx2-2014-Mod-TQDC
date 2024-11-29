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

TMain.msg = "<color=green>T¸t Giµ Minh Phñ<color>: <color=green>N­íc Thæ Phån<color> cña chóng ta l©u nay kh«ng thİch kÕt thï víi ng­êi kh¸c, chØ tr¸ch bän <color=green>§¹i Lı<color> vµ <color=green>T©y H¹<color> hiÕp ng­êi qu¸ ®¸ng! Xem ra ®¹i hiÖp lµ ng­êi hiÓu lı lÏ, h·y gióp <color=green>Thæ Phån<color> mét tay, Thæ Phån Hãa Sinh Tù sÏ träng th­ëng cho Vâ L©m Minh!";
TMain.sel = {
	{"Ta muèn t×m hiÓu danh väng Vâ L©m Minh", Talk_1},
	{"Ra khái", "nothing",},
};

Talk_1.msg = "<color=green>T¸t Giµ Minh Phñ<color>: <color=green>Thæ Phån Hãa Sinh Tù<color> chñ tr× giang hå Thæ Phån ®· nhiÒu n¨m, lÇn nµy n­íc Thæ Phån ph¶i chŞu nhôc, chóng t«i sao cã thÓ thê ¬? ChØ cÇn thiÕu hiÖp chŞu gióp chóng ta mét tay, <color=green>Thæ Phån Hãa Sinh Tù<color> sÏ hËu t¹ sù trî gióp cña Vâ L©m Minh!";
Talk_1.sel = {
	{"Lµm sao nhËn ®­îc danh väng Vâ L©m Minh?", Talk_1_1},
	{"Lµm sao xem danh väng Vâ L©m Minh?", Talk_1_2},
	{"Lµm sao ®æi th­ëng danh väng Vâ L©m Minh?", Talk_1_3},
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
};

Talk_1_1.msg = "<color=green>T¸t Giµ Minh Phñ<color>: Cã 3 c¸ch ®Ó nhËn ®­îc danh väng Vâ L©m Minh: Hoµn thµnh nhiÖm vô chİnh cña phe; hoµn thµnh nhiÖm vô h»ng ngµy cña phe; hoµn thµnh nhiÖm vô danh väng ngÉu nhiªn ë chç <color=green>Danh Väng Vâ L©m Minh Sø<color>";
Talk_1_1.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_2.msg = "<color=green>T¸t Giµ Minh Phñ<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn sÏ thÊy ®­îc tÊt c¶ danh väng hiÖn t¹i cña b¶n th©n.";
Talk_1_2.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_3.msg = "<color=green>T¸t Giµ Minh Phñ<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn nhÊp nót PhÇn th­ëng danh väng Vâ L©m Minh, sÏ xuÊt hiÖn giao diÖn phÇn th­ëng danh väng, nhÊp chuét ®«i vµo vËt phÈm muèn ®æi lµ ®­îc!";
Talk_1_3.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

function main()
	--ÅĞ¶ÏÎ´¼ÓÈëÊÆÁ¦
	if GetTask(3301) ~= 0 then
		temp_Talk(TMain);
	else
		Talk(1, "", "<color=green>T¸t Giµ Minh Phñ<color>: §¹i hiÖp kh«ng muèn gióp ®ì <color=green>Thæ Phån<color> cña ta, ta vµ ng­¬i kh«ng cßn g× ®Ó nãi n÷a!");
	end
end
