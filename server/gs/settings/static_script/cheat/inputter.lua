-- function OnUse()
	-- main();
-- end;

function main()
	inputString();
end;

function showInputter()
	inputString();
end;

function inputString()
	AskClientForString("_request_string_call_back_inputter","g[,d,p,q]",1,32,"Input parameters");
end;

function _request_string_call_back_inputter(str)
	handleString(str);
end;

function handleString(szInputted)
	local t = strsplit(szInputted, ",");
	local nTableLen = getn(t);
	local na = -1; -- Not applicate
	-- print("nTableLen: "..nTableLen);
	
	if nTableLen == 1 then
		AddItem(2,1,szInputted,1);
	elseif nTableLen == 2 then
		AddItem(2,1,t[1],t[2]);
	elseif nTableLen == 3 then
		AddItem(t[1],t[2],t[3],1);
	elseif nTableLen == 4 then
		AddItem(t[1],t[2],t[3],t[4]);
	elseif nTableLen == 5 then
		if tonumber(t[5]) == 0 or tonumber(t[1]) == 2 or tonumber(t[1]) == 1 then
			-- t[1] == 2 mean general items, t[1] == 1 mean usable items
			AddItem(t[1],t[2],t[3],t[4],t[5]);
		else
			AddItem(t[1],t[2],t[3],t[4],1,na,na,na,na,na,na,na,t[5]);
		end
	elseif nTableLen == 6 then
		AddItem(t[1],t[2],t[3],t[4],1,7,t[6],na,na,na,na,na,t[5]);
	elseif nTableLen == 7 then
		AddItem(t[1],t[2],t[3],t[4],1,7,t[6],7,t[7],na,na,na,t[5]);
	elseif nTableLen == 8 then
		AddItem(t[1],t[2],t[3],t[4],1,7,t[6],7,t[7],7,t[8],na,t[5]);
	elseif nTableLen == 9 then
		AddItem(t[1],t[2],t[3],t[4],1,7,t[6],7,t[7],7,t[8],t[9],t[5]);
	elseif nTableLen == 10 then
		AddItem(t[1],t[2],t[3],t[4],t[10],7,t[6],7,t[7],7,t[8],t[9],t[5]);
	elseif nTableLen == 11 then
		AddItem(t[1],t[2],t[3],t[4],t[10],t[11],t[6],t[11],t[7],t[11],t[8],t[9],t[5]);
	end
end;

function strsplit( strText, strSeparator )
	local arySlice = {};
	local nSliceCount = 0;
	local nStartIdx, nEndIdx;
	while( 1 ) do
		nStartIdx, nEndIdx = strfind( strText, strSeparator, 1, 1 );
		if( nStartIdx == nil ) then
			break
		end
		if( nStartIdx > 1 ) then
			nSliceCount = nSliceCount + 1;
			arySlice[nSliceCount] = strsub( strText, 1, nStartIdx - 1 );
		end
		strText = strsub( strText, nEndIdx + 1 );
	end
	if( strlen( strText ) > 0 ) then
		arySlice[nSliceCount+1] = strText;
	end
	return arySlice;
end

function splitString(str)
	local t = {}
	
	-- for i = 1, string.len(str) do
		-- local c = str:sub(i,i);
		-- Msg2Player(c);
		-- print(c);
	-- end
	
	-- for i = 1, string.len(str) do
		-- print( string.sub(str, i, i) )
	-- end
	
	-- for word in str.gmatch('([^,]+)') do
		-- table.insert(t,word);
	-- end
	
	return t;
end;