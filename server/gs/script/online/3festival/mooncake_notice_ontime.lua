--File name:mooncake_notice_ontime.lua 
--Describe:三节连过，初始化月饼数量提前公告
--Create Date:2006-9-11
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	if Get_3festival_State() == 1 then
		Msg2SubWorld("Ni猲 s� s� ph竧 b竛h Trung Thu sau 30 ph髏 n鱝, m鋓 ngi h穣 chu萵 b�!");
		AddGlobalNews("Ni猲 s� s� ph竧 b竛h Trung Thu sau 30 ph髏 n鱝, m鋓 ngi h穣 chu萵 b�!");		
	end;
end;