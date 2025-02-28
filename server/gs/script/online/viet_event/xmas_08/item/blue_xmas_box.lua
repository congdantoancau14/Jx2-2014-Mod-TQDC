--File name:	blue_xmas_box.lua
--Describe:		蓝色礼盒脚本
--Item ID:		2,1,30033
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
g_nNeedWeight = 20
g_nDenominator = 10000							--分母，表示概率的单位是x分之1
g_nExpNum = 80000								--使用一个蓝色礼盒获得的经验值

g_szFileName = "blue_xmas_box.lua"			--文件名

g_tbItem = 
{
	--		类型	   概率		数量 名字		ID1,ID2,ID3
	[1]  = {TYPE_NULL,	4535},
	[2]  = {TYPE_ITEM,	10,		1,	"Thi猲 H� M藅 t辌h",	0,	107,64},
	[3]  = {TYPE_ITEM,	10,	1,	"Ng� Qu� M藅 t辌h",	0,	107,63},
	[4]  = {TYPE_ITEM,	10,	1,	"B� Kim M藅 t辌h",	0,	107,61},
	[5]  = {TYPE_ITEM,	10,	1,	"B� Th筩h M藅 t辌h",	0,	107,62},
	[6]  = {TYPE_ITEM,	2,	1,	"M秐h Thi猲 th筩h",	2,	2,	7},
	[7]  = {TYPE_ITEM,	10,	1,	"Thi猲 th筩h",		2,	2,	8},
	[8]  = {TYPE_ITEM,	10,	1,	"M秐h B╪g th筩h",	2,	1,	148},
	[9]  = {TYPE_ITEM,	10,	1,	"B╪g th筩h",		2,	1,	149},
	[10]  = {TYPE_ITEM,	1,	1,	"C﹜ B竧 Nh�",	2,	0,	398},
	[11] = {TYPE_ITEM,	1,	1,	"C﹜ B竧 Nh� nh�",	2,	0,	504},
	[12] = {TYPE_ITEM,	341,	1,	"L� th駓",		2,	0,	351},
	[13] = {TYPE_ITEM,	50,	1,	"B錸g Lai L� Th駓",	2,	1,	1052},
	--		类型	   概率 数值	提示字符串 	命令字符串
	[14] = {TYPE_CMD,	3000,	1,	{"甶觤 danh v鋘g"},	"ModifyReputation(%d,0)"},
	[15] = {TYPE_CMD,	2000,	5,	"甶觤 tu luy謓",	"ModifyPopur(%d)"},
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
	--经验奖励部分
	local nExp = g_nExpNum
	local nExpTotal = GetTask(TOTALEXP_08_XMAS_VIET)
	if nExpTotal >= EXP_LIMIT_08_XMAS_VIET then
		Msg2Player("Х vt qu� kinh nghi謒 cao nh蕋 c馻 ho箃 ng gi竛g sinh "..EXP_LIMIT_08_XMAS_VIET.." , Hi謓 t筰 kh玭g th� nh薾 th猰 kinh nghi謒 t� ho箃 ng n祔, nh璶g c� th� s� c� c� h閕 nh薾 ph莕 thng kh竎.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > EXP_LIMIT_08_XMAS_VIET then
		nExp = EXP_LIMIT_08_XMAS_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( TOTALEXP_08_XMAS_VIET, (nExpTotal+nExp) )
		Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒");

		local szItemName = "甶觤 kinh nghi謒"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "H閜 Qu� Xanh", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
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
		WriteLogEx(g_szLogTitle, "H閜 Qu� Xanh", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "H閜 Qu� Xanh", "", "", "", "", "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
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

function nothing()

end
