
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 泉洲 10 级任务主体脚本
-- Edited by peres
-- 2005/07/19 PM 19:29

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================

-- 剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "H祅g h鉧 ta m蕋 h誸 r錳, sao v� Dng Ch﹗ y!"
    };
    TalkEx("", szTalk);
end;

function task_000_00()

local strMain = {
	"Ta v鑞 ngi Dng Ch﹗, g莕 y nh藀 m閠 chuy課 {h祅g b籲g ng鋍} mu鑞 chuy觧 n Tuy襫 Ch﹗. Kh玭g ng� b� m {L璾 manh} cp m蕋. Ngi gi髉 ta t譵 20 m鉵 Ng鋍 kh� 頲 kh玭g?",
	"Ti誴 nh薾 nhi謒 v�/task_000_01",
	"R阨 kh醝/Task_Exit"
}

SelectSay(strMain);

end;

function task_000_01()
	Msg2Player("Gi髉 Vng Nghi謕 V� t譵 l筰 20 Ng鋍 kh�");
	TaskTip("Gi髉 Vng Nghi謕 V� t譵 l筰 20 Ng鋍 kh�");
	CreateTrigger(0, 189, 80);
	SetTask(TASK_LEV_10_ID, 1);
end;


function task_001_00()

local strMain = {
	"B籲g h鱱 n y c� chuy謓 g�?",
	"D飊g Ng鋍 kh� i th� lao/task_001_01",
	"K誸 th骳 i tho筰/task_001_03"
}

SelectSay(strMain);

end;

function task_001_01()

    local strMain = {
    	"ng l� h祅g h鉧 c馻 ta nh璶g ch璦 , th玦 th� lao c馻 ngi y!",
    	"Th鵦 ra s� s竎h c馻 ta c騨g b� cp 甶, nghe n鉯 u m鬰 c馻 b鋘 l璾 manh l� {Di猽 L藀 Th祅h} hi謓 產ng tr鑞 � B綾 Tuy襫 Ch﹗. Xin gi髉 ta l蕐 l筰."
    };
    local szNotHaveEnough = 
    {
        "Ngi ch璦 t譵  20 m鉵  {b籲g ng鋍}, i t譵  m韎 nh薾 th� lao."
    };

    local szMsg = "C� v藅 ph萴";
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

-- 完成任务，发奖，并让玩家去找姚立诚
function task_001_02()
    DelItem(2, 1, 154, 20);
	SetTask(TASK_LEV_10_ID, 2);
	GivePlayerAward("Level_10", "easy");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"yuqishanghuo1")		--玉器商货1
	RemoveTrigger(GetTrigger(80));
	
	Msg2Player("Цnh Di猽 L藀 Th祅h (198.188) l蕐 l筰 s� s竎h");
	TaskTip("Цnh Di猽 L藀 Th祅h (198.188) l蕐 l筰 s� s竎h");
	
end;

--接到杀姚立诚任务，但是没有杀的时候和NPC对话
function task_002_00()

    local szMain = 
    {
        "Nghe n鉯 {Di猽 L藀 Th祅h} � {B綾 Tuy襫 Ch﹗} (198.188), ngi mau n  gi髉 ta 畂箃 s� s竎h v�!"
    }
    TalkEx("", szMain);
end;

function task_003_00()
    
    local strMain = {
    	"C� l蕐 頲 s� s竎h kh玭g?",
    	"Di猽 L藀 Th祅h cp h祅g h鉧 v� s� s竎h c馻 玭g  l祄 g�?",
    	"Ngi th� h醝 {H� Ki謙} xem! Ta th蕐 h緉 thng qua l筰 v韎 b鋘 C玭 ."
    }
    
    TalkEx("task_003_01", strMain);

end;

-- 完成任务，发奖
function task_003_01()

	SetTask(TASK_LEV_10_ID, 4);
	SetTask(TASK_LEV_12_ID, 100);   --开启泉州任务夏杰部分
	DelItem(2, 0, 32, 1);
	GivePlayerAward("Level_10", "hard", "weapon", "Level_10");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"yuqishanghuo2")		--玉器商货2
	Msg2Player("T譵 H� Ki謙 (166.182) ch蕋 v蕁");
	TaskTip("T譵 H� Ki謙 (166.182) ch蕋 v蕁");

end;

function task_004_00()
    
    local strMain = {
        " t� <sex>  gi髉 !",
        "Kh玭g c� chi."
    }
    TalkEx("",strMain);
end;

function Task_Exit()

end;