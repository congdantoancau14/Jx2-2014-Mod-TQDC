--function main()
--	Talk(1,"","<color=green>擂台老板<color>：各路英雄好汉，洒家在这里摆个台子，换点酒钱，是会家子的就上来耍两路，捧个台场；不会的就在下面呆着，捧个人场。")
--end;

Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--引用字符串处理支持
Include("\\script\\lib\\offline_head.lua");
Include("\\script\\missions\\bw\\siege\\siege_arena_mission.lua")

function main()
--	Talk(1,"","<color=green>擂台老板<color>：擂台暂时被关闭了。");
--	return
    --设置返回点
    if IsFreeze() == 1 then  --如果用WG被封
        Talk(1,"","<color=yellow>Kh玭g th� v祇 l玦 i! T礽 kho秐 n祔 產ng b� x� l�! <color>");
        return
    end;
	
	x,y,z = GetWorldPos();
	SetTask(MS_POS, x);
	SetTask(MS_POS+1, y);
	SetTask(MS_POS+2, z);
	
	if x == 150 then    --扬州
	    Talk(1,"","Tri襲 nh 產ng t� ch鴆 v� l﹎ i h閕 � n琲 n祔! Anh h飊g h祇 ki謙 xin ch� b� qua!");
	    return
	elseif x == 350 then    -- 襄阳
	    Talk(1,"","Tri襲 nh 產ng t� ch鴆 v� l﹎ i h閕 � n琲 n祔! Anh h飊g h祇 ki謙 xin ch� b� qua!");
	    return
	end;
	
	if (GetTaskTemp(JOINROOMINDEX)>0) then
	    OnChanceRoom(GetTaskTemp(JOINROOMINDEX));
	    return
	end;
	
	--查询有效场地对话
	SelectGameStyle()
	
end

function SelectGameStyle()

	local strSelect = {
		"Кn u L玦 i/#SearchValidRoom(1)",
		"T� i i chi課 L玦 i/#SearchValidRoom(2)",
		"H鏽 chi課 n u L玦 i/#SearchValidRoom(3)",
		"T� i h鏽 chi課 l玦 i/#SearchValidRoom(4)",
		"L玦 i t cc/#SearchValidRoom(5)",
		"Nh薾 t� c竎h c玭g th祅h/talk_to_npc",
		"Thuy誸 minh quy t綾/GameRuleTalk",
		"R阨 kh醝/OnCancel_Talk"
		};
		
	Say("<color=green>Ch� l玦 i<color>: L玦 i l� n琲 c竎 anh h飊g h秓 h竛 t� v�, lo筰 h譶h thi u chia th祅h 4 lo筰 <color=yellow>Кn u l玦 i<color>, <color=yellow>T� i i chi課<color>, <color=yellow>Кn u h鏽 chi課<color> v� <color=yellow>T� i h鏽 chi課<color>. Xin h穣 ch鋘 h譶h th鴆 thi u: ",
		getn(strSelect),
		strSelect
		);

end

function SearchValidRoom(nType)

local nMapId = GetWorldPos();

	--选择 个人单挑擂台 场地
	if nType == 1 then
		local room_num = 0;
    local room_tab = {}
    local szSay = "";
    
    for index, value in MapTab do
        room_tab[index] = 0
        if nMapId == value[2] then
    	    idx = SubWorldID2Idx(value[1]);
    	    if (idx~=-1) then
                room_num = room_num+1;
                room_tab[index] = 1;
    	    end;
    	end;
    end;

    if room_num > 0 and room_num <= MAX_ROOM_COUNT then
        szSay = "Say("..format("%q","<color=green>Ch� l玦 i<color>: N琲 y l� u trng n u l玦 i cho c竎 Nh﹏ s� giang h� tham gia n u t� th�. Hi謓 c� t鎛g c閚g: "..room_num.." tr薾 a. C竎 h� h穣 ch鋘 tr薾 a mu鑞 v祇!<color=yellow>");
        szSay = szSay..","..(room_num+1);   --为了最后加上的退出选项
        for index, value in room_tab do
            if value == 1 then
                szSay = szSay..","..format("%q", MapTab[index][3].."/#OnChanceRoom("..index..")");
            end;
        end;
        szSay = szSay..","..format("%q", "R阨 kh醝/OnCancel_Talk")..")";
        dostring(szSay);
    elseif room_num > MAX_ROOM_COUNT then
        ErrorMsg(12);
    else
        ErrorMsg(2);
    end
    return
   end

	--选择 组队单挑擂台 场地
	if nType == 2 then
		local room_num = 0;
    local room_tab = {}
    local szSay = "";
    local nMapIdx = 0;
    local nMapState = 0;
    local nCaptainName_1 = "";
    local nCaptainName_2 = "";
    local nTeamSize_1 = 0;
    local nTeamSize_2 = 0;
    local nPlayerMSIndex = 0;
    local nCamp = 0;
    
    for i=1,getn(SingleTeamMapTab) do
      room_tab[i] = 0;
      if nMapId == SingleTeamMapTab[i][2] then
    	  nMapIdx = SubWorldID2Idx(SingleTeamMapTab[i][1]);
    	  if nMapIdx ~= -1 then
          room_num = room_num+1;
          room_tab[i] = 1;
    	  end
    	end
    end
    
    szSay = "Say("..format("%q","N琲 y c� t� i i chi課 l玦 i gi鱝 <color=yellow>2 i ng�<color> th� luy謓 t� v�. Ch� c莕 i ng� c� <color=yellow>2 ngi tr� l猲<color> do <color=yellow>чi trng b竜 danh<color> l� c� th� tham gia. Hi謓 t筰 m� t鎛g c閚g <color=yellow>"..room_num.." tr薾 a<color> cho c竎 giang h� hi謕 kh竎h t� th�. C竎 h� h穣 ch鋘 tr薾 a mu鑞 v祇!");
    szSay = szSay..","..(room_num+1);   --为了最后加上的退出选项
    
    for i=1,getn(room_tab) do
   		if room_tab[i] == 1 then
   			OldWorld = SubWorld;
   			SubWorld = SubWorldID2Idx(SingleTeamMapTab[i][1]);
   			if SubWorld ~= -1 then
   				nMapState = GetMissionV(TEAM_GAME_STATE);
   				local strTemp = "[Gi秈 t cc]";
					if GetMissionV(MS_YAJING_NUM) <= 0 then
						strTemp = "";
					end
   				--场地没有人
   				if nMapState == 0 then
   					szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(Tr筺g th竔: b� tr鑞g)/#OpenSingleTeamRoomRequest("..i..")");
   				elseif nMapState == 1 then	
   					--已有两支队伍
   					if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
   						OldPlayer = PlayerIndex;				
   						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
   						if PlayerIndex > 0 then
   							nCaptainName_1 = gf_GetCaptainName();
   							nTeamSize_1 = gf_GetTeamSize();
   						end
   						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
   						if PlayerIndex > 0 then
   							nCaptainName_2 = gf_GetCaptainName();
   							nTeamSize_2 = gf_GetTeamSize();
   						end
   						PlayerIndex = OldPlayer;
   						szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr筺g th竔: ьi khai chi課, hai phe i chi課 l� i "..nCaptainName_1.." v� i "..nCaptainName_2.." )/#OpenSingleTeamRoom("..i..")");
   					--已有一支队伍，等待其他队伍加入
   					elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
   						if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 then
   							nCamp = 1;
   						else
   							nCamp = 2;
   						end
   						OldPlayer = PlayerIndex;
   						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,nCamp);
   						if PlayerIndex > 0 then
   							nCaptainName_1 = gf_GetCaptainName();
   							nTeamSize_1 = gf_GetTeamSize();
   						end
   						PlayerIndex = OldPlayer;
   						szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr筺g th竔: ьi thi u, tin t鴆 i ng�:"..nCaptainName_1..", c� "..nTeamSize_1.." ngi.)/#OpenSingleTeamRoom("..i..")");
   					end
   				--比赛已经开始
   				elseif nMapState == 2 then
   					OldPlayer = PlayerIndex;
   					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
   					if PlayerIndex > 0 then
   						nCaptainName_1 = gf_GetCaptainName();
   						nTeamSize_1 = gf_GetTeamSize();
   					end
   					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
   					if PlayerIndex > 0 then
   						nCaptainName_2 = gf_GetCaptainName();
   						nTeamSize_2 = gf_GetTeamSize();
   					end
   					PlayerIndex = OldPlayer;
   					szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr筺g th竔: ng thi u, hai phe i chi課 l� i "..nCaptainName_1.." v� i "..nCaptainName_2.." )/#OpenSingleTeamRoom("..i..")");
   				elseif nMapState == 3 then
   					szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr筺g th竔: Thi u k誸 th骳)/#GameOverTalk");
   				end
   			end   			
   			SubWorld = OldWorld;	   					
   		end 			
   	end
   	szSay = szSay..","..format("%q", "R阨 kh醝/OnCancel_Talk")..")";
   	dostring(szSay);
		return
	end
	
	--选择 个人混战擂台 场地
	if nType == 3 then
		local multi_room_num = 0;
    local multi_room_tab = {};--存放满足地图条件的MultiMapTab的index的位置
    local i=0;
    local j=1;
    local nRandomNum = 0;
    local multiroom_book_tab = {};--存放满足地图数量和预定条件的MultiMapTab的index的位置
    local multiroom_nobook_tab = {};--存闲置的MultiMapTab的index的位置
    local nMapBookState = 0;
    local nFighterNum = 0;
    local nAudienceNum = 0;
    local nMapState = 0;
    local lacknum = 0;
    local hundred_room_tab = {};
    local szSay = "";
    local room_num = 0;
    
    --获取多人擂台场地数量
    for i=1,getn(MultiMapTab) do
    	if MultiMapTab[i][2] == nMapId then
    		multi_room_tab[j] = i
    		j=j+1
    		multi_room_num = multi_room_num + 1
    	end
    end
     
    --判断当前多人擂台场地状态		
    for i=1,multi_room_num do
    	OldSubWorld = SubWorld;
    	SubWorld = SubWorldID2Idx(MultiMapTab[multi_room_tab[i]][1]);
    	
    	if SubWorld <= 0 then
				WriteLog("[Qu莕 h飊g chi課]T譶h h譶h u trng hi謓 t筰 SubWorld b竜 l鏸, b竜 l鏸 nMapIndex l�"..MultiMapTab[multi_room_tab[i]][1]..", SubWorld l�"..SubWorld..".");
				SubWorld = OldWorld;
				return 0
			end
    	
    	nMapBookState = GetMissionV(MULTIMAP_STATE)
    	
    	--对已经被闲置的场地进行处理
    	if nMapBookState == 0 then
    		tinsert(multiroom_nobook_tab,multi_room_tab[i])
    	end
    	
    	--对已经被预定的场地进行处理
    	if nMapBookState >= 1 then
    		tinsert(multiroom_book_tab,multi_room_tab[i]);
    	end
    	
    	SubWorld = OldSubWorld;
    end
    
    if getn(multiroom_book_tab) > MAX_MULTIMAP_NUM then			--已经预定的场地数多于目前开放多人擂台场地数
    	Msg2Player("S� tr薾 a nh trc nhi襲 h琻 s� tr薾 a Qu莕 h飊g chi課 hi謓 m�.")
    else --已经预定的场地数少于等于目前开放多人擂台场地数
    	lacknum = MAX_MULTIMAP_NUM - getn(multiroom_book_tab);
    	for i=1,lacknum do
    		nRandomNum = random(1,getn(multiroom_nobook_tab));
    		tinsert(multiroom_book_tab,multiroom_nobook_tab[nRandomNum]);
    		tremove(multiroom_nobook_tab,nRandomNum);
    	end
    end
    
    --获取百人大擂场地数量
    if IsHundredBattleState() == 1 then
    	for i=1,getn(multiroom_book_tab) do
    		OldWorld = SubWorld;
    		SubWorld = SubWorldID2Idx(MultiMapTab[multi_room_tab[i]][1]);
    		
    		if SubWorld <= 0 then
					WriteLog("[Qu莕 h飊g chi課]T譶h h譶h u trng hi謓 t筰 SubWorld b竜 l鏸, b竜 l鏸 nMapIndex l�"..MultiMapTab[multi_room_tab[i]][1]..", SubWorld l�"..SubWorld..".");
					SubWorld = OldWorld;
					return 0
				end
    		
    		if GetMissionV(GAME_TYPE) == 1 or GetMissionV(GAME_TYPE) == 2 then 	
    			tinsert(hundred_room_tab,multi_room_tab[i])
    		end
    		SubWorld = OldWorld
    	end
    
    	--若比赛尚未初始化
    	if getn(hundred_room_tab) <= 0 then	
    		hundred_room_tab = multiroom_book_tab
    	end
    	
    	room_num = room_num + getn(hundred_room_tab);
    else
    	room_num = room_num + getn(multiroom_book_tab);
    end   

    szSay = "Say("..format("%q","<color=green>Ch� l玦 i<color>:G莕 y, 玭g ch� Чi Ch� Cng � Tuy襫 Ch﹗ c bi謙 c� t� ch鴆 l玦 i c� nh﹏ h鏽 chi課, mong c竎 anh h飊g h祇 ki謙 thi th� v� ngh�.");
		szSay = szSay..","..2;--为了最后加上的退出选项                        
    --百人大擂对话选项构建
    if IsHundredBattleState() == 1 then
    	for i=1,getn(hundred_room_tab) do
    		OldSubWorld = SubWorld;
    		SubWorld = SubWorldID2Idx(MultiMapTab[hundred_room_tab[i]][1]);
    		
    		if SubWorld <= 0 then
						WriteLog("[Qu莕 h飊g chi課]Khi i tho筰 B竎h nh﹏ i l玦, c鯽 s� t飝 ch鋘 SubWorld b竜 l鏸, b竜 l鏸 nMapIndex l�"..MultiMapTab[hundred_room_tab[i]][1]..", SubWorld l�"..SubWorld..".");
						SubWorld = OldSubWorld;
						return 0
				end
    		
    		nFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
    		nAudienceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
    		nMapState = GetMissionV(MULTIMAP_STATE);
    		nGameType = GetMissionV(GAME_TYPE);
    		
    		if nMapState == 0 then
    			szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][8].."(Tr筺g th竔 hi謓 t筰: Ch璦 thi u)/MapPreparingTalk");
    		elseif nMapState == 1 then
    			if nGameType == 1 or nGameType == 2 then 
    				szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][8].."(Tr筺g th竔 hi謓 t筰: Ch璦 khai tr薾. S� ngi tham d�:"..nFighterNum.." :"..MAX_MULTIMAP_FIGTHER_NUM.." S� kh竛 gi�:"..nAudienceNum..":"..MAX_MULTIMAP_AUDIENCE_NUM..")/#RequestGame("..hundred_room_tab[i]..")");
    			else
    				szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][3].."(Tr筺g th竔 hi謓 t筰: Ch璦 khai tr薾. S� ngi tham d�:"..nFighterNum.." :"..MAX_MULTIMAP_FIGTHER_NUM.." S� kh竛 gi�:"..nAudienceNum..":"..MAX_MULTIMAP_AUDIENCE_NUM..")/#RequestGame("..hundred_room_tab[i]..")");
    			end
    		elseif nMapState >= 2 then
    			if nGameType == 1 or nGameType == 2 then
    				szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][8].."(Tr筺g th竔 hi謓 t筰: ng ti課 h祅h thi u)/#RequestGame("..hundred_room_tab[i]..")");
    			else
    				szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][3].."(Tr筺g th竔 hi謓 t筰: ng ti課 h祅h thi u)/#RequestGame("..hundred_room_tab[i]..")");
    			end
    		end
    		SubWorld = OldSubWorld 
    	end       		
    --一般多人擂台对话选项构建
    else
    	for i=1,getn(multiroom_book_tab) do
    		OldSubWorld = SubWorld;
    		SubWorld = SubWorldID2Idx(MultiMapTab[multiroom_book_tab[i]][1]);
    		
    		if SubWorld <= 0 then
						WriteLog("[Qu莕 h飊g chi課]Th玭g thng, khi i tho筰 Qu莕 h飊g chi課, c鯽 s� t飝 ch鋘 SubWorld b竜 l鏸, b竜 l鏸 nMapIndex l�"..MultiMapTab[multiroom_book_tab[i]][1]..", SubWorld l�"..SubWorld..".");
						SubWorld = OldSubWorld;
						return 0
				end
    
    		nFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
    		nAudienceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
    		nMapState = GetMissionV(MULTIMAP_STATE);

    		if nMapState == 0 then
    			szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(Tr筺g th竔 hi謓 t筰: Ch璦 thi u)/#RequestGame("..multiroom_book_tab[i]..")");
    		elseif nMapState == 1 then
    			szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(Tr筺g th竔 hi謓 t筰: Ch璦 khai tr薾. S� ngi tham d�:"..nFighterNum.." :"..MAX_MULTIMAP_FIGTHER_NUM.." S� kh竛 gi�:"..nAudienceNum..":"..MAX_MULTIMAP_AUDIENCE_NUM..")/#RequestGame("..multiroom_book_tab[i]..")");
    		elseif nMapState >= 2 then
    			szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(Tr筺g th竔 hi謓 t筰: ng ti課 h祅h thi u)/#RequestGame("..multiroom_book_tab[i]..")");
    		end
    		SubWorld = OldSubWorld 
    	end
    end
 
    szSay = szSay..","..format("%q", "R阨 kh醝/OnCancel_Talk")..")";
    dostring(szSay);
		return
	end
	
	--选择 组队混战擂台 场地
	if nType == 4 then
		local nTeamNum = 0;
		local szSay = "Say("..format("%q","<color=green>Ch� l玦 i<color>: G莕 y, 玭g ch� Чi Ch� Cng � Tuy襫 Ch﹗ c bi謙 c� t� ch鴆 l玦 i t� i h鏽 chi課, mong c竎 anh h飊g h祇 ki謙 thi th� v� ngh�.");
			szSay = szSay..","..2;--为了最后加上的退出选项  
		 	for i=1,getn(TeamMapTab) do
     		if GetWorldPos() == TeamMapTab[i][2] then
     			OldSubWorld = SubWorld;
     			SubWorld = SubWorldID2Idx(TeamMapTab[i][1]);
     			if SubWorld > 0 then
     				if GetMissionV(TEAM_GAME_STATE) == 0 then
     					if IsTeamAwardTime() == 1 then
     						szSay = szSay..","..format("%q","чi chi課(Tr筺g th竔 hi謓 t筰: Tr薾 a 產ng chu萵 b�)/TeamGamePreparingTalk");
     					else
     						szSay = szSay..","..format("%q","Tr薾 a t� i h鏽 chi課 (Tr筺g th竔 hi謓 t筰: B� tr鑞g)/#RequestTeamGame("..i..")");
     					end
     				elseif GetMissionV(TEAM_GAME_STATE) == 1 then
     					nTeamNum = GetGameTeamNum();
     					if IsTeamAwardTime() == 1 then
     						szSay = szSay..","..format("%q","Tr薾 a t� i h鏽 chi課 (Tr筺g th竔 hi謓 t筰: Ch璦 khai tr薾. чi ng� tham d�:"..nTeamNum.." :"..MAX_TEAM_NUM..")/#RequestTeamGame("..i..")");
     					else
     						szSay = szSay..","..format("%q","Tr薾 a t� i h鏽 chi課 (Tr筺g th竔 hi謓 t筰: Ch璦 khai tr薾. чi ng� tham d�:"..nTeamNum.." :"..MAX_TEAM_NUM..")/#RequestTeamGame("..i..")");
     					end
     				elseif GetMissionV(TEAM_GAME_STATE) > 1 then
     					if IsTeamAwardTime() == 1 then
     						szSay = szSay..","..format("%q","чi chi課 (Tr筺g th竔 hi謓 t筰: ng ti課 h祅h thi u)/#RequestTeamGame("..i..")");
     					else
     						szSay = szSay..","..format("%q","Tr薾 a t� i h鏽 chi課(Tr筺g th竔 hi謓 t筰: ng ti課 h祅h thi u)/#RequestTeamGame("..i..")");
     					end
     				end
     			end
     			SubWorld = OldSubWorld;
     		end
     	end	
     		
     	szSay = szSay..","..format("%q", "R阨 kh醝/OnCancel_Talk")..")";
     	dostring(szSay);
		return
	end
	
	--共享团队对战擂台
	if nType == 5 then
		local room_num = 0;
		local room_tab = {}
		local szSay = "";
		local nMapIdx = 0;
		local nMapState = 0;
		local nCaptainName_1 = "";
		local nCaptainName_2 = "";
		local nTeamSize_1 = 0;
		local nTeamSize_2 = 0;
		local nPlayerMSIndex = 0;
		local nCamp = 0;

		for i=1,getn(SingleTeamMapTab) do
			room_tab[i] = 0;
			if nMapId == SingleTeamMapTab[i][2] then
				nMapIdx = SubWorldID2Idx(SingleTeamMapTab[i][1]);
				if nMapIdx ~= -1 then
					room_num = room_num+1;
					room_tab[i] = 1;
				end
			end
		end

		szSay = "Say("..format("%q","<color=green>Ch� l玦 i<color>: Зy l� <color=red>L玦 i t cc<color> gi祅h cho <color=yellow>t� i ho芻 2 ngi ch琲<color> so t礽 v韎 nhau, hi謓 t筰 產ng m� t鎛g c閚g<color=yellow>"..room_num.." tr薾 a<color> cho c竎 giang h� hi謕 kh竎h t� th�. C竎 h� h穣 ch鋘 tr薾 a mu鑞 v祇!");
		szSay = szSay..","..(room_num+1);   --为了最后加上的退出选项
		
		for i=1,getn(room_tab) do
				if room_tab[i] == 1 then
					OldWorld = SubWorld;
					SubWorld = SubWorldID2Idx(SingleTeamMapTab[i][1]);
					if SubWorld ~= -1 then
						nMapState = GetMissionV(TEAM_GAME_STATE);
						local strTemp = "[Gi秈 t cc]";
						if GetMissionV(MS_YAJING_NUM) <= 0 then
							strTemp = "";
						end
						--场地没有人
						if nMapState == 0 then
							szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(Tr筺g th竔: b� tr鑞g)/#OpenSingleTeamRoomRequestYJ("..i..")");
						elseif nMapState == 1 then	
							--已有两支队伍
							if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
								OldPlayer = PlayerIndex;				
								nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
								if PlayerIndex > 0 then
									nCaptainName_1 = gf_GetCaptainName();
									nTeamSize_1 = gf_GetTeamSize();
								end
								nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
								if PlayerIndex > 0 then
									nCaptainName_2 = gf_GetCaptainName();
									nTeamSize_2 = gf_GetTeamSize;
								end
								PlayerIndex = OldPlayer;
								szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr筺g th竔: ьi khai chi課, hai phe i chi課 l� i "..nCaptainName_1.." v� i "..nCaptainName_2.." )/#OpenSingleTeamRoomYJ("..i..")");
							--已有一支队伍，等待其他队伍加入
							elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
								if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 then
									nCamp = 1;
								else
									nCamp = 2;
								end
								OldPlayer = PlayerIndex;
								nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,nCamp);
								if PlayerIndex > 0 then
									nCaptainName_1 = gf_GetCaptainName();
									nTeamSize_1 = gf_GetTeamSize();
								end
								PlayerIndex = OldPlayer;
								szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr筺g th竔: ьi thi u, tin t鴆 i ng�:"..nCaptainName_1..", c� "..nTeamSize_1.." ngi.)/#OpenSingleTeamRoomYJ("..i..")");
							end
						--比赛已经开始
						elseif nMapState == 2 then
							OldPlayer = PlayerIndex;
							nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
							if PlayerIndex > 0 then
								nCaptainName_1 = gf_GetCaptainName();
   								nTeamSize_1 = gf_GetTeamSize();
							end
							nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
							if PlayerIndex > 0 then
								nCaptainName_2 = gf_GetCaptainName();
   								nTeamSize_2 = gf_GetTeamSize();
							end
							PlayerIndex = OldPlayer;
							szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr筺g th竔: ng thi u, hai phe i chi課 l� i "..nCaptainName_1.." v� i "..nCaptainName_2.." )/#OpenSingleTeamRoomYJ("..i..")");
						elseif nMapState == 3 then
							szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr筺g th竔: Thi u k誸 th骳)/#GameOverTalk");
						end
					end   			
					SubWorld = OldWorld;	   					
				end 			
			end
			szSay = szSay..","..format("%q", "R阨 kh醝/OnCancel_Talk")..")";
			dostring(szSay);
				return
			end
end

function OnChanceRoom(index)
    if (GetTaskTemp(JOINROOMINDEX)>0 and GetTaskTemp(JOINROOMINDEX)~=index) then
        Say("Ngi  t tr薾 a "..GetTaskTemp(JOINROOMINDEX)..", h穣 ch鋘 v祇 tr薾 a  t!",0);
    else
        SetTaskTemp(JOINROOMINDEX,index);
        OldSubWorld = SubWorld;
	    SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	    ms_state = GetMissionV(MS_STATE);
	    if (ms_state <= 0) then
		    Say("N琲 y l� u trng n u l玦 i cho c竎 Nh﹏ s� giang h� tham gia n u t� th�. Hi謓 ch璦 c� u th� n祇 ng k� thi u, c竎 h� c� h鴑g th� kh玭g? <color=yellow>Tr薾 n u l玦 i hi謓 m� mi詎 ph�, h穣 ch韕 l蕐 th阨 c�!", 3, "Л頲/OnRegister", "Quy t綾 t� v� l� g�?/OnHelp", "в ta chu萵 b� th猰/OnCancel");
	    elseif (ms_state == 1) then
		    OnReady();
	    elseif (ms_state == 2) then
		    OnFighting();
	    else
	        OldPlayer = PlayerIndex;
	        for i = 1, 2 do
		        PlayerIndex = gf_GetTeamMember(i);
			    SetTaskTemp(JOINROOMINDEX,0);
	        end;
	        PlayerIndex = OldPlayer;
		    ErrorMsg(2)
	    end;
    	
	    SubWorld = OldSubWorld;
    end;
end

function OnHelp()
    SetTaskTemp(JOINROOMINDEX,0);
	Talk(7, "",	"Кn u l玦 i l� n琲 c竎 i hi謕 cao th� tr猲 giang h� t� th� v� ngh�, ph﹏ t礽 cao th蕄. L玦 i l� tr薾 a thi u c玭g b籲g cho hai phe tham d�!",	"Mu鑞 ti課 h祅h tr薾 t� v� l玦 i c莕 n ng k� thi u v韎 ta!",	"Sau khi hai phe tham d� t� i, i trng n b竜 danh xin tham gia thi u!",	"Do tr薾 a h筺 h裵, khi m閠 l玦 i n祇  產ng ti課 h祅h thi u th� l玦 i kh玭g ti誴 nh薾 b竜 danh!",	"B竜 danh th祅h c玭g, hai phe b総 u chu萵 b� thi u. Th阨 gian v祇 tr薾 c馻 hai phe l� 3 ph髏. Trong v遪g 3 ph髏, c竎 u th� ph秈 kh萵 trng v祇 u trng ti課 h祅h thi u!" , 	"Th阨 gian thi u l� 10ph髏. Trong 10 ph髏, hai phe ch璦 ph﹏ th緉g b筰 s� 頲 x� h遖!",	"Trong l骳 thi u, b蕋 k� b猲 n祇 b� r韙 m筺g ho芻 v� th祅h s� b� x� b筰!");
end;

function OnRegister()
--报名
	if (gf_GetTeamSize()  ~= 2) then
		ErrorMsg(1)
		SetTaskTemp(JOINROOMINDEX,0);
		return
	else
		if (PlayerIndex ~= gf_GetTeamMember(0)) then --GetName() == gf_GetCaptainName()
			ErrorMsg(5)
			SetTaskTemp(JOINROOMINDEX,0);
			return
		end;
	end;
	
	OldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = gf_GetTeamMember(i);
		CleanInteractive();
	    if (GetPlayerRoute() == 0) then
		    PlayerIndex = gf_GetTeamMember(0);
			SetTaskTemp(JOINROOMINDEX,0);
	        PlayerIndex = OldPlayer;
			ErrorMsg(10);
	        return
	    end;
	    if (GetTaskTemp(JOINROOMINDEX) ~= 0 and PlayerIndex~=gf_GetTeamMember(0)) then
		    PlayerIndex = gf_GetTeamMember(0);
			SetTaskTemp(JOINROOMINDEX,0);
	        PlayerIndex = OldPlayer;
			ErrorMsg(11);
	        return
	    end;
	end;
	PlayerIndex = OldPlayer;
	
--	AskClientForNumber("SignUpFinal", 100000, 99999999, "请输入赌注金额:");
    SignUpFinal();
end;

function SignUpFinal(V)
	x = GetTask(MS_POS);
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	ms_state = GetMissionV(MS_STATE);
	SubWorld = OldSubWorld;

	if (ms_state > 0) then 
		ErrorMsg(8);
		SetTaskTemp(JOINROOMINDEX,0);
		return
	end;
	
	local ChoiceRoom = GetTaskTemp(JOINROOMINDEX);
	OldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = gf_GetTeamMember(i);
		SetMissionS(i, GetName());
		if (PlayerIndex ~= gf_GetTeamMember(0)) then
		    SetTaskTemp(JOINROOMINDEX,ChoiceRoom)
		end;
--		if (GetCash() < V) then 
--			PlayerIndex = OldPlayer
--			ErrorMsg(2)
--			return
--		end;
	end;
	PlayerIndex = OldPlayer;

	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	SubWorld = idx;

	OpenMission(MISSIONID);

    SetMissionV(MS_ROOMINDEX,GetTaskTemp(JOINROOMINDEX));
    
	SetMissionV(BW_SIGN_MONEY,V);
	if x == 300 then
        SetMissionS(CITYID,"Th祅h Й")
	elseif x == 350 then
		SetMissionS(CITYID,"Tng Dng")
	elseif x == 150 then
		SetMissionS(CITYID,"Dng Ch﹗")
	elseif x == 100 then
	    SetMissionS(CITYID,"Tuy襫 Ch﹗")
	end;

	local nCountPlayerLevel = 0;
    OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		PlayerIndex = gf_GetTeamMember(i);
--		Pay(V);
        TaskTip("чi ng� c馻 ngi  b竜 danh tham gia tr薾 a"..MapTab[GetTaskTemp(JOINROOMINDEX)][3].."thi u PK!");
		SetMissionV(MS_PLAYER1ID + i -1, PlayerIndex);
		SetMissionS(i, GetName());
		SetMissionS(i+2, GetPlayerInfo(PlayerIndex));
		
		------------------判断是否发游戏公告----------------
		if GetLevel() >= 70 then
			nCountPlayerLevel = nCountPlayerLevel + 1
		end;
		--branchTask_BW1()
	end;
	PlayerIndex = OldPlayer;
	
--	if nCountPlayerLevel == 2 then	--双方都高于70级
--		SetMissionV(GLOBAL_NEWS_SHOW, 1);
--	end;
	
	str = "Hi謓 t筰"..GetMissionS(CITYID).." - "..MapTab[GetTaskTemp(JOINROOMINDEX)][3].."Кn u t� v� l玦 i b総 u chu萵 b� v祇 tr薾, hai phe l� "..GetMissionS(1).."("..GetMissionS(3)..")".." c飊g v韎  "..GetMissionS(2).."("..GetMissionS(4)..")"..", Hi謓 n u l玦 i 產ng m� mi詎 ph�! Hoan ngh猲h m鋓 ngi n xem thi u!";
	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
	    AddGlobalNews(str);
	end;
	SubWorld = OldSubWorld;
	--Msg2Team("你们已经订下了比赛，请尽快进行准备并入场，比赛将在1分钟后正式开始。");
	Say("C竎 ngi  ng k� thi u, h穣 mau chu萵 b� v祇 u trng, tr薾 u s� ch輓h th鴆 b総 u sau 1 ph髏 n鱝.",0);
end;

function OnReady()
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);

	if (GetName() == GetMissionS(1)) or (GetName() == GetMissionS(2)) then 
	    if (GetName() == GetMissionS(1)) then
		    SetMissionV(MS_PLAYER1ID, PlayerIndex);
		end;
	    if (GetName() == GetMissionS(2)) then
		    SetMissionV(MS_PLAYER1ID+1, PlayerIndex);
		end;
		
		SubWorld = OldSubWorld
		OnJoin()
	else
		V = GetMissionV(BW_KEY);
		if GetTask(DUZHU+2) == V then
			str = "Hi謓 t筰 "..GetMissionS(1).."("..GetMissionS(3)..")".." c飊g v韎  "..GetMissionS(2).."("..GetMissionS(4)..")".."  l玦 i t� v� trong giai 畂筺 v祇 trng u, s� ngi xem trong trng u l� <color=yellow>"..GetMSPlayerCount(MISSIONID,3).."<color>, s� ngi t鑙 產 l� 100 ngi, b筺  b竜 danh xem thi u";
			SubWorld = OldSubWorld

			Say(str, 2, "Ta mu鑞 v祇 xem thi u!/OnLooking","Ta kh玭g mu鑞 v祇 n鱝!/OnCancel");
		else
			str = "Hi謓 t筰 "..GetMissionS(1).."("..GetMissionS(3)..")".." c飊g v韎  "..GetMissionS(2).."("..GetMissionS(4)..")".."  l玦 i t� v� trong giai 畂筺 v祇 trng u, s� ngi xem trong trng u l� <color=yellow>"..GetMSPlayerCount(MISSIONID,3).."<color>, s� ngi t鑙 產 l� 100 ngi, b筺 c� th� <color=red>v祇 trng u xem mi詎 ph�<color>, t� v� s緋 b総 u.";
			SubWorld = OldSubWorld
			Say(str, 2, "Ta mu鑞 v祇 xem thi u!/OnLook","Ta kh玭g c� h鴑g th�!/OnCancel");
		end;
	end;
end;

function ErrorMsg(ErrorId)
    if (ErrorId == 1) then 
	    Say("Hai phe c莕 t� i trc khi ng k� thi u!",0)
    elseif (ErrorId == 2) then 
	    Say("Xin l鏸! Tr薾 a thi u kh玭g . T筸 th阨 kh玭g th� tham gia thi u!",0)
    elseif (ErrorId == 3) then 
	    Say("B竜 danh c� v蕁 ! H穣 li猲 h� nh� cung c蕄!",0);
    elseif (ErrorId == 4) then 
	    Say("Ngi kh玭g ph秈 l� u th� tham gia thi u! Kh玭g th� v祇 u trng thi u, ch� 頲 l祄 kh竛 gi�!", 0);
    elseif (ErrorId == 5) then 
	    Say("Ngi b竜 danh ph秈 l� 琻g kim чi trng!",0);
    elseif (ErrorId == 6) then 
	    Say("Ngi kh玭g mang  ng﹏ lng!",0);
    elseif (ErrorId == 7) then 
	    Say("Xin l鏸! Ngi ch璦 b竜 danh v祇 xem!",0);
    elseif (ErrorId == 8) then
	    Say("Xin l鏸! Tr薾 a thi u  頲 ngi kh竎 thu� r錳!",0);
    elseif (ErrorId == 9) then 
	    Say("Xin l鏸! Thi u  b総 u! Kh玭g th� ng k� n鱝!",0);
    elseif (ErrorId == 10) then 
	    Say("Xin l鏸! Trong i c� t﹏ th�, kh玭g th� tham gia PK!",0);
    elseif (ErrorId == 11) then 
	    Say("Xin l鏸! чi vi猲 ngi  tham gia thi u PK kh竎!",0);
	elseif ErrorId == 12 then
	    --仅仅开发的时候使用，错误报告
	    Say("S� lng l玦 i c馻 server  vt m鴆 t鑙 產!!!",0);
    else
    	
    end;
    return 
end;


function OnLook()

	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	str = GetMissionS(1).." c飊g v韎  "..GetMissionS(2).."  b総 u thi u t� v� l玦 i! Ngi 畂竛 xem ai chi課 th緉g?";
	str1 = "Ta cho r籲g "..GetMissionS(1).."("..GetMissionS(3)..")".."  s� th緉g!/OnCas1";
	str2 = "Ta cho r籲g "..GetMissionS(2).."("..GetMissionS(4)..")".."  s� th緉g!/OnCas2";
	Say(str, 3, str1, str2, "Ta kh玭g bi誸! Ta kh玭g v祇 u!/OnCancel");

	SubWorld=OldSubWorld;
end;

function OnLooking()
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	if (idx == -1) then 
		return
	end;

	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	--限制观众人数为100人
	if GetMSPlayerCount(MISSIONID,3) >= 100 then
		Talk(1,"","Xin l鏸! S� ngi xem trong trng u   <color=yellow>100 ngi<color>, xin h穣 i tr薾 thi u sau v藋");
		SubWorld=OldSubWorld;
		return
	end

	V = GetMissionV(BW_KEY);
	if GetTask(DUZHU+2) == V and V ~= 0 then
		JoinCamp(3);
	else
		ErrorMsg(7);
	end;

	SubWorld=OldSubWorld;
end;

function OnCas1()
    OnCas(0);
end;

function OnCas2()
    OnCas(1);
end;

function OnCas(nSel)
	SetTask(DUZHU,nSel + 1);
	SignUpFinalx(  )
--	AskClientForNumber("SignUpFinalx", 10000, 10000000, "请输入赌注金额:");
end;


--玩家输入投标金后到这里
function SignUpFinalx( )
--	if (GetCash() < V) then 
--		ErrorMsg(6)
--		return
--	end;

	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	SubWorld = idx;

	ms_state = GetMissionV(MS_STATE);
	if (ms_state ~= 1) then
		SubWorld = OldSubWorld
		ErrorMsg(9)
		return
	end

--	Pay(V);		--交赌注
--	nSel = GetTask(DUZHU) - 1;	--选择的是哪方呢？
--	V1 = GetMissionV(BW_MONEY1 + nSel) + V;		--赌注加到选择的人身上
--	SetMissionV(BW_MONEY1 + nSel, V1);		
--	SetTask(DUZHU+1,V);
	SetTask(DUZHU+2,GetMissionV(BW_KEY));		--标记，是观看本次比赛
	
	--限制观众人数为100人
	if GetMSPlayerCount(MISSIONID,3) >= 100 then
		Talk(1,"","Xin l鏸! S� ngi xem trong trng u   <color=yellow>100 ngi<color>, xin h穣 i tr薾 thi u sau v藋");
		SubWorld=OldSubWorld;
		return
	end
	
	JoinCamp(3);
	SubWorld = OldSubWorld;

end;

function OnJoin()
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	
	OldSubWorld = SubWorld;
	SubWorld = idx;

	if (GetName() == GetMissionS(1)) then 
		JoinCamp(1)
	elseif (GetName() == GetMissionS(2)) then 
		JoinCamp(2)
	else
		ErrorMsg(4)
	end;
	SubWorld=OldSubWorld;
	
end;

function OnFighting()
	str = "Hi謓 t筰 "..GetMissionS(1).." c飊g v韎  "..GetMissionS(2).."  產ng ti課 h祅h thi u l玦 i!";
	Say(str, 2, "Ta mu鑞 v祇 xem thi u./OnLooking", "Ta kh玭g mu鑞 v祇 u./OnCancel");
end;

function OnCancel()
    SetTaskTemp(JOINROOMINDEX,0);
end;

function OnCancel_Talk()

end;

------------------------------------------------多人擂台部分函数-------------------------------------

--选择参赛或者观战或者开局
function RequestGame(nMapIndex)

local nMapState = 0;
local str = "";

	--已经预订了单人擂台的玩家给予通知并不允许进入赛场	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ngi  ng k� tr薾 a Кn nh﹏ l玦 i, kh玭g th� v祇 Qu莕 h飊g chi課.",0)
		return
	end

	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[Qu莕 h飊g chi課]Khi RequestGame SubWorld b竜 l鏸, b竜 l鏸 nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
	
	nMapState = GetMissionV(MULTIMAP_STATE);
	nGameType = GetMissionV(GAME_TYPE);
	SubWorld = OldSubWorld
	
	if nMapState == 0 then
		if IsHundredBattleState() == 0 then
			Say("L玦 i n祔 ch璦 c� ngi ng k�. Ngi mu鑞 ng k� tr薾 a kh玭g?",
					2,
					"Жng k�/#OpenMultiRoom("..nMapIndex..")",
					"R阨 kh醝/OnCancel_Talk"
			)
		else
			Say("Xin l鏸, l玦 i l莕 n祔  k誸 th骳, h穣 ch鋘 l筰 b秐  l莕 n鱝.",0)
		end
		
	elseif nMapState == 1 then
		if nGameType == 1  then
			str = "Tuy觧 th� tham gia <color=yellow>tr薾 th� 1<color> Qu莕 h飊g chi課 c� th� b竜 danh thi u mi詎 ph�. Thi u k誸 th骳, ngi tham d� u nh薾 頲 <color=yellow>甶觤 s鴆 kh醗 v� ph莕 thng kh竎<color>. Ch糿g hay c竎 h� c� mu鑞 tham gia?";
		elseif nGameType == 2 then
			str = "Tuy觧 th� tham gia <color=yellow>tr薾 th� 2<color> Qu莕 h飊g chi課 ph秈 n閜 <color=yellow>2 lng<color> ph� b竜 danh thi u. S� ngi thi u t鑙 產 l� <color=yellow>100 ngi<color>. Tuy觧 th� chi課 th緉g cu鑙 c飊g c� th� nh薾 頲 ph莕 thng ti襫 phong ph�. Ch糿g hay c竎 h� c� mu鑞 tham gia?";
		else
			str = "Tr薾 a thi u n祔 ch璦 b総 u. Ngi mu鑞 v祇 xem hay tham gia thi u?";
		end
		Say(str,
				3,
				"Tham gia t� v�/#SelectMultiRoom("..nMapIndex..")",
				"V祇 xem thi u/#View_Game("..nMapIndex..")",
				"R阨 kh醝/OnCancel_Talk"
		)
		
	elseif nMapState == 2 then
	
		Say("Tr薾 a thi u l玦 i n祔  b総 u. Ngi mu鑞 v祇 xem kh玭g?",
				2,
				"V祇 xem thi u/#View_Game("..nMapIndex..")",
				"R阨 kh醝/OnCancel_Talk"
		)
	end

end

--开始一个多人擂台比赛房间
function OpenMultiRoom(nMapIndex)

local i = 0;
local BookedTab = {};
local nNpcIndex = 0;
local nMapState = 0;
local nMapID = GetWorldPos();
local str_news = "";

	--查看当前场地预订情况
	for i=1,getn(MultiMapTab) do
		if nMapID == MultiMapTab[i][2] and nMapIndex ~= i then
			OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(MultiMapTab[i][1]);
			if SubWorld <= 0 then
				WriteLog("[Qu莕 h飊g chi課]Khi OpenMultiRoom SubWorld b竜 l鏸. B竜 l鏸 nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
				SubWorld = OldSubWorld;
				return 0
			end			
			nMapState = GetMissionV(MULTIMAP_STATE);
			SubWorld = OldSubWorld
			if nMapState ~= 0 then
				tinsert(BookedTab,i)
			end
		end
	end
	
	--判断已经预定的场地是否达到房间最大数量
	if getn(BookedTab) > MAX_MULTIMAP_NUM then
		Say("Xin l鏸! Tr薾 a n祔  頲 ngi kh竎 t trc! Xin ch鋘 tr薾 a kh竎!",0)
		return
	elseif	getn(BookedTab) == MAX_MULTIMAP_NUM then
		nMapIndex = BookedTab[random(1,getn(BookedTab))]
	end
	
	--判断是否符合比赛资格
	if JoinConditionCheck(1) == 0 then		
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[Qu莕 h飊g chi課]Khi OpenMultiRoom SubWorld b竜 l鏸. B竜 l鏸 nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
	
	nMapState = GetMissionV(MULTIMAP_STATE);
	SubWorld = OldSubWorld
	
	if nMapState == 0 then
		SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1])
  	OpenMission(MULIT_MISSION_ID);--开启一个场地
  	nNpcIndex = CreateNpc("Ch� c莔  Trung Nguy猲","Чi Ch� Cng",MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][6],MultiMapTab[nMapIndex][7]);--添加一个传送出场地用的Npc
  	SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\multimap_npc.lua")
  	SetMissionV(MULTIMAP_NPC_INDEX,nNpcIndex);
		CleanInteractive();
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SCCheckOfflineExp(4)
		AddMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);--加入阵型
		SetPlayerState(1,1);--设置准备状态
		SetTaskTemp(PLAYER_CAMP,MULIT_FIGTHER_CAMP);--记录玩家阵型
		SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
		StartMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID1, MULTI_TIMER_1);
		str_news = GetPlayerInfo(PlayerIndex)..GetName().."產ng �"..MultiMapTab[nMapIndex][9].."L玦 i s緋 x誴 Qu莕 h飊g chi課. M阨 c竎 anh h飊g tham gia th� luy謓!",
		Msg2Global(str_news);
	
	elseif nMapState == 1 then
		Say("Xin l鏸! Tr薾 a n祔  頲 ngi kh竎 t trc! Ngi mu鑞 v祇 xem hay tham gia thi u?",
				3,
				"Tham gia t� v�/#SelectMultiRoom("..nMapIndex..")",
				"V祇 xem thi u/#View_Game("..nMapIndex..")",
				"R阨 kh醝/OnCancel_Talk"
		)
		
	elseif nMapState == 2 then
		Say("L玦 i 產ng ti課 h祅h thi u! Ngi c� th� v祇 xem!",
				2,
				"V祇 xem thi u/#View_Game("..nMapIndex..")",
				"R阨 kh醝/OnCancel_Talk"
		)
	end
	
end

--选择进入多人擂台场地
function SelectMultiRoom(nMapIndex)

local nTotalFigtherNum = 0;
local nTotalAudicnceNum = 0;
local nGameType = 0;

	OldSubWorld = SubWorld;
  SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
  
  if SubWorld <= 0 then
		WriteLog("[Qu莕 h飊g chi課]Khi SelectMultiRoom SubWorld b竜 l鏸. B竜 l鏸 nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
  
  nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
  nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
  nGameType = GetMissionV(GAME_TYPE); 
  SubWorld = OldSubWorld
  
  --比赛人员尚未满员
	if nTotalFigtherNum < MAX_MULTIMAP_FIGTHER_NUM then
			JoinMultiMap(nMapIndex)
	--观战人员尚未满员
	elseif nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		Say("S� ngi tham gia thi u  t m鴆 t鑙 產. Ngi c� th� v祇 xem thi u!",
		2,
		"V祇 xem thi u/#View_Game("..nMapIndex..")",
		"R阨 kh醝/OnCancel_Talk"
		)
	else
		Say("Xin l鏸! S� ngi trong tr薾 a  ! Sau n祔 h穣 t韎 nh�!",0)
	end
	
end

--进入多人擂台场地
function JoinMultiMap(nMapIndex)

local news_str = "";
local nMapState = 0;
local nTotalFigtherNum = 0;
local nTotalAudicnceNum = 0;
local nGameType = 0;

	OldSubWorld = SubWorld;
  SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
  
  if SubWorld <= 0 then
		WriteLog("[Qu莕 h飊g chi課]Khi JoinMultiMap SubWorld b竜 l鏸. B竜 l鏸 nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
  
  nMapState = GetMissionV(MULTIMAP_STATE);
  nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
  nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
  nGameType = GetMissionV(GAME_TYPE)
		
	if nMapState == 1 and nTotalFigtherNum < MAX_MULTIMAP_FIGTHER_NUM then
		--百人大擂入场费用判断
		if nGameType == 1 then
			--判断是否符合比赛资格
			if JoinConditionCheck(2) == 0 then		
				return
			end
		elseif nGameType == 2 then
			if Pay(HUNDRED_MONEY) ~= 1 then
				Say("Tham gia tr薾 th� 2 Qu莕 h飊g chi課 c莕 n閜 <color=yellow>2 lng<color> ph� b竜 danh. Ngi kh玭g mang  ti襫!",0)
				return
			else
				SetMissionV(MULTIMAP_BONUS,GetMissionV(MULTIMAP_BONUS)+HUNDRED_MONEY)
				--WriteLog("[多人擂台] 玩家 "..GetName().." 进入比赛，目前入场费用累计为："..GetMissionV(MULTIMAP_BONUS).." 帐号是"..GetAccount());
			end
		--判断是否符合比赛资格
		elseif JoinConditionCheck(1) == 0 then		
			return
		end
		
		CleanInteractive();
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SCCheckOfflineExp(4)
		SetPlayerState(1,1);--设置准备状态
		AddMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);--加入阵型
		SetTaskTemp(PLAYER_CAMP,MULIT_FIGTHER_CAMP);--记录玩家阵型
		SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
		news_str = GetPlayerInfo(PlayerIndex)..GetName().."Х v祇 L玦 i. Hi謓 s� ngi l�"..GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP).." ngi."
		Msg2MSAll(MULIT_MISSION_ID,news_str);
	elseif nTotalFigtherNum >= MAX_MULTIMAP_FIGTHER_NUM and nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		Say("S� ngi tham gia thi u  t m鴆 t鑙 產. Ngi c� th� v祇 xem thi u!",
		2,
		"V祇 xem thi u/#View_Game("..nMapIndex..")",
		"R阨 kh醝/OnCancel_Talk"
		)
	else
		Say("Xin l鏸! S� ngi trong tr薾 a  ! Sau n祔 h穣 t韎 nh�!",0)
	end

	SubWorld = OldSubWorld
	
end

--百人大擂比赛场地筹备中对话
function MapPreparingTalk()

local nHour = GetLocalTime()

	if nHour >= 10 and nHour <= 12 then
		Say("Xin l鏸! Tr薾 a 產ng chu萵 b�. <color=yellow>Tr薾 th� 1<color> Qu莕 h飊g chi課 b総 u b竜 danh v祇 <color=yellow>11:00<color>; <color=yellow>Tr薾 th� 2<color> b総 u b竜 danh v祇<color=yellow>11:30<color>.",0)
	elseif nHour >= 16 and nHour <= 18 then
		Say("Xin l鏸! Tr薾 a 產ng chu萵 b�. <color=yellow>Tr薾 th� 1<color> Qu莕 h飊g chi課 b総 u b竜 danh v祇 <color=yellow>17:00<color>; <color=yellow>Tr薾 th� 2<color> b総 u b竜 danh v祇 <color=yellow>17:30<color>.",0)
	elseif nHour >= 20 and nHour <= 22 then
		Say("Xin l鏸! Tr薾 a 產ng chu萵 b�. <color=yellow>Tr薾 th� 1<color> Qu莕 h飊g chi課 b総 u b竜 danh v祇 <color=yellow>21:00<color>; <color=yellow>Tr薾 th� 2<color> b総 u b竜 danh v祇 <color=yellow>21:30<color>.",0)
	end
end

--参加比赛条件判断
--参数：nType 1、普通多人擂台；2、百人英雄大擂；3、普通组队混战擂台；4、团队激战大擂

function JoinConditionCheck(nType)

	if nType == 1 then
		if GetLevel() <10 or GetPlayerRoute() == 0 then
			Say("Ъng c蕄 tham gia Qu莕 h飊g chi課 th玭g thng ph秈 t <color=yellow>c蕄 10 tr� l猲<color> v� l� nh﹏ v藅 <color=yellow> gia nh藀 m玭 ph竔<color>.",0);
			return 0 
		else
			return 1
		end
	end
	
	if nType == 2 then
		if GetLevel() <60 or GetPlayerRoute() == 0 then
			Say("Ъng c蕄 tham gia Qu莕 h飊g chi課 th玭g thng ph秈 t <color=yellow>c蕄 60 tr� l猲<color> v� l� nh﹏ v藅 <color=yellow> gia nh藀 m玭 ph竔<color>.",0);
			return 0
		else
			return 1
		end
	end
	
end

--比赛规则说明选项
function GameRuleTalk()

	Say("H穣 ch鋘 t譵 hi觰 quy t綾 l玦 i tng quan!",
	5,
	"Кn u L玦 i/#GameRule(1)",
	"T� i i chi課 L玦 i/#GameRule(2)",
	"H鏽 chi課 n u L玦 i/#GameRule(3)",
	"T� i h鏽 chi課 l玦 i/#GameRule(4)",
	"Tho竧/OnCancel_Talk"
	)
end

function GameRule(nType)

local strTalk = {};
	
	if nType == 1 then
		OnHelp();
	elseif nType == 2 then
		strTalk = {
			"L玦 i T� i t� v� l� n琲 c竎 Чi hi謕 cao th� trong giang h� t� i th� luy謓 v� ngh�, ph﹏ t礽 cao th蕄 v韎 nhau. L玦 i l� tr薾 a c玭g b籲g cho hai phe thi u!",	
			"Mu鑞 ti課 h祅h t� v� l玦 i, trc ti猲 c莕 ng k� v韎 ta. 襲 ki謓 c莕 2 ngi tr� l猲  gia nh藀 m玭 ph竔 頲 чi trng y猽 c莡!",	
			"Sau khi ng k� th祅h c玭g, phe ng k� v祇 u trng i i ng� kh竎 khi猽 chi課!",
			}
		TalkEx("#GameRule_1("..nType..")",strTalk)
	elseif nType == 3 then
		Rule_Multi();
	elseif nType == 4 then
		strTalk = {
			"T� i h鏽 chi課 l玦 i l� tr薾 a t� v� c馻 2 i ng� tr� l猲. C竎 i 頲 t� m譶h l祄 ch�. T� i d騨g c秏 chi課 u n c飊g l� phe gi祅h chi課 th緉g!",
			"L玦 i th� luy謓 t� v� l莕 n祔 theo h譶h th鴆 t� i 1 i 1. Ngo礽 vi謈 th萴 nghi謒 c玭g l鵦 b秐 th﹏ c遪 c莕 n緈 b総 thay i c馻 tr薾 a, i th� m筺h y誹 v� s竎h lc kh竎 nhau  gi祅h th緉g l頸 chung cu閏. N誹 c竎 h� kh玭g t譵 頲 i th� tng x鴑g, sao kh玭g th� tham gia Qu莕 h飊g chi課?",
			"Qu莕 h飊g chi課 cho ph衟 чi ng� c� 2 ngi tr� l猲 t c蕄 10 tr� l猲  gia nh藀 m玭 ph竔 tham gia mi詎 ph�. Л琻g nhi猲, ngi chi課 th緉g c騨g kh玭g 頲 nh薾 b蕋 c� ph莕 thng n祇. Sau khi ng k� th祅h c玭g, th阨 gian chu萵 b� l� 3 ph髏. N誹 s� i trong tr薾 a 輙 h琻 2 i, thi u s� b� h駓 b�!",
			}
		TalkEx("#GameRule_1("..nType..")",strTalk);
	end
end

function GameRule_1(nType)

local strTalk = {}; 

	if nType == 2 then
		strTalk = {
			"Phe ng k�  v祇 u trng m阨 phe khi猽 chi課 t� v�, thi u m韎 ch輓h th鴆 b総 u. Hai phe tham chi課 c� th阨 gian chu萵 b� thi u l� 3 ph髏!",
			"Sau 3 ph髏, thi u s� b総 u. Th阨 gian thi u l� 15 ph髏. Trong v遪g 15 ph髏 ch璦 ti猽 di謙 h誸 i phng, thi u s� 頲 x� h遖.",	                                                      
			"Ngo礽 ra, i trng b� r韙 m筺g ho芻 v� th祅h khi 產ng trong giai 畂筺 thi u, i m譶h s� b� x� thua!",                                                     
			}
	elseif nType == 4 then
		strTalk = {
			"M鏸 tr薾, s� i tham chi課 t鑙 產 l� 10 i, th阨 gian thi u l� 15 ph髏. N誹 th阨 gian k誸 th骳, s� i thi u c遪 l筰 h琻 1 i s� l蕐 s� tuy觧 th� c馻 i ng� b� ti猽 di謙 輙 nhi襲  quy誸 nh phe chi課 th緉g!",
			"Ngo礽 ra, i trng b� r韙 m筺g ho芻 v� th祅h khi 產ng trong giai 畂筺 thi u, i m譶h s� b� x� thua!",
--			"擂台老板：除了一般时段内开设的组队混战擂台场地外，{成都}还在特定的时间举办{团队激战大擂}。时间分别为 {早上12:00}、{12:30}，{下午18:00}、{18:30}和{晚上23:00}、{23:30}。",
			}
	end
	
	TalkEx("#GameRule_2("..nType..")",strTalk);
end

function GameRule_2(nType)

local strTalk = {};

	if nType == 4 then
		strTalk = {
			"чi chi課 y猽 c莡 i ng� c� 2 ngi tr� l猲 t c蕄 60 tr� l猲  gia nh藀 m玭 ph竔. M鏸 tuy觧 th� tham gia tr薾 thi u th� 1 t飝 � trong 3 th阨 甶觤 u c� th� nh薾 頲 ph莕 thng nh蕋 nh (m鏸 ng祔 ch� c� th� nh薾 頲 1 l莕); дn tr薾 thi u th� 2, y猽 c莡 чi trng n閜 10 lng ph� v祇 tr薾. Л琻g nhi猲, i ng� chi課 th緉g s� nh薾 頲 ph莕 thng v� ti襫 phong ph�.",
			"Hy v鋘g l莕 n祔 頲 ch鴑g ki課 b秐 l躰h c馻 i hi謕!",
			}
		TalkEx("",strTalk);
	end
end

--多人擂台规则说明
function Rule_Multi()

local strTalk = {
	"H鏽 chi課 n u L玦 i l� tr薾 a th� luy謓 t� v� c馻 2 ho芻 nhi襲 h琻 c竎 giang h� hi謕 kh竎h. M鏸 u th� tham chi課 s� t� m譶h l祄 ch�. u th� m筺h m� chi課 u n cu鑙 c飊g s� l� ngi chi課 th緉g!",
	"H鏽 chi課 n u L玦 i l莕 n祔 theo h譶h th鴆 t� v� 1 i 1. Ngo礽 vi謈 th萴 nghi謒 c玭g l鵦 b秐 th﹏ c遪 c莕 n緈 b総 thay i c馻 tr薾 a, i th� m筺h y誹 v� s竎h lc kh竎 nhau  gi祅h th緉g l頸 chung cu閏. N誹 c竎 h� kh玭g t譵 頲 i th� tng x鴑g, sao kh玭g th� tham gia v祇 tr薾 Qu莕 h飊g chi課?",
	"H鏽 chi課 n u L玦 i cho ph衟 hi謕 kh竎h giang h� t� c蕄 10 tr� l猲  gia nh藀 m玭 ph竔 tham gia mi詎 ph�. Л琻g nhi猲, ngi chi課 th緉g c騨g kh玭g 頲 nh薾 b蕋 c� ph莕 thng n祇. Sau khi ng k� th祅h c玭g, th阨 gian chu萵 b� l� 3 ph髏. N誹 s� ngi tham chi課 trong tr薾 a 輙 h琻 1 ngi, thi u s� b� h駓 b�!",
	}

	TalkEx("Rule_Multi_1",strTalk)

end

function Rule_Multi_1()

local strTalk = {
	"M鏸 tr薾, s� ngi tham chi課 t鑙 產 l� 100 ngi, th阨 thi u l� 15ph髏. Khi th阨 gian k誸 th骳, u th� tham chi課 c遪 l筰 輙 h琻 1 ngi s� l蕐 ti猽 ch� s� ngi tham chi課 nhi襲 輙  quy誸 nh phe chi課 th緉g.",
--	"擂台老板：除了一般时段内开设的普通单人混战擂台赛外，{成都}还在特定的时间举办{百人英雄大擂}。时间分别为 {早上11:00}、{11:30}，{下午17:00}、{17:30}和{晚上21:00}、{21:30}。",
--	"擂台老板：{百人英雄大擂}则需要满{60级及以上已有流派}的江湖侠士参加，凡参加{三个时段内任意第一场比赛}的各位均会获得一定的奖励（每天只能获得一次）；至于第二场比赛需要交纳{2金}作为入场费，当然胜出者将会获得更加丰厚奖金。",
--	"擂台老板：希望届时能在擂台上一睹大侠你的风采。",
	}

	TalkEx("",strTalk)
	
end

---------------多人组队单挑擂台---------------------
function OpenSingleTeamRoomRequest(nMapIndex)

	Say("Tr薾 a n祔 ch璦 c� thi u. Ngi c� mu鑞 ng k� v� xin chuy觧 v祇 u trng kh玭g?",
			2,
			"Жng k�/#OpenSingleTeamRoom("..nMapIndex..")",
			"R阨 kh醝/OnCancel_Talk"
			)

end

---------------单挑或组队押金擂台---------------------
function OpenSingleTeamRoomRequestYJ(nMapIndex)

	Say("<color=green>Ch� l玦 i<color>: v� i n鱝 ch璦 ng k� thi u, c竎 h� c� mu鑞 t cc v� chuy觧 v祇 l玦 i?",
			2,
			"t cc khi猽 chi課 (Gi秈 t cc)/#OpenSingleTeamRoomYJ("..nMapIndex..")",
			"R阨 kh醝/OnCancel_Talk"
			)

end

--开启一个组队单挑擂台房间
function OpenSingleTeamRoom(nMapIndex)

	local i = 0;
	local x,y,z = 0,0,0;
	local nMapState = 0;
	local nTeamSize = 0;
	local strSay = "";
	local nCaptainName = "";

	--已经预订了单人擂台的玩家给予通知并不允许进入赛场	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ngi  ng k� tr薾 a n nh﹏ l玦 i, kh玭g th� v祇 l玦 i kh竎!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);
		--判断是不是押金擂台，是的就不让进
		local nTag = GetMissionV(MS_YAJING_NUM);
		if nTag ~= 0 then
			Talk(1,"","<color=green>Ch� l玦 i<color>: Зy l� l玦 i t cc kh玭g 頲 ph衟 v祇!");
			return
		end
		--尚未有比赛
		if nMapState == 0 then
			--判断是否符合比武资格
			if HaveSingleTemaGameTitle() == 1 then
				OpenMission(SINGLE_TEAM_MISSION_ID);
  			OldPlayer = PlayerIndex; 			
  			for i=1,gf_GetTeamSize() do
  				PlayerIndex = gf_GetTeamMember(i);
  				if PlayerIndex > 0 then
  					CleanInteractive();
  					x,y,z = GetWorldPos();
						SetTask(MS_POS,x);
						SetTask(MS_POS+1,y);
						SetTask(MS_POS+2,z);
  					NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
  					SCCheckOfflineExp(4)
						AddMSPlayer(SINGLE_TEAM_MISSION_ID,1);--加入阵营
						SetPlayerState(1,1,2);--设置准备状态
						SetTaskTemp(PLAYER_CAMP,1);--记录玩家阵型
						SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
					end
  			end
  			PlayerIndex = OldPlayer;
  			--SetMissionV(TEAM_GAME_STATE,1); 			
  			SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
  			SetMissionV(CAPTAIN_ID,gf_GetTeamMember(0)); 			
				--StartMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID,SINGLE_TEAM_TIMER);		
			end
		--比赛已经开始或两支队伍已在准备中	
		elseif nMapState == 2 or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0) then
			Say("Tr薾 a n祔  b総 u thi u, i ng� hai phe do <color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color> v� <color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color> d蒼 d総. C� mu鑞 v祇 tr薾 a n祔 xem thi u?",
			2,
			"Xem thi u/#RequestViewSingleTeamGame("..nMapIndex..")",
			"R阨 kh醝/OnCancel_Talk"
			)
		--比赛尚未开始
		elseif nMapState == 1 and (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 ) or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 ) then
			OldPlayer = PlayerIndex;
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				nCaptainName = gf_GetCaptainName();
				nTeamSize = gf_GetTeamSize();
			end
			PlayerIndex = OldPlayer;
			Say("C� ph秈 ngi mu鑞 ch鋘 <color=yellow>"..nCaptainName.."<color> d蒼 d総 (g錷 c�"..nTeamSize.." ngi) m阨 t� v� ho芻 v祇 u trng xem thi u?",
				3,
				"G鰅 l阨 khi猽 chi課/#RequestGame2Captian("..nMapIndex..")",
				"Xem thi u/#RequestViewSingleTeamGame("..nMapIndex..")",
				"R阨 kh醝/OnCancel_Talk"
				)
		elseif nMapState == 3 then
			GameOverTalk();
		end
	end
	
	SubWorld = OldWorld;
	
end

--开启一个单挑或组队的押金擂台房间
function OpenSingleTeamRoomYJ(nMapIndex)

	local i = 0;
	local x,y,z = 0,0,0;
	local nMapState = 0;
	local nTeamSize = 0;
	local strSay = "";
	local nCaptainName = "";
	
	--使用临时任务变量记录选择的房间
	SetTaskTemp(TMP_TASK_BW_YAJIN_LEITAI, nMapIndex);
	
	--已经预订了单人擂台的玩家给予通知并不允许进入赛场	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ngi  ng k� tr薾 a n nh﹏ l玦 i, kh玭g th� v祇 l玦 i kh竎!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);
		--尚未有比赛
		if nMapState == 0 then
			--判断是否符合比武资格
			if HaveSingleTemaGameTitleYJ() == 1 then
					AskClientForNumber("AskSingleTeamYJNum",100,5000,"Nh藀 s� lng v祅g cc","")
			end
		--比赛已经开始或两支队伍已在准备中	
		elseif nMapState == 2 or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0) then
			Say("<color=green>Ch� l玦 i<color>: t� v� tr猲 l玦 i n祔  b総 u, th祅h vi猲 bao g錷 <color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color> v� <color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color>, c竎 h� mu鑞 v祇 quan chi課?",
			2,
			"Quan chi課 (gi秈 t cc)/#RequestViewSingleTeamGame("..nMapIndex..")",
			"R阨 kh醝/OnCancel_Talk"
			)
		--比赛尚未开始
		elseif nMapState == 1 and (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 ) or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 ) then
			local nTag = GetMissionV(MS_YAJING_NUM);
			if nTag <= 0 then
				Talk(1,"","<color=green>Ch� l玦 i<color>: Зy l� l玦 i t� i, kh玭g th� th玭g qua l玦 i t cc m� v祇.");
				return
			end
			if HaveSingleTemaGameTitleYJ() == 1 then
				OldPlayer = PlayerIndex;
				PlayerIndex = GetMissionV(CAPTAIN_ID);
				if PlayerIndex > 0 then
					nCaptainName = gf_GetCaptainName();
					nTeamSize = gf_GetTeamSize();
				end
				PlayerIndex = OldPlayer;
				Say("C� ph秈 ngi mu鑞 ch鋘 <color=yellow>"..nCaptainName.."<color> d蒼 d総 (g錷 c�"..nTeamSize.."ngi) ng k� khi猽 chi課 ho芻 v祇 u trng quan chi課? <color=red>V祅g cc khi猽 chi課 l�:"..GetMissionV(MS_YAJING_NUM).."J<color>",
					3,
					"Khi猽 chi課 (Gi秈 t cc)/#RequestGame2CaptianYJ("..nMapIndex..")",
					"Quan chi課 (gi秈 t cc)/#RequestViewSingleTeamGame("..nMapIndex..")",
					"R阨 kh醝/OnCancel_Talk"
					)
			end
		elseif nMapState == 3 then
			GameOverTalk();
		end
	end
	
	SubWorld = OldWorld;
	
end

--押金擂台报名
function AskSingleTeamYJNum(num)
		--押金数目检测
		if num < 100 or num > 5000 then
			Talk(1,"","<color=green>Ch� l玦 i<color>: v祅g t cc trong ph筸 vi 100-5000 v祅g, vt qu� ho芻 輙 h琻 ta kh玭g x� l�.");
			return 0;
		end
		
		local nMapIndex = GetTaskTemp(TMP_TASK_BW_YAJIN_LEITAI);
		OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
		
		--二次判断
		if GetMissionV(TEAM_GAME_STATE) ~= 0 or GetMissionV(MS_YAJING_NUM) > 0 then
			Talk(1,"","<color=green>Ch� l玦 i<color>:  c� ngi ng k� trc r錳, c竎 h� kh玭g th� khi猽 chi課 l玦 i n祔 n鱝")
			return 0;
		end
		
		if Pay(num * 10000) == 1 then
			gf_WriteLogEx("L玦 i t cc","Chi tr� v祅g cc",num," Kim ","",GetTongName(),"","","","");
			OpenMission(SINGLE_TEAM_MISSION_ID);
			local OldPlayer = PlayerIndex;
			for i=1, gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					CleanInteractive();
					x,y,z = GetWorldPos();
					SetTask(MS_POS,x);
					SetTask(MS_POS+1,y);
					SetTask(MS_POS+2,z);
					NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
					SCCheckOfflineExp(4)
					AddMSPlayer(SINGLE_TEAM_MISSION_ID,1);--加入阵营
					SetPlayerState(1,1,2);--设置准备状态
					SetTaskTemp(PLAYER_CAMP,1);--记录玩家阵型
					SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
					SetCreateTeam(1); --关闭组队功能
				end
  			end
  			PlayerIndex = OldPlayer;
			--SetMissionV(TEAM_GAME_STATE,1); 			
			SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
			SetMissionV(CAPTAIN_ID, gf_GetTeamMember(0)); 			
			--StartMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID,SINGLE_TEAM_TIMER);
			--设置押金数目
			SetMissionV(MS_YAJING_NUM, num);
		else
			Talk(1,"","<color=green>Ch� l玦 i<color>: v祅g kh玭g , t cc th蕋 b筰.")
		end
end

function RequestGame2Captian(nMapIndex)

local nMapState = 0;
local strSay = "";
local nTeamNum = 0;
local nCaptainName = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);		
		--尚未有比赛
		if nMapState == 0 then
			Say("Tr薾 a n祔 ch璦 c� thi u. Ngi c� mu鑞 ng k� v� xin chuy觧 v祇 u trng kh玭g?",
				2,
				"Жng k�/#OpenSingleTeamRoom("..nMapIndex..")",
				"R阨 kh醝/OnCancel_Talk"
				)		
		--比赛已经开始或两支队伍已在准备中		
		elseif nMapState >= 2 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			Say("Tr薾 a n祔  b総 u thi u, i ng� hai phe do <color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color> v� <color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color> d蒼 d総. C� mu鑞 v祇 tr薾 a n祔 xem thi u?",
				2,
				"Xem thi u/#RequestViewSingleTeamGame("..nMapIndex..")",
				"R阨 kh醝/OnCancel_Talk"
				)
		--比赛尚未开始
		elseif nMapState == 1 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			if HaveSingleTemaGameTitle() == 1 then
				--if GetMissionS(CAPTAIN_NAME) == "" then
					--nCaptainName = GetMissionS(CAPTAIN_NAME+1);
				--else
					nCaptainName = GetMissionS(CAPTAIN_NAME);
				--end
				Talk(1,"","B筺  g鰅 l阨 th豱h c莡 t� v� n i"..nCaptainName..", h穣 ki猲 nh蒼 ch� i i phng tr� l阨!");
				SendChallenge2Captain(nMapIndex,PlayerIndex,gf_GetTeamSize());
			end
		end 
	end

	SubWorld = OldWorld;

end

--押金擂台
function RequestGame2CaptianYJ(nMapIndex)

	local nMapState = 0;
	local strSay = "";
	local nTeamNum = 0;
	local nCaptainName = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);	
		local nTag = GetMissionV(MS_YAJING_NUM);
		if nTag <= 0 then
			Talk(1,"","<color=green>Ch� l玦 i<color>: Зy l� l玦 i t� i, kh玭g th� th玭g qua l玦 i t cc m� v祇.");
			return
		end
		--尚未有比赛
		if nMapState == 0 then
			Say("Tr薾 a n祔 ch璦 c� thi u. Ngi c� mu鑞 ng k� v� xin chuy觧 v祇 u trng kh玭g?",
				2,
				"t s﹏ thi u (Gi秈 t cc)/#OpenSingleTeamRoomYJ("..nMapIndex..")",
				"R阨 kh醝/OnCancel_Talk"
				)		
		--比赛已经开始或两支队伍已在准备中		
		elseif nMapState >= 2 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			Say("Tr薾 a n祔  b総 u thi u, i ng� hai phe do <color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color> v� <color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color> d蒼 d総. C� mu鑞 v祇 tr薾 a n祔 xem thi u?",
				2,
				"Quan chi課 (gi秈 t cc)/#RequestViewSingleTeamGame("..nMapIndex..")",
				"R阨 kh醝/OnCancel_Talk"
				)
		--比赛尚未开始
		elseif nMapState == 1 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			if HaveSingleTemaGameTitleYJ() == 1 then
				--if GetMissionS(CAPTAIN_NAME) == "" then
					--nCaptainName = GetMissionS(CAPTAIN_NAME+1);
				--else
					nCaptainName = GetMissionS(CAPTAIN_NAME);
				--end
				Talk(1,"","B筺  g鰅 l阨 th豱h c莡 t� v� n i"..nCaptainName..", h穣 ki猲 nh蒼 ch� i i phng tr� l阨!");
				SendChallenge2CaptainYJ(nMapIndex,PlayerIndex,gf_GetTeamSize());
			end
		end 
	end

	SubWorld = OldWorld;

end

--向队长发比武申请
function SendChallenge2Captain(nMapIndex,nChallengeIndex,nChallengeTeamSize)
	local nChallengeName = "";
	
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		nChallengeName = GetName();
	end
	PlayerIndex = OldPlayer;
	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		OldPlayer = PlayerIndex;
		PlayerIndex = GetMissionV(CAPTAIN_ID);
		if PlayerIndex > 0 then
			for i=3,10 do
				if GetMissionS(i) == "" then
					SetPlayerScript("\\script\\中原二区\\成都\\npc\\擂台老板.lua");
					SetMissionS(i,nChallengeName);
					Say("Do <color=yellow>"..nChallengeName.."<color> d蒼 d総 (g錷: <color=yellow>"..nChallengeTeamSize.."<color> ngi) m阨 ngi t� v�. Ngi ng � kh玭g?",
					2,
					"уng �/#AG("..nMapIndex..","..nChallengeIndex..","..i..")",
					"C� tuy謙/#RG("..nMapIndex..","..nChallengeIndex..","..i..")"
					)
					break
				end
			end
		end
		PlayerIndex = OldPlayer;
	end
	SubWorld = OldWorld;
end

--向队长发比武申请押金擂台
function SendChallenge2CaptainYJ(nMapIndex,nChallengeIndex,nChallengeTeamSize)
	local nChallengeName = "";
	
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		nChallengeName = GetName();
	end
	PlayerIndex = OldPlayer;
	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		OldPlayer = PlayerIndex;
		PlayerIndex = GetMissionV(CAPTAIN_ID);
		if PlayerIndex > 0 then
			for i=3,10 do
				if GetMissionS(i) == "" then
					SetPlayerScript("\\script\\中原二区\\成都\\npc\\擂台老板.lua");
					SetMissionS(i,nChallengeName);
					Say("Do <color=yellow>"..nChallengeName.."<color> d蒼 d総 (g錷: <color=yellow>"..nChallengeTeamSize.."<color> ngi) m阨 ngi t� v�. Ngi ng � kh玭g?",
					2,
					"уng �/#AGYJ("..nMapIndex..","..nChallengeIndex..","..i..")",
					"C� tuy謙/#RGYJ("..nMapIndex..","..nChallengeIndex..","..i..")"
					)
					break
				end
			end
		end
		PlayerIndex = OldPlayer;
	end
	SubWorld = OldWorld;
end

--双方同意比赛
--参数 nMapIndex：比赛场地在SingleTeamMapTab中的index；nChallengeIndex：挑战者的PlayerIndex；nChallengeNameIndex：挑战者姓名在Mission中的index。
function AG(nMapIndex,nChallengeIndex,nChallengeNameIndex)

	local i = 0;
	local x,y,z = 0,0,0;
	local nCamp = 0;
	local str_news = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		--保证场地内还未有其他挑战者进入且比赛尚未开始
		if GetMissionV(TEAM_GAME_STATE) == 1 then
		
			if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 then
				nCamp = 2;
			elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
				nCamp = 1;
			end
			
			if nCamp == 1 or nCamp == 2 then			
				OldPlayer = PlayerIndex;
				PlayerIndex = nChallengeIndex;
				if PlayerIndex > 0 then
					if GetName() == GetMissionS(nChallengeNameIndex) then
						--申请者不在当前擂台地图城市则返回
						if GetWorldPos() ~= SingleTeamMapTab[nMapIndex][2] then
							return
						end
						SetMissionS(nChallengeNameIndex,"");--清空申请人姓名
						if HaveSingleTemaGameTitle() == 1 then
							SetMissionV(CAPTAIN_ID+1,gf_GetTeamMember(0));
							SetMissionS(CAPTAIN_NAME+1,gf_GetCaptainName());
							for i=1,gf_GetTeamSize() do
								PlayerIndex = gf_GetTeamMember(i);
	  						if PlayerIndex > 0 then
	  							x,y,z = GetWorldPos();
									SetTask(MS_POS,x);
									SetTask(MS_POS+1,y);
									SetTask(MS_POS+2,z);
	  							CleanInteractive();
	  							NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
	  							SCCheckOfflineExp(4)
									AddMSPlayer(SINGLE_TEAM_MISSION_ID,2);--加入阵营
									SetPlayerState(1,1,3);--设置准备状态
									SetTaskTemp(PLAYER_CAMP,2);--记录玩家阵型
									SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
								end
	  					end
	  					str_news = "Do"..gf_GetCaptainName().."d蒼 d総 (g錷 c�"..gf_GetTeamSize().." ngi) v祇 tr薾."
							Msg2MSAll(SINGLE_TEAM_MISSION_ID,str_news);
	  				end
	  			end
	  		end
				PlayerIndex = OldPlayer;
			end
		end
	end
	SubWorld = OldWorld;
end

--押金擂台
--双方同意比赛
--参数 nMapIndex：比赛场地在SingleTeamMapTab中的index；nChallengeIndex：挑战者的PlayerIndex；nChallengeNameIndex：挑战者姓名在Mission中的index。
function AGYJ(nMapIndex,nChallengeIndex,nChallengeNameIndex)

	local i = 0;
	local x,y,z = 0,0,0;
	local nCamp = 0;
	local str_news = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		--保证场地内还未有其他挑战者进入且比赛尚未开始
		if GetMissionV(TEAM_GAME_STATE) == 1 then
		
			if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 then
				nCamp = 2;
			elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
				nCamp = 1;
			end
			
			if nCamp == 1 or nCamp == 2 then			
				OldPlayer = PlayerIndex;
				PlayerIndex = nChallengeIndex;
				if PlayerIndex > 0 then
					if GetName() == GetMissionS(nChallengeNameIndex) then
						--申请者不在当前擂台地图城市则返回
						if GetWorldPos() ~= SingleTeamMapTab[nMapIndex][2] then
							return
						end
						SetMissionS(nChallengeNameIndex,"");--清空申请人姓名
						if HaveSingleTemaGameTitleYJ() == 1 then
							--扣除挑战者的钱
							if Pay(GetMissionV(MS_YAJING_NUM) * 10000) ~= 1 then
								Talk(1,"","<color=green>Ch� l玦 i<color>: v祅g kh玭g , t cc th蕋 b筰.")
								local sChallengeName = GetName();
								PlayerIndex = OldPlayer;
								Talk(1,"",format("<color=green>Ch� l玦 i<color>: K� khi猽 chi課 �%s� mang kh玭g  v祅g, khi猽 chi課 th蕋 b筰",sChallengeName))
								return
							end
							gf_WriteLogEx("L玦 i t cc","Chi tr� v祅g cc",GetMissionV(MS_YAJING_NUM)," Kim ","",GetTongName(),"","","","");
							-----------------
							SetMissionV(CAPTAIN_ID+1,gf_GetTeamMember(0));
							SetMissionS(CAPTAIN_NAME+1,gf_GetCaptainName());
							-----------------
							for i=1, gf_GetTeamSize() do
								PlayerIndex = gf_GetTeamMember(i);
								if PlayerIndex > 0 then
									x,y,z = GetWorldPos();
									SetTask(MS_POS,x);
									SetTask(MS_POS+1,y);
									SetTask(MS_POS+2,z);
									CleanInteractive();
									NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
									SCCheckOfflineExp(4)
									AddMSPlayer(SINGLE_TEAM_MISSION_ID,2);--加入阵营
									SetPlayerState(1,1,3);--设置准备状态
									SetTaskTemp(PLAYER_CAMP,2);--记录玩家阵型
									SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
									SetCreateTeam(1); --关闭组队功能
								end
							end
							str_news = "Do"..gf_GetCaptainName().."D蒼 theo t� i ho芻 c� nh﹏ n th﹏ khi猽 chi課 (c飊g "..gf_GetTeamSize().." ngi) v祇 tr薾."
							Msg2MSAll(SINGLE_TEAM_MISSION_ID,str_news);
						end
					end
				end
				PlayerIndex = OldPlayer;
			end
		end
	end
	SubWorld = OldWorld;
end

--拒绝挑战者的申请
--参数 nMapIndex：比赛场地在SingleTeamMapTab中的index；nChallengeIndex：挑战者的PlayerIndex；nChallengeNameIndex：挑战者姓名在Mission中的index。
function RG(nMapIndex,nChallengeIndex,nChallengeNameIndex)

local nRejectorName = "";
local nChallengeName = GetMissionS(nChallengeNameIndex);

	SetMissionS(nChallengeNameIndex,"");--清空申请人姓名
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		--OldWorld = SubWorld;
		--SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
		--if SubWorld ~= -1 then
			if GetName() == nChallengeName then
				nRejectorName = GetMissionS(CAPTAIN_NAME);
				TalkEx("",{"Ch� l玦 i:"..nRejectorName.." t� ch鑙 l阨 khi猽 chi課 c馻 b筺!"});
			end
		--end
		--SubWorld = OldWorld;
	end
	PlayerIndex = OldPlayer;
end

--押金擂台
--拒绝挑战者的申请
--参数 nMapIndex：比赛场地在SingleTeamMapTab中的index；nChallengeIndex：挑战者的PlayerIndex；nChallengeNameIndex：挑战者姓名在Mission中的index。
function RGYJ(nMapIndex,nChallengeIndex,nChallengeNameIndex)

	local nRejectorName = "";
	local nChallengeName = GetMissionS(nChallengeNameIndex);

	SetMissionS(nChallengeNameIndex,"");--清空申请人姓名
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		--OldWorld = SubWorld;
		--SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
		--if SubWorld ~= -1 then
			if GetName() == nChallengeName then
				nRejectorName = GetMissionS(CAPTAIN_NAME);
				TalkEx("",{"Ch� l玦 i:"..nRejectorName.." t� ch鑙 l阨 khi猽 chi課 c馻 b筺!"});
			end
		--end
		--SubWorld = OldWorld;
	end
	PlayerIndex = OldPlayer;
end

--单挑队伍观战处理
function RequestViewSingleTeamGame(nMapIndex)

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]); 
	
	if GetMissionV(TEAM_GAME_STATE) == 0 then
		Say("Xin l鏸! Tr薾 a n祔 ch璦 b総 u! L莕 sau h穣 n nh�!",0);
	elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,3) < MAX_MULTIMAP_AUDIENCE_NUM then
		CleanInteractive();
		NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
		SetPlayerState(1,2);--设置观战状态
		AddMSPlayer(SINGLE_TEAM_MISSION_ID,3);--加入阵型
		SetTaskTemp(PLAYER_CAMP,3);--记录玩家阵型
	else 
		Say("Xin l鏸! Kh竛 gi�  y. L莕 sau nhanh ch﹏ nh�!",0);
	end
	
	SubWorld = OldWorld;
	
end

---------------多人组队混战擂台----------------------------
function RequestTeamGame(nMapIndex)

local nMapState = 0;
local strSay = "";

	--已经预订了单人擂台的玩家给予通知并不允许进入赛场	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ngi  ng k� tr薾 a n nh﹏ l玦 i, kh玭g th� v祇 l玦 i kh竎!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]);
	
	if SubWorld ~= -1 then
		if GetMissionV(TEAM_GAME_STATE) == 0 then
			if IsTeamAwardTime() == 1 then
				TeamGamePreparingTalk();
			else
				Say("L玦 i n祔 ch璦 c� ngi ng k�. Ngi mu鑞 ng k� tr薾 a kh玭g?",
						2,
						"Жng k�/#JoinTeamRoom("..nMapIndex..")",
						"R阨 kh醝/OnCancel_Talk"
				)
			end
		elseif GetMissionV(TEAM_GAME_STATE) == 1 then
			if GetGameTeamNum() < MAX_TEAM_NUM then
				if IsTeamAwardTime() == 1 then
					if GetMissionV(GAME_TYPE) == 3 then
						strSay = "чi trng t� i tham gia <color=yellow>tr薾 th� 1<color> 祅 чi k輈h chi課 c� th� b竜 danh thi u mi詎 ph�. Thi u k誸 th骳, ngi tham d� u nh薾 頲 <color=yellow>甶觤 s鴆 kh醗 v� ph莕 thng kh竎<color>. Ch糿g hay c竎 h� c� mu鑞 tham gia?";
					elseif GetMissionV(GAME_TYPE) == 4 then
						strSay = "в tham gia <color=yellow>tr薾 th� 2<color> 祅 чi K輈h Chi課 i trng ph秈 n閜 <color=yellow>10 v祅g<color> ph� b竜 danh thi u. S� i thi u t鑙 產 l� <color=yellow>10 t� i<color>. T� i chi課 th緉g cu鑙 c飊g c� th� nh薾 頲 ph莕 thng ti襫 phong ph�. Ch糿g hay c竎 h� c� mu鑞 tham gia?";
					end
				else
					strSay = "L玦 i n祔 hi謓 c� <color=yellow>"..GetGameTeamNum().."<color> 產ng chu萵 b� thi u. C竎 h� mu鑞 thi u hay v祇 xem?";
				end
				
				Say(strSay,
						3,
						"Tham gia t� v�/#JoinTeamRoom("..nMapIndex..")",
						"V祇 xem thi u/#RequestViewTeamGame("..nMapIndex..")",
						"R阨 kh醝/OnCancel_Talk"
				)
			else
				Say("S� i ng� b竜 danh tr薾 a n祔  t"..MAX_TEAM_NUM..", ngi mu鑞 v祇 xem thi u kh玭g?",
					2,
					"V祇 xem thi u/#RequestViewTeamGame("..nMapIndex..")",
					"R阨 kh醝/OnCancel_Talk"
			)
			end
		
		elseif GetMissionV(TEAM_GAME_STATE) == 2 then
		
			Say("Tr薾 a thi u l玦 i n祔  b総 u. Ngi mu鑞 v祇 xem kh玭g?",
					2,
					"V祇 xem thi u/#RequestViewTeamGame("..nMapIndex..")",
					"R阨 kh醝/OnCancel_Talk"
			)
		end
	end
	SubWorld = OldWorld;
	
end

function JoinTeamRoom(nMapIndex)

local i = 0;
local x,y,z = 0,0,0;
local nGameTeamIndex = 0;
local news_str = "";
	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]);
	
	if SubWorld < 0 then
		WriteLog("[ nh﹏ t� i l玦 i]T譶h tr筺g u trng hi謓 t筰 SubWorld b竜 l鏸. B竜 l鏸 MapID l�"..TeamMapTab[nMapIndex][1]..", SubWorld l�"..SubWorld..".");
		SubWorld = OldWorld;
		return 0
	end
	
	if HaveTemaGameTitle(GetMissionV(GAME_TYPE)) == 0 then
		return
	end
	
	nGameState = GetMissionV(TEAM_GAME_STATE);
		
	--赛场尚没有人
	if nGameState == 0 then
		OpenMission(TEAM_MISSION_ID);
		nNpcIndex = CreateNpc("Ch� c莔  Trung Nguy猲","Чi Ch� Cng",TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][6],TeamMapTab[nMapIndex][7]);--添加一个传送出场地用的Npc
		SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\team_game_npc.lua")
		SetMissionV(NPC_INDEX,nNpcIndex)
		
		OldPlayer = PlayerIndex;
		
  		for i=1,gf_GetTeamSize() do
  			PlayerIndex = gf_GetTeamMember(i);
  			if PlayerIndex > 0 then
  				x,y,z = GetWorldPos();
  				SetTask(MS_POS,x);
					SetTask(MS_POS+1,y);
					SetTask(MS_POS+2,z);
  				CleanInteractive();
  				NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
  				SCCheckOfflineExp(4)
					AddMSPlayer(TEAM_MISSION_ID,1);--加入阵营
					SetPlayerState(1,1,1);--设置准备状态
					SetTaskTemp(PLAYER_CAMP,1);--记录玩家阵型
					SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
					AddTitle(21,1);
					SetCurTitle(21,1);				
				end
  		end
  		
  		PlayerIndex = OldPlayer;
  		
  		SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
  		SetMissionV(CAPTAIN_ID,gf_GetTeamMember(0));
  		
			StartMissionTimer(TEAM_MISSION_ID, TEAM_TIME_ID1, TEAM_TIMER_1);
			news_str = GetPlayerInfo(gf_GetTeamMember(0))..gf_GetCaptainName().."c飊g n� b閏 產ng �"..TeamMapTab[nMapIndex][9].."l玦 i s緋 x誴 T� i h鏽 chi課 l玦 i! M阨 c竎 anh h飊g tham gia th� luy謓!";
			SubWorld = OldWorld;
			Msg2SubWorld(news_str);
		
		--报名阶段	
		elseif nGameState == 1 then
		
			if GetGameTeamNum() >= MAX_TEAM_NUM then	
				TalkEx("",{"чi ng�  vt qu� 10 i! L竧 sau h穣 quay l筰!"});
				SubWorld = OldWorld;
				return
			end
		
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) == 0 then
					SetMissionS(CAPTAIN_NAME + i - 1,gf_GetCaptainName());
					SetMissionV(CAPTAIN_ID + i - 1,gf_GetTeamMember(0));
					nGameTeamIndex = i;
					break;
				end
			end
  		
  		OldPlayer = PlayerIndex;
  		
  		for i=1,gf_GetTeamSize() do
  			PlayerIndex = gf_GetTeamMember(i);
  			if PlayerIndex > 0 then
  				x,y,z = GetWorldPos();
					SetTask(MS_POS,x);
					SetTask(MS_POS+1,y);
					SetTask(MS_POS+2,z);
  				CleanInteractive();
  				NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
  				SCCheckOfflineExp(4)
					AddMSPlayer(TEAM_MISSION_ID,nGameTeamIndex);--加入阵营
					SetPlayerState(1,1,1);--设置准备状态
					SetTaskTemp(PLAYER_CAMP,nGameTeamIndex);--记录玩家阵型
					SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
					AddTitle(21,nGameTeamIndex);
					SetCurTitle(21,nGameTeamIndex);
				end
  		end
  		
  		PlayerIndex = OldPlayer;
  		
  		news_str = "Do "..GetName().." d蒼 d総 (g錷 c�"..gf_GetTeamSize().." ngi)   v祇 l玦 i. S� i hi謓 t筰 l�"..GetGameTeamNum()..". "
  		
  		if GetMissionV(GAME_TYPE) ~= 3 and GetMissionV(GAME_TYPE) ~= 4 and GetMissionV(TEAM_NEWS_STATE) > 3 then
				SetMissionV(TEAM_NEWS_STATE,GetMissionV(TEAM_NEWS_STATE)-3);
				news_str = news_str.."Do c� i m韎 v祇 tr薾, th阨 gian chu萵 b� s� k衞 d礽 th猰 1 ph髏!";
			end
			Msg2MSAll(TEAM_MISSION_ID,news_str);
		
		--比赛阶段 
		elseif nGameState >= 2 then
			TalkEx("",{"Thi u  b総 u! L竧 sau h穣 n!"});
		end
	
	SubWorld = OldWorld;

end

--队伍混战观战处理
function RequestViewTeamGame(nMapIndex)

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]); 
	
	if SubWorld ~= -1 then
		if GetMissionV(TEAM_GAME_STATE) == 0 then
			Say("Xin l鏸! Tr薾 a n祔 ch璦 b総 u! L莕 sau h穣 n nh�!",0);
		elseif GetMSPlayerCount(TEAM_MISSION_ID,1) < MAX_MULTIMAP_AUDIENCE_NUM then
			CleanInteractive();
			NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
			SetPlayerState(1,2);--设置观战状态
			AddMSPlayer(TEAM_MISSION_ID,11);--加入阵型
			SetTaskTemp(PLAYER_CAMP,11);--记录玩家阵型
		else
			Say("Xin l鏸! Kh竛 gi�  y. L莕 sau nhanh ch﹏ nh�!",0);
		end
	end
	
	SubWorld = OldWorld;
	
end

function TeamGamePreparingTalk()
	
local nHour = GetLocalTime()

	if nHour >= 11 and nHour <= 12 then
		Say("Xin l鏸! Tr薾 a 產ng chu萵 b�. <color=yellow>Tr薾 th� 1<color> чi chi課 b総 u b竜 danh v祇 <color=yellow>12:00<color>; <color=yellow>Tr薾 th� 2<color> b総 u b竜 danh v祇<color=yellow>12:30<color>.",0)
	elseif nHour >= 17 and nHour <= 18 then
		Say("Xin l鏸! Tr薾 a 產ng chu萵 b�. <color=yellow>Tr薾 th� 1<color> чi chi課 b総 u b竜 danh v祇 <color=yellow>18:00<color>; <color=yellow>Tr薾 th� 2<color> b総 u b竜 danh v祇<color=yellow>18:30<color>.",0)
	elseif nHour >= 22 and nHour <= 23 then
		Say("Xin l鏸! Tr薾 a 產ng chu萵 b�. <color=yellow>Tr薾 th� 1<color> чi chi課 b総 u b竜 danh v祇 <color=yellow>23:00<color>; <color=yellow>Tr薾 th� 2<color> b総 u b竜 danh v祇<color=yellow>23:30<color>.",0)
	end
	
end
function GameOverTalk()
	Say("L玦 i  k誸 th骳! Xin i trong gi﹜ l竧!",0)
end
--51活动师门历练擂台说明
function AboutShiMenGame()

local nSZNum = 0;
local nGZNum = 0;

	if GetTask(PLAYERAWARD_DATE) == Zgc_pub_week_seq() then
		nSZNum = GetTask(PLAYERAWARD_TIMES);
	end
	
	if GetTask(AUDIENCEAWARD_DATE) == Zgc_pub_week_seq() then
		nGZNum = GetTask(AUDIENCEAWARD_TIMES);
	end

	strTalk = {
		"Ngi ch琲 tr猲 c蕄 75, l謈h nhau kh玭g qu� 5 c蕄 u c� th� tham gia thi u. Chi課 th緉g s� nh薾 頲 1 quy觧 Th鵦 Chi課 t﹎ c. Ngi ch琲 tr猲 c蕄 10 quan kh竛 s� nh薾 頲 1 quy觧 Quan Chi課 t﹎ c. M鏸 ngi m鏸 tu莕 c� th� nh薾 t鑙 產 20 quy觧 Th鵦 Chi課 t﹎ c v� 40 quy觧 Quan Chi課 t﹎ c. Ngi tu莕 n祔  nh薾 "..nSZNum.." quy觧 Th鵦 Chi課 T﹎ Ьc v� "..nGZNum.." quy觧 Quan Chi課 T﹎ Ьc.",
		}

	TalkEx("",strTalk);
	
end
