--filename:xiaonianshou_death.lua
--create date:2006-01-11
--author:yanjun
--describe:小年兽对话脚本
Include("\\script\\online\\春节活动\\newyear_head.lua")	
Include("\\script\\lib\\globalfunctions.lua");
function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	local nTimeNow = GetTime();
	if nTimeNow - GetTask(TASK_GOT_NIANSHOU) >= 3600 then
		if gf_JudgeRoomWeight(1,10) == 1 then
			SetNpcLifeTime(nNpcIndex, 0)
			SetTask(TASK_GOT_NIANSHOU,nTimeNow);
			
			local nRet, nItem = 0, 0;
			nRet, nItem = gf_AddItemEx( {2,1,30002,1,1}, "M藆 t� i h錸g bao" );
			if nRet ~= 0 and nItem ~= nil then
				nRet = gf_setItemExpireDate(nItem, 2008, 2, 29, 24);
				if nRet ~= 1 then
					WriteLog("Th阨 h筺 s� d鬾g M藆 t� i h錸g bao th蕋 b筰: date = 2008, 2, 29, 24");
				end
				WriteLog("[Ho箃 ng n╩ m韎]:"..GetName().."B筺 nh薾 頲 1 M藆 t� i h錸g bao.");
			end
		else
			Msg2Player("Kho秐g tr鑞g trong t骾 h祅h trang kh玭g ");
		end;
	else
		Msg2Player("M鏸 ngi, m鏸 ng祔 ch� c� th� nh蕁 l蕐 m閠 m藆 t� Чi H錸g Bao");
	end;
end