--ÍÁÅÚNPC
Include("\\script\\online\\201504_catch_fish\\head.lua")


function main()
	npc_talk_main()
end

function npc_talk_main()
	if check_player_condition()~= 1 then
		return
	end

	local szTitle = format("Ng­ D©n Thæ Ph¸o: Mçi lÇn tèi ®a cã thÓ bá vµo 100 phong ph¸o cïng lo¹i")
	local tbSay = {}
	local t = g_tCatchFish.tBombs
	for i=1,getn(t) do
		local name=t[i][1]
		local sel = format("Bá vµo %s",name)
		tinsert(tbSay, format("%s/#insert_bomb(%d)", sel, i))
	end
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function insert_bomb(nType)
	local t = g_tCatchFish.tBombs[nType]
	local ti = t[2]
	local nItem = GetItemCount(ti[1],ti[2],ti[3])
	local nMax = min(nItem, 100)
	if nMax > 0 then
		local szFunc = format("_insert_bomb_cb_%d", nType)
		AskClientForNumber(szFunc, 1, nMax, "Muèn bá vµo bao nhiªu c¸i?");
	else
		Talk(1,"",format("Kh«ng ®ñ %s ®Ó bá vµo", t[1]))
	end
end

function _insert_bomb_cb_1(nNum)
	return insert_bomb_callback(1,nNum)
end
function _insert_bomb_cb_2(nNum)
	return insert_bomb_callback(2,nNum)
end
function _insert_bomb_cb_3(nNum)
	return insert_bomb_callback(3,nNum)
end
function _insert_bomb_cb_4(nNum)
	return insert_bomb_callback(4,nNum)
end
function insert_bomb_callback(nType,nNum)
	if gf_Judge_Room_Weight(3, 100, "")~=1 then
		return
	end
	local t = g_tCatchFish.tBombs[nType]
	local it = t[2]
	if DelItem(it[1],it[2],it[3],nNum) ~=1 then
		return
	end
	local nExp = t[3] * nNum
	local nPoint = t[4]*nNum
	ModifyExp(nExp)
	for i=1,nNum do
		gf_EventGiveRandAward(t[5],100,1, "catch_fish", "catch_fish")
	end
	add_server_counter(nPoint)
end
