--ÑïÖÝÈÎÎñ·ÖÖ§
--created by lizhi
--2005-9-1 10:21

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

--------------------------------------------ÑïÖÝ·ÖÖ§¶þ--------------------------------------

function task_01_00()
    local szTalk = {
        "V·n bèi vÊn an l·o l·o.",
        "Ta víi ng­¬i kh«ng quen biÕt, cã chuyÖn g× kh«ng?",
        "T¹i h¹ cã mét ng­êi b¹n bÞ giÕt, trªn thi thÕ t×m ®­îc {Phi Béc kim ch©m}, thiÕt nghÜ ®©y lµ vËt phÈm cña §­êng M«n, t¹i h¹ muèn nhê L·o L·o ®iÒu tra xem ai lµ hung thñ.",
        "Mét ngµy ta cßn ®øng trong §­êng M«n sÏ tu©n thñ theo gia ph¸p, kh«ng cÇn <sex> ra tay.",
        "T¹i h¹ tõ xa ®Õn mong L·o L·o gióp ®ì.",
        "Ta cã thÓ gióp ng­¬i, nh­ng tr­íc tiªn ph¶i ®Õn V©n Méng Tr¹ch lÊy 20 c¸i ®u«i bß c¹p vÒ ®©y!",
        "Kh«ng thµnh vÊn ®Ò!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    DelItem(2,0,100,1);
    SetTask(TASK_YZ_TWO, 2);
    CreateTrigger(0,536,KILL_YZ_TX);
    Msg2Player("§Õn V©n Méng Tr¹ch lÊy 20 c¸i ®u«i bß c¹p vÒ cho §­êng Xu©n");
    TaskTip("§Õn V©n Méng Tr¹ch lÊy 20 c¸i ®u«i bß c¹p vÒ cho §­êng Xu©n");
    GivePlayerAward("Level_36", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi1")		--×·²é°µÆ÷1
end;

function task_02_00()
    local szTalk = {
        "§óng thø nµy råi! Ta sÏ gióp ng­êi ®iÒu tra nh­ng cÇn kho¶ng thêi gian, l¸t quay l¹i ®i!"
    };
    local szNot = {
        "NÕu nh­ thÊy khã t×m ®u«i bß c¹p th× cø nãi víi ta nhÐ!"
    };
    if GetItemCount(2,0,102) >= 20 then
        TalkEx("task_02_01", szTalk);
    else
        TalkEx("task_02_02", szNot);
    end;
end;

function task_02_02()
    if GetTrigger(KILL_YZ_TX) == 0 then
        CreateTrigger(0,536,KILL_YZ_TX);
    end;
end;

function task_02_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    DelItem(2,0,102,20);
    SetTask(TASK_YZ_TWO, 3);
    SetTask(TASK_YZ_THREE, 1);  --¿ªÆôÑïÖÝ·ÖÖ§Èý
    Msg2Player("§­êng Xu©n b¶o b¹n mét thêi gian sau míi cã thÓ tr¶ lêi");
    TaskTip("§­êng Xu©n b¶o b¹n mét thêi gian sau míi cã thÓ tr¶ lêi");
    GivePlayerAward("Level_36", "hard", "chest", "Level_36");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi2")		--×·²é°µÆ÷2
end;

function task_04_00()
    local szTalk = {
        "<sex> ®Õn ®óng lóc l¾m! TÊt c¶ ¸m khÝ vµ ®éc d­îc ®Òu cã lµm dÊu, chØ cã §­êng Ninh kh«ng bÞ khèng chÕ do h¾n ®· tinh th«ng thuËt chÕ t¹o ¸m khÝ, hiÖn ta kh«ng biÕt h¾n trèn ë ®©u.",
        "Sao trïng hîp vËy? T¹i h¹ cã gÆp qua ng­êi nµy."
    };
    TalkEx("task_04_01", szTalk);
end;

function task_04_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    SetTask(TASK_YZ_TWO, 5);
    Msg2Player("T×m §­êng Ninh hái th¨m");
    TaskTip("T×m §­êng Ninh hái th¨m");
    GivePlayerAward("Level_50", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi3")		--×·²é°µÆ÷3
end;

function two_05_00()
    local szTalk = {
        "<sex> qu¶ nhiªn ®Õn t×m ta, cã ph¶i H¹ HÇu CÇm ph¸i tíi?",
        "Nãi mau! Sao ng­¬i giÕt L«i Th¾ng?",
        "Ng­¬i qu¶ thËt th«ng minh tõ Phi Béc kim ch©m ®iÒu tra ®­îc ®Õn ®©y, ®¸ng tiÕc ta chËm h¬n ng­¬i mét b­íc.",
        "Phu qu©n {Th¸i Hång TuyÖt} lµ ng­êi Xi Háa gi¸o nªn con ®­êng s¸t thñ cña ta còng b¾t ®Çu tõ ®ã, kh«ng may chµng ®· chÕt d­íi tay háa kú l©n, ta vµ Xi Háa gi¸o còng c¾t ®øt quan hÖ."
    };
    TalkEx("two_05_01", szTalk);
end;

function two_05_01()
    local szTalk = {
        "C« n­¬ng lµ ng­êi th«ng minh sao l¹i ra n«ng næi vËy?",
        "Th× sao nµo?",
        "Xi Háa gi¸o ®ang sö dông tÊm b¶n ®å S¬n Hµ lµ b¶o vËt thÇn bÝ mµ H¹ HÇu CÇm b¶o ng­¬i mang tíi. Lóc ®ã mét ng­êi phô n÷ tªn H­íng Ty Thanhra lÖnh ta ph¶i giÕt L«i Th¾ng, ®o¹t lÊy m¶nh b¶n ®å S¬n Hµ X· T¾c, tiÕc thay ta kh«ng t×m ®­îc.",
        "ChÝnh v× vËy ng­¬i míi t×m ®­îc ¸m khÝ cña ta nh­ng ta vÉn kh«ng hiÓu v× sao {H¹ HÇu CÇm} b¶o ng­¬i mang m¶nh S¬n Hµ X· T¾c ®Õn, ng­¬i vÒ hái l¹i xem!",
        "§a t¹ c« n­¬ng!"
    };
    TalkEx("two_05_02", szTalk);
end;

function two_05_02()
    SetTask(TASK_YZ_TWO, 6);
    Msg2Player("§Õn D­¬ng Ch©u t×m H¹ HÇu CÇm");
    TaskTip("§Õn D­¬ng Ch©u t×m H¹ HÇu CÇm");
    GivePlayerAward("Level_50", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"dezhizhenxiang1")		--µÃÖªÕæÏà1
end;

function two_06_00()
    local szTalk = {
        "Sao ng­¬i ph¶n béi Tr­êng Ca M«n? §em m¶nh S¬n Hµ X· T¾c cho Xi Háa gi¸o.",
        "Ng­¬i ®iÒu tra ra råi µ? ChuyÖn nµy lµm ta day døt bÊy l©u, cã lÏ nãi ra còng lµ c¸ch gi¶i quyÕt.....",
        "Ng­êi ®µn bµ H­íng Ty Thanh®· bá trèn cïng phu qu©n Ta, ¶ cßn cã ý ®Þnh c­íp Anh Nhi ®i. §óng råi, Anh Nhi vµ Liªn Nhi lµ con cña ta, ®a t¹ <sex> ch¨m sãc.",
        "Trªn ®êi cßn cã lo¹i ®µn bµ ®éc ¸c nµy n÷a sao!",
        "Kh«ng biÕt <sex> cßn nhí chuyÖn Liªn Nhi bÞ tróng ®éc kh«ng? ChÝnh ¶ ®· ra tay, ¶ nãi nÕu kh«ng giao Anh Nhi sÏ ®éc chÕt Liªn Nhi, vÒ sau kh«ng biÕt sao l¹i ®æi ý."
    };
    TalkEx("two_06_01", szTalk);
end;

function two_06_01()
    local szTalk = {
        "ChÝnh c« ta ®­a cao Thiªn ThiÒm Hãa §éc mµ! Kh«ng lÏ c« ta ®· hèi c·i?",
        "Hõm! {Hãa ®éc cao} ®óng lµ thuèc gi¶i nh­ng cã thªm {ThiÒm T«} v« sÏ lµ lo¹i ®éc ®Þnh kú ph¸t t¸c, nÕu kh«ng cã thuèc gi¶i kÞp sÏ ®au ®ín mµ chÕt, ¶ ®· uy hiÕp ta lµm nhiÒu ®iÒu cã lçi víi l­¬ng t©m.",
        "Kh«ng thÓ tr¸ch c« n­¬ng, vËy c« cã biÕt m¶nh S¬n Hµ X· T¾c cña Xi Háa gi¸o ®em ®i ®©u kh«ng?",
        "H×nh nh­ Xi Háa gi¸o ®ang ©m m­u lín ë {§«ng H¶i H¶i T©n}, ng­¬i thö ®Õn ®ã xem thö!",
        "§­îc! T¹i h¹ lªn ®­êng ngay!"
    };
    TalkEx("two_06_02", szTalk);
end;

function two_06_02()
    SetTask(TASK_YZ_TWO, 7);
    GivePlayerAward("Level_50", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"dezhizhenxiang2")		--µÃÖªÕæÏà2
end;

function two_07_00()
    local szSay = {
        "<sex> t×m ta cã chuyÖn g× kh«ng?",
        "Liªn quan Xi Háa gi¸o/about_chj",
        "Liªn quan H¹ HÇu Liªn/about_xhl"
    };
    SelectSay(szSay);
end;

function about_chj()
    local szTalk = {
        "Xi Háa gi¸o ®ang tô tËp ë §«ng H¶i H¶i T©n. <sex> mau ®i ng¨n c¶n chóng!"
    };
    TalkEx("", szTalk);
end;

function about_xhl()
    local szSay = {
        "ChÊt ®éc trong ng­êi Liªn Nhi chØ cã m¸u cña {Háa kú l©n} trong truyÒn thuyÕt míi gi¶i ®­îc.",
        "M¸u cña háa kú l©n ®©y/have_one",
        "Ta ch­a thÊy qua b¶o vËt nµy/have_none"
    };
    SelectSay(szSay);
end;

function have_one()
    local szTalk = {
        "§a t¹ <sex> mang b¶o vËt ra cøu Liªn Nhi.",
        "Kh«ng cøu ng­êi b¶o vËt nµy ®Ó lµm g×!"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    SetTask(TASK_YZ_TWO, 8);
    DelItem(2,0,150,1);
end;

function have_none()

end;