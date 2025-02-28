
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 世界收集任务头文件
-- Edited by peres
-- 2005/08/25 PM 20:00

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

-- 表格文件类的支持
Include("\\script\\class\\ktabfile.lua");

tabNpc    = new(KTabFile, "\\settings\\task\\collection\\npc.txt");
tabGoods  = new(KTabFile, "\\settings\\task\\collection\\goods.txt");

COLLTIME_LIMIT = 30;

-- 物品收集模版：{奖励加乘值，等级1，等级2...}
collMode  = {
	
	{3, 1,1},
	
	{3, 1,1,1},
	
	{3.5, 1,1,2},
	
	{3.5, 1,2,2},

	{2.5, 2,2,2},
	
	{2.5, 1,1,3},

	{3, 1,3,4},

	{2.5, 2,2,3},

	{3, 2,3,4},

	{2, 2,3,5},

	{2, 3,4,5},

}


-- 特殊奖励的数组
speAward  = {

	{"Kim Linh th筩h", 2,13,1},
	{"M閏 Linh th筩h", 2,13,2},
	{"Th駓 Linh th筩h", 2,13,3},
	{"H醓 Linh th筩h", 2,13,4},
	{"Th� Linh th筩h", 2,13,5},

}

-- 全局变量ID定义

ID_COLLMODE = 99     -- 所要收集物品的模版

ID_COLLNUM = 100;    -- 所要收集物品类型的数量 

ID_COLL1_IDS = 101;  -- 第 1 个所要收集物品的 ID
ID_COLL1_NUM = 102;  -- 第 1 个所要收集物品的 数量

ID_COLL2_IDS = 103;  -- 第 2 个所要收集物品的 ID
ID_COLL2_NUM = 104;  -- 第 2 个所要收集物品的 数量

ID_COLL3_IDS = 105;  -- 第 3 个所要收集物品的 ID
ID_COLL3_NUM = 106;  -- 第 3 个所要收集物品的 数量

ID_COLL_NPC  = 107;  -- 人物ID

ID_COLL_STATE = 108; -- 世界收集任务的状态， 1 为已经开始，2 为已经关闭

ID_COLL_TIME  = 109; -- 世界收集任务开始时的时间，格式为 年/月/日/时/分

ID_ABS_TIME   = 110; -- 记录了收集任务开始时从 1970 年 1 月 1 日开始以来所经历的秒数

-- 玩家个人变量定义

PLAYER_COLLTIME = 586;  -- 玩家上次做的时间
PLAYER_DONUM    = 587;  -- 玩家累积已经完成的次数

-- 从NPC列表中选择一个 NPC ID
function selectNpc()

local nRow = random(3, tabNpc:getRow());

local nNpcID  = tonumber(tabNpc:getCell(nRow, "NpcID"));

	return nNpcID;

end;


-- 选择一个收集模版，返回收集模版的索引
function selectCollectModel()

	return random(1, getn(collMode));

end;


-- 根据难度等级来选择一个所要收集的物品
-- 返回值：物品 ID、物品的数量
function selectCollectItem(nLevel)

local aryLevel = getLevelArray(nLevel);
local nID      = aryLevel[random(1, getn(aryLevel))];
local nRow     = tabGoods:selectRowNum("GoodsID", nID);

local nNum     = random(tonumber(tabGoods:getCell(nRow, "Num_Min")),
						tonumber(tabGoods:getCell(nRow, "Num_Max"))
						);


	return nID, nNum;

end;


-- 根据传入的物品等级来构造一个数组
function getLevelArray(nLevel)

local aryLevel = {};
local i=0;

	for i=3, tabGoods:getRow() do
--		print ( tonumber(tabGoods:getCell(i, "Level")) );
		if tonumber(tabGoods:getCell(i, "Level"))==nLevel then
			tinsert(aryLevel, tonumber(tabGoods:getCell(i, "GoodsID")));
		end;
	end;
	
	return aryLevel;

end;


-- 开始创建一个收集活动的所有数据
function createCollecEvent()

-- 得到一个 NPC ID
local nNpcID     = selectNpc();

-- 取得一个物品收集的模版
local nModel     = selectCollectModel();

-- 所需要收集物品ID的数量
local nCollNum   = getn(collMode[nModel])-1;

-- 所要收集物品的数组，最大不超过 3 个
local aryColl    = {{0,0},{0,0},{0,0}}

local tempID, tempNum = 0,0;

local i,j=0,0;

	for i=2, getn(collMode[nModel]) do
		j = j + 1;
		tempID,tempNum = selectCollectItem(collMode[nModel][i]);
		aryColl[j][1] = tempID;
		aryColl[j][2] = tempNum;
	end;


	collectDataIncept(nNpcID,
					  nModel, 
					  nCollNum,
					  aryColl[1][1], 
					  aryColl[1][2], 
					  aryColl[2][1], 
					  aryColl[2][2],
					  aryColl[3][1],
					  aryColl[3][2]);

end;


function collectDataIncept(nNpcID, nModel, nCollNum, nItem_1, nNum_1, nItem_2, nNum_2, nItem_3, nNum_3)


-- 得到 NPC 的行数
local nNpcRow    = tabNpc:selectRowNum("NpcID", nNpcID);

-- 得到地图的编号
local nMapID     = tonumber(tabNpc:getCell(nNpcRow, "MapID"));

-- 得到 NPC 的中文名
local strNpcName = tabNpc:getCell(nNpcRow, "NpcName");

-- 得到地图的中文名
local strMapName = tabNpc:getCell(nNpcRow, "NpcMap");

-- 得到第一个物品的行数
local nItemRow = tabGoods:selectRowNum("GoodsID", nItem_1);

-- 得到第一个物品的名字
local strItemName = tabGoods:getCell(nItemRow, "Text");

--	AddGlobalNews("位于"..strMapName.."的"..strNpcName.."特向广大玩家收集");

	--print ("位于"..strMapName.."的"..strNpcName.."特向广大玩家收集"..strItemName.."等物品！");
	
		Msg2SubWorld("Giang h� x玭 xao, "..strMapName.."-"..strNpcName.." mong c竎 hi謕 kh竎h gi髉 thu th藀 c竎 lo筰 "..strItemName..", n誹 ho祅 th祅h trong 30 ph髏 s� 頲 "..strNpcName.." tr鋘g thng!");
		
--	AddGlobalNews("好消息，好消息！位于"..strMapName.."的"..strNpcName.."特向广大玩家收集"..strItemName.."等物品！");

	-- 设置全局变量
	SetGlbValue(ID_COLL_NPC,   nNpcID);
	
	SetGlbValue(ID_COLLMODE,   nModel);
	
	SetGlbValue(ID_COLLNUM,    nCollNum);
	
	SetGlbValue(ID_COLL1_IDS,  nItem_1);
	SetGlbValue(ID_COLL1_NUM,  nNum_1);
	
	SetGlbValue(ID_COLL2_IDS,  nItem_2);
	SetGlbValue(ID_COLL2_NUM,  nNum_2);
	
	SetGlbValue(ID_COLL3_IDS,  nItem_3);
	SetGlbValue(ID_COLL3_NUM,  nNum_3);
	
	-- 记录收集活动的开始时间：年/月/日/时/分
	SetGlbValue(ID_COLL_TIME,  tonumber(date("%y")..date("%m")..date("%d")..date("%H")..date("%M")) );
	
	-- 记录了收集任务开始时从 1970 年 1 月 1 日开始以来所经历的秒数
--	SetGlbValue(ID_ABS_TIME, GetAbsTime());	
	
	-- 标记收集任务已经开始
	SetGlbValue(ID_COLL_STATE, 1);

end;


-- 检测当前的人物是否为指定的收集人物
-- 成功则返回 1，失败返回 0
function checkCollectNpc(nMapID, strName)

local glb_NpcID = GetGlbValue(ID_COLL_NPC);

	if glb_NpcID==0 then return 0; end; -- 如果 NPC 编号为 0 则返回失败

local nNpcRow   = tabNpc:selectRowNum("NpcID", glb_NpcID);

local nNeedMapID = tonumber(tabNpc:getCell(nNpcRow, "MapID"));

local strNeedName = tabNpc:getCell(nNpcRow, "NpcName");

	-- 地图符合、人物符合、收集正开启这三个状态全符合才返回 1
	if nMapID==nNeedMapID and strName==strNeedName and GetGlbValue(ID_COLL_STATE)==1 then
		return 1;
	else
		return 0;
	end;

end;


-- 检测玩家身上是否已经带有足够的物品
-- 如果身上带有相应物品则直接删除，并返回 1，如果没带符合要求则返回 0
function checkCollectItem()

local nCollNum = GetGlbValue(ID_COLLNUM);

local nItem_1  = GetGlbValue(ID_COLL1_IDS);
local nNum_1   = GetGlbValue(ID_COLL1_NUM);

local nItem_2  = GetGlbValue(ID_COLL2_IDS);
local nNum_2   = GetGlbValue(ID_COLL2_NUM);

local nItem_3  = GetGlbValue(ID_COLL3_IDS);
local nNum_3   = GetGlbValue(ID_COLL3_NUM);

local aryColl_ID = {{nItem_1, nNum_1},
				    {nItem_2, nNum_2},
				    {nItem_3, nNum_3}
				   }

local aryColl_Code = {};
					  
local nGenre, nDetail, nParticular, nNum = 0,0,0,0;
local nRow = 0;
local nCheck = 0;
local i=0;

	for i=1, nCollNum do
		nRow         = tabGoods:selectRowNum("GoodsID", aryColl_ID[i][1]);
		nGenre       = tonumber(tabGoods:getCell(nRow, "Genre"));
		nDetail      = tonumber(tabGoods:getCell(nRow, "Detail"));
		nParticular  = tonumber(tabGoods:getCell(nRow, "Particular"));
		nNum         = aryColl_ID[i][2];
		if GetItemCount(nGenre, nDetail, nParticular)>=nNum then
			tinsert(aryColl_Code, {nGenre, nDetail, nParticular, nNum});
			nCheck = nCheck + 1;
		end;
	end;
	
	-- 如果全部物品符合则删除
	if nCheck==nCollNum then
		for i=1, getn(aryColl_Code) do
			DelItem(aryColl_Code[i][1],
					aryColl_Code[i][2],
					aryColl_Code[i][3],
					aryColl_Code[i][4]);
		end;
		return 1;
	else
		return 0;
	end;

end;


-- 给玩家发予奖励
function payCollectAward()

-- 得到 NPC ID
local nNpcID      = GetGlbValue(ID_COLL_NPC);

-- 得到 NPC 的行数
local nNpcRow    = tabNpc:selectRowNum("NpcID", nNpcID);

-- 得到 NPC 的中文名
local strNpcName = tabNpc:getCell(nNpcRow, "NpcName");

local nModel      = GetGlbValue(ID_COLLMODE);

local nValueBasic = countCollectAward();

-- 根据难度系数做奖励加乘
local nPayValue   = floor(nValueBasic * collMode[nModel][1] * 3.5);

local nSpe        = 0;

	Earn(nPayValue);
	
	if GetTask(PLAYER_DONUM) == 1 then
		local nAdd,nIdx = AddItem(2,1,1012,1,4);
		SetItemExpireTime(nIdx,3600*72);
		nAdd,nIdx = AddItem(2,1,30268,1);
		SetItemExpireTime(nIdx,3600*72);
		Say("<color=green>"..strNpcName.."<color>: B籲g h鱱 r蕋 gi醝! Trong nh竬 m総  thu th藀  th� ta c莕! Зy l� <color=yellow>"..nPayValue.."<color> ng! M鏸 ng祔, l莕 u ti猲 gi髉 ta, ta s� t苙g ngi 1 <color=yellow>B錸g Lai Ti猲 Thu� (kh玭g th� giao d辌h, th阨 h筺 3 ng祔)<color>. L莕 sau nh蕋 nh ph秈 n gi髉 ta y.", 0);		
	else
		local szNpc = "<color=green>"..strNpcName.."<color>: ";
		local tTalks = {
			"<color=green>"..strNpcName.."<color>: B籲g h鱱 r蕋 gi醝! Trong nh竬 m総  thu th藀  th� ta c莕! Зy l� <color=yellow>"..nPayValue.."<color> ti襫 ng ph莕 thng c馻 b籲g h鱱! L莕 sau ta nh蕋 nh s� t譵 b籲g h鱱 gi髉 .",
			szNpc.."B籲g h鱱  c鵦 kh� r錳! Зy l� th� lao c馻 ngi.",
			szNpc.."B籲g h鱱 qu� l� ngi t� m�, ki猲 tr�. Ti襫  nh蕋 nh s竛g l筺g.",
			szNpc.."L穙 phu  b玭 ba nhi襲 n琲 nh璶g nh鱪g ngi ki猲 tr� nh� c竎 h� th� kh玭g th蕐 nhi襲. Hi誱 c�, hi誱 c�!",
		}
		Say("<color=green>"..strNpcName.."<color>: B籲g h鱱 r蕋 gi醝! Trong nh竬 m総  thu th藀  th� ta c莕! Зy l� <color=yellow>"..nPayValue.."<color> ti襫 ng ph莕 thng c馻 b籲g h鱱! L莕 sau ta nh蕋 nh s� t譵 b籲g h鱱 gi髉 .", 0);
	end	
	-- 15% 的几率得到特殊奖励
	if random(1,100)<=15 then
	
		return
	
	else
		
		nSpe = random(1, getn(speAward));
		AddItem(speAward[nSpe][2],
				speAward[nSpe][3],
				speAward[nSpe][4],
				1);
		
		-- Say("<color=green>"..strNpcName.."<color>：太好了，我遍寻不着的东西都能给你找到，不简单，不简单啊！这是答谢你的 <color=yellow>"..nPayValue.."<color> 个铜钱以及我艰难搜集回来的一个 <color=yellow>"..speAward[nSpe][1].."<color>。下次我一定会再找你帮忙的。", 0);
		Say("<color=green>"..strNpcName.."<color>:Th藅 vi di謚,nh鱪g  ta 產ng t譵 ki誱 u  頲 c竎 h� t譵 th蕐,kh玭g t錳, qu� l� kh玭g t錳!в p t� ngi, ta s� cho ngi m閠 v藅 ta r蕋 gian nan m韎 thu th藀 頲, l� <color=yellow>"..speAward[nSpe][1].."<color>. L莕 sau nh蕋 nh ph秈 n gi髉  ta nh�!", 0);
		return
		
	end;
	
end;


-- 关闭当前世界的收集活动
function closeCollectEvent()
	-- 标记收集任务已经结束
	SetGlbValue(ID_COLL_STATE, 0);
end;


-- 计算本次收集一共可获得多少基础奖励
function countCollectAward()

local nCollNum = GetGlbValue(ID_COLLNUM);

local aryColl_ID = createCollectArray();

local nValue, nTotalValue = 0,0;
local i=0;

	for i=1, nCollNum do
		nRow         = tabGoods:selectRowNum("GoodsID", aryColl_ID[i][1]);
		-- 基础价值  = 物品售价 * 数量
		nValue       = tonumber(tabGoods:getCell(nRow, "Value")) * aryColl_ID[i][2];
		nTotalValue = nTotalValue + nValue;
	end;
	
	return nTotalValue;

end;


-- 根据全局变量构造一个收集任务的数组
function createCollectArray()

local nItem_1  = GetGlbValue(ID_COLL1_IDS);
local nNum_1   = GetGlbValue(ID_COLL1_NUM);

local nItem_2  = GetGlbValue(ID_COLL2_IDS);
local nNum_2   = GetGlbValue(ID_COLL2_NUM);

local nItem_3  = GetGlbValue(ID_COLL3_IDS);
local nNum_3   = GetGlbValue(ID_COLL3_NUM);

local aryColl_ID = {{nItem_1, nNum_1},
				    {nItem_2, nNum_2},
				    {nItem_3, nNum_3}
				   }
				   
	return aryColl_ID;

end;


-- 构造一个人物所说的对话
function createCollectTalk(strName)

	-- Talk(1, "", "T筰 h� kh玭g c遪 g�  cho i hi謕 n鱝 r錳 !!!!")
	-- do return end
-------------
local aryColl_ID = createCollectArray();

local nCollNum = GetGlbValue(ID_COLLNUM);

local strItem, strItemSay, strMain = "", "", "";

local i=0;

	for i=1, nCollNum do
		nRow         = tabGoods:selectRowNum("GoodsID", aryColl_ID[i][1]);
		strItem      = tabGoods:getCell(nRow, "Text");
		strItemSay   = strItemSay.."<color=yellow>"..aryColl_ID[i][2].."<color> <color=yellow>"..strItem.."<color><enter>";
	end;
	
	strMain = "<color=green>"..strName.."<color>: Ta r蕋 th輈h s璾 t莔 v藅 ph萴 l�! B籲g h鱱 c� th� gi髉 ta kh玭g? Ch� c莕 gi髉 ta <color=yellow>3 l莕<color>, s� c� th� lao c秏 t�!<enter>"..strItemSay;
	
	Say(strMain,
		2,
		"Ta  t譵 頲 th� ngi c莕, ngi nh n 琻 ta th� n祇?/_AccCollectCall",
		" m謙 th� ng錳 ngh� nh璶g vi謈  i v韎 ta l� kh玭g th�./Main_Exit");

end;



function _AccCollectCall()

-- 得到 NPC ID
local nNpcID      = GetGlbValue(ID_COLL_NPC);

-- 得到 NPC 的行数
local nNpcRow    = tabNpc:selectRowNum("NpcID", nNpcID);

-- 得到 NPC 的中文名
local strNpcName = tabNpc:getCell(nNpcRow, "NpcName");

local nGlobalTime = GetGlbValue(ID_COLL_TIME);

	-- 如果同一时间内超过 3 次了，则不能再做
	--修改为每天只能做3次 edited by vivi
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(PLAYER_COLLTIME)>=nDate and GetTask(PLAYER_DONUM)>= COLLTIME_LIMIT then
		Say("<color=green>"..strNpcName.."<color>: H玬 nay thi誹 hi謕  gi髉 ta "..COLLTIME_LIMIT.." l莕 li猲 ti誴, th藅 kh玭g d竚 l祄 phi襫 n鱝. Xin 產 t� thi誹 hi謕, ta s� nh� ngi kh竎 v藋! Ng祔 mai thi誹 hi謕 l筰 n nh�!", 0);
		return
	end;
	
	if GetTask(PLAYER_COLLTIME) < nDate then
		SetTask(PLAYER_COLLTIME, nDate);
		SetTask(PLAYER_DONUM, 0);
	end;	
	
	if checkCollectItem()==1 then
--		SetTask(PLAYER_COLLTIME, nGlobalTime);
		SetTask(PLAYER_DONUM, GetTask(PLAYER_DONUM)+1);
		payCollectAward();
	else
		Say("<color=green>"..strNpcName.."<color>: Nh譶 ngi tr� th� m� nh g箃 ph莕 thng c馻 ta. Ta tuy ch﹏ y誹 nh璶g m総 ch璦 hoa m�!", 0);
	end;

end;

-- 什么也不做的空函数
function Main_Exit()
	local tTalks = {
		"Л頲 th玦! Ta c騨g kh玭g mi詎 cng ngi.",
		"C遪 tr� th� c莕 h鋍 c竎h c� g緉g nhi襲 h琻.",
		"Thi猲 h� r閚g l韓, nhi襲 ngi nhi襲 vi謈. Ngi b薾 th� 甶 l祄 vi謈 c馻 m譶h 甶.",
		"C� l祄 th� m韎 c� ╪!",
		"Tay l祄 h祄 nhai, tay quai mi謓g tr�",
		"C� ch� th� n猲",
		"H鱱 ch� c竛h th祅h",
		"N╪g nh苩 ch苩 b�!",
		"C� c玭g m礽 s総 c� ng祔 n猲 kim.",
		"C� ch� l祄 quan, c� gan l祄 gi祏.",
		"H誸 c琻 b� c鵦, n ng祔 th竔 lai.",
		"Kh� t薾 cam lai. с l� quy lu藅 c馻 t� nhi猲.",
		"C� b閠 m韎 g閠 n猲 h錦nTay kh玭g m� d鵱g c�  m韎 hay.",
		"Ki課 tha l﹗ c騨g y t�.",
		"Ch� th蕐 s鉵g c� m� ng� tay ch蘯.",
		"Ch﹏ c鴑g  m襪, b玭 ba b鑞 b�.",
	}
	local nTalk = random(getn(tTalks));
	local szNpc = "<color=green>H祅h cc thng nh﹏<color>: ";
	Talk(1,"",szNpc..tTalks[nTalk]);
end;
