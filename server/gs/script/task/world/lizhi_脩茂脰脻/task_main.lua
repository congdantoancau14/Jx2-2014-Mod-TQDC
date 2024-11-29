--ÑïÖÝÈÎÎñ
--created by lizhi
--2005-9-1 10:21

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function task_06_00()
    local szTalk = {
        "Cã chuyÖn g× vËy?",
        "Ng­êi th©n göi ta nu«i dïm hai ®øa con, ®øa lín tªn {H¹ HÇu Anh}, ®øa nhá tªn {H¹ HÇu Liªn}. HiÖn em g¸i ®ang m¾c chøng bÖnh l¹. §¹i phu {TrÇn MÉn} b¶o cÇn mét sè d­îc liÖu, ng­¬i ®Õn hái gióp ta ®­îc kh«ng?",
        "ChuyÖn nhá th«i mµ!"
    };
    TalkEx("task_06_01", szTalk);
end;

function task_06_01()
    SetTask(TASK_FIVE, 7);
    Msg2Player("Gióp H¹ HÇu CÇm t×m ®¹i phu TrÇn MÉn");
    TaskTip("Gióp H¹ HÇu CÇm t×m ®¹i phu TrÇn MÉn");
end;

function task_07_xh_00()
    local szTalk = {
        "§¹i phu {TrÇn MÉn} ®ang ë trong thµnh. <sex> ®Õn ®ã xem."
    };
    TalkEx("", szTalk);
end;

function task_07_cm_00()
    local szTalk = {
        "H¹ HÇu CÇm nhê t¹i h¹ ®Õn hái thö bÖnh t×nh cña ®øa bÐ H¹ HÇu Liªn cÇn t×m d­îc liÖu g×?",
        "§øa bÐ ®ã h×nh nh­ tróng ®éc, ta ®ang theo dâi bÖnh t×nh, ng­¬i gióp ta t×m 1 Hoµng hæ linh cèt vÒ ®©y!"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    SetTask(TASK_FIVE, 8);
    CreateTrigger(0,533,KILL_YZ_LAOHU);
    Msg2Player("T×m Hoµng hæ linh cèt cho TrÇn MÉn");
    TaskTip("T×m Hoµng hæ linh cèt cho TrÇn MÉn");
    GivePlayerAward("Level_20","easy");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng1")		--Á¯¶ùµÄÆæÖ¢1
end;

function task_08_00()
    local szTalk = {
        "ChØ cã Hoµng hæ linh cèt míi lµm th«i gi¶m bÖnh t×nh ®øa bÐ."
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    if GetTrigger(KILL_YZ_LAOHU) == 0 then
        CreateTrigger(0,533,KILL_YZ_LAOHU);
    end;
end;

function task_09_00()
    local szTalk = {
        "§óng lµ thø nµy råi!",
        "……",
        "Ng­¬i mau ®em Hæ cèt linh phÊn cho H¹ HÇu Liªn.",
        "T¹i h¹ lªn ®­êng ngay!"
    };
    local szNot = {
        "<sex> t×m ®­îc Hoµng hæ linh cèt ch­a?",
        "VÉn ch­a t×m ®­îc."
    };
    if GetItemCount(2,0,44) >= 1 then
        TalkEx("task_09_01", szTalk);
    else
        TalkEx("task_08_01", szNot);
    end;
end;

function task_09_01()
    SetTask(TASK_FIVE, 10);
    RemoveTrigger(GetTrigger(KILL_YZ_LAOHU));
    DelItem(2,0,44,1);
    AddItem(2,0,45,1);
    Msg2Player("Mang thuèc gi¶i cho H¹ HÇu Liªn");
    TaskTip("Mang thuèc gi¶i cho H¹ HÇu Liªn");
    GivePlayerAward("Level_20","easy");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng2")		--Á¯¶ùµÄÆæÖ¢2
end;

function task_10_00()
    local szTalk = {
        "§©y lµ thuèc cña TrÇn ®¹i phu tiÓu muéi muéi mau uèng ®i!",
        "MÑ cã b¶o kh«ng ®­îc tïy tiÖn lÊy ®å cña ng­êi kh¸c.",
        "Ca ca ¬i! §au qu¸!",
        "Mau uèng ®i! Thuèc nµy thÝm H¹ HÇu CÇm b¶o ta mang tíi.",
        "…",
        "Muéi muéi mau uèng thuèc ®i!",
        "§a t¹!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    SetTask(TASK_FIVE, 11);
    DelItem(2,0,45,1);
    Msg2Player("VÒ gÆp H¹ HÇu CÇm");
    TaskTip("VÒ gÆp H¹ HÇu CÇm");
    GivePlayerAward("Level_20","easy");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng3")		--Á¯¶ùµÄÆæÖ¢3
end;

function task_11_00()
    local szTalk = {
        "C« n­¬ng yªn t©m t¹i h¹ ®· ®em thuèc cho H¹ HÇu Liªn nh­ng ®¹i phu cã nãi cÇn ph¶i theo dâi bÖnh t×nh.",
        "VËy ta yªn t©m råi! Chót quµ xin nhËn lÊy!"
    };
    TalkEx("task_11_01", szTalk);
end;

function task_11_01()
    SetTask(TASK_FIVE, 12);
    local szTalk = {
        "Nghe nãi gi¸ c¶ vµ nguyªn liÖu lµm vò khÝ ë Giang Nam ®ét nhiªn t¨ng cao, thî rÌn {M·nh Nham } bÞ Ðp lµm mét sè binh khÝ, ng­¬i ®Õn ®ã ®iÒu tra xem!",
        "T¹i h¹ lªn ®­êng ngay!"
    };
    TalkEx("task_12_01", szTalk);
    GivePlayerAward("Level_20","hard");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng4")		--Á¯¶ùµÄÆæÖ¢4
end;

function task_12_00()
    local szTalk = {
        "Nghe nãi gi¸ c¶ vµ nguyªn liÖu lµm vò khÝ ë Giang Nam ®ét nhiªn t¨ng cao, thî rÌn {M·nh Nham } bÞ Ðp lµm mét sè binh khÝ, ng­¬i ®Õn ®ã ®iÒu tra xem!",
        "T¹i h¹ lªn ®­êng ngay!"
    };
    TalkEx("task_12_01", szTalk);
end;

function task_12_01()
    SetTask(TASK_FIVE, 13);
    Msg2Player("Hái M·nh Nham  vÒ nguyªn liÖu chÕ t¹o binh khÝ");
    TaskTip("Hái M·nh Nham  vÒ nguyªn liÖu chÕ t¹o binh khÝ");
end;

function task_13_00()
    local szTalk = {
        "Nghe nãi gi¸ c¶ vò khÝ ®ét nhiªn t¨ng cao, tiÒn bèi biÕt nguyªn nh©n kh«ng?",
        "Do mét sè ®Þa ph­¬ng thu mua tÊt c¶ binh khÝ, dÉn ®Õn kho¸ng th¹ch còng t¨ng gi¸, ng­êi cã tiÒn ch­a ch¾c mua ®­îc. Míi ®©y cã bµ l·o dïng dao Ðp ta lµm mét sè binh khÝ.",
        "Ng­êi Ðp tiÒn bèi lµm binh khÝ lµ ai?",
        "§îi ng­¬i t×m ®ñ nguyªn liÖu vÒ ta sÏ nãi sau.",
        "TiÒn bèi cÇn nguyªn liÖu g×? §Õn ®©u míi cã thÓ t×m chóng?",
        "Nghe nãi th­¬ng nh©n ë D­¬ng Ch©u lóc vËn chuyÓn Sinh ThiÕt ngang qua Long TuyÒn Th«n bÞ Th¶o KhÊu c­íp mÊt, ng­¬i mau ®Õn ®ã ®o¹t 20 miÕng vÒ!",
        "§­îc th«i!"
    };
    TalkEx("task_13_01", szTalk);
end;

function task_13_01()
    SetTask(TASK_FIVE, 14);
    CreateTrigger(0,534,KILL_YZ_CK);
    Msg2Player("§Õn Long TuyÒn Th«n ®¸nh th¶o khÊu lÊy 20 Sinh ThiÕt!");
    TaskTip("§Õn Long TuyÒn Th«n ®¸nh th¶o khÊu lÊy 20 Sinh ThiÕt!");
    GivePlayerAward("Level_25", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"jiagegaozhangdewuqi1")		--¼Û¸ñ¸ßÕÇµÄÎäÆ÷1
end;

function task_14_00()
    local szTalk = {
        "Cã nguyªn liÖu råi ta b¾t tay lµm binh khÝ ®©y! Ng­¬i Ðp ta tªn H­íng Ti Thanh, h¾n ®ang ë Long TuyÒn Th«n!"
    };
    local szNot = {
        "Gióp ta t×m 20 Sinh ThiÕt ë Long TuyÒn th«n, ta sÏ cho ng­¬i biÕt t«ng tÝch c« g¸i ®ã!"
    };
    if GetItemCount(2,0,98) >= 20 then
        TalkEx("task_14_01", szTalk);
    else
        TalkEx("task_14_02", szNot);
    end;
end;

function task_14_02()
    if GetTrigger(KILL_YZ_CK) == 0 then
        CreateTrigger(0,534,KILL_YZ_CK);
    end;
end;

function task_14_01()
    RemoveTrigger(GetTrigger(KILL_YZ_CK));
    DelItem(2,0,98,20);
    SetTask(TASK_FIVE, 15);
    Msg2Player("§Õn Long TuyÒn Th«n t×m H­íng Ti Thanh");
    TaskTip("§Õn Long TuyÒn Th«n t×m H­íng Ti Thanh");
    GivePlayerAward("Level_25", "hard", "trinket", "Level_25");
	GivePlayerExp(SkeyYZxiahouqin,"jiagegaozhangdewuqi2")		--¼Û¸ñ¸ßÕÇµÄÎäÆ÷2
end;

function task_15_00()
    local szTalk = {
        "Nghe nãi ng­¬i thu mua l­îng lín binh khÝ, cã d· t©m g× kh«ng?",
        "Ha! Ha! L·o n­¬ng ®©y chÝnh lµ ng­êi Xi Háa gi¸o, ng­¬i hiÓu råi chø!",
        "Th× ra lµ vËy!",
        "Ta cã lßng tèt muèn cøu ®øa bÐ g¸i giê ng­¬i nãi vËy, ta kh«ng thÌm quan t©m sù sèng chÕt cña nã n÷a.",
        "Cøu ai? Kh«ng lÏ H¹ HÇu Liªn? NÕu c« n­¬ng cøu ®­îc t¹i h¹ mu«n phÇn c¶m kÝch.",
        "Ta còng muèn cøu nh­ng thiÕu mét sè d­îc liÖu t×m m·i kh«ng thÊy! Cã thÓ gióp ta ®Õn {V©n Méng Tr¹ch} ®¸nh {Cãc ®éc} lÊy {3 chÐn ThiÒm T«} vÒ kh«ng?",
        "Ta ®i ngay!"
    };
    TalkEx("task_15_01", szTalk);
end;

function task_15_01()
    SetTask(TASK_FIVE, 16);
    CreateTrigger(0,535,KILL_YZ_DCC);
    Msg2Player("§Õn V©n Méng Tr¹ch giÕt cãc ®éc lÊy 3 c¸i ThiÒm T«");
    TaskTip("§Õn V©n Méng Tr¹ch giÕt cãc ®éc lÊy 3 c¸i ThiÒm T«");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren1")		--ÉñÃØÅ®ÈË1
end;

function task_16_00()
    local szTalk = {
        "T×m ®­îc råi µ?",
        "……",
        "H·y ®­a {Thiªn ThiÒm Hãa §éc cao} cho ®¹i phu {TrÇn MÉn} kiÓm nghiÖm xem!",
        "§a t¹ {TrÇn MÉn} c« n­¬ng, t¹i h¹ lªn ®­êng ngay!"
    };
    local szNot = {
        "Cßn kh«ng mau ®Õn {V©n Méng Tr¹ch} ®¸nh {cãc ®éc} lÊy {3 chÐn ThiÒm T«} vÒ!"
    };
    if GetItemCount(2,0,99) >= 3 then
        TalkEx("task_16_01", szTalk);
    else
        TalkEx("task_16_02", szNot);
    end;
end;

function task_16_02()
    if GetTrigger(KILL_YZ_DCC) == 0 then
        CreateTrigger(0,535,KILL_YZ_DCC);
    end;
end;

function task_16_01()
    RemoveTrigger(GetTrigger(KILL_YZ_DCC));
    SetTask(TASK_FIVE, 17);
    AddItem(2,0,302,1);   --Ììó¸»¯¶¾¸à
    DelItem(2,0,99,3);
    Msg2Player("T×m ®¹i phu TrÇn MÉn xem thö cã ph¶i thuèc gi¶i kh«ng");
    TaskTip("T×m ®¹i phu TrÇn MÉn xem thö cã ph¶i thuèc gi¶i kh«ng");
    GivePlayerAward("Level_30", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren2")		--ÉñÃØÅ®ÈË2
end;

function task_17_00()
    local szTalk = {
        "§¹i nh©n xem th­ cao {Thiªn ThiÒm Hãa §éc} nµy cøu ®­îc H¹ HÇu Liªn kh«ng?",
        "Ta ch­a thÊy qua lo¹i thuèc nµy bao giê nh­ng ®Ó ta xem.",
        "……",
        "§­îc råi! Ng­¬i cã thÓ mang sè thuèc nµy ®i t×m H¹ HÇu CÇm!",
        "§a t¹ ®¹i nh©n."
    };
    TalkEx("task_17_01", szTalk);
end;

function task_17_01()
    SetTask(TASK_FIVE, 18);
    Msg2Player("TrÇn MÉn ®¹i phu nãi thuèc kh«ng sao nh­ng ph¶i hái ý kiÕn H¹ HÇu CÇm");
    TaskTip("TrÇn MÉn ®¹i phu nãi thuèc kh«ng sao nh­ng ph¶i hái ý kiÕn H¹ HÇu CÇm");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren3")		--ÉñÃØÅ®ÈË3
end;

function task_18_00()
    local szTalk = {
        "Mét ng­êi tªn {H­íng Ti Thanh} tÆng b×nh chøa cao {Thiªn ThiÒm Hãa §éc} nãi ®Ó cøu Liªn Nhi, t¹i h¹ ®· cho TrÇn MÉn ®¹i phu kiÓm chøng, mêi ng­êi xem qua!",
        "{H­íng Ti Thanh}? Ta kh«ng biÕt ng­êi nµy nh­ng TrÇn MÉn ®¹i phu ®· nãi kh«ng sao th× cø mang cho Linh Nhi.",
        "T¹i h¹ lªn ®­êng ngay!"
    };
    TalkEx("task_18_01", szTalk);
end;

function task_18_01()
    SetTask(TASK_FIVE, 19);
    Msg2Player("§em cao Thiªn ThiÒm Hãa §éc cho Liªn Nhi");
    TaskTip("§em cao Thiªn ThiÒm Hãa §éc cho Liªn Nhi");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren4")		--ÉñÃØÅ®ÈË4
end;

function task_19_00()
    local szTalk = {};
    if GetSex() == 1 then
        szTalk = {
            "Thuèc nµy cã thÓ trÞ chøng ®au bông, mau dïng ®i!",
            "….",
            "å! Thuèc hay qu¸! Ta kh«ng sao råi, ®a t¹ ca ca!",
            "Ta vÒ bÈm b¸o víi thiÕm H¹ HÇu CÇm cña ng­¬i ®©y."
        };
    elseif GetSex() == 2 then
        szTalk = {
            "Thuèc nµy cã thÓ trÞ chøng ®au bông, mau dïng ®i!",
            "….",
            "å! Thuèc hay qu¸! Ta kh«ng sao råi, ®a t¹ tû tû!",
            "Ta vÒ bÈm b¸o víi thiÕm H¹ HÇu CÇm cña ng­¬i ®©y."
        };
    end;
    TalkEx("task_19_01", szTalk);
end;

function task_19_01()
    SetTask(TASK_FIVE, 20);
    DelItem(2,0,302,1);
    Msg2Player("§em sù viÖc nãi l¹i víi H¹ HÇu CÇm");
    TaskTip("§em sù viÖc nãi l¹i víi H¹ HÇu CÇm");
    GivePlayerAward("Level_30", "hard", "weapon", "Level_28");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren5")		--ÉñÃØÅ®ÈË5
end;

function task_20_00()
    local szTalk = {
        "Liªn Nhi nãi uèng thuèc xong bông hÕt ®au råi!",
        "VËy ta yªn t©m ®a t¹ ng­¬i!"
    };
    TalkEx("task_20_01", szTalk);
end;

function task_20_01()
    local szTalk = {
        "Ta nhËn ®­îc tin b¸o {L«i Th¾ng} trong lóc ®Õn D­¬ng Ch©u bÞ kÎ ®Þch truy s¸t hiÖn ®ang Èn nÊp ë {Thanh Khª ®éng}, ng­¬i gióp ta ®Õn ®ã gi¶i v©y cho «ng ta.",
        "T¹i h¹ lËp tøc lªn ®­êng!"
    };
    SetTask(TASK_FIVE, 21);
    TalkEx("", szTalk);
    Msg2Player("§Õn Thanh Khª ®éng gi¶i v©y L«i Th¾ng");
    TaskTip("§Õn Thanh Khª ®éng gi¶i v©y L«i Th¾ng");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"jiuzhuleisheng")		--¾ÈÖúÀ×Ê¤
end;

function task_22_00()
    local szTalk = {
        "B¸o c« n­¬ng tin buån, L«i Th¾ng ®· chÕt trong Thanh Khª ®éng.",
        "Sao? H¾n chÕt råi ­?"
    };
    TalkEx("task_22_01", szTalk);
end;

function task_22_01()
    local szTalk = {
        "L«i Th¾ng ®Õn D­¬ng Ch©u lÇn nµy cã mang theo vËt phÈm quan träng ng­¬i thö kiÓm tra trªn thi thÓ h¾n xem.",
        "§Ó t¹i h¹ kiÓm tra xem."
    };
    TalkEx("task_22_02", szTalk);
end;

function task_22_02()
    SetTask(TASK_FIVE, 23);
    Msg2Player("Lôc so¸t thi thÓ cña L«i Th¾ng");
    TaskTip("Lôc so¸t thi thÓ cña L«i Th¾ng");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu1")		--ÉñÃØ±¦Îï1
end;

function task_23_00()
    local szTalk = {
        "T¹i h¹ ph¸t hiÖn {nöa tÊm b¶n ®å thÇn bÝ} trªn thi thÓ cña L«i Th¾ng ngoµi ra trong ®éng cßn xuÊt hiÖn nhiÒu ng­êi KhiÕt §an, nöa tÊm cßn l¹i ch¾c trªn ng­êi chóng.",
        "Sao? Thiªn ¢m gi¸o KhiÕt §an còng tham gia vô nµy µ? Ng­¬i mau quay l¹i {Thanh Khª ®éng} ®¸nh {Thiªn ¢m vâ sÜ} ®o¹t nöa tÊm b¶n ®å cßn l¹i!",
        "Ta ®i ngay!"
    };
    local szNot = {
        "Ng­¬i thö ®i ®iÒu tra thi thÓ cña L«i Th¾ng xem cã ph¸t hiÖn g× kh«ng?"
    };
    if GetItemCount(2,0,103) >= 1 then
        TalkEx("task_23_01", szTalk);
    else
        TalkEx("", szNot);
    end;
end;

function task_23_01()
    SetTask(TASK_FIVE, 24);
    DelItem(2,0,103,1);
    CreateTrigger(0,537,KILL_YZ_WS);
    Msg2Player("§¸nh Thiªn ¢m vâ sÜ trong Thanh Khª ®éng ®o¹t nöa tÊm b¶n ®å!");
    TaskTip("§¸nh Thiªn ¢m vâ sÜ trong Thanh Khª ®éng ®o¹t nöa tÊm b¶n ®å!");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu2")		--ÉñÃØ±¦Îï2
end;

function task_24_00()
    local szTalk = {
        "H·y ®Õn T¹p hãa mua {Cuèc}, mang theo {B¶n ®å thÇn bÝ} t×m tÊm bia ë {Vò Di s¬n} khai quËt lªn.",
        "ChuyÖn nµy ®¬n gi¶n th«i."
    };
    local szNot = {
        "Mau ®Õn {Thanh Khª ®éng} ®¸nh b¹i {Thiªn ¢m vâ sÜ} ®o¹t {nöa tÊm b¶n ®å} cßn l¹i!"
    };
    if GetItemCount(2,0,104) >= 1 then
        TalkEx("task_24_01", szTalk);
    else
        TalkEx("task_24_02", szNot);
    end;
end;

function task_24_02()
    if GetTrigger(KILL_YZ_WS) == 0 then
        CreateTrigger(0,537,KILL_YZ_WS);
    end;
end;

function task_24_01()
    AddItem(2,0,105,1);
    DelItem(2,0,104,1);
    SetTask(TASK_FIVE, 25);
    Msg2Player("Mang cuèc vµ b¶n ®å thÇn bÝ lªn Vò Di s¬n t×m b¶o vËt!");
    TaskTip("Mang cuèc vµ b¶n ®å thÇn bÝ lªn Vò Di s¬n t×m b¶o vËt!");
    GivePlayerAward("Level_34", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu3")		--ÉñÃØ±¦Îï3
end;

function task_25_00()
    local szTalk = {
        "H·y ®Õn T¹p hãa mua {Cuèc}, mang theo {B¶n ®å thÇn bÝ} lªn {Vò Di s¬n} khai quËt lªn!"
    };
    local szMsg = {
        "T×m kh«ng ®­îc {B¶n ®å thÇn bÝ}µ? May mµ ta cßn 1 tÊm, cÇm lÊy ®i!"
    };
    if GetItemCount(2,0,105) >= 1 then
        TalkEx("", szTalk);
    else
        TalkEx("task_25_00_00", szMsg);
    end;
end;

function task_25_00_00()
    AddItem(2,0,105,1);
end;

function task_26_00()
    local szTalk = {
        "§©y lµ vËt phÈm cña L«i Th¾ng mang theo.",
        "§óng råi! Ng­êi mau mang ®Õn cho {§­êng Ninh} ë {Vò Di s¬n}."
    };
    TalkEx("task_26_01", szTalk);
end;

function task_26_01()
    SetTask(TASK_FIVE, 27);
    Msg2Player("§em b¶o vËt thÇn bÝ giao cho §­êng Ninh");
    TaskTip("§em b¶o vËt thÇn bÝ giao cho §­êng Ninh");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu4")		--ÉñÃØ±¦Îï4
end;

function task_27_00()
    local szTalk = {
        "H¹ HÇu CÇm nhê ta mang ®Õn cho ®¹i nh©n.",
        "Ng­¬i gióp ta chuyÓn lêi víi H¹ HÇu CÇm."
    };
    TalkEx("task_27_01", szTalk);
end;

function task_27_01()
    SetTask(TASK_FIVE, 28);
    DelItem(2,0,106,1);
    Msg2Player("ChuyÓn lêi víi H¹ HÇu CÇm");
    TaskTip("ChuyÓn lêi víi H¹ HÇu CÇm");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu5")		--ÉñÃØ±¦Îï5
end;

function task_28_00()
    local szTalk = {
        "Ta ®· ®em b¶o vËt thÇn bÝ cho §­êng Ninh, c« n­¬ng cã thÓ an t©m.",
        "PhiÒn <sex> qu¸!"
    };
    TalkEx("task_28_01", szTalk);
end;

function task_28_01()
    SetTask(TASK_FIVE, 29);
    GivePlayerAward("Level_34", "hard", "weapon", "Level_34");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu6")		--ÉñÃØ±¦Îï6
end;

