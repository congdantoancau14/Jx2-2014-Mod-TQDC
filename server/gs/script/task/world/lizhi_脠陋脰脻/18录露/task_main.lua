
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÈªÖŞ 18 ¼¶ÈÎÎñÖ÷Ìå½Å±¾
-- Edited by lizhi
-- 2005-8-4 16:36
-- ======================================================

-- ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_ÈªÖİ\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");

function can_not_accept_task()
    local szTalk = {
        "Thêi gian ng¾n vËy sao ta lµm hÕt ®­îc sè ®ao nµy?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()
    local szTalk = {
        "Nghe nãi ng­¬i lµ chñ m­u cña vô lÊy trém nhµ §¹i Chİ C­êng.",
        "Ta còng kh«ng muèn nh­ng vî con bŞ tªn h¾c y nh©n b¾t ®i, h¾n b¶o cÇn chuyÕn hµng ngäc cña §¹i Chİ C­êng míi th¶ vî con vÒ.",
        "Sao ng­¬i lÊy ®­îc ch×a khãa kho b¸u cña §¹i Chİ C­êng? Theo ta biÕt ch×a khãa ®ã chØ cã mét c¸i.",
        "Ch×a khãa nhµ §¹i Chİ C­êng lµ do ta lµm, së thİch cña ta lµ khi lµm ch×a cho ng­êi kh¸c th­êng lµm thªm mét c¸i. Tªn h¾c y nh©n b¾t ta ph¶i ®em ®å ngäc vÒ b»ng kh«ng vî con gÆp nguy hiÓm.",
        "Ng­¬i biÕt ng­êi ®ã lµ ai, ë ®©u kh«ng?",
        "Nghe ®©u h¾n tªn Ch­¬ng VÜ C­¬ng, tiÓu ®Çu môc cña Xi Háa gi¸o. §ang ë B¾c TuyÒn Ch©u.",
        "§Ó ta ®i t×m h¾n."
    };
    
    TalkEx("task_001_00", szTalk);
    
end;
    
function task_001_00()

    Msg2Player("§Õn B¾c TuyÒn Ch©u t×m Ch­¬ng VÜ C­¬ng (179.180)");
    TaskTip("§Õn B¾c TuyÒn Ch©u t×m Ch­¬ng VÜ C­¬ng (179.180)");
    --CreateTrigger(0, 195, 85);  --É±ËÀÕÂÎ°¸Õ
    KillFollower();
    SetTask(TASK_LEV_18_ID, 1);
    SetTask(TASK_LEV_14_ID, GetTask(TASK_LEV_14_ID) + 1);   --Ïû³ıÈÎÎñÃæ°å
    
end;

function task_001_01()
    local szTalk = {
        "Ch­¬ng VÜ C­¬ng g× ®ã? Nghe ®©u lµm tiÓu ®Çu môc cña Xi Háa gi¸o, hiÖn ®ang ë B¾c TuyÒn Ch©u."
    };
    TalkEx("task_001_02", szTalk);
end;

function task_001_02()
--    if GetTrigger(85) == 0 then
--        CreateTrigger(0, 195, 85);  --É±ËÀÕÂÎ°¸Õ
--    end;
	KillFollower();
end;

function task_002_00()
    local szTalk = {
        "§a t¹ ©n nh©n! Phu thª ta ®· ®­îc ®oµn tô!"
    };
    TalkEx("task_003_00", szTalk);
end;

function task_003_00()
    KillFollower();
    RemoveTrigger(GetTrigger(86));
    RemoveTrigger(GetTrigger(87));
    GivePlayerAward("Level_18", "hell", "chest", "Level_19");    --½±Àø
	GivePlayerExp(SkeyQZWangyewei,"zongfangdekunao")		--ÖÓ·ÅµÄ¿àÄÕ
    SetTask(TASK_LEV_18_ID, 3);
end;

function task_003_01()
    local szTalk = {
        "§¹i nh©n r¶nh rçi ®Õn TuyÒn Ch©u th­ëng ngo¹n mét chuyÕn!"
    };
    TalkEx("task_001_02", szTalk);
end;
