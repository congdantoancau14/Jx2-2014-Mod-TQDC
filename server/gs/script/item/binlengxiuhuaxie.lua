
Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItem)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch­a hoµn thµnh nhiÖm vô phôc sinh ®ång hµnh, t¹m thêi kh«ng thÓ më!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("Sè l­îng b¹n ®ång hµnh hiÖn t¹i v­ît qu¸ 5");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		AddPet(34);
		Msg2Player(format("Ng­¬i nhËn ®­îc [%s] b¹n ®ång hµnh", "B¨ng N÷"));
	end
end

-- --Ã¿¸ö°üµÄ¹Ì¶¨½±ÀøÈçÏÂ
-- --4±¾ÊµÕ½ĞÄµÃ
-- --20µãÊ¦ÃÅ¹±Ï×¶È
-- --1¸ö±¦Ê¯°ü¹ü
-- --Ã¿¸ö°üµÄËæ»ú½±ÀøÈçÏÂ
-- --1¸öÏû½ÙÉ¢¡ª¡ª10%£¨Ã¿¿ª5¸ö°ü±ØµÃ£©
-- --1¸öÅÍÁúèµ¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
-- --1¿ÅËæ»ú6¼¶ÁéÊ¯¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
-- --1ÕÅ7¼¶ÁéÊ¯Åä·½¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
-- --50¸öÌ«Ò×»ìÔª¹¦Í¼¼ø£¨2,0,1082£©¡ª¡ª99¼¶Ã¿¿ª20¸ö°ü±ØµÃ
-- --3±¾Ê¦ÃÅ¸ß¼¶ÃØ¼®¡ª¡ªÃ¿¿ª40¸ö°ü±ØµÃ
-- --1¸öÑ×»ÆÌú»ê¡ª¡ªÃ¿¿ª100¸ö°ü±ØµÃ
-- Include("\\script\\lib\\lingshi_head.lua");
-- Include("\\script\\lib\\globalfunctions.lua");
-- TSK_USE_GLORY_BAG_TIME = 593;

-- function OnUse(nItemIdx)
	-- use(nItemIdx);
-- end;

-- function use(nItemIdx)
	-- if gf_JudgeRoomWeight(11,150,"") == 1 then
		-- if DelItemByIndex(nItemIdx,1) == 1 then
			-- get_item();
		-- end;
	-- end;
-- end;

-- function get_item()
	-- Say("File bŞ xãa, ®ang cè t×m vµ kh«i phôc l¹i! Path: script\/item\/binlengxiuhuaxie.lua")
-- end;

-- function nothing()

-- end;