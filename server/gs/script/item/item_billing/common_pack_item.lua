--通用的打包物品脚本
-- 打包的xxx实现,右击使用获得x个xxx
Include("\\settings\\static_script\\item\\common_pack_item_imp.lua")

function OnUse(nItemIndex)
	return on_use_real(nItemIndex)
end