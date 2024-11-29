
-- ====================== Œƒº˛–≈œ¢ ======================

-- Ω£œ¿«È‘µonlineII «Æ◊Ø¿œ∞ÂΩ≈±æ
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");
Include("\\script\\lib\\globalfunctions.lua");
szNpcName = "<color=green>ChÒ Ti“n Trang: <color>";

tbExchange = {
	{"Tˆ Kim hÂng bao",{2,1,537},1,360},
	{"Hoµng Kim hÂng bao",{2,1,539},1,999},
	{"Bπch Kim hÂng bao",{2,1,30229},1,4000},
	{"Bµn Long B›ch",{2,1,1000},1,35},
	{"Hﬂa Thﬁ B›ch",{2,1,1001},1,2000},
	{"ßπi Ng©n Phi’u",{2,1,199},2,100},
	{"Hoµng Kim Æπi ng©n phi’u",{2,1,30490},2,1000},
}

tbCoins = {
	[1] = {"vµng"},
	[2] = {"xu",{2,1,30230}},
}

DISCOUNT_RATE = {"0.5%",0.005}

function main()
	local tbSay = {}
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20150211 and nDate <= 20450228 then
		tinsert(tbSay,"Ta muËn ÆÊi ti“n lŒ (1 Thi™n Ki™u L÷nh ÆÊi Æ≠Óc 20 ti“n lŒ)/DoiTien")	
	end
	local t = tbExchange;
	for i=1,getn(t) do 
		tinsert(tbSay,format("Ta muËn ÆÊi <%s> l y <%s> (tÿ gi∏ 1\/%d)/#exchange_money(%d,%d)",t[i][1],tbCoins[t[i][3]][1],t[i][4],i,t[i][3]));
	end
	local i = 3;
	tinsert(tbSay,format("Ta muËn quy ÆÊi <%s> ra <%s> (tÿ gi∏ %d\/1)/#charge_money(%d,%d)",tbCoins[t[i][3]][1],t[i][1],t[i][4],i,t[i][3]));
	
	tinsert(tbSay,"RÍi Kh·i/nothing")
	Say(szNpcName.."C∏c hπ tÌi Æ©y c„ vi÷c chi?",getn(tbSay),tbSay)
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
		Talk(1,"","SË ti“n qu∏ nh·. Kh´ng th” quy ÆÊi ra vÀt ph»m!");
		return 0;
	end
	
	local nPay = Pay(nTotal);
	local nAdd = AddItem(t[i][2][1],t[i][2][2],t[i][2][3],nItem);
	
	if nPay == 1 and nAdd == 1 then 
		Msg2Player("Giao dﬁch thµnh c´ng!")
		Msg2Player(format("NhÀn Æ≠Óc %s x%d.",t[i][1],nItem))
		nTotal = nItem*nRate;
		nDiscount = nTotal*DISCOUNT_RATE[2];
		Pay(nDiscount);
		Msg2Player("Chi’t kh u ph› giao dﬁch "..DISCOUNT_RATE[1]..format(" cÒa %d = %d.",nTotal,nDiscount))
	else
		Msg2Player("Giao dﬁch th t bπi!")
	end
	
	
end;

function exchange_money(index,type)
	nIndex = index;
	nType = type;
	local nMax = GetItemCount(tbExchange[index][2][1],tbExchange[index][2][2],tbExchange[index][2][3])
	if nMax == 1 then 
		_request_number_callback(1);
	else
		AskClientForNumber("_request_number_callback",1,nMax,"NhÀp sË l≠Óng");
	end
end;

function _request_number_callback(number)
	if number < 1 then 
		Msg2Player("ß∑ hÒy b· giao dﬁch!")
		return 0;
	end
	
	local t = tbExchange;
	local i = nIndex;
	local nDel = DelItem(t[i][2][1],t[i][2][2],t[i][2][3],number)
	if nDel ~= 1 then 
		Talk(1,"","Kh´ng ÆÒ sË l≠Óng! HÒy b· giao dﬁch!")
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
		Msg2Player("Giao dﬁch thµnh c´ng!")
		local nDiscount = nTotal*DISCOUNT_RATE[2];
		Pay(nDiscount);
		Msg2Player("Chi’t kh u ph› giao dﬁch "..DISCOUNT_RATE[1]..format(" cÒa %d = %d.",nTotal,nDiscount))
	else
		Msg2Player("Giao dﬁch th t bπi!")
	end
end;


function DoiTien()
	AskClientForNumber("DoiTien_01",1,100,"Ng≠¨i muËn ÆÊi bao nhi™u?");
end

function DoiTien_01(nMoney)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",szNpcName.."Ng≠Íi cﬂn sËng mÌi c„ th” ÆÊi ti“n!")
		return
	end	

	if gf_Judge_Room_Weight(1,100,1) ~= 1 then
		return
	end
	
	if GetItemCount(2,97,236) < nMoney then
		Talk(1,"",szNpcName.."Trong ng≠Íi kh´ng c„ ÆÒ sË l≠Óng Thi™n Ki™u L÷nh!")
		return
	end
	
	if DelItem(2,97,236,nMoney) == 1 then
		gf_AddItemEx2({2, 1, 30778, nMoney * 20}, "Ti“n LŒ", "ßÊiTi“nLŒ", "NhÀn", 0, 1);	
	end
end