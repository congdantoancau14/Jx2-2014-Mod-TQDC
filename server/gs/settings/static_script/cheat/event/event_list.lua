Include("\\settings\\static_script\\cheat\\task\\list.lua");

--Setting
Max_Event = 2000;

--List
Event_List = {
	--Th�ng 1
	[1] = {
		["name"] = "T�t Nguy�n ��n",
		["item"] = {
			{"L� Dong", {2,1,30619}},
			{"��u Xanh Nh�n Th�t", {2,1,30620}},
		},
		["final_item"] = {
			{"B�nh Ch�ng", 70, {2,1,30621,1},0, TASK_MOD.ITEM_T1_1},
			{"B�nh T�t", 30, {2,1,30622,1},0, TASK_MOD.ITEM_T1_2}
		}
	},
	--Th�ng 2
	[2] = {
		["name"] = "L� H�i T�nh Nh�n",
		["item"] = {
			{"Cacao Nguy�n Ch�t", {2,1,30628}},
			{"S�a Tinh Tr�ng", {2,1,30629}},
		},
		["final_item"] = {
			{"Chocolare Chips Muffin", 70, {2,1,30630,1},0, TASK_MOD.ITEM_T2_1},
			{"Dark Chocolate", 30, {2,1,30631,1},0, TASK_MOD.ITEM_T2_2},
		}
	},
	--Th�ng 3
	[3] = {
		["name"] = "Qu�c T� Ph� N� 8/3",
		["item"] = {
			{"Gi�y B�ng Ki�'ng", {2,1,30632}},
			{"B�a C�ng", {2,1,30633}}
		},
		["final_item"] = {
			{"Qu� 8/3", 60, {2,1,30634,1},0, TASK_MOD.ITEM_T3_1},
			{"Hoa 8/3", 30, {2,1,30635,1},0, TASK_MOD.ITEM_T3_2},
			{"Tin v�t 8/3", 10, {2,1,30636,1},0, TASK_MOD.ITEM_T3_2},
		}
	},
	--Th�ng 4
	[4] = {
		["name"] = "H�c B�ch Chi�n K�",
		["item"] = {
			{"Gi�y Ng� S�c", {2,1,30637}},
			{"H� Keo", {2,1,30638}}
		},
		["final_item"] = {
			{"B�ch K�", 70, {2,1,30639,1},0, TASK_MOD.ITEM_T4_1},
			{"H�c K�", 30, {2,1,30640,1},0, TASK_MOD.ITEM_T4_2},
		}
	},
	--Th�ng 5
	[5] = {
		["name"] = "H��ng N�ng M�a H�",
		["item"] = {
			{"D�u T��i", {2,1,30645}},
			{"B�c H�", {2,1,30646}}
		},
		["final_item"] = {
			{"Sero D�u T��i", 70, {2,1,30647,1},0, TASK_MOD.ITEM_T5_1},
			{"Sero B�c H�", 30, {2,1,30648,1},0, TASK_MOD.ITEM_T5_2},
		}
	},
	--Th�ng 6
	[6] = {
		["name"] = "T�t Thi�u Nhi",
		["item"] = {
			{"M�t Ong", {2,1,30660}},
			{"Tr�i C�y", {2,1,30661}}
		},
		["final_item"] = {
			{"K�o D�o Tr�i C�y", 70, {2,1,30662,1},0, TASK_MOD.ITEM_T6_1},
			{"K�o D�o Chip Chip", 30, {2,1,30663,1},0, TASK_MOD.ITEM_T6_2},
		}
	},
	--Th�ng 7
	[7] = {
		["name"] = "Tr�i C�y M�a H�",
		["item"] = {
			{"Gi� Tr�i C�y", {2,1,30550}},
			{"S�a Ti�t Tr�ng", {2,1,30551}}
		},
		["final_item"] = {
			{"Sinh T� Th�p C�m", 70, {2,1,30552,1},0, TASK_MOD.ITEM_T7_1},
			{"Tr�i C�y D�m", 30, {2,1,30553,1},0, TASK_MOD.ITEM_T7_2},
		}
	},
	--Th�ng 8
	[8] = {
		["name"] = "M�ng L� Vu Lan",
		["item"] = {
			{"H�t Sen", {2,1,30706}},
			{"Hoa Sen", {2,1,30705}}
		},
		["final_item"] = {
			{"Ch� H�t Sen", 70, {2,1,30709,1},0, TASK_MOD.ITEM_T8_1},
			{"B�nh L� Sen", 30, {2,1,30708,1},0, TASK_MOD.ITEM_T8_2},
		}
	},
	--Th�ng 9
	[9] = {
		["name"] = "Vui H�i Tr�ng R�m",
		["item"] = {
			{"D�ng C� L�m ��n", {2,1,30718}},
			{"Gi�y Ki�ng M�u", {2,1,30717}}
		},
		["final_item"] = {
			{"L�ng ��n ��", 70, {2,1,30719,1},0, TASK_MOD.ITEM_T9_1},
			{"L�ng ��n T�m", 30, {2,1,30720,1},0, TASK_MOD.ITEM_T9_2},
		}
	},
	--Th�ng 10
	[10] = {
		["name"] = "Ng�y Ph� N� Vi�t Nam 20/10",
		["item"] = {
			{"D�ng C� G�i Hoa", {2,1,30735}},
			{"Hoa H�ng", {2,1,30736}}
		},
		["final_item"] = {
			{"��a H�ng ��", 70, {2,1,30737,1},0, TASK_MOD.ITEM_T10_1},
			{"��a H�ng V�ng", 30, {2,1,30738,1},0, TASK_MOD.ITEM_T10_2},
		}
	},
	--Th�ng 11
	[11] = {
		["name"] = "Ng�y Nh� Gi�o Vi�t Nam",
		["item"] = {
			{"N�p Tranh", {2,1,30741}},
			{"Nghi�n M�c", {2,1,30742}}
		},
		["final_item"] = {
			{"Tranh Th� Ph�p", 70, {2,1,30743,1},0, TASK_MOD.ITEM_T11_1},
			{"Tranh Th� Ph�p ��c Bi�t", 30, {2,1,30744,1},0, TASK_MOD.ITEM_T11_2},
		}
	},
	--Th�ng 12
	[12] = {
		["name"] = "Noel",
		["item"] = {
			{"Tuy�t Tr�ng", {2,1,30756}},
			{"H�p Trang Tr�", {2,1,30757}}
		},
		["final_item"] = {
			{"H�p Tuy�t Gi�ng Sinh", 70, {2,1,30758,1},0, TASK_MOD.ITEM_T12_1},
			{"Ng��i Tuy�t", 30, {2,1,30759,1},0, TASK_MOD.ITEM_T12_2},
		}
	},
	
	-- TH�NG ��C BI�T
	[13] = {
		["name"] = "Ho�t ��ng Ch�o M�ng Phi�n B�n M�i",
		["item"] = {
			{"H�p Qu�", {2,1,30695}},
			{"Gi�y G�i Qu�", {2,1,30696}}
		},
		["final_item"] = {
			{"Qu� M�ng Phi�n B�n M�i", 70, {2,1,30697,1},0, TASK_MOD.ITEM_T13_1},
			{"Hoa M�ng Phi�n B�n M�i", 30, {2,1,30698,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	-- TH�NG ��C BI�T
	[14] = {
		["name"] = "B�nh Trung Thu",
		["item"] = {
			{"B�t th�ch rau c�u", {2,1,30567}},
			{"Nh�n b�nh ��c bi�t", {2,1,30568}}
		},
		["final_item"] = {
			{"B�nh Trung Thu cam", 33, {2,1,30569,1},0, TASK_MOD.ITEM_T13_1},
			{"B�nh Trung Thu D�u", 33, {2,1,30570,1},0, TASK_MOD.ITEM_T13_1},
			{"B�nh Trung Thu Socola", 34, {2,1,30571,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	-- TH�NG ��C BI�T
	[15] = {
		["name"] = "Ch�o m�ng ng�y Ph� N� Vi�t Nam",
		["item"] = {
			{"Tinh d�u hoa", {2,1,30442}},
			{"S�p m�t ong", {2,1,30443}}
		},
		["final_item"] = {
			{"N��c hoa kh� 1", 70, {2,1,30444,1},0, TASK_MOD.ITEM_T13_1},
			{"N��c hoa kh� 2", 30, {2,1,30445,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	-- TH�NG ��C BI�T
	[16] = {
		["name"] = "Gi�ng sinh an l�nh",
		["item"] = {
			{"K�o Que", {2,1,30347}},
			{"H�p gi�y", {2,1,30348}}
		},
		["final_item"] = {
			{"H�p qu� noel", 96, {2,1,30349,1},0, TASK_MOD.ITEM_T13_1},
			{"C�y th�ng gi�o h�i", 4, {2,1,30350,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	[17] = {
		["name"] = "N�m m�i",
		["item"] = {
			{"Gi�y xu�n ��", {2,1,30472}},
			{"M�c T�u", {2,1,30473}},
		},
		["final_item"] = {
			{"C�u ��i ng�y xu�n", 33, {2,1,30474,1},0, TASK_MOD.ITEM_T13_1},
			{"��i c�t", 33, {2,1,30475,1},0, TASK_MOD.ITEM_T13_1},
			{"L� x� n�m m�i", 34, {2,1,30476,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	[18] = {
		["name"] = "B�nh Trung Thu",
		["item"] = {
			{"B�t m� h�o h�ng", {2,1,30328}},
			{"C�i kh�", {2,1,30330}},
		},
		["final_item"] = {
			{"B�nh Trung Thu", 70, {2,1,30326,1},0, TASK_MOD.ITEM_T13_1},
			{"B�nh Th��ng h�ng", 30, {2,1,30329,1},0, TASK_MOD.ITEM_T13_2},
			{"��n hoa Trung Thu", 1, {2,1,30327,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	[19] = {
		["name"] = "M�a hoa tri �n",
		["item"] = {
			{"Hoa h�ng", {2,1,30331}},
			{"S�n Tr� hoa",{2,1,30333}},
		},
		["final_item"] = {
			{"B� hoa h�ng", 70, {2,1,30332,1},0, TASK_MOD.ITEM_T13_1},
			{"B� h�a S�n Tr�", 30, {2,1,30334,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	[20] = {
		["name"] = "L� nh� gi�o VN",
		["item"] = {
			{"Men r��u th��ng h�ng", {2,1,30454}},
			{"Ngu~ l��ng c�c",{2,1,30455}},
		},
		["final_item"] = {
			{"V�n s� t�u", 70, {2,1,30456,1},0, TASK_MOD.ITEM_T13_1},
			{"V� s� t�u", 30, {2,1,30457,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
}






