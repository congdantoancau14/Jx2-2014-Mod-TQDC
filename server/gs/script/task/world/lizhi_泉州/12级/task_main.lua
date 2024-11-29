--  ===============ÎÄ¼þÐÅÏ¢=================
--  ½£ÏÀÇéÔµonlineII ÈªÖÞ 12 ¼¶ÈÎÎñÖ÷Ìå½Å±¾
--  Edited by lizhi
--  2005-8-2 15:36
--  ========================================

-- ¾çÇéÈÎÎñÎÄ¼þ
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_ÈªÖÝ\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "N¬i nµy cßn chç cho ng­êi nghÌo tró kh«ng?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()
    local szTalk = {
        "Nghe nãi ng­¬i tõng lµ thuéc h¹ Diªu LËp Thµnh cã tham gia vô c­íp V­¬ng NghiÖp VÜ.",
        "Ng­¬i lµ ai? Ph¶i Diªu LËp Thµnh ph¸i ®Õn giÕt ta diÖt khÈu kh«ng? Hay lµ ng­êi quan phñ? Ta cã biÕt chuyÖn g× ®©u!",
        "Yªn t©m! Ta chØ muèn biÕt chuyÖn cña Diªu LËp Thµnh.",
        "§Ó chøng minh, ng­¬i gióp ta ®¸nh b¹i {10 tªn L­u manh} vµ {10 tªn C«n ®å}!",
        "§­îc th«i!"
    };
    TalkEx("task_001_00", szTalk);
end;

function task_001_00()
    
	Msg2Player("TrÞ 10 tªn L­u manh vµ 10 tªn C«n ®å");
	TaskTip("TrÞ 10 tªn L­u manh vµ 10 tªn C«n ®å");
	
	CreateTrigger(0, 191, 81);  --É±ËÀÁ÷Ã¥10ÈË
	CreateTrigger(0, 192, 82);  --É±ËÀÎÞÀµ10ÈË
	
    SetTask(TASK_LEV_12_ID, 1);
    SetTask(TASK_LEV_10_ID, GetTask(TASK_LEV_10_ID) + 1);   --Ïû³ýÈÎÎñÃæ°å
    
end;

function task_001_01()
    
    local szTalk = {
        "Ng­¬i ®¸nh b¹i {10 tªn L­u manh} vµ 10 {tªn C«n ®å} ta míi tin!"
    };
    TalkEx("task_001_02", szTalk);
end;

function task_001_02()
    if GetTrigger(81) == 0 then
        CreateTrigger(0, 191, 81);  --É±ËÀÁ÷Ã¥10ÈË
    end;
    
    if GetTrigger(82) == 0 then
        CreateTrigger(0, 192, 82);  --É±ËÀÎÞÀµ10ÈË
    end;
end;

function task_003_00()

    local szTalk = {    
        "Kh¸ l¾m! Thùc ra ta còng kh«ng muèn lµm viÖc cho Diªu LËp Thµnh nh­ng thª tö bÞ bÖnh th­¬ng hµn, cÇn d­îc liÖu trÞ bÖnh.",
        "Ng­¬i cÇn d­îc liÖu nµo?",
        "§¹i phu nãi {D­îc ph­¬ng} cÇn {Ng¶i bôi}, {RÔ s¾n}, {Béi Lan}, {Liªn KiÒu}, {Kim Ng©n hoa} mçi thø {3 c¸i} vµ {10 l«ng} {Sãi xanh }.",
        "TrÞ bÖnh lµ quan träng, ®Ó ta gióp ng­¬i t×m chóng vÒ!"
    };
    TalkEx("task_004_00", szTalk);
end;

function task_004_00()

    Msg2Player("§Õn T©y TuyÒn Ch©u t×m Ng¶i bôi, RÔ s¾n, Béi Lan, Liªn KiÒu, Kim Ng©n hoa mçi thø 3 c¸i vµ 10 l«ng Sãi xanh.");
    TaskTip("T×m Ng¶i bôi, RÔ s¾n, Béi Lan, Liªn KiÒu, Kim Ng©n hoa mçi thø 3 c¸i vµ 10 l«ng Sãi xanh.");
    
    CreateTrigger(0, 193, 83);  --É±ËÀÒ©²Ý
    SetTask(TASK_LEV_12_ID, 4);
    GivePlayerAward("Level_12", "easy");    --½±Àø
    GivePlayerExp(SkeyQZWangyewei,"xiajiedekuzhong1")		--ÏÄ½ÜµÄ¿àÖÔ1
end;

function task_004_01()
    
    local szFinished = {
        "D­îc liÖu ®©y råi! §a t¹ ©n nh©n! Diªu LËp Thµnh h×nh nh­ lµ tiÓu ®Çu môc cña {Xi Háa gi¸o}, {m¶nh S¬n Hµ X· T¾c} hiÖn n»m trong chuyÕn hµng cña V­¬ng NghiÖp VÜ.",
        "V× vËy Diªu LËp Thµnh míi c­íp chuyÕn hµng cña V­¬ng NghiÖp VÜ. Nh­ng sao chóng l¹i c­íp sæ s¸ch?",
        "H×nh nh­ chuyÕn hµng Diªu LËp Thµnh c­íp ®­îc kh«ng cã m¶nh S¬n Hµ X· T¾c v× vËy míi lÊy sæ s¸ch xem ®· b¸n cho ai mong t×m ra manh mèi tÊm b¶n ®å.",
        "VËy lµ r¾c rèi to råi.",
        "§óng vËy! H·y ®Õn {TuyÒn Ch©u} t×m {V­¬ng NghiÖp VÜ} xem danh s¸ch ng­êi mua.",
        "Ta ®i ngay!",
        "Mãn ®å nµy ta gi÷ l¹i còng kh«ng dïng, tÆng cho ng­¬i!"
    };
    local szNotFinished = {
        "§¹i phu nãi {D­îc ph­¬ng} cÇn {Ng¶i bôi}, {RÔ s¾n}, {Béi Lan}, {Liªn KiÒu}, {Kim Ng©n hoa} mçi thø {3 c¸i} vµ {10 l«ng} Sãi xanh."
    };
    local nQingCount = 0;
    local nGeCount = 0;
    local nPeiCount = 0;
    local nLianCount = 0;
    local nJinCount = 0;
    local nMaoCount = 0;
    
    nQingCount = GetItemCount(2, 0, 33);    --ÇàÝï
    nGeCount = GetItemCount(2, 0, 34);      --¸ð¸ù
    nPeiCount = GetItemCount(2, 0, 35);     --ÅåÀ¼
    nLianCount = GetItemCount(2, 0, 36);    --Á¬ÇÌ
    nJinCount = GetItemCount(2, 0, 37);     --½ðÒø»¨
    nMaoCount = GetItemCount(2, 1, 5);      --ÀÇÃ«
    
    if ((nQingCount >= 3) and (nGeCount >= 3) and (nPeiCount >= 3) and (nLianCount >= 3) and (nJinCount >= 3) and (nMaoCount >= 10)) then
        TalkEx("task_005_00", szFinished);
    else
        TalkEx("task_005_01", szNotFinished);
    end;

end;

function task_005_01()
    if GetTrigger(83) == 0 then
        CreateTrigger(0, 193, 83);  --É±ËÀÒ©²Ý
    end;
end;

function task_005_00()
    GivePlayerAward("Level_12", "hard", "head", "Level_13");    --½±Àø
	GivePlayerExp(SkeyQZWangyewei,"xiajiedekuzhong2")		--ÏÄ½ÜµÄ¿àÖÔ2
    SetTask(TASK_LEV_12_ID, 5);
    --É¾³ýÈÎÎñµÀ¾ß
    DelItem(2, 0, 33, 3);
    DelItem(2, 0, 34, 3);
    DelItem(2, 0, 35, 3);
    DelItem(2, 0, 36, 3);
    DelItem(2, 0, 37, 3);
    DelItem(2, 1, 5, 10);
    RemoveTrigger(GetTrigger(83));  --É¾³ý²ÝÒ©´¥·¢Æ÷
end;