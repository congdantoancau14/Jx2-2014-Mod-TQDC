function main()
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Linh Th¹ch? Chç ta ch¼ng cã ®Ó b¸n, ng­¬i ®i hái ng­êi cña C«ng D· ThÕ Gia xem sao!");
	end;	
	
	if random(1,10) == 2 then
		NpcChat(GetTargetNpc(),"Nghe nãi Tróc Ty ®éng cã mét sè l­îng hµng hãa tèt, ta bËn bÞu kh«ng thÓ nµo mµ ®i mét n¬i xa nh­ vËy.");
	end;
	
	local nCount = GetItemCount(2, 1, 38)
	Say("Hoan nghªnh kh¸ch quan ®· ®Õn víi bæn ®iÕm. D­¬ng Ch©u phån hoa, c«ng viÖc ta ngµy cµng bËn bÞu, "
		.."hµng lu«n thiÕu thèn. Ch¼ng hay c¸c h¹ cã thÓ hîp t¸c, cung cÊp méng sè hµng hãa cho bæn ®iÕm hay kh«ng?", 3,
		"Ta muèn mua mét sè ®å lÆt vÆt/taphoa",
		format("Ta muèn cung cÊp cho «ng mét it hµng hãa/#_on_exchange(%d)", nCount),
		"Ch¼ng hay d¹o nµy l·o b¶n lµm ¨n thÕ nµo/nothing"
	)
end;

function _on_exchange(nCount)
	AskClientForNumber("_request_number_call_back", 1, nCount, "H·y nhËp vµo sè l­îng hµng hãa muèn cung cÊp cho chñ tiÖm")
end

-- Modified from item_juyi_tongtian_ling.lua
function _request_number_call_back(nNum)
	
	if nNum < 1 then
		Msg2Player("§· hñy bá giao d×ch.")
		return 0;
	end
	
	
	local nDelResult = DelItem(2, 1, 38, nNum)
	if  nDelResult and nDelResult == 1 then
		Earn(nNum * 1000)
		local szMsg = format("<color=green>Chñ T¹p Hãa<color>: §a ®¹ b»ng h÷u ®· vÊt v¶. §©y lµ thï lao cña ng­¬i: %d %s", nNum*10, "ng©n l­îng")
		Talk(1, "", szMsg)
		--Msg2Player("Giao d?ch thµnh c«ng")
		--WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
	end
end

function taphoa()
	Sale(35)
end;

function nothing()
end;