--File name:	stone.lua
--Describe:		奇石脚本
--Item ID:		2,1,30068
--Create Date:	2009-02-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

TYPE_NULL 	= 0;	--没有奖励
TYPE_ITEM 	= 1;	--普通物品
TYPE_EQUIP 	= 2;	--带属性装备类物品
TYPE_CMD 	= 3;	--命令

--=========================================================================================
g_szLogTitle = "Event th竛g 3"			--此处分为2段只是为了不增加新的翻译
g_nVietUseBoxEnd = 2049041300					--使用截止日期
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 100000							--分母，表示概率的单位是x分之1
--g_nExpNum = 125000								--使用一个奇石获得的经验值

g_szFileName = "stone.lua"						--文件名

g_tbItem = 
{
	--		类型	   概率			数量 名字			ID1,ID2,ID3		期限(-1为没有时间限制)
	[1] = {TYPE_ITEM,	10000,		100,	"Bao nguy猲 li謚",		2,	1,		30061,	-1,	},
	[2] = {TYPE_ITEM,	10000,		1,	"M秐h Thi猲 th筩h",		2,	2,		7,		-1,	},
	[3] = {TYPE_ITEM,	3000,		3,	"M秐h Thi猲 th筩h",		2,	2,		7,		-1,	},
	[4] = {TYPE_ITEM,	15000,		1,	"Thi猲 th筩h",			2,	2,		8,		-1,	},
	[5] = {TYPE_ITEM,	5000,		3,	"Thi猲 th筩h",			2,	2,		8,		-1,	},
	[6] = {TYPE_ITEM,	50,			1,	"Kim Cang Ph鬰 Ma T﹎ Ph竝",	0,	107,	2,		-1,	},
	[7] = {TYPE_ITEM,	20,			1,	"Ti襪 Long T﹎ Ph竝",		0,	107,	4,		-1,	},
	[8] = {TYPE_ITEM,	40,			1,	"V� Tr莕 T﹎ Ph竝",		0,	107,	6,		-1,	},
	[9] = {TYPE_ITEM,	40,			1,	"Thi猲 La T﹎ Ph竝",		0,	107,	8,		-1,	},
	[10] = {TYPE_ITEM,	20,			1,	"Nh� � T﹎ Ph竝",		0,	107,	10,		-1,	},
	[11] = {TYPE_ITEM,	40,			1,	"B輈h H秈 T﹎ Ph竝",		0,	107,	12,		-1,	},
	[12] = {TYPE_ITEM,	40,			1,	"H鏽 чn T﹎ Ph竝",		0,	107,	14,		-1,	},
	[13] = {TYPE_ITEM,	20,			1,	"Qu� Thi猲 T﹎ Ph竝",		0,	107,	16,		-1,	},
	[14] = {TYPE_ITEM,	40,			1,	"Huy襫 秐h T﹎ Ph竝",		0,	107,	18,		-1,	},
	[15] = {TYPE_ITEM,	30,			1,	"Qu﹏ T� T﹎ Ph竝",		0,	107,	20,		-1,	},
	[16] = {TYPE_ITEM,	40,			1,	"Tr蕁 Qu﹏ T﹎ Ph竝",		0,	107,	22,		-1,	},
	[17] = {TYPE_ITEM,	30,			1,	"Xuy猲 V﹏ T﹎ Ph竝",		0,	107,	24,		-1,	},
	[18] = {TYPE_ITEM,	50,			1,	"U Minh T﹎ Ph竝",		0,	107,	26,		-1,	},
	[19] = {TYPE_ITEM,	50,			1,	"Linh C� T﹎ Ph竝",		0,	107,	28,		-1,	},
	[20] = {TYPE_ITEM,	6490,		1,	"T祅g Ki誱 anh h飊g thi誴",	2,	0,		31,		7,	},
	[21] = {TYPE_ITEM,	50000,		1,	"Ng鋍 Trai",			2,	1,		30067,	-1,	},
}


--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		Msg2Player("V藅 ph萴 n祔  qu� h筺, kh玭g th� s� d鬾g th猰 n鱝.")
		return
	end
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	--物品奖励部分
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = ""

	local nRetCode, nItemIdx = 0, 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode,nItemIdx = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode,nItemIdx = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_CMD then
		szInfoDescribe = format(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][3])
		dostring(szInfoDescribe)
		nRetCode = 1	--默认命令成功执行
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("B筺 nh薾 頲  "..nItemNum.." "..szItemName)
		end
		if (nType == TYPE_ITEM or nType == TYPE_EQUIP) and g_tbItem[nRandIdx][8] > 0 then
			SetItemExpireTime(nItemIdx, g_tbItem[nRandIdx][8]*24*3600)
		end
		WriteLogEx(g_szLogTitle, "K� Th筩h", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, szInfoDescribe, GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end

--按照概率获得g_tbItem里面的一项内容
function get_random_item(nTab)
	local nRandom = random(1,g_nDenominator)
	local nBase = 0
	if check_item_tab(nTab) == 1 then
		for i=1,getn(nTab) do
			if nRandom <= nTab[i][2]+nBase then
				return i
			else
				nBase = nBase + nTab[i][2]
			end
		end
	else
		return 0
	end
end

--检查输入的table是否正确
function check_item_tab(tTab)
	local nTotalProbability= 0
	for i=1,getn(tTab) do
		nTotalProbability = nTotalProbability + tTab[i][2]
	end
	if nTotalProbability == g_nDenominator then
		return 1
	else
		print("\n error item table in "..g_szFileName.." \n")
		return 0
	end
end

