--ºÚÒÂÈË¸øµÄ½âÒ©¡¢ºÚÒÂÈËÁôÏÂµÄĞÅ¼ş¡¢
--E:\Kingsoft\ÓÎÏ·ÔËĞĞ×ÊÔ´\½£ÏÀ·¡Íâ´«\·şÎñ¶ËÅäÖÃÎÄ¼ş\GameSvr\script\lib\define.lua
Include("\\script\\lib\\define.lua")

--TASKID_SW_USE_ANTIDOTE  = 3476;
--TASKID_SW_READ_LETTER   = 3477      

tItemInfo = {
	[111] = {"Thuèc gi¶i cña h¾c y nh©n",TASKID_SW_USE_ANTIDOTE,"Sau khi dïng thuèc gi¶i do h¾c y nh©n ®Ó l¹i, xem ra chÊt ®éc ®· bŞ ng¨n chÆn råi.",1,1},  --{"",taskid,"msg",stateID,ifDelete}
	[113] = {"Th­ tİn do h¾c y nh©n ®Ó l¹i",TASKID_SW_USE_ANTIDOTE,"ThiÕu hiÖp hiÖn t¹i tuy ®· tróng kŞch ®éc, nh­ng chóng ta ®o¸n r»ng thiÕu hiÖp nhÊt ®Şnh sÏ quay l¹i ®Ó t×m vËt phÈm nµy. §a t¹ thiÕu hiÖp ®· gióp chóng t«i më c¬ quan nªn míi tróng ®éc, thuèc gi¶i nµy tuy kh«ng thÓ phôc håi c«ng lùc, nh­ng còng cã thÓ gi÷ ®­îc m¹ng sèng. V× ®iÒu tra chuyÖn cèng phÈm, vËt phÈm trong hép chóng t«i sÏ lÊy ®i, ®ã vèn lµ lÖnh bµi cña <color=green>Liªu Quèc Tiªu Thiªn Hùu<color>, nÕu thiÕu hiÖp vÉn muèn tiÕp tôc ®iÒu tra, th× nhí h·y cÈn thËn!",},	
	}

tItemID1 = 2;
tItemID2 = 96;
function OnUse(nItemIdx)

	local g,d,p = GetItemInfoByIndex(nItemIdx);
	if g ~= tItemID1 or d ~= tItemID2 or not tItemInfo[p] then
		return 0;
	end          
	local tItem =  tItemInfo[p];
	if  tItemInfo[p][5] and  tItemInfo[p][5] == 1  then
		if DelItem(g,d,p,1) ~= 1 then return 0;end;
	end
	if tItem[3] and tItem[1] and tItem[3] ~= "" then
		Talk(1,"",tItem[3])
	end
	if tItem[2] then
		SetTask(tItem[2],1);
	end
	if type(tItem[4]) == "number" then
		RemoveState(tItem[4]);
	end

end