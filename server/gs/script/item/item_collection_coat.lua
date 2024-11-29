Include("\\script\\lib\\globalfunctions.lua");
t_item_cfg =
{
	[30557] = {145, 146, 147, "Ngo¹i trang vip ¶m hån kim"},
	[30558] = {148, 149, 150, "Ngo¹i trang vip t­¬ng kiÕn hoan"},
	[30559] = {151, 152, 153, "Ngo¹i trang vip thiÕu niªn du"},
}

t_item_cfg2 =
{
	[30557] = {
		[108] = {
			[1] = {0,108,680,1},
			[2] = {0,108,681,1},
			[3] = {0,108,682,1},
			[4] = {0,108,683,1},			
		},
		[109] = {
			[1] = {0,109,680,1},
			[2] = {0,109,681,1},
			[3] = {0,109,682,1},
			[4] = {0,109,683,1},			
		},
		[110] = {
			[1] = {0,110,680,1},
			[2] = {0,110,681,1},
			[3] = {0,110,682,1},
			[4] = {0,110,683,1},			
		},
	},
	[30558] = {
		[108] = {
			[1] = {0,108,725,1},
			[2] = {0,108,726,1},
			[3] = {0,108,727,1},
			[4] = {0,108,728,1},			
		},
		[109] = {
			[1] = {0,109,725,1},
			[2] = {0,109,726,1},
			[3] = {0,109,727,1},
			[4] = {0,109,728,1},			
		},
		[110] = {
			[1] = {0,110,725,1},
			[2] = {0,110,726,1},
			[3] = {0,110,727,1},
			[4] = {0,110,728,1},			
		},
	},
	[30559] = {
		[108] = {
			[1] = {0,108,721,1},
			[2] = {0,108,722,1},
			[3] = {0,108,723,1},
			[4] = {0,108,724,1},			
		},
		[109] = {
			[1] = {0,109,721,1},
			[2] = {0,109,722,1},
			[3] = {0,109,723,1},
			[4] = {0,109,724,1},			
		},
		[110] = {
			[1] = {0,110,721,1},
			[2] = {0,110,722,1},
			[3] = {0,110,723,1},
			[4] = {0,110,724,1},			
		},
	},
}
ITEM_G=2
ITEM_D=1
--coat = 1
COLLECTION_TYPE=1

function OnUse(id)
	local g = GetItemGenre(id)
	local d = GetItemDetail(id)
	if g == ITEM_G and ITEM_D == 1 then
		local p = GetItemParticular(id)
		local t = t_item_cfg[p]
		if t then
    		local szMsg = format("Ng­¬i x¸c nhËn muèn nhËn ngo¹i trang [%s] kh«ng?", t[4])
    		local tSay = 
        	{
        		format("§ång ı/#ye_use(%d)", p),
        		"Rêi khái/no",
        	}
        	Say(szMsg, getn(tSay), tSay)
		end
	end	
end

function ye_use(nItemP)

	local t = t_item_cfg[nItemP]
	local nBody = GetBody()
	
	if gf_Judge_Room_Weight(3,300,1) == 0 then
		return
	end
	
	if t then
		--if 1 ~= _is_collected(t) then
			local nDelResult = DelItem(ITEM_G, ITEM_D, nItemP, 1)
			if 1 == nDelResult then
				-- SetPlayerCollectionData(COLLECTION_TYPE, t[1], 1)
				-- SetPlayerCollectionData(COLLECTION_TYPE, t[2], 1)
				-- SetPlayerCollectionData(COLLECTION_TYPE, t[3], 1)
				gf_AddItemEx2(t_item_cfg2[nItemP][108][nBody], "Ngo¹i trang", "NhËnNgo¹iTrang", "nhËn th­ëng ", 30*24*3600, 1)
				gf_AddItemEx2(t_item_cfg2[nItemP][109][nBody], "Ngo¹i trang", "NhËnNgo¹iTrang", "nhËn th­ëng ", 30*24*3600, 1)
				gf_AddItemEx2(t_item_cfg2[nItemP][110][nBody], "Ngo¹i trang", "NhËnNgo¹iTrang", "nhËn th­ëng ", 30*24*3600, 1)
				Msg2Player(format("Ng­¬i ®· nhËn thµnh c«ng ngo¹i trang [%s]", t[4]))
			end
		--else
			--Say(format("§· l­u tr÷ thµnh c«ng ngo¹i trang [%s], kh«ng thÓ sö dông l¹i", t[4]), 0)
		--end
	end
end

function _is_collected(t)
	if t then
		for i=1,3 do
			if GetPlayerCollectionData(COLLECTION_TYPE, t[i]) > 0 then
				return 1
			end
		end
	end
	return 0
end

function no()
end


