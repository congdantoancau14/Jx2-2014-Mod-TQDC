--IB物品：小盒陨铁碎片
--功能描述：让其使用本物品选择并兑换对应的师门秘籍
--代码编写人：赵贵春
--代码编写时间：2007年1月23日
--策划人：刘天
Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 10
dabaoyuntiesuipian_id = 30788
--**********************************物品使用主函数************************************
function OnUse(goods_index)
	Say("B筺 mu鑞 d飊g H閜 M秐h Thi猲 Th筩h (Nh�)  i M秐h Thi猲 Th筩h"..goods_num.."?",
	2,
	"фi/use_determine",
	"в suy ngh�/end_dialog")
end
function use_determine()
	if GetItemCount(2,1,dabaoyuntiesuipian_id) == 0 then
		Talk(1,"end_dialog","H穣 ki觤 tra trong t骾 c� <color=red>H閜 M秐h Thi猲 Th筩h (Nh�)<color> kh玭g!")
		return
	end
	if Zgc_pub_goods_add_chk(5,500) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntiesuipian_id,1) ~= 1 then
		Talk(1,"end_dialog","H穣 ki觤 tra trong t骾 c� <color=red>H閜 M秐h Thi猲 Th筩h (Nh�)<color> kh玭g!")
		return
	end
	local add_flag = AddItem(2,2,7,goods_num,5)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g b筺  d飊g H閜 M秐h Thi猲 Th筩h (Nh�)  i"..goods_num.." m秐h Thi猲 Th筩h!")
	else
		WriteLog(GetName().."use xiaoheyuntieshuipian fail :"..add_flag)
	end
end
