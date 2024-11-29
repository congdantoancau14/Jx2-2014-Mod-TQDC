--ÎÄ¼şËµÃ÷
--npc£ºÕÔÑÓÄê
--created by lizhi
--2005-8-10 10:37

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");

function talk_one()
    
    local szTalk = {
        "MÊy ngµy kh«ng gÆp <sex> qu¶ nhiªn tiÕn bé h¼n!",
        "KhÊu ChuÈn ®¹i nh©n cãth­ göi cho tiÒn bèi!",
        "Th­ g×? §­a ta xem.....",
        "[TriÖu Diªn Niªn më th­ ra xem xong suy nghÜ håi l©u]",
        "Kh«ng ngê sù viÖc l¹i hÖ träng ®Õn vËy. Ng­¬i ra søc gióp §¹i Tèng, TriÖu mç nµy rÊt kh©m phôc. Kh«ng giÊu g× ng­¬i, ta chİnh lµ ng­êi liªn l¹c víi {Tr­êng Ca M«n}.",
        "Ra lµ vËy! {Tr­êng Ca M«n}, {Thiªn ¢m gi¸o} lµm ta rèi c¶ lªn, tiÒn bèi gi¶i thİch mét chót ®­îc kh«ng?"
    };
    
    if GetTask(TASK_ONE) == 101 then
        TalkEx("task_002_00", szTalk);
    end;
end;

function talk_five()
    local szMsg = {
        "V·n bèi ®­îc lÖnh cña H¹ HÇu CÇm ®Õn th«ng b¸o vÒ m¶nh S¬n Hµ X· T¾c gÇn Giang Nam cã kh¶ n¨ng r¬i vµo tay bän Xi Háa gi¸o, h¬n n÷a th©n phËn «ng ta bŞ b¹i lé, xin xem qua bøc th­ sÏ râ!",
        "§a t¹ ng­¬i!",
        "Cßn nhiÒu ng­êi cÇn ph¶i th«ng b¸o n÷a, v·n bèi ®i ®©y!"
    };
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(127,2);
        DelItem(2,0,43,1);
        TalkEx("", szMsg);
    end;
end;

function task_002_00()
    local szTalk = {
        "Lai lŞch Tr­êng Ca M«n b¾t ®Çu tõ ngµy khai quèc. Lóc ®ã Th¸i Tæ b×nh ®Şnh giang s¬n, c¸c vŞ t­íng nh­ Th¹ch Thñ Tİn, Cao Hoµi §øc, Tr­¬ng LÖnh Phong, TriÖu Ng¹n Huy ®Òu c¸o l·o håi h­¬ng, an d­ìng tuæi giµ. §¸ng tiÕc {TriÖu Ng¹n Huy} ®¹i nh©n kh«ng chŞu næi sù c« ®¬n bÌn liªn l¹c mét sè b¹n bÌ giang hå, ng©m th¬, tû vâ nghÖ.",
        "VÒ sau nh÷ng vŞ b»ng h÷u nµy thµnh lËp thµnh mét m«n ph¸i. Lóc ®ã trong ph¸i nhiÒu ng­êi s¸ng t¸c nh¹c lµm th¬ cho nªn míi cã tªn {Tr­êng Ca M«n}. ViÖc cÇn lµm lóc nµy lµ th«ng b¸o cho nh÷ng huynh ®Ö Êy biÕt.",
        "HiÖn {4 ng­êi} ®Òu ®ang phông mÖnh ®iÒu tra, ta ph¶i th«ng b¸o cho {¢u D­¬ng Häa} tr­íc. {H¹ HÇu CÇm} ë {D­¬ng Ch©u}, {C«ng T«n Th­} ë {T­¬ng D­¬ng}, {Gia C¸t Kú}ë {Giang T©n Th«n}, kh«ng biÕt <sex> cã thÓ gióp ta th«ng b¸o cho 3 vŞ kh«ng?",
        "V·n bèi ®i ngay!"
    };
    TalkEx("task_002_000", szTalk);
end;

function task_002_000()
    local szTalk = {
        "C¶m ¬n <sex>! Thùc ra B¸ch HiÓu Sinh còng lµ ng­êi cña Tr­êng Ca M«n, ng­êi ®êi gäi «ng ta lµ {Trİ hiÖp}. <sex> muèn biÕt thªm vÒ Tr­êng Ca M«n cã thÓ ®Õn ®ã.",
        "§¹ ta tiÒn bèi chØ dÉn, sau khi th«ng b¸o cho xong 3 vŞ tiÒn bèi kia v·n bèi sÏ t×m {B¸ch HiÓu Sinh} thØnh gi¸o."
    };
    TalkEx("task_002_01", szTalk);
end;

function task_002_01()
    --½ÓÊÜÈÎÎñ£ºÏŞÊ±ÕÒÏÄºîÇÙ¡¢Öî¸ğÆå¡¢¹«ËïÊé£¬ÔÚÊ±¼äÄÚÍê³ÉµÃµ½È«²¿½±Àø£¬³¬Ê±Ôò½±ÀøÕÛÎª1/3¡£
    SetTask(TASK_ONE, 102);
    RemoveTrigger(GetTrigger(90));
    
    CreateTrigger(1, 201, 90);
    ContinueTimer(GetTrigger(90));
    
    CreateTrigger(3, 203, 89);
    SetLogType(GetTrigger(89), 1);
    
    CreateTrigger(4, 201, 91);    --talk to ÏÄºîÇÙ
    SetTask(124,1);
    CreateTrigger(4, 206, 96);    --talk to Öî¸ğÆå
    SetTask(126,1);
    CreateTrigger(4, 207, 97);    --talk to ¹«ËïÊé
    SetTask(125,1);
    
    Msg2Player("Liªn l¹c 3 víi 3 ng­êi cßn l¹i trong Tr­êng Ca M«n");
    TaskTip("Liªn l¹c 3 víi 3 ng­êi cßn l¹i trong Tr­êng Ca M«n");
    
    --½ÓÊÜÈÎÎñ£ºÕÒ°ÙÏşÉú
    SetTask(TASK_TWO, 1);
end;