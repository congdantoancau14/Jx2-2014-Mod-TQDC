Include("\\settings\\static_script\\cheat\\task\\list.lua");

--Setting
Max_Event = 2000;

--List
Event_List = {
	--Th¸ng 1
	[1] = {
		["name"] = "TÕt Nguyªn §¸n",
		["item"] = {
			{"L¸ Dong", {2,1,30619}},
			{"§Ëu Xanh Nh©n ThÞt", {2,1,30620}},
		},
		["final_item"] = {
			{"B¸nh Ch­ng", 70, {2,1,30621,1},0, TASK_MOD.ITEM_T1_1},
			{"B¸nh TÐt", 30, {2,1,30622,1},0, TASK_MOD.ITEM_T1_2}
		}
	},
	--Th¸ng 2
	[2] = {
		["name"] = "LÔ Héi T×nh Nh©n",
		["item"] = {
			{"Cacao Nguyªn ChÊt", {2,1,30628}},
			{"S÷a Tinh Trøng", {2,1,30629}},
		},
		["final_item"] = {
			{"Chocolare Chips Muffin", 70, {2,1,30630,1},0, TASK_MOD.ITEM_T2_1},
			{"Dark Chocolate", 30, {2,1,30631,1},0, TASK_MOD.ITEM_T2_2},
		}
	},
	--Th¸ng 3
	[3] = {
		["name"] = "Quèc TÕ Phô N÷ 8/3",
		["item"] = {
			{"GiÊy Bãng Kiª'ng", {2,1,30632}},
			{"B×a Cøng", {2,1,30633}}
		},
		["final_item"] = {
			{"Quµ 8/3", 60, {2,1,30634,1},0, TASK_MOD.ITEM_T3_1},
			{"Hoa 8/3", 30, {2,1,30635,1},0, TASK_MOD.ITEM_T3_2},
			{"Tin vËt 8/3", 10, {2,1,30636,1},0, TASK_MOD.ITEM_T3_2},
		}
	},
	--Th¸ng 4
	[4] = {
		["name"] = "H¾c B¹ch ChiÕn Kú",
		["item"] = {
			{"GiÊy Ngò S¾c", {2,1,30637}},
			{"Hå Keo", {2,1,30638}}
		},
		["final_item"] = {
			{"B¹ch Kú", 70, {2,1,30639,1},0, TASK_MOD.ITEM_T4_1},
			{"H¾c Kú", 30, {2,1,30640,1},0, TASK_MOD.ITEM_T4_2},
		}
	},
	--Th¸ng 5
	[5] = {
		["name"] = "H­¬ng N¾ng Mïa HÌ",
		["item"] = {
			{"D©u T­¬i", {2,1,30645}},
			{"B¹c Hµ", {2,1,30646}}
		},
		["final_item"] = {
			{"Sero D©u T­¬i", 70, {2,1,30647,1},0, TASK_MOD.ITEM_T5_1},
			{"Sero B¹c Hµ", 30, {2,1,30648,1},0, TASK_MOD.ITEM_T5_2},
		}
	},
	--Th¸ng 6
	[6] = {
		["name"] = "TÕt ThiÕu Nhi",
		["item"] = {
			{"MËt Ong", {2,1,30660}},
			{"Tr¸i C©y", {2,1,30661}}
		},
		["final_item"] = {
			{"KÑo DÎo Tr¸i C©y", 70, {2,1,30662,1},0, TASK_MOD.ITEM_T6_1},
			{"KÑo DÎo Chip Chip", 30, {2,1,30663,1},0, TASK_MOD.ITEM_T6_2},
		}
	},
	--Th¸ng 7
	[7] = {
		["name"] = "Tr¸i C©y Mïa HÌ",
		["item"] = {
			{"Giá Tr¸i C©y", {2,1,30550}},
			{"S÷a TiÖt Trïng", {2,1,30551}}
		},
		["final_item"] = {
			{"Sinh Tè ThËp CÈm", 70, {2,1,30552,1},0, TASK_MOD.ITEM_T7_1},
			{"Tr¸i C©y DÇm", 30, {2,1,30553,1},0, TASK_MOD.ITEM_T7_2},
		}
	},
	--Th¸ng 8
	[8] = {
		["name"] = "Mõng LÔ Vu Lan",
		["item"] = {
			{"H¹t Sen", {2,1,30706}},
			{"Hoa Sen", {2,1,30705}}
		},
		["final_item"] = {
			{"ChÌ H¹t Sen", 70, {2,1,30709,1},0, TASK_MOD.ITEM_T8_1},
			{"B¸nh L¸ Sen", 30, {2,1,30708,1},0, TASK_MOD.ITEM_T8_2},
		}
	},
	--Th¸ng 9
	[9] = {
		["name"] = "Vui Héi Tr¨ng R»m",
		["item"] = {
			{"Dông Cô Lµm §Ìn", {2,1,30718}},
			{"GiÊy KiÕng Mµu", {2,1,30717}}
		},
		["final_item"] = {
			{"Lång §Ìn §á", 70, {2,1,30719,1},0, TASK_MOD.ITEM_T9_1},
			{"Lång §Ìn TÝm", 30, {2,1,30720,1},0, TASK_MOD.ITEM_T9_2},
		}
	},
	--Th¸ng 10
	[10] = {
		["name"] = "Ngµy Phô N÷ ViÖt Nam 20/10",
		["item"] = {
			{"Dông Cô Gãi Hoa", {2,1,30735}},
			{"Hoa Hång", {2,1,30736}}
		},
		["final_item"] = {
			{"§ãa Hång §á", 70, {2,1,30737,1},0, TASK_MOD.ITEM_T10_1},
			{"§ãa Hång Vµng", 30, {2,1,30738,1},0, TASK_MOD.ITEM_T10_2},
		}
	},
	--Th¸ng 11
	[11] = {
		["name"] = "Ngµy Nhµ Gi¸o ViÖt Nam",
		["item"] = {
			{"NÑp Tranh", {2,1,30741}},
			{"Nghiªn Mùc", {2,1,30742}}
		},
		["final_item"] = {
			{"Tranh Th­ Ph¸p", 70, {2,1,30743,1},0, TASK_MOD.ITEM_T11_1},
			{"Tranh Th­ Ph¸p §Æc BiÖt", 30, {2,1,30744,1},0, TASK_MOD.ITEM_T11_2},
		}
	},
	--Th¸ng 12
	[12] = {
		["name"] = "Noel",
		["item"] = {
			{"TuyÕt Tr¾ng", {2,1,30756}},
			{"Hép Trang TrÝ", {2,1,30757}}
		},
		["final_item"] = {
			{"Hép TuyÕt Gi¸ng Sinh", 70, {2,1,30758,1},0, TASK_MOD.ITEM_T12_1},
			{"Ng­êi TuyÕt", 30, {2,1,30759,1},0, TASK_MOD.ITEM_T12_2},
		}
	},
	
	-- TH¸NG §ÆC BIÖT
	[13] = {
		["name"] = "Ho¹t ®éng Chµo Mõng Phiªn B¶n Míi",
		["item"] = {
			{"Hép Quµ", {2,1,30695}},
			{"GiÊy Gãi Quµ", {2,1,30696}}
		},
		["final_item"] = {
			{"Quµ Mõng Phiªn B¶n Míi", 70, {2,1,30697,1},0, TASK_MOD.ITEM_T13_1},
			{"Hoa Mõng Phiªn B¶n Míi", 30, {2,1,30698,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	-- TH¸NG §ÆC BIÖT
	[14] = {
		["name"] = "B¸nh Trung Thu",
		["item"] = {
			{"Bét th¹ch rau c©u", {2,1,30567}},
			{"Nh©n b¸nh ®Æc biÖt", {2,1,30568}}
		},
		["final_item"] = {
			{"B¸nh Trung Thu cam", 33, {2,1,30569,1},0, TASK_MOD.ITEM_T13_1},
			{"B¸nh Trung Thu D©u", 33, {2,1,30570,1},0, TASK_MOD.ITEM_T13_1},
			{"B¸nh Trung Thu Socola", 34, {2,1,30571,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	-- TH¸NG §ÆC BIÖT
	[15] = {
		["name"] = "Chµo mõng ngµy Phô N÷ ViÖt Nam",
		["item"] = {
			{"Tinh dÇu hoa", {2,1,30442}},
			{"S¸p mËt ong", {2,1,30443}}
		},
		["final_item"] = {
			{"N­íc hoa kh« 1", 70, {2,1,30444,1},0, TASK_MOD.ITEM_T13_1},
			{"N­íc hoa kh« 2", 30, {2,1,30445,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	-- TH¸NG §ÆC BIÖT
	[16] = {
		["name"] = "Gi¸ng sinh an lµnh",
		["item"] = {
			{"KÑo Que", {2,1,30347}},
			{"Hép giÊy", {2,1,30348}}
		},
		["final_item"] = {
			{"Hép quµ noel", 96, {2,1,30349,1},0, TASK_MOD.ITEM_T13_1},
			{"C©y th«ng gi¸o héi", 4, {2,1,30350,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	[17] = {
		["name"] = "N¨m míi",
		["item"] = {
			{"GiÊy xu©n ®á", {2,1,30472}},
			{"Mùc Tµu", {2,1,30473}},
		},
		["final_item"] = {
			{"C©u ®èi ngµy xu©n", 33, {2,1,30474,1},0, TASK_MOD.ITEM_T13_1},
			{"§¹i c¸t", 33, {2,1,30475,1},0, TASK_MOD.ITEM_T13_1},
			{"L× x× n¨m míi", 34, {2,1,30476,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	[18] = {
		["name"] = "B¸nh Trung Thu",
		["item"] = {
			{"Bét m× h¶o h¹ng", {2,1,30328}},
			{"Cñi kh«", {2,1,30330}},
		},
		["final_item"] = {
			{"B¸nh Trung Thu", 70, {2,1,30326,1},0, TASK_MOD.ITEM_T13_1},
			{"B¸nh Th­îng h¹ng", 30, {2,1,30329,1},0, TASK_MOD.ITEM_T13_2},
			{"§Ìn hoa Trung Thu", 1, {2,1,30327,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	[19] = {
		["name"] = "Mïa hoa tri ©n",
		["item"] = {
			{"Hoa hång", {2,1,30331}},
			{"S¬n Trµ hoa",{2,1,30333}},
		},
		["final_item"] = {
			{"Bã hoa hång", 70, {2,1,30332,1},0, TASK_MOD.ITEM_T13_1},
			{"Bã hßa S¬n Trµ", 30, {2,1,30334,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
	[20] = {
		["name"] = "LÔ nhµ gi¸o VN",
		["item"] = {
			{"Men r­îu th­îng h¹ng", {2,1,30454}},
			{"Ngu~ l­¬ng cèc",{2,1,30455}},
		},
		["final_item"] = {
			{"V¨n s­ töu", 70, {2,1,30456,1},0, TASK_MOD.ITEM_T13_1},
			{"Vâ s­ töu", 30, {2,1,30457,1},0, TASK_MOD.ITEM_T13_2},
		}
	},
}






