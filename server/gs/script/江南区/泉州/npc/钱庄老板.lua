
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ç®×¯ÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");
Include("\\script\\lib\\globalfunctions.lua");

szNpcName = "<color=yellow>Chñ TiÒn Trang: <color>"
function main()
	local tbSay = {}
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20150211 and nDate <= 20150228 then
		tinsert(tbSay,"Ta muèn ®æi tiÒn lÎ (1 Thiªn Kiªu LÖnh ®æi ®­îc 20 tiÒn lÎ)/DoiTien")	
	end
	tinsert(tbSay,"Rêi Khái/nothing")
	Say(szNpcName.."C¸c h¹ tíi ®©y cã viÖc chi?",getn(tbSay),tbSay)
	return
end

function DoiTien()
	AskClientForNumber("DoiTien_01",1,100,"Ng­¬i muèn ®æi bao nhiªu?");
end

function DoiTien_01(nMoney)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",szNpcName.."Ng­êi cßn sèng míi cã thÓ ®æi tiÒn!")
		return
	end	

	if gf_Judge_Room_Weight(1,100,1) ~= 1 then
		return
	end
	
	if GetItemCount(2,97,236) < nMoney then
		Talk(1,"",szNpcName.."Trong ng­êi kh«ng cã ®ñ sè l­îng Thiªn Kiªu LÖnh!")
		return
	end
	
	if DelItem(2,97,236,nMoney) == 1 then
		gf_AddItemEx2({2, 1, 30778, nMoney * 20}, "TiÒn LÎ", "§æiTiÒnLÎ", "NhËn", 0, 1);	
	end
end