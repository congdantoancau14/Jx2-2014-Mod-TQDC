Include("\\script\\lib\\item.lua");
Include("\\script\\mod\\carriage\\carriage_head.lua");

key = {2,1,29005}
box = {2,1,29006}
hcl = {2,1,29004}
STORE_BOX_WEIGHT = 5000
TASK_BOX_ID = 3583;


tBoxKeepers = {
	[201] = "��ng Bi�n Kinh",
	[202] = "Nam Bi�n Kinh",
	[203] = "T�y Bi�n Kinh",
	[301] = "��ng Th�nh ��",
	[302] = "Nam Th�nh ��",
	[303] = "T�y Th�nh ��",
	[304] = "B�c Th�nh ��",
	[350] = "Nam T��ng D��ng",
	[351] = "T�y T��ng D��ng",
	[352] = "B�c T��ng D��ng",
	[150] = "B�c D��ng Ch�u",
	[151] = "T�y D��ng Ch�u",
	[152] = "Nam D��ng Ch�u",
	[153] = "��ng D��ng Ch�u",
	[100] = "B�c Tuy�n Ch�u",
	[101] = "T�y Tuy�n Ch�u",
	[102] = "��ng Tuy�n Ch�u",
	[501] = "��ng Ph�ng T��ng",
	[502] = "T�y Ph�ng T��ng",
	[503] = "Nam Ph�ng T��ng",
	[504] = "B�c Ph�ng T��ng",
	[401] = "��ng ��i L�",
	[402] = "Nam ��i L�",
	[403] = "B�c ��i L�",

}

sNpcName = ""
sPlayerName = ""

function main_store_box(nThisBoxId)
	if nThisBoxId == nil then 
		nThisBoxId = GetWorldPos();
	end
	sNpcName = format("<color=green>%s<color>: ",GetNpcName(GetTargetNpc()))
	sPlayerName = format("<color=green>%s<color>: ",GetName());
	local nBoxId = GetTask(TASK_BOX_ID);
	local isHaveKey = GetItemCount(key[1],key[2],key[3]);
	local nReturn = GetTask(TASK_RETURN_BOX);
	
	if isHaveKey == 0 then 
		if nBoxId == 0 then 
			if Pay(1000) ~= 1 then 
				Talk(1,"",sNpcName.."Ph� g�i �� ch� c� <color=white>10 l��ng b�c<color> r� m�t m� ng��i c�ng kh�ng c�. ��ng l� m�t t�n kh� r�ch �o �m!")
				return 0;
			end
			Talk(2,"",sPlayerName.."Ta mu�n g�i �� � ��y. Nh� ng��i tr�ng c�n th�n gi�p ta!",
				sNpcName.."Hoan ngh�nh kh�ch quan! C�m �n kh�ch quan �� tin t��ng! Ph� g�i �� l� <color=white>10 l��ng b�c<color>. ��y l� ch�a kh�a r��ng. Xin h�y gi� c�n th�n!"
			)
			-- DelItem from carriage
			init(2);
			local nIndex = GetItemIndexFromFile(box[1],box[2],box[3]);
			local object = TB_ITEMS[nIndex];
			local nRemove = RemoveItemFromFile(object,nStoreId);
			local nDel = DelItem(box[1],box[2],box[3],1);
			local nAdd = AddItem(key[1],key[2],key[3],1);
			
			if nRemove == 1 or nDel == 1 then
				SetTask(TASK_BOX_ID,nThisBoxId);
			else
				Talk(1,"",sNpcName.."Ng��i kh�ng c� �� ��c g� c� g� g�i g� � ��y?");
			end
			-- return 0; -- Disable this line or change to return 1 will openbox in Th� kh�
		else
			if nBoxId == nThisBoxId then 
				Say(sNpcName.."Ng��i l�m m�t ch�a kh�a sao?",2,
					"Ta l� l�m m�t r�i/#lost_key(1)",
					"Ta t�nh h�i ch�t chuy�n. M� th�i!/no_box"
				)
				return 0
			else
				Say(sNpcName.."Ng��i l�m m�t ch�a kh�a sao?",2,
					"Ta l� l�m m�t r�i. V� c�ng kh�ng nh� n�i g�i ��. Xin h�y gi�p t�i h�/#lost_key(2)",
					"Ta ch� gh� qua th�i!/no_box"
				)
				return 0
			end
		end
	else
		if nBoxId ~= 0 then 
			if nBoxId ~= nThisBoxId then 
				Say(sNpcName.."M� s� tr�n ch�a kh�a <color=red>kh�ng ph�i � ��y<color>. Ng��i kh�ng g�i �� � ch� ta. Ng��i t�i nh�m ch� r�i.",3,
					format("Ta mu�n g�i �� � ��y. Nh� ng��i li�n l�c v�i th� kh� kh�c chuy�n �� c�a ta ��n ��y./#move_box_confirm(%d)",nThisBoxId),
					"Ta kh�ng nh� n�i g�i ��./lost_box",
					"��ng l� nh�m l�n, xin th�ng c�m! ;)/no_box");
				return 0;
			end
			if nReturn == 1 then
				Say(sNpcName.."Kh�ch quan c�n g� sao?",2,
					"Ta mu�n chuy�n �� �i, g�i tr� ng��i ch�a kh�a/get_box_confirm",
					"Kh�ng c� vi�c g�/nothing")
				return 0;
			end
		else
			Talk(1,"",sNpcName.."Ng��i nh�t ���c ch�a kh�a n�y sao? Ta kh�ng th�y t�n c�a ng��i trong danh s�ch kh�ch h�ng. Ta s� thu l�i v� n� thu�c t�i s�n c�a h� th�ng Ti�u c�c.");
			DelItem(key[1],key[2],key[3],1);
			return 0;
		end
	end
	return 1;
end;

function lost_box()
	Say(sNpcName.."Ng��i mu�n ta t�m th�ng tin v� n�i ng��i �� g�i �� �? ���c th�i! Li�n l�c r�t t�n k�m. L�y ng��i <color=gold>5 l��ng v�ng<color> th�i!",2,
		"���c./get_address",
		"Th�i! Ph� cao qu�, �� ta t� �i t�m./nothing"
	)
	
end;

function get_address()
	if Pay(50000) == 1 then 
		Talk(3,"","...",
			sNpcName.."Ta �� ph�i c�c kh� l�m m�i ki�m ���c th�ng tin v� cho ng��i.",
			sNpcName.."��a ch� g�i c�a ng��i l�: "..tBoxKeepers[GetTask(TASK_BOX_ID)]
		)
	else
		Talk(1,"",sNpcName.."Chi ph� t�n k�m. Kh�ng c� ti�n th� ta kh�ng th� gi�p ng��i ���c. 5 l��ng <color=gold>v�ng<color>, chu�n b� �� th� ��n ��y. Ti�n kh�ch!")
	end
end;

function lost_key(nPlace)
	if GetItemCount(key[1],key[2],key[3]) > 1 then 
		Talk(1,"",sNpcName.."Ch�ng ph�i kh�a �ang � tr�n tay ng��i �� sao? ��n ��a ta sao? Bi�n �i ch� kh�c cho ta l�m �n, ta kh�ng r�nh �� ��a gi�n v�i ng��i.")
		return 0;
	end
	
	if nPlace == 1 then 
		Talk(2,"",sNpcName.."C� r�t nhi�u ng��i g�i �� � ��y. Ta kh�ng th� nh� ���c ng��i c� ph�i kh�ch h�ng c�a ta kh�ng. Chi ph� x�c nh�n nh�n d�ng ��t ��. 5 l��ng <color=gold>v�ng<color> m�i ��.","...")
		
		if Pay(50000) == 1 then 
			AddItem(key[1],key[2],key[3],1);
			Talk(1,"",sNpcName.."Kh�a m�i c�a ng��i ��y. L�n sau nh� c�n th�n.")
		else
			Talk(1,"",sNpcName.."Chi ph� nh�n d�ng ��t ��. 5 l��ng <color=gold>v�ng<color> m�i ��. C� ti�n th� h�y quay l�i!")
		end
	else
		Talk(2,"","...",sNpcName.."Ta m�i ki�m tra danh s�ch th� kh�ng th�y ng��i trong danh s�ch g�i �� � ��y. Ng��i ��n nh�m ch� r�i.")
		return 0;
	end
end;

function move_box_confirm(nThisBoxId)
	Say(sNpcName.."Chi ph� li�n l�c c�c ��n v� kh�c c�ng th�m v�n chuy�n l� <color=gold>10 l��ng v�ng<color>. Ng��i th�c s� mu�n chuy�n �� ��n ch� ta ch�?",2,
		format("��ng v�y, ng��i n�i nhi�u qu�!/#move_box_here(%d)",nThisBoxId),
		"Th�i! �� ta suy t�nh ��./nothing"
	)
end;

function move_box_here(nThisBoxId)
	if Pay(100000) ~= 1 then 
		Talk(1,"",sNpcName.."Th� nh�t l� chi ph� li�n l�c c�c ��n v� kh�c �� t�n m�t <color=gold>5 l��ng v�ng<color>. Th� hai l� ta kh�ng bi�t ng��i �� g� trong r��ng nh�ng r��ng h�ng c�ng k�nh, c�ng v�n chuy�n h�ng h�a r�t c�c kh�. T�ng chi ph� v�n chuy�n l� 10 l��ng v�ng. Ng��i mu�n ti�n th� ph�i chi ra.");
		return 0;
	else
		Talk(1,"",sNpcName.."���c th�i! Kh�ch h�ng l� th��ng ��. C� ti�n th� vi�c g� c�ng gi�i quy�t ���c. ��y l� ch�a kh�a m�i c�a ng��i. L�n sau ng��i t�i ��y l� s� c� r��ng �� r�i!");
		DelItem(key[1],key[2],key[3],1)
		AddItem(key[1],key[2],key[3],1)
		SetTask(TASK_BOX_ID,nThisBoxId);
		return 1;
	end;
end;

function get_box_confirm()
	local nNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	if (nNpcIdx == 0 or GetItemCount(hcl[1],hcl[2],hcl[3]) == 0) and GetFreeItemWeight() < STORE_BOX_WEIGHT then 
		Talk(1,"",sNpcName.."S�c ng��i kh�ng th� nh�c n�i r��ng �� n�y ��u. Ph�i bi�t t� l��ng s�c m�nh.");
	else
		get_store_box();
	end
end;

function get_store_box()
	Talk(1,"",sNpcName.."C�m �n �� s� d�ng d�ch v� � ch� ta. H�n g�p l�i! R��ng �� c�a ng��i ��y...")
	SetTask(TASK_BOX_ID,0);
	SetTask(TASK_RETURN_BOX,0);
	DelItem(key[1],key[2],key[3],1);
	AddItem(box[1],box[2],box[3],1);
	Msg2Player("�� g�i tr� th� kh� ch�a kh�a v� nh�n r��ng ��!");
end;

function return_key()
	SetTask(TASK_RETURN_BOX,1);
	TaskTip("Mang ch�a kh�a ��n n�i g�i �� �� tr� th� kh�.");
end;

function on_key_use()
	local tbSay = {
		-- "L�y ��a ch�/getAddress",
		"G�i tr� ch�a kh�a cho th� kh�, chuy�n �� �i/return_key",
		"Tho�t/nothing"
	}
	Say("",getn(tbSay),tbSay)
end;

function getAddress()
	Talk(1,"",format("��a ch� g�i: %s",tBoxKeepers[GetTask(TASK_BOX_ID)]))
end;

function nothing() end;