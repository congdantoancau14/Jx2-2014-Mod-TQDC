--½­½ò´å½Å±¾
--created by lizhi
--2005-9-5 19:43

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function task_01_00()
    local szTalk = {
        "Xin hái cã ph¶i Gia C¸t tiÒn bèi kh«ng?",
        "ChÝnh l·o phu ®©y, kh«ng biÕt <sex> t×m ta cã chuyÖn g×?",
        "Thµnh §« phñ m­în cí chuyÓn Hoa C­¬ng th¹ch thùc chÊt chuyÓn m¶nh S¬n Hµ X· T¾c vµo cung, bän ng­êi L­¬ng S¬n B¹c ®ang ©m m­u, ngoµi ra ®¸m ng­êi T©y H¹ nhÊt phÈm ®­êng còng ®ang manh ®éng. T¹i h¹ nhÊt thêi kh«ng nghÜ ra h­íng gi¶i quyÕt, xin tiÒn bèi chØ thÞ. §©y lµ tÝn vËt tiÒn bèi xem qua!",
        "<sex> cã biÕt Tr­êng Ca M«n kh«ng? §ã lµ tæ chøc ®­îc s¸ng lËp bëi nguyªn l·o khai quèc nhµ Tèng. MÊy h«m tr­íc C«ng T«n Th­ ph¸t hiÖn cöa ®éng Phong Ma ®· më, yªu ma nh©n c¬ héi ra ngoµi h¹i ng­êi ta cïng mét sè ®Ö tö ph¶i ®Õn ®ã bµy trËn. ChuyÖn <sex> l·o phu kh«ng gióp ®­îc råi!",
        "VËy b©y giê ph¶i lµm sao?"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    local szTalk = {
        "<sex> kh«ng ph¶i lo l¾ng, l·o phu sÏ giíi thiÖu mét ng­êi nhÊt ®Þnh gióp ®­îc!",
        "Lµ ai vËy?",
        "Ng­êi nµy tªn TrÇn Phi D­¬ng, ®Ö tö 6 tói C¸i Bang, c­¬ng nghÞ quyÕt ®o¸n, rÊt cã nghÜa khÝ. <sex> h·y mang bøc th­ nµy ®Õn Thµnh §« t×m N¹n D©n gi¸p, ng­êi nµy sÏ dÉn ®i gÆp TrÇn Phi D­¬ng.",
        "§a t¹ Gia C¸t tiÒn bèi!",
        "Kh«ng cÇn ®a lÔ!"
    };
    TalkEx("task_01_02", szTalk);
end;

function task_01_02()
    SetTask(TASK_JJC, 2);
    DelItem(2,0,78,1);
    AddItem(2,0,81,1);
    Msg2Player("T×m N¹n D©n gi¸p Thµnh §«");
    TaskTip("T×m N¹n D©n gi¸p Thµnh §«");
    GivePlayerAward("Level_20", "hard");
	GivePlayerExp(SkeyCDFanzhongyan,"baifangzhugeqi1")		--°Ý·ÃÖî¸ðÆå1
end;

function task_02_00()
    local szTalk = {
        "Cho hái cã ph¶i {huynh ®Ö C¸i Bang} kh«ng?",
        "§óng råi! Kh«ng biÕt <sex> ®Õn ®©y g©y thï hay kÕt b¹n?",
        "T¹i h¹ ®­îc {Gia C¸t Kú} giíi thiÖu ®Õn gÆp mÆt ®­êng chñ TrÇn Phi D­¬ng, ë ®©y cã Phong th­ xin xem qua.",
        "Ta kh«ng biÕt ch÷, xem <sex> hiÒn lµnh ch¾c kh«ng g¹t ta, nh­ng hiÖn ta ®ang thÌm r­îu. <sex> t×m gióp ta 20 b×nh Thiªu töu ®­îc kh«ng?",
        "§­îc th«i!"
    };
    TalkEx("task_02_01", szTalk);
end;

--2,1,12  ÉÕ¾Æ

function task_02_01()
    SetTask(TASK_JJC, 3);
    Msg2Player("T×m 20 b×nh Thiªu töu vÒ cho n¹n d©n Gi¸p");
    TaskTip("T×m 20 b×nh Thiªu töu vÒ cho n¹n d©n Gi¸p");
    GivePlayerAward("Level_20", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"baifangzhugeqi2")		--°Ý·ÃÖî¸ðÆå2
end;

function task_03_00()
    local szSay = {
        "<sex> vÒ råi µ? Cã mang r­îu kh«ng?",
        "20 b×nh r­îu ®©y!/have_one",
        "Ch­a mua ®­îc, sÏ quay lai sau!/have_none"
    };
    SelectSay(szSay);
end;

function have_one()
    local szMsg = {
        "Ta ®ang thÌm r­îu. <sex> gióp ta t×m 20 b×nh Thiªu Töu ®­îc kh«ng?"
    };
    local szTalk = {
        "Nh×n mÊy b×nh r­îu nµy lµm ta liªn t­ëng ®Õn mÊy huynh ®Ö cïng ho¹n n¹n ë Giang T©n th«n. <sex> gióp ta ®em mÊy b×nh r­îu nµy cho c¸c huynh ®Ö Êy ®­îc kh«ng?",
        "§­îc th«i!"
    };
    if GetItemCount(2,1,12) >= 20 then
        TalkEx("task_03_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_03_01()
    SetTask(TASK_JJC, 4);
    SetTask(TASK_JJC_YI, 1);
    SetTask(TASK_JJC_BING, 1);
    SetTask(TASK_JJC_DING, 1);
    DelItem(2,1,12,5);
    Msg2Player("§em Thiªu töu cßn l¹i chia cho mÊy n¹n d©n kh¸c");
    TaskTip("§em Thiªu töu cßn l¹i chia cho mÊy n¹n d©n kh¸c");
    GivePlayerAward("Level_20", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangtangzhu1")		--Ø¤°ïÌÃÖ÷1
end;

function task_04_00()
    local szTalk = {
        "<sex> mau ®em r­îu ngon ph©n ph¸t cho mÊy n¹n d©n kh¸c!"
    };
    --ÐÞ²¹ÈÎÎñbug£¬²¹ÉÏ
    if GetTask(TASK_JJC_YI) == 2 and GetTask(TASK_JJC_BING) == 2 and GetTask(TASK_JJC_DING) == 2 then
        --SetTask(TASK_JJC, 5);
        SetTask(TASK_JJC_YI, 0);
        SetTask(TASK_JJC_BING, 0);
        SetTask(TASK_JJC_DING, 0);
        task_05_00();
    else
    	TalkEx("", szTalk);
    end;
end;

function task_jjc_fq(nPerson)
    local szTalk = {};
    local nTaskID = 0;
    if GetItemCount(2,1,12) >= 5 then
        if nPerson == 2 then    --ÄÑÃñÒÒ
            szTalk = {
                "R­îu ngon qu¸! NhÊt ®Þnh lµ Thiªu töu!",
                "ë ®©y cßn 5 b×nh tõ tõ uèng th«i!"
            };
            nTaskID = TASK_JJC_YI;
        elseif nPerson == 3 and GetCash() >= 50 then    --ÄÑÃñ±û£¬ÓÐ50Í­ÒÔÉÏ
            szTalk = {
                "Kh«ng r­îu, kh«ng b¸nh ng«, sao sèng ®©y!",
                "Ha ha! ë ®©y cã 5 b×nh Thiªu töu. C¹n vµi chung míi ®­îc!.",
                "R­îu ngon th× ph¶i cã b¸nh ng« n÷a chø. <sex> cã mang theo kh«ng?",
                "Kh«ng cã! Nh­ng ta cã thÓ cho ng­¬i 10 tiÒn ®ång mua b¸nh ng«."
            };
            nTaskID = TASK_JJC_BING;
        elseif nPerson == 3 and GetCash() < 50 then     --ÄÑÃñ±û£¬Ã»ÓÐ50Í­
            szTalk = {
                "Kh«ng r­îu, kh«ng b¸nh ng«, sao sèng ®©y!",
                "Ha ha! ë ®©y cã 5 b×nh Thiªu töu. C¹n vµi chung míi ®­îc!.",
                "R­îu ngon th× ph¶i cã b¸nh ng« n÷a chø. <sex> cã mang theo kh«ng?",
                "§ång c¶nh ngé mµ!"
            };
            nTaskID = TASK_JJC_BING;
        elseif nPerson == 4 then    --ÄÑÃñ¶¡
            szTalk = {
                "N¹n d©n Gi¸p nhê ta mang {5 b×nh r­îu} tíi, ng­¬i cÇm lÊy ®i!",
                "(ùc..ùc…)",
                "Thó vÞ nhØ!"
            };
            nTaskID = TASK_JJC_DING;
        end;
        if GetTask(nTaskID) == 1 then
            TalkEx("#task_jjc_fq_01("..nTaskID..")", szTalk);
        end;
    else
        szTalk = {
            "Kh«ng ®ñ r­îu! Ta ®i t×m vµi b×nh n÷a ®©y!"
        };
        TalkEx("", szTalk);
    end;
end;

function task_jjc_fq_01(nTaskID)
    --GivePlayerAward("Level_20", "normal");
	if nTaskID == TASK_JJC_BING and GetCash() >= 50 then
    	Pay(10);
    end;
    ModifyExp(100);
	DelItem(2,1,12,5);
	SetTask(nTaskID, 2);
    --Èç¹û3¸öÄÑÃñ¶¼ËÍ¹ýÁË
    if GetTask(TASK_JJC_YI) == 2 and GetTask(TASK_JJC_BING) == 2 and GetTask(TASK_JJC_DING) == 2 then
        SetTask(TASK_JJC, 5);
        SetTask(TASK_JJC_YI, 0);
        SetTask(TASK_JJC_BING, 0);
        SetTask(TASK_JJC_DING, 0);
    end;
end;

function task_05_00()
    local szTalk = {
        "MÊy h«m råi kh«ng gÆp TrÇn ®µ chñ, nghe ®©u ®µ chñ ®Õn KiÕm C¸c thôc ®¹o, ng­¬i thö ®Õn ®ã t×m xem!",
        "§­îc! §Ó ta ®i mét chuyÕn."
    };
    TalkEx("task_05_01", szTalk);
end;

function task_05_01()
    SetTask(TASK_JJC, 6);
    Msg2Player("§i KiÕm C¸t Thôc ®¹o t×m TrÇn Phi D­¬ng");
    TaskTip("§i KiÕm C¸t Thôc ®¹o t×m TrÇn Phi D­¬ng");
    GivePlayerAward("Level_20", "hard", "chest", "Level_27");
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangtangzhu2")		--Ø¤°ïÌÃÖ÷2
end;

function task_06_00()
    local szTalk = {
        "VÞ ®¹i ca ®©y cã ph¶i {TrÇn Phi D­¬ng} kh«ng?",
        "Ng¹i qu¸! Kªu ta TrÇn huynh ®Ö ®­îc råi, t×m ta cã chuyÖn g× kh«ng?",
        "TrÇn huynh ®Ö qu¶ nhiªn lanh lîi! Ta ®­îc {Gia C¸t tiÒn bèi} giíi thiÖu ®Õn, tÝn vËt ®©y mêi xem qua!",
        "(®äc xong vÎ mÆt thay ®æi h¼n) Ta còng ®ang phiÒn chuyÖn nµy. <sex> thÊy cuéc chiÕn gi÷a T©y H¹ vµ §¹i Tèng thÕ nµo?"
    };
    TalkEx("task_06_01", szTalk);
end;

function task_06_01()
    local szTalk = {
        "V·n bèi míi b­íc ch©n vµo giang hå nªn kh«ng hiÓu râ l¾m, nh­ng ®· lµ con ch¸u §¹i Tèng th× kh«ng thÓ ®Ó b¶n ®å S¬n Hµ X· T¾c r¬i vµo tay kÎ ®Þch. H¬n n÷a gia s­ cã nãi mét vÞ anh hïng thËt sù kh«ng ph¶i qua d©n téc mµ lµ do phÈm chÊt cña tõng ng­êi.",
        "ý chÝ cña <sex> thËt ®¸ng kh©m phôc. (suy nghÜ) Ta ®Þnh xuèng nói gióp <sex>mét tay nh­ng bÞ bän yªu ma trong Kim Quang ®éng ®¶ th­¬ng, hiÖn ®i ®øng bÊt tiÖn. <sex> cã thÓ gióp ta t×m hæ cèt ®­îc kh«ng?",
        "TrÇn ®¹i ca cÇn bao nhiªu hæ cèt?",
        "10 c¸i ®ñ råi!"
    };
    TalkEx("task_06_02", szTalk);
end;

function task_06_02()
    SetTask(TASK_JJC, 7);
    CreateTrigger(0,546,KILL_JJC_LAOHU);
    DelItem(2,0,81,1);
    Msg2Player("LÊy 10 hæ cèt cho TrÇn Phi D­¬ng");
    TaskTip("LÊy 10 hæ cèt cho TrÇn Phi D­¬ng");
    GivePlayerAward("Level_24", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"liaoshangzhiyao1")		--ÁÆÉËÖ®Ò©1
end;

function task_07_00()
    local szTalk = {
        "<sex> ®· t×m ®­îc hæ cèt ch­a?",
        "10 hæ cèt ®©y!",
        "Xem ra vâ c«ng <sex> kh«ng tåi, ®óng lµ hËu sinh kh¶ óy.",
        "TrÇn ®¹i ca ®õng c­êi!",
        "Cã Hæ cèt ta chØ cÇn d­ìng th­¬ng vµi ngµy lµ khái bÖnh. L­¬ng S¬n cao thñ nh­ m©y, h·y ®Õn ®ã mét chuyÕn. <sex>, ®©y lµ ph¸p khÝ ta lÊy ®­îc trong Kim Quang ®éng, xin mang vÒ choGia C¸t Kú trõ yªu. NÕu cã tin tøc lËp tøc ®Õn KiÕm C¸c Thôc ®¹o héi ngé víi c¸c huynh ®Ö!",
        "Ta vÒ Thµnh §« tr­íc ®©y, xin b¶o träng!"
    };
    local szMsg = {
        "<sex> ®· t×m ®­îc hæ cèt ch­a?",
        "VÉn ch­a t×m ®­îc."
    };
    if GetItemCount(2,0,55) >= 10 then
        TalkEx("task_07_01", szTalk);
    else
        TalkEx("task_07_02", szMsg);
    end;
end;

function task_07_02()
    if GetTrigger(KILL_JJC_LAOHU) == 0 then
        CreateTrigger(0,546,KILL_JJC_LAOHU);
    end;
end;

function task_07_01()
    DelItem(2,0,55,10);
    AddItem(2,0,83,1);
    SetTask(TASK_JJC, 8);
    Msg2Player("Mang ph¸p khÝ giao cho Gia C¸t Kú");
    TaskTip("Mang ph¸p khÝ giao cho Gia C¸t Kú");
    GivePlayerAward("Level_24", "hard");
	GivePlayerExp(SkeyCDFanzhongyan,"liaoshangzhiyao2")		--ÁÆÉËÖ®Ò©2
end;

function task_08_00()
    local szTalk = {
        "<sex> t×m ®­îc TrÇn Phi D­¬ng ch­a?",
        "T×m ®­îc råi! TrÇn ®¹i ca b¶o ta mang ph¸p khÝ nµy vÒ tiªu diÖt yªu ma.",
        "§Ó ta xem tiÓu tö Phi D­¬ng t×m ®­îc b¶o bèi g×? Kh¸ l¾m! Kh«ng ngê h¾n t×m ®­îc Táa Yªu Chung.",
        "Táa Yªu Chung?",
        "§©y lµ lo¹i chu«ng Tr­¬ng Thiªn S­ sö dông nhèt c¸c hån ma. <sex>cã thÓ dïng chóng nhèt th©y ma, c­¬ng thi. NÕu n¨ng lùc kh«ng ®ñ, cã thÓ ®Õn Giang T©n Th«n t×m Tr­¬ng §×nh (191.167) nghÜ c¸ch.",
        "Ta còng muèn thö uy lùc cña lo¹i chu«ng nµy."
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    DelItem(2,0,83,1);
    AddItem(2,0,84,1);
    CreateTrigger(0,547,KILL_JJC_FS);
    CreateTrigger(0,548,KILL_JJC_XS);
    SetTask(TASK_JJC, 9);
    Msg2Player("T×m 25 Oan hån Hñ Thi vµ 15 Oan hån Hµnh thi");
    TaskTip("T×m 25 Oan hån Hñ Thi vµ 15 Oan hån Hµnh thi");
    GivePlayerAward("Level_26", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"huangyeyuanhun1")		--»ÄÒ°Ô©»ê1
end;

function task_09_00()
    local szTalk = {
        "<sex> t×m ®­îc bao nhiªu Oan hån råi?",
        "Thu ®­îc 25 Oan hån Hñ Thi vµ 15 Oan hån Hµnh Thi.",
        "Hõm..!",
        "TiÒn bèi phiÒn muén chuyÖn g× vËy?",
        "<sex> cã biÕt c¸c th©y ma, c­¬ng thi nµy ®Òu lµ nh÷ng d©n lµng chÕt kh«ng ®­îc siªu tho¸t hãa thµnh kh«ng? Ta kh«ng nhÉn t©m hñy chóng.",
        "Nghe nãi {cao t¨ng ThiÕu L©m cã thÓ dïng PhËt ph¸p siªu ®é cho c¸c hån ma}, cã cÇn t¹i h¹ ®Õn ThiÕu L©m mét chuyÕn kh«ng?",
        "<sex> qu¶ lµ tõ bi, sau nµy sÏ gÆp ®iÒu lµnh! Giê nhê <sex> ®Õn ThiÕu L©m mét chuyÕn!"
    };
    local szMsg = {
        "<sex> mau mang theo Táa Yªu Chung nµy thu phôc Oan hån {Hñ Thi vµ Hµnh Thi}!"
    };
    --Ô©»êÊýÁ¿²»¹»
    if GetItemCount(2,0,85) < 25 or GetItemCount(2,0,86) < 15 then
        TalkEx("task_09_02", szMsg);
        if GetItemCount(2,0,84) == 0 then
            AddItem(2,0,84,1);
        end;
    else
        TalkEx("task_09_01", szTalk);
    end;
end;

function task_09_02()
    if GetTrigger(KILL_JJC_FS) == 0 then
        CreateTrigger(0,547,KILL_JJC_FS);
    end;
    if GetTrigger(KILL_JJC_XS) == 0 then
        CreateTrigger(0,548,KILL_JJC_XS);
    end;
end;

function task_09_01()
    RemoveTrigger(GetTrigger(KILL_JJC_FS));
    RemoveTrigger(GetTrigger(KILL_JJC_XS));
    if GetItemCount(2,0,84) == 0 then
        AddItem(2,0,84,1);
    end;
    SetTask(TASK_JJC, 10);
    Msg2Player("§em oan hån ®Õn ThiÕu L©m t×m cao t¨ng siªu ®é");
    TaskTip("§em oan hån ®Õn ThiÕu L©m t×m cao t¨ng siªu ®é");
    GivePlayerAward("Level_26", "hard", "head", "Level_30");
	GivePlayerExp(SkeyCDFanzhongyan,"huangyeyuanhun2")		--»ÄÒ°Ô©»ê2
end;

function task_10_00()
    local szTalk = {
        "ThÝ chñ xin dõng b­íc! N¬i ®©y cho c¸c cao t¨ng tu luyÖn, kh«ng nªn mang {hån ma} vµo.",
        "T¹i h¹ ®Õn ®©y v× chuyÖn oan hån. (KÓ cho V« Danh t¨ng nghe chuyÖn x¶y ra ë Giang T©n Th«n)",
        "§¸m Oan Hån kia ®· chÕt nh­ng kh«ng thÓ gi¶i tho¸t! ThÝ chñ cã thÓ giao Táa Yªu Chung cho BÇn T¨ng. Ta sÏ cã c¸ch gióp chóng siªu tho¸t. <sex> h·y ®Õn Giang T©n Th«n t×m {Di vËt} ®Ó gi¶i tho¸t cho Oan Hån",
        "Di vËt nµo?",
        "{BÊt cø thø g×} ë Giang T©n Th«n.",
        "Ta thÊy Giang T©n Th«n cã mét loµi hoa mµu ®á rÊt ®Ñp tªn {Väng Giang Hång}, ®Ó ta h¸i 5 ®ãa vÒ.",
        "A Di §µ PhËt!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    SetTask(TASK_JJC, 11);
    DelItem(2,0,84,1);
    DelItem(2,0,85,25);
    DelItem(2,0,86,15);
    CreateTrigger(0, 549, KILL_JJC_WJH);
    Msg2Player("§Õn Giang T©n Th«n t×m 5 ®ãa Väng Giang Hång");
    TaskTip("§Õn Giang T©n Th«n t×m 5 ®ãa Väng Giang Hång");
    GivePlayerAward("Level_28", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"shaonianwangshi1")		--ÉÙÄêÍùÊÂ1
end;

function task_11_00()
    local szTalk = {
        "<sex> cã ®em ®­îc di vËt ë Giang T©n Th«n vÒ kh«ng?",
        "{Väng Giang Hång} ®©y!",
        "Ta sÏ ®em Táa Yªu Chung vµ Väng Giang Hång ®Æt d­íi th¸p, c¸c ®Ö tö sÏ niÖm kinh siªu tho¸t oan hån, kho¶ng 1 giê sau th× ®­îc. HiÖn bÇn t¨ng cã chuyÖn kh«ng râ muèn thØnh gi¸o s­ phô!",
        "Xin ®¹i s­ cø hái.",
        "BÇn t¨ng nghe nãi Táa Yªu Chung bÞ mÊt tÝch trong cuéc chiÕn ch¸nh tµ, kh«ng biÕt thÝ chñ lÊy tõ ®©u?"
    };
    local szMsg = {
        "<sex> cã ®em ®­îc di vËt ë Giang T©n Th«n vÒ kh«ng?",
        "§Ó ta ®Õn {Giang T©n Th«n}."
    };
    if GetItemCount(2,0,87) >= 5 then
        TalkEx("task_11_01", szTalk);
    else
        TalkEx("task_11_02", szMsg);
    end;
end;

function task_11_02()
    if GetTrigger(KILL_JJC_WJH) == 0 then
        CreateTrigger(0, 549, KILL_JJC_WJH);
    end;
end;

function task_11_01()
    local szTalk = {
        "Cã ®­îc chu«ng lµ nhê sù gióp ®ì cña {TrÇn Phi D­¬ng}, ®µ chñ §ång TÕ ®­êng cña C¸i Bang.",
        "Ch¶ tr¸ch mÊy h«m tr­íc l·o n¹p thÊy Phi D­¬ng ®Õn th¨m viÕng Ph­¬ng Tr­îng.",
        "Nghe ®¹i s­ nãi vËy, kh«ng lÏ TrÇn ®¹i ca lµ ng­êi cña ThiÕu L©m?",
        "Phi D­¬ng tõ nhá ®· mÊt song th©n, ®­îc HuyÒn Tõ ®¹i s­ mang vÒ ThiÕu L©m nu«i d­ìng, vÒ sau l¹i ®­îc Long T¹i Thiªn bang chñ cña C¸i Bang thu lµm ®Ö tö, truyÒn d¹y vâ c«ng.",
        "Ta thÊy TrÇn ®¹i ca ®ang phiÒn muén.",
        "Thêi gian kh«ng cßn nhiÒu, thÝ chñ ë ®©y ®îi ta mang chu«ng vÒ."
    };
    TalkEx("task_11_02", szTalk);
end;

function task_11_02()
    SetTask(TASK_JJC, 12);
    DelItem(2,0,87,5);
    GivePlayerAward("Level_28", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"shaonianwangshi2")		--ÉÙÄêÍùÊÂ2
end;

function task_12_00()
    local szTalk = {
        "Oan hån bªn trong ®· ®­îc siªu tho¸t, qu¶ thËt c«ng ®øc v« l­îng.",
        "ViÖc siªu ®é oan hån ®¹i s­ cã c¸ch nµo hay h¬n kh«ng?",
        "Thµnh §« x¶y ra biÕn cè lín nh­ vËy ThiÕu L©m kh«ng thÓ ®øng nh×n. ThÝ chñ yªn t©m, l·o n¹p sÏ nãi l¹i víi Ph­¬ng Tr­îng l­u ý chuyÖn nµy!",
        "PhiÒn ®¹i s­!",
        "A Di §µ PhËt!"
    };
    TalkEx("task_12_01", szTalk);
end;

function task_12_01()
    SetTask(TASK_JJC, 13);
    Msg2Player("Quay vÒ gÆp Gia C¸t Kú");
    TaskTip("Quay vÒ gÆp Gia C¸t Kú");
    GivePlayerAward("Level_28", "hard");
	GivePlayerExp(SkeyCDFanzhongyan,"shaonianwangshi3")		--ÉÙÄêÍùÊÂ3
end;

function task_13_00()
    local szTalk = {
        "<sex> nghÜ Oan hån ®· ®­îc siªu tho¸t ch­a?",
        "§¹i hiÖp yªn t©m, nh÷ng oan hån ®ã ®· ®­îc cao t¨ng siªu tho¸t h¬n n÷a ThiÕu L©m ®ang cho ng­êi ®Õn gióp trõ yªu.",
        "Ta ph¸t hiÖn trong hµnh lý cña TrÇn Phi D­¬ng cßn bøc th­ ®­îc viÕt b»ng lo¹i mùc ®Æc biÖt.",
        "VËy sao ®äc?",
        "Giang T©n Th«n cã rÊt nhiÒu qu¹ ®en, chØ cÇn ®em l«ng cña chóng vÒ ta sÏ cã c¸ch."
    };
    TalkEx("task_13_01", szTalk);
end;

function task_13_01()
    SetTask(TASK_JJC, 14);
    CreateTrigger(0,550,KILL_JJC_HY);
    Msg2Player("§¸nh Qu¹ ®en ë Giang T©n Th«n lÊy  4 sîi l«ng vò");
    TaskTip("§¸nh Qu¹ ®en ë Giang T©n Th«n lÊy  4 sîi l«ng vò");
    GivePlayerAward("Level_28", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"mixinyiyun1")		--ÃÜÐÅÒÉÔÆ1
end;

function task_14_00()
    local szTalk = {
        "§em l«ng vò ®èt thµnh tro r¶i lªn bøc th­ ch÷ sÏ hiÖn ra. <sex> cã t×m ®­îc kh«ng?",
        "Cã ®©y!",
        "Cã lÏ chuyÖn nµy TrÇn ®¹i ca quªn cÆn dÆn, ta ph¶i ®Õn {¤ M«ng bé} ®©y!",
        "¤ M«ng bé lµ ®Þa bµn cña ng­êi Miªu, nghe nãi chóng thuéc gi¸o ®å Xi Háa gi¸o. <sex> nhí thËn träng!"
    };
    local szMsg = {
        "§em l«ng vò ®èt thµnh tro r¶i lªn bøc th­ ch÷ sÏ hiÖn ra. <sex> cã t×m ®­îc kh«ng?",
        "Ch­a t×m ®­îc qu¹ ®en."
    };
    if GetItemCount(2,0,88) >= 4 then
        TalkEx("task_14_01", szTalk);
    else
        TalkEx("task_14_02", szMsg);
    end;
end;

function task_14_02()
    if GetTrigger(KILL_JJC_HY) == 0 then
        CreateTrigger(0,550,KILL_JJC_HY);
    end;
end;

function task_14_01()
    SetTask(TASK_JJC, 15);
    RemoveTrigger(GetTrigger(KILL_JJC_HY));
    DelItem(2,0,88,4);
    CreateTrigger(0,551,KILL_JJC_SN);
    Msg2Player("§Õn ¤ M«ng bé ®o¹t vËt phÈm");
    TaskTip("§Õn ¤ M«ng bé ®o¹t vËt phÈm");
    GivePlayerAward("Level_28", "hard", "legs", "Level_32");
	GivePlayerExp(SkeyCDFanzhongyan,"mixinyiyun2")		--ÃÜÐÅÒÉÔÆ2
end;

function task_15_00()
    local szTalk = {
        "TrÇn Phi D­¬ng ®Ò cËp trong th­ vÒ mãn ®å quý r¬i vµo tay ¤ M«ng bé. <sex> mau gióp ®o¹t vÒ!"
    };
    TalkEx("task_15_01", szTalk);
end;

function task_15_01()
    if GetTask(TASK_JJC) == 15 then
        if GetTrigger(KILL_JJC_SN) == 0 then
            CreateTrigger(0,551,KILL_JJC_SN);
        end;
    elseif GetTask(TASK_JJC) == 16 then
        if GetTrigger(KILL_JJC_SN) == 0 then
            CreateTrigger(0,551,KILL_JJC_SN);
        end;
        if GetTrigger(KILL_JJC_ZR) == 0 then
            CreateTrigger(0,552,KILL_JJC_ZR);
        end;
        if GetTrigger(KILL_JJC_YS) == 0 then
            CreateTrigger(0,553,KILL_JJC_YS);
        end;
    end;
end;

function task_17_00()
    local szTalk = {
        "Cã mét tªn h¶o h¸n ®ang ®Õn, ng­¬i mau xuèng nói xem h¾n lµ ai.",
        "NÕu kh«ng ®­îc míi<sex> ta còng kh«ng ®Õn.",
        "KhÈu khÝ kh¸ l¾m! Muèn thö søc th× qua bªn kia ®Êu víi V¹n Lý Kim Cang Tèng V¹n, Th«i MÖnh Ph¸n Quan Lý LËp, MÉu §¹i Trïng Cè §¹i TÈu, nÕu th¾ng ®­îc hä ta sÏ cho ng­¬i ë l¹i.",
        "§­îc ®Ó ta cho hä thÊy lîi h¹i thÕ nµo."
    };
    TalkEx("task_17_01", szTalk);
end;

function task_17_01()
    SetTask(TASK_JJC, 18);
    SetTask(TASK_JJC_BEAT_SW, 0);
    SetTask(TASK_JJC_BEAT_LL, 0);
    SetTask(TASK_JJC_BEAT_G, 0);
    Msg2Player("§¸nh b¹i V¹n Lý Kim Cang Tèng V¹n, Th«i MÖnh Ph¸n Quan Lý LËp vµ MÉu §¹i Trïng Cè §¹i TÈu");
    TaskTip("§¸nh b¹i V¹n Lý Kim Cang Tèng V¹n, Th«i MÖnh Ph¸n Quan Lý LËp vµ MÉu §¹i Trïng Cè §¹i TÈu");
    GivePlayerAward("Level_34", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"liangshanhaohan1")		--ÁºÉ½ºÃºº1
end;

function task_18_00()
    local szTalk = {
        "Th¾ng kh«ng næi hä th× ®õng x­ng hiÖp kh¸ch víi ta…Haha!",
        "Ch­a ®¸nh xong mµ!"
    };
    if GetTask(TASK_JJC_BEAT_SW) == 2 and GetTask(TASK_JJC_BEAT_LL) == 2 and GetTask(TASK_JJC_BEAT_G) == 2 then
    	task_19_00();
    else
    	TalkEx("", szTalk);
    end;
end;

function task_19_00()
    local szTalk = {
        "Th¾ng kh«ng næi hä th× ®õng x­ng hiÖp kh¸ch víi ta…Haha!",
        "Ta ®· ®¸nh b¹i 3 ng­êi ®ã.",
        "<sex> tuæi trÎ tµi cao. Ta ®· nh×n lÇm ng­êi!",
        "NÕu kh«ng cã {th­ mêi} ta còng kh«ng lªn L­¬ng S¬n ®©u!",
        "Th­ g×?",
        "Th­ göi cho Tr­êng Ca M«n?",
        "(Kinh ng¹c) Sao nã l¹i ë ®©y! Kh«ng lÏ…Ng­êi ®©u b¾t tªn trém th­ cho ta!"
    };
    TalkEx("task_19_01", szTalk);
end;

function task_19_01()
    local szTalk = {
        "§õng nãng, bøc th­ nµy ta ®o¹t tõ tay ng­êi Miªu. Mµ sao tiÒn bèi hái vÒ th©n thÕ cña {TrÇn ®¹i ca}?",
        "<sex> ch¾c còng cã nghe qua chuyÕn hµng Hoa C­¬ng th¹ch bªn trong chøa m¶nh S¬n Hµ X· T¾c. Tin nµy do TrÇn Phi D­¬ng nãi víi ta. GÇn ®©y ta l¹i nhËn ®­îc tin ®¸m ng­êi T©y H¹ NhÊt PhÈm ®­êng muèn nhóng tay vµo vô nµy. Ta nghi cã ng­êi tiÕt lé, ng­êi ta nghi ngê lµ TrÇn Phi D­¬ng, h¾n vèn dÜ kh«ng ph¶i ng­êi H¸n.",
        "Ta kh«ng tin TrÇn ®¹i ca tiÕt lé cho ng­êi NhÊt PhÈm ®­êng!"
    };
    TalkEx("task_19_02", szTalk);
end;

function task_19_02()
    local szTalk = {
        "M¶nh S¬n Hµ X· T¾c liªn quan ®Õn giang s¬n §¹i Tèng, TrÇn Phi D­¬ng tõ nhá ®­îc ThiÕu L©m nu«i d­ìng. <sex> thö ®Õn ®ã hái xem, ta còng hy väng TrÇn Phi D­¬ng trong s¹ch.",
        "Ta ®i ngay, bøc th­ cña tiÒn bèi ®©y!"
    };
    TalkEx("task_19_03", szTalk);
end;

function task_19_03()
    SetTask(TASK_JJC, 20);
    DelItem(2,0,89,1);
    DelItem(2,0,90,1);
    DelItem(2,0,91,1);
    DelItem(2,0,92,1);
    DelItem(2,0,93,1);
    Msg2Player("Tèng Giang nghi TrÇn Phi D­¬ng tiÕt lé, ®Õn ThiÕu L©m lµm râ ch©n t­íng sù viÖc");
    TaskTip("Tèng Giang nghi TrÇn Phi D­¬ng tiÕt lé, ®Õn ThiÕu L©m lµm râ ch©n t­íng sù viÖc");
    GivePlayerAward("Level_34", "hell", "chest", "Level_35");
	GivePlayerExp(SkeyCDFanzhongyan,"liangshanhaohan2")		--ÁºÉ½ºÃºº2
end;

function task_20_00()
    local szTalk = {
        "Tham kiÕn ®¹i s­!",
        "Kh«ng cÇn ®a lÔ, thÝ chñ t×m l·o n¹p cã chuyÖn g×?",
        "T¹i h¹ cã chót giao t×nh víi TrÇn ®¹i ca, nghe nãi ng­êi nµy tõ nhá ®· ë trong ThiÕu L©m, ch¾c ®¹i s­ hiÓu râ tÝnh c¸ch (kÓ l¹i c©u chuyÖn Tèng Giang nghi ngê), mong ®¹i s­ gi¶i thÝch dïm.",
        "ThÝ chñ thÊy chuyÖn nµy thÕ nµo? L·o n¹p chØ cã thÓ cung cÊp cho <sex> mét manh mèi, Phi D­¬ng tõ nhá sèng t¹i ThiÕu L©m nh­ng c­¬ng quyÕt kh«ng chÞu xuÊt gia, ®Õn n¨m 17 tuæi trong tù cã mét ng­êi thî chuyªn tu söa ®ång nh©n ë {mËt thÊt}, tõ ®ã Phi D­¬ng th­êng lui tíi, kh«ng l©u sau b¸i Long T¹i Thiªn lµm s­ phô, gia nhËp C¸i Bang.",
        "§a t¹ ®¹i s­!",
        "A Di §µ PhËt!"
    };
    TalkEx("task_20_01", szTalk);
end;

function task_20_01()
    SetTask(TASK_JJC, 21);
    CreateTrigger(0,557,KILL_JJC_TR);
    Msg2Player("§Õn mËt thÊt ThiÕu L©m ®¸nh b¹i ®ång nh©n t×m ra manh mèi");
    TaskTip("§Õn mËt thÊt ThiÕu L©m ®¸nh b¹i ®ång nh©n t×m ra manh mèi");
    GivePlayerAward("Level_36", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"tongrendemimi1")		--Í­ÈËµÄÃØÃÜ1
end;

function task_21_00()
    local szTalk = {
        "T¹i h¹ ph¸t hiÖn {§ång nh©n} gi÷ nhiÒu {M¶nh ®ång}, trªn ®ã cã {kh¾c ch÷} kh«ng biÕt lµ g×?",
        "§©y kh«ng ph¶i kinh v¨n, l·o n¹p còng kh«ng hiÓu. <sex> thö t×m Gia C¸t Kú xem cã gi¶i thÝch ®­îc kh«ng?"
    };
    local szMsg = {
        "L·o n¹p chØ cã thÓ cung cÊp cho <sex> mét manh mèi. Phi D­¬ng tõ nhá sèng t¹i ThiÕu L©m nh­ng c­¬ng quyÕt kh«ng chÞu xuÊt gia, ®Õn n¨m 17 tuæi trong tù cã mét ng­êi thî chuyªn tu söa ®ång nh©n ë {mËt thÊt}, tõ ®ã Phi D­¬ng th­êng lui tíi."
    };
    if GetItemCount(2,0,94) >= 8 then
        TalkEx("task_21_01", szTalk);
    else
        TalkEx("task_21_02", szMsg);
    end;
end;

function task_21_02()
    if GetTask(KILL_JJC_TR) == 0 then
        CreateTrigger(0,557,KILL_JJC_TR);
    end;
end;

function task_21_01()
    SetTask(TASK_JJC, 22);
    Msg2Player("VÒ Giang T©n Th«n t×m Gia C¸t Kú");
    TaskTip("VÒ Giang T©n Th«n t×m Gia C¸t Kú");
    GivePlayerAward("Level_36", "hard", "head", "Level_38");
	GivePlayerExp(SkeyCDFanzhongyan,"tongrendemimi2")		--Í­ÈËµÄÃØÃÜ2
end;

function task_22_00()
    local szTalk = {
        "ChuyÕn ®i ¤ M«ng bé cña <sex>cã thu thËp ®­îc tin tøc g× kh«ng?",
        "(ThuËt l¹i c©u chuyÖn). §©y lµ {M¶nh ®ång}, nhê tiÒn bèi xem gióp bªn trªn ghi g×?",
        "Ta ph¶i tèn chót thêi gian cho mÊy dßng ch÷ nµy, sî <sex> ®îi l©u th«i! §©y cã 10 l­îng, gióp ta mua 2 ®Üa m¨ng xµo, 4 c¸i b¸nh ng« vÒ ®©y!",
        "VËy kh«ng lµm phiÒn, tiÒn bèi cø nghiªn cøu."
    };
    TalkEx("task_22_01", szTalk);
end;

function task_22_01()
    Earn(1000);
    SetTask(TASK_JJC, 23);
    DelItem(2,0,94,8);
    Msg2Player("Mua 2 ®Üa m¨ng chay, 4 b¸nh ng« cho Gia C¸t Kú");
    TaskTip("Mua 2 ®Üa m¨ng chay, 4 b¸nh ng« cho Gia C¸t Kú");
    GivePlayerAward("Level_38", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"shizhengshixie1")		--ÊÇÕýÊÇÐ°1
end;

function task_23_00()
    local szTalk = {
        "TuyÖt diÖu! Kh«ng ngê ng­êi T©y H¹ thiÕt kÕ ®­îc mËt m· nµy.",
        "Thø tiÒn bèi cÇn ®©y!",
        "<sex> vÒ ®óng lóc l¾m, ta ®· t×m ra bÝ mËt bªn trong, ®©y lµ mËt m· giao tiÕp ®­îc viÕt b»ng thÓ ch÷ lÖ cña ng­êi T©y H¹.",
        "Kh«ng lÏ TrÇn ®¹i ca lµ {gian tÕ}!",
        "Ta còng kh«ng râ! B»ng h÷u thö ®Õn gÆp TrÇn Phi D­¬ng. ChuyÕn ®i lÇn nµy nªn hÕt søc thËn träng!"
    };
    local szMsg = {
        "TuyÖt diÖu! Kh«ng ngê ng­êi T©y H¹ thiÕt kÕ ®­îc mËt m· nµy.",
        "TiÒn bèi tõ tõ nghiªn cøu."
    };
    if GetItemCount(1,1,1) >= 4 and GetItemCount(1,1,6) >= 2 then
        TalkEx("task_23_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_23_01()
    local szTalk = {
        "Xin tiÒn bèi chØ gi¸o!",
        "HiÖn giê vÉn ch­a kh¼ng ®Þnh ®­îc TrÇn Phi D­¬ng thuéc phe ch¸nh hay tµ. TÊt c¶ ®Òu lµ gi¶ thiÕt, kh«ng chøng cø. PhiÒn <sex> l¹i ®Õn ®ã mét chuyÕn xem sao!",
        "T¹i h¹ ®i ngay!",
        "TrÇn Phi D­¬ng thµnh danh ®· l©u, vâ c«ng cao c­êng. <sex> kh«ng nªn khiªu chiÕn víi h¾n.",
        "§a t¹ tiÒn bèi nh¾c nhë!",
    };
    TalkEx("task_23_02", szTalk);
end;

function task_23_02()
    DelItem(1,1,1,4);
    DelItem(1,1,6,2);
    SetTask(TASK_JJC, 24);
    Msg2Player("§i KiÕm C¸t Thôc ®¹o t×m TrÇn Phi D­¬ng");
    TaskTip("§i KiÕm C¸t Thôc ®¹o t×m TrÇn Phi D­¬ng");
    GivePlayerAward("Level_38", "hard", "legs", "Level_40");
	GivePlayerExp(SkeyCDFanzhongyan,"shizhengshixie2")		--ÊÇÕýÊÇÐ°2
end;

function task_24_00()
    local szTalk = {
        "<sex> cã chuyÖn g× mµ gÊp vËy. §ang ®Þnh ®Õn L­¬ng S¬n hái th¨m mét sè tin tøc th× ng­¬i ®Õn.",
        "Ta ®o¸n ng­¬i sÏ kh«ng ®Õn ®ã!",
        "<sex> sao l¹i nãi vËy?",
        "Ng­¬i lµ {néi øng cña T©y H¹ ë Trung Nguyªn}, ®o¹t ®­îc 1 quyÓn S¬n Hµ X· T¾c chÝnh lµ ®· {tiÕt lé} cho T©y H¹ NhÊt PhÈm §­êng!",
        "<sex> cã chøng cø g× kh«ng?",
        "Kh«ng nh÷ng ta ®iÒu tra ®­îc qu¸ khø mµ cßn t×m thÊy chøng cø ng­¬i cÊu kÕt víi {T©y H¹}. Mau theo ta vÒ chÞu téi.",
        "NÕu ng­¬i ®· biÕt råi th× ®õng mong rêi khái ®©y. §ao TuyÖt, KiÕm Cuång mau b¾t h¾n l¹i!"
    };
    TalkEx("task_24_01", szTalk);
end;

function task_24_01()
    CreateTrigger(0,558,KILL_JJC_JK);
    CreateTrigger(0,559,KILL_JJC_DJ);
    SetTask(TASK_JJC, 25);
    Msg2Player("§¸nh b¹i 10 tªn §ao TuyÖt, 8 tªn KiÕm Cuång");
    TaskTip("§¸nh b¹i 10 tªn §ao TuyÖt, 8 tªn KiÕm Cuång");
    GivePlayerAward("Level_40", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"zhenshishenfen1")		--ÕæÊµÉí·Ý1
end;

function task_25_00()
    local szMsg = {
        "§ao TuyÖt, KiÕm Cuång b¾t lÊy h¾n!"
    };
    TalkEx("task_25_01", szMsg);
end;

function task_25_01()
    if GetTask(TASK_JJC_JK) == 0 and GetTrigger(KILL_JJC_JK) == 0 then
        CreateTrigger(0,558,KILL_JJC_JK);
    end;
    if GetTask(TASK_JJC_DJ) == 0 and GetTrigger(KILL_JJC_DJ) == 0 then
        CreateTrigger(0,559,KILL_JJC_DJ);
    end;
end;

function task_27_00()
    local szTalk = {
        "MÊy ngµy kh«ng gÆp mµ vâ c«ng <sex> tiÕn bé h¼n, ngay c¶ cao thñ cña T©y H¹ còng bÞ ®¸nh b¹i. Xem ra cuéc chiÕn gi÷a ta vµ ng­¬i kh«ng thÓ tr¸nh khái.",
        "Kú thùc ta còng kh«ng muèn nh­ vËy.",
        "§õng nhiÒu lêi, ra tay ®i!"
    };
    TalkEx("task_27_01", szTalk);
    SetTask(TASK_JJC_TEMP, GetTargetNpc());
end;

function task_27_01()
    
    ChangeNpcToFight(GetTask(TASK_JJC_TEMP));

--    SetTask(TASK_JJC, 28);
--    --log´¥·¢Æ÷
--    CreateTrigger(3, 205, LEAVE_GAME_JJC);
--    SetLogType(GetTrigger(LEAVE_GAME_JJC), 1); --ÉèÖÃÎªµÅ³öÀàÐÍ
--    
--    --rect ´¥·¢Æ÷
--    CreateTrigger(2,1302,LEAVE_RECT_JJC);
--    
--    SetDeathScript("\\script\\task\\world\\lizhi_½­½ò´å\\task_Death.lua");
    Msg2Player("§¸nh b¹i TrÇn Phi D­¬ng");
    TaskTip("§¸nh b¹i TrÇn Phi D­¬ng");
end;

function task_29_00()
    local szTalk = {
        "Ta chØ thö th«i, kh«ng ngê ng­¬i chÝnh lµ gian tÕ cña T©y H¹.",
        "Gian tÕ th× sao? Ta ®©u ph¶i ng­êi H¸n, cã lÏ chÕt lµ c¸ch hay nhÊt!",
        "…",
        "Ta kh«ng sèng ®­îc bao l©u, ë ®©y cã 2 bøc th­ viÕt cho bang chñ C¸i Bang vµ Ph­¬ng Tr­îng ThiÕu L©m, hy väng <sex> gióp ta ®­a cho hä nãi r»ng Phi D­¬ng cã lçi víi hai vÞ.",
        "Ta sÏ trao tËn tay cho hä.",
        "VËy ta yªn t©m råi!",
        "…"
    };
    TalkEx("task_29_01", szTalk);
    SetTask(TASK_JJC, 30);
    AddItem(2,0,95,1);  --¸øÉÙÁÖµÄÐÅ
    AddItem(2,0,96,1);  --¸øØ¤°ïµÄÐÅ
end;

function task_29_01()
    Msg2Player("§em di th­ TrÇn Phi D­¬ng göi cho ThiÕu L©m");
    TaskTip("§em di th­ TrÇn Phi D­¬ng göi cho ThiÕu L©m");
    GivePlayerAward("Level_40", "hell", "weapon", "Level_40");
	GivePlayerExp(SkeyCDFanzhongyan,"zhenshishenfen2")		--ÕæÊµÉí·Ý2
end;

function task_30_00()
    local szTalk = {
        "ë ®©y cã {bøc th­} göi cho ®¹i s­, tr­íc khi l©m chung TrÇn Phi D­¬ng muèn nãi lêi {xin lçi}.",
        "Phi D­¬ng vÉn lµ……! §a t¹ ®· <sex> chuyÓn lêi.",
        "Ph­¬ng Tr­îng ®õng nh¾c n÷a, ban ®Çu t¹i h¹ t­ëng TrÇn Phi D­¬ng lµ trang nam tö, kh«ng ngê……"
    };
    TalkEx("task_30_01", szTalk);
end;

function task_30_01()
    local szTalk = {
        "ThÝ chñ ®· tr¸ch nhÇm TrÇn Phi D­¬ng, mÊy ngµy tr­íc h¾n cã ®Õn ®©y t×m l·o n¹p t©m sù, t©m tr¹ng h¾n rèi bêi mét bªn lµ vâ l©m Trung Nguyªn, mét bªn tæ quèc. Ta cã gi¶i thÝch nh­ng cuèi cïng vÉn chän kÕt liÔu ®êi m×nh. H¾n xem <sex> lµ mét ng­êi b¹n thËt sù.",
        "(Suy nghÜ)...t¹i h¹ cßn bøc th­ ph¶i göi cho {C¸i Bang}, xin c¸o tõ!",
        "A Di §µ PhËt! §i ®­êng b¶o träng!"
    };
    TalkEx("task_30_02", szTalk);
end;

function task_30_02()
    SetTask(TASK_JJC, 31);
    DelItem(2,0,95,1);
    Msg2Player("§em di th­ TrÇn Phi D­¬ng göi cho C¸i Bang");
    TaskTip("§em di th­ TrÇn Phi D­¬ng göi cho C¸i Bang");
    GivePlayerAward("Level_40", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"qingfengfeiyang1")		--Çå·ç·ÉÑï1
end;

function task_31_00()
    local szTalk = {
        "TrÇn Phi D­¬ng nhê t¹i h¹ mang {bøc th­} göi cho Long l·o tiÒn bèi!",
        "TrÇn huynh ®Ö sao sao råi? <sex> Sao ng­¬i l¹i cã bøc th­ nµy?",
        "TrÇn Phi D­¬ng lóc l©m chung nhê t¹i h¹ göi cho C¸i Bang. Tr­íc khi chÕt anh ta cãn muèn nãi lêi xin lçi ®Õn {Long l·o bang chñ}.",
        "TrÇn huynh ®Ö nµy thËt lµ hå ®å, l·o ®©y tuy giµ nh­ng vÉn cßn muèn sèng, hµ tÊt g× ph¶i t×m ®Õn c¸i chÕt?"
    };
    TalkEx("task_31_01", szTalk);
end;

function task_31_01()
    local szTalk = {
        "Nghe Long l·o tiÒn bèi nãi, kh«ng lÏ TrÇn Phi D­¬ng muèn tù hñy ho¹i danh tiÕng m×nh?",
        "<sex> t­ chÊt h¬n ng­êi, vâ c«ng phi phµm nh­ng vÉn kh«ng ph¶i ®èi thñ cña TrÇn huynh ®Ö, nÕu kh«ng ph¶i h¾n nh­êng <sex> kh«ng tµi nµo ®¶ th­¬ng ®­îc.",
        "……Nghe Ph­¬ng Tr­îng ThiÕu L©m vµ tiÒn bèi nãi, xem ra bªn trong nhiÒu uÈn khóc, t¹i h¹ ch­a nhËn ra vÊn ®Ò ®·……"
    };
    TalkEx("task_31_02", szTalk);
end;

function task_31_02()
    local szTalk = {
        "<sex> còng kh«ng nªn tù tr¸ch m×nh, l·o ®©y c¶m ¬n <sex>ng­¬i ®· gióp cho huynh Êy to¹i nguyÖn. Trong th­ TrÇn huynh ®Ö cã nh¾c ®Õn kÕ ho¹ch c­íp m¶nh S¬n Hµ X· T¾c. <sex> mau vÒ nãi víi Ph¹m tiªn sinh ®Ò phßng.",
        "VËy còng tèt! Sau nµy cã chuyÖn g× bµo cho v·n bèi ®©y biÕt víi.",
        "§­îc! NÕu cã tin tøc g× ta sÏ cho ng­êi th«ng bao ngay<sex>."
    };
    TalkEx("task_31_03", szTalk);
end;

function task_31_03()
    SetTask(TASK_JJC, 32);
    DelItem(2,0,96,1);
    GivePlayerAward("Level_40", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"qingfengfeiyang2")		--Çå·ç·ÉÑï2
end;

function task_32_00()
    local szTalk = {
        "Giã tho¶ng m©y bay. §Ñp qu¸! §Ñp qu¸!",
        "TrÇn ®¹i ca! May qu¸ huynh Êy cßn sèng!",
        "ThÝ chñ nh×n lÇm ng­êi ch¨ng? BÇn t¨ng lµ V©n Du t¨ng nh©n, ph¸p hiÖu Thanh Phong",
        "Xin lçi ®¹i s­!"
    };
    TalkEx("", szTalk);
end;

function task_32_zgq()
    local szTalk = {
        "<sex> h·y ra giang hå rÌn luyÖn thªm ®i!"
    }
    TalkEx("task_32_01", szTalk);
end;

function task_32_01()
    SetTask(TASK_JJC, 33);
    GivePlayerAward("Level_40", "hard", "legs", "Level_49");
	GivePlayerExp(SkeyCDFanzhongyan,"qingfengfeiyang3")		--Çå·ç·ÉÑï3
end;

function task_33_00()
    local szTalk = {
        "<sex> h·y ra giang hå rÌn luyÖn thªm ®i!"
    }
    TalkEx("", szTalk);
end;