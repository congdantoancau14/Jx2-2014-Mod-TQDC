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

TMain.msg = "<color=green>Lôc PhiÕn M«n Danh Väng Sø<color>: Thiªn ¢m Gi¸o gÇn ®©y thËt hiÕp ng­êi qu¸ ®¸ng! Chóng ta ph¸i tø ®¹i danh bæ ®i ®iÒu tra t×nh h×nh cña Thiªn ¢m Gi¸o, kÕt qu¶ TuyÖt T×nh vµ §Şa S¸t ®Òu bŞ mÊt tİch! C¸i g×? Ng­¬i b¶o ng­êi cña Lôc PhiÕn M«n vèn lµ hµnh tunh bÊt ®Şnh? ¤i, lo cho hä qu¸, Truy Phong ®i t×m hä råi, kh«ng biÕt t×nh h×nh thÕ nµo råi!..";
TMain.sel = {
	{"Ta muèn t×m hiÓu danh väng Lôc PhiÕn M«n", Talk_1},
	{"Ra khái", "nothing",},
};

Talk_1.msg = "<color=green>Lôc PhiÕn M«n Danh Väng Sø<color>: Lôc PhiÕn M«n tr­íc nay lu«n hµnh ®éng ®éc lËp, rÊt İt khi xuÊt hiÖn trªn giang hå. LÇn nµy v× chuyÖn \"Bİch H¶i Lam\" bŞ trém, ®· triÖu tËp vâ l©m cao thñ vÒ ®©y, nh÷ng ng­êi trë gióp chóng ta sÏ ®­îc hËu t¹!";
Talk_1.sel = {
	{"Lµm sao nhËn ®­îc danh väng Lôc PhiÕn M«n?", Talk_1_1},
	{"Lµm sao xem danh väng Lôc PhiÕn M«n cña ta?", Talk_1_2},
	{"Lµm sao ®æi th­ëng danh väng Lôc PhiÕn M«n?", Talk_1_3},
	{"trë l¹i", TMain},
	{"Ra khái", "nothing"}
};

Talk_1_1.msg = "<color=green>Lôc PhiÕn M«n Danh Väng Sø<color>: Hoµn thµnh chuçi nhiÖm vô ban ®Çu Lôc PhiÕn M«n vµ nhiÖm vô h»ng ngµy ë chç <color=green>NhŞ sø Lôc T¸n M«n §¹p V©n<color>.";
Talk_1_1.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_2.msg = "<color=green>Lôc PhiÕn M«n Danh Väng Sø<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn sÏ thÊy ®­îc tÊt c¶ danh väng hiÖn t¹i cña b¶n th©n.";
Talk_1_2.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

Talk_1_3.msg = "<color=green>Lôc PhiÕn M«n Danh Väng Sø<color>: NhÊp <color=yellow>phİm t¾t I<color> cã thÓ më giao diÖn danh väng, trong giao diÖn nhÊp <color=yellow>nót PhÇn th­ëng danh väng Lôc PhiÕn M«n<color>, sÏ xuÊt hiÖn giao diÖn phÇn th­ëng danh väng, sÏ xuÊt hiÖn giao diÖn phÇn th­ëng danh väng, nhÊp chuét ®«i vµo vËt phÈm muèn ®æi lµ ®­îc!";
Talk_1_3.sel = {
	{"trë l¹i", Talk_1},
	{"Ra khái", "nothing"}
}

function main()
	temp_Talk(TMain);
end
