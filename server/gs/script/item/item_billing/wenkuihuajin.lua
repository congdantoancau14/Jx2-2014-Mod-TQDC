--文魁花锦盒
--2007-08-29村长转移到免费区
Suit_be_date_num = 30

tAll_cloth = {
	{  --标准男
		{"V╪ C萴 B祇 1",259},{"V╪ C萴 B祇 1",260}
	},
	{  --魁梧男
		{"V╪ C萴 B祇 2",261},{"V╪ C萴 B祇 2",262}
	},
	{  --性感女
		{"V╪ C萴 Thng (п)",263},{"V╪ C萴 Thng (H錸g)",264},{"V╪ C萴 Thng (Xanh L�)",265},{"V╪ C萴 Thng (Xanh Dng)",266},
		{"V╪ C萴 Thng (V祅g)",267},{"V╪ C萴 Thng (Cam)",268},{"V╪ C萴 Thng (n)",269}
	},
	{  --娇小女
		{"V╪ C萴 Thng (п)",270},{"V╪ C萴 Thng (H錸g)",271},{"V╪ C萴 Thng (Xanh L�)",272},{"V╪ C萴 Thng (Xanh Dng)",273},
		{"V╪ C萴 Thng (V祅g)",274},{"V╪ C萴 Thng (Cam)",275},{"V╪ C萴 Thng (n)",276}	
	},
}

tLinglong = {  -- 头,衣服,裤子
		{{207,213}, {281,287}, {281,287}, "Linh Lung Thng (п) "},  --红
		{{208,214}, {282,288}, {282,288}, "Linh Lung Thng (V祅g)"},  --黄
		{{209,215}, {283,289}, {283,289}, "Linh Lung Thng (Ph蕁)"},  --粉
		{{210,216}, {284,290}, {284,290}, "Linh Lung Thng (T輒)"},  --紫
		{{211,217}, {285,291}, {285,291}, "Linh Lung Thng (Lam)"},  --蓝
		{{212,218}, {286,292}, {286,292}, "Linh Lung Thng (L鬰)"},  --绿
}
tLinglongPart = {{108,"Linh Lung Qu竛 "},{109,"Trang s鴆 Linh Lung"},{110,"Linh Lung h� trang"}}

function OnUse(nItemIdx)
	local player_sex = GetBody()
	if player_sex < 3 then
		Say("Nh﹏ v藅 nam kh玭g th� s� d鬾g V╪ C萴 H筽! ",0)
		return
	end
	Say("Чi hi謕 c莕 ngo筰 trang lo筰 n祇? Xin t飝 � l鵤 ch鋘: ",3,
			"Ta c莕 V╪ C萴 Thng/#give_wenkui("..nItemIdx..")",
			"Ta c莕 Linh Lung Thng /#give_linglong("..nItemIdx..")",
			"Ta suy ngh� l筰/end_say"
	)
end

function give_wenkui(nItemIdx)
	local player_sex = GetBody()
	local tSay = {}
	for i = 1,getn(tAll_cloth[player_sex]) do
		tinsert(tSay,tAll_cloth[player_sex][i][1].."/#wk_give_cloth("..tAll_cloth[player_sex][i][2]..", "..nItemIdx..")")
	end
	tinsert(tSay,"Ta suy ngh� l筰/end_say")
	Say("Чi hi謕 c莕 ngo筰 trang lo筰 n祇? Xin t飝 � l鵤 ch鋘: ",getn(tSay),tSay)
end

function give_linglong(nItemIdx)
	local tSay = {}
	for i = 1,getn(tLinglong) do
		tinsert(tSay,tLinglong[i][4].."/#ll_give_cloth("..i..", "..nItemIdx..")")
	end
	tinsert(tSay,"Ta suy ngh� l筰/end_say")
	Say("Чi hi謕 c莕 Linh Lung Thng lo筰 n祇? Xin t飝 � l鵤 ch鋘: ",getn(tSay),tSay)
end

function wk_give_cloth(nDetail, nItemIdx)
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 5 then
		Say("H祅h trang c馻 b筺  kh玭g c遪 ch� tr鑞g. Xin s緋 x誴 l筰! ",0)
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		local add_flag,goods_index = AddItem(0,109,nDetail,1)
		--SetItemExpireTime(goods_index, nExpireTime)
	end
end

function ll_give_cloth(nDetail, nItemIdx)
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 50 then
		Say("H祅h trang c馻 b筺  kh玭g c遪 ch� tr鑞g. Xin s緋 x誴 l筰! ",0)
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nBody = GetBody()
		for i = 1,3 do
			local add_flag,goods_index = AddItem(0,tLinglongPart[i][1],tLinglong[nDetail][i][nBody-2],1,1)
			--SetItemExpireTime(goods_index, nExpireTime)
		end
	end
end

function end_say()
end