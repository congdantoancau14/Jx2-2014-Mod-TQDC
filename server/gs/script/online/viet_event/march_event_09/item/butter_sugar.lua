--File name:	butter_sugar.lua
--Describe:		奶糖脚本
--Item ID:		2,1,30066
--Create Date:	2009-02-17
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
g_nDenominator = 1000000						--分母，表示概率的单位是x分之1
g_nExpNum = 125000								--使用一个奶糖获得的经验值

g_szFileName = "butter_sugar.lua"				--文件名

g_tbItem = 
{
	--		类型	   概率		数量 名字			ID1,ID2,ID3		期限(-1为没有时间限制)
	[1] = {TYPE_ITEM,	30000,		1,	"M秐h Thi猲 th筩h",		2,	2,		7,		-1,	},
	[2] = {TYPE_ITEM,	20000,		1,	"Thi猲 th筩h",			2,	2,		8,		-1,	},
	[3] = {TYPE_ITEM,	30000,		1,	"M秐h B╪g th筩h",		2,	1,		148,	-1,	},
	[4] = {TYPE_ITEM,	20000,		1,	"B╪g th筩h",			2,	1,		149,	-1,	},
	[5] = {TYPE_ITEM,	50000,		1,	"B錸g Lai Ti猲 Th駓",		2,	1,		1012,	-1,	},
	[6] = {TYPE_ITEM,	80000,		1,	"B錸g Lai L� Th駓",		2,	1,		1052,	-1,	},
	[7] = {TYPE_ITEM,	20000,		1,	"Th� Th﹏ ph�",		2,	0,		556,	7,	},
	[8] = {TYPE_ITEM,	30000,		1,	"Ti猽 Ki誴 t竛",		2,	0,		141,	7,	},
	[9] = {TYPE_ITEM,	10,			1,	"B竧 B秓 T葃 T駓 Ti猲 Кn",	2,	0,		138,	7,	},
	[10] = {TYPE_ITEM,	40,			1,	"T葃 T駓 linh n",		2,	0,		137,	7,	},
	[11] = {TYPE_ITEM,	5000,		1,	"Thi猲 H� M藅 t辌h",		0,	107,	64,		-1,	},
	[12] = {TYPE_ITEM,	3000,		1,	"T� H� M藅 t辌h",		0,	107,	65,		-1,	},
	[13] = {TYPE_ITEM,	2000,		1,	"Chi猰 Y Ph�",		0,	107,	66,		-1,	},
	[14] = {TYPE_ITEM,	10,			1,	"Kim Cang Ph鬰 Ma kinh",	0,	107,	1,		-1,	},
	[15] = {TYPE_ITEM,	5,			1,	"Ti襪 Long M藅 t辌h",		0,	107,	3,		-1,	},
	[16] = {TYPE_ITEM,	10,			1,	"V� Tr莕 M藅 t辌h",		0,	107,	5,		-1,	},
	[17] = {TYPE_ITEM,	10,			1,	"Thi猲 La M藅 T辌h",		0,	107,	7,		-1,	},
	[18] = {TYPE_ITEM,	5,			1,	"Nh� � M藅 T辌h",		0,	107,	9,		-1,	},
	[19] = {TYPE_ITEM,	10,			1,	"B輈h H秈 Ph�",		0,	107,	11,		-1,	},
	[20] = {TYPE_ITEM,	10,			1,	"H鏽 чn M藅 t辌h",		0,	107,	13,		-1,	},
	[21] = {TYPE_ITEM,	5,			1,	"Qu� Thi猲 M藅 t辌h",		0,	107,	15,		-1,	},
	[22] = {TYPE_ITEM,	10,			1,	"Huy襫 秐h M藅 t辌h",		0,	107,	17,		-1,	},
	[23] = {TYPE_ITEM,	5,			1,	"Qu﹏ T� M藅 t辌h",		0,	107,	19,		-1,	},
	[24] = {TYPE_ITEM,	5,			1,	"Tr蕁 Qu﹏ M藅 t辌h",		0,	107,	21,		-1,	},
	[25] = {TYPE_ITEM,	10,			1,	"Xuy猲 V﹏ M藅 t辌h",		0,	107,	23,		-1,	},
	[26] = {TYPE_ITEM,	20,			1,	"U Minh Qu� L鬰",		0,	107,	25,		-1,	},
	[27] = {TYPE_ITEM,	10,			1,	"Linh C� M藅 t辌h",		0,	107,	27,		-1,	},
	[28] = {TYPE_ITEM,	20000,		1,	"Ch譨 Kh鉧 V祅g",		2,	1,		30069,	30,	},

	--		类型	   概率 数值	提示字符串 		命令字符串
	[29] = {TYPE_CMD,	249825,	3,	{" 甶觤 danh v鋘g"},		"ModifyReputation(%d,0)"},
	[30] = {TYPE_CMD,	170000,	5,	{" 甶觤 danh v鋘g"},		"ModifyReputation(%d,0)"},
	[31] = {TYPE_CMD,	100000,	10,	{" 甶觤 danh v鋘g"},		"ModifyReputation(%d,0)"},
	[32] = {TYPE_CMD,	20000,	50,	{" 甶觤 danh v鋘g"},		"ModifyReputation(%d,0)"},
	[33] = {TYPE_CMD,	100000,	20,	" 甶觤 tu luy謓",		"ModifyPopur(%d)"},
	[34] = {TYPE_CMD,	50000,	100,"觤 T祅g ki誱",	"SetTask(1801, GetTask(1801)+%d)"},
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
	--经验奖励部分
	local nExp = g_nExpNum
	local nExpTotal = GetTask(SUGAR_TOTALEXP_09_MARCH_VIET)
	if nExpTotal >= SUGAR_EXP_LIMIT_09_MARCH_VIET then
		Msg2Player("C竎 h�  thu 頲 kinh nghi謒 cao nh蕋 t� v藅 ph萴 K裲 S鱝 "..SUGAR_EXP_LIMIT_09_MARCH_VIET.." , Hi謓 t筰 kh玭g th� nh薾 th猰 kinh nghi謒 t� ho箃 ng n祔, nh璶g c� th� s� c� c� h閕 nh薾 ph莕 thng kh竎.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > SUGAR_EXP_LIMIT_09_MARCH_VIET then
		nExp = SUGAR_EXP_LIMIT_09_MARCH_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( SUGAR_TOTALEXP_09_MARCH_VIET, (nExpTotal+nExp) )
		Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒");

		local szItemName = "甶觤 kinh nghi謒"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "K裲 s鱝", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
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
		WriteLogEx(g_szLogTitle, "K裲 s鱝", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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

