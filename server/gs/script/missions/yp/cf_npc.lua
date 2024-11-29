--³µ·ò
Include("\\script\\missions\\yp\\yp_head.lua")

function main()
	local strNpcName = GetTargetNpcName();
	if strNpcName == "Thñ Khè" then
		OpenBox()
		EnableBoxLock(1)
	elseif strNpcName == "Chñ D­îc ®iÕm" then
		Sale(30)
	elseif strNpcName == "Xa phu" then
		local strtab = {};
		local m = GetWorldPos()
		if m == 6300 then
			local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
			for i = 1,3 do
				if g_nDebugVersion==1 or nCamp == 0 or i == nCamp then
					tinsert(strtab,"§Õn "..tMainMapID[i][2].."/#cf_talk_1("..i..")")
					break;
				end
			end
			tinsert(strtab,"Trë vÒ Vâ L©m Minh/cf_leave");
			tinsert(strtab,"KÕt thóc ®èi tho¹i/nothing");
		else
			strtab = {
				"Trë vÒ Vâ L©m Minh/cf_leave",
				"KÕt thóc ®èi tho¹i/nothing",
			};
		end
		Say("<color=green>Tª Lîi Ca<color>: §¹i hiÖp muèn ®i ®©u? MiÔn phÝ nhÐ!",
			getn(strtab),
			strtab)
	elseif strNpcName == "Xa Phu T©y Vùc" then
		strtab = {
			"§Õn ThÊt L¹c Nhai/cf_talk_4",
			"KÕt thóc ®èi tho¹i/nothing",
		};
		Say("<color=green>Xa Phu T©y Vùc<color>: Ta cã thÓ nhanh chãng ®­a ng­¬i ®Õn ThÊt L¹c Nhai. MiÔn phÝ nhÐ!",
			getn(strtab),
			strtab)		
	end
end

function cf_leave()
	SetDeathPunish(1)
	NewWorld(425,1746,3197);	
end

function cf_talk_1(nType)
	if nType == 1 then
		cf_enter_1();
	elseif nType == 2 then
		cf_enter_2();
	elseif nType == 3 then
		cf_enter_3();
	end
end

function cf_enter_1()
	SetPlayerScript("\\script\\missions\\yp\\tls\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","enter()");
end

function cf_enter_2()
	SetPlayerScript("\\script\\missions\\yp\\hss\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","enter()");
end

function cf_enter_3()
	SetPlayerScript("\\script\\missions\\yp\\mm\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","enter()");
end

function cf_talk_4()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"","<color=green>Xa Phu T©y Vùc<color>: ThiÕu hiÖp h·y gia nhËp thÕ lùc råi h·y quay l¹i nhÐ!");
		return 0;
	end
	if GetPKValue() >= 10 then
		Talk(1,"","<color=green>Xa Phu T©y Vùc<color>: C¸c h¹ s¸t khÝ qu¸ nÆng (PK#10), nÕu vµo T©y Vùc e r»ng sÏ cã häa s¸t th©n, ®Ò nghÞ c¸c h¹ h·y tÈy trõ s¸t khÝ (Sö dông Tiªu KiÕp T¸n ®Ó gi¶m trÞ PK), ®Ó tr¸nh tai häa khi vµo T©y Vùc.");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","<color=green>Xa Phu T©y Vùc<color>: §¹i hiÖp h·y rêi ®éi råi vµo tiÕp!");
		return 0;
	end
--	LeaveTeam();
	SetPlayerScript("\\script\\missions\\yp\\qmy\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","enter()");	
end