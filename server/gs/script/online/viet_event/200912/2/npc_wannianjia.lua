--=============================================
--create by baiyun 2009.11.18
--describe:越南版12月份活动 万年家NPC脚本文件
--============================================
--
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
-- Added 10/08/2020
Include("\\script\\online_activites\\2014_01\\spring1.lua") 
Include("\\script\\online_activites\\2014_01\\valentine.lua")
Include("\\script\\online_activites\\2014_01\\spring2.lua")

function main()
	local tbDialog = {};
	if gf_CheckEventDateEx(VET_201401_SPRING1_ACTIVITYID) ==  1 then
	tinsert(tbDialog,VET_201401_SPRING1_MAIN);
	end
	if gf_CheckEventDateEx(VET_201401_VALENTINE_ACTIVITYID) ==  1 then
		tinsert(tbDialog,VET_201401_VALENTINE_MAIN);
	end
	if gf_CheckEventDateEx(VET_201401_SPRING2_ACTIVITYID) ==  1 then
		tinsert(tbDialog,VET_201401_SPRING2_MAIN);
	end
	tinsert(tbDialog,"V筺 ni猲 gia h秓!/nothing");
 	Say("<color=green>V筺 ni猲 gia<color>: Ni猲 ni猲 h秓 v薾!", getn(tbDialog), tbDialog);
 	
end



function nothing()

end
