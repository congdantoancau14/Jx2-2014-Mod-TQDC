Include("\\script\\lib\\globalfunctions.lua")
szNpcName = gf_FixColor("§¹i Th­¬ng Nh©n",2)..": ";
TB_SHOP = new(KTabFile,"\\settings\\buysell.txt");
MAX_SHOP = 0; -- 170
CUR_SHOP = 0;

function main()
	local szSay = szNpcName.."Hoan nghªnh b»ng h÷u ®Õn víi bæn ®iÕm."
		.."Chç ta b¸n hÇu hÕt nh÷ng k× tr©n dÞ b¶o trong thiªn h¹ nµy.";
	local tSay = {};
	init();
	if CUR_SHOP == nil or CUR_SHOP > MAX_SHOP or CUR_SHOP < 1 then CUR_SHOP = 1 end
	tinsert(tSay,format("H·y cho ta xem/#showShop(%d)",CUR_SHOP));
	tinsert(tSay,"Ta muèn xem gian hµng cô thÓ/getNumber");
	tinsert(tSay, "NhiÒu mÆt hµng qu¸!/nothing");
	Say(szSay,getn(tSay),tSay);
end;

function init()
	MAX_SHOP = countRows();
end;


function countRows()

	local nLines = TB_SHOP:getRow();
	local nRows = 0;
	
	for i=2,nLines do
		if checkEmptyRow(i) ~= 1 then
			nRows = nRows+1;
		end
	end
	
	return nRows;
end;

function getNumber()
	AskClientForNumber("showShop",1,MAX_SHOP,"NhËp m· gian hµng");
end;

function showShop(nShopId)
	if nShopId <= 0 then
		return 0;
	end
	Sale(nShopId);
	CUR_SHOP = nShopId;
	local szSay = "Gian hµng thø <color=yellow>"..nShopId;
	local tSay = {};
	

	if nShopId == 1 then
		tinsert(tSay,"Xem gian hµng sau/#showShop(2)");
	elseif nShopId == MAX_SHOP then
		tinsert(tSay,format("Xem gian hµng tr­íc/#showShop(%d)",MAX_SHOP-1));
	else
		tinsert(tSay,format("Xem gian hµng sau/#showShop(%d)",nShopId+1));
		tinsert(tSay,format("Xem gian hµng tr­íc/#showShop(%d)",nShopId-1));
	end

	tinsert(tSay,format("\nT¹m dõng ë ®©y!/#stop(%d)",nShopId));
	Say(szSay,getn(tSay),tSay);
end

function stop(nShopId)
	
end;

function nothing()
end;