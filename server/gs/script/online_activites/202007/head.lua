
TASK_FIREINDEX = 1000 -- Index c�a ��ng l�a
TASK_GETFIRECOUNT = 1002 -- ��m s� ��ng l�a �� ��t
TASK_BURNFIRETIME = 1003; -- Th�i �i�m ��t ��ng l�a Task_id 
TASK_NEWFIRELIFETIME = 1004; -- Sinh m�nh ��ng l�a sau khi th�m c�i

TASK_OVENINDEX = 1005 -- Index c�a l� n��ng
TASK_HIREOVENTIME = 1006; -- Th�i �i�m Thu� L� n��ng Task_id
TASK_OVENTYPE = 1007; -- K?ch c� l� n��ng

OVENLIFETIME = 1 * 60; -- Sinh m�nh c�a ��ng l�a: 1 ph�t
FIRELIFETIME = 5 * 60; -- Sinh m�nh c�a ��ng l�a: 5 ph�t
MAXFIRELIFETIME = 600 -- Hi�u xu�t t�i �a c�a ��ng l�a: 10 ph�t

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

tOvens = {
	[1] = {"L� n��ng nh�", "L� n��ng nh�",20000,10}, -- t�n_m�_h�nh, t�n_hi�n_th�, gi�_ti�n, s�c_ch�a (c�ng_su�t)
	[2] = {"L� n��ng l�n", "L� n��ng l�n",200000,100},
	[3] = {"L� n��ng b�nh", "L� n��ng si�u l�n",600000,1000},
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
			{"M�ng x�o l� m�n d� �n, nhi�u ng��i th?ch. Ch� bi�n c�ng kh�ng kh�. Nguy�n li�u c� th� ��n V� Di s�n t�m ki�m."}
		},
		["tool"] = {
			{"L� n��ng nh�", 10}, -- T�n_c�ng_c�, hi�u_su�t
			{"L� n��ng l�n", 100},
			{"L� n��ng si�u l�n", 999},
		},
	},
	
}