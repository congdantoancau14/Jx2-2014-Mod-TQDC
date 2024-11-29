Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\lib\\globalfunctions.lua")
THOIHANNHAPQUOCTICH = 1
TB_NATION_SERVERLIST =
{
	{1, "B�ch H�"},
	{150,"Li�n ��u Local"},
	{151,"Li�n ��u 1"},
	{152,"Li�n ��u 2"},
	{153,"Li�n ��u 3"},
	{154,"Li�n ��u 4"},
	{155,"Li�n ��u 5"},
	{156,"Li�n ��u 6"},
	{157,"Li�n ��u 7"},
	{158,"Li�n ��u 8"},
}

function change_nationality()
	local nDate = tonumber(date("%Y%m%d"))
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	
	if tbGioiHanNhapQuocTich[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanNhapQuocTich[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","Ch�a ��n th�i gian ��ng k� nh�p qu�c, ng��i h�y quay l�i sau nh�.")
			return 0
		end
	end
	
	local tHead = format("%s Ng��i mu�n gia nh�p <color=yellow>%s qu�c<color> ph�i kh�ng?", g_szInfoHeader, szNation)
	local tSay =
	{
		"V�n b�i ��ng � gia nh�p b�n qu�c, xin h�y t�u v�i Ho�ng Th��ng/reg_change_nationality",
		"�� �� "..THOIHANNHAPQUOCTICH.." ng�y, xin cho v�n b�i gia nh�p b�n qu�c/confirm_change_nationality",
		"Ta mu�n suy ngh� l�i/do_nothing",
	}
	Say(tHead,getn(tSay),tSay);
end

function reg_change_nationality()
	local nCurNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR)
	local nNewNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW)
	local nServerNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local szServerNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	
	if nCurNationality == nServerNation then
		Talk(1,"",format("%s Ng��i �� l� th�n d�n c�a <color=yellow>%s qu�c<color> r�i, kh�ng c�n ph�i ��ng k� n�a!",g_szInfoHeader, szServerNation))
		return
	end
	if nNewNationality == nServerNation then
		Talk(1,"",format("%s Ng��i �� ��ng k� gia nh�p <color=yellow>%s qu�c<color> r�i, kh�ng c�n ph�i ��ng k� n�a!", g_szInfoHeader, szServerNation))
		return
	end
	
	gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW, nServerNation)
	SetTask(TSK_SERVER_ID_TIME, GetTime())
	Talk(1,"",format("%s Ch�c m�ng ng��i �� ��ng k� gia nh�p <color=yellow>%s qu�c<color>. Sau <color=yellow>"..THOIHANNHAPQUOCTICH.." ng�y<color> h�y ��n g�p ta �� x�c nh�n gia nh�p.", g_szInfoHeader,szServerNation))
end

function confirm_change_nationality()
	local nRegTime = GetTask(TSK_SERVER_ID_TIME)
	local nCurNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR)
	local nNewNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW)	
	local nServerNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local szServerNation = get_nationality_name(nServerNation)
	local nDay, nHour, nMin = get_waiting_time(GetTask(TSK_SERVER_ID_TIME))
	
	if nCurNationality == nServerNation then
		Talk(1,"",format("%s Ng��i �� l� th�n d�n c�a <color=yellow>%s qu�c<color> r�i, kh�ng c�n ph�i ��ng k� n�a!", g_szInfoHeader,szServerNation))
		return
	end
	if nNewNationality ~= nServerNation then
		Talk(1,"",g_szInfoHeader.."Ng��i ch�a ��ng k� gia nh�p n�n kh�ng th� x�c nh�n!")
		return
	end
	if nDay >= 0 and nHour >= 0 and nMin > 0 then
		Talk(1,"",format("%s Th�i gian �� x�c nh�n gia nh�p c�n <color=yellow>%d ng�y %d gi� %d ph�t<color>. H�y quay tr� l�i �� x�c nh�n sau.", g_szInfoHeader, nDay, nHour, nMin))
		return
	else
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, nServerNation)
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW, 0)
		SetTask(TSK_SERVER_ID_TIME, 0)
		Talk(1,"",format("%s T� gi� tr� �i ng��i l� th�n d�n c�a <color=yellow>%s qu�c<color>, xin ch�c m�ng!", g_szInfoHeader, szServerNation))
		return
	end
end

function get_nationality_name(nID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if TB_NATION_SERVERLIST[i][1] == nID then
			return TB_NATION_SERVERLIST[i][2]
		end
	end	
	return ""
end

function get_waiting_time(nRegTime)
	nCurTime = GetTime()
	nDif = THOIHANNHAPQUOCTICH*86400 - nCurTime + nRegTime
	nDay = floor(nDif/86400)
	nHour = floor(mod(nDif, 86400) / 3600)
	nMin = floor(mod(mod(nDif, 86400), 3600) / 60)

	return nDay, nHour, nMin
end

function do_nothing()

end