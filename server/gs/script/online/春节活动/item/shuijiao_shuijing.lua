Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	

TASKVAL_SHENNONGDAN	= 2502		-- ¸ÃÈÎÎñ±äÁ¿±£´æÉñÅ©µ¤µÄÊ£ÓàÊ±¼ä£¨·ÖÖÓ£©
MINGXIANG_TIME 		= 60 -- Ú¤ÏëÊ±¼ä | Unit: minutes

function OnUse()
	local value = GetTask(TASKVAL_SHENNONGDAN) + MINGXIANG_TIME
	if value > 200000000 then --³¬¹ı2ÒÚÉÏÏŞ
		Say("V­ît qu¸ thêi gian giíi h¹n!",1,"§ång ı/no");
		return
	end
	if DelItem(2,1,253,1) == 1 then	
		SetTask(TASKVAL_SHENNONGDAN, value)
		Msg2Player("Thêi gian ThÇn N«ng ®¬n cßn l¹i [" .. value .. "] phót!")
	end
end