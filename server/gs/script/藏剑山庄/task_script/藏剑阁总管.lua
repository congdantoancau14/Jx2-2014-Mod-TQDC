Include("\\script\\�ؽ�ɽׯ\\task_script\\�ؽ�ʹ��.lua");

function main()
	local szSay = tongquan.."C�y B�ch T�m ki�m ta l�m m�t �� l�u. Kh�ng l� ng��i l�i t�m ���c?";
	local tSay = {}
	for i=1, 5 do 
		tinsert(tSay, format("��ng v�y! Ta mu�n ��i n� l�y %s/#getKiem(%d)",tWuxingJian[i][1],i));
	end
	tinsert(tSay, "Kh�ng c� g�/nothing");
	Say(szSay,getn(tSay),tSay);
end;

function getKiem(nId)
	local nDel = DelItem(tWuxingJian[7][2][1],tWuxingJian[7][2][2],tWuxingJian[7][2][3],1) -- Added at 26/07/2020
	if nDel == 1 then 
		AddItem(tWuxingJian[nId][2][1],tWuxingJian[nId][2][2],tWuxingJian[nId][2][3],1);
		Talk(1,"",tongquan.."��ng l� thanh ki�m ta �� l�m m�t. ���c th�i, ta s� ��i cho ng��i th� ng��i c�n.");
	else
		Talk(1,"",tongquan.."C�c h� t� ��u ��n m� t�nh g�t l�o phu? T�ng Ki�m s�n trang l� ch�n vui ch�i sao?");
	end
	
end;

function nothing()
end;