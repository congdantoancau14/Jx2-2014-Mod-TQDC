-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 黄金商人脚本
-- Edited by Ally
-- 2011/08/01

-- ======================================================
Include("\\script\\equip_shop\\equip_shop_head.lua")
function main()
	--do return end
	Say("<color=yellow>T� B秓 Thng Nh﹏: <color>Ta v鮝 mang v� nh鱪g v藅 ph萴 h蕄 d蒼 y, v祇 xem n祇!",
			2,
			"Л頲, ta mu鑞 xem/yes_open",
			"Kh玭g, ta ch� 甶 ngang qua y th玦/no_open"
		);
	return nil;
end

function yes_open()
	-- OpenEquipShop(1, "Untitled");
	show_equip_shop(1);
end

function no_open()
end

