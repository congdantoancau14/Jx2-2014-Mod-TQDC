--File name:	new_xmas_box.lua
--Describe:		礼盒脚本
--Item ID:		2,1,30035
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
g_nVietUseBoxEnd = 2049010500				--礼盒的使用截止日期
g_nNeedRoom = 1
g_nNeedWeight = 100
g_nDenominator = 100000						--分母，表示概率的单位是x分之1

g_szFileName = "new_xmas_box.lua"			--文件名

g_tbItem = 
{
	--		类型	   概率		数量 名字		ID1,ID2,ID3
	[1] = {TYPE_EQUIP,	10,		1,	"T祅g Ki誱 Kim 蕁",		0,	102,	40},
	[2] = {TYPE_EQUIP,	10,		1,	"T祅g Ki誱 K� Th筩h",		0,	102,	39},
	[3] = {TYPE_EQUIP_BODY,	10,		1,	"T祅g Ki誱 T� Kim m穙",	0,	103,	95},
	[4] = {TYPE_EQUIP,	33330,	1,	"T祅g Ki誱 B秓 Ch﹗",		0,	102,	38},
	[5] = {TYPE_EQUIP_BODY,	33320,	1,	"Kim L� Thng",	0,	100,	95},
	[6] = {TYPE_EQUIP_BODY,	33320,	1,	"T祅g Ki誱 � kim ph鬰",	0,	101,	95},
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
	
	if nType == TYPE_EQUIP_BODY then
		local nBodyType = GetBody()
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7]  + nBodyType - 1,g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
	end


	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("B筺 nh薾 頲  "..nItemNum.." "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "H閜 qu�", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "H閜 qu�", "", "", "", "", "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
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

