--Ѫӡ�һ���
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");

TMain = {};
Talk_1 = {};
Talk_1_1 = {};
Talk_1_2 = {};
Talk_1_3 = {};

TMain.msg = "<color=green>Huy�t �n H�u H� Ph�p<color>: ";
TMain.sel = {
	{"Ta mu�n t�m hi�u danh v�ng Huy�t �n M�n", Talk_1},
	{"Ra kh�i", "nothing",},
};

Talk_1.msg = "<color=green>Huy�t �n H�u H� Ph�p<color>:  ";
Talk_1.sel = {
	{"L�m sao nh�n ���c danh v�ng Huy�t �n M�n?", Talk_1_1},
	{"L�m sao xem danh v�ng Huy�t �n M�n c�a ta?", Talk_1_2},
	{"L�m sao ��i th��ng danh v�ng Huy�t �n M�n?", Talk_1_3},
	{"tr� l�i", TMain},
	{"Ra kh�i", "nothing"}
};

Talk_1_1.msg = "<color=green>Huy�t �n H�u H� Ph�p<color>: Ho�n th�nh <color=green>Huy�t �n M�n Ch�-�u D��ng Huy�t �n<color>";
Talk_1_1.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_2.msg = "<color=green>Huy�t �n H�u H� Ph�p<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n s� th�y ���c t�t c� danh v�ng hi�n t�i c�a b�n th�n.";
Talk_1_2.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

Talk_1_3.msg = "<color=green>Huy�t �n H�u H� Ph�p<color>: Nh�p <color=yellow>ph�m t�t I<color> c� th� m� giao di�n danh v�ng, trong giao di�n nh�p n�t Ph�n th��ng danh v�ng Huy�t �n M�n, s� xu�t hi�n giao di�n ph�n th��ng danh v�ng, nh�p chu�t ��i v�o v�t ph�m mu�n ��i l� ���c!";
Talk_1_3.sel = {
	{"tr� l�i", Talk_1},
	{"Ra kh�i", "nothing"}
}

function main()
	temp_Talk(TMain);
end
