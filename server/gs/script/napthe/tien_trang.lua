Include([[\script\lib.lua]]);
TI_LE_NAP=1000
MAX_KIM_PHIEU = 999999;
function main()
	local nGoldCoin = GetGoldCoin()-Coin_GS();
	if nGoldCoin <= 0 then
		Say("Muèn rót Kim PhiÕu h·y ®Õn ®©y!!", 0);
		return
	end
	Msg2Player("Kim PhiÕu Hµnh Trang:"..GetVipJinJuan())
	Say("B¹n ®ang cã: <color=yellow>"..(nGoldCoin*TI_LE_NAP).."<color> Kim PhiÕu göi t¹i ®©y<enter>L·o cã thÓ gióp g× cho quý kh¸ch ®©y??", 2,
		"Ta muèn rót Kim PhiÕu/RutKimPhieu",
		"Ta nh©n tiÖn ghÐ th¨m «ng th«i mµ!/nothing" )
	return
end
function Coin_GS()
	local pf = openfile("data/coin/"..GetAccount()..".txt", "r");
	if not pf then 
		return 0
	else
		local str = read(pf, "*l");
		if not str then
			Say( "Xin lçi! Kh¸ch quan <color=red>"..GetName().."<color> kh«ng thÓ ®äc d÷ liÖu vui lßng liªn hÖ GM!", 0);
			closefile(pf);
			return nil
		end
		if tonumber(str)=="" or tonumber(str)==nil then
			Say( "Xin lçi! Kh¸ch quan <color=red>"..GetName().."<color> kh«ng thÓ ®äc d÷ liÖu vui lßng liªn hÖ GM!", 0);
			closefile(pf);
			return nil
		end
		nCoinGS= tonumber(str)--Lay gia tri 
	   closefile(pf);
	   return nCoinGS
	end
end
function RutKimPhieu()
local nGoldCoin = GetGoldCoin()-Coin_GS();
Say("B¹n ®ang cã: <color=yellow>"..(nGoldCoin*TI_LE_NAP).."<color> Kim PhiÕu t¹i ®©y<enter>B¹n muèn rót bao nhiªu??", 6,
		"Ta muèn rót 1000 Kim PhiÕu/#AddKimPhieu(1)",
		"Ta muèn rót 5000 Kim PhiÕu/#AddKimPhieu(5)",
		"Ta muèn rót 10000 Kim PhiÕu/#AddKimPhieu(10)",
		"Ta muèn rót 50000 Kim PhiÕu/#AddKimPhieu(50)",
		"Ta muèn rót tÊt c¶ Kim PhiÕu/#AddKimPhieu("..nGoldCoin..")",
		"Ta nh©n tiÖn ghÐ th¨m «ng th«i mµ!/nothing" )
end

function AddKimPhieu(nSoLuong)
	local nCoinWeb = GetGoldCoin();
	local nID=GetAccount()
	local nCoinGS=Coin_GS()
	local nKimPhieu=nCoinWeb-nCoinGS
	local nKimPhieuAdd=nSoLuong*TI_LE_NAP
	if not nSoLuong or tonumber(nSoLuong) < 0 then
		return 0;
	end
	local nValueAfter = GetVipJinJuan() + tonumber(nKimPhieuAdd);
	if nValueAfter >= MAX_KIM_PHIEU then
		Say( "Sè l­îng rót qu¸ giíi h¹n "..MAX_KIM_PHIEU.."!", 0);
		return 0;
	end
	if nKimPhieu<=0 then
		Say( "B¹n kh«ng cã Kim PhiÕu l­u t¹i ®©y!", 0);
		return
	end
	if nKimPhieu>=nSoLuong then
		if -1 == ModifyJinJuan(nKimPhieuAdd, 1)then
			return 0
		end
		Say("B¹n nhËn ®­îc <color=yellow>"..(nKimPhieuAdd).."<color> Kim PhiÕu", 0);
		WriteLogInfo("data/coin/", ""..nID..".txt", nCoinGS+nSoLuong)
		WriteLog("["..date("%y%m%d%H%M").."]\t[Rót Kim PhiÕu]\t"..nID.."\t"..GetName().."\trót\t"..(nKimPhieuAdd).." kim phiÕu")
		KP_WriteLog("%s\tAccount:%s\tRoleName:%s\trót\t%d",date("%y%m%d%H%M%S"),GetAccount(), GetName(),nKimPhieuAdd);
	else
		Say( "Sè Kim PhiÕu l­u t¹i ®©y chØ cã "..nKimPhieu.." thÊp h¬n so víi lÖnh rót !", 0);
	end
end
function WriteLogInfo(filePath, strFileName, strString)	
	local file = openfile(filePath..strFileName,  "w+")
	if file == nil then
		execute(format("mkdir -p %s", filePath))
		file = openfile(filePath..strFileName,  "w+")
	end
	write(file,tostring(strString));
	closefile(file);
end
function KP_WriteLog(strFormat, ...)
	local strLogPath = "logs/kim_phieu/"
	local strLog = format(strFormat, unpack(arg));
	local strDate = date("%Y_%m_%d");
	local strLogFile = format("rut_kim_phieu_%s.log", strDate);
	local strLogFilePath = format("%s%s",strLogPath, strLogFile);

	local hFile = openfile(strLogFilePath, "a+");
	if (hFile == nil) then
		execute(format("mkdir \"%s\"", strLogPath));
		hFile = openfile(strLogFilePath, "a+");
	end
	if (hFile ~= nil) then
		write (hFile, strLog .. "\n");
		closefile (hFile);
	end
end
function nothing()
end