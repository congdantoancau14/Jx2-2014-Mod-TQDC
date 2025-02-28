--File name:	specilize_xmas_box.lua
--Describe:		特别礼盒脚本
--Item ID:		2,1,30037
--Create Date:	2008-11-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")

TYPE_NULL 	= 0;	--没有奖励
TYPE_ITEM 	= 1;	--普通物品
TYPE_EQUIP 	= 2;	--带属性装备类物品
TYPE_CMD 	= 3;	--命令

--=========================================================================================
g_szLogTitle = "Giang Sinh 2008"		--此处分为2段只是为了不增加新的翻译
g_nVietUseBoxEnd = 2049011200					--礼盒的使用截止日期
g_nNeedRoom = 1
g_nNeedWeight = 100
g_nDenominator = 100							--分母，表示概率的单位是x分之1

g_szFileName = "specilize_xmas_box.lua"			--文件名

g_tbItem = 
{
	--		类型	   概率		数量 名字		ID1,ID2,ID3
	[1]  = {TYPE_EQUIP,	6,		1,	"Ph� Y猲 產o",	0,	3,	6001},
	[2]  = {TYPE_EQUIP,	6,		1,	"Ph� Y猲 c玭",	0,	5,	6002},
	[3]  = {TYPE_EQUIP,	6,		1,	"H祄 Y猲 th�",	0,	0,	6004},
	[4]  = {TYPE_EQUIP,	6,		1,	"Ph� Y猲 trng",	0,	8,	6003},
	[5]  = {TYPE_EQUIP,	6,		1,	"Phi Y猲 ki誱",	0,	2,	6006},
	[6]  = {TYPE_EQUIP,	7,		1,	"V薾 Y猲 c莔",	0,	10,	6007},
	[7]  = {TYPE_EQUIP,	7,		1,	"V﹏ Y猲 th�",	0,	0,	6008},
	[8]  = {TYPE_EQUIP,	7,		1,	"L璾 Y猲 c玭",	0,	5,	6009},
	[9]  = {TYPE_EQUIP,	7,		1,	"Huy襫 Y猲 ki誱",	0,	2,	6010},
	[10] = {TYPE_EQUIP,	7,		1,	"V� Y猲 b髏",	0,	9,	6011},
	[11] = {TYPE_EQUIP,	7,		1,	"H� Ti猰 Thng",	0,	6,	6012},
	[12] = {TYPE_EQUIP,	7,		1,	"H祅h Y猲 Cung",	0,	4,	6013},
	[13] = {TYPE_EQUIP,	7,		1,	"Tr鋍 Y猲 nh蒼",	0,	7,	6014},
	[14] = {TYPE_EQUIP,	7,		1,	"Y猽 Y猲 tr秓",	0,	11,	6015},
	[15] = {TYPE_EQUIP,	7,		1,	"T祅g Y猲 ch﹎",	0,	1,	6005},
}



--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
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
	local szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
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

		for i=1, 3 do
			AddGlobalNews("Ch骳 m鮪g  "..GetName().." M� H閜 Qu� c Bi謙 thu 頲  "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "H閜 Qu� c Bi謙", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "H閜 Qu� c Bi謙", "", "", "", "", "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
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

