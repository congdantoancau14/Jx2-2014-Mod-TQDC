-- =====================================================
-- ¶¨Ê±°ÑËÄÎ»ÉñÏÉnpc·Åµ½Ëæ»úÎ»ÖÃµÄ½Å±¾
-- =====================================================
g_nTotalNpcCount = 4;	--NPC×ÜÊı
g_nTotalCityCount = 13;	--³ÇÊĞ×ÜÊı
g_nLastNpcIdx = 0;		--ÉÏ´ÎË¢µÄNPCµÄ±àºÅ£¬³õÊ¼ÖµÊÇ0
g_nLastCityIdx = 1;		--ÉÏ´ÎË¢NPCµÄ³ÇÊĞµÄ±àºÅ£¬³õÊ¼ÖµÊÇ1
g_nInterValTime = 15;	--´¥·¢µÄ¼ä¸ôÊ±¼ä
-- ¶¨Ê±Éè¶¨
function TaskShedule()
	-- ÈÎÎñÃû×Ö
	TaskName("Open IB: Tø Tinh Gia Hû")
	
	-- 15·ÖÖÓ´¥·¢Ò»´Î
	TaskInterval(g_nInterValTime)
	
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"))
	nMin = mod((floor(nMin/g_nInterValTime)+1)*g_nInterValTime,60)
	if nMin == 0 then
		nHour = nHour + 1; --Èç¹ûÔÚxµã48·ÖÆô¶¯µÄ»°£¬ÄÇÃ´¾ÍÔÚx+1µã0·Ö´´½¨NPC
	end;
	--RelayÆô¶¯ºóÏÂÒ»¸öquarterÖ´ĞĞ
	TaskTime(nHour, nMin)

	-- ÖØ¸´Ö´ĞĞÎŞÏŞ´ÎÊı
	TaskCountLimit(0)
	
	local msg = "Open IB: Ho¹t ®éng Tø Tinh Gia Hû, Thêi gian t¹o NPC lÇn 1 lµ"..nHour.." giê "..nMin.." Phót "
	OutputMsg(format(msg))
end;

-- ¶¨Ê±Ö´ĞĞµÄÄÚÈİ
function TaskContent()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 070415 and nDate < 070601 then
		local nNpcIdx,nCityIdx = get_next_npc_city(g_nLastNpcIdx,g_nLastCityIdx)
		local msg=nNpcIdx.."ThÇn tiªn xuÊt hiÖn t¹i"..nCityIdx.."B¶n ®å sè"
		OutputMsg(format(msg))
		g_nLastNpcIdx = nNpcIdx;
		g_nLastCityIdx = nCityIdx;
		GlobalExecute(format("dw Create_SiXing_IB_OB(%d,%d)", nNpcIdx,nCityIdx))
	end
end;

function get_next_npc_city(nCurNpcIdx,nCurCityIdx)
	local nNextNpcIdx,nNextCityIdx = 0,0;
	nNextNpcIdx = mod(nCurNpcIdx,g_nTotalNpcCount)+1;
	local nRand = random(2,g_nTotalCityCount);
	nNextCityIdx = mod(nCurCityIdx+nRand-2,g_nTotalCityCount)+1;
	return nNextNpcIdx,nNextCityIdx;
end;


