--½Å±¾Ãû³Æ£º°ï»á¹¥³ÇÕ½_×ÊÔ´±£»¤ÈÎÎñ_×ÊÔ´ÔËÊä³µ¶Ô»°º¯Êý
--½Å±¾¹¦ÄÜ£º¶Ô»°º¯Êý£¬´¦Àí°ï»á×ÊÔ´µÄÎÊÌâ¡£
--²ß»®ÈË£ººî¶Ü
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-04-11
--´úÂëÐÞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êý
--=================================¹«¹²±äÁ¿¶¨Òå======================================
	--³Ç½¼¶ÔÓ¦µÄ³ÇÊÐ
	Tb_map_2_city = {}
	Tb_map_2_city[105] = 100
	Tb_map_2_city[108] = 100
	Tb_map_2_city[304] = 300
	Tb_map_2_city[308] = 300
	Tb_map_2_city[218] = 350
	Tb_map_2_city[406] = 350
	--Ïä×ÓNPC¼ÇÂ¼Î»ÖÃ
	--1¡¢¼ÇÂ¼ÊÇ·ñ±»Õ¼ÓÃ
	box_belong_ID = 2				--¸ÃÖµ³õÊ¼»¯Îª0
	--2¡¢ÖÜÐòÊý
	box_open_week_ID = 4			--¸ÃÖµ³õÊ¼»¯Îª0
	--¿ªÊ¼´ò¿ªµÄÊ±¼ä
	box_open_time_ID = 5				--³õÊ¼»¯Îª0
	--NPCË÷Òý¼ÇÂ¼ID
	TasktempID_npc_index = 166
function main()
	local npc_index = GetTargetNpc()
	
	if check_res_protect_condition(1) ~= 1 then
		return
	end
	
	--Ïä×ÓÔÚ±¾ÂÖÊÇ·ñÒÑ¾­±»´ò¿ª
	if GetUnitCurStates(npc_index,box_open_week_ID) >= zgc_pub_day_turn(7) then
		Talk(1,"","<color=green>Chó ý<color>: Tµi nguyªn cña r­¬ng nµy ®· bÞ c­íp ®o¹t!")
		return
	end
	--Ð¡°×²»¿ÉÒÔ¿ªÏä×Ó
	if GetPlayerFaction() == 0 then
		Talk(1,"","<color=green>Chó ý<color>: Ng­êi ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia ho¹t ®éng nµy")
		return
	end
	
	on_enter_res_protect_map()--ÖØÖÃÒ»ÏÂ×ÊÔ´±£»¤×´Ì¬
	
	--Á·¹¦Ä£Ê½²»¿ÉÒÔ²Î¼Ó
	if GetPKFlag() == 0 or GetFightState() == 0 then
		Talk(1,"","<color=green>Chó ý<color>: D¹ng thøc luyÖn c«ng kh«ng thÓ nhËn ®­îc Tµi nguyªn nµy")
		return
	end
	--·ÇÕ½¶·×´Ì¬ÎÞ·¨´ò¿ª
	if GetFightState() == 0 then
		Talk(1,"","<color=green>Chó ý<color>: Tr¹ng th¸i phi chiÕn ®Êu kh«ng thÓ tham gia ho¹t ®éng nµy")
		return
	end
	--±¾°ïÈËÊ¿²»µÃ¿ªÆô±¾°ïµÄÏä×Ó
	local map_id = GetWorldPos()
	if Tb_map_2_city[map_id] == nil then
		return
	end
	local city_belog_name = GetCityWarInfo(Tb_map_2_city[map_id],"base")
	if IsTongMember() ~= 0 and GetTongName() == city_belog_name then
		Talk(1,"","<color=green>Chó ý<color>: Nh©n sÜ cña bæn bang kh«ng thÓ tham gia trang ®o¹t tµi nguyªn nµy")
		return
	end
	--¾àÀëÌ«Ô¶ÎÞ·¨¿ªÆô
	if Zgc_pub_npc_distance() > 10 then
		Talk(1,"","<color=green>Chó ý<color>: Cù ly qu¸ xa, kh«ng thÓ më B¶o r­¬ng")
		return
	end
	--Ïä×ÓÕ¼ÓÐ×´Ì¬ÅÐ¶Ï
	if GetUnitCurStates(npc_index,box_belong_ID) ~= 1 and (GetTime() - GetUnitCurStates(npc_index,box_open_time_ID)) < 11 then
		Talk(1,"","<color=green>Chó ý<color>: ®· cã ng­êi kh¸c ®ang sö dông r­¬ng nµy")
		return
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","<color=green>Chó ý<color>: hµnh trang kh«ng ®ñ 1 « trèng")
		return
	end
	
	--Ìõ¼þ·ûºÏ£¬¿ÉÒÔ¿ªÆôÏä×Ó
		--±êÖ¾×´Ì¬Îª¿ªÆô×´Ì¬
		if SetUnitCurStates(npc_index,box_belong_ID,2) ~= 1 then
			return
		end
		SetUnitCurStates(npc_index,box_open_time_ID,GetTime())
		--±£´æNPCË÷Òý
		SetTaskTemp(TasktempID_npc_index,npc_index)
		--½øÈë½ø¶ÈÌõ¶ÁÈ¡
		DoWait(7,8,10)		
end
	--×ÊÔ´±£»¤Ê±¼äÎªÐÇÆÚÈý
	task_week_seq = 3
	--×ÊÔ´±£»¤¿ªÊ¼Ê±¼äÎª20£º00-21£º00
	task_start_sec_seq = 72000
	task_end_sec_seq = 75600
function conf_res_protect_date_chk()
	--ÊÇ·ñÊÇÐÇÆÚÈý
	local week_seq_now = 0
	week_seq_now = floor((GetTime() - 57600)/86400)
	week_seq_now = num_return - (floor(num_return/7) * 7)
	if week_seq_now >= 2 then
		week_seq_now = week_seq_now - 2
	else
		week_seq_now = week_seq_now + 5
	end
	if week_seq_now ~= task_week_seq then
		return 0
	else
	--ÊÇ·ñÊÇ×ÊÔ´±£»¤Ê±¼ä
		local sec_seq_now = ((GetTime() - 57600) - (floor(sec_num/86400))*86400)
		if sec_seq_now >= task_start_sec_seq and sec_seq_now <= task_end_sec_seq then
			return 1
		else
			return 0
		end		
	end
end

function check_res_protect_condition(bNotify)
	local map_id = GetWorldPos()
	if Tb_map_2_city[map_id] == nil then
		return
	end
	local city_belog_name = GetCityWarInfo(Tb_map_2_city[map_id],"base")
	--ÅÐ¶Ï±¾³ÇÊÇ·ñ±»Õ¼Áì
	if city_belog_name == "" or city_belog_name == nil then
		if bNotify == 1 then
			Talk(1,"","<color=green>Chó ý<color>: TrËn nµy ch­a cã bang ph¸i chiÕm lÜnh thµnh thÞ nµy, kh«ng thÓ më nhiÖm vô b¶o hé Tµi nguyªn tuÇn nµy!")
		end
		return 0
	end
	--µ±Ç°ÊÇ·ñÊÇ¿ªÏä×ÓµÄÊ±¼ä£¿
	if Zgc_pub_week_day() ~= 3 or (Zgc_pub_week_day() == 3 and (Zgc_pub_today_sec_num_rtn() < 72000 or Zgc_pub_today_sec_num_rtn() > 75600))then
		if bNotify == 1 then
			Talk(1,"","<color=green>Chó ý<color>: Thêi gian B¶o hé Tµi nguyªn bang héi chiÕn: mçi tèi <color=yellow>thø T­ <color> tõ <color=yellow>19h<color> ®Õn <color=yellow>20h<color>!")
		end
		return 0
	end
	--Ð¡°×²»¿ÉÒÔ¿ªÏä×Ó
	if GetPlayerFaction() == 0 then
		if bNotify == 1 then
			Talk(1,"","<color=green>Chó ý<color>: Ng­êi ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia ho¹t ®éng nµy")
		end
		return	0
	end
	return 1
end


function on_enter_res_protect_map()
	local map_id = GetWorldPos()
	if Tb_map_2_city[map_id] == nil then
		return
	end
	if check_res_protect_condition(0) == 1 then
	    	SetFightState(1)
	    	local city_belog_name = GetCityWarInfo(Tb_map_2_city[map_id],"base")
	    	if IsTongMember() == 0  then
				local nRan = random(1,2)
				if nRan == 1 then
					SetPKFlag(1,1)
				else
					SetPKFlag(1,2)
				end
				ForbidChangePK(1)
			else
				SetPKFlag(3,2)
				if GetTongName() ~= city_belog_name then --²»ÊÇÊØ³Ç°ï
					ForbidChangePK(1)
				else
					ForbidChangePK(0)
					ForbidChangePK(1)
	    		--SetLogoutRV(1)
			   		SetDeathPunish(1)
					--Talk(1, "", "Nh©n sÜ cña bæn bang kh«ng thÓ tham gia trang ®o¹t tµi nguyªn nµy")
					return 0
				end
			end
	    	ForbidChangePK(1)
	    	--SetLogoutRV(1)
	    	SetDeathPunish(1)
	end
end

function on_leave_res_protect_map()
	SetFightState(0)
	ForbidChangePK(0)
	SetDeathPunish(1)
	SetPKFlag(0,0)
end

function on_player_login()
	CreateTrigger(2, 3003, 3003)
	CreateTrigger(2, 3004, 3004)
	CreateTrigger(2, 3005, 3005)
	CreateTrigger(2, 3006, 3006)
end

--SendScript2VM("\\script\\gongcheng\\npc\\conf_res_protect.lua", "on_player_login()")	
