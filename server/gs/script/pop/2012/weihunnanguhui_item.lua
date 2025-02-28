Include("\\script\\online\\2012\\qingming\\head.lua")

function OnUse(goods_index)
	if qm_check_date() ~= 1 then
		Talk(1,"", "H穣 d飊g trong th阨 gian c馻 ho箃 ng Ti誸 Thanh Minh!");
		return 0;
	end
	--地图	
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID ~= 406 then				--在拜祭地图有效
		Talk(1, "", "T譵 ngi ch琲 mang theo 1 揌閜 tro c鑤 (N� c th﹏)� c飊g t� i n V� L╪g S琻 (184, 197) ti課 h祅h h頿 t竛g");
		return
	end
	if att_X < 1475 - 32 or att_X > 1475 + 32 or att_Y < 3156 - 32 or att_Y > 3156 + 32  then								--坐标限制
		Talk(1,"","T譵 ngi ch琲 mang theo 1 揌閜 tro c鑤 (N� c th﹏)� c飊g t� i n V� L╪g S琻 (184, 197) ti課 h祅h h頿 t竛g")
		return
	end
	
	if gf_JudgeRoomWeight(2, 100, "") ~= 1 then return end; -- 判断
	
	if GetTeamSize() == 0 or GetTeamSize() == 1 then --个人完成
		if GetItemCount(2,95,832) ~= 0 then
			if DelItem(2, 95, 832, 1) ~= 1 then
				WriteLog("Trong ho箃 ng Ti誸 Thanh Minh 2012, x鉧 H閜 tro c鑤 (N� c th﹏) th蕋 b筰");
				return 
			end
			DoAward(8);
		else
			Talk(1, "", "Ngi ch璦 l蕐 頲 H閜 tro c鑤 (N� c th﹏), kh玭g th� ti課 h祅h h頿 t竛g!");
		end
		return
	elseif GetTeamSize() > 2 then
		Talk(1, "", "S� ngi trong t� i qu� nhi襲, kh玭g th� ho祅 th祅h nhi謒 v�.");
		return
	elseif GetTeamSize() == 2 then
		if GetTeamMember(0) ~= PlayerIndex then
			Talk(1, "", "Ch� c� i trng m韎 c� th� ti課 h祅h thao t竎!");
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
			Talk(1, "", "уng i ch璦 c� H閜 tro c鑤 (N� c th﹏), kh玭g th� ti課 h祅h h頿 t竛g!");
			return
		else
				--队友操作
				if gf_JudgeRoomWeight(2, 100, "") ~= 1 then return end; -- 判断
				
				local nMapID, nMapx, nMapy = GetWorldPos();
				if map_ID ~= 406 or nMapx < 1475 - 32 or nMapx > 1475 + 32 or nMapy < 3156 - 32 or nMapy > 3156 + 32 then
					PlayerIndex = oldPlayerIndex;
					Talk(1, "", "Kho秐g c竎h ng i qu� xa, kh玭g th� ti課 h祅h h頿 t竛g!");
					return
				end
			
				if DelItem(2, 95, 832, 1) ~= 1 then
					WriteLog("Trong ho箃 ng Ti誸 Thanh Minh 2012, x鉧 H閜 tro c鑤 (N� c th﹏) th蕋 b筰");
					return 
				end
				gf_SetLogCaption("[Ho箃 ng Ti誸 Thanh Minh 2012: Ch璦 k誸 h玭]");
				gf_AddItemEx({2,95,1329,1}, "Dng Li評 Chi", 4);
			PlayerIndex = oldPlayerIndex;
			DoAward(4);
		end
	end
end

function DoAward(nCount)
	if DelItem(2, 95, 831, 1) ~= 1 then
		WriteLog("Trong ho箃 ng Ti誸 Thanh Minh 2012, x鉧 H閜 tro c鑤 (Nam c th﹏) th蕋 b筰");
		return 
	end
	gf_SetLogCaption("[Ho箃 ng Ti誸 Thanh Minh 2012: Ch璦 k誸 h玭]");
	gf_AddItemEx({2,95,1329,1}, "Dng Li評 Chi", nCount);
end