
function getRandomKX4(nSet)
	KXDH = {
		[1] = {
			[1056] = "Linh ho¹t B",
			[1057] = "Th©n ph¸p B",
		},
		[2] = {
			[1069] = "Søc m¹nh B",
			[1070] = "G©n cèt B",
			[1071] = "Néi c«ng B",
			[1072] = "Sinh lùc B",
			[1073] = "Tû lÖ sinh lùc B",
		},
		[3] = {
			[1079] = "Linh ho¹t B",
			[1080] = "Th©n ph¸p B",
		},
		[4] = {
			[1] = {
				[1092] = "Ph¶n ®ßn ngo¹i c«ng/1%B",
				[1093] = "Ph¶n ®ßn néi c«ng/1%B",
				[1094] = "T¨ng s¸t th­¬ng/1B",
				[1095] = "KÌm theo ®éc s¸t/1B",
				[1096] = "T¨ng s¸t th­¬ng cæ ®éc/1B",
			},
			[2] = {
				[1108] = "Ph¶n ®ßn ngo¹i c«ng/1%B",
				[1109] = "Ph¶n ®ßn néi c«ng/1%B",
				[1110] = "T¨ng s¸t th­¬ng/1B",
				[1111] = "KÌm theo ®éc s¸t/1B",
				[1112] = "T¨ng s¸t th­¬ng cæ ®éc/1B",
			},
			[3] = {
				[1123] = "T¨ng tèc ®é xuÊt chiªu/1%B",
				[1124] = "Kh¸ng tÊt c¶ B",
				[1125] = "T¨ng chÝ mÖnh/1%B",
			}
		}
	}
	
	KXTH = {
		[1] = {
			[1129] = "Søc m¹nh B",
		},
		[2] = {
			[1143] = "Linh ho¹t B",
			[1144] = "Th©n ph¸p B",
			[1145] = "G©n cèt B",
			[1146] = "Néi c«ng B",
			[1147] = "Sinh lùc B",
			[1148] = "Tû lÖ sinh lùc B",
		},
		[3] = {
			[1156] = "Søc m¹nh B",
			[1157] = "G©n cèt B",
			[1158] = "Sinh lùc %B",
		},
		[4] = {
			[1] = {
				[1168] = "Ph¶n ®ßn ngo¹i c«ng/1B",
				[1169] = "Ph¶n ®ßn néi c«ng/1B",
				[1170] = "T¨ng ngo¹i c«ng/1%B",
				[1171] = "Tæng c«ng kÝch ngo¹i c«ng/1B",
			},
			[2] = {
				[1181] = "Ph¶n ®ßn ngo¹i c«ng/1B",
				[1182] = "Ph¶n ®ßn néi c«ng/1B",
				[1183] = "T¨ng ngo¹i c«ng/1%B",
				[1184] = "Tæng c«ng kÝch ngo¹i c«ng/1B",
			},
			[3] = {
				[1194] = "Tèc ®é di chuyÓn/1%B",
				[1195] = "T¨ng tèc ®é xuÊt chiªu/1%B",
				[1196] = "Hót sinh lùc B",
				[1197] = "Gi¶m thä th­¬ng/1%B",
			}
		}
	}
	
	KXVD = {
		[1] = {
			[1201] = "Néi c«ng B",
		},
		[2] = {
			[1213] = "Linh ho¹t B",
			[1214] = "Th©n ph¸p B",
			[1215] = "G©n cèt B",
			[1216] = "Sinh lùc B",
			[1217] = "Tû lÖ sinh lùc B",
		},
		[3] = {
			[1225] = "Linh ho¹t B",
			[1226] = "Th©n ph¸p B",
			[1227] = "Néi c«ng B",
		},
		[4] = {
			[1] = {
				[1237] = "T¨ng néi c«ng/1%B",
				[1238] = "Tæng c«ng kÝch néi c«ng/1B",
				[1239] = "Néi c«ng lín nhÊt trªn vò khÝ t¨ng/1B",
				[1240] = "Néi c«ng nhá nhÊt trªn vò khÝ t¨ng/1B",
			},
			[2] = {
				[1250] = "T¨ng néi c«ng/1%B",
				[1251] = "Tæng c«ng kÝch néi c«ng/1B",
				[1252] = "Néi c«ng lín nhÊt trªn vò khÝ t¨ng/1B",
				[1253] = "Néi c«ng nhá nhÊt trªn vò khÝ t¨ng/1B",
			},
			[3] = {
				[1263] = "Tèc ®é di chuyÓn/1%B",
				[1264] = "T¨ng tèc ®é xuÊt chiªu/1%B",
				[1265] = "Gi¶m thä th­¬ng/1%B",
				[1266] = "T¨ng chÝ mÖnh/1%B",
			}
		}
	}
	
	local tSet = {};
	if nSet == 26 then tSet = KXDH
	elseif nSet == 27 then tSet = KXTH
	elseif nSet == 28 then tSet = KXVD end;
	
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("NhËn kim xµ thµnh c«ng!");
	end;
end;

function getRandomKX5(nSet)
	KXHC = {
		[1] = {
			[1955] = "Linh ho¹t - Vµng",
			[1956] = "Th©n ph¸p - Vµng",
		},
		[2] = {
			[1973] = "Néi c«ng - Vµng",
			[1974] = "Søc m¹nh - Vµng",
			[1975] = "C¨n cèt - Vµng",
			[1976] = "T¨ng ®iÓm sinh lùc - Vµng",
			[1977] = "T¨ng tû lÖ ®iÓm sinh lùc - Vµng",
		},
		[3] = {
			[1997] = "B¹o kÝch - Vµng",
			[1999] = "T¨ng ®iÓm sè ngo¹i c«ng - Vµng",
			[2000] = "T¨ng ®iÓm sè néi c«ng - Vµng",
			[2001] = "T¨ng ®iÓm sè néi ngo¹i - Vµng",
			[2002] = "Toµn thuéc tÝnh - Vµng",
		},
		[4] = {
			[2022] = "Phßng béc - Vµng",
			[2023] = "Gi¶m béc - Vµng",
			[2024] = "Hé gi¸p ngo¹i phßng - Vµng",
			[2025] = "Hé gi¸p néi phßng - Vµng",
			[2026] = "Hé gi¸p néi ngo¹i phßng - Vµng",
			[2027] = "§iÓm sinh lùc - Vµng",
		},
		[5] = {
			[2035] = "Linh ho¹t - Vµng",
			[2036] = "Th©n ph¸p - Vµng",
		},
		[6] = {
			[1] = {
				[2055] = "T¨ng s¸t th­¬ng - Vµng",
				[2056] = "C«ng kÝch kÌm ®éc - Vµng",
				[2057] = "S¸t th­¬ng ®éc trïng - Vµng",
			},
			[2] = {
				[2074] = "Tèc ®é ch¹y - Vµng",
				[2075] = "Ph¸t huy Vâ c«ng - Vµng",
				[2076] = "Gi¶m nöa chÞu th­¬ng - Vµng",
				[2077] = "X¸c suÊt chuÈn x¸c - Vµng",
				[2078] = "Toµn thuéc tÝnh - Vµng",
			}
		}
	}
	
	KXQP = {
		[1] = {
			[2086] = "Søc m¹nh - Vµng",
			[2087] = "C¨n cèt - Vµng",
		},
		[2] = {
			[2104] = "Néi c«ng - Vµng",
			[2105] = "Th©n ph¸p - Vµng",
			[2106] = "Linh ho¹t - Vµng",
			[2107] = "§iÓm sinh lùc - Vµng",
			[2108] = "Tû lÖ ®iÓm sinh lùc - Vµng",
		},
		[3] = {
			[2128] = "B¹o kÝch - Vµng",
			[2130] = "§iÓm ngo¹i c«ng - Vµng",
			[2131] = "§iÓm néi c«ng - Vµng",
			[2132] = "§iÓm néi ngo¹i c«ng - Vµng",
			[2133] = "T¨ng ®iÓm sinh lùc - Vµng",
		},
		[4] = {
			[2153] = "Phßng béc - Vµng",
			[2154] = "Gi¶m béc - Vµng",
			[2155] = "Hé gi¸p ngo¹i phßng - Vµng",
			[2156] = "Hé gi¸p néi phßng - Vµng",
			[2157] = "Hé gi¸p néi ngo¹i phßng - Vµng",
			[2158] = "§iÓm sinh lùc - Vµng",
		},
		[5] = {
			[2169] = "Søc m¹nh - Vµng",
			[2170] = "C¨n cèt - Vµng",
			[2171] = "T¨ng tû lÖ ®iÓm sinh lùc - Vµng",
		},
		[6] = {
			[1] = {
				[2193] = "Giíi h¹n cao nhÊt ngo¹i c«ng vò khÝ - vµng ",
				[2194] = "Giíi h¹n thÊp nhÊt ngo¹i c«ng vò khÝ - Vµng",
				[2195] = "Tû lÖ ngo¹i c«ng - Vµng",
				[2196] = "§iÓm tæng c«ng kÝch ngo¹i c«ng - Vµng",
			},
			[2] = {
				[2213] = "Tèc ®é ch¹y - Vµng",
				[2214] = "Ph¸t huy Vâ c«ng - Vµng",
				[2215] = "Gi¶m nöa chÞu th­¬ng - Vµng",
				[2216] = "X¸c suÊt chuÈn x¸c - Vµng",
			}
		}
	}
	
	KXDV = {
		[1] = {
			[2225] = "Néi c«ng - Vµng",
			[2226] = "C¨n cèt - Vµng",
		},
		[2] = {
			[2243] = "Søc m¹nh - Vµng",
			[2244] = "Th©n ph¸p - Vµng",
			[2245] = "Linh ho¹t - Vµng",
			[2246] = "§iÓm sinh lùc - Vµng",
			[2247] = "Tû lÖ ®iÓm sinh lùc - Vµng",
		},
		[3] = {
			[2267] = "B¹o kÝch - Vµng",
			[2269] = "§iÓm ngo¹i c«ng - Vµng",
			[2270] = "§iÓm néi c«ng - Vµng",
			[2271] = "§iÓm néi ngo¹i c«ng - Vµng",
			[2272] = "T¨ng ®iÓm sinh lùc - Vµng",
		},
		[4] = {
			[2292] = "Phßng béc - Vµng",
			[2293] = "Gi¶m béc - Vµng",
			[2294] = "Hé gi¸p ngo¹i phßng - Vµng",
			[2295] = "Hé gi¸p néi phßng - Vµng",
			[2296] = "Hé gi¸p néi ngo¹i phßng - Vµng",
			[2297] = "§iÓm sinh lùc - Vµng",
		},
		[5] = {
			[2308] = "Néi c«ng - Vµng",
			[2309] = "Th©n ph¸p - Vµng",
			[2310] = "Linh ho¹t - Vµng",
		},
		[6] = {
			[1] = {
				[2332] = "Giíi h¹n cao nhÊt néi c«ng vò khÝ - Vµng",
				[2333] = "Giíi h¹n thÊp nhÊt néi c«ng vò khÝ - Vµng",
				[2334] = "Tû lÖ néi c«ng-vµng",
				[2335] = "§iÓm tæng c«ng kÝch néi c«ng- vµng",
			},
			[2] = {
				[2352] = "Tèc ®é ch¹y - Vµng",
				[2353] = "Ph¸t huy Vâ c«ng - Vµng",
				[2354] = "Gi¶m nöa chÞu th­¬ng - Vµng",
				[2355] = "X¸c suÊt chuÈn x¸c - Vµng",
				[2356] = "Rót ng¾n ®éng t¸c bÞ th­¬ng- Vµng",
			}
		}
	}

	local tSet = {};
	if nSet == 29 then tSet = KXHC
	elseif nSet == 30 then tSet = KXQP
	elseif nSet == 31 then tSet = KXDV end;
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("NhËn kim xµ thµnh c«ng!");
	end;

end;

function getRandomKX6(nSet)
	KXDG = {
		[1] = {
			[2618] = {"Søc m¹nh"},
			[2619] = {"G©n cèt"},
		},
		[2] = {
			[2631] = {"Néi c«ng"},
			[2632] = {"Th©n ph¸p"},
			[2633] = {"Linh ho¹t"},
			[2634] = {"§iÓm sinh lùc"},
			[2635] = {"Tû lÖ ®iÓm sinh lùc"},
		},
		[3] = {
			[2647] = {"B¹o kÝch"},
			[2648] = {"§iÓm ngo¹i c«ng"},
			[2649] = {"§iÓm néi c«ng"},
			[2650] = {"§iÓm néi ngo¹i c«ng"},
			[2651] = {"T¨ng ®iÓm sinh lùc"},
		},
		[4] = {
			[2665] = {"Phßng béc"},
			[2666] = {"Gi¶m béc"},
			[2667] = {"Hé gi¸p ngo¹i phßng"},
			[2668] = {"Hé gi¸p néi phßng"},
			[2669] = {"Hé gi¸p néi ngo¹i phßng"},
			[2670] = {"§iÓm sinh lùc"},
		},
		[5] =  {
			[2678] = {"Søc m¹nh"},
			[2679] = {"G©n cèt"},
			[2680] = {"T¨ng tû lÖ ®iÓm sinh lùc"},
		},
		[6] = {
			[1] = { -- ¸o choµng vµ huy ch­¬ng
				[2690] = {"Giíi h¹n cao nhÊt ngo¹i c«ng vò khÝ"},
				[2691] = {"Giíi h¹n thÊp nhÊt ngo¹i c«ng vò khÝ"},
				[2692] = {"Tû lÖ ngo¹i c«ng"},
				[2693] = {"§iÓm tæng c«ng kÝch ngo¹i c«ng"},
			},
			[2] = { -- Giµy (154)
				[2703] = {"Tèc ®é ch¹y"},
				[2704] = {"Ph¸t huy vâ c«ng"},
				[2705] = {"Gi¶m nöa thä th­¬ng"},
				[2706] = {"X¸c suÊt chuÈn x¸c"},
			}
		}
	}
	
	KXHL = {
		[1] = {
			[2514] = {"Linh ho¹t"},
			[2515] = {"Th©n Ph¸p"},
		},
		[2] = {
			[2527] = {"Néi c«ng"},
			[2528] = {"Søc m¹nh"},
			[2529] = {"G©n cèt"},
			[2530] = {"§iÓm sinh lùc"},
			[2531] = {"Tû lÖ ®iÓm sinh lùc"},
		},
		[3] = {
			[2543] = {"B¹o kÝch"},
			[2544] = {"§iÓm ngo¹i c«ng"},
			[2545] = {"§iÓm néi c«ng"},
			[2546] = {"§iÓm néi ngo¹i c«ng"},
			[2547] = {"T¨ng ®iÓm sinh lùc"},
		},
		[4] = {
			[2561] = {"Phßng béc"},
			[2562] = {"Gi¶m béc"},
			[2563] = {"Hé gi¸p ngo¹i phßng"},
			[2564] = {"Hé gi¸p néi phßng"},
			[2565] = {"Hé gi¸p néi ngo¹i phßng"},
			[2566] = {"§iÓm sinh mÖnh"},
		},
		[5] = {
			[2572] = {"Linh ho¹t"},
			[2573] = {"Th©n ph¸p"},
		},
		[6] = {
			[1] = {
				[2583] = {"T¨ng s¸t th­¬ng"},
				[2584] = {"C«ng kÝch kÌm ®éc"},
				[2585] = {"S¸t th­¬ng ®éc trïng"},
				[2586] = {"Tû lÖ kh¸ng tr¹ng th¸i bÊt th­êng"},
			},
			[2] = {
				[2608] = {"Tèc ®é ch¹y"},
				[2609] = {"Ph¸t huy Vâ c«ng"},
				[2610] = {"Gi¶m nöa chÞu th­¬ng"},
				[2611] = {"X¸c suÊt chuÈn x¸c"},
				[2612] = {"Toµn thuéc tÝnh"},
			}
		}
	}
	
	KXKP = {
		[1] = {
			[2712] = {"Néi c«ng"},
			[2713] = {"G©n cèt"},
		},
		[2] = {
			[2725] = {"Søc m¹nh"},
			[2726] = {"Th©n ph¸p"},
			[2727] = {"Linh ho¹t"},
			[2728] = {"§iÓm sinh lùc"},
			[2729] =  {"Tû lÖ ®iÓm sinh lùc"},
		},
		[3] = {
			[2741] = {"B¹o kÝch"},
			[2742] = {"§iÓm ngo¹i c«ng"},
			[2743] = {"§iÓm néi c«ng"},
			[2744] = {"§iÓm néi ngo¹i c«ng"},
			[2745] = {"T¨ng ®iÓm sinh lùc"},
		},
		[4] = {
			[2759] = {"Phßng béc"},
			[2760] = {"Gi¶m béc"},
			[2761] = {"Hé gi¸p ngo¹i phßng"},
			[2762] = {"Hé gi¸p néi phßng"},
			[2763] = {"Hé gi¸p néi ngo¹i phßng"},
			[2764] = {"§iÓm sinh lùc"},
		},
		[5] = {
			[2772] = {"Néi c«ng"},
			[2773] = {"Th©n ph¸p"},
			[2774] = {"Linh ho¹t"},
		},
		[6] = {
			[1] = {
				[2784] = {"Giíi h¹n cao nhÊt néi c«ng vò khÝ"},
				[2785] = {"Giíi h¹n thÊp nhÊt néi c«ng vò khÝ"},
				[2786] = {"T¨ng néi c«ng"},
				[2787] = {"§iÓm c«ng kÝch néi c«ng"},
			},
			[2] = {
				[2803] = {"Rót ng¾n thêi gian thä th­¬ng"},
				[2799] = {"Tèc ®é ch¹y"},
				[2800] = {"Ph¸t huy vâ c«ng"},
				[2801] = {"Gi¶m nöa thä th­¬ng"},
				[2802] = {"X¸c suÊt chuÈn x¸c"},
			}
		}
	}

	local tSet = {};
	if nSet == 32 then tSet = KXHL
	elseif nSet == 33 then tSet = KXDG
	elseif nSet == 34 then tSet = KXKP end;
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("NhËn kim xµ thµnh c«ng!");
	end;
end


function getRandomKX7(nSet)
	
	KXSL = {
		[1] = {
			[3388]="Linh ho¹t",
			[3389]="Th©n ph¸p",
		},
		[2] = {
			[3401] = "Néi c«ng",
			[3402] = "Søc m¹nh",
			[3403] = "C¨n cèt",
			[3404] = "T¨ng ®iÓm sinh lùc",
			[3405] = "T¨ng tû lÖ ®iÓm sinh lùc",
		},
		[3] = {
			[3417] = "B¹o kÝch",
			[3418] = "T¨ng ®iÓm sè ngo¹i c«ng",
			[3419] = "T¨ng ®iÓm sè néi c«ng",
			[3420] = "T¨ng ®iÓm sè néi ngo¹i",
			[3421] = "Toµn thuéc tÝnh",
		},
		[4] = {
			[3435] = "Phßng béc",
			[3436] = "Gi¶m béc",
			[3437] = "Hé gi¸p ngo¹i phßng",
			[3438] = "Hé gi¸p néi phßng",
			[3439] = "Hé gi¸p néi ngo¹i phßng",
			[3440] = "§iÓm sinh lùc",
		},
		[5] = {
			[3446] = "Linh ho¹t",
			[3447] = "Th©n ph¸p",
		},
		[6] = {
			[1] = {
				[3457] = "T¨ng s¸t th­¬ng",
				[3458] = "C«ng kÝch kÌm ®éc",
				[3459] = "S¸t th­¬ng ®éc trïng",
			},
			[2] = {
				[3468] = "T¨ng s¸t th­¬ng",
				[3469] = "C«ng kÝch kÌm ®éc",
				[3470] = "S¸t th­¬ng ®éc trïng",
			},
			[3] = {
				[3482] = "Tèc ®é ch¹y",
				[3483] = "Ph¸t huy Vâ c«ng",
				[3484] = "Gi¶m nöa chÞu th­¬ng",
				[3485] = "X¸c suÊt chuÈn x¸c",
				[3486] = "Toµn thuéc tÝnh",
			}
		}
	}

	KXNN = {
		[1] = {
			[3492] = "Søc m¹nh",
			[3493] = "C¨n cèt",
		},
		[2] = {
			[3505] = "Néi c«ng",
			[3506] = "Th©n ph¸p",
			[3507] = "Linh ho¹t",
			[3508] = "§iÓm sinh lùc",
			[3509] = "Tû lÖ ®iÓm sinh lùc",
		},
		[3] = {
			[3521] = "B¹o kÝch",
			[3522] = "§iÓm ngo¹i c«ng",
			[3523] = "§iÓm néi c«ng",
			[3524] = "§iÓm néi ngo¹i c«ng",
			[3525] = "T¨ng ®iÓm sinh lùc",
		},
		[4] = {
			[3539] = "Phßng béc",
			[3540] = "Gi¶m béc",
			[3541] = "Hé gi¸p ngo¹i phßng",
			[3542] = "Hé gi¸p néi phßng",
			[3543] = "Hé gi¸p néi ngo¹i phßng",
			[3544] = "§iÓm sinh lùc",
		},
		[5] = {
			[3552] = "Søc m¹nh",
			[3553] = "C¨n cèt",
			[3554] = "T¨ng tû lÖ ®iÓm sinh lùc",
		},
		[6] = {
			[1] = {
				[3564] = "Giíi h¹n cao nhÊt ngo¹i c«ng vò khÝ ",
				[3565] = "Giíi h¹n thÊp nhÊt ngo¹i c«ng vò khÝ",
				[3566] = "Tû lÖ ngo¹i c«ng",
				[3567] = "§iÓm tæng c«ng kÝch ngo¹i c«ng",
			},
			[2] = {
				[3577] = "Tèc ®é ch¹y",
				[3578] = "Ph¸t huy Vâ c«ng",
				[3579] = "Gi¶m nöa chÞu th­¬ng",
				[3580] = "X¸c suÊt chuÈn x¸c",
			}
		}
	}
			
	KXMS = {
		[1] = {
			[3586] = "Néi c«ng",
			[3587] = "C¨n cèt",
		},
		[2] = {
			[3599] = "Søc m¹nh",
			[3600] = "Th©n ph¸p",
			[3601] = "Linh ho¹t",
			[3602] = "§iÓm sinh lùc",
			[3603] = "Tû lÖ ®iÓm sinh lùc",
		},
		[3] = {
			[3615] = "B¹o kÝch",
			[3616] = "§iÓm ngo¹i c«ng",
			[3617] = "§iÓm néi c«ng",
			[3618] = "§iÓm néi ngo¹i c«ng",
			[3619] = "T¨ng ®iÓm sinh lùc",
		},
		[4] = {
			[3633] = "Phßng béc",
			[3634] = "Gi¶m béc",
			[3635] = "Hé gi¸p ngo¹i phßng",
			[3636] = "Hé gi¸p néi phßng",
			[3637] = "Hé gi¸p néi ngo¹i phßng",
			[3638] = "§iÓm sinh lùc",
		},
		[5] = {
			[3646] = "Néi c«ng",
			[3647] = "Th©n ph¸p",
			[3648] = "Linh ho¹t",
		},
		[6] = {
			[1] = {
				[3658] = "Giíi h¹n cao nhÊt néi c«ng vò khÝ",
				[3659] = "Giíi h¹n thÊp nhÊt néi c«ng vò khÝ",
				[3660] = "Tû lÖ néi c«ng-vµng",
				[3661] = "§iÓm tæng c«ng kÝch néi c«ng- vµng",
			},
			[2] = {
				[3673] = "Tèc ®é ch¹y",
				[3674] = "Ph¸t huy Vâ c«ng",
				[3675] = "Gi¶m nöa chÞu th­¬ng",
				[3676] = "X¸c suÊt chuÈn x¸c",
				[3677] = "Rót ng¾n ®éng t¸c bÞ th­¬ng- Vµng",
			}
		}
	}
	local tSet = {};
	if nSet == 35 then tSet = KXSL
	elseif nSet == 36 then tSet = KXNN
	elseif nSet == 37 then tSet = KXMS end;
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("NhËn kim xµ thµnh c«ng!");
	end;
end;



function showKX7()
	tSay = {
		"S¸t Lang/#getRandomKX7(35)",
		"NhuÖ Nha/#getRandomKX7(36)",
		"Méng S¸t/#getRandomKX7(37)",
	}
	tinsert(tSay,"Ch­a muèn nhËn/nothing");
	Say("Chän lo¹i kim xµ",getn(tSay),tSay);
end;

function showKX6()
	tSay = {
		"Hoan L¨ng/#getRandomKX6(32)",
		"§»ng Giao/#getRandomKX6(33)",
		"Khëi Ph­îng/#getRandomKX6(34)",
	}
	tinsert(tSay,"Ch­a muèn nhËn/nothing");
	Say("Chän lo¹i kim xµ",getn(tSay),tSay);
end;

function showKX5()
	tSay = {
		"HiÖp cèt/#getRandomKX5(29)",
		"Quû phï/#getRandomKX5(30)",
		"§»ng v©n/#getRandomKX5(31)",
	}
	tinsert(tSay,"Ch­a muèn nhËn/nothing");
	Say("Chän lo¹i kim xµ",getn(tSay),tSay);
end;


function showKX4()
	tSay = {
		"Du hiÖp/#getRandomKX4(26)",
		"ThiÕt huyÕt/#getRandomKX4(27)",
		"V©n du/#getRandomKX4(28)",
	}
	tinsert(tSay,"Ch­a muèn nhËn/nothing");
	Say("Chän lo¹i kim xµ",getn(tSay),tSay);
end;

function addSetofKX(tSet, nSet)
	local r1,r2,r3,r4,r5,r6;
	-- Add Phi phong
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,1);
	AddKX(152,nSet,r1,r2,r3,r4,r5,r6);
	-- Add Huy ch­¬ng
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,2);
	AddKX(153,nSet,r1,r2,r3,r4,r5,r6);
	-- Add ChiÕn hµi
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,3);
	AddKX(154,nSet,r1,r2,r3,r4,r5,r6);
	return 1;
end

function getIndexs(tList,nPos)
	local tSubList = {}
	local nListLen = getn(tList);
	
	if nPos == 1 then
		tSubList = tList[nListLen][1];
	elseif nPos == 2 then
		if getn(tList[nListLen]) == 3 then
			tSubList = tList[nListLen][2];
		else
			tSubList = tList[nListLen][1];
		end
	elseif nPos == 3 then
		if getn(tList[nListLen]) == 3 then 
			tSubList = tList[nListLen][3];
		else
			tSubList = tList[nListLen][2];
		end
	end
	
	local r1,r2,r3,r4,r5,r6;
	if nListLen == 6 then 			
		r1 = getRandomIndex(tList[1]);
		r2 = getRandomIndex(tList[2]);
		r3 = getRandomIndex(tList[3]);
		r4 = getRandomIndex(tList[4]);
		r5 = getRandomIndex(tList[5]);
		r6 = getRandomIndex(tSubList);
		-- print(r1,r2,r3,r4,r5,r6);
	elseif nListLen == 4 then 
		r1 = getRandomIndex(tList[1]);
		r2 = getRandomIndex(tList[2]);
		r3 = getRandomIndex(tList[3]);
		r4 = getRandomIndex(tSubList);
	end
		
	return r1,r2,r3,r4,r5,r6;
end;

function getRandomIndex(tList)
	local nIndexResult = -1;
	if tList == nil then 
		return 0
	end
	local nRandNum = random(tlen(tList));
	local i = 0;
	for k,v in tList do 
		i = i+1;
		if i == nRandNum then
			nIndexResult = k;
			break
		end
	end
	return nIndexResult;
end;

function tlen(tList)
	local i = 0;
	for k,v in tList do 
		i = i+1;
	end
	return i;
end;

function AddKX(nType,nSet,ID1,ID2,ID3,ID4,ID5,ID6)
	local nResult,nItemIndex = AddItem(0,nType,nSet,1,4,-1,-1,-1,-1,-1,-1,0,15)
    FeedItem(nItemIndex,1000000)
	if ID5 ~= nil and ID6 ~= nil then 
		SetItemFeedUpAttrs(nItemIndex,ID1,ID2,ID3,ID4,ID5,ID6);
	else
		SetItemFeedUpAttrs(nItemIndex,ID1,ID2,0,ID3,0,ID4);
	end
end
