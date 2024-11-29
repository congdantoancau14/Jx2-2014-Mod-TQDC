Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	npc_talk_main()
end

function npc_talk_main()
	local tbSay = {}
	tinsert(tbSay, format("%s/how_to_enter", "Lµm sao ®Ó vµo V¹n Linh §µi"))
	tinsert(tbSay, format("%s/#iwant_enter(0)", "Vµo V¹n Linh §µi"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szMsg = format("%s:%s", "<color=green>Yªu Hå<color>", "Chµo mõng ®Õn víi V¹n Linh §µi, b¹n chuÈn bÞ xong ch­a?")
	Say(szMsg,getn(tbSay),tbSay)
end

function how_to_enter()
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szMsg = format("%s:%s", "<color=green>Yªu Hå<color>", "Cã thÓ c¸ nh©n hoÆc tæ ®éi ®Ó vµo. C¸ nh©n vµo:  cÇn hoµn thµnh nhiÖm vô sö thi vò khÝ Háa Phông tr­íc, tiªu hao 1 Thiªn Kiªu LÖnh ®Ó vµo. Tæ ®éi vµo:  §éi tr­ëng cÇn hoµn thµnh nhiÖm vô sö thi vò khÝ Háa Phông, nép cho b¶n th©n vµ tÊt c¶ thµnh viªn, mçi ng­êi 1 Thiªn Kiªu LÖnh míi cã thÓ vµo.")
	Say(szMsg,getn(tbSay),tbSay)
end


function iwant_enter(bConfirm)
	if not bConfirm or bConfirm ~= 1 then
		local tbSay = {}
		tinsert(tbSay, format("%s/#iwant_enter(1)", "X¸c nhËn ®i vµo"))
		tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
		tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
		local szMsg = format("%s:%s", "<color=green>Yªu Hå<color>", "§i vµo V¹n Linh §µi ®éi tr­ëng tiªu hao thiªn kiªu lÖnh ,sè l­îng t­¬ng ®­¬ng víi sè ng­êi tæ ®éi, cã x¸c nhËn ®i vµo kh«ng?")
		Say(szMsg,getn(tbSay),tbSay)
		return
	end
	
	local nPlayerNum = GetTeamSize()
	if nPlayerNum < 1 then
		nPlayerNum = 1
	end
	if tGtTask:check_task_isfinish(270) ~= 1 then
		Talk(1,"","Hoµn thµnh chuçi nhiÖm vô Háa Phông míi ®­îc vµo V¹n Linh §µi!")
		return
	end
	if nPlayerNum > 1 then
    	if GetName() ~= GetCaptainName() then
    		Talk(1,"",g_NpcName.."ChØ cã ®éi tr­ëng míi ®­îc thao t¸c");
    		return 0;
    	end
	end
	local nOK,szMsg = consume_tianjiaoling(0, nPlayerNum)
	if  nOK ~= 1 then
		Talk(1,"",szMsg)
		return 0
	end
	nOK,szMsg = consume_tianjiaoling(1, nPlayerNum)
	if  nOK ~= 1 then
		Talk(1,"",szMsg)
		return 0
	end
	gf_TeamOperateEX(confirm_enter)
	return 1
end


function confirm_enter()
	NewWorld(8011, 1554, 3222)
	SetFightState(1)
end

T_NEED_ITEM = {
	{"Thiªn Kiªu LÖnh",2,97,236,1},
}
function consume_tianjiaoling(bDelete, nPlayerNum)
	local szMsg = nil
	for i = 1, getn(T_NEED_ITEM) do
    	local ti = T_NEED_ITEM[i]
    	local nNeed = ti[5] * nPlayerNum
    	if ti[2] ~= -1 then
        	if GetItemCount(ti[2], ti[3], ti[4]) < nNeed then
        		szMsg = format("%sx%d kh«ng ®ñ", ti[1], nNeed)
        		return 0,szMsg
        	end
    	else
    		if GetCash() < nNeed*10000 then
    			szMsg = format("Kh«ng cã %d%s", ti[1], nNeed)
        		return 0,szMsg
    		end
    	end
	end
	
	if 1 == bDelete then --ËùÓÐ¶¼¼ì²éÍ¨¹ýÁË£¬Ö´ÐÐÉ¾³ý
		for i = 1, getn(T_NEED_ITEM) do
            local ti = T_NEED_ITEM[i]
            local nNeed = ti[5] * nPlayerNum
        	if ti[2] ~= -1 then
        		local nDelResult = DelItem(ti[2], ti[3], ti[4], nNeed)
        		if not nDelResult or nDelResult ~= 1  then
        			return 0,szMsg
        		end
        	else
        		if 1 ~= Pay(nNeed*10000) then
        			return 0,szMsg
        		end
        	end
    	end
	end
	return 1,szMsg
end
