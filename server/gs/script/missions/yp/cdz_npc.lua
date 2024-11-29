Include("\\script\\missions\\yp\\yp_head.lua")

tNpcDir = {
	{1,2,3},
	{4,5,6},
	{7,8,9}
}

tCDZList = {
  [6000] = {
	  {"§¹i Lý TruyÒn §¹o 1","§Ö NhÊt"},
	  {"§¹i Lý TruyÒn §¹o 2","§Ö NhÞ"},
	  {"§¹i Lý TruyÒn §¹o 3","§Ö Tam"},
	  {"§¹i Lý TruyÒn §¹o 4","§Ö Tø"},
	  {"§¹i Lý TruyÒn §¹o 5","§Ö Ngò"},
	  {"§¹i Lý TruyÒn §¹o 6","§Ö Lôc"},
	  {"§¹i Lý TruyÒn §¹o 7","§Ö ThÊt"},
	  {"§¹i Lý TruyÒn §¹o 8","§Ö B¸t"},
	  {"§¹i Lý TruyÒn §¹o 9","§Ö Cöu"},
	},
  [6100] = {
	  {"Thæ Phån TruyÒn §¹o 1","§Ö NhÊt"},
	  {"Thæ Phån TruyÒn §¹o 2","§Ö NhÞ"},
	  {"Thæ Phån TruyÒn §¹o 3","§Ö Tam"},
	  {"Thæ Phån TruyÒn §¹o 4","§Ö Tø"},
	  {"Thæ Phån TruyÒn §¹o 5","§Ö Ngò"},
	  {"Thæ Phån TruyÒn §¹o 6","§Ö Lôc"},
	  {"Thæ Phån TruyÒn §¹o 7","§Ö ThÊt"},
	  {"Thæ Phån TruyÒn §¹o 8","§Ö B¸t"},
	  {"Thæ Phån TruyÒn §¹o 9","§Ö Cöu"},
	},
  [6200] = {
	  {"T©y H¹ TruyÒn §¹o 1","§Ö NhÊt"},
	  {"T©y H¹ TruyÒn §¹o 2","§Ö NhÞ"},
	  {"T©y H¹ TruyÒn §¹o 3","§Ö Tam"},
	  {"T©y H¹ TruyÒn §¹o 4","§Ö Tø"},
	  {"T©y H¹ TruyÒn §¹o 5","§Ö Ngò"},
	  {"T©y H¹ TruyÒn §¹o 6","§Ö Lôc"},
	  {"T©y H¹ TruyÒn §¹o 7","§Ö ThÊt"},
	  {"T©y H¹ TruyÒn §¹o 8","§Ö B¸t"},
	  {"T©y H¹ TruyÒn §¹o 9","§Ö Cöu"},
	},
}

tSomeFeihua = {
	[6000] = {
		"ThiÕu hiÖp cã muèn tham ngé mét ®o¹n phËt ph¸p cïng víi ta kh«ng?",
		"H¶o h¸n tha m¹ng, ®©y lµ do ë trªn ®­a xuèng, nªn ta ®­a l¹i, ta thËt sù kh«ng biÕt!",
	},
	[6100] = {
		"Tho¸t lôc ®¹o chóng sinh, gi¶i trõ s¸u lo¹i phiÒn n¹o, tu lôc ban nh­îc hµnh, nhËn ®­îc s¸u lo¹i phËt th©n, sinh ra s¸u lo¹i trÝ tuÖ. ThiÕu hiÖp qu¶ lµ ng­êi cã tuÖ c¨n, hay lµ chóng ta vÒ trong tù nµo!",
		"QuyÓn kinh th­ nµy qu¶ thËt rÊt tèt, nªn tÆng cho thiÕu hiÖp, khi cã thêi gian h·y ®Õn nhµ cña ta trß chuyÖn nhÐ.",
	},	
	[6200] = {
		"ThiÕu hiÖp cã ®ång ý gia nhËp kh«ng?",
		"§­îc råi, trªn ®­êng ®i ta nhÆt ®­îc quyÓn kinh th­ nµy, nÕu cña ng­¬i th× h·y cÇm lÊy ®i.",
	},
};

tFightNpc = {
	[6000] = {"§¹i Lý Hoµng Téc Qu©n SÜ","§¹i Lý Hoµng Téc Qu©n SÜ"},
	[6100] = {"Thæ Phån Phiªn T¨ng","Thæ Phån Phiªn T¨ng"},	
	[6200] = {"T©y H¹ Qu©n SÜ","T©y H¹ Qu©n SÜ"},
}

function main()
	local nNpcIdx = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIdx);
	local g_NpcName = "<color=green>"..strNpcName.."<color>: ";
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID = GetWorldPos();
	
	if nCamp == 0 or tMainMapID[nCamp] == nil then
		Talk(1,"",g_NpcName..tSomeFeihua[nMapID][1]);
		return 0;
	end
	if tMainMapID[nCamp][1] == nil or tMainMapID[nCamp][1] == nMapID then
		Talk(1,"",g_NpcName.."§¹i hiÖp h·y ®Õn doanh tr¹i phe ®Þch ®Ó ®o¹t kinh th­!");
		return 0;
	end
		
	if GetTask(TASK_FIELD_PVP_STEAL_BOOK) == 0 or GetTask(TASK_FIELD_PVP_STEAL_MAP) ~= nMapID then
		Talk(1,"",g_NpcName..tSomeFeihua[nMapID][1]);
		return 0;
	end

	if BigGetItemCount(2,95,825) >= 3 then
		Talk(1,"",g_NpcName.."Ng­¬i ®· trém 3 Kim Cang Kinh råi.");
		return 0;
	end

	local nNpcNum = 0;
	for i = 1,getn(tCDZList[nMapID]) do
		if tCDZList[nMapID][i][1] == strNpcName then
			nNpcNum = i;
			break;
		end
	end

	if nNpcNum ~= 0 then
		if gf_GetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum) == 1 then
			Talk(1,"",g_NpcName.."Chç cña ta ®· hÕt kinh th­ ®Ó ng­¬i trém råi!");
			return 0;
		end
	
		local nDirX,nDirY = 0,0; --¶¨Î»
		for i=1,getn(tNpcDir) do
			for j = 1,getn(tNpcDir[i]) do
				if nNpcNum == tNpcDir[i][j] then
					nDirX = i;
					nDirY = j;
					break;
				end
			end
		end
		if nDirX == 0 or nDirY == 0 then
			return 0;
		end
		local a,b,c,d = find_neighbor(nDirX,nDirY,tNpcDir);
		local t = {a,b,c,d}
		local strMsg = "";
		local nNum = 0;
		for i = 1,getn(t) do
			if t[i] ~= 0 then
				if gf_GetTaskBit(TASK_FIELD_PVP_STEAL_BOOK,t[i]) == 1 then
					nNum = nNum + 1;
				end
				if i > 1 then
					strMsg = strMsg..",";
				end
				strMsg = strMsg..tCDZList[nMapID][t[i]][2];
			end
		end
		if gf_GetTaskBit(TASK_FIELD_PVP_STEAL_BOOK,nNpcNum) ~= 1 then --Ä¾ÓÐ¾­Êé
			if gf_GetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum) ~= 1 then
				local tNpcCamp = {
					[6000] = 1,
					[6100] = 2,
					[6200] = 3
				};
				ModifyLife(GetLife()/2);
				local nIdx = CreateNpc(tFightNpc[nMapID][1],tFightNpc[nMapID][2],GetWorldPos());
				SetNpcLifeTime(nIdx,5*60);
				local nNpcCamp = tNpcCamp[nMapID];
				if tAllCamp[nNpcCamp] then
					SetCampToNpc(nIdx,tAllCamp[nNpcCamp]);
				end
				SetNpcScript(nIdx,"\\script\\missions\\yp\\monster_npc.lua");
				nIdx = CreateNpc(tFightNpc[nMapID][1],tFightNpc[nMapID][2],GetWorldPos());
				SetNpcLifeTime(nIdx,5*60);
				if tAllCamp[nNpcCamp] then
					SetCampToNpc(nIdx,tAllCamp[nNpcCamp]);
				end
				SetNpcScript(nIdx,"\\script\\missions\\yp\\monster_npc.lua");
				gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1,gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1)+1);
				gf_SetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum,1);
				Talk(1,"",g_NpcName.."Trªn ng­êi ta kh«ng cã Kim Cang Kinh, nh­ng ta thÊy ®­îc "..strMsg.." trong sè ng­êi truyÒn ®¹o, cã ng­êi mang theo "..nNum.." quyÓn.");
			else
				Talk(1,"",g_NpcName.."Trªn ng­êi ta kh«ng cã Kim Cang Kinh, nh­ng ta thÊy ®­îc "..strMsg.." trong sè ng­êi truyÒn ®¹o, cã ng­êi mang theo "..nNum.." quyÓn.");
			end
		else
			if gf_Judge_Room_Weight(2,10,"") ~= 1 then
				return 0;
			end
			gf_SetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum,1);
			gf_AddItemEx({2,95,825,1},"Kim Cang Kinh");
			if random(1,100) <= 1 then
				gf_AddItemEx({2,95,822,1},"Kim L¨ng Töu");
			end
			Talk(1,"",g_NpcName..tSomeFeihua[nMapID][2]);
		end
	end
end

function find_neighbor(nDirX,nDirY,tb)
	local a,b,c,d = 0,0,0,0;
	local nLenth = getn(tb[nDirX]);
	local nHight = getn(tb);
	if nDirX > 1 and nDirX < nHight then
		a = tb[nDirX+1][nDirY];
		b = tb[nDirX-1][nDirY];
	elseif nDirX == 1 then
		a = tb[nDirX+1][nDirY];
	elseif nDirX == nHight then
		a = tb[nDirX-1][nDirY];
	end
	if nDirY > 1 and nDirY < nLenth then
		c = tb[nDirX][nDirY+1];
		d = tb[nDirX][nDirY-1];
	elseif nDirY == 1 then
		c = tb[nDirX][nDirY+1];
	elseif nDirY == nLenth then
		d = tb[nDirX][nDirY-1];
	end
	return a,b,c,d;
end
