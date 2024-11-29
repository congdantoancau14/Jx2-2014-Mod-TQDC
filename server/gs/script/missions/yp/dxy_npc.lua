--���ص�����

Include("\\script\\missions\\yp\\award.lua");

tNpcName = {
	{"<color=green>�o�n T�m Di<color>: ","Tr�n ng��i m�t th�m c�a Thi�n �m Gi�o v�a b�t ���c, ch�ng t�i ph�t hi�n ���c b�n �� ch� n�i ch�n kho b�u, qu�c kh� c�a b�n t�c �ang tr�ng r�ng, ��i hi�p c� th� ��a ta ��n �� kh�ng?","��i hi�p h�y mang theo T�ng B�o �� ��n <color=yellow>Qu�nh K�t ho�c H�ng Kh�nh<color>, xem th� c� t�m ���c g� kh�ng!","��i hi�p c� t�m ���c v�t ph�m qu� � <color=yellow>Qu�nh K�t ho�c H�ng Kh�nh<color> kh�ng?"},
	{"<color=green>��t T�y �ng T�c<color>: ","Tr�n ng��i m�t th�m c�a Thi�n �m Gi�o v�a b�t ���c, ch�ng t�i ph�t hi�n ���c b�n �� ch� n�i ch�n kho b�u, qu�c kh� c�a b�n t�c �ang tr�ng r�ng, ��i hi�p c� th� ��a b�n t�ng ��n �� kh�ng?","��i hi�p h�y mang theo T�ng B�o �� ��n <color=yellow>H�ng Kh�nh ho�c Thi�n Long T�<color>, xem th� c� t�m ���c g� kh�ng!","��i hi�p c� t�m ���c v�t ph�m qu� � <color=yellow>H�ng Kh�nh ho�c Thi�n Long T�<color> kh�ng?"},	
	{"<color=green>L� ��c Kh�nh<color>: ","Tr�n ng��i m�t th�m c�a Thi�n �m Gi�o v�a b�t ���c, ch�ng t�i ph�t hi�n ���c b�n �� ch� n�i ch�n kho b�u, qu�c kh� c�a b�n t�c �ang tr�ng r�ng, ��i hi�p c� th� ��a b�n t��ng qu�n ��n �� kh�ng?","��i hi�p h�y mang theo T�ng B�o �� ��n <color=yellow>Qu�nh K�t ho�c Thi�n Long T�<color>, xem th� c� t�m ���c g� kh�ng!","��i hi�p c� t�m ���c v�t ph�m qu� � <color=yellow>Qu�nh K�t ho�c Thi�n Long T�<color> kh�ng?"},
};

function main()
	local nMapID = GetWorldPos()
	local nType = 0;
	for i = 1, getn(tMainMapID) do
		if tMainMapID[i][1] == nMapID then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 or tMainMapID[nCamp][1] ~= nMapID then
		Talk(1,"",g_NpcName.."Ta gi�p ���c g� cho ��i hi�p?");
		return 0;
	end
	local strtab = {
		"Kho b�u b� m�t (Ti�u hao 10 �i�m tinh l�c)/#dxy_talk_1("..nType..")",
		"Gi�i thi�u chi ti�t/#dxy_talk_2("..nType..")",
		"Kh�ng c� vi�c g�!/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2],
		getn(strtab),
		strtab)
end

function dxy_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = GetTask(TASK_FIELD_PVP_TREASURE);
	if nState == 2 then
--		if DelItem(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4],3) == 1 then
			
			--------------------------
			--������
			if yp_aw_giveAward_13() > 0 then
				SetTask(TASK_FIELD_PVP_TREASURE,0);
				Talk(1,"",g_NpcName.."�a t� ��i hi�p! ��y l� qu� t�ng, h�y nh�n l�y!");
			end
			--------------------------
			
--		else
			
--		end
	elseif nState == 1 then
		Talk(1,"",g_NpcName..tNpcName[nType][4]);
	else
		if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
			return 0;
		end
		local nJlz = yp_getValue(3);
		if nJlz < 10 then
			Talk(1,"",g_NpcName.."�i�m tinh l�c c�a ��i hi�p kh�ng ��!");
			return 0;
		end
		yp_setValue(3,-10);
		SetTask(TASK_FIELD_PVP_TREASURE,1);
		gf_AddItemEx({tPVPItemInfo[8][2],tPVPItemInfo[8][3],tPVPItemInfo[8][4],1},tPVPItemInfo[8][1]);
		Talk(1,"",g_NpcName..tNpcName[nType][3]);
	end
end

function dxy_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(1,"main",g_NpcName.."��i hi�p c� th� mang theo T�ng B�o �� ��n khu v�c ch� ��nh, c�n c� theo ch� th� c�a T�ng B�o �� �� t�m b�o �� kho�ng c�ch g�n nh�t.\n    Khi ��i hi�p x�c ��nh ���c ��a �i�m, s� c� th� ��o kho b�u.\n    ��i hi�p h�y mau �i t�m kho b�o ch�n d��i l�ng ��t n�o!")
end