
TASK_FIREINDEX = 1000 -- Index c�a ��ng l�a
TASK_GETFIRECOUNT = 1002 -- ��m s� ��ng l�a �� ��t
TASK_BONFIRE_CREATEDTIME = 1003; -- Th�i �i�m ��t ��ng l�a Task_id 
TASK_NEWFIRE_LIFETIME = 1004; -- Sinh m�nh ��ng l�a sau khi th�m c�i

TASK_OVENINDEX = 1005 -- Index c�a l� n��ng
TASK_OVEN_HIREDTIME = 1006; -- Th�i �i�m Thu� L� n��ng Task_id
TASK_OVENTYPE = 1007; -- K�ch c� l� n��ng
TASK_OVEN_CREATEDTIME = 1008; --Th�i �i�m t�o npc_lonuong
--xx-- Th�i gian c�n l�i c�a l�

OVEN_LIFETIME = 1 * 60; -- Sinh m�nh c�a l� n��ng: 1 ph�t
FIRE_LIFETIME = 5 * 60; -- Sinh m�nh c�a ��ng l�a: 5 ph�t
MAXFIRE_LIFETIME = 600 -- Hi�u su�t t�i �a c�a ��ng l�a: 10 ph�t

tDecorators = {
	[1] = {
		["mater"] = {
			{"C�i",{2,1,30235},100,0,{ -- T�n_v�t_ph�m, {g,d,p}, s�_l��ng_y�u_c�u, kh�ng_ti�u_hao, v�t_thay_th�
					{"C�i",{2,1,30022},100},
					{"C�i",{2,1,30264},100},
					{"C�i kh�",{2,1,30330},100}, 
					{"C�i kh�",{2,1,30768},100},
				}}, 
			{"�� l�a",{2,0,170},1,0},
		},
		["npc"] = {
			{"L�a tr�i"},
		},
		["desc"] = {
			{
				"��ng l�a, c� nhi�u t�c d�ng.\n"
				.."* Duy tr� nhi�t �� c� th� trong kh�ng kh� l�nh\n"
				.."* Duy tr� cho l� n��ng\n"
				.."* T�o �nh s�ng nh�n t�o, thay th� �nh s�ng m�t tr�i v�o ban ��m\n"
				.."* Hong kh� �� b� ��t\n"
				.."X�y d�ng c�n c� c�i (khai th�c t�i Linh B�o S�n) "
				.."v� �� l�a (c� ���c t� T�ng Ki�m khi ��nh b�i T�ng Qu�n ngo�i vi�n)"
			}
		}
	},
}


tCheBien = {
	[1] = {
		["mater"] = {
			{"B�t m�",{2,1,30233},10},
			{"Nh�n b�nh",{2,1,30234},10},
			--{"C�i",{2,1,30235},10},
		},
		["products"] = {
			{"B�nh Trung Thu",{2,1,30236},1},
			{"B�nh Trung Thu �� n��ng ch�n",{2,1,30237},1},
			{"B�nh Trung Thu ch�a ch�n",{2,1,30238},1},
		},
		["desc"] = {
			{"H�ng Nga du ch�i � Tuy�n Ch�u. L�m b�nh t�ng H�ng Nga th�i! "
				.."Nguy�n li�u g�m B�t m� v� nh�n b�nh. C�n c� l� n��ng �� n��ng b�nh."}
		},
		["tool"] = {
			{"L� n��ng nh�", 10}, -- T�n_c�ng_c�, hi�u_su�t
			{"L� n��ng l�n", 100},
			{"L� n��ng si�u l�n", 999},
		},
	},
	[2] = {
		["mater"] = {
			{"���ng c�t",{2,1,30062},10},
			{"H�p s�a",{2,1,30063},5},
			{"L� h��ng",{2,1,30064},5},
			{"Gi�y g�i k�o",{2,1,30065},10},
		},
		["products"] = {
			{"K�o s�a",{2,1,30066},10},
		},
		["desc"] = {
			{"K�o s�a r�t ngon v� b�. Kh�ng ch� tr� con m� ng��i l�n cu~ng th�ch �n.\n"
				.."Nguy�n li�u g�m ���ng c�t, H�p s�a, L� h��ng v� gi�y g�i. Cu~ng c�n c� l� n��ng �� n�u k�o."}
		},
		["tool"] = {
			{"L� n��ng nh�", 10}, -- T�n_c�ng_c�, hi�u_su�t
			{"L� n��ng l�n", 100},
			{"L� n��ng si�u l�n", 999},
		},
	},
	[3] = {
		["mater"] = {
			{"M�ng",{1,3,21},10},
		},
		["products"] = {
			{"M�ng x�o",{1,1,6},2},
		},
		["desc"] = {
			{"M�ng x�o l� m�n d� �n, nhi�u ng��i th�ch. Ch� bi�n c�ng kh�ng kh�. Nguy�n li�u c� th� ��n V� Di s�n t�m ki�m."}
		},
		["tool"] = {
			{"L� n��ng nh�", 10}, -- T�n_c�ng_c�, hi�u_su�t
			{"L� n��ng l�n", 100},
			{"L� n��ng si�u l�n", 999},
		},
	},
	
}


tOvenSizes = {
	[1] = {"L� n��ng nh�", "L� n��ng nh�",20000,10}, -- t�n_m�_h�nh, t�n_hi�n_th�, gi�_ti�n, s�c_ch�a (c�ng_su�t)
	[2] = {"L� n��ng l�n", "L� n��ng l�n",200000,100},
	[3] = {"L� n��ng b�nh", "L� n��ng si�u l�n",600000,1000},
}

tOvenItem = {"L� n��ng b�nh",{2,0,517}}
OVEN_EXPIRETIME = 7 -- days

function rent_oven()
	tbSay = {}
	for i=1, getn(tOvenSizes) do
		tinsert(tbSay, format("Thu� %s (gi� %d v�ng, s�c ch�a %d)/#get_oven(%d)", 
			tOvenSizes[i][2],tOvenSizes[i][3]/10000,tOvenSizes[i][4],i));
	end
	tinsert(tbSay, "Ta s� thu� sau/nothing");
	Say("----- Ch�n k�ch th��c l� -----"
		..format("\nLo�i l� n�y ta ch� b�o h�nh n�u n��ng h�t c�ng su�t trong %d ng�y.",OVEN_EXPIRETIME),getn(tbSay),tbSay);
end;


function get_oven(nType)
	SetTask(TASK_OVENTYPE, nType)
	SetTask(TASK_OVEN_HIREDTIME,GetTime());
	if Pay(tOvenSizes[nType][3]) == 1 then
		local nResult, nIndex = AddItem(tOvenItem[2][1],tOvenItem[2][2],tOvenItem[2][3],1);
		SetItemExpireTime(nIndex,OVEN_EXPIRETIME*24*3600);
	else
		Talk(1,"","Ng��i kh�ng �� ti?n r�i!")
		return 0;
	end
end;

function isOvenExpire()
	if (GetTime() - GetTask(TASK_OVEN_HIREDTIME))/3600/24 >= OVEN_EXPIRETIME then
		return 1;
	else
		return 0;
	end
end

function createLoNuong(nType)
	--SetTask(TASK_OVENTYPE, nType)
	
	local nIndex = CreateNpc(tOvenSizes[nType][1], tOvenSizes[nType][2], GetWorldPos());
	SetNpcScript(nIndex,"\\script\\online_activites\\202007\\lonuong.lua");
	SetTask(TASK_OVENINDEX,nIndex);
	SetTask(TASK_OVEN_CREATEDTIME,GetTime());
	SetNpcLifeTime(nIndex,OVEN_LIFETIME)
	StartTimeGuage(tOvenSizes[nType][2],OVEN_LIFETIME,0,nIndex)
	
end;


function createtLuaTrai()
	local tLuaTrai = tDecorators[1];
	local nMax, tResult = countItems(tLuaTrai["mater"]);
	if nMax > 0 then
		if GetTime() - GetTask(TASK_BONFIRE_CREATEDTIME) < FIRE_LIFETIME and GetTask(TASK_BONFIRE_CREATEDTIME) ~= 0 then
			Talk(1,"","B�n �� c� 1 ��ng l�a r�i, kh�ng c�n l�ng ph� c�i.");
			return 0;
		end;
		local nDelResult, tDel = delItems(tLuaTrai["mater"]);
		if nDelResult == 1 then
			local map,x,y = GetWorldPos();
			x = random(x-2,x+2)
			y = random(y-2,y+2)
			local npcFireIndex = CreateNpc("L�a tr�i","��ng l�a",map,x,y);
			SetNpcScript(npcFireIndex,"\\script\\online_activites\\202007\\donglua.lua");
			SetNpcLifeTime(npcFireIndex,FIRE_LIFETIME)
			SetTask(TASK_FIREINDEX,npcFireIndex);
			SetTask(TASK_BONFIRE_CREATEDTIME,GetTime());
			
			local nTimeLeftNeedWood = FIRE_LIFETIME-FIRE_LIFETIME*0.2;
			StartTimeGuage("Th�m c�i",nTimeLeftNeedWood,0,npcFireIndex)
			
			local nOvenIndex = GetTask(TASK_OVENINDEX);
			StopTimeGuage(nOvenIndex);		
			StartTimeGuage("L� n��ng",nTimeLeftNeedWood+OVEN_LIFETIME,0,nOvenIndex);
			SetNpcLifeTime(nOvenIndex,nTimeLeftNeedWood+OVEN_LIFETIME)
		else
			Msg2Player("C� v�n �� trong qu� tr�nh x� l� nguy�n li�u.");
		end
	else
		local szNguyenLieu = "";
		for i=1, getn(tLuaTrai["mater"]) do
			szNguyenLieu = szNguyenLieu..format("* %s %s",
				colorize("green",tLuaTrai["mater"][i][1]),
				"x"..colorize("yellow",tLuaTrai["mater"][i][3]))..enter;
		end
		Talk(1,"",gf_Colorize(tLuaTrai["desc"][1][1],"gray")..enter.."Kh�ng �� nguy�n li�u."..enter..szNguyenLieu);
	end
end;
