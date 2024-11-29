
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÈªÖŞ 10 ¼¶ÈÎÎñÖ÷Ìå½Å±¾
-- Edited by peres
-- 2005/07/19 PM 19:29

-- Ö»ÓĞËûºÍËıÁ½¸öÈË
-- ËûÃÇÏà°®
-- Ëı¼ÇµÃ
-- ËûµÄÊÖ¸§Ä¦ÔÚËıµÄÆ¤·ôÉÏµÄÎÂÇé
-- ËûµÄÇ×ÎÇÏñÄñÈºÔÚÌì¿ÕÂÓ¹ı
-- ËûÔÚËıÉíÌåÀïÃæµÄ±©ìåºÍ·Å×İ
-- ËûÈëË¯Ê±ºòµÄÑù×Ó³äÂú´¿Õæ
-- Ëı¼ÇµÃ£¬Çå³¿ËıĞÑ¹ıÀ´µÄÒ»¿Ì£¬ËûÔÚËıµÄÉí±ß
-- ËıÕö×ÅÑÛ¾¦£¬¿´Êï¹âÍ¸¹ı´°Á±Ò»µãÒ»µãµØÕÕÉä½øÀ´
-- ËıµÄĞÄÀïÒòÎªĞÒ¸£¶øÌÛÍ´

-- ======================================================

-- ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_ÈªÖİ\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "Hµng hãa ta mÊt hÕt råi, sao vÒ D­¬ng Ch©u ®©y!"
    };
    TalkEx("", szTalk);
end;

function task_000_00()

local strMain = {
	"Ta vèn ng­êi D­¬ng Ch©u, gÇn ®©y nhËp mét chuyÕn {hµng b»ng ngäc} muèn chuyÓn ®Õn TuyÒn Ch©u. Kh«ng ngê bŞ ®¸m {L­u manh} c­íp mÊt. Ng­¬i gióp ta t×m 20 mãn Ngäc khİ ®­îc kh«ng?",
	"TiÕp nhËn nhiÖm vô/task_000_01",
	"Rêi khái/Task_Exit"
}

SelectSay(strMain);

end;

function task_000_01()
	Msg2Player("Gióp V­¬ng NghiÖp VÜ t×m l¹i 20 Ngäc khİ");
	TaskTip("Gióp V­¬ng NghiÖp VÜ t×m l¹i 20 Ngäc khİ");
	CreateTrigger(0, 189, 80);
	SetTask(TASK_LEV_10_ID, 1);
end;


function task_001_00()

local strMain = {
	"B»ng h÷u ®Õn ®©y cã chuyÖn g×?",
	"Dïng Ngäc khİ ®æi thï lao/task_001_01",
	"KÕt thóc ®èi tho¹i/task_001_03"
}

SelectSay(strMain);

end;

function task_001_01()

    local strMain = {
    	"§óng lµ hµng hãa cña ta nh­ng ch­a ®ñ, th«i thï lao cña ng­¬i ®©y!",
    	"Thùc ra sæ s¸ch cña ta còng bŞ c­íp ®i, nghe nãi ®Çu môc cña bän l­u manh lµ {Diªu LËp Thµnh} hiÖn ®ang trèn ë B¾c TuyÒn Ch©u. Xin gióp ta lÊy l¹i."
    };
    local szNotHaveEnough = 
    {
        "Ng­¬i ch­a t×m ®ñ 20 mãn ®å {b»ng ngäc}, ®îi t×m ®ñ míi nhËn thï lao."
    };

    local szMsg = "Cã vËt phÈm";
    local nItemCount = GetItemCount(2, 1, 154);
    --Msg2Player(szMsg..nItemCount);
	if nItemCount >= 20 then
		TalkEx("task_001_02", strMain);
	else
		TalkEx("task_001_03", szNotHaveEnough);
	end;
end;

function task_001_03()
    if GetTrigger(80) == 0 then
        CreateTrigger(0, 189, 80);
    end;
end;

-- Íê³ÉÈÎÎñ£¬·¢½±£¬²¢ÈÃÍæ¼ÒÈ¥ÕÒÒ¦Á¢³Ï
function task_001_02()
    DelItem(2, 1, 154, 20);
	SetTask(TASK_LEV_10_ID, 2);
	GivePlayerAward("Level_10", "easy");    --½±Àø
	GivePlayerExp(SkeyQZWangyewei,"yuqishanghuo1")		--ÓñÆ÷ÉÌ»õ1
	RemoveTrigger(GetTrigger(80));
	
	Msg2Player("§¸nh Diªu LËp Thµnh (198.188) lÊy l¹i sæ s¸ch");
	TaskTip("§¸nh Diªu LËp Thµnh (198.188) lÊy l¹i sæ s¸ch");
	
end;

--½Óµ½É±Ò¦Á¢³ÏÈÎÎñ£¬µ«ÊÇÃ»ÓĞÉ±µÄÊ±ºòºÍNPC¶Ô»°
function task_002_00()

    local szMain = 
    {
        "Nghe nãi {Diªu LËp Thµnh} ë {B¾c TuyÒn Ch©u} (198.188), ng­¬i mau ®Õn ®ã gióp ta ®o¹t sæ s¸ch vÒ!"
    }
    TalkEx("", szMain);
end;

function task_003_00()
    
    local strMain = {
    	"Cã lÊy ®­îc sæ s¸ch kh«ng?",
    	"Diªu LËp Thµnh c­íp hµng hãa vµ sæ s¸ch cña «ng ®Ó lµm g×?",
    	"Ng­¬i thö hái {H¹ KiÖt} xem! Ta thÊy h¾n th­êng qua l¹i víi bän C«n ®å."
    }
    
    TalkEx("task_003_01", strMain);

end;

-- Íê³ÉÈÎÎñ£¬·¢½±
function task_003_01()

	SetTask(TASK_LEV_10_ID, 4);
	SetTask(TASK_LEV_12_ID, 100);   --¿ªÆôÈªÖİÈÎÎñÏÄ½Ü²¿·Ö
	DelItem(2, 0, 32, 1);
	GivePlayerAward("Level_10", "hard", "weapon", "Level_10");    --½±Àø
	GivePlayerExp(SkeyQZWangyewei,"yuqishanghuo2")		--ÓñÆ÷ÉÌ»õ2
	Msg2Player("T×m H¹ KiÖt (166.182) chÊt vÊn");
	TaskTip("T×m H¹ KiÖt (166.182) chÊt vÊn");

end;

function task_004_00()
    
    local strMain = {
        "§a t¹ <sex> ®· gióp ®ì!",
        "Kh«ng cã chi."
    }
    TalkEx("",strMain);
end;

function Task_Exit()

end;