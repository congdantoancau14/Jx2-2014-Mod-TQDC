
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 杨门门派任务杨排风脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

function main()
	Say("V� huynh  n祔 t譵 ta c� vi謈 g� kh玭g?",
		5,
		"Ta mu鑞 mua m閠 s� v藅 d鬾g./PutongBuy",
		"Ta nghe n鉯 s� m玭 c� 1 b� th莕 binh b秓 gi竝 gi祅h cho t﹏ th�? H穣 cho ta xem!/ChujitaoBuy",
		"Ta nghe n鉯 s� m玭 c� 1 b� th莕 binh b秓 gi竝 gi祅h cho v� l﹎ cao th�? H穣 cho ta xem!/ZhongtaoBuy",
		"Ta nghe n鉯 s� m玭 c� 1 b� th莕 binh b秓 gi竝 gi祅h cho tuy謙 th� cao th�? H穣 cho ta xem!/GaotaoBuy",
		"R阨 kh醝./cancel")
end

function cancel()
end

function PutongBuy()
   Sale(51)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ngi kh玭g ph秈 l�  t� c馻 Dng M玭 sao l筰 mua v藅 ph萴 b� truy襫 c馻 b鎛 m玭?",0)
	return
else
   Sale(81)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ngi kh玭g ph秈 l�  t� c馻 Dng M玭 sao l筰 mua v藅 ph萴 b� truy襫 c馻 b鎛 m玭?",0)
	return
else
   Sale(82)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ngi kh玭g ph秈 l�  t� c馻 Dng M玭 sao l筰 mua v藅 ph萴 b� truy襫 c馻 b鎛 m玭?",0)
	return
else
   Sale(83)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ngi kh玭g ph秈  t� Dng M玭, d竚 l鮝 g箃 ta �?",0)
	return
else
   Sale(64)
end
end
