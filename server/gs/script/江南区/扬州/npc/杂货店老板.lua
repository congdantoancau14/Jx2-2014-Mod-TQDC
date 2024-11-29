function main()
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Linh Th�ch? Ch� ta ch�ng c� �� b�n, ng��i �i h�i ng��i c�a C�ng D� Th� Gia xem sao!");
	end;	
	
	if random(1,10) == 2 then
		NpcChat(GetTargetNpc(),"Nghe n�i Tr�c Ty ��ng c� m�t s� l��ng h�ng h�a t�t, ta b�n b�u kh�ng th� n�o m� �i m�t n�i xa nh� v�y.");
	end;
	
	local nCount = GetItemCount(2, 1, 38)
	Say("Hoan ngh�nh kh�ch quan �� ��n v�i b�n �i�m. D��ng Ch�u ph�n hoa, c�ng vi�c ta ng�y c�ng b�n b�u, "
		.."h�ng lu�n thi�u th�n. Ch�ng hay c�c h� c� th� h�p t�c, cung c�p m�ng s� h�ng h�a cho b�n �i�m hay kh�ng?", 3,
		"Ta mu�n mua m�t s� �� l�t v�t/taphoa",
		format("Ta mu�n cung c�p cho �ng m�t it h�ng h�a/#_on_exchange(%d)", nCount),
		"Ch�ng hay d�o n�y l�o b�n l�m �n th� n�o/nothing"
	)
end;

function _on_exchange(nCount)
	AskClientForNumber("_request_number_call_back", 1, nCount, "H�y nh�p v�o s� l��ng h�ng h�a mu�n cung c�p cho ch� ti�m")
end

-- Modified from item_juyi_tongtian_ling.lua
function _request_number_call_back(nNum)
	
	if nNum < 1 then
		Msg2Player("�� h�y b� giao d�ch.")
		return 0;
	end
	
	
	local nDelResult = DelItem(2, 1, 38, nNum)
	if  nDelResult and nDelResult == 1 then
		Earn(nNum * 1000)
		local szMsg = format("<color=green>Ch� T�p H�a<color>: �a �� b�ng h�u �� v�t v�. ��y l� th� lao c�a ng��i: %d %s", nNum*10, "ng�n l��ng")
		Talk(1, "", szMsg)
		--Msg2Player("Giao d?ch th�nh c�ng")
		--WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
	end
end

function taphoa()
	Sale(35)
end;

function nothing()
end;