--=============================================
--create by zhangming 2010.7.15
--describe:越南版2010年8月活动1 白金大红包脚本文件
--=============================================

Include("\\script\\online_activites\\2010_08\\activites_01\\head.lua");--活动头文件
Include("\\script\\item\\item_billing\\item_baijinhongbao.lua");

g_szItemSayHead = gf_FixColor(VET_201008_01_TB_ITEM_LIST[5][1], 2, 1);

function OnUse(nItemIdx)
    if DelItemByIndex(nItemIdx, 1) == 1 then
        Earn(40000000)
    end
	-- SendScript2VM("\\script\\online_activites\\201502\\wushi.lua", OnUse(nItemIdx));	
end
