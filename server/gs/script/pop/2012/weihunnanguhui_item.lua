Include("\\script\\online\\2012\\qingming\\head.lua")

function OnUse(goods_index)
	if qm_check_date() ~= 1 then
		Talk(1,"", "H·y dïng trong thêi gian cña ho¹t ®éng TiÕt Thanh Minh!");
		return 0;
	end
	--µØÍ¼	
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID ~= 406 then				--ÔÚ°Ý¼ÀµØÍ¼ÓÐÐ§
		Talk(1, "", "T×m ng­êi ch¬i mang theo 1 “Hép tro cèt (N÷ ®éc th©n)” cïng tæ ®éi ®Õn Vò L¨ng S¬n (184, 197) tiÕn hµnh hîp t¸ng");
		return
	end
	if att_X < 1475 - 32 or att_X > 1475 + 32 or att_Y < 3156 - 32 or att_Y > 3156 + 32  then								--×ø±êÏÞÖÆ
		Talk(1,"","T×m ng­êi ch¬i mang theo 1 “Hép tro cèt (N÷ ®éc th©n)” cïng tæ ®éi ®Õn Vò L¨ng S¬n (184, 197) tiÕn hµnh hîp t¸ng")
		return
	end
	
	if gf_JudgeRoomWeight(2, 100, "") ~= 1 then return end; -- ÅÐ¶Ï
	
	if GetTeamSize() == 0 or GetTeamSize() == 1 then --¸öÈËÍê³É
		if GetItemCount(2,95,832) ~= 0 then
			if DelItem(2, 95, 832, 1) ~= 1 then
				WriteLog("Trong ho¹t ®éng TiÕt Thanh Minh 2012, xãa Hép tro cèt (N÷ ®éc th©n) thÊt b¹i");
				return 
			end
			DoAward(8);
		else
			Talk(1, "", "Ng­¬i ch­a lÊy ®­îc Hép tro cèt (N÷ ®éc th©n), kh«ng thÓ tiÕn hµnh hîp t¸ng!");
		end
		return
	elseif GetTeamSize() > 2 then
		Talk(1, "", "Sè ng­êi trong tæ ®éi qu¸ nhiÒu, kh«ng thÓ hoµn thµnh nhiÖm vô.");
		return
	elseif GetTeamSize() == 2 then
		if GetTeamMember(0) ~= PlayerIndex then
			Talk(1, "", "ChØ cã ®éi tr­ëng míi cã thÓ tiÕn hµnh thao t¸c!");
			return
		end
		
		local oldPlayerIndex = PlayerIndex;
		for i = 1,2 do 
			if GetTeamMember(i) ~= oldPlayerIndex then
				PlayerIndex = GetTeamMember(i);
				break;
			end
		end
		if GetItemCount(2, 95, 832) == 0 then
			PlayerIndex = oldPlayerIndex;
			Talk(1, "", "§ång ®éi ch­a cã Hép tro cèt (N÷ ®éc th©n), kh«ng thÓ tiÕn hµnh hîp t¸ng!");
			return
		else
				--¶ÓÓÑ²Ù×÷
				if gf_JudgeRoomWeight(2, 100, "") ~= 1 then return end; -- ÅÐ¶Ï
				
				local nMapID, nMapx, nMapy = GetWorldPos();
				if map_ID ~= 406 or nMapx < 1475 - 32 or nMapx > 1475 + 32 or nMapy < 3156 - 32 or nMapy > 3156 + 32 then
					PlayerIndex = oldPlayerIndex;
					Talk(1, "", "Kho¶ng c¸ch ®ång ®éi qu¸ xa, kh«ng thÓ tiÕn hµnh hîp t¸ng!");
					return
				end
			
				if DelItem(2, 95, 832, 1) ~= 1 then
					WriteLog("Trong ho¹t ®éng TiÕt Thanh Minh 2012, xãa Hép tro cèt (N÷ ®éc th©n) thÊt b¹i");
					return 
				end
				gf_SetLogCaption("[Ho¹t ®éng TiÕt Thanh Minh 2012: Ch­a kÕt h«n]");
				gf_AddItemEx({2,95,1329,1}, "D­¬ng LiÔu Chi", 4);
			PlayerIndex = oldPlayerIndex;
			DoAward(4);
		end
	end
end

function DoAward(nCount)
	if DelItem(2, 95, 831, 1) ~= 1 then
		WriteLog("Trong ho¹t ®éng TiÕt Thanh Minh 2012, xãa Hép tro cèt (Nam ®éc th©n) thÊt b¹i");
		return 
	end
	gf_SetLogCaption("[Ho¹t ®éng TiÕt Thanh Minh 2012: Ch­a kÕt h«n]");
	gf_AddItemEx({2,95,1329,1}, "D­¬ng LiÔu Chi", nCount);
end