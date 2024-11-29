

function main()
end

function LM_StartTimeGuage(szInfo, nDuration, bRepeat, nCustomID, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID, ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StartTimeGuage(%szInfo,%nDuration,%bRepeat,%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end