--脚本名称：白米粽子使用脚本
--脚本功能：将白米粽子兑换为香米粽子
--功能策划：oo
--功能开发：村长
--开发时间：2008-06-05
--代码修改记录
function OnUse()
	local baimi_zongzi_num = GetItemCount(2,1,1122)
	local del_flag = DelItem(2,1,1122,baimi_zongzi_num)
	if del_flag == 1 then
		local add_flag = AddItem(2,1,3359,baimi_zongzi_num)
		if add_flag == 1 then
			Msg2Player("B筺 i "..baimi_zongzi_num.." 'B竛h 輙 g筼 tr緉g' l蕐 'B竛h 輙 g筼 th琺'!")
		else
			WriteLog("[an Ng� 08] ngi ch琲:  "..GetName().."T╪g"..baimi_zongzi_num.." B竛h 輙 g筼 th琺 th蕋 b筰, k� hi謚 th蕋 b筰:  "..add_flag)
		end
	else
		WriteLog("[an Ng� 08] ngi ch琲:  "..GetName().."H駓 b�"..baimi_zongzi_num.." B竛h 輙 g筼 tr緉g th蕋 b筰, k� hi謚 th蕋 b筰:  "..del_flag)
	end
end
