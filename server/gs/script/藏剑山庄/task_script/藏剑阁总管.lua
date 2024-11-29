Include("\\script\\²Ø½£É½×¯\\task_script\\²Ø½£Ê¹Õß.lua");

function main()
	local szSay = tongquan.."C©y BÝch Tµm kiÕm ta lµm mÊt ®· l©u. Kh«ng lÏ ng­¬i l¹i t×m ®­îc?";
	local tSay = {}
	for i=1, 5 do 
		tinsert(tSay, format("§óng vËy! Ta muèn ®æi nã lÊy %s/#getKiem(%d)",tWuxingJian[i][1],i));
	end
	tinsert(tSay, "Kh«ng cã g×/nothing");
	Say(szSay,getn(tSay),tSay);
end;

function getKiem(nId)
	local nDel = DelItem(tWuxingJian[7][2][1],tWuxingJian[7][2][2],tWuxingJian[7][2][3],1) -- Added at 26/07/2020
	if nDel == 1 then 
		AddItem(tWuxingJian[nId][2][1],tWuxingJian[nId][2][2],tWuxingJian[nId][2][3],1);
		Talk(1,"",tongquan.."§óng lµ thanh kiÕm ta ®· lµm mÊt. §­îc th«i, ta sÏ ®æi cho ng­¬i thø ng­¬i cÇn.");
	else
		Talk(1,"",tongquan.."C¸c h¹ tõ ®©u ®Õn mµ tÝnh g¹t l·o phu? Tµng KiÕm s¬n trang lµ chèn vui ch¬i sao?");
	end
	
end;

function nothing()
end;