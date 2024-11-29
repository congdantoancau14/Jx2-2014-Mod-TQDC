
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÈªÖŞ 14 ¼¶ÈÎÎñÖ÷Ìå½Å±¾
-- Edited by lizhi
-- 2005-8-4 10:38
-- ======================================================

-- ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_ÈªÖİ\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "Canh g¸c nghiªm ngÆt vËy sao mÊt trém ®­îc?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()

    local szTalk = {
        "Nghe nãi kho b¸u cña ®¹i nh©n bŞ trém, ta ®ang ®iÒu tra chuyÖn nµy, xin nãi râ h¬n ®­îc kh«ng?",
        "H«m ®ã, khi ta thøc dËy, gäi c¶ nöa ngµy mµ kh«ng thÊy L­u qu¶n gia ®©u, ®Õn phßng «ng ta th× thÊy ®å ®¹c ®· dän ®i.",
        "Råi sao n÷a?",
        "Võa lóc ®ã, a hoµn TiÒn T­¬ng hèt ho¶ng ch¹y ®Õn b¸o cöa khè phßng ®· bŞ më, n¬i ®ã chØ cã ta míi cã ch×a khãa ra vµo.",
        "Chung quy lµ mÊt nh÷ng thø g×? Cã ph¶i L­u qu¶n gia lÊy c¾p kh«ng?"
    };
    
    TalkEx("task_001_00", szTalk);
end;

function task_001_00()
    local szMsg = {
        "ThËt ®¸ng tiÕc! chuyÕn hµng b»ng ngäc mÊt hÕt. Ta chØ ph¸t hiÖn bøc th­ trong phßng cña L­u qu¶n gia, ch¾c trong lóc gÊp g¸p «ng ta ®Ó quªn. Ch÷ trong th­ ®· mê do dİnh n­íc, ng­¬i thö mang ®i ®iÒu tra xem.",
        "Lµm sao ®Ó ®äc ®­îc c¸c ch÷ nµy?",
        "Ng­¬i thö ®Õn t×m Chu B©n Cö (162.185), biÕt ®©u kh«i phôc ®­îc bøc th­."
    };
    
    TalkEx("", szMsg);

	Msg2Player("§Õn phñ TuyÒn Ch©u t×m Chu B©n Cö");
	TaskTip("§Õn phñ TuyÒn Ch©u t×m Chu B©n Cö");
	
	AddItem(2, 0, 38, 1);   --Ä£ºıµÄ×ÖÌõ
	
	SetTask(TASK_LEV_14_ID, 1);
	SetTask(TASK_LEV_12_ID, GetTask(TASK_LEV_12_ID) + 1);   --Ïû³ıÈÎÎñÃæ°å
end;


function task_001_01()

    local szTalk = {
        "Ng­¬i thö ®Õn t×m Chu B©n Cö (162.185), biÕt ®©u kh«i phôc ®­îc bøc th­."
    };

    TalkEx("", szTalk);
end;

function task_001_02()

    local szTalk = {
        "T¹i h¹ cã bøc th­ kh«ng may thÊm n­íc kh«ng biÕt ®¹i nh©n gióp kh«i phôc l¹i ®­îc kh«ng?",
        "ViÖc nµy kh«ng khã, nh­ng cÇn cã: 1 Linh phï chØ, 1 Chu sa, 1 D· Tr­ mao.",
        "§Ó ta ®i t×m."
    };
    
    TalkEx("task_002_00",szTalk);
end;

function task_002_00()

    Msg2Player("T×m Linh phï chØ, Chu sa vµ D· Tr­ mao cho Chu B©n Cö");
    TaskTip("T×m Linh phï chØ, Chu sa vµ D· Tr­ mao cho Chu B©n Cö");
    CreateTrigger(0, 194, 84);  --É±ËÀÒ°Öí
    SetTask(TASK_LEV_14_ID, 2);
end;

function task_002_01()
    
    local szNotFinished = {
        "Ta nh¾c l¹i lÇn n÷a! Nguyªn liÖu cÇn t×m lµ: 1 Linh phï chØ, 1 Chu sa, 1 D· Tr­ mao!"
    };
    local szMaleFinished = {
        "§óng råi! §îi ta mét l¸t!",
        "….",
        "Bøc th­ ®· ®­îc kh«i phôc. Hihi…Bøc th­ nµy ch¾c c«ng tö viÕt cho vŞ hång nhan nµo ®©y? Trong ®ã ghi Phñ t©y TuyÒn Ch©u, gÆp ë chç cò. Thêi gian kh«ng cßn sím, c«ng tö mau ®i kÎo bá lì c¬ héi."
    };
    local szFemaleFinished = {
        "§óng råi! §îi ta mét l¸t!",
        "….",
        "Bøc th­ ®· ®­îc kh«i phôc. Hihi…Bøc th­ nµy ch¾c c«ng tö viÕt cho vŞ hång nhan nµo ®©y? Trong ®ã ghi Phñ t©y TuyÒn Ch©u, gÆp ë chç cò. Thêi gian kh«ng cßn sím, c«ng tö mau ®i kÎo bá lì c¬ héi."
    };
        
    local nPen = 0;
    local nPaper = 0;
    local nHair = 0;
    
    nPen = GetItemCount(2, 2, 65);     --Áé·ûÖ½
    nPaper = GetItemCount(2, 2, 30);  --ÖìÉ°
    nHair = GetItemCount(2, 0, 39);     --¼«Ï¸µÄÒ°ÖíÃ«
    
    if ((nPen >= 1) and (nPaper >= 1) and (nHair >= 1)) then
        if (GetSex() == 1) then
            TalkEx("task_003_00", szMaleFinished);
        elseif (GetSex() == 2) then
            TalkEx("task_003_00", szFemaleFinished);
        end;
    else
        TalkEx("task_003_10", szNotFinished);
    end;
end;

function task_003_10()
    if GetTrigger(84) == 0 then
        CreateTrigger(0, 194, 84);  --É±ËÀÒ°Öí
    end;
end;

function task_003_00()

    GivePlayerAward("Level_14", "easy");    --½±Àø
	GivePlayerExp(SkeyQZWangyewei,"jiayouneizei1")		--¼ÒÓĞÄÚÔô1
    SetTask(TASK_LEV_14_ID, 3);
    
    DelItem(2,2,65,1);
    DelItem(2,2,30,1);
    DelItem(2,0,39,1);
    DelItem(2, 0, 38, 1);   --Ä£ºıµÄ×ÖÌõ
    RemoveTrigger(GetTrigger(84));

end;

function task_003_01()
    
    local szTalk = {
        "Phñ t©y TuyÒn Ch©u, chç gÆp cò, ng­¬i cßn kh«ng mau ®i!"
    };
    TalkEx("", szTalk);

end;

function task_003_02()
    
    local szTalk = {
        "L­u qu¶n gia! T­ëng lÊy c¾p ®å xong tho¸t ®­îc µ? Khai mau chuyÕn hµng cña §¹i Chİ C­êng ®Ó ®©u? Ai sai ng­¬i lµm?",
        "§¹i nh©n, xin tha m¹ng! §Ó ta nãi!",
        "Nãi mau!",
        "Lµ….thî rÌn Chung Phãng ë phñ TuyÒn Ch©u b¶o ta lÊy c¾p, h¾n nãi lóc tr­íc lµm ch×a khãa cho §íi l·o gia lĞn lót lµm thªm mét ch×a, nãi sau khi thµnh c«ng sÏ chia cho ta nhiÒu h¬n. HiÖn h¾n mang chuyÕn hµng ®ã ®i råi, ng­¬i t×m h¾n hái xem, xin tha m¹ng!",
        "H«m nay ta t¹m tha cho ng­¬i!"
    };
    TalkEx("task_004_00", szTalk);
end;

function task_004_00()

    GivePlayerAward("Level_14", "hard", "weapon", "Level_16");    --½±Àø
	GivePlayerExp(SkeyQZWangyewei,"jiayouneizei2")		--¼ÒÓĞÄÚÔô2
    SetTask(TASK_LEV_14_ID, 4);
    SetTask(TASK_LEV_18_ID, 100);   --ÈªÖİÖÓ·ÅÈÎÎñ¿ªÆô
end;

function task_004_01()
    
    local szTalk = {
        "TÊt c¶ lµ do Chung Phãng chØ thŞ, ng­¬i t×m h¾n hái xem, xin tha m¹ng!"
    };
    TalkEx("", szTalk);
end;