Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
-- http://volam2.zing.vn/su-kien/tan-xuan-dai-cat/mai-vang-nghinh-xuan-281.html
function main()
	local tSay = {}
	print(gf_CheckEventDateEx(81));
	if gf_CheckEventDateEx(81) == 1 then
		tSay = aah_GetSayDialog(81);
	end
	tinsert(tSay, "Mai v�ng ��p qu�!/nothing");
	Say("Mai v�ng nghinh xu�n, kim l�ng �� h��ng, ��y l� kho�n kh�c th��ng hoa m�a xu�n ��p nh�t.", getn(tSay), tSay);
end