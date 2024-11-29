Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
-- http://volam2.zing.vn/su-kien/tan-xuan-dai-cat/mai-vang-nghinh-xuan-281.html
function main()
	local tSay = {}
	print(gf_CheckEventDateEx(81));
	if gf_CheckEventDateEx(81) == 1 then
		tSay = aah_GetSayDialog(81);
	end
	tinsert(tSay, "Mai vµng ®Ñp qu¸!/nothing");
	Say("Mai vµng nghinh xu©n, kim l¨ng ®é h­¬ng, ®©y lµ kho¶n kh¾c th­ëng hoa mïa xu©n ®Ñp nhÊt.", getn(tSay), tSay);
end