--黑衣人给的解药、黑衣人留下的信件、
--E:\Kingsoft\游戏运行资源\剑侠贰外传\服务端配置文件\GameSvr\script\lib\define.lua
Include("\\script\\lib\\define.lua")

--TASKID_SW_USE_ANTIDOTE  = 3476;
--TASKID_SW_READ_LETTER   = 3477      

tItemInfo = {
	[111] = {"Thu鑓 gi秈 c馻 h綾 y nh﹏",TASKID_SW_USE_ANTIDOTE,"Sau khi d飊g thu鑓 gi秈 do h綾 y nh﹏  l筰, xem ra ch蕋 c  b� ng╪ ch苙 r錳.",1,1},  --{"",taskid,"msg",stateID,ifDelete}
	[113] = {"Th� t輓 do h綾 y nh﹏  l筰",TASKID_SW_USE_ANTIDOTE,"Thi誹 hi謕 hi謓 t筰 tuy  tr髇g k辌h c, nh璶g ch髇g ta 畂竛 r籲g thi誹 hi謕 nh蕋 nh s� quay l筰  t譵 v藅 ph萴 n祔.  t� thi誹 hi謕  gi髉 ch髇g t玦 m� c� quan n猲 m韎 tr髇g c, thu鑓 gi秈 n祔 tuy kh玭g th� ph鬰 h錳 c玭g l鵦, nh璶g c騨g c� th� gi� 頲 m筺g s鑞g. V� 甶襲 tra chuy謓 c鑞g ph萴, v藅 ph萴 trong h閜 ch髇g t玦 s� l蕐 甶,  v鑞 l� l謓h b礽 c馻 <color=green>Li猽 Qu鑓 Ti猽 Thi猲 H鵸<color>, n誹 thi誹 hi謕 v蒼 mu鑞 ti誴 t鬰 甶襲 tra, th� nh� h穣 c萵 th薾!",},	
	}

tItemID1 = 2;
tItemID2 = 96;
function OnUse(nItemIdx)

	local g,d,p = GetItemInfoByIndex(nItemIdx);
	if g ~= tItemID1 or d ~= tItemID2 or not tItemInfo[p] then
		return 0;
	end          
	local tItem =  tItemInfo[p];
	if  tItemInfo[p][5] and  tItemInfo[p][5] == 1  then
		if DelItem(g,d,p,1) ~= 1 then return 0;end;
	end
	if tItem[3] and tItem[1] and tItem[3] ~= "" then
		Talk(1,"",tItem[3])
	end
	if tItem[2] then
		SetTask(tItem[2],1);
	end
	if type(tItem[4]) == "number" then
		RemoveState(tItem[4]);
	end

end