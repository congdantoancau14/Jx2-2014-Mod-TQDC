Include("\\settings\\static_script\\cheat\\gm_item_tifuzhiyin.lua");
Include("\\settings\\static_script\\cheat\\task\\list.lua");

g_szTitle = "<color=green>ThÎ T©n Thñ: <color>"

NewPlayerItem = {
	{"Cöu Thiªn V« Cùc §¬n", {2,1,1006,1}},
	{"ThÎ Thiªn H¹t", {2,1,30740,1}},
	{"Tiªu Dao Ngäc", {2,1,30603,1000}},
}

function OnUse(nItem)	
	local tSay = {}
	local nRoute = GetPlayerRoute();
	
	if nRoute <= 0 then
		tSay = {
			"Gia nhËp m«n ph¸i/JoinRoute_UpdateLevel",
		}
	else
		tSay = {
			"NhËn vËt phÈm Hç Trî T©n Thñ/GetNewPlayer",
			"NhËn MËt TÞch vµ YÕu QuyÕt hÖ ph¸i/GetMT",
			"Mua vËt phÈm Thµnh lËp Bang Héi (500 Xu vËt phÈm)/GetTongItem",
			"Tho¸t/nothing"
		}
	end
	Say(g_szTitle.."Lùa chän chøc n¨ng", getn(tSay), tSay);
end

function GetNewPlayer()
	if TASK_MOD:GetTask(TASK_MOD.GET_ITEM_NEW_PLAYER) == 1 then
		Talk(1,"","B¹n ®· nhËn phÇn tr­ëng nµy råi");
		return
	end

	if gf_Judge_Room_Weight(4, 1, " ") ~= 1 then
		Talk(1,"","Hµnh trang kh«ng ®ñ 4 chç trèng");
		return
	end
	
	for k, v in pairs(NewPlayerItem) do
		gf_AddItemEx2(v[2], v[1])
	end
	
	Earn(5000000); --500v
	
	--NhËn Ngùa
	if GetPlayerRoute() == 17 or GetPlayerRoute() == 18 then
		AddItem(0,105,38,1,1,-1,-1,-1,-1,-1,-1,1,0);
	end
	AddItem(0,105,19,1,1,-1,-1,-1,-1,-1,-1,1,0);
	
	TASK_MOD:SetTask(TASK_MOD.GET_ITEM_NEW_PLAYER, 1);
end

function GetTongItem()
	if TASK_MOD:GetTask(TASK_MOD.GET_TONG_NEW_PLAYER) == 1 then
		Talk(1,"","Mçi tµi kho¶n chØ ®­îc mua 1 lÇn duy nhÊt");
		return
	end

	if GetItemCount(2,1,30230) < 500 then
		Talk(1,"","B¹n kh«ng cã ®ñ 500 Xu");
		return
	end
	
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		Talk(1,"","Hµnh trang khån ®ñ 2 chç trèng");
		return
	end
	
	TongOperation_Create();
	
	TASK_MOD:SetTask(TASK_MOD.GET_TONG_NEW_PLAYER, 1);
end

function GetMT()
	if TASK_MOD:GetTask(TASK_MOD.GET_BOOK_NEW_PLAYER) == 1 then
		Talk(1,"","B¹n ®· nhËn phÇn tr­ëng nµy råi");
		return
	end

	if gf_Judge_Room_Weight(25, 1, " ") ~= 1 then
		Talk(1,"","Hµnh trang cÇn tèi thiÓu 25 chç trèng");
		return
	end
	
	Get_Book_ZhenJuan();
	Get_Book_JueYao();
	
	TASK_MOD:SetTask(TASK_MOD.GET_BOOK_NEW_PLAYER, 1);
end
