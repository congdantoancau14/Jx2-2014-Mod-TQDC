
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ç®×¯ÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");
szNpcName = "<color=green>Chñ TiÒn Trang: <color>";

tbExchange = {
	{"Tö Kim hång bao",{2,1,537},1,360},
	{"Hoµng Kim hång bao",{2,1,539},1,999},
	{"B¹ch Kim hång bao",{2,1,30229},1,4000},
	{"Bµn Long BÝch",{2,1,1000},1,35},
	{"Hßa ThÞ BÝch",{2,1,1001},1,2000},
	{"§¹i Ng©n PhiÕu",{2,1,199},2,100},
	{"Hoµng Kim ®¹i ng©n phiÕu",{2,1,30490},2,1000},
}

tbCoins = {
	[1] = {"vµng"},
	[2] = {"xu",{2,1,30230}},
}

DISCOUNT_RATE = {"0.5%",0.005}

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==19) then
	
		Teach_Level07_02()
		
	else
		
		-- Talk(1,"",szNpcName.."MÊy n¨m nay Thµnh §« bu«n b¸n Õ Èm, TiÒn Trang ®· ®ãng cöa, xin h·y ®Õn BiÖn Kinh ®Ó nhËn.");
		local tbSay = {}
		local t = tbExchange;
		for i=1,getn(t) do 
			tinsert(tbSay,format("Ta muèn ®æi <%s> lÊy <%s> (tØ gi¸ 1\/%d)/#exchange_money(%d,%d)",t[i][1],tbCoins[t[i][3]][1],t[i][4],i,t[i][3]));
		end
		
		local i = 3;
		tinsert(tbSay,format("Ta muèn quy ®æi <%s> ra <%s> (tØ gi¸ %d\/1)/#charge_money(%d,%d)",tbCoins[t[i][3]][1],t[i][1],t[i][4],i,t[i][3]));
	
		tinsert(tbSay,"Rêi Khái/nothing")
		Say(szNpcName.."PhÝ quy ®æi thuËn vµ nghÞch ®Òu lµ <color=gold>"..DISCOUNT_RATE[1].."<color>",getn(tbSay),tbSay)
	end
	
	return

end

nIndex = 0;
nType = 0;

function charge_money(index,type)
	local i = index;
	local t = tbExchange;
	local nCash = GetCash();
	local nRate = t[i][4]*10000;
	local nItem = floor(nCash/nRate);
	local nTotal = nItem*nRate;
	local nDiscount = nTotal*DISCOUNT_RATE[2];
	local nAfterDiscount = nCash - nTotal;
	while nAfterDiscount < nDiscount do
		nItem = nItem - 1;
		nTotal = nItem*nRate;
		nDiscount = nTotal*DISCOUNT_RATE[2];
		nAfterDiscount = nCash - nTotal;
	end
	-- print("nItem",nItem);
	if nItem < 1 then 
		Talk(1,"","Sè tiÒn qu¸ nhá. Kh«ng thÓ quy ®æi ra vËt phÈm!");
		return 0;
	end
	
	local nPay = Pay(nTotal);
	local nAdd = AddItem(t[i][2][1],t[i][2][2],t[i][2][3],nItem);
	
	if nPay == 1 and nAdd == 1 then 
		Msg2Player("Giao dÞch thµnh c«ng!")
		Msg2Player(format("NhËn ®­îc %s x%d.",t[i][1],nItem))
		nTotal = nItem*nRate;
		nDiscount = nTotal*DISCOUNT_RATE[2];
		Pay(nDiscount);
		Msg2Player("ChiÕt khÊu phÝ giao dÞch "..DISCOUNT_RATE[1]..format(" cña %d = %d.",nTotal,nDiscount))
	else
		Msg2Player("Giao dÞch thÊt b¹i!")
	end
	
	
end;

function exchange_money(index,type)
	nIndex = index;
	nType = type;
	local nMax = GetItemCount(tbExchange[index][2][1],tbExchange[index][2][2],tbExchange[index][2][3])
	if nMax == 1 then 
		_request_number_callback(1);
	else
		AskClientForNumber("_request_number_callback",1,nMax,"NhËp sè l­îng");
	end
end;

function _request_number_callback(number)
	if number < 1 then 
		Msg2Player("§· hñy bá giao dÞch!")
		return 0;
	end
	
	local t = tbExchange;
	local i = nIndex;
	local nDel = DelItem(t[i][2][1],t[i][2][2],t[i][2][3],number)
	if nDel ~= 1 then 
		Talk(1,"","Kh«ng ®ñ sè l­îng! Hñy bá giao dÞch!")
		return 0;
	end
	local nResult = 0;
	local nTotal = 0;
	if nType == 1 then 
		local rate = t[i][4] * 10000;
		nTotal = number*rate;
		Earn(nTotal);
		nResult = 1;
	elseif nType == 2 then
		local rate = t[i][4];
		local coin = tbCoins[nType][2];
		nTotal = number*rate;
		nResult = AddItem(coin[1],coin[2],coin[3],nTotal);
	end
	
	if nResult == 1 then 
		Msg2Player("Giao dÞch thµnh c«ng!")
		local nDiscount = nTotal*DISCOUNT_RATE[2];
		Pay(nDiscount);
		Msg2Player("ChiÕt khÊu phÝ giao dÞch "..DISCOUNT_RATE[1]..format(" cña %d = %d.",nTotal,nDiscount))
	else
		Msg2Player("Giao dÞch thÊt b¹i!")
	end
end;
