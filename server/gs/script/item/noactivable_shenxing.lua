-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 未开锋的神行脚本文件                  
-- Edited by starry night                                 
-- 2006/05/11 AM 20:15                                    
                                                          
-- ======================================================

Include("\\script\\item\\weapon_kaifeng_head.lua");

function OnUse()

	Say("<color=yellow>Th莕 H祅h<color> n祔 hi謓 <color=yellow>ch璦 gi竚 nh<color>, c� th� d飊g v藅 li謚 c th�  k輈h ho箃 n�. B筺 mu鑞 ch鋘 c竎h k輈h ho箃 n祇 sau y?",
	7,
	"K輈h ho箃 th玭g thng (c莕 1 lng v祅g, 1 Thi猲 th筩h v� 3 t蕀 Gi竚 мnh ph� c蕄 7)/#Weapon_Kaifeng(1,1,9)",
	"K輈h ho箃 k� (c莕 20 lng v祅g, 5 Thi猲 th筩h v� 5 t蕀 Gi竚 мnh ph� c蕄 7)/#Weapon_Kaifeng(2,1,9)",
	"K輈h Ho箃 cao c蕄? (c莕 200 lng v祅g, 10 thi猲 th筩h, 10 gi竚 nh ph� c蕄 7, 1 t� m藅 t辌h)/#Weapon_Kaifeng(3,1,9)",
	"K輈h ho箃 th玭g thng? (c莕 2 B祅 Long B輈h)/#Weapon_Kaifeng_Ex(1,1,9)",
	"K輈h ho箃 k�? (c莕 4 B祅 Long B輈h)/#Weapon_Kaifeng_Ex(2,1,9)",
	"K輈h ho箃 cao c�? (c莕 1 T葃 T駓 Кn)/#Weapon_Kaifeng_Ex(3,1,9)",
	"T筸 th阨 kh玭g k輈h ho箃/nothing"
	)

end

function nothing()

end