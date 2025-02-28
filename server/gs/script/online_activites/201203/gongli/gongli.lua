--2012年4月共力活动
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_201203_KuiZheng_tbMain = "T筰 h� mu鑞 k輈h ho箃 ng Chung S鴆/func_main"

VET_201203_KuiZheng_tbSay = {
	"уng o mu鑞 k輈h ho箃 lo筰 n祇?<color=green>t� i t鑙 thi觰 c� 2 th祅h vi猲 v� nhi襲 nh蕋 l� c� 5 th祅h vi猲; s� lng h� ph竔 c祅g nhi襲 gi秈 thng c祅g t鑤<color>",
	"T筰 h� mu鑞 k輈h ho箃 ho箃 ng Chung S鴆 (mi詎 ph�)/activate_gongli",
	"T筰 h� mu鑞 k輈h ho箃 ho箃 ng Chung S鴆 (ti猽 hao 50 xu/ngi)/activate_gongli_ib",
	"T筰 h� mu鑞 k輈h ho箃 nh薾 thng t鑙 產 ho箃 ng Chung S鴆 ng祔 h玬 nay/activate_daily_final",
	"Kh玭g c莕 u/do_nothing",
}

VET_201203_GongLi_TaskGroup = TaskManager:Create(5,13)
VET_201203_GongLi_TaskGroup.DaySeq = 1
VET_201203_GongLi_TaskGroup.Times1 = 2
VET_201203_GongLi_TaskGroup.Times2 = 3
VET_201203_GongLi_TaskGroup.Tag = 4

VET_201203_EXP_Award_Free = {
	[2] = "1000000",
	[3] = "1050000",
	[4] = "1100000",
	[5] = "1250000",
};
VET_201203_EXP_Award_IB = {
	[2] = "6250000",
	[3] = "6500000",
	[4] = "6750000",
	[5] = "7000000",
};
VET_201203_COIN_FINAL_AWARD  = {
    {3, 3434, 304000, 1},
    {3, 1400, 308000, 1},
    {3, 1200, 354000, 1},
    {3, 1200, 358000, 1},
    {3, 1000, 404000, 1},
    {3, 1000, 408000, 1},
    {3, 616, 464600, 1},
    {3, 150, 1000500, 1},
};


function func_main()
	gf_Say(VET_201203_KuiZheng_tbSay)
end

function activate_gongli()
	--队长
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� c� i trng m韎 c� th� k輈h ho箃 ho箃 ng");
		return 0;
	end
	--队员自身条件
	local nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel();
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(2,"","Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia","Th祅h vi猲<color=green>"..sName.."<color>kh玭g  甶襲 ki謓");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--队伍人数
	local nTeamCount = GetTeamSize();
	if nTeamCount < 2 or nTeamCount > 5 then
		Talk(1,"","T� i t鑙 thi觰 <color=green>2<color> ngi, nhi襲 nh蕋 <color=green>5<color> ngi m韎 頲 k輈h ho箃 ho箃 ng Chung S鴆")
		return 0;
	end
	--天次
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.DaySeq,zgc_pub_day_turn());
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,0);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--是否免费领过
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times1) >= 1 then
			Talk(1,"","M鏸 ng祔 nh薾 ph莕 thng ho箃 ng Chung S鴆 mi詎 ph� t鑙 產 1 l莕");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Th祅h vi猲<color=green>"..sName.."<color>s� l莕 nh薾 thng ho箃 ng Chung S鴆 mi詎 ph� qu� 1 l莕");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--至少两种流派
	local nRouteCount = gf_GetRouteCount();
	if nRouteCount < 2 then 
		Talk(1,"","Trong i t鑙 thi觰 ph秈 c� 2 h� ph竔 kh竎 nhau m韎 c� th� nh薾 thng");
		return 0;
	end
	local nExp = tonumber(VET_201203_EXP_Award_Free[nRouteCount]);
	nOldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times1)+1);
		gf_Modify("Exp",nExp);
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function activate_gongli_ib()
	--队长
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� c� i trng m韎 c� th� k輈h ho箃 ho箃 ng");
		return 0;
	end
	--队员自身条件
	local nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel();
		local sName = GetName();
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia");
			PlayerIndex = nOldPlayerIndex
			Talk(2,"","Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia","Th祅h vi猲<color=green>"..sName.."<color>kh玭g  甶襲 ki謓");
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--队伍人数
	local nTeamCount = GetTeamSize();
	if nTeamCount < 2 or nTeamCount > 5 then
		Talk(1,"","T� i t鑙 thi觰 <color=green>2<color> ngi, nhi襲 nh蕋 <color=green>5<color> ngi m韎 頲 k輈h ho箃 ho箃 ng Chung S鴆")
		return 0;
	end
	--天次
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.DaySeq,zgc_pub_day_turn());
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,0);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--是否领过4次了
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times2) >= 4 then
			Talk(1,"","M鏸 ng莥 nh薾 ph莕 thng ho箃 ng Chung S鴆 thu ph� t鑙 產 l� 4 l莕");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Th祅h vi猲<color=green>"..sName.."<color> s� l莕 nh薾 thng ho箃 ng Chung S鴆  qu� 4 l莕");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--至少2种流派
	local nRouteCount = gf_GetRouteCount();
	if nRouteCount < 2 then 
		Talk(1,"","Trong i t鑙 thi觰 ph秈 c� 2 h� ph竔 kh竎 nhau m韎 c� th� nh薾 thng");
		return 0;
	end	
	--xu数量判断
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2,1,30230) < 50 then
			Talk(1,"","Trong h祅h trang kh玭g  Xu v藅 ph萴<color=green>50<color>c竔");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Th祅h vi猲<color=green>"..sName.."<color>Trong h祅h trang kh玭g  Xu v藅 ph萴<color=green>50<color>c竔")
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex
	local nExp = tonumber(VET_201203_EXP_Award_IB[nRouteCount]);
	nOldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if DelItem(2,1,30230,50) ~= 1 then print("line 198 : gongli.lua error") end
		VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times2)+1);
		gf_Modify("Exp",nExp);
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function activate_daily_final()
	--队长
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� c� i trng m韎 c� th� k輈h ho箃 ho箃 ng");
		return 0;
	end
	--队员自身条件
	local nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel();
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia");
			PlayerIndex = nOldPlayerIndex
			Talk(2,"","Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia","Th祅h vi猲<color=green>"..sName.."<color>kh玭g  甶襲 ki謓");
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--队伍人数
	local nTeamCount = GetTeamSize();
	if nTeamCount < 2 or nTeamCount > 5 then
		Talk(1,"","T閕 i t鑙 thi觰 <color=green>2<color> ngi, nhi襲 nh蕋 <color=green>5<color> ngi m韎 頲 k輈h ho箃 ho箃 ng Chung S鴆")
		return 0;
	end
	--天次
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.DaySeq,zgc_pub_day_turn());
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,0);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--是否领过5次了
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times1) + VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times2) ~= 5 then
			Talk(1,"","M鏸 ng祔 nh薾 thng ho箃 ng Chung S鴆 5 l莕 m韎  甶襲 ki謓 k輈h ho箃 ph莕 thng t鑙 產");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Th祅h vi猲<color=green>"..sName.."<color>S� l莕 nh薾 thng ho箃 ng Chung S鴆 kh玭g  5 l莕");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--至少2种流派
	local nRouteCount = gf_GetRouteCount();
	if nRouteCount < 2 then 
		Talk(1,"","Trong i t鑙 thi觰 ph秈 c� 2 h� ph竔 kh竎 nhau m韎 c� th� nh薾 thng");
		return 0;
	end	
	--是否领取过
	nOldPlayerIndex =PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Tag) ~= 0 then
			Talk(1,"","уng o  nh薾 thng t鑙 產 r錳");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Th祅h vi猲<color=green>"..sName.."<color> nh薾 thng t鑙 產 r錳");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex
	nOldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,1);
		gf_EventGiveRandAward(VET_201203_COIN_FINAL_AWARD,10000,1,"Ho箃 ng Chung S鴆","Ph莕 thng t鑙 產 m鏸 ng祔")
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function do_nothing()
end