--========ÎÄ¼ş¶¨Òå==================================--
--ÎÄ¼şÃû£ºstring.lua
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2004-6-1
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-24
--¹¦ÄÜĞğÊö£º
--	À©Õ¹luaÎ´Ìá¹©µÄ×Ö·û´®´¦Àíº¯Êı
--
--ÓÎÏ·½Å±¾¡¤½£ÏÀÇéÔµÍøÂç°æ
--½ğÉ½Èí¼ş¹É·İÓĞÏŞ¹«Ë¾£¬copyright 1992-2005
--==================================================--

if not STRING_HEAD then
STRING_HEAD = 1

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºreplace(str,pattern,s)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-27
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-27
--¹¦ÄÜĞğÊö£º
--	ÓÃ×Ö·û´®sÌæ»»×Ö·û´®strÖĞµÄpattern
--²ÎÊı£º
--	str£ºÔ´×Ö·û´®n
--	pattern£ºÒªÌæ»»µÄ×Ö·û´®
--	s£ºÌæ»»patternµÄ×Ö·û´®
--·µ»ØÖµ£º
--	Ìæ»»ºóµÄ×Ö·û´®¡£
--ÓÃÀı£º
--	ÎŞ
--==================================================--
function replace(str,pattern,s)
	if pattern == s then	--Ô¤·ÀËÀÑ­»·
		return str
	end;
	local nMaxLoop = strlen(str)
	local nLen = strlen(s)
	local nLoop = 0;
	local startS,endS = strfind(str,pattern)
	while(startS) do	
		if nLoop > nMaxLoop then
			print("[Hµm sè b¸o lçi]: sè lÇn replace qu¸ lín, tr¸nh vßng lÆp chÕt, buéc tho¸t ra");
			return ""
		end;
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern,startS+nLen)
		nLoop = nLoop + 1;
	end
	return str
end
function sf_Replace(str,pattern,s)
	return replace(str,pattern,s);
end;
--°Ñ´øÑÕÉ«ĞÅÏ¢µÄ×Ö·û´®×ª±äÎª¿É¹©SayºÍTalkÊ¹ÓÃµÄ×Ö·û´®
--szString£ºÔ­×Ö·û´®
--tbColorInfo£ºÑÕÉ«ĞÅÏ¢¡£¸ñÊ½{±ê¼ÇÍ·,±ê¼ÇÎ²,ÑÕÉ«Ó¢ÎÄµ¥´Ê}£¬Àı×ÓÈçÏÂ£º
--tbColorInfo = 
--{
--	[1] = {"{y","}","yellow"},
--	[2] = {"{g","}","green"},
--	[3] = {"{r","}","red"},
--}
function sf_ConvertColorString(szString,tbColorInfo)
	tbColorInfo = tbColorInfo or g_tbColorInfo;
	for i=1,getn(tbColorInfo) do
		szString = sf_Replace(szString,tbColorInfo[i][1],"<color="..tbColorInfo[i][3]..">");
		szString = sf_Replace(szString,tbColorInfo[i][2],"<color>");
	end;
	return szString;
end;
--É¾³ı±ê¼Ç£¬±ÈÈçÈ¥µô×Ö·û´®ÖĞËùÓĞ<color>±ê¼Ç
--sTagS:±ê¼ÇµÄÍ·£¬Èç"<"
--sTagE:±ê¼ÇµÄÎ²£¬Èç">"
function sf_RemoveTag(sString,sTagS,sTagE)
	local sSubStr = "";
	local nTagSIndex = strfind(sString,sTagS,1);
	local nTagEIndex = strfind(sString,sTagE,1);
	local nMaxLoop = strlen(sString)
	local nLoop = 0;
	while nTagSIndex ~= nil and nTagEIndex ~= nil do
		if nLoop >= nMaxLoop then
			print("[Hµm sè b¸o lçi]: sè lÇn sf_RemoveTag qu¸ lín, tr¸nh chÕt liªn tôc, buéc tho¸t ra");
			return "";
		end;
		sSubStr = strsub(sString,nTagSIndex,nTagEIndex)
		sString = replace(sString,sSubStr,"")
		nTagSIndex = strfind(sString,sTagS,nTagSIndex);
		if nTagSIndex ~= nil then
			nTagEIndex = strfind(sString,sTagE,nTagSIndex);
		end;
		nLoop = nLoop + 1;
	end;
	return sString
end;
--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºsplit(str,splitor)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2004-6-1
--×îºóĞŞ¸ÄÈÕÆÚ£º2004-6-1
--¹¦ÄÜĞğÊö£º
--	°Ñ×Ö·û´®strÓÃ·ÖÁÑ·ûsplitor·ÖÁÑ³ÉÊı×éĞÎÊ½
--²ÎÊı£º
--	str£º±»·ÖÁÑµÄ×Ö·û´®
--	splitor£º·ÖÁÑ·û,Èç¹û¸Ã²ÎÊıÃ»ÓĞ£¬Ä¬ÈÏÎª£¢,£¢
--·µ»ØÖµ£º
--	±»·ÖÁÑµÄÊı×é£®Èç¹û×Ö·û´®strÖĞÃ»ÓĞ°üº¬·ÖÁÑ·ûsplitor£¬
--Ôò·µ»ØµÄÊı×éÖ»ÓĞ£±¸öÔªËØ£¬ÔªËØÄÚÈİ¾ÍÊÇstr±¾Éí£®
--ÓÃÀı£º
--	local s = "aaa,bbb,ccc,ddd"
--	local arr = splite(s,",")
--	Ôò£¬arrµÄÄÚÈİÎª£º
--	arr[1]£ºaaa
--	arr[2]£ºbbb
--	arr[3]£ºccc
--	arr[4]£ºddd
--==================================================--
function split(str,splitor)
	if(splitor==nil) then
		splitor=","
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(splitor)
	local index=strfind(str,splitor,strStart)
	if(index==nil) then
		strArray[1]=str
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(str,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(str,splitor,strStart)
	end
	strArray[i]=strsub(str,strStart,strlen(str))
	return strArray
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºjoin(arr,insertor)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2004-6-1
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-24
--¹¦ÄÜĞğÊö£º
--	°ÑÒ»Î¬Êı×éarrÄÚµÄÔªËØÄÚÈİÓÃinsertorÁ¬½ÓÆğÀ´£¬arrµÄ
--ÔªËØ×îºÃÎª×Ö·û´®ÀàĞÍ£¬Êı×ÖÀàĞÍÒ²¿ÉÒÔ£®
--²ÎÊı£º
--	arr£º±»Á¬½ÓµÄÊı×é
--	insertor£º²åÈë·û£¬¸Ã²ÎÊıÃ»ÓĞ£¬Ä¬ÈÏ²åÈë·ûÎª£¢,£¢
--·µ»ØÖµ£º
--	·µ»ØÁ¬½ÓÖ®ºóµÄ×Ö·û´®£®Èç¹ûarrÃ»ÓĞÈÎºÎÔªËØ£¬Ôò·µ»Ø
--nil£®
--ÓÃÀı£º
--	local sarr = {"a","b","c","d"}
--	local s = join(sarr,",")
--	Ôò£ºsµÄ½á¹ûÎª
--	s£º"a,b,c,d"
--==================================================--
function join(arr,insertor)
	local maxItem = getn(arr)
	if(maxItem ==0) then
		return nil
	end
	if(insertor==nil) then
		insertor=","
	end
	local str=""
	for i=1,maxItem-1 do
		if(not arr[i]) then 
			str= str..insertor
		else
			str = str..tostring(arr[i])..insertor
		end
	end
	if(arr[maxItem]) then 
		str = str..tostring(arr[maxItem])
	end
	return str
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºtrim(str)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2004-6-1
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-24
--¹¦ÄÜĞğÊö£º
--	É¾³ı×Ö·û´®strÁ½¶ËµÄ¿Õ°×·ûºÅ£¬Èç¹ûÃ»ÓĞ¿Õ°×·ûºÅ£¬Ôò
--²»É¾³ı£®
--²ÎÊı£º
--	str£º±»É¾³ı¿Õ°×·ûºÅµÄ×Ö·û´®
--·µ»ØÖµ£º
--	±»É¾³ıÁË¿Õ°×·ûµÄ×Ö·û´®
--ÓÃÀı£º
--	local s = "   dddd     "
--	s = trim(s)
--	Ôò£¬sµÄ½á¹ûÎª£º
--	s£º"dddd"
--==================================================--
function trim(str)
	local start,last = strfind(str,"%S+.*%S+")
	-- print(tostring(start).."|"..tostring(last))
	if(start==nil or last==nil) then
		return str
	end
	return strsub(str,start,last)
end

---RGBÊı×Ö×ª»»³É16½øÖÆ±íÊ¾µÄ×Ö·û´®
function toColor(r,g,b)
	if(not tonumber(r)) then r=0 end
	if(not tonumber(g)) then g=0 end
	if(not tonumber(b)) then b=0 end
	if(r<0) then r=0 end
	if(g<0) then g=0 end
	if(b<0) then g=0 end
	if(r>255) then r=255 end
	if(g>255) then g=255 end
	if(b>255) then b=255 end
	return r*65536+g*256+b
end
-------------------------------------

---½«ÎåĞĞÊıÖµ×ª»»³É²ÊÉ«ÎåĞĞºº×Ö
SERIESWORD = {
	{ " Kim ",	"metal"	},
	{ "Méc",	"wood"	},
	{ "Thñy",	"water"	},
	{ "Háa",	"fire"	},
	{ "Thæ",	"earth"	}
}

function toSeriesColorText(text, sno)
	if (sno < 0 or sno >= getn(SERIESWORD)) then
		return text;
	else
		return "<color="..SERIESWORD[sno+1][2]..">"..text.."<color>";
	end
end

function toSeries(sno)
	if(not tonumber(sno)) then return "error" end
	if(sno < 0 or sno > 4) then return "Ch­a" end
	return toSeriesColorText(SERIESWORD[sno+1][1], sno);
end
------------------------------

---½«µÈ¼¶Êı×Ö×ª»»³É²ÊÉ«µÈ¼¶ºº×Ö
LEVELWORD = {
	"<color="..toColor(200,200,200).."> cÊp 1<color>",
	"<color="..toColor(0,200,0).."> cÊp 2<color>",
	"<color="..toColor(200,0,0).."> cÊp 3<color>",
	"<color="..toColor(200,0,200).."> cÊp 4<color>",
	"<color="..toColor(200,200,0).."> cÊp 5<color>",
	"<color="..toColor(0,0,255).."> cÊp 6<color>",
	"<color="..toColor(0,255,0).."> cÊp 7<color>",
	"<color="..toColor(255,0,0).."> cÊp 8<color>",
	"<color="..toColor(255,0,255).."> cÊp 9<color>",
	"<color="..toColor(255,255,0)..">cÊp 10<color>",	
}

function toLevel(lvl)
	if(not tonumber(lvl)) then return "error" end
	if(lvl < 0 or lvl > 10) then return "VŞ Tri" end
	return LEVELWORD[lvl]
end
---------------------------------

pairs = pairs or function (t) return t end
function Val2Str(value, ind)
	ind = ind or "";
	if type(value) == "table" then
		local str = '{\n';
		local tmp_ind = ind..'\t'
		for k,v in pairs(value) do
			str = str .. tmp_ind .. '['..Val2Str(k)..'] = ' .. Val2Str(v, tmp_ind) .. ',\n';
		end
		str = str .. ind .. '}';
		return str;
	elseif type(value) == 'function' then
		return '"#FUNCTION"';
	elseif type(value) == 'string' then
		if strsub(value,1,1) == '@' then
			return strsub(value,2);
		else
			value = gsub(value, "\n", "\\n");
			value = gsub(value, "\t", "\\t");
			return '"'..value..'"';
		end
	elseif type(value) == 'boolean' then
		return '"'..tostring(value)..'"';
	else
		return tostring(value);
	end
end
end -- THE HEADDER END

arrstrMarkedChars = "µ¸¶·¹¨»¾¼½Æ©ÇÊÈÉËÌĞÎÏÑªÒÕÓÔÖ×İ×ÜŞßãáâä«åèæçé¬êíëìîïóñòô­õøö÷ùúıûüş®§¡¢£¤¥¦"
arrstrUnmarkedChars = "aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyydDAAEOOU"

function unmarks(string)
	local s = "";
	for i=1, strlen(string) do
		local flag = 0;
		for j=1, strlen(arrstrMarkedChars) do
			if strsub(arrstrMarkedChars,j,j) == strsub(string,i,i) then 
				s = s..strsub(arrstrUnmarkedChars,j,j);
				flag = 1;
				break
			end
		end
		if flag == 0 then 
			s = s..strsub(string,i,i);
		end
	end
	return s;
end;

TBTCVN3 = {'»','¾','¼','½','Æ','¨','Ç','Ê','È','É','Ë','©','µ','¸','¶','·','¹','Ò','Õ','Ó','Ô','Ö','ª','Ì','Ğ','Î','Ï','Ñ','×','İ','×','Ü','Ş','å','è','æ','ç','é','«','ê','í','ë','ì','î','¬','ß','ã','á','â','ä','õ','ø','ö','÷','ù','­','ï','ó','ñ','ò','ô','ú','ı','û','ü','ş','®','§','¡','¢','£','¤','¥','¦'};
TBTELEX = {'awf','aws','awr','awx','awj','aw','aaf','aas','aar','aax','aaj','aa','af','as','ar','ax','aj','eef','ees','eer','eex','eej','ee','ef','es','er','ex','ej','if','is','ir','ix','ij','oof','oos','oor','oox','ooj','oo','owf','ows','owr','owx','owj','ow','of','os','or','ox','oj','uwf','uws','uwr','uwx','uwj','uw','uf','us','ur','ux','uj','yf','ys','yr','yx','yj','dd','DD','AW','AA','EE','OO','OW','UW'};
TBVNI = {'a81','a82','a83','a84','a85','a8','a61','a62','a63','a64','a65','a6','a1','a2','a3','a4','a5','e61','e62','e63','e64','e65','e6','e1','e2','e3','e4','e5','i1','i2','i3','i4','i5','o61','o62','o63','o64','o65','o6','o71','o72','o73','o74','o75','o7','o1','o2','o3','o4','o5','u71','u72','u73','u74','u75','u7','u1','u2','u3','u4','u5','y1','y2','y3','y4','y5','d9','D9','A8','A6','E6','O6','O7','U7'};

function telex2tones(string)
	for i=1,getn(TBTELEX) do
		string = replace(string,TBTELEX[i],TBTCVN3[i]);
	end
	return string;
end

function totelex(string)
	local s = "";
	for i=1, strlen(string) do
		local flag = 0;
		for j=1, getn(TBTCVN3) do
			if TBTCVN3[j] == strsub(string,i,i) then 
				s = s..TBTELEX[j];
				flag = 1;
				break
			end
		end
		if flag == 0 then 
			s = s..strsub(string,i,i);
		end
	end
	return s;
end;


-- function tovni(string)
	-- local s = "";
	-- for i=1, strlen(string) do
		-- local flag = 0;
		-- for j=1, strlen(TCVN3) do
			-- if strsub(TCVN3,j,j) == strsub(string,i,i) then 
				-- s = s..TBVNI[j];
				-- flag = 1;
				-- break
			-- end
		-- end
		-- if flag == 0 then 
			-- s = s..strsub(string,i,i);
		-- end
	-- end
	-- return s;
-- end;

function IsNummeric(str)
	if str ~= nil and str ~= "" and trim(str) == tostring(tonumber(str)) then
		return 1;
	else
		return 0;
	end
end;

function printex(string)
	print("["..string.."]")
end

tab = "\t";
space = " ";
endl = "\n";

function makeDirectory(szDir,szFileName)
	if szFileName == nil then szFileName = "temp"; end;
	local file = openfile(szDir..szFileName,"a+")
	--print("makeDirectory:",szDir..szFileName)
	if file == nil then
		execute(format("mkdir -p %s", szDir)) -- make (create) directory
		return 1;
	else
		closefile(file)
		if szFileName == "temp" then
			remove(szDir) -- delete just created above temp file
		end
		return 0;
	end
end;