--×Ô¶¯¼ÓÔØNPC½Å±¾£¬·þÎñÆ÷Æô¶¯Ê±µ÷ÓÃ
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êý
Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");--Ô½ÄÏ09Äê7ÔÂ»î¶¯¿ª¹ØÍ·ÎÄ¼þ
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\class\\ktabfile.lua");--tabÎÄ¼þ´¦Àí
Include("\\script\\system_switch_config.lua")
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")
Include("\\script\\vng\\config\\newserver.lua");
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\equip_feed\\equip_feed_npc.lua")
Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\settings\\static_script\\gem\\imp_npc_gem.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

function main()
	addnpc_yanmenbattle_signup();
	init_xc_ls_sq()

	AddNpcCd();     	--³É¶¼ÈÎÎñADDµÄNPC
	AddNpcXy();    		--ÏåÑôÈÎÎñADDµÄNPC
	AddNpcYz();     	--ÑïÖÝÈÎÎñADDµÄNPC
	AddNpcWeekEnd();    --ÖÜÄ©»î¶¯ADDµÄNPC
	AddNpcXl();     	--±Õ¹ØÐÞÁ¶ADDµÄNPC
	Addxinan();     	--Î÷ÄÏµØÍ¼NPC
	-------------------
	AddNpcQz();     	--ÈªÖÝÐÂ¼ÓNPC
	AddTl();        	--ÌìÀÎµØÍ¼Ìí¼ÓµÄNPC
	Addsh();        	--ÉÌ»áÌí¼ÓµÄNPC
	Addtj();        	--Í¨¼©ÈÎÎñÌí¼ÓµÄNPC
	Addtaohuadao();     --½ø³öÌÒ»¨µºÌí¼ÓµÄNPC
	Addgudao()
	Addcangjian();      --²Ø½£Ê¹Õß
	Addyangmen();       --Ìì²¨Ñî¸®Ìí¼ÓµÄNPC
	AddChristmas()		--Ê¥µ®½Ú»î¶¯NPC£¨±£Áô¸øÒÔºóÍâ¹ú½ÚÈÕÓÃ£©
	AddCheFu();		 	--²É¼¯µØÍ¼³µ·ò
	AddDragonBoatDay()	--¶ËÎç½Ú
	Addjiehun()	        --½á»é
	Addtianshi()	    --ÌìÊ¦ÃØ¾³npc
	AddXiBei()	        --Î÷±±ÇøNpc

	AddTxNpc()			--Ì«Ðé»Ã¾³NPCÌí¼Ó
	ZoneInit(1010)		--Ì«Ðé»Ã¾³³õÊ¼»¯µØÍ¼Trap
	ZoneInit(2010)
	ZoneInit(3010)
	ZoneInit(4010)
	ZoneInit(5010)

	Addfengdutrap()    	--·á¶¼to¹íÃÅ»ØÀÈtrap
	Addmenpaibuchong() 	--ÃÅÅÉtrapµÄ²¹³ä,±ÜÃâÒ»Ð©×´Ì¬ÎÞ·¨¸Ä±äµÄÇé¿ö
	AddXinshou()  		---ÐÂÊÖÖ¸ÒýµÄ²éÑ¯npc
	CreateGatherNpc()	-- ÌæÉí²É¼¯ÍÐ¹ÜÈË
	Addmenpai();     	--ÃÅÅÉbossNPC
	AddNewBattle();		--ÐÂÕ½³¡NPC
	ApplyRelayInitData()	--È¡Gameser³õÊ¼»¯Ê±ÐèÒªµÄRelayÐÅÏ¢
	zgc_auto_fun_main()		--´å³¤µÄ×Ô¶¯º¯Êý
	AddSnowWarNpc()		--Ñ©ÕÌNPC
	AddKillerHall()		--É±ÊÖÌÃ
	AddCaijiNpc()		--²É¼¯µØÍ¼ÎïÆ·±£¹ÜÈË,³É¶¼¶«ÃÅ¼ÓÎïÆ·±£¹ÜÈË
	AddGongYe(); 		--¹«Ò±ÊÀ¼Ò
	AddTongMission();	--°ï»á¹Ø¿¨
	AddZGDaShi(); 		-- LATER ADDED
	AddNpcYiZuChuGuo();	-- MODIFIED
	AddGongChengNpc();	--¹¥³ÇÕ½Ïà¹ØNPC
	AddLiuTudi();		--ÁõÌú½³Í½µÜNPC
	AddTyTuzi(); 		--ÌìÑÄº£½ÇÍÃÐ¡Ñ¾
	add_biwudahui();	--±ÈÎä´ó»á
	add_faction_back_room();	--Ê¦ÃÅÃØÊÒ
	add_weizhi_npc()
	AddFirstTongNpc()	--µÚÒ»°ï»î¶¯
	addLonghuNpc();		--Ô½ÄÏ¾«Ó¢°ï»áÕ½ ±¨Ãûnpc
	Add67EventNpcs();	--09Äê7ÔÂ»î¶¯NPCÌí¼Ó
	AddNpcYecao();
	add_0908_npc();		--09Äê8ÔÂ»î¶¯NPCÌí¼Ó
	add_0908_tuoguan_plant_npc();--ÀëÏßÍÐ¹ÜÖÖÊ÷NPCÌí¼Ó
	add_0909_npc();		--09Äê9ÔÂÖÐÇï»î¶¯NPCÌí¼Ó
	add_0911_npc();
	if tonumber(date("%y%m%d")) >= 101224 and tonumber(date("%y%m%d")) <= 410113 then
		add_0912_npc();	--09Äê12ÔÂNPCÌí¼Ó
	end
	get_server_id() 	-- Set server ID
	Add_ip_npc() 		-- IP Bonus
	VBonus_NPC() 		-- Add NPC VBonus
	Add_bachtiensinh() 	-- B¹ch Tiªn Sinh
	AddTuLinhNpc() 		-- NPC Tø Linh
	if tonumber(date("%y%m%d")) >= 100924 and tonumber(date("%y%m%d")) <= 401028 then
		AddHangNga()  	-- NPC H»ng Nga 2010
	end
	if tonumber(date("%y%m%d")) >= 110519 and tonumber(date("%y%m%d")) <= 410602 then
		AddIdolNpc()  	-- ThÇn T­îng Vâ L©m
	end
	if tonumber(date("%y%m%d")) <= 410102 then
		AddBirthdayNpc_2010()  -- Sø Gi¸ Häat §éng SN JX2
	end
	Add_1002_npc() 		-- Hoa §¨ng TÕt
	Init_newres() 		-- Tµi Nguyªn ChiÕn
	Init_golden_chest() -- R­¬ng HKLB
	Init_pet_fighting() -- Pet vs pet
	Add_PetNpc() 		-- B¾c §Èu L·o Nh©n
	if GetGlbValue(GLB_TSK_SERVER_ID) == 58 then
		Add_HoangHuynh()  		-- NPC dua top Hoang Ung
	end
	Add_GoldenCard_Manager(); 	-- B¸n code HKLB ingame
	Add_XaPhu() 				-- ThuyÒn gia
	Add_Pet_TaiXu() 			-- NPC Th¸i H­ B¹n §ång Hµnh
	if tonumber(date("%m%d")) >= 0121 and tonumber(date("%m%d")) <= 0220 then
		add_1101_tet_npc()  	-- NPC C©y Nªu TÕt 2011
	end	
	Add_TianMenZhen(); 			--ÌìÃÅÕó±¨Ãûnpc
	Liangshan_Entrance();		--2011-2-23ÁºÉ½´«ËÍNPC´´½¨
     Add_TuBaoThuongNhan()	
	DragonBoat_2011_npc()    	--201109º£ÉÏÁúÖÛÕ½
	LoadNpcList();				--¼ÓÔØnpc_list.txtÅäÖÃµÄNPC
	create_treasuer_chests();	--±¦ÏäÉÌÈË
	new_task_npc_create();		--ÐÂÈÎÎñÏµÍ³NPCÌí¼Ó
	Ambassador_Acitivity(); 	--»î¶¯´óÊ¹NPCÌí¼Ó
	new_ttd_npc_create(); 		--Í¨Ìì¶¥NPC´´½¨
	new_task_npc_create2();		--¹Ø¿¨ÏµÁÐÈÎÎñNpc
	LSB_Exec_CleanData();		--Æô¶¯·þÎñÆ÷Êý¾ÝÇåÀí
	shenghuotai_npc_create(); 	--Ê¥»ðÌ¨´´½¨
	Activity_Npc_Add_201209();	--9ÔÂ»î¶¯NPC´´½¨
	Qht_Activity_Event();		--¼¤Õ½Ç§Ñ°Ëþ
	Bkl_baoruong() 				--B¹ch Kim LÖnh b¶o r­¬ng
	if tonumber(date("%y%m%d")) >= 140124 and tonumber(date("%y%m%d")) <= 440203 then
		tuyetanh_baoruong() 	--Quý Ngä(Tþ) B¶o R­¬ng
		chieuda_baoruong()
		xichtho_baoruong()
	end
	npcVanMay() 				--Npc tÝnh n¨ng VËn May §¹o H÷u
	wujiang_task_npc_create();	--Îä½«ÈÎÎñnpc´´½¨
	meihuayingchun_npc_create();--Ã·»¨Ó­´ºnpc´´½¨
	zhenqi_battle_init();		--ÕæÆøÕ½³¡³õÊ¼»¯
	--kuafu_battle_init();		--¿ç·þÕ½³¡½ÓÒýÈË
	equip_feed_OnServerStart();	--Ñø³É×°±¸¹¦ÄÜNPC
	Vip_NPC()
	dixuangong_join_npc(); 		--µØÐþ¹¬½ÓÒýÈË
	biwu_3v3_init(); 			--3v3
	tf_CreateChef(); 			--°ïÅÉÊ¢Ñç
	wuwang_task_createnpc(); 	--ÎäÍõÈÎÎñnpc´´½¨
	--sp_CreateDecorate();		--2014´º½Ú»î¶¯  -- See AddDecorateNpc 2015 below
	--tong_melee_npc_create(); 	--°ï»á´óÊ¹
	--kuafu_lingjiang_npc_create(); --¿ç·þ¹¦ÄÜÁì½±ÈË´´½¨
	Plus123Pay();
	AddTYNpc();					--Ì«Ò»¹Ø¿¨npc
	AddLifeSkillNpc(); 			--Ìí¼ÓÉú»î¼¼ÄÜNPC
	gem_OnServerStart()			--Ìí¼Ó±¦Ê¯ÏµÍ³Npc
	_kf_create_npc_server_start()--¿ç·þÏà¹ØNPC´´½¨
	Observer:onEvent(SYSEVENT_GAMESERVER_START, 0)
	AddHeiYiZhuangShi();
	-------------------------------------------------------------
	--					END OF ORIGINAL INITIAL
	-------------------------------------------------------------
	Add3Festival()
	AddNewYearNpc()
	mooncake_08();
	new_year_09();
	AddNpcTieuQuyen();
	AddFuShen(); 			-- Added at 29/07/2020
	new_year_2006_npc();			-- Added at 23/11/2020
	Add_1108_npc(); 		-- Added at 29/07/2020
	Add_0910_npc();
	Add_wuyi_npc();
	Add_aoyun_npc();
	Add_AoYunQiXi08(); 		-- That tich
	AddBaiHuaNpc(); 		-- That tich
	AddLaborDay();
	add_mail_carrier();
	AddQingMing();			-- Thanh Minh
	--AddXsTg();				-- Xin shou tui guang
	-------------------------------------------------------------
	--					2015 ACTIVITIES
	-------------------------------------------------------------
	-- AddActivtySnowMan(); 	--12ÔÂÊ¥µ®Ñ©ÈË
	AddSnowBattleNpc(); 	--Ñ©ÕÌNPC
	AddDecorateNpc(); 		--2015´º½Ú×°ÊÎ
	AddYpNpc(); 			--Èý·½ÊÆÁ¦ 
	AddReborn3TaskNpc(); 	--¸´Éú3ÈÎÎñNPC
	SendScript2VM("\\script\\missions\\yp\\vn\\server_start.lua","on_server_start()");
	-------------------------------------------------------------
	--					MODIFIED ACTIVITIES
	-------------------------------------------------------------
	-- AddCheFuWuLinMeng(); 	-- Added at 29/07/2020
	AddTrapSanGuo();
	AddNpcHacBachVoThuong();
	AddNpcDaShangRen();
	AddNpcBienKinh();
	AddNpcTayBienKinh();
	AddTrapLinhBaoSon();
	AddNpcBacThanhDo();
	AddTrapTuyenChau();
	AddNpcCayDao();
	AddGaiBanHoa();
	AddBanTraiCay();
	AddChuTiemTra();
	
	AddMinhGiao();
	AddDuongMon();
	
	AddNpcEvents();
	AddNpcTamDa();
	AddBaoXiang_200903();
	AddLoPhi();
	AddNguCac();
	AddExpandBox();
	AddJubaopen();
	AddWaterWells();
	AddRestingPlaces();
end;

-------------------------------------------------------------------------------
--							END OF MAIN FUNCTIONS
-------------------------------------------------------------------------------

function AddChuTiemTra()
	local nNpcIdx = CreateNpc("ThiÕu niªn trong th«n", "Chñ tiÖm trµ", 350,1516,2876);
	SetNpcScript(nNpcIdx,"\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\npc_bantraicay.lua");
end;

function AddBanTraiCay()
	-- B¸n tr¸i c©y
	local nNpcIdx = CreateNpc("ThiÕu niªn trong th«n", "B¸n tr¸i c©y", 507,1722,3414);
	SetNpcScript(nNpcIdx,"\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\npc_bantraicay.lua");
	
	local nNpcIdx = CreateNpc("ThiÕu niªn trong th«n", "B¸n tr¸i c©y", 350,1545,3014);
	SetNpcScript(nNpcIdx,"\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\npc_bantraicay.lua");
	
	local nNpcIdx = CreateNpc("Sµi Phong Nhi", "B¸n tr¸i c©y", 350,1394,3005);
	SetNpcScript(nNpcIdx,"\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\npc_bantraicay.lua");
	
	local nNpcIdx = CreateNpc("Sµi Phong Nhi", "B¸n tr¸i c©y", 200,1310,2747);
	SetNpcScript(nNpcIdx,"\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\npc_bantraicay.lua");
	
	local nNpcIdx = CreateNpc("Sµi Phong Nhi", "B¸n tr¸i c©y", 200,1342,2941);
	SetNpcScript(nNpcIdx,"\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\npc_bantraicay.lua");
	
	local nNpcIdx = CreateNpc("Sµi Phong Nhi", "B¸n tr¸i c©y", 200,1527,2935);
	SetNpcScript(nNpcIdx,"\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\npc_bantraicay.lua");
	
	local nNpcIdx = CreateNpc("Sµi Phong Nhi", "B¸n tr¸i c©y", 150,1585,3104);
	SetNpcScript(nNpcIdx,"\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\npc_bantraicay.lua");
	
end;

function AddRestingPlaces()
	local model = "Ng­êi v« h×nh";
	local npc1 = "TiÓu ®×nh";
	local npc2 = "Bµn trµ";
	local script = "\\script\\online\\eating\\npc_resting.lua";
	CreateNpcList({
		{model,npc1,211,2029,3196,script},
		{model,npc1,208,1423,2852,script},
		{model,npc1,100,1246,2989,script},
		{model,npc1,100,1409,2815,script},
		{model,npc1,501,1583,3055,script},
		{model,npc1,305,1715,2790,script},
		{model,npc1,303,1723,2983,script},
		{model,npc1,219,1364,3103,script},
		{model,npc1,202,1448,2789,script},
		{model,npc1,311,1473,2984,script},
		{model,npc1,306,1370,2871,script},
		{model,npc1,401,1597,3107,script},
		{model,npc1,307,1377,2682,script}, -- Phong §«
		{model,npc1,504,1410,2891,script},
		{model,npc1,200,1372,2615,script},
		{model,npc1,204,1357,3229,script},
		{model,npc1,303,1490,3109,script},
		{model,npc1,205,1595,2972,script},
		{model,npc1,0,script},
		{model,npc1,0,script},
		{model,npc1,0,script},
		{model,npc1,0,script},
		{model,npc1,0,script},
		
		{model,npc1,6016,1451,2934,script},
		{model,npc1,6100,1836,3526,script}, -- Quúnh k?t
		{model,npc1,502,1689,3103,script},	-- Hoa s¬n
		{model,npc1,428,1547,2545,script},	-- Ng­ng nguyÖt cung
		{model,npc1,428,1451,2588,script},
		
		{model,npc2,300,1712,3579,script},
		{model,npc2,300,1672,3612,script},
		{model,npc2,0,script},
		{model,npc2,0,script},
		{model,npc2,0,script},
		{model,npc2,0,script},
		{model,npc2,0,script},
		{model,npc2,0,script},
		{model,npc2,0,script},
	});
end

function AddWaterWells()
	local model = "Ng­êi v« h×nh";
	local npc1 = "GiÕng n­íc";
	local npc2 = "Suèi n­íc";
	local npc3 = "Vòng n­íc";
	local script = "\\script\\online\\eating\\npc_wells.lua";
	CreateNpcList({
		{model,npc1,100,1456,2897,script},
		{model,npc2,102,1522,2827,script},
		{model,npc2,102,1393,2785,script},
		{model,npc2,105,1411,3154,script},
		{model,npc2,105,1524,2988,script},
		{model,npc1,106,1303,2937,script},
		{model,npc2,107,1312,2763,script},
		{model,npc1,107,1431,3025,script},
		
		{model,npc1,200,1334,2642,script},
		{model,npc3,201,1405,2800,script},
		{model,npc2,201,1545,2807,script},
		{model,npc2,202,1397,2802,script},
		--{model,npc1,202,1414,3015,script}, cèi ®¸
		{model,npc3,202,1586,3039,script},
		{model,npc3,202,1398,2714,script},
		{model,npc1,202,1375,3023,script},
		{model,npc3,202,1388,2966,script},
		{model,npc3,202,1344,3162,script},
		{model,npc2,203,1580,2804,script},
		{model,npc2,204,1413,3233,script},
		{model,npc2,205,1609,2837,script},
		--{model,npc1,205,1588,3228,script}, -- cèi xay
		{model,npc2,205,1862,2911,script},
		{model,npc3,205,1644,3226,script},
		{model,npc1,208,1501,2725,script},
		{model,npc3,208,1433,3029,script},
		{model,npc2,209,1607,3079,script},
		{model,npc2,211,1542,3148,script},
		{model,npc2,211,2022,3190,script},
		
		{model,npc1,300,1866,3403,script},
		{model,npc1,300,1862,3527,script},
		{model,npc1,300,1780,3783,script},
		{model,npc1,300,1964,3492,script},
		{model,npc1,300,1685,3591,script},
		{model,npc1,303,1719,3004,script},
		{model,npc2,303,1657,3295,script},
		-- {model,npc1,305,1646,2875,script}, -- cèi xay
		{model,npc2,308,1410,2965,script},
		{model,npc3,308,1466,2932,script},
		{model,npc3,310,1369,3204,script},
		{model,npc1,310,1293,3019,script},
		{model,npc2,311,1400,2631,script},
		{model,npc2,312,1960,3295,script},
		{model,npc2,312,1699,3655,script},
		
		{model,npc1,350,1381,2857,script},
		{model,npc1,350,1338,3030,script},
		{model,npc1,350,1347,2938,script},
		{model,npc1,350,1578,2904,script},
		{model,npc2,406,1310,2899,script},
		{model,npc2,408,1325,2749,script},
		
		-- {model,npc1,500,1837,3148,script}, 	-- cèi xay
		-- {model,npc1,500,1722,3269,script},	-- cèi xay
		-- {model,npc1,500,1601,3155,script},	-- cèi xay
		{model,npc1,500,1718,3011,script},
		-- {model,npc1,504,1302,3149,script},	-- cèi xay
		{model,"Vòng n­íc m­a",504,1352,2841,script},
		{model,"Vòng n­íc m­a",507,1830,3162,script},
		{model,npc1,505,1453,2994,script},
		--{model,npc1,507,1658,3403,script},	--cèi xay
		--{model,npc1,507,1730,3384,script},	--cèi xay
		--{model,npc1,507,1626,3351,script},	--cèi xay
		{model,npc1,507,1662,3416,script},
		-- Mª cung sa m¹c
		{model,npc3,506,1524,2928,script},
		{model,npc3,506,1286,2927,script},
		{model,npc3,506,1522,2883,script},
		{model,npc3,506,1258,2973,script},
		{model,npc3,506,1320,2687,script},
		{model,npc3,506,1539,2712,script},
	});
end;

function AddJubaopen()
	CreateNpcList({
		{"Lß n­íng lín", "Tô b¶o bån",200,1451,2744,""},
		{"Lß n­íng lín", "Tô b¶o bån",200,1510,2803,""},
	});
end;

function AddExpandBox()
	SendScript2VM("\\script\\mod\\expand_box\\expand_box_head.lua","create_expand_boxs()");
end;


function AddQingMing()
	CreateNpcList({
		{"L·o n«ng d©n", "DÉn lé nh©n",100,1453,2812,"\\script\\online\\qingming\\transport_in_QZ.lua"},
		{"L·o n«ng d©n", "DÉn lé nh©n",200,1170,2834,"\\script\\online\\qingming\\transport_in_BJ.lua"},
		{"L·o n«ng d©n", "DÉn lé nh©n",300,1640,3531,"\\script\\online\\qingming\\transport_in_CD.lua"},
	});
	
	CreateNpcList({
		{"L·o n«ng d©n", "DÉn lé nh©n",818,1636,3181,"\\script\\online\\qingming\\transport_out_QZ.lua"},
		{"L·o n«ng d©n", "DÉn lé nh©n",820,1636,3181,"\\script\\online\\qingming\\transport_out_BJ.lua"},
		{"L·o n«ng d©n", "DÉn lé nh©n",819,1636,3181,"\\script\\online\\qingming\\transport_out_CD.lua"},
	});
	
end;

function AddNguCac()
	local nNpcIdx = CreateNpc("TriÖu C¸t","Ngù c¸c tiÕp dÉn quan",200,1471,2745);
	SetNpcScript(nNpcIdx,"\\script\\mod\\npc\\npc_ngucac.lua");
end;

function AddLoPhi()
	CreateNpcList({
		{"§ao phØ", "§ao phØ",217,1624,3196,nil},
		{"C«n phØ", "C«n phØ",217,1631,3206,nil},
		{"Th­¬ng phØ", "Th­¬ng phØ",217,1639,3215,nil},
	});
	
	CreateNpc("§¹i ng­u", "§¹i Ng­u",304,1483,3076);

end;

function AddBaoXiang_200903()
	local script = "\\script\\online\\viet_event\\march_event_09\\npc\\box_npc.lua";
	CreateNpcList({
		{"R­¬ng ®ång","B¶o r­¬ng thÇn bÝ",108,1423,3162,script},
		{"R­¬ng ®ång","B¶o r­¬ng thÇn bÝ",201,1549,2858,script},
		{"R­¬ng ®ång","B¶o r­¬ng thÇn bÝ",304,1560,2825,script},
	});
end;

function AddNpcTamDa()
	local nMonth = tonumber(date("%m"));
	
	if nMonth >= 1 and nMonth <= 2 then
		CreateNpc("Tèng Giang", "ThÇn tµi",300,1775,3542);
		
		CreateNpc("Chñ cÇm ®å thæ phån", "Phóc tinh",300,1741,3488);
		
		CreateNpc("§ång Qu¸n", "Léc tinh",300,1745,3493);
		-- CreateNpc("TruyÒn gi¸o sÜ", "¤ng thä",300,1775,3542);
		CreateNpc("Tö thanh th­îng nh©n", "Thä tinh",300,1750,3497);
	end
end;

function AddNpcEvents()
	local nMonth = tonumber(date("%m"));
	
	if nMonth >= 7 and nMonth <= 9 then
		local nNpcIndex = CreateNpc("ThiÕu n÷ ph­¬ng B¾c1","Chñ tiÖm b¸nh Trung Thu", 100,1420,2935);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\middle_autumn\\npc\\npc_chutiembanh.lua");
		
		local nNpcIndex = CreateNpc("Hû n­¬ng","Chñ tiÖm b¸nh Trung Thu", 150,1659,3142);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\middle_autumn\\npc\\npc_chutiembanh.lua");
	end
	
	if nMonth >= 12 or nMonth <= 1 then
		local nNpcIndex = CreateNpc("Phu nh©n T©y d­¬ng","Chñ tiÖm gi¸ng sinh", 300,1700,3536);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\christmas\\npc\\npc_chutiemgiangsinh.lua");
	end
	
	if nMonth >= 1 and nMonth <= 2 then
		local nNpcIndex = CreateNpc("Thè tiÓu nha","Chñ tiÖm ®å TÕt", 200,1418,2935);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\newyear\\npc\\npc_chutiemdotet.lua");
		
		local nNpcIndex = CreateNpc("Thè tiÓu nha","Chñ tiÖm ®å TÕt", 300,1785,3529);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\newyear\\npc\\npc_chutiemdotet.lua");
		
		local nNpcIndex = CreateNpc("KÑo hå l«","Chñ tiÖm ph¸o", 200,1414,2824);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\newyear\\npc\\npc_chutiemphao.lua");
	end
	
	if nMonth == 2 then
		local nNpcIndex = CreateNpc("Chøc n÷","Chñ tiÖm S«c«la", 100,1432,2934);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\valentine\\npc\\npc_chutiemsocola.lua");
	end

end;

function AddDuongMon()
	local nNpcIndex = CreateNpc("§­êng Léng NguyÖt","§­êng Léng NguyÖt",305,1538,2796);
	SetNpcScript(nNpcIndex,"\\script\\ÖÐÔ­¶þÇø\\ÌÆÃÅ\\npc\\ÌÆÅªÔÂ.lua");
end;

function AddMinhGiao()
	local npcindex1 = CreateNpc("Ph­¬ng L¹p", "Ph­¬ng L¹p", 152, 1452,3007)
	SetNpcScript(npcindex1, "\\script\\mapsminhzao\\chuongmon.lua")

	local npcindex2 = CreateNpc("LÖ Thiªn NhuËn", "LÖ Thiªn NhuËn", 152, 1398,3060)
	SetNpcScript(npcindex2, "\\script\\mapsminhzao\\thanhchien.lua")
	
	local npcindex3 = CreateNpc("T­ Hµnh Ph­¬ng", "T­ Hµnh Ph­¬ng", 152, 1454,3131)
	SetNpcScript(npcindex3, "\\script\\mapsminhzao\\huyetnhan.lua")
	
	local npcindex4 = CreateNpc("V­¬ng DÇn", "V­¬ng DÇn", 152,1559,3025)
	SetNpcScript(npcindex4, "\\script\\mapsminhzao\\tranbinh.lua")
	
	local npcindex5 = CreateNpc("Ph­¬ng B¸ch Hoa", "Ph­¬ng B¸ch Hoa", 152, 1688,3286)
	SetNpcScript(npcindex5, "\\script\\mapsminhzao\\xaphu.lua")
	
	local npcindex7 = CreateNpc("Ph­¬ng ThÊt PhËt", "Ph­¬ng ThÊt PhËt", 152, 1478,3036)
	SetNpcScript(npcindex7, "\\script\\mapsminhzao\\buysell.lua")
	
	local npcIndex6 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 152,1507,3074);
    SetNpcScript(npcIndex6, "\\script\\mapsminhzao\\thukho.lua");
	
	local npcIndex8 = CreateNpc("HÇu §«n", "HÇu §«n", 152,1508,2956);
    SetNpcScript(npcIndex8, "");
	
	local npcIndex9 = CreateNpc("Th¹ch B¶o", "Th¹ch B¶o", 152,1349,2870);
  	SetNpcScript(npcIndex9, "");
	
	local npcIndex10 = CreateNpc("LÖ Thiªn NhuËn", "§Æng Nguyªn Gi¸c", 152,1282,2746);
    SetNpcScript(npcIndex10, "");
end



function AddGaiBanHoa()
	local nNpcIdx = CreateNpc("D©n n÷","B¸ch Hoa",100,1392,2844);
	SetNpcScript(nNpcIdx, "\\script\\online_activites\\plant_flower\\npc_baihua.lua");
	local nNpcIdx = CreateNpc("Sµi Phong Nhi","B¸ch Hoa",150,1685,3050);
	SetNpcScript(nNpcIdx, "\\script\\online_activites\\plant_flower\\npc_baihua.lua");
	local nNpcIdx = CreateNpc("§¹i kh¶o quan miÔn tæng qu¶n","B¸ch Hoa",200,1285,2930);
	SetNpcScript(nNpcIdx, "\\script\\online_activites\\plant_flower\\npc_baihua.lua");
end;

function AddNpcCayDao()
	local nMonth = tonumber(date("%m"))
	if nMonth == 2 then
	CreateNpc("§µo Hoa thô"," ",200,1419,2819);
	end
end;

function AddNpcBacThanhDo()
	local nNpcIdx = CreateNpc("C©y hoa qu¶"," ", 308,1405,3216);
	SetNpcScript(nNpcIdx, "\\script\\online_activites\\202008\\npc\\npc_cayhoaqua.lua");
	
end;

function AddNpcTayBienKinh()
	local nNpcIndex = CreateNpc("TiÓu nhÞ trung nguyªn", "Chñ tiÖm nhá", 203,1472,2866);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©¸®Î÷\\npc\\npc_chutiemnho.lua");
end;

function AddTrapTuyenChau()
	for i=1598,1604 do -- Tuyen Chau - Dong Hai khu 1
		AddMapTrap(100, i*32, 3162*32,"\\script\\½­ÄÏÇø\\ÈªÖÝ\\trap\\ÈªÖÝto¶«º£º£±õÒ».lua");
	end
	--for i=1346,1352 do -- Dong Hai khu 2 - Bac Tuyen Chau
		--AddMapTrap(104, i*32, 2856*32,"\\script\\½­ÄÏÇø\\¶«º£º£±õ¶þ\\trap\\¶«º£º£±õ¶þtoÈªÖÝ¸®±±.lua");
	--end
	for i=1330,1336 do -- Dong Hai khu 2 - Bac Tuyen Chau
		AddMapTrap(104, i*32, 2842*32,"\\script\\½­ÄÏÇø\\¶«º£º£±õ¶þ\\trap\\¶«º£º£±õ¶þtoÈªÖÝ¸®±±.lua");
	end
	for i=1394,1400 do -- Tay Tuyen Chau -> Minh Giao
		AddMapTrap(105, i*32, 3180*32,"\\script\\½­ÄÏÇø\\ÈªÖÝ¸®Î÷\\trap\\ÈªÖÝ¸®Î÷toÃ÷½Ì.lua");
	end
	for i=1707,1726 do -- Minh Giao -> Tay Tuyen Chau
		AddMapTrap(152, i*32, 3320*32,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\trap\\Ã÷½ÌtoÈªÖÝ¸®Î÷.lua");
	end
	
end;

function AddTrapLinhBaoSon()
	--for i=1903,1909 do
		--AddMapTrap(218, i*62, 3647*32,"\\script\\ÖÐÔ­Ò»Çø\\Áé±¦É½\\trap\\Áé±¦É½toRandom.lua");
	--end
	
	for i=1897,1903 do
		AddMapTrap(218, i*32, 3649*32,"\\script\\ÖÐÔ­Ò»Çø\\Áé±¦É½\\trap\\Áé±¦É½toRandom.lua");
	end
	
	local tWoods = {
		{"Tïng méc","\\script\\caiji\\Ò»¶ÑËÉÄ¾.lua"},
		{"D­¬ng méc","\\script\\caiji\\Ò»¶ÑÑîÄ¾.lua"},
		{"Sam méc","\\script\\caiji\\Ò»¶ÑÉ¼Ä¾.lua"},
		{"ThiÕt méc","\\script\\caiji\\Ò»¶ÑÌúÄ¾.lua"},
		{"C©y ng« ®ång","\\script\\caiji\\Ò»¶ÑÎàÍ©Ä¾.lua"},
		{"Träng méc","\\script\\caiji\\Ò»¶ÑÖØÄ¾.lua"},
		{"ThiÕt Ch­¬ng méc","\\script\\caiji\\Ò»¶ÑÌúÕÁÄ¾.lua"},
		{"ThiÕt TuyÕn méc","\\script\\caiji\\Ò»¶ÑÌúÏßÄ¾.lua"},
	}

	
	-- GET ITEM PRIORITY BY ORDER
	local nMax = getn(tWoods);
	-- first create a list
	local list = {}
	local nLen = nMax;
	for i=1,nMax do
		for j=1,nLen do
			tinsert(list,j);
		end
		nLen = nLen-1;
	end
	
	-- C©y lÊy gç
	for i=200,240 do
		for j=200,222 do
			if random(10) == 1 then
				local nRand = random(getn(list));
				local index = list[nRand];
				local nNpcIdx = CreateNpc(tWoods[index][1],tWoods[index][1],218,i*8,j*16+2);
				SetNpcScript(nNpcIdx,tWoods[index][2]);
			end
		end
	end
	-- Da hæ
	for i=225,240 do
		for j=200,222 do
			if random(20) == 1 then
				local nNpcIdx = CreateNpc("Da hæ","Da hæ",218,i*8,j*16+2);
				SetNpcScript(nNpcIdx,"\\script\\caiji\\Ò»À¦»¢Æ¤.lua");
			end
		end
	end
	for i=205,240 do
		for j=222,230 do
			if random(20) == 1 then
				local nNpcIdx = CreateNpc("Da hæ","Da hæ",218,i*8,j*16+2);
				SetNpcScript(nNpcIdx,"\\script\\caiji\\Ò»À¦»¢Æ¤.lua");
			end
		end
	end
	
	
	local nNpcIdx = CreateNpc("Hæ tr¾ng","B¹ch hæ",218,1851,3625);
	SetNpcDeathScript(nNpcIdx, "\\script\\caiji\\baihu_death.lua");
	local nNpcIdx = CreateNpc("Da b¹ch hæ","Da b¹ch hæ",218,1851,3625);
	SetNpcScript(nNpcIdx,"\\script\\caiji\\Ò»À¦°×»¢Ö®Æ¤.lua");
end;

function AddNpcTieuQuyen()
	local nNpcIndex = CreateNpc("Thóy yªn m«n nh©n","TiÓu Quyªn",200,1423,2846);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\shop_tieuquyen\\tieuquyen_npc.lua");
end;

function mooncake_08()
	local nMonth = tonumber(date("%m"));
	if nMonth == 9 then
	local nNpcIdx = CreateNpc("Phi YÕn tiªn tö","Phi YÕn tiªn tö", 100,1396,2917);
	SetNpcScript(nNpcIdx, "\\script\\online\\viet_event\\mooncake_08\\npc\\feiyan.lua");
	
	local nNpcIdx = CreateNpc("Th«n phô 3","TÇn §¹i ThÈm", 100,1400,2913);
	SetNpcScript(nNpcIdx, "\\script\\online\\viet_event\\mooncake_08\\npc\\aunt_qin.lua");
	
	local nNpcIdx = CreateNpc("Tr­¬ng §¹i H÷u","TÇn §¹i Thóc", 100,1402,2921);
	SetNpcScript(nNpcIdx, "\\script\\online\\viet_event\\mooncake_08\\npc\\uncle_qin.lua");
	end
end;

function new_year_09()
	local nMonth = tonumber(date("%m"));
	if nMonth == 2 then
	local nNpcIdx = CreateNpc("Phi YÕn tiªn tö","Phi YÕn tiªn tö", 200,1359,2859);
	SetNpcScript(nNpcIdx, "\\script\\online\\viet_event\\new_year_09\\npc\\feiyan_npc.lua");
	
	-- local nNpcIdx = CreateNpc("ThiÕu niªn3","TiÓu Söu", 200,1396,2917);
	local nNpcIdx = CreateNpc("§ång tö2","TiÓu Söu", 200,1364,2860);
	SetNpcScript(nNpcIdx, "\\script\\online\\viet_event\\new_year_09\\npc\\jester_npc.lua");
	end
end;

function AddNpcBienKinh()
	local nNpcIndex = CreateNpc("Chñ tiÖm v¶i","Chñ tiÖm N÷ phôc", 200,1409,2770);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\·þ×°µêÀÏ°å.lua");
	
	local nNpcIndex = CreateNpc("ThiÕu niªn nam2", "TÇn øc", 200, 1396, 2910);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÊÌ·îÀÏÄ¸µÄÇØÒÚ.lua");
	
	local nNpcIndex = CreateNpc("Tèng t­íng qu©n", "L©m gi¸o ®Çu",  200,1581,2844);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÁÖ½ÌÍ·.lua");
	
	local nNpcIndex = CreateNpc("Trung niªn nam", "TÇn Khiªm",  205,1645,2850);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©¸®¶«\\npc\\ÇØÇ«.lua");
	
	--local nNpcIndex = CreateNpc("Chñ cÇm ®å T©y Nam","Ng­êi b¸n ®Êu gi¸", 200,1418,2793);
	local nNpcIndex = CreateNpc("C«n L«n t©n phã ch­ëng m«n","Ng­êi b¸n ®Êu gi¸", 200,1418,2793);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÊÕ¹ºÅÄÂôÎ¯ÍÐÈË.lua");
	
	local nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Vâ L©m Minh truyÒn nh©n", 200,1396,2816);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÎäÁÖÃË´«ÈË.lua");
	
	-- local nNpcIndex = CreateNpc("C«n L«n t©n phã ch­ëng m«n", "Sø gi¶ JX2", 200, 1390, 2828);
	-- SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÐÂÊÖÍÆ¹ãÔ±.lua");

	
	local nNpcIndex = CreateNpc("Lý L·o", "H­íng dÉn t©n thñ", 200,1396,2827);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_huongdantanthu.lua");
	
	local nNpcIndex = CreateNpc("C«n L«n t©n m«n nh©n", "Tiªn tö vÐ sè", 200, 1403, 2917);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\²ÊÆ±ÏÉ×Ó.lua");
	
	local nNpcIndex = CreateNpc("Ch­ëng d­îc T©y Nam", "Chñ lß r­îu", 200, 1194,2797);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\chuloruou.lua");
	
	local nNpcIndex = CreateNpc("Ch­ëng d­îc T©y Nam", "Chñ lß r­îu",300,1701,3637);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\chuloruou.lua");
	
	local nNpcIndex = CreateNpc("Ch­ëng d­îc T©y Nam", "Chñ lß r­îu",350,1458,2929);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\chuloruou.lua");
	
	local nNpcIndex = CreateNpc("Ngù trï", "§å tÓ", 200,1297,2735);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangthit.lua");
	
	local nNpcIndex = CreateNpc("Ngù trï", "§å tÓ", 350,1454,3103);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangthit.lua");
	
	local nNpcIndex = CreateNpc("Ng­ d©n", "Chñ s¹p c¸", 200,1281,2750);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_ngudan.lua");
	
	local nNpcIndex = CreateNpc("B¸t phô siªu cÊp", "Chñ s¹p rau cñ", 200,1306,2743);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangrau.lua");
	
	local nNpcIndex = CreateNpc("Thiªn v­¬ng bang §å", "Chñ vùa g¹o", 200,1302,2741);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hanggao.lua");
	
	local nNpcIndex = CreateNpc("Xe vËn l­¬ng ", "Xe l­¬ng", 200,1299,2728);
	
	local nNpcIndex = CreateNpc("Nam nh©n t©y b¾c", "TiÒu phu", 200,1295,2754);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangcui.lua");
	
	local nNpcIndex = CreateNpc("Löa tr¹i", " ", 200,1292,2756);
	
	local nNpcIndex = CreateNpc("B¸n hµng", "G¸nh rong", 200,1303,2750);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangnguyenlieu.lua");
	
	local nNpcIndex = CreateNpc("KÐo t¬", "Chñ s¹p l¸ dong", 200,1307,2747);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangla.lua");
	
	local nNpcIndex = CreateNpc("ThiÕu niªn trong th«n", "Chñ tiÖm b¸nh kÑo", 200,1350,2814);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangkeo.lua");
	
	local nNpcIndex = CreateNpc("D©n n÷", "Chñ tiÖm gi¶i kh¸t", 200,1310,2953);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangnuoc.lua");
	
	local nNpcIndex = CreateNpc("TiÓu nhÞ trung nguyªn", "Chñ tiÖm c¬m", 200,1330,2953);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangcom.lua");
	
	local nNpcIndex = CreateNpc("TiÓu nhÞ trung nguyªn", "Chñ tiÖm c¬m", 350,1482,2913);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\npc_hangcom.lua");
	
	local nNpcIndex = CreateNpc("TiÓu nhÞ trung nguyªn", "Chñ tiÖm c¬m", 350,1392,2904);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\npc_hangcom.lua");
	
	local nNpcIndex = CreateNpc("TiÓu nhÞ trung nguyªn", "Chñ tiÖm c¬m", 350,1375,3025);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\npc_hangcom.lua");
	
	local nNpcIndex = CreateNpc("TiÓu nhÞ trung nguyªn", "Chñ tiÖm c¬m", 350,1464,3092);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\npc_hangcom.lua");
	
	local nNpcIndex = CreateNpc("TiÓu nhÞ trung nguyªn", "Chñ tiÖm c¬m", 350,1558,2942);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\npc_hangcom.lua");
	
	local nNpcIndex = CreateNpc("TiÓu nhÞ trung nguyªn", "Chñ tiÖm c¬m", 200,1510,2886);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\npc_hangcom.lua");
	
	local nNpcIndex = CreateNpc("C«n L«n t©n m«n nh©n", "V¨n phßng phÈm ®iÕm chñ", 200,1443,2850);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_vanphongpham.lua");
	
	local nNpcIndex = CreateNpc("TiÓu nhÞ trung nguyªn", "Chñ lß b¸nh", 200,1212,2800);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangbanh.lua");
	
	local nNpcIndex = CreateNpc("Phu nh©n T©y D­¬ng", "Chñ tiÖm n­íc hoa", 200,1515,2922);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangnuochoa.lua");
	
	local nNpcIndex = CreateNpc("ThiÕu niªn3", "Chñ tiÖm thiÖp mõng", 200,1327,2855);
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\npc_hangthiep.lua");
	
end;

function AddNpcDaShangRen()
	local nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn","§¹i th­¬ng nh©n", 200,1400,2800);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\202001\\npc\\npc_dashangren.lua");
	local m = 200;
	local x = 1403;
	local y = 2809;
	local tNpcs = {
		"R­¬ng tiÒn",
		"Hoa s¬n r­¬ng",
		"B¶o r­¬ng tµi nguyªn",
		"ibbaoxiang",
		"jinbaoxiang",
		"yinbaoxiang",
		"tongbaoxiang",
	}
	-- for i=1,getn(tNpcs) do
		-- local nNpcIndex = CreateNpc(tNpcs[i]," ", m,x+random(-6,6),y+random(-6,6));
		-- SetNpcScript(nNpcIndex,"\\script\\online_activites\\202001\\npc\\npc_baoxiang.lua");
	-- end
	
	CreateNpcList({
		{tNpcs[1]," ",m,x,y,"\\script\\online_activites\\202001\\npc\\npc_baoxiang.lua"},
		{tNpcs[2]," ",m,x+2,y,"\\script\\online_activites\\202001\\npc\\npc_baoxiang.lua"},
		{tNpcs[3]," ",m,x-2,y-2,"\\script\\online_activites\\202001\\npc\\npc_baoxiang.lua"},
		{tNpcs[4]," ",m,x-4,y-4,"\\script\\online_activites\\202001\\npc\\npc_baoxiang.lua"},
		{tNpcs[5]," ",m,x,y-6,"\\script\\online_activites\\202001\\npc\\npc_baoxiang.lua"},
		{tNpcs[6]," ",m,x,y-10,"\\script\\online_activites\\202001\\npc\\npc_baoxiang.lua"},
		{tNpcs[7]," ",m,x+1,y-13,"\\script\\online_activites\\202001\\npc\\npc_baoxiang.lua"},
	});
end;

function AddNpcHacBachVoThuong()
	-- B¾c m«n TuyÒn Ch©u
	local nNpcIdx = CreateNpc("H¾c V« Th­êng", "H¾c V« Th­êng", 100,1565,2816)
	SetNpcScript(nNpcIdx, "\\script\\online\\chuhunguanzhan\\heiwuchang.lua")
	nNpcIdx = CreateNpc("B¹ch V« Th­êng", "B¹ch V« Th­êng", 100,1582,2835)
	SetNpcScript(nNpcIdx, "\\script\\online\\chuhunguanzhan\\baiwuchang.lua")
	-- B¾c m«n T­¬ng D­¬ng
	nNpcIdx = CreateNpc("H¾c V« Th­êng", "H¾c V« Th­êng", 350,1555,2811)
	SetNpcScript(nNpcIdx, "\\script\\online\\chuhunguanzhan\\heiwuchang.lua")
	nNpcIdx = CreateNpc("B¹ch V« Th­êng", "B¹ch V« Th­êng", 350,1588,2825)
	SetNpcScript(nNpcIdx, "\\script\\online\\chuhunguanzhan\\baiwuchang.lua")
	-- T©y m«n Thµnh §«
	nNpcIdx = CreateNpc("H¾c V« Th­êng", "H¾c V« Th­êng", 300,1623,3429)
	SetNpcScript(nNpcIdx, "\\script\\online\\chuhunguanzhan\\heiwuchang.lua")
	nNpcIdx = CreateNpc("B¹ch V« Th­êng", "B¹ch V« Th­êng", 300,1658,3393)
	SetNpcScript(nNpcIdx, "\\script\\online\\chuhunguanzhan\\baiwuchang.lua")
end;

-- Vo lam minh
function AddCheFuWuLinMeng()
	local nNpcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu Vâ L©m Minh", 425,1741,3232);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ÎäÁÖÃË\\npc\\ÎäÁÖÃË³µ·ò.lua");
	
	nNpcIndex = CreateNpc("Xa phu","Xa phu T©y Vùc", 425,1743,3204);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ÎäÁÖÃË\\npc\\³µ·òÎ÷Óò.lua");
	nNpcIndex = CreateNpc("Tr­¬ng Tr¹ch §oan","§o¹n Hßa HuyÒn", 425,1762,3204);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ÎäÁÖÃË\\npc\\duanhexuan.lua");
	nNpcIndex = CreateNpc("H­íng VÊn Thiªn","Lý KÕ Tinh", 425,1762,3182);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ÎäÁÖÃË\\npc\\lijijing.lua");
	--nNpcIndex = CreateNpc("§µ la Ni T¨ng","C¸t Kh©m XÝch Ba", 425,1740,3176);
	nNpcIndex = CreateNpc("ThÇy luyÖn thó","C¸t Kh©m XÝch Ba", 425,1740,3176);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ÎäÁÖÃË\\npc\\tubochefu.lua");
	--nNpcIndex = CreateNpc("TrÝ §a Tinh Ng« Dông","Tr­ëng L·o B¸ch HiÓu Sinh", 425,1788,3152);
	nNpcIndex = CreateNpc("Vâ l©m minh chñ1","Tr­ëng L·o B¸ch HiÓu Sinh", 425,1788,3152);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ÎäÁÖÃË\\npc\\zhanglaobaixiaosheng.lua");
end;

function AddTrapSanGuo()

	for i = 1474, 1480 do -- Nga Mi - Ngäc Dung Phong
		AddMapTrap(303, i * 32, 3101 * 32, "\\script\\ÖÐÔ­¶þÇø\\¶ëáÒ\\trap\\¶ëáÒtoÓñÈÚ·å.lua")
	end
	
	for i = 1283, 1289 do -- D­îc V­¬ng cèc - B¾c Phông T­êng
		AddMapTrap(505, i * 32, 3151 * 32, "\\script\\Î÷±±Çø\\Ò©Íõ¹È\\trap\\Ò©Íõ¹Èto·ïÏè¸®±±real.lua")
	end

	-- for i = 1282, 1288 do -- B¾c Phông T­êng -> D­îc V­¬ng Cèc
		-- AddMapTrap(504, i * 32, 2822 * 32, "\\script\\Î÷±±Çø\\·ïÏè¸®±±\\trap\\·ïÏè¸®±±toÒ©Íõ¹È")
	-- end

	for i = 1282, 1288 do -- B¾c Phông T­êng -> Long M«n trÊn
		AddMapTrap(504, i * 32, 2822 * 32, "\\script\\Î÷±±Çø\\·ïÏè¸®±±\\trap\\·ïÏè¸®±±toÁúÃÅÕò.lua")
	end
	
	for i = 1875, 1881 do -- Long M«n trÊn - B¾c Phông T­êng
		AddMapTrap(507, i * 32, 3254 * 32, "\\script\\Î÷±±Çø\\ÁúÃÅÕò\\trap\\ÁúÃÅÕòto·ïÏè¸®±±.lua")
	end
	
	for i = 1886, 1892 do -- Long M«n trÊn - Phông T­êng
		AddMapTrap(507, i * 32, 3470 * 32, "\\script\\Î÷±±Çø\\ÁúÃÅÕò\\trap\\ÁúÃÅÕòto·ïÏè¸®.lua")
	end
	
	for i = 1794, 1800 do -- Long M«n trÊn - H­ng Kh¸nh
		AddMapTrap(507, i * 32, 3170 * 32, "\\script\\Î÷±±Çø\\ÁúÃÅÕò\\trap\\ÁúÃÅÕòtoÐËÇì.lua")
	end
	
	for i = 1562, 1568 do -- H­ng Kh¸nh - Long M«n TrÊn
		AddMapTrap(6200, i * 32, 2898 * 32, "\\script\\Èý¹úÊÆÁ¦\\ÐËÇì\\trap\\ÐËÇìtoÁúÃÅÕò.lua")
	end
	
	for i = 1536, 1542 do -- H­ng Kh¸nh - D­îc V­¬ng Cèc
		AddMapTrap(6200, i * 32, 2539 * 32, "\\script\\Èý¹úÊÆÁ¦\\ÐËÇì\\trap\\ÐËÇìtoÒ©Íõ¹È.lua")
	end
		
	-- for i = 1280, 1286 do -- D­îc V­¬ng cèc - H­ng Kh¸nh
		-- AddMapTrap(505, i * 32, 3023 * 32, "\\script\\Î÷±±Çø\\Ò©Íõ¹È\\trap\\Ò©Íõ¹ÈtoÐËÇì.lua")
	-- end
	
	for i = 1526, 1532 do -- H­ng Kh¸nh - ThÊt L¹c Nhai 2
		AddMapTrap(6200, i * 32, 3110 * 32, "\\script\\Èý¹úÊÆÁ¦\\ÐËÇì\\trap\\ÐËÇìtoÊ§ÂäÑÂ2.lua")
	end
	
	for i = 1395, 1402 do -- H­ng Kh¸nh - ThÊt L¹c Nhai 1
		AddMapTrap(6200, i * 32, 3178 * 32, "\\script\\Èý¹úÊÆÁ¦\\ÐËÇì\\trap\\ÐËÇìtoÊ§ÂäÑÂ1.lua")
	end

	---------------------------------------------------------
	
	--for i = 1796, 1802 do -- Quúnh KÕt - S­¬ng Phong Nhai
		--AddMapTrap(6100, i * 32, 3902 * 32, "\\script\\Èý¹úÊÆÁ¦\\Çí½á\\trap\\Çí½átoËª·çÑÂ.lua")
	--end
	
	for i = 1795, 1801 do -- Quúnh KÕt - S­¬ng Phong Nhai
		AddMapTrap(6100, i * 32, 3895 * 32, "\\script\\Èý¹úÊÆÁ¦\\Çí½á\\trap\\Çí½átoËª·çÑÂ.lua")
	end
	
	for i = 1690, 1696 do -- S­¬ng Phong Nhai -> Quúnh KÕt
		AddMapTrap(429, i * 32, 2834 * 32, "\\script\\Î÷ÄÏÇø\\Ëª·çÑÂ\\trap\\Ëª·çÑÂtoÇí½á.lua")
	end
	
	for i = 1907, 1913 do -- Quúnh KÕt - ThÊt l¹c Nhai
		AddMapTrap(6100, i * 32, 3264 * 32, "\\script\\Èý¹úÊÆÁ¦\\Çí½á\\trap\\Çí½átoËª·çÑÂ.lua")
	end
end;

-- c©y nªu ngµy tÕt 01-2011 T©n M·o
-- http://volam2.zing.vn/su-kien/hai-loc-dau-nam/tin-tuc/su-dung-them-2-000-mam-ngu-qua-57.html
function add_1101_tet_npc()
	nNpcIndex = CreateNpc("Hoa ®¨ng2", "C©y nªu T©n M·o", 300, 1722, 3565); -- thanh do
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_01\\activity_01\\npc\\cayneu.lua");
	nNpcIndex = CreateNpc("Hoa ®¨ng2", "C©y nªu T©n M·o", 100, 1435, 2986); -- tuyen chau
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_01\\activity_01\\npc\\cayneu.lua");
	nNpcIndex = CreateNpc("Hoa ®¨ng2", "C©y nªu T©n M·o", 200, 1350, 2876); -- bien kinh
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_01\\activity_01\\npc\\cayneu.lua");
	nNpcIndex = CreateNpc("Hoa ®¨ng2", "C©y nªu T©n M·o", 350, 1433, 2976); -- tuong duong
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_01\\activity_01\\npc\\cayneu.lua");
	nNpcIndex = CreateNpc("Hoa ®¨ng2", "C©y nªu T©n M·o", 150, 1653, 3148); -- duong chau
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_01\\activity_01\\npc\\cayneu.lua");
end;

-- Hoi hoa dang
-- http://volam2.zing.vn/su-kien/trung-thu-2011/hoi-hoa-dang-116.html#nav
function Add_1108_npc()
	local nDate = tonumber(date("%m%d"));
	local nNpcIndex = 0;
	if nDate >= 0201 and nDate < 0301 then
		nNpcIndex = CreateNpc("Hoa ®¨ng3", "Cét treo ®Ìn", 300, 1757, 3555); -- thanh do
		SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_08\\activity_03\\lamp_npc_script.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng3", "Cét treo ®Ìn", 100, 1408, 2987); -- tuyen chau
		SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_08\\activity_03\\lamp_npc_script.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng3", "Cét treo ®Ìn", 200, 1362, 2887); -- bien kinh
		SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_08\\activity_03\\lamp_npc_script.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng3", "Cét treo ®Ìn", 350, 1427, 3000); -- tuong duong
		SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_08\\activity_03\\lamp_npc_script.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng3", "Cét treo ®Ìn", 150, 1678, 3151); -- duong chau
		SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_08\\activity_03\\lamp_npc_script.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng3", "Cét treo ®Ìn", 400, 1544, 2969); -- dai ly
		SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_08\\activity_03\\lamp_npc_script.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng3", "Cét treo ®Ìn", 500, 1739, 3148); -- phuong tuong
		SetNpcScript(nNpcIndex, "\\script\\online_activites\\2011_08\\activity_03\\lamp_npc_script.lua");
	end
end;

-- Hoa dang tet 1002
-- http://volam2.zing.vn/tin-tuc/su-kien/khai-hoi-tan-xuan-tai-loc.html
function Add_1002_npc()
	local nDate = tonumber(date("%m%d"));
	local nNpcIndex = 0;
	if nDate >= 0201 and nDate < 0301 then
		nNpcIndex = CreateNpc("Hoa ®¨ng1", "Hoa ®¨ng TÕt Canh DÇn", 300, 1742, 3573); -- thanh do
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\201002\\1\\npc_hoadang_1.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng1", "Hoa ®¨ng TÕt Canh DÇn", 100, 1422, 3000); -- tuyen chau
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\201002\\1\\npc_hoadang_2.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng1", "Hoa ®¨ng TÕt Canh DÇn", 200, 1375, 2873); -- bien kinh
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\201002\\1\\npc_hoadang_3.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng1", "Hoa ®¨ng TÕt Canh DÇn", 350, 1441, 2984); -- tuong duong 1441 2984
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\201002\\1\\npc_hoadang_1.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng1", "Hoa ®¨ng TÕt Canh DÇn", 150, 1665, 3137); -- duong chau
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\201002\\1\\npc_hoadang_2.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng1", "Hoa ®¨ng TÕt Canh DÇn", 400, 1535, 2959); -- dai ly
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\201002\\1\\npc_hoadang_3.lua");
		nNpcIndex = CreateNpc("Hoa ®¨ng1", "Hoa ®¨ng TÕt Canh DÇn", 500, 1747, 3157); -- phuong tuong
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\201002\\1\\npc_hoadang_1.lua");
	end
end;

--ÐÞ¸Ä£º1¡¢´å³¤20070123ÐÞ¸Ä±¾½Å±¾£¬Ôö¼Ó»ªÉ½¾º¼¼Ïà¹ØÄÚÈÝ
function AddFuShen()
	local nDate = tonumber(date("%m%d"));
	local nNpcIndex = 0;
	if nDate >= 0123 and nDate < 0222 then
		nNpcIndex = CreateNpc("NguyÖt L·o", "Phóc thÇn", 200, 1429, 2881);
		SetNpcScript(nNpcIndex, "\\script\\online\\´º½Ú»î¶¯\\ãê¾©¸£Éñ.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "Phóc thÇn", 300, 1697, 3542);
		SetNpcScript(nNpcIndex, "\\script\\online\\´º½Ú»î¶¯\\³É¶¼¸£Éñ.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "Phóc thÇn", 100, 1461, 2967);
		SetNpcScript(nNpcIndex, "\\script\\online\\´º½Ú»î¶¯\\ÈªÖÝ¸£Éñ.lua");
	end
end;

function new_year_2006_npc()
	local nNpcIndex = 0;
	-- local nDate = tonumber(date("%m%d"));
	-- if nDate >= 0123 and nDate < 0222 then
		nNpcIndex = CreateNpc("TiÓu nhÞ T©y Nam", "Chñ tiÖm sñi c¶o", 200,1273,2833);
		SetNpcScript(nNpcIndex, "\\script\\online\\´º½Ú»î¶¯\\ãê¾©½È×ÓÂ¥ÀÏ°å.lua");
		nNpcIndex = CreateNpc("TiÓu nhÞ T©y Nam", "Chñ tiÖm sñi c¶o", 300,1760,3420);
		SetNpcScript(nNpcIndex, "\\script\\online\\´º½Ú»î¶¯\\³É¶¼½È×ÓÂ¥ÀÏ°å.lua");
		nNpcIndex = CreateNpc("TiÓu nhÞ T©y Nam", "Chñ tiÖm sñi c¶o", 100,1491,3144);
		SetNpcScript(nNpcIndex, "\\script\\online\\´º½Ú»î¶¯\\ÈªÖÝ½È×ÓÂ¥ÀÏ°å.lua");
	-- end
end;

function ApplyRelayInitData()
	GetBattleData(0,7)			-- È¡Õ½³¡ÐÅÏ¢
	ApplyCityWarData(0,0)			-- È¡¹¥³ÇÕ½ÐÅÏ¢
	ApplyCityWarData(1,0)			-- È¡¹¥³ÇÕ½ÐÅÏ¢
	ApplyBWRankInfo()
end

tbGAME_SIGNMAP = {806, 808} --¼ÇÂ¼¸÷µÈ¼¶±¨ÃûµãµÄµØÍ¼IDºÅ £¬µÈ¼¶°´µÍ¼¶Ïò¸ß¼¶ÅÅ²¼
function addnpc_yanmenbattle_signup()
	for i = 1, getn(tbGAME_SIGNMAP) do
		CreatBattleSignNpc(tbGAME_SIGNMAP[i])
	end
	local npcindex7 = CreateNpc("Xa phu Trung Nguyªn", "Xa phu phe Tèng", 806, 1754,3040)
	SetNpcScript(npcindex7, "\\script\\global\\ÌØÊâÓÃµØ\\ËÎÁÉ±¨Ãûµã\\npc\\song_transport.lua")

	local npcindex8 = CreateNpc("Xa phu", "Xa phu phe Liªu", 806, 1639,3200)
	SetNpcScript(npcindex8, "\\script\\global\\ÌØÊâÓÃµØ\\ËÎÁÉ±¨Ãûµã\\npc\\jin_transport.lua")
end

function CreatBattleSignNpc( mapid )
	if( SubWorldID2Idx( mapid ) >= 0 ) then	--³õ¼¶
		local npcindex1 = CreateNpc("VÖ binh thµnh m«n", "Mé Binh Quan phe Tèng", mapid, 1728, 3083)
		local npcindex2 = CreateNpc("Nam nh©n ph­¬ng B¾c3", "Mé Binh Quan phe Liªu", mapid, 1652,3174)
		if mapid == 806 then
			SetNpcScript(npcindex1, "\\script\\newbattles\\song_primary_npc.lua")
			SetNpcScript(npcindex2, "\\script\\newbattles\\liao_primary_npc.lua")
		else
			SetNpcScript(npcindex1, "\\script\\battles\\battlejoin1.lua")
			SetNpcScript(npcindex2, "\\script\\battles\\battlejoin2.lua")
		end;

		local npcindex3 = CreateNpc("Quan sø-trung niªn1", "Tèng Nhu quan", mapid, 1728,3065)
		SetNpcScript(npcindex3, "\\script\\global\\ÌØÊâÓÃµØ\\ËÎÁÉ±¨Ãûµã\\npc\\song_shop.lua")

		local npcindex4 = CreateNpc("Nam nh©n ph­¬ng B¾c2", "Liªu Nhu quan", mapid, 1634,3175)
		SetNpcScript(npcindex4, "\\script\\global\\ÌØÊâÓÃµØ\\ËÎÁÉ±¨Ãûµã\\npc\\jin_shop.lua")
		------------------

		local npcindex7 = CreateNpc("Xa phu Trung Nguyªn", "Xa phu phe Tèng", mapid, 1754,3040)
		SetNpcScript(npcindex7, "\\script\\global\\ÌØÊâÓÃµØ\\ËÎÁÉ±¨Ãûµã\\npc\\song_transport.lua")

		local npcindex8 = CreateNpc("Xa phu", "Xa phu phe Liªu", mapid, 1639,3200)
		SetNpcScript(npcindex8, "\\script\\global\\ÌØÊâÓÃµØ\\ËÎÁÉ±¨Ãûµã\\npc\\jin_transport.lua")

	end
end

function AddNpcCd()
    local nNpcIndexGbdz = CreateNpc("C¸i Bang m«n nh©n", "§Ö tö C¸i Bang", 209,1701,3111);
    SetNpcScript(nNpcIndexGbdz, "\\script\\ÖÐÔ­Ò»Çø\\Ø¤°ï\\npc\\Ø¤°ïµÜ×Ó.lua");
	
	-- B¸n b¸nh bao
	local nNpcIdx = CreateNpc("N÷ thiÕu niªn1", "§«ng muéi", 300,1877,3459);
	SetNpcScript(nNpcIdx,"\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\Âô°ü×ÓµÄ¶¬ÃÃ.lua");
	-- B¸n tr¸i c©y
	local nNpcIdx = CreateNpc("ThiÕu niªn trong th«n", "HØ ®Ö", 300,1731,3670);
	SetNpcScript(nNpcIdx,"\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\ÂôË®¹ûµÄÏ²æ·.lua");
	-- Cao thñ Èn c­
	local nNpcIdx = CreateNpc("Qu¶n Gia", "Môc D­¬ng", 300,1585,3577);
	SetNpcScript(nNpcIdx,"\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\Òþ¾ÓµÄ¸ßÊÖÄ¾Ò×.lua");
	-- §å tÓ
	local nNpcIdx = CreateNpc("Ngù trï", "TrÞnh §å tÓ", 300,1859,3401);
	SetNpcScript(nNpcIdx,"\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\Ö£ÍÀ»§µÄÖíÈâÆÌ.lua");
	-- Phô n÷ t×m con g¸i
	local nNpcIdx = CreateNpc("Th«n phô2", "Tr­¬ng §¹i ThÈm", 300,1823,3433);
	SetNpcScript(nNpcIdx,"\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\ÕÒ¶ù×ÓµÄÕÅ´óÉô.lua");
	-- §øa bÐ tham ¨n
	local nNpcIdx = CreateNpc("datouwawa", "ThuËn Oa", 300,1882,3454);
	SetNpcScript(nNpcIdx,"\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\Ì°³ÔµÄË³ÍÞ.lua");
	
	local nNpcIdx = CreateNpc("§ång tö2", "L¨ng Nhi", 304,1487,3198);
	SetNpcScript(nNpcIdx,"\\script\\ÖÐÔ­¶þÇø\\³É¶¼¸®ÄÏ\\npc\\Áè¶ù.lua");
	
	
end;

function AddNpcXy()
    local nNpcIndexDyx_1 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1382, 3186);
    local nNpcIndexDyx_2 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1299, 3193);
    local nNpcIndexDyx_3 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1358, 3016);
    local nNpcIndexDyx_4 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1426, 2916);

    local nNpcIndexDyx_5 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1143, 2931);
    local nNpcIndexDyx_6 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1219, 2910);
    local nNpcIndexDyx_7 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1271, 2974);
    local nNpcIndexDyx_8 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1222, 2985);
    local nNpcIndexDyx_9 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1116, 3020);
    local nNpcIndexDyx_10 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1269, 3092);
    local nNpcIndexDyx_11 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1236, 3147);
    local nNpcIndexDyx_12 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1356, 3149);
    local nNpcIndexDyx_13 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1352, 3087);
    local nNpcIndexDyx_14 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1307, 3079);
    local nNpcIndexDyx_15 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1404, 2968);
    local nNpcIndexDyx_16 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1326, 2949);
    local nNpcIndexDyx_17 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1386, 2926);
    local nNpcIndexDyx_18 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1428, 2966);
    local nNpcIndexDyx_19 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1501, 2915);
    local nNpcIndexDyx_20 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1525, 2935);
    local nNpcIndexDyx_21 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1573, 2979);
    local nNpcIndexDyx_22 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1552, 3028);
    local nNpcIndexDyx_23 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1539, 3110);
    local nNpcIndexDyx_24 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1571, 3166);
    local nNpcIndexDyx_25 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1540, 3198);
    local nNpcIndexDyx_26 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1501, 3174);
	local nNpcIndexJwyh = CreateNpc("Ng©n Hå", "Ng©n Hå", 324, 1822, 3005);
	SetNpcScript(nNpcIndexJwyh, "\\script\\ÖÐÔ­¶þÇø\\ÆßÐÇ¶´Ò»²ã\\npc\\¾ÅÎ²Òøºü.lua");

	local nNpcIndexYlby = CreateNpc("§Çu lÜnh S¬n tÆc", "§Çu lÜnh S¬n tÆc", 322, 1491, 3323);
    SetNpcScript(nNpcIndexYlby, "\\script\\ÖÐÔ­¶þÇø\\Áú»¢¶´Ò»²ã\\npc\\·üÅ£É½´óÍõ.lua");
	local nNpcIndexZh1 = CreateNpc("Ph¸p S­ T©y H¹", "Ph¸p S­ T©y H¹", 311, 1352, 3117);
    SetNpcScript(nNpcIndexZh1, "\\script\\ÖÐÔ­¶þÇø\\·üÅ£É½\\npc\\Î÷ÏÄÖäÊ¦.lua");

	local nNpcIndexZh2 = CreateNpc("Ph¸p S­ T©y H¹", "Ph¸p S­ T©y H¹", 311, 1439, 3144);
    SetNpcScript(nNpcIndexZh2, "\\script\\ÖÐÔ­¶þÇø\\·üÅ£É½\\npc\\Î÷ÏÄÖäÊ¦.lua");

	local nNpcIndexZh3 = CreateNpc("Ph¸p S­ T©y H¹", "Ph¸p S­ T©y H¹", 311, 1442, 3033);
    SetNpcScript(nNpcIndexZh3, "\\script\\ÖÐÔ­¶þÇø\\·üÅ£É½\\npc\\Î÷ÏÄÖäÊ¦.lua");
end;

function AddNpcYz()
    local nNpcIndexLs = CreateNpc("x¸c L«i Th¾ng", "Thi thÓ cña L«i Th¾ng", 111, 1849, 2887);
    SetNpcScript(nNpcIndexLs, "\\script\\½­ÄÏÇø\\ÇåÏª¶´\\npc\\À×Ê¤µÄÊ¬Ìå.lua");

    local nNpcIndexLshw1 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ hé vÖ cña L«i Th¾ng", 111, 1854, 2887);
    local nNpcIndexLshw2 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ hé vÖ cña L«i Th¾ng", 111, 1847, 2889);
    local nNpcIndexLshw3 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ hé vÖ cña L«i Th¾ng", 111, 1851, 2877);

    local nNpcIndexZbh = CreateNpc("Du Ph­¬ng ®¹i phu", "Tr­¬ng B¸ H¸n", 150, 1711, 3115);
    SetNpcScript(nNpcIndexZbh, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\ÕÅ²®ºº.lua");

    local nNpcIndexBg = CreateNpc("Tói r¸nh", "Tói tÇm th­êng", 107, 1573, 2939);

    local nNpcIndexTn = CreateNpc("HiÖp n÷", "§­êng Ninh", 107,1417,2946);
    SetNpcScript(nNpcIndexTn, "\\script\\½­ÄÏÇø\\ÎäÒÄÉ½\\npc\\ÌÆÄþ.lua");

    local nNpcIndexLjy = CreateNpc("Du Ph­¬ng T­íng SÜ","Lý TiÕn Dòng",150,1767,3111);
    SetNpcScript(nNpcIndexLjy, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\Àî½øÓÂ.lua");

		local nNpcIndexLxq = CreateNpc("V©n Du §¹o Nh©n","L­u HuyÒn Thanh",150,1579,3110);
    SetNpcScript(nNpcIndexLxq, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\ÁõÐþÇå.lua");

    local nNpcIndexQr = CreateNpc("Bµ chñ", "Thu Dung", 150,1678,3028);
    SetNpcScript(nNpcIndexQr, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\ÇïÈØ.lua");

    local nNpcIndexHql = CreateNpc("Th­îng Cæ Háa Kú L©n", "Th­îng Cæ Háa Kú L©n", 113, 1669, 3225);
    SetNpcScript(nNpcIndexHql, "\\script\\½­ÄÏÇø\\Á½Ë®¶´¶þ²ã\\npc\\»ð÷è÷ë.lua");

    local nNpcIndexThj = CreateNpc("x¸c L«i Th¾ng", "Thi thÓ Th¸i Hång TuyÖt", 113, 1668, 3230);
    local nNpcIndexJt01 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ Xi Háa gi¸o ®å", 113, 1669, 3231);
    local nNpcIndexJt02 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ Xi Háa gi¸o ®å", 113, 1664, 3225);
    local nNpcIndexJt03 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ Xi Háa gi¸o ®å", 113, 1670, 3224);
    local nNpcIndexJt04 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ Xi Háa gi¸o ®å", 113, 1661, 3231);

    local nNpcIndexJw = CreateNpc("ThiÕu niªn nam1", "T­ëng Duy", 150, 1679, 3237);
   SetNpcScript(nNpcIndexJw, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\½¯Î¬.lua");

    local nNpcIndexWyq = CreateNpc("Tè Hoµn Ch©n", "ViÔn Tinh", 108, 1585, 3195);
    SetNpcScript(nNpcIndexWyq, "\\script\\½­ÄÏÇø\\ÈªÖÝ¸®±±\\npc\\ÚùÔ¶Çç.lua");

    local nNpcIndexYg = CreateNpc("Ng­ Qu¸i §Çu Môc", "Ng­ Qu¸i §Çu Môc", 103, 1673, 3431);
    SetNpcScript(nNpcIndexYg, "\\script\\½­ÄÏÇø\\¶«º£º£±õÒ»\\npc\\Óã¹ÖÍ·Ä¿.lua");
end;

function AddNpcWeekEnd()
    local nNpcIndexZzd = CreateNpc("Tèng T­íng Qu©n", "§¹i sø ho¹t ®éng cuèi tuÇn", 200, 1380, 2872);
    SetNpcScript(nNpcIndexZzd, "\\script\\task\\WeekEnd\\Õç×Óµ¤.lua");

    local npcXyZzd = CreateNpc("Tèng T­íng Qu©n", "§¹i sø ho¹t ®éng cuèi tuÇn", 350, 1452, 2967);
    SetNpcScript(npcXyZzd, "\\script\\task\\WeekEnd\\Õç×Óµ¤.lua");

    local npcXyBm1 = CreateNpc("VÖ binh thµnh m«n", "ChØ huy sø", 350, 1503, 3024);
    SetNpcScript(npcXyBm1, "\\script\\task\\WeekEnd\\±øÂíÖ¸»ÓÊ¹.lua");

    local npcYzZzd = CreateNpc("Tèng T­íng Qu©n", "§¹i sø ho¹t ®éng cuèi tuÇn", 150, 1714, 3137);
    SetNpcScript(npcYzZzd, "\\script\\task\\WeekEnd\\Õç×Óµ¤.lua");

   	local npcYzBm1 = CreateNpc("VÖ binh thµnh m«n", "ChØ huy sø", 150, 1682, 3161);
    SetNpcScript(npcYzBm1, "\\script\\task\\WeekEnd\\±øÂíÖ¸»ÓÊ¹.lua");

    local nNpcIndexBm = CreateNpc("VÖ binh thµnh m«n", "ChØ huy sø", 100, 1423, 2985);
    SetNpcScript(nNpcIndexBm, "\\script\\task\\WeekEnd\\±øÂíÖ¸»ÓÊ¹.lua");

    --ÙÁ¿ÜµØÍ¼µÄ³õÊ¼»¯NPC
    local npc1 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 951, 1333, 2844);
    SetNpcScript(npc1, "\\script\\task\\WeekEnd\\man_killwk.lua");
    local npc2 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 952, 1333, 2844);
    SetNpcScript(npc2, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc3 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 953, 1333, 2844);
    SetNpcScript(npc3, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc4 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 954, 1333, 2844);
    SetNpcScript(npc4, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc5 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 955, 1333, 2844);
    SetNpcScript(npc5, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc6 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 956, 1333, 2844);
    SetNpcScript(npc6, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc7 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 957, 1333, 2844);
    SetNpcScript(npc7, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc8 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 958, 1333, 2844);
    SetNpcScript(npc8, "\\script\\task\\WeekEnd\\man_killwk.lua");
 	local npc9 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 959, 1333, 2844);
    SetNpcScript(npc9, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc10 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 960, 1333, 2844);
    SetNpcScript(npc10, "\\script\\task\\WeekEnd\\man_killwk.lua");

	local liguan1 = CreateNpc("Tö Thanh Th­îng Nh©n", "LÔ quan", 100, 1512, 2990);
	SetNpcScript(liguan1, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\´óÄÚ×Ü¹Ü.lua");

	local liguan2 = CreateNpc("Tö Thanh Th­îng Nh©n", "LÔ quan", 300, 1787, 3497);
	SetNpcScript(liguan2, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\´óÄÚ×Ü¹Ü.lua")
    --AddWk(15, 10);
end;

function AddNpcXl()
    local nNpcIndexSl = CreateNpc("ThiÕu L©m T¨ng Nh©n","Qu¸ ¶i hé tèng nh©n",814,1626,3149);  --ÐÞÁ¶µØÍ¼µÄÉÙÁÖ´«ËÍÈË
    SetNpcScript(nNpcIndexSl, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");

    local nNpcIndexWd = CreateNpc("Vâ §ang  m«n nh©n","Qu¸ ¶i hé tèng nh©n",812,1622,3093);  --ÐÞÁ¶µØÍ¼µÄÎäµ±´«ËÍÈË
    SetNpcScript(nNpcIndexWd, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");

    local nNpcIndexEm = CreateNpc("Nga My m«n nh©n","Qu¸ ¶i hé tèng nh©n",816,1626,3149);  --ÐÞÁ¶µØÍ¼µÄ¶ëáÒ´«ËÍÈË
    SetNpcScript(nNpcIndexEm, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");

    local nNpcIndexGb = CreateNpc("C¸i Bang m«n nh©n","Qu¸ ¶i hé tèng nh©n",815,1373,3118);  --ÐÞÁ¶µØÍ¼µÄØ¤°ï´«ËÍÈË
    SetNpcScript(nNpcIndexGb, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");

    local nNpcIndexTm = CreateNpc("§­êng M«n T©n m«n nh©n","Qu¸ ¶i hé tèng nh©n",813,1677,2983);  --ÐÞÁ¶µØÍ¼µÄÌÆÃÅ´«ËÍÈË
    SetNpcScript(nNpcIndexTm, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");

		local nNpcIndexYm = CreateNpc("VÖ binh thµnh m«n", "Qu¸ ¶i hé tèng nh©n", 817,1457,2972);	--ÐÞÁ¶µØÍ¼µÄÑîÃÅ´«ËÍÈË
    SetNpcScript(nNpcIndexYm, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");

    local nNpcIndexWp = CreateNpc("Ngò §éc hé ph¸p", "Qu¸ ¶i hé tèng nh©n", 422,1628,3508);	--ÐÞÁ¶µØÍ¼Îå¶¾´«ËÍÈË
    SetNpcScript(nNpcIndexWp, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");

end;

function AddNpcQz()
	
	local nNpcIndexMjdz = CreateNpc("§Ö tö Minh Gi¸o", "§Ö tö Minh Gi¸o",105,1399,3140);
	SetNpcScript(nNpcIndexMjdz, "\\script\\½­ÄÏÇø\\ÈªÖÝ¸®Î÷\\npc\\mingjiaodizi.lua");

    local nNpcIndexLfs = CreateNpc("ThiÕu niªn trong th«n", "Lý Phong Thu", 100, 1607, 2970);
    SetNpcScript(nNpcIndexLfs, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\ÊÕ¸ûÑ§Ï°.lua");

    local nNpcIndexLys = CreateNpc("Du Ph­¬ng ®¹i phu", "L©m D­îc S­", 100, 1558, 2958);
    SetNpcScript(nNpcIndexLys, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\²ÉÒ©Ñ§Ï°.lua");
	
	local nNpcIndexYzzc = CreateNpc("TiÓu nhÞ Trung Nguyªn", "Chñ dÞch tr¹m", 100,1472,2860);
    SetNpcScript(nNpcIndexYzzc, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\yizhanzhuchiren.lua");
	
	local nNpcIndexYzzc = CreateNpc("TiÓu nhÞ Trung Nguyªn", "Chñ dÞch tr¹m", 803,1624,3175);
    SetNpcScript(nNpcIndexYzzc, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\yizhanzhuchiren.lua");
	
	local nNpcIndexSqsr = CreateNpc("Chñ tiÖm v¶i T©y Nam", "Th­¬ng nh©n tr¸i c©y", 100, 1445, 2979);
    SetNpcScript(nNpcIndexSqsr, "\\script\\online\\fruit_event_08_viet\\fruit_npc.lua");
	
	local nNpcIndexMyc = CreateNpc("ThiÕu niªn3", "M¹nh H÷u Tµi", 100,1441,3040);
    SetNpcScript(nNpcIndexMyc, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\ÃÏÓÐ²Å.lua");
	
	local nNpcIndexLyt = CreateNpc("Thanh niªn nam", "L©m ViÔn §å", 100,1608,3014);
    SetNpcScript(nNpcIndexLyt, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\ÁÖÔ¶Í¼.lua");
	
	local nNpcIndexCc = CreateNpc("N÷ thiÕu niªn1", "Së Së",  100,1641,3007);
    SetNpcScript(nNpcIndexCc, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\³þ³þ.lua");
	
	local nNpcIndexMkbl = CreateNpc("T©y Nam Miªu nh©n", "Ma Kha Ba La", 100,1504,2959);
    SetNpcScript(nNpcIndexMkbl, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\Âí¿É²¨ÂÞ.lua");
	
	local nNpcIndexMkbl = CreateNpc("Vâ §ang  m«n nh©n", "HÇu Tr­êng Sinh", 100,1460,2967);
    SetNpcScript(nNpcIndexMkbl, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\ºò³¤Éú.lua");
	
	local nNpcIndexMkbl = CreateNpc("Thî rÌn Trung Nguyªn", "Thî rÌn", 100,1377,3009);
    SetNpcScript(nNpcIndexMkbl, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\Ìú½³ÆÌÀÏ°å.lua");
end;
function AddXsTg()
    local nNpcIndexCd = CreateNpc("B¸n s¸ch", "Sø gi¶", 300, 1638, 3575);
    SetNpcScript(nNpcIndexCd, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\ÐÂÊÖÍÆ¹ãÔ±.lua");

    local nNpcIndexQz = CreateNpc("B¸n s¸ch", "Sø gi¶", 100, 1451, 2821);
    SetNpcScript(nNpcIndexQz, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\ÐÂÊÖÍÆ¹ãÔ±.lua");

    local nNpcIndexBj = CreateNpc("B¸n s¸ch", "Sø gi¶", 200, 1159, 2839);
    SetNpcScript(nNpcIndexBj, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÐÂÊÖÍÆ¹ãÔ±.lua");

end;
function AddTl()
    local nNpcIndex = CreateNpc("Nha dÞch", " Ngôc tèt", 701, 1376, 3143);
    SetNpcScript(nNpcIndex, "\\script\\task\\prison\\jailer_npc.lua");
 	nNpcIndex = CreateNpc("Nha dÞch", "Bé kho¸i", 200, 1397, 2653);
    SetNpcScript(nNpcIndex, "\\script\\task\\prison\\gaoler_npc.lua");
end;

function AddWk(nDistanceX, nDistanceY)
    rect_table = {
        {1294, 2854, 1501, 3119},
        {1294, 3119, 1482, 3169},
        {1508, 2973, 1534, 3034},
        {1534, 2842, 1578, 2894},
        {1554, 2901, 1580, 2908},
        {1519, 2913, 1538, 2926}
    };
    local sp = {   --Ã¿µØÍ¼µÄ¿ªÊ¼×ø±ê£¬µØÍ¼ID£¬NPCÄ£°åÃû×Ö
        {1294, 2854, 907, "Oa KhÊu"},
        {1294, 2854, 908, "Oa KhÊu Binh sÜ"},
        {1294, 2854, 909, "Oa KhÊu Thñy Binh"},
        {1294, 2854, 910, "Oa KhÊu Lôc Binh"},
        {1294, 2854, 911, "Oa KhÊu Vâ SÜ"}
    };
    for index, v in sp do
        local nCount = getn(rect_table);
        for i = 1, nCount do
            for nX = rect_table[i][1], rect_table[i][3], nDistanceX do
                for nY = rect_table[i][2], rect_table[i][4], nDistanceY do
                    CreateNpc(v[4], v[4], v[3], nX, nY);
                end;
            end;
        end;
    end;

end;
function Addsh()
    local nNpcIndexshxjqz = CreateNpc("G¸nh hµng", "Hµnh C­íc Th­¬ng Nh©n", 100, 1462, 2922);
    SetNpcScript(nNpcIndexshxjqz, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÐÐ½ÅÉÌÈË.lua");

    local nNpcIndexshxjyz = CreateNpc("G¸nh hµng", "Hµnh C­íc Th­¬ng Nh©n", 150, 1698, 3203);
    SetNpcScript(nNpcIndexshxjyz, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÐÐ½ÅÉÌÈË.lua");

    local nNpcIndexshxy = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Chñ th­¬ng héi", 350, 1456, 2925);
    SetNpcScript(nNpcIndexshxy, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÉÌ»áÀÏ°å.lua");

    local nNpcIndexshyz = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Chñ th­¬ng héi", 150, 1636, 3139);
    SetNpcScript(nNpcIndexshyz, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÉÌ»áÀÏ°å.lua");

    local nNpcIndexsmsr = CreateNpc("L·o phó hé", "Th­¬ng Nh©n thÇn bÝ", 200, 1488, 2826);
    SetNpcScript(nNpcIndexsmsr, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÉñÃØÉÌÈË.lua");
end;

function Addtj()
    local nNpcIndextjqz = CreateNpc("Nha dÞch", "Bé ®Çu", 100, 1518, 2988);
    SetNpcScript(nNpcIndextjqz, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\²¶Í·.lua");

    local nNpcIndextjyz = CreateNpc("Nha dÞch", "Bé ®Çu", 150, 1739, 3158);
    SetNpcScript(nNpcIndextjyz, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\²¶Í·.lua");

    local nNpcIndextjxy = CreateNpc("Nha dÞch", "Bé ®Çu", 350, 1507, 2997);
    SetNpcScript(nNpcIndextjxy, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\²¶Í·.lua");

    local nNpcIndextjztx = CreateNpc("Cô giµ", "Tr¸c Thiªn Hµnh", 350, 1427, 3024);
    SetNpcScript(nNpcIndextjztx, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\×¿ÌìÐÐ.lua");
	
	local nNpcIndexSCTD = CreateNpc("Ng­ d©n", "Chñ s¹p c¸", 350, 1363, 2873);
    SetNpcScript(nNpcIndexSCTD, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\npc_chusapca.lua");
end;

function Addgudao()
    local nNpcIndextaohuadao1 = CreateNpc("Xa phu Trung Nguyªn", "ThuyÒn phu C« §¶o", 100,1274,3121);
    SetNpcScript(nNpcIndextaohuadao1, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\´¬·ò.lua");
end;

function Addtaohuadao()
    local nNpcIndextaohuadao1 = CreateNpc("Xa phu Trung Nguyªn", "ThuyÒn phu H¶i T©n", 104,1568,2975);
    SetNpcScript(nNpcIndextaohuadao1, "\\script\\½­ÄÏÇø\\¶«º£º£±õ¶þ\\npc\\¶«º£º£±õ2´¬·ò.lua");

    local nNpcIndextaohuadao2 = CreateNpc("Xa phu Trung Nguyªn", "ThuyÒn Phu §µo Hoa ®¶o", 102,1459,3163);
    SetNpcScript(nNpcIndextaohuadao2, "\\script\\½­ÄÏÇø\\ÌÒ»¨µº\\npc\\ÌÒ»¨µº´¬·ò.lua");
end;


function Addcangjian()
    local nNpcIndexcangjian1 = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", 300,1776,3703);
    SetNpcScript(nNpcIndexcangjian1, "\\script\\²Ø½£É½×¯\\task_script\\³É¶¼\\²Ø½£Ê¹Õß.lua");

    local nNpcIndexcangjian2 = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", 200,1229,2762);
    SetNpcScript(nNpcIndexcangjian2, "\\script\\²Ø½£É½×¯\\task_script\\ãê¾©\\²Ø½£Ê¹Õß.lua");

    local nNpcIndexcangjian3 = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", 100,1510,3106);
    SetNpcScript(nNpcIndexcangjian3, "\\script\\²Ø½£É½×¯\\task_script\\ÈªÖÝ\\²Ø½£Ê¹Õß.lua");

    local nNpcIndexcangjian4 = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", 350,1395,2851);
    SetNpcScript(nNpcIndexcangjian4, "\\script\\²Ø½£É½×¯\\task_script\\ÏåÑô\\²Ø½£Ê¹Õß.lua");

    local nNpcIndexcangjian5 = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", 150,1745,3119);
    SetNpcScript(nNpcIndexcangjian5, "\\script\\²Ø½£É½×¯\\task_script\\ÑïÖÝ\\²Ø½£Ê¹Õß.lua");

end;


function Addyangmen()
    local nNpcIndexyangmen1 = CreateNpc("D­¬ng Diªn Chiªu", "D­¬ng Diªn Chiªu", 219,1543,2939);
    SetNpcScript(nNpcIndexyangmen1, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\ÑîÑÓÕÑ.lua");

    local nNpcIndexyangmen2 = CreateNpc("D­¬ng Bµi Phong", "D­¬ng Bµi Phong", 219,1454,3107);
    SetNpcScript(nNpcIndexyangmen2, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\ÑîÅÅ·ç.lua");

    local nNpcIndexyangmen3 = CreateNpc("D­¬ng T«n B¶o", "D­¬ng T«n B¶o", 219,1559,3084);
    SetNpcScript(nNpcIndexyangmen3, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\Ñî×Ú±£.lua");

    local nNpcIndexyangmen4 = CreateNpc("Méc QuÕ Anh", "Méc QuÕ Anh", 219,1481,3184);
    SetNpcScript(nNpcIndexyangmen4, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\ÄÂ¹ðÓ¢.lua");

    local nNpcIndexyangmen5 = CreateNpc("Qu¶n gia", "D­¬ng Hång", 219,1634,3278);
    SetNpcScript(nNpcIndexyangmen5, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\Ñîºé.lua");

    local nNpcIndexyangmen6 = CreateNpc("Xa Th¸i Qu©n", "Xa Th¸i Qu©n", 219,1529,3137);
    SetNpcScript(nNpcIndexyangmen6, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\ÙÜÌ«¾ý.lua");

    local nNpcIndexyangmen7 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 219,1599,3140);
    SetNpcScript(nNpcIndexyangmen7, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\ÖÐÔ­´¢Îï¹ñ.lua");

end;

function AddChristmas()
	local nMonth = tonumber(date("%m"));

	local nDate = tonumber(date("%d"));
	local nSelect = mod(30,nDate);
	
	-- TUYEN CHAU
	local nNpcIndexWilson = CreateNpc("TruyÒn gi¸o sÜ","Uy NhÜ Tèn",100,1308,2930);	--ÈªÖÝ
	SetNpcScript(nNpcIndexWilson,"\\script\\online\\Ê¥µ®½Ú»î¶¯\\Íþ¶ûÑ·.lua");
	
	-- BIEN KINH
	local tBKScripts = {
		"\\script\\online\\zgc_npc_dialog.lua",
		"\\script\\online_activites\\2011_11\\activity_02\\missionaries_npc.lua",
		"\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\Î÷Ñó´«½ÌÊ¿.lua",
		"\\script\\online\\Ê¥µ®½Ú»î¶¯\\ãê¾©Î÷Ñó´«½ÌÊ¿.lua"
	}
	
	nSelect = random(getn(tBKScripts));
	local nNpcIndexchurchman1 = CreateNpc("TruyÒn gi¸o sÜ","Gi¸o sÜ",200,1333,2811);	
	SetNpcScript(nNpcIndexchurchman1,tBKScripts[nSelect]);
	
	-- THANH DO
	local nNpcIndexchurchman2 = CreateNpc("TruyÒn gi¸o sÜ","Gi¸o sÜ",300,1707,3546);
	SetNpcScript(nNpcIndexchurchman2, "\\script\\online\\Ê¥µ®½Ú»î¶¯\\³É¶¼Î÷Ñó´«½ÌÊ¿.lua");
	
	
	-- LASA
	local tLasaScripts = {
		"\\script\\online\\viet_event\\binhchon_sangtac\\head.lua",
		"\\script\\online_activites\\2011_12\\qingrenjie\\sale_chocolate.lua",
		"\\script\\online_activites\\201202\\zengsongpifeng\\send_pifeng.lua",
		"\\script\\vng\\lasa\\la_sa.lua",
		"\\script\\online\\viet_event\\DuaTopBangHoiLienServer\\DuaTop.lua",
		"\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\ÂÞÉ¯.lua",
		"\\script\\online\\Ê¥µ®½Ú»î¶¯\\ÂÞÉ¯.lua",
	}
	
	-- while nSelect > getn(tLasaScripts) do nSelect = mod(30,nSelect); end
	-- if nSelect == 0 then nSelect = random(getn(tLasaScripts)) end
	nSelect = random(getn(tLasaScripts));
	
	local nNpcIndexRosa = CreateNpc("Phu nh©n T©y D­¬ng","La Sa",100,1526,2948);	
	SetNpcScript(nNpcIndexRosa,tLasaScripts[nSelect]);
	
	if nMonth ~= 12 and nMonth ~= 1 then
		return 0;
	end
	
	local nNpcIndex = CreateNpc("C©y gi¸ng sinh 3b","Th«ng gi¸ng sinh",300,1683,3500);
	-- SetNpcScript(nNpcIndex, "\\script\\online_activites\\201211\\christmas_tree.lua");
	
	local nNpcIndex = CreateNpc("Lôc Tróc ¤ng","Santa Clause",300,1690,3498);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\christmas\\npc\\npc_santa.lua");
	
	
	
	-- CAY GIANG SINH
	local szChristmasTree = "C©y gi¸ng sinh ®Æc biÖt";
	CreateNpcList({
		{szChristmasTree,szChristmasTree,108,1484,2933,"\\script\\online\\Ê¥µ®½Ú»î¶¯\\ÈªÖÝÊ¥µ®Ê÷.lua"},
		{szChristmasTree,szChristmasTree,201,1527,2905,"\\script\\online\\Ê¥µ®½Ú»î¶¯\\ãê¾©Ê¥µ®Ê÷.lua"},
		{szChristmasTree,szChristmasTree,304,1487,3022,"\\script\\online\\Ê¥µ®½Ú»î¶¯\\³É¶¼Ê¥µ®Ê÷.lua"},
	});
	
	

end

function Addxinan()
    local nNpcIndexxinan1 = CreateNpc("Xi Háa §¹i hé ph¸p", "Xi Háa §¹i hé ph¸p", 417,1642,3382);
    SetNpcScript(nNpcIndexxinan1, "\\script\\Î÷ÄÏÇø\\°×Ë®¶´¶þ²ã\\npc\\ò¿»ð´ó»¤·¨.lua");

    local nNpcIndexxinan2 = CreateNpc("D¹ Xoa Nha", "D¹ Xoa", 417,1815,3412);
    SetNpcScript(nNpcIndexxinan2, "\\script\\Î÷ÄÏÇø\\°×Ë®¶´¶þ²ã\\npc\\Ò¹²æ.lua");

    local nNpcIndexxinan3 = CreateNpc("T¨ng ¸c", "Xi Háa ¸c t¨ng", 416,1724,2821);
    SetNpcScript(nNpcIndexxinan3, "\\script\\Î÷ÄÏÇø\\°×Ë®¶´Ò»²ã\\npc\\ò¿»ðÉ®¶ñ.lua");

    local nNpcIndexxinan4 = CreateNpc("Quan sø-trung niªn1", "Cao Th¨ng TuyÒn", 400,1537,3050);
    SetNpcScript(nNpcIndexxinan4, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\¸ßÉýÈª.lua");

    local nNpcIndexxinan5 = CreateNpc("Bµ chñ", "TrÞnh Qu¸n Chi", 400,1593,2928);
    SetNpcScript(nNpcIndexxinan5, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\Ö£¹áÖ®.lua");

    local nNpcIndexxinan6 = CreateNpc("Cô giµ", "§æng Giµ La", 400,1522,2848);
    SetNpcScript(nNpcIndexxinan6, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\¶­åÈÂÞ.lua");

    local nNpcIndexxinan7 = CreateNpc("Qu¶n gia", "TrÇn LËp Hµnh", 400,1470,2847);
    SetNpcScript(nNpcIndexxinan7, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\³ÂÁ¢ºâ.lua");

    local nNpcIndexxinan8 = CreateNpc("ThiÕu niªn nam1", "L­u §iÓn", 400,1443,3018);
    SetNpcScript(nNpcIndexxinan8, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\Áõµä.lua");

    local nNpcIndexxinan9 = CreateNpc("Ngôc Háa Cuång Nh©n", "Ngôc Háa Cuång Nh©n", 401,1568,3085);
    SetNpcScript(nNpcIndexxinan9, "\\script\\Î÷ÄÏÇø\\µã²ÔÉ½\\npc\\Óü»ð¿ñÈË.lua");

    local nNpcIndexxinan10 = CreateNpc("Xi Háa Tæng ®µn chñ", "Xi Háa Tæng ®µn chñ", 413,1697,3192);
    SetNpcScript(nNpcIndexxinan10, "\\script\\Î÷ÄÏÇø\\ÁúÑÛ¶´¶þ²ã\\npc\\ò¿»ð½Ì×ÜÌ³Ö÷.lua");

    local nNpcIndexxinan11 = CreateNpc("A Tu La", "A Tu La", 413,1701,3474);
    SetNpcScript(nNpcIndexxinan11, "\\script\\Î÷ÄÏÇø\\ÁúÑÛ¶´¶þ²ã\\npc\\°¢ÐÞÂÞ.lua");

    local nNpcIndexxinan12 = CreateNpc("Xi Háa §¹i tr­ëng l·o", "Xi Háa §¹i tr­ëng l·o", 412,1553,2976);
    SetNpcScript(nNpcIndexxinan12, "\\script\\Î÷ÄÏÇø\\ÁúÑÛ¶´Ò»²ã\\npc\\ò¿»ð´ó³¤ÀÏ.lua");

    local nNpcIndexxinan13 = CreateNpc("Miªu LÜnh Dòng SÜ", "Miªu LÜnh Dòng SÜ", 408,1321,3004);
    SetNpcScript(nNpcIndexxinan13, "\\script\\Î÷ÄÏÇø\\ÃçÁë\\npc\\ÃçÁëÓÂÊ¿.lua");

    local nNpcIndexxinan14 = CreateNpc("Nam nh©n T©y Nam", "Téc tr­ëng Miªu LÜnh", 408,1300,3140);
    SetNpcScript(nNpcIndexxinan14, "\\script\\Î÷ÄÏÇø\\ÃçÁë\\npc\\ÃçÁë×å³¤.lua");

    local nNpcIndexxinan15 = CreateNpc("§éi tr­ëng hé vÖ", "§éi tr­ëng hé vÖ", 409,1820,3518);
    SetNpcScript(nNpcIndexxinan15, "\\script\\Î÷ÄÏÇø\\Ç§Ñ°ËþÒ»²ã\\npc\\»¤ÎÀ¶Ó³¤.lua");

    local nNpcIndexxinan16 = CreateNpc("KiÒn §¹t Bµ", "KiÒn §¹t Bµ", 409,1849,3598);
    SetNpcScript(nNpcIndexxinan16, "\\script\\Î÷ÄÏÇø\\Ç§Ñ°ËþÒ»²ã\\npc\\Ç¬´ïÆÅ.lua");

    local nNpcIndexxinan17 = CreateNpc("Thiªn TÇm N¹p S­", "Thiªn TÇm N¹p S­", 410,1694,3134);
    SetNpcScript(nNpcIndexxinan17, "\\script\\Î÷ÄÏÇø\\Ç§Ñ°Ëþ¶þ²ã\\npc\\Ç§Ñ°ñÄÊ¦.lua");

    local nNpcIndexxinan18 = CreateNpc("KhÈn Na La", "KhÈn Na La", 410,1693,3183);
    SetNpcScript(nNpcIndexxinan18, "\\script\\Î÷ÄÏÇø\\Ç§Ñ°Ëþ¶þ²ã\\npc\\½ôÄÇÂÞ.lua");

    local nNpcIndexxinan19 = CreateNpc("Ngù §éc ¢m C¬", "Ngù §éc ¢m C¬", 419,1774,3129);
    SetNpcScript(nNpcIndexxinan19, "\\script\\Î÷ÄÏÇø\\ÈëÃÅÃÔ¹¬¶þ\\npc\\Ô¦¶¾Òõ¼§.lua");

    local nNpcIndexxinan20 = CreateNpc("Hò Cèt §éc Nh©n", "Hò Cèt §éc Nh©n", 418,1512,2825);
    SetNpcScript(nNpcIndexxinan20, "\\script\\Î÷ÄÏÇø\\ÈëÃÅÃÔ¹¬Ò»\\npc\\¸¯¹Ç¶¾ÈË.lua");

    local nNpcIndexxinan21 = CreateNpc("Ngôc Háa Nh©n", "Ngôc Háa Nh©n", 406,1404,2770);
    SetNpcScript(nNpcIndexxinan21, "\\script\\Î÷ÄÏÇø\\ÎäÁêÉ½\\npc\\Óü»ðÈË.lua");

    local nNpcIndexxinan22 = CreateNpc("B¸n §iÖp Nh©n", "B¸n §iÖp Nh©n", 405,1555,2959);
    SetNpcScript(nNpcIndexxinan22, "\\script\\Î÷ÄÏÇø\\ÎäÁêÉ½½Å\\npc\\°ëµûÈË.lua");

    local nNpcIndexxinan23 = CreateNpc("Ma H« La Giµ", "Ma H« La Giµ", 402,1319,2955);
    SetNpcScript(nNpcIndexxinan23, "\\script\\Î÷ÄÏÇø\\Î÷Ë«°æÄÉ±±²¿\\npc\\Ä¦ºôÂÞåÈ.lua");

    local nNpcIndexxinan24 = CreateNpc("NhÞ Hoµng Tö_§¹i Lý", "NhÞ hoµng tö §oµn Tè ThuËn", 403,1458,2842);
    SetNpcScript(nNpcIndexxinan24, "\\script\\Î÷ÄÏÇø\\Î÷Ë«°æÄÉÄÏ²¿\\npc\\´óÀí¶þ»Ê×Ó.lua");

    local nNpcIndexxinan25 = CreateNpc("§oµn Thõa ¢n", "§oµn Thõa ¢n", 403,1537,2967);
    SetNpcScript(nNpcIndexxinan25, "\\script\\Î÷ÄÏÇø\\Î÷Ë«°æÄÉÄÏ²¿\\npc\\¶Î³Ð¶÷.lua");

    local nNpcIndexxinan26 = CreateNpc("Miªu LÜnh Thñ lÜnh", "Miªu LÜnh Thñ lÜnh", 421,1576,3469);
    SetNpcScript(nNpcIndexxinan26, "\\script\\Î÷ÄÏÇø\\Ñà×Ó¶´¶þ²ã\\npc\\ÃçÁëÊ×Áì.lua");

    local nNpcIndexxinan27 = CreateNpc("Ngò §éc T©n Ch­ëng M«n", "B¹ch Doanh Doanh", 407,1615,3182);
    SetNpcScript(nNpcIndexxinan27, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\°×Ó¨Ó¨.lua");

    local nNpcIndexxinan28 = CreateNpc("Xi Háa Yªu N÷", "Xi Háa Yªu N÷", 404,1346,3144);
    SetNpcScript(nNpcIndexxinan28, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ò¿»ðÑý¸¾.lua");

    local nNpcIndexxinan29 = CreateNpc("T©y Nam Miªu Nh©n", "C©u S¸ch", 407,1572,3159);
    SetNpcScript(nNpcIndexxinan29, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\¹´²á.lua");

    local nNpcIndexxinan30 = CreateNpc("Nam nh©n T©y Nam", "Ph­¬ng Viªn", 407,1549,3184);
    SetNpcScript(nNpcIndexxinan30, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\·½Ô³.lua");

    local nNpcIndexxinan31 = CreateNpc("Ngò §éc gi¸o chñ", "V­u Dung", 407,1643,3233);
    SetNpcScript(nNpcIndexxinan31, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÓÈéÅ.lua");

    local nNpcIndexxinan32 = CreateNpc("Ngò §éc gi¸o ®å", "T©y §å", 407,1606,3279);
    SetNpcScript(nNpcIndexxinan32, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\Î÷Í¼.lua");

    local nNpcIndexxinan33 = CreateNpc("Chñ tiÖm v¶i T©y Nam", "LiÔu T©n Tróc", 407,1606,3220);
    SetNpcScript(nNpcIndexxinan33, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÁøÐÂÖñ.lua");

    local nNpcIndexxinan34 = CreateNpc("Ngò §éc Phã gi¸o chñ", "Ng« Ng«n", 407,1594,3171);
    SetNpcScript(nNpcIndexxinan34, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎâÑÔ.lua");

    local nNpcIndexxinan35 = CreateNpc("Ngò §éc Phã gi¸o chñ", "Hïng LËp", 407,1551,3265);
    SetNpcScript(nNpcIndexxinan35, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÐÜÁ¢.lua");

    local nNpcIndexxinan36 = CreateNpc("Ngò §éc gi¸o ®å", "Th¸i Quang", 407,1556,3216);
    SetNpcScript(nNpcIndexxinan36, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\Ì©¹â.lua");

    local nNpcIndexxinan37 = CreateNpc("Sµi Hoµng Nhi", "Sµi Hoµng Nhi", 404,1570,2725);
    SetNpcScript(nNpcIndexxinan37, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\²ñ»Ë¶ù.lua");

    local nNpcIndexxinan38 = CreateNpc("Thóy Yªn hé ph¸p", "Hé MÉn", 404,1599,2760);
    SetNpcScript(nNpcIndexxinan38, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ìèÃô.lua");

    local nNpcIndexxinan39 = CreateNpc("Thóy Yªn ch­ëng m«n", "L­u Thanh Mi", 404,1543,2693);
    SetNpcScript(nNpcIndexxinan39, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ÁõÇàÃ¼.lua");

    local nNpcIndexxinan40 = CreateNpc("HiÖp n÷", "Chu Tö V¨n",404,1524,2719);
    SetNpcScript(nNpcIndexxinan40, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ÖÜ×Óö©.lua");

    local nNpcIndexxinan41 = CreateNpc("Tè Hoµn Ch©n", "Hå Man Thµnh", 404,1577,2784);
    SetNpcScript(nNpcIndexxinan41, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ºúÂü³É.lua");

    local nNpcIndexxinan42 = CreateNpc("Thóy Yªn m«n nh©n", "Hµ Hµi", 404,1493,2746);
    SetNpcScript(nNpcIndexxinan42, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ºÎÐ³.lua");

    local nNpcIndexxinan43 = CreateNpc("Thóy Yªn hé ph¸p", "X¶o X¶o", 404,1474,2838);
    SetNpcScript(nNpcIndexxinan43, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ÇÉÇÉ.lua");

    local nNpcIndexxinan44 = CreateNpc("Xa phu T©y Nam", "Xa phu §¹i Lý", 400,1549,2882);
    SetNpcScript(nNpcIndexxinan44, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\´óÀí³µ·ò.lua");

    local nNpcIndexxinan45 = CreateNpc("Chñ tiÖm ®¸ T©y Nam", "Chñ Kim hoµn", 400,1497,2940);
    SetNpcScript(nNpcIndexxinan45, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÊÎÆ·µêÀÏ°å.lua");

    local nNpcIndexxinan46 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 400,1553,2914);
    SetNpcScript(nNpcIndexxinan46, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÎïÆ·±£¹ÜÈË±±.lua");

    local nNpcIndexxinan47 = CreateNpc("Chñ cÇm ®å T©y Nam", "Chñ töu lÇu", 400,1524,2894);
    SetNpcScript(nNpcIndexxinan47, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\¾ÆÂ¥ÀÏ°å.lua");

    local nNpcIndexxinan48 = CreateNpc("Tö Thanh Th­îng Nh©n", "LÔ quan", 400,1506,2847);
    SetNpcScript(nNpcIndexxinan48, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\´óÄÚ×Ü¹Ü.lua");

    local nNpcIndexxinan49 = CreateNpc("Ch­ëng d­îc Thæ Phån", "Chñ T¹p hãa", 400,1511,2955);
    SetNpcScript(nNpcIndexxinan49, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÔÓ»õµêÀÏ°å.lua");

    local nNpcIndexxinan50 = CreateNpc("Tr×nh Di", "Chñ th­¬ng héi", 400,1486,2924);
    SetNpcScript(nNpcIndexxinan50, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÉÌ»áÀÏ°å.lua");

    local nNpcIndexxinan51 = CreateNpc("Ch­ëng d­îc T©y Nam", "Chñ D­îc ®iÕm", 400,1522,3007);
    SetNpcScript(nNpcIndexxinan51, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\Ò©µêÀÏ°å.lua");

    local nNpcIndexxinan52 = CreateNpc("Vâ L©m Minh Chñ1", "Sø gi¶ m«n ph¸i", 400,1548,2981);
    SetNpcScript(nNpcIndexxinan52, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÃÅÅÉ½ÓÒýÈË.lua");

    local nNpcIndexxinan53 = CreateNpc("Chñ tiÖm vò khÝ T©y Nam", "Chñ TiÖm Nam phôc", 400,1471,2956);
    SetNpcScript(nNpcIndexxinan53, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÄÐ×°µêÀÏ°å.lua");

    local nNpcIndexxinan54 = CreateNpc("Chñ tiÖm v¶i T©y Nam", "Chñ TiÖm N÷ phôc", 400,1498,2969);
    SetNpcScript(nNpcIndexxinan54, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\Å®×°µêÀÏ°å.lua");

    local nNpcIndexxinan55 = CreateNpc("Xa phu T©y Nam", "Xa phu §¹i Lý", 400,1574,3110);
    SetNpcScript(nNpcIndexxinan55, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\´óÀí³µ·ò.lua");

    local nNpcIndexxinan56 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 400,1527,3112);
    SetNpcScript(nNpcIndexxinan56, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÎïÆ·±£¹ÜÈË¶«.lua");

    local nNpcIndexxinan57 = CreateNpc("Xa phu T©y Nam", "Xa phu §¹i Lý", 400,1465,3110);
    SetNpcScript(nNpcIndexxinan57, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\´óÀí³µ·ò.lua");

    local nNpcIndexxinan58 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 400,1456,3071);
    SetNpcScript(nNpcIndexxinan58, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÎïÆ·±£¹ÜÈËÄÏ.lua");

    local nNpcIndexxinan59 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 407,1621,3249);
    SetNpcScript(nNpcIndexxinan59, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIndexxinan60 = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "Chñ TiÖm vò khÝ", 400,1566,3005);
    SetNpcScript(nNpcIndexxinan60, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÎäÆ÷µêÀÏ°å.lua");

    local nNpcIndexxinan61 = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "Minh S­ Phã", 350,1546,2930);
    SetNpcScript(nNpcIndexxinan61, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\ÖÆÃ±¼¼ÄÜ.lua");

    local nNpcIndexxinan62 = CreateNpc("ThiÕu n÷ Miªu Téc", "Tö Quyªn", 400,1409,2980);
    SetNpcScript(nNpcIndexxinan62, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÖÆ¿ã¼¼ÄÜ.lua");

    local nNpcIndexxinan63 = CreateNpc("V©n Du §¹o Nh©n", "M¹c Qu©n ®¹o tr­ëng", 100,1390,2965);
    SetNpcScript(nNpcIndexxinan63, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\¼¯Áé¼¼ÄÜ.lua");

    local nNpcIndexxinan64 = CreateNpc("Vâ L©m Minh Chñ1", "Sø gi¶ m«n ph¸i", 350,1434,2963);
    SetNpcScript(nNpcIndexxinan64, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÃÅÅÉ½ÓÒýÈË.lua");

    local nNpcIndexxinan65 = CreateNpc("Vâ L©m Minh Chñ1", "Sø gi¶ m«n ph¸i", 150,1723,3143);
    SetNpcScript(nNpcIndexxinan65, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÃÅÅÉ½ÓÒýÈË.lua");
end;

function AddCheFu()		 --²É¼¯µØÍ¼³µ·ò
	local nNpcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu",714,1425,2847);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÄÏ»±¹È\\npc\\³µ·ò.lua");
	nNpcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu",714,1585,3166);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÄÏ»±¹È\\npc\\³µ·ò.lua");

	nNpcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu",719,1624,3269);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\º¬ÓÄ¹È\\npc\\³µ·ò.lua");
	nNpcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu",719,1785,3516);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\º¬ÓÄ¹È\\npc\\³µ·ò.lua");

	nNpcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu",724,1656,3554);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÐùÔ¯¹È\\npc\\³µ·ò.lua");
	nNpcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu", 724,1814,3554);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÐùÔ¯¹È\\npc\\³µ·ò.lua");
end

function AddDragonBoatDay()
	local nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",100,1465,2794);
	SetNpcScript(nNpcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",200,1170,2828);
	SetNpcScript(nNpcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",300,1640,3526);
	SetNpcScript(nNpcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");

	for i=0,7 do
		nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",1070+i,2051,3249);
		SetNpcScript(nNpcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
	for i=0,7 do
		nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",2070+i,2051,3249);
		SetNpcScript(nNpcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
	for i=0,7 do
		nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",3070+i,2051,3249);
		SetNpcScript(nNpcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
end;

function AddTxNpc()
	local nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "ThÇn Du Ch©n Nh©n", 200, 1151, 2850)
	SetNpcScript(nNpcIndex, "\\script\\Ì«Ðé»Ã¾³\\¿Õ¿ÕºÍÉÐ.lua")
	nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "ThÇn Du Ch©n Nh©n", 300, 1975, 3552)
	SetNpcScript(nNpcIndex, "\\script\\Ì«Ðé»Ã¾³\\¿Õ¿ÕºÍÉÐ.lua")
	nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "ThÇn Du Ch©n Nh©n", 100, 1379, 2858)
	SetNpcScript(nNpcIndex, "\\script\\Ì«Ðé»Ã¾³\\¿Õ¿ÕºÍÉÐ.lua")
end

function ZoneInit(nMapid)
	--¶¯Ì¬¼ÓÉÏTrap
	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3235 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_±ùÑ©ÌìµØ.lua")
	end

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3330 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_±ùÑ©ÌìµØ.lua")
	end

	for i = 3235, 3330 do
		AddMapTrap(nMapid, 1515 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_±ùÑ©ÌìµØ.lua")
	end

	for i = 3235, 3330 do
		AddMapTrap(nMapid, 1570 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_±ùÑ©ÌìµØ.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3230 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_½­ÄÏ´ºÉ«.lua")
	end

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3330 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_½­ÄÏ´ºÉ«.lua")
	end

	for i = 3230, 3330 do
		AddMapTrap(nMapid, 1600 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_½­ÄÏ´ºÉ«.lua")
	end

	for i = 3230, 3330 do
		AddMapTrap(nMapid, 1650 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_½­ÄÏ´ºÉ«.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3395 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_ÈÛÑÒµØÓü.lua")
	end

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3495 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_ÈÛÑÒµØÓü.lua")
	end

	for i = 3395, 3495 do
		AddMapTrap(nMapid, 1515 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_ÈÛÑÒµØÓü.lua")
	end

	for i = 3395, 3495 do
		AddMapTrap(nMapid, 1570 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_ÈÛÑÒµØÓü.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3390 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_å«º£»ÆÉ³.lua")
	end

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3500 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_å«º£»ÆÉ³.lua")
	end

	for i = 3390, 3500 do
		AddMapTrap(nMapid, 1600 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_å«º£»ÆÉ³.lua")
	end

	for i = 3390, 3500 do
		AddMapTrap(nMapid, 1650 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_å«º£»ÆÉ³.lua")
	end
end

function Addfengdutrap()
	for i = 1587, 1592 do
		AddMapTrap(307, i * 32, 2687 * 32, "\\script\\ÖÐÔ­¶þÇø\\·á¶¼\\trap\\·á¶¼toÊ®°Ë²ãµØÓü.lua")
	end

	for i = 1587, 1592 do
		AddMapTrap(307, i * 32, 2686 * 32, "\\script\\ÖÐÔ­¶þÇø\\·á¶¼\\trap\\·á¶¼toÊ®°Ë²ãµØÓü.lua")
	end
end

function Addmenpaibuchong()
	for i = 1625, 1630 do
		AddMapTrap(303, i * 32, 3180 * 32, "\\script\\ÖÐÔ­¶þÇø\\¶ëáÒ\\trap\\½ø¶ëáÒ.lua")
	end

	for i = 1571, 1577 do
		AddMapTrap(209, i * 32, 3217 * 32, "\\script\\ÖÐÔ­Ò»Çø\\Ø¤°ï\\trap\\½øØ¤°ï.lua")
	end

	for i = 1585, 1591 do
		AddMapTrap(407, i * 32, 3287 * 32, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\trap\\ÈëÎå¶¾½Ì.lua")
	end

	for i = 1891, 1896 do
		AddMapTrap(312, i * 32, 3422 * 32, "\\script\\ÖÐÔ­¶þÇø\\Îäµ±\\trap\\½øÎäµ±.lua")
	end
end

function AddXinshou()
	local nNpcIndex = CreateNpc("ThiÖu Ung", "V¹n Sù Th«ng", 200, 1397, 2849)
	SetNpcScript(nNpcIndex, "\\script\\task\\teach\\ÐÂÊÖÖ¸Òýnpc.lua")
	nNpcIndex = CreateNpc("ThiÖu Ung", "V¹n Sù Th«ng", 300, 1750, 3524)
	SetNpcScript(nNpcIndex, "\\script\\task\\teach\\ÐÂÊÖÖ¸Òýnpc.lua")
	nNpcIndex = CreateNpc("ThiÖu Ung", "V¹n Sù Th«ng", 100, 1440, 2964)
	SetNpcScript(nNpcIndex, "\\script\\task\\teach\\ÐÂÊÖÖ¸Òýnpc.lua")
	nNpcIndex = CreateNpc("ThiÖu Ung", "V¹n Sù Th«ng", 350, 1452, 2991)
	SetNpcScript(nNpcIndex, "\\script\\task\\teach\\ÐÂÊÖÖ¸Òýnpc.lua")
	nNpcIndex = CreateNpc("ThiÖu Ung", "V¹n Sù Th«ng", 150, 1694, 3146)
	SetNpcScript(nNpcIndex, "\\script\\task\\teach\\ÐÂÊÖÖ¸Òýnpc.lua")
end

function CreateGatherNpc()
	local nIndex = 0
	nIndex = CreateNpc("Du Ph­¬ng ®¹i phu", "Ng­êi ñy th¸c h¸i thuèc", 724,1737,3377)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Du Ph­¬ng ®¹i phu", "Ng­êi ñy th¸c h¸i thuèc", 714, 1500, 3018)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Du Ph­¬ng ®¹i phu", "Ng­êi ñy th¸c h¸i thuèc", 719, 1708, 3376)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Xa phu Trung Nguyªn", "Ng­êi ñy th¸c thu thËp", 710, 1711, 3395)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Xa phu Trung Nguyªn", "Ng­êi ñy th¸c thu thËp", 715, 1500, 2992)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Xa phu Trung Nguyªn", "Ng­êi ñy th¸c thu thËp", 720, 1727, 3346)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("ThiÕu niªn trong th«n", "Ng­êi ñy th¸c canh t¸c", 713, 1481, 2944)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("ThiÕu niªn trong th«n", "Ng­êi ñy th¸c canh t¸c", 718, 1703, 3410)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("ThiÕu niªn trong th«n", "Ng­êi ñy th¸c canh t¸c", 723, 1701, 3456)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "Ng­êi ñy th¸c ®µo khãang", 711, 1721, 3373)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "Ng­êi ñy th¸c ®µo khãang", 716, 1707, 3038)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "Ng­êi ñy th¸c ®µo khãang", 721, 1682, 3336)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("ThÇy luyÖn thó", "Ng­êi ñy th¸c thu thËp", 712, 1480, 2919)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Phô n÷1", "Ng­êi ñy th¸c thu thËp", 717, 1744, 2957)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("ThÇy luyÖn thó", "Ng­êi ñy th¸c thu thËp", 722, 1755, 3430)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
end
--====================================´å³¤µÄ×Ô¶¯º¯Êý================================================
--*****************************´å³¤×Ô¶¯Ö´ÐÐº¯ÊýÖ÷º¯Êý*************************
function zgc_auto_fun_main()
	ZgcNpcCreate()					--NPC×Ô¶¯´´½¨
	randomseed(GetTime())		--Ëæ»úÖÖ×ÓÌí¼Ó
end
function ZgcNpcCreate()
	local npc_index = 0
	--******************************Ôö¼ÓÕ½³¡±¨Ãûnpc*************************
	--npc_index = CreateNpc("B¸n s¸ch","TriÖu Diªn Niªn",200,1386,3076);	--ãê¾©£º173,192
	--npc_index = CreateNpc("Tè Hoµn Ch©n","TiÓu Ph­¬ng",350,1446,2941);	
	npc_index = CreateNpc("Tè Hoµn Ch©n","TiÓu Ph­¬ng",200,1347,2863);		
	SetNpcScript(npc_index, "\\script\\online\\viet_event\\Battle_TieuPhuong\\TieuPhuong.lua")
	--npc_index = CreateNpc("B¸n s¸ch","TriÖu Diªn Niªn",200,1466,2830);	--ãê¾©£º183,176
	--SetNpcScript(npc_index, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÕÔÑÓÄê.lua")
	--npc_index = CreateNpc("Giang hå tuÊn kiÖt","Tiªu ViÔn L©u",200,1409,2772);	--ãê¾©£º176,173
	--npc_index = CreateNpc("Chñ qu¶n Háa KhÝ phßng","TiÓu Ngäc",350,1469,2970);	
	npc_index = CreateNpc("Chñ qu¶n Háa KhÝ phßng","TiÓu Ngäc",200,1377,2895);		
	SetNpcScript(npc_index, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÏôÔ¶Â¥.lua")
	--npc_index = CreateNpc("Giang hå tuÊn kiÖt","Tiªu ViÔn L©u",200,1402,2918);	--ãê¾©£º175,182
	--SetNpcScript(npc_index, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÏôÔ¶Â¥.lua")
	--*****************************NPCÐÅÏ¢±í*********************************
	local zgc_npc_inf = {
	--»ªÉ½´«³öNPC
	--½ÇÉ«É¾³ý¹¦ÄÜNPC
	{"TrÝch ThÇn","Vâ L©m Èn sÜ",200,1313,2686,"\\script\\online\\zgc_npc_dialog.lua"},
	--½á»é¶þÆÚ
	{"Lý S­ S­","X¶o n÷",150,1588,3143,"\\script\\task\\marriage\\qiao_girl.lua"},
	--°ï»á¹¥³ÇÕ½×ÊÔ´±£»¤Ïà¹ØNPC
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",304,1532,2892,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",304,1543,2897,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",304,1533,2913,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",304,1540,2998,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",304,1551,2997,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",304,1551,3014,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",304,1541,3015,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",304,1505,2980,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",304,1494,2980,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",304,1493,2994,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",308,1451,3180,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",308,1442,3181,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",308,1451,3167,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",308,1501,3124,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",308,1490,3122,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",308,1490,3104,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",308,1500,3104,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",308,1433,3078,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",308,1421,3076,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",308,1421,3058,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	--»áÊÔ
	{"Vâ §ang  phã ch­ëng m«n","Long Quang Ch©n Nh©n",500,1633,3185,"\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect.lua"},
	{"MËt th¸m §¹i Tèng T©y Vùc","MËt th¸m §¹i Tèng T©y Vùc",500,1759,3142,"\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua"},
	}

	for i = 1, getn(zgc_npc_inf) do
		npc_index = CreateNpc(zgc_npc_inf[i][1],zgc_npc_inf[i][2],zgc_npc_inf[i][3],zgc_npc_inf[i][4],zgc_npc_inf[i][5])
		SetNpcScript(npc_index,zgc_npc_inf[i][6])
		--×ÊÔ´±£»¤µÄÊ±ºòÐèÒª°ÑÏä×ÓË÷ÒýµÄÖµ³õÊ¼ÉèÖÃÎª0
		if zgc_npc_inf[i][2] == "B¶o r­¬ng Tµi nguyªn" then
			SetUnitCurStates(npc_index,2,1)
			SetUnitCurStates(npc_index,4,0)
			SetUnitCurStates(npc_index,5,0)
		end
	end
		CreateNpcList({
			--Ã÷½ÌÏà¹Ø
--			{"·½À°","·½À°",152,1452,3008,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\npc\\·½À°.lua"},
--			{"ºî¶Ü","ºî¶Ü",152,1508,2956,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\npc\\ºî¶Ü.lua"},
--			{"ÍõÒú","ÍõÒú",152,1560,3025,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\npc\\ÍõÒú.lua"},
--			{"Ê¯±¦","Ê¯±¦",152,1349,2870,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\npc\\Ê¯±¦.lua"},
--			{"Ë¾ÐÐ·½","Ë¾ÐÐ·½",152,1455,3132,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\npc\\Ë¾ÐÐ·½.lua"},
--			{"µËÔª¾õ","µËÔª¾õ",152,1284,2748,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\npc\\µËÔª¾õ.lua"},
--			{"À÷ÌìÈò","À÷ÌìÈò",152,1397,3059,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\npc\\À÷ÌìÈò.lua"},
--			{"·½Æß·ð","·½Æß·ð",152,1480,3038,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\npc\\·½Æß·ð.lua"},
--			{"·½°Ù»¨","·½°Ù»¨",152,1686,3284,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\npc\\·½°Ù»¨.lua"},
--			{"·½°Ù»¨","³ö¹Ø´«ËÍÈË",153,1779,3452,"\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua"},
--			{"ÖÐÔ­´¢Îï¹ñ","ÎïÆ·±£¹ÜÈË",152,1508,3074,"\\script\\½­ÄÏÇø\\Ã÷½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua"},
			--´äÑÌÏà¹Ø
			{"§µo Hoa thô","§µo Hoa thô",404,1462,2835,"\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ÌÒ»¨Ê÷.lua"},
			{"Sµi Phong Nhi","Sµi Phong Nhi",404,1552,2815,"\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\²ñ·ç¶ù.lua"},
--			{"ÇÉÇÉ","³ö¹Ø´«ËÍÈË",423,1497,2950,"\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua"},
			{"N÷ thiÕu niªn1","Thñ khè",404,1537,2758,"\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ÎïÆ·±£¹ÜÈË.lua"},
			--À¥ÂØÏà¹Ø
			{"tianyuanshizhu","Thiªn Nguyªn Ph¸p TrËn Th¹ch Trô",509,1577,3098,"\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\Ê¯Öù.lua"},
			{"tianyuanshizhu","Thiªn Nguyªn Ph¸p TrËn Th¹ch Trô",509,1587,3099,"\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\Ê¯Öù.lua"},
			{"tianyuanshizhu","Thiªn Nguyªn Ph¸p TrËn Th¹ch Trô",509,1589,3115,"\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\Ê¯Öù.lua"},
			{"tianyuanshizhu","Thiªn Nguyªn Ph¸p TrËn Th¹ch Trô",509,1580,3120,"\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\Ê¯Öù.lua"},
			{"tianyuanshizhu","Thiªn Nguyªn Ph¸p TrËn Th¹ch Trô",509,1572,3112,"\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\Ê¯Öù.lua"},
			{"Hå Yªu","Yªu Hå",509,1581,3109,"\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\Ñýºü.lua"},
--			{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",108,1514,3073,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",108,1522,3072,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",108,1521,3058,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",108,1485,3128,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",108,1485,3146,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",108,1473,3128,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",108,1497,3128,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",108,1538,3127,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",108,1549,3126,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B¶o r­¬ng Tµi nguyªn","B¶o r­¬ng Tµi nguyªn",108,1549,3142,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
		});
end
--======================================½áÊø================================
function Addmenpai()
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","§Æc sø Vâ L©m",150,1705,3173);	--ÑïÖÝ 213, 198
	SetNpcScript(nNpcIndex, "\\script\\task\\faction_boss\\wulinmeng_teshi.lua");
end;

function AddNewBattle()
	local tChannel =
	{								--ÆµµÀÃû×ÖÓëID
		[1] = {"Nh¹n M«n Quan-chiÕn dÞch Th«n trang",12},
		[2] = {"Nh¹n M«n Quan-chiÕn dÞch th¶o cèc",13},
		[3] = {"Nh¹n M«n Quan-chiÕn dÞch ph¸o ®µi",14},
		[4] = {"Nh¹n M«n Quan-chiÕn dÞch chÝnh",15},
		[5] = {"Nh¹n M«n Quan-chiÕn dÞch Th«n trang phe Tèng",16},
		[6] = {"Nh¹n M«n Quan-chiÕn dÞch Th«n trang phe Liªu",17},
		[7] = {"Nh¹n M«n Quan-chiÕn dÞch th¶o cèc phe Tèng",18},
		[8] = {"Nh¹n M«n Quan-chiÕn dÞch th¶o cèc phe Liªu",19},
		[9] = {"Nh¹n M«n Quan-chiÕn dÞch ph¸o ®µi phe Tèng",20},
		[10] = {"Nh¹n M«n Quan-chiÕn dÞch ph¸o ®µi phe Liªu",21},
		[11] = {"Nh¹n M«n Quan-chiÕn dÞch chÝnh phe Tèng",22},
		[12] = {"Nh¹n M«n Quan-chiÕn dÞch chÝnh phe Liªu",23},
		[13] = {"ChiÕn tr­êng Ngäc M«n quan",36},
		[14] = {"ChiÕn tr­êng Ngäc M«n quan-Tèng",37},
		[15] = {"ChiÕn tr­êng Ngäc M«n quan-Liªu-",38},
	}
	for i=1,getn(tChannel) do
		CreateChannel(tChannel[i][1],tChannel[i][2],180);
	end;
	SetGlbValue(31,0)	--¿ªÆôÐÂÕ½³¡
	local nNpcIdx = 0;
end;

function Addjiehun()
	local nNpcIndex = CreateNpc("Bµ mai", "Bµ mai", 150, 1600, 3136)
	SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\Ã½ÆÅ.lua");
	nNpcIndex = CreateNpc("Th­¬ng nh©n", "Sø gi¶ h«n lÔ", 150, 1711, 3046)
	SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì´«ËÍÈË.lua");
	nNpcIndex = CreateNpc("NguyÖt L·o", "NguyÖt L·o", 404, 1642, 2603)
	SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\ÔÂÀÏ.lua");
	
	nNpcIndex = CreateNpc("KiÖu", " ", 150,1708,3044)
	
	--Ô¤ÀÀ³¡µØÃ½ÆÅ
	nNpcIndex = CreateNpc("Bµ mai", "Bµ mai", 855, 1554, 3232)
	SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\Ã½ÆÅ2.lua");
	nNpcIndex = CreateNpc("Bµ mai", "Bµ mai", 856, 1615, 3276)
	SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\Ã½ÆÅ2.lua");
	nNpcIndex = CreateNpc("Bµ mai", "Bµ mai", 857, 1550, 3217)
	SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\Ã½ÆÅ2.lua");
	nNpcIndex = CreateNpc("Bµ mai", "Bµ mai", 858, 1612, 3324)
	SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\Ã½ÆÅ2.lua");

	CreateChannel("Khu vùc kÕt h«n",26);
end

function AddSnowWarNpc()
    if tonumber(date("%y%m%d")) >= 091218 and tonumber(date("%y%m%d")) < 400117 then
	--ãê¾©Ñ©ÕÌ´«ËÍÈË
	local nNpcIndex = CreateNpc("Giang hå hµo kiÖt","Xa phu_nÐm tuyÕt",200,1413,3056)
	SetNpcScript(nNpcIndex,"\\script\\online\\´º½Ú»î¶¯\\ãê¾©Ñ©ÕÌ´«ËÍÈËin.lua")
	--³É¶¼Ñ©ÕÌ´«ËÍÈË
	nNpcIndex = CreateNpc("Giang hå hµo kiÖt","Xa phu_nÐm tuyÕt",300,1831,3577)
	SetNpcScript(nNpcIndex,"\\script\\online\\´º½Ú»î¶¯\\³É¶¼Ñ©ÕÌ´«ËÍÈËin.lua")
	--ÈªÖÝÑ©ÕÌ´«ËÍÈË
	nNpcIndex = CreateNpc("Giang hå hµo kiÖt","Xa phu_nÐm tuyÕt",100,1364,2928)
	SetNpcScript(nNpcIndex,"\\script\\online\\´º½Ú»î¶¯\\ÈªÖÝÑ©ÕÌ´«ËÍÈËin.lua")
    end
end;

function Addtianshi()
	local nNpcIndex = CreateNpc("C«n L«n T©n M«n Nh©n", "§Ö tö C«n L«n thÇn bÝ", 314,1584,2856)
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­¶þÇø\\ÌìÊ¦ÃØ¾³\\npc\\ÃØ¾³´«ËÍÈË.lua")
end

function AddKillerHall()
    local nNpcIdx = CreateNpc("Giang hå tuÊn kiÖt", "Nam nh©n thÇn bÝ", 318,1567,2753);
    SetNpcScript(nNpcIdx, "\\script\\task\\killer_hall\\entrance_npc.lua");
end;

function AddCaijiNpc()
    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 710,1700,3391);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 711,1730,3368);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 712,1467,2926);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 713,1485,2952);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 714,1514,3018);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 715,1493,2992);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 716,1719,3037);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 717,1755,2976);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 718,1713,3394);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 719,1698,3377);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 720,1717,3342);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 721,1691,3323);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua")

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 722,1743,3427);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua")

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 723,1698,3445);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua")

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 724,1725,3384);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua")

    local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 300,1913,3615);
    SetNpcScript(nNpcIdx, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua")
end;

function AddZGDaShi()
	local nNpcIdx = CreateNpc("Cô giµ","Tinh Hoa Tö Quang sø gi¶",200,1498,2781);
	SetNpcScript(nNpcIdx,"\\script\\online\\dragon_boat_07\\qinghuaziguangshizhe_npc.lua");
end;

function AddNpcYiZuChuGuo()
	local szScript = "\\script\\online\\dragon_boat_07\\offspring_chu_npc.lua";
	local szNpcModel = "Thiªn v­¬ng bang chñ";
	local szNpcName = "Di téc Së quèc";
	local tNpcList = {
		{szNpcModel, szNpcName,100,1451,2774,szScript},
		{szNpcModel, szNpcName,200,1188,2835,szScript},
		{szNpcModel, szNpcName,300,1628,3533,szScript},
	}
	CreateNpcList(tNpcList);
end;

function AddTongMission()	--°ï»á¹Ø¿¨
	local nNpcIdx = CreateNpc("Cô giµ","Tö Quang C¸c L·o Nh©n",150,1651,3174);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_mission_entrance.lua");
end;

function AddBaiHuaNpc()
	local nNpcIndex = CreateNpc("Lý S­ S­", "B¸ch Hoa sø gi¶", 200,1378,2854)
	SetNpcScript(nNpcIndex, "\\script\\online\\qixi07\\baihua_npc.lua")
	local nNpcIndex = CreateNpc("Lý S­ S­", "B¸ch Hoa sø gi¶", 300,1735,3523)
	SetNpcScript(nNpcIndex, "\\script\\online\\qixi07\\baihua_npc.lua")
	local nNpcIndex = CreateNpc("Lý S­ S­", "B¸ch Hoa sø gi¶", 100,1435,2988)
	SetNpcScript(nNpcIndex, "\\script\\online\\qixi07\\baihua_npc.lua")
end;

function AddGongChengNpc()
	local tChannel =
	{								--ÆµµÀÃû×ÖÓëID
		[1] = {"TuyÒn Ch©u thµnh ",27},
		[2] = {"Thµnh §« thµnh ",28},
		[3] = {"T­¬ng D­¬ng thµnh ",29},
		[4] = {"Phe c«ng TuyÒn Ch©u",30},
		[5] = {"Phe thñ TuyÒn Ch©u thµnh",31},
		[6] = {"Phe c«ng Thµnh §« thµnh",32},
		[7] = {"Phe thñ Thµnh §« thµnh",33},
		[8] = {"Phe c«ng T­¬ng D­¬ng thµnh",34},
		[9] = {"Phe thñ T­¬ng D­¬ng thµnh",35},
	}
	for i=1,getn(tChannel) do
		CreateChannel(tChannel[i][1],tChannel[i][2]);
	end;
	local nNpcIdx = CreateNpc("Vâ L©m Minh Chñ1","Thµnh §« §¹i sø c«ng thµnh",300,1742,3548)
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\gongchengdashi_npc.lua");
	-- ¹¥³ÇÕ½³ÇÊÐ¹ÜÀí,ÀÎ·¿Ïà¹ØNPC

	-- ¹¥³ÇÕ½ÀÎ·¿
	local nNpcIdx = CreateNpc("Nha dÞch", "Bang héi Ngôc tèt", 730, 1376, 3143);
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\jailer_npc.lua")
    nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 730, 1378, 3139)
    SetNpcScript(nNpcIdx, "\\script\\battles\\openbox.lua")

   	nNpcIdx = CreateNpc("Nha dÞch", "Bang héi Ngôc tèt", 731, 1376, 3143);
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\jailer_npc.lua")
    nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 731, 1378, 3139)
    SetNpcScript(nNpcIdx, "\\script\\battles\\openbox.lua")
 	nNpcIdx = CreateNpc("Nha dÞch", "Bang héi Ngôc tèt", 300, 1792, 3489)
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\gaoler_npc.lua")

    nNpcIdx = CreateNpc("Nha dÞch", "Bang héi Ngôc tèt", 732, 1376, 3143);
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\jailer_npc.lua")
    nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 732, 1378, 3139)
    SetNpcScript(nNpcIdx, "\\script\\battles\\openbox.lua")

    nNpcIdx = CreateNpc("Nha dÞch", "Bang héi Ngôc tèt", 733, 1376, 3143);
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\jailer_npc.lua")
    nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 733, 1378, 3139)
    SetNpcScript(nNpcIdx, "\\script\\battles\\openbox.lua")

    nNpcIdx = CreateNpc("Nha dÞch", "Bang héi Ngôc tèt", 734, 1376, 3143);
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\jailer_npc.lua")
    nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 734, 1378, 3139)
    SetNpcScript(nNpcIdx, "\\script\\battles\\openbox.lua")

	nNpcIdx = CreateNpc("Bµ chñ", "Thµnh §« Qu¶n thµnh sø", 300, 1729, 3536)
	SetNpcScript(nNpcIdx, "\\script\\gongcheng\\city_manage\\manage_npc.lua")
	nNpcIdx = CreateNpc("VÖ binh thµnh m«n","Sø gi¶ Håi Phong tr¹i",889,1762,3805)
	SetNpcScript(nNpcIdx, "\\script\\gongcheng\\personal_task\\task_npc.lua")

	-- ¼Ótrap

	for i=1805,1821 do
		AddMapTrap(889, i * 32, 3591 * 32, "\\script\\gongcheng\\personal_task\\changefarm_trap.lua")
	end

	for i=1800,1815 do
		AddMapTrap(889, i * 32, 3584 * 32, "\\script\\gongcheng\\personal_task\\changepk_trap.lua")
	end

	for i=1728,1740 do
		AddMapTrap(889, i * 32, 3599 * 32, "\\script\\gongcheng\\personal_task\\changefarm_trap.lua")
	end

	for i=1720,1732 do
		AddMapTrap(889, i * 32, 3591 * 32, "\\script\\gongcheng\\personal_task\\changepk_trap.lua")
	end

	for i=1605,1624 do
		AddMapTrap(889, i * 32, 3774 * 32, "\\script\\gongcheng\\personal_task\\changefarm_trap.lua")
	end

	for i=1598, 1610 do
		AddMapTrap(889, i * 32, 3765 * 32, "\\script\\gongcheng\\personal_task\\changepk_trap.lua")
	end
end;

function AddXiBei()

	--·ïÏè¸®¸®

	--Ö÷ÏßÈÎÎñ&ÆäËûNpc
	local nNpcIdx = CreateNpc("¤ng giµ ph­¬ng B¾c2", "DiÖp L·o", 500,1808,3125);
  SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\Ò¶ÀÏ.lua");

	local nNpcIdx = CreateNpc("Tr­¬ng Tr¹ch §oan", "¢u D­¬ng Häa ", 500,1727,3262);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\Å·Ñô»­.lua");

	local nNpcIdx = CreateNpc("Th­¬ng nh©n Ba T­", "Th­¬ng nh©n Ba T­", 500,1686,3252);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\²¨Ë¹ÉÌÈË.lua");

	local nNpcIdx = CreateNpc("KÑo hå l«", "§­êng Hå L«", 500,1675,3168);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÌÆºùÂ«.lua");

	local nNpcIdx = CreateNpc("Gi¸o chñ Minh Gi¸o", "T­ M· Minh Phong", 500,1600,3157);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\Ë¾ÂíÃù·ç.lua");

	local nNpcIdx = CreateNpc("Du Ph­¬ng ®¹i phu", "T«n Ph­¬ng Nh©n ", 500,1807,3045);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\Ëï·½ÈÊ.lua");

	local nNpcIdx = CreateNpc("§­êng M«n T©n m«n nh©n", "LiÔu Tïng V©n ", 500,1717,2986);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\Áø×ÝÔÆ.lua");

	local nNpcIdx = CreateNpc("Nam nh©n ph­¬ng B¾c3", "Th¸c B¹t Ho»ng ", 500,1808,2994);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÍØ°Îºë.lua");

	local nNpcIdx = CreateNpc("Chñ qu¶n Háa KhÝ phßng", "§­êng Thiªn Thiªn", 500,1768,3256);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÌÆÜ·Ü·.lua");

	--Ö°ÄÜNpc
	local nNpcIdx = CreateNpc("Thî rÌn Thæ Phån", "Chñ TiÖm vò khÝ", 500,1747,3092);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÎäÆ÷µêÀÏ°å.lua");

	local nNpcIdx = CreateNpc("Chñ tiÖm vò khÝ Thæ Phån", "Chñ TiÖm Nam phôc", 500,1739,3098);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÄÐ×°µêÀÏ°å.lua");

	local nNpcIdx = CreateNpc("Chñ tiÖm v¶i", "Chñ TiÖm N÷ phôc", 500,1701,3114);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\Å®×°µêÀÏ°å.lua");

	local nNpcIdx = CreateNpc("Chñ cÇm ®å Thæ Phån", "Chñ T¹p hãa", 500,1730,3109);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÔÓ»õµêÀÏ°å.lua");

	local nNpcIdx = CreateNpc("Chñ tiÖm ®¸ Thæ Phån", "Chñ Kim hoµn", 500,1721,3115);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÊÎÆ·µêÀÏ°å.lua");

	local nNpcIdx = CreateNpc("Ch­ëng d­îc Thæ Phån", "Chñ D­îc ®iÕm", 500,1763,3091);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\Ò©µêÀÏ°å.lua");

	local nNpcIdx = CreateNpc("Chñ cÇm ®å Thæ Phån", "Chñ töu lÇu", 500,1700,3176);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\¾ÆÂ¥ÀÏ°å.lua");

	local nNpcIdx = CreateNpc("Tr×nh Di", "Chñ th­¬ng héi", 500,1772,3186);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÉÌ»áÀÏ°å.lua");

	local nNpcIdx = CreateNpc("Quan viªn", "Phông T­êng phñTh¸i thó ", 500,1886,3102);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\·ïÏè¸®Ì«ÊØ.lua");

	local nNpcIdx = CreateNpc("Lôc PhiÕn cao thñ1", "Bé ®Çu", 500,1893,3114);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\²¶Í·.lua");

	local nNpcIdx = CreateNpc("Vâ L©m Minh Chñ1", "Sø gi¶ m«n ph¸i", 500,1751,3141);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÃÅÅÉ½ÓÒýÈË.lua");

	--¸®±±³µ·ò
	local nNpcIdx = CreateNpc("Xa phu", "Xa phu Phông T­êng", 500,1849,3061);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\·ïÏè³µ·ò.lua");

	--¶«ÃÅ³µ·ò
	local nNpcIdx = CreateNpc("Xa phu", "Xa phu Phông T­êng", 500,1803,3220);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\·ïÏè³µ·ò.lua");

	--Î÷ÃÅ³µ·ò
	local nNpcIdx = CreateNpc("Xa phu", "Xa phu Phông T­êng", 500,1671,3089);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\·ïÏè³µ·ò.lua");

	--ÄÏÃÅ³µ·ò
	local nNpcIdx = CreateNpc("Xa phu", "Xa phu Phông T­êng", 500,1671,3202);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\·ïÏè³µ·ò.lua");

	--±±ÃÅÏä×Ó
	local nNpcIdx = CreateNpc("R­¬ng ®å Tr.Nguyªn", "Thñ khè", 500,1828,3048);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÎïÆ·±£¹ÜÈË±±.lua");

	--¶«ÃÅÏä×Ó
	local nNpcIdx = CreateNpc("R­¬ng ®å Tr.Nguyªn", "Thñ khè", 500,1798,3216);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÎïÆ·±£¹ÜÈË¶«.lua");

	--Î÷ÃÅÏä×Ó
	local nNpcIdx = CreateNpc("R­¬ng ®å Tr.Nguyªn", "Thñ khè", 500,1678,3095);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÎïÆ·±£¹ÜÈËÎ÷.lua");

	--ÄÏÃÅÏä×Ó
	local nNpcIdx = CreateNpc("R­¬ng ®å Tr.Nguyªn", "Thñ khè", 500,1656,3214);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÎïÆ·±£¹ÜÈËÄÏ.lua");

	--ÁúÃÅÕò
	local nNpcIdx = CreateNpc("TiÓu nhÞ Thæ Phån", "TiÓu nhÞ", 507,1660,3293);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\µêÐ¡¶þ.lua");

	local nNpcIdx = CreateNpc("ThiÕu niªn nam1", "T«n NhÞ Liªn", 507,1649,3293);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\Ëï¶þçö.lua");

	local nNpcIdx = CreateNpc("Xa Lu©n B¸ V­¬ng", "Xa Lu©n B¸ V­¬ng", 507,1791,3173);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\³µÂÖ°ÔÍõ.lua");

	local nNpcIdx = CreateNpc("Xu©n ThËp Tam n­¬ng", "Xu©n ThËp Tam n­¬ng", 507,1884,3317);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\´ºÊ®ÈýÄï.lua");

	--À¥ÂØ
	local nNpcIdx = CreateNpc("Chu BÊt HoÆc", "Chu BÊt HoÆc", 509,1597,3203);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\ÖÜ²»»ó.lua");

	local nNpcIdx = CreateNpc("TÇn BÊt Tri", "TÇn BÊt Tri", 509,1578,3194);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\ÇØ²»ÖÇ.lua");

	local nNpcIdx = CreateNpc("TrÇn BÊt Vi", "TrÇn BÊt Vi", 509,1536,3228);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\³Â²»Îª.lua");

		local nNpcIdx = CreateNpc("M· BÊt TiÒn", "M· BÊt TiÒn", 509,1581,3249);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\Âí²»Ç°.lua");

	local nNpcIdx = CreateNpc("V­¬ng BÊt Phµm", "V­¬ng BÊt Phµm", 509,1427,3443);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\Íõ²»·².lua");

	local nNpcIdx = CreateNpc("C«n L«n T©n Phã Ch­ëng M«n", "Mai BÊt Dung",509,1561,3270);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\Ã·²»ÈÝ.lua");

	local nNpcIdx = CreateNpc("C«n Lu©n Nam ®Ö tö", "DiÖp Tö Thu", 509,1551,3214);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\Ò¶×ÓÇï.lua");

	local nNpcIdx = CreateNpc("C«n Lu©n Nam ®Ö tö", "TriÖu Tö B×nh", 509,1432,3305);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\ÕÔ×ÓÆ½.lua");
	
	local nNpcIdx = CreateNpc("V©n Hi Hßa", "V©n Hi Hßa", 509,1615,3213);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\ÔÆôËºÍ.lua");	
	
--	local nNpcIdx = CreateNpc("Väng Th­ KiÕm", "Väng Th­ KiÕm", 509,1620,3211);
--	SetNpcScript(nNpcIdx, 	
	
--	local nNpcIdx = CreateNpc("V©n Väng Th­", "V©n Väng Th­", 509,1618,3160);
--	SetNpcScript(nNpcIdx, 
	
	local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn","Thñ khè",509,1600,3229);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\ÎïÆ·±£¹ÜÈË.lua");

	--¹âÃ÷¶¥
	local nNpcIdx = CreateNpc("Hé ph¸p Minh Gi¸o", "¢n Minh ", 508,1691,2962);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\¹âÃ÷¶¥\\npc\\ÒóÃú.lua");

	local nNpcIdx = CreateNpc("Di Tu kh¸ch", "Di Tu §¹i h¸n", 508,1792,3306);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\¹âÃ÷¶¥\\npc\\ò°Ðë´óºº.lua");

	--¹ÅÑô¶´Ò»²ã
	local nNpcIdx = CreateNpc("Phi Th­êng §¹o nh©n", "Phi Th­êng §¹o nh©n", 511,1702,3365);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\¹ÅÑô¶´Ò»²ã\\npc\\·Ç³£µÀÈË.lua");

	--¹ÅÑô¶´¶þ²ã
	local nNpcIdx = CreateNpc("C«n Lu©n Nam ®Ö tö", "§Ö Tö C«n L«n", 512,2061,3404);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	--Ò©Íõ¹È
	local nNpcIdx = CreateNpc("ThiÕu niªn trong th«n", "L­u Tam ", 505,1482,2996);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\Ò©Íõ¹È\\npc\\ÁõÈý.lua");

	local nNpcIdx = CreateNpc("T©y H¹ Ph¸p v­¬ng", "T©y H¹ Ph¸p v­¬ng", 505,1538,3146);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\Ò©Íõ¹È\\npc\\Î÷ÏÄ·¨Íõ.lua");

	--Ò©Íõ¶´
	local nNpcIdx = CreateNpc("D­îc thÊt thñ vÖ", "D­îc thÊt thñ vÖ", 510,1575,2853);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	--É³Ä®ÃÔ¹¬
	local nNpcIdx = CreateNpc("Ngò Hµnh TrËn Sø", "Ngò Hµnh TrËn Sø", 506,1325,2715);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	local nNpcIdx = CreateNpc("§éc Hµnh l·o xµ", "§éc Hµnh l·o xµ", 506,1545,2958);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\¶ÀÐÐÀÏÍÓ.lua");

	local nNpcIdx = CreateNpc("Nam nh©n T©y B¾c", "B¹ch Thiªn Thµnh", 506,1554,2658);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	--ÇØÊ¼»ÊÁê
	local nNpcIdx = CreateNpc("§éc tý", "§o¹n Tý", 503,1412,2742);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\ÇØÊ¼»ÊÁê\\npc\\¶Ï±Û.lua");

	local nNpcIdx = CreateNpc("L×a ch©n", "L×a ch©n", 503,1588,2976);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\ÇØÊ¼»ÊÁê\\npc\\²ÐÍÈ.lua");

	--»ÊÁêÒ»²ã
	local nNpcIdx = CreateNpc("Tr¶o V­¬ng", "Tr¶o V­¬ng", 513,1464,2998);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\»ÊÁêÄ¹ÊÒÒ»²ã\\npc\\×¦Íõ.lua");

	local nNpcIdx = CreateNpc("Thñ mé nh©n", "Thñ mé nh©n", 513,1591,3178);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	--»ÊÁê¶þ²ã
	local nNpcIdx = CreateNpc("Thñ Mé T­íng Qu©n", "Thñ Mé T­íng Qu©n", 514,1733,2863);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	local nNpcIdx = CreateNpc("TrÊn mé l·nh qu©n", "T©y TrÊn mé T­íng qu©n", 514,1475,2977);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\»ÊÁêÄ¹ÊÒ¶þ²ã\\npc\\ÕòÄ¹½«¾üÎ÷.lua");

	local nNpcIdx = CreateNpc("TrÊn mé l·nh qu©n", "B¾c TrÊn mé T­íng qu©n", 514,1624,2822);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\»ÊÁêÄ¹ÊÒ¶þ²ã\\npc\\ÕòÄ¹½«¾ü±±.lua");

	local nNpcIdx = CreateNpc("TrÊn mé l·nh qu©n", "§«ng TrÊn mé T­íng qu©n", 514,1803,2983);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\»ÊÁêÄ¹ÊÒ¶þ²ã\\npc\\ÕòÄ¹½«¾ü¶«.lua");

	local nNpcIdx = CreateNpc("TrÊn mé l·nh qu©n", "Nam TrÊn mé T­íng qu©n", 514,1629,3169);
	SetNpcScript(nNpcIdx, "\\script\\Î÷±±Çø\\»ÊÁêÄ¹ÊÒ¶þ²ã\\npc\\ÕòÄ¹½«¾üÄÏ.lua");

	--¹íÃÅ»ØÀÈ
	local nNpcIdx = CreateNpc("C«n Lu©n Nam ®Ö tö", "§Ö Tö C«n L«n", 328,1711,3258);
	SetNpcScript(nNpcIdx, "\\script\\ÖÐÔ­¶þÇø\\¹íÃÅ»ØÀÈ\\npc\\À¥ÂØµÜ×Ó.lua");

	--ÌìÊ¦ÃØ¾³
	local nNpcIdx = CreateNpc("C«n Lu©n Nam ®Ö tö", "§Ö Tö C«n L«n", 329,1731,3429);
	SetNpcScript(nNpcIdx, "\\script\\ÖÐÔ­¶þÇø\\ÌìÊ¦ÃØ¾³\\npc\\À¥ÂØµÜ×Ó.lua");

	local nNpcIdx = CreateNpc("C« L©u v­¬ng", "C« L©u v­¬ng", 329,1620,3354);
	SetNpcScript(nNpcIdx, "\\script\\ÖÐÔ­¶þÇø\\ÌìÊ¦ÃØ¾³\\npc\\÷¼÷ÃÍõ.lua");

end
function AddGongYe()
	local nNpcIndex = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "C«ng D· binh ", 350,1399,2997)
	SetNpcScript(nNpcIndex, "\\script\\gongyeshijia.lua")
	local nNpcIndex = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "C«ng D· khÝ ", 150,1647,3149)
	SetNpcScript(nNpcIndex, "\\script\\gongyeshijia.lua")
	local nNpcIndex = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "C«ng D· cô ", 400,1493,3053)
	SetNpcScript(nNpcIndex, "\\script\\gongyeshijia.lua")
end

function AddLiuTudi()
	local nNpcIndex = CreateNpc("ThiÕu niªn trong th«n", "Häc trß Thî rÌn L­u", 350,1410,2925)
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\liutiejiangdizi.lua")
end


function Add3Festival()
	
	local nMonth = tonumber(date("%m"))
	if nMonth ~= 9 then
		--return 0;
	end
	local nNpcIndex = CreateNpc("Thiªn V­¬ng Bang Chñ", "Chu niªn kh¸nh sø",100,1440,2785)
	SetNpcScript(nNpcIndex, "\\script\\online\\3festival\\emissary_npc.lua")
	nNpcIndex = CreateNpc("Thiªn V­¬ng Bang Chñ", "Chu niªn kh¸nh sø",200,1179,2845)
	SetNpcScript(nNpcIndex, "\\script\\online\\3festival\\emissary_npc.lua")
	nNpcIndex = CreateNpc("Thiªn V­¬ng Bang Chñ", "Chu niªn kh¸nh sø",300,1649,3537)
	SetNpcScript(nNpcIndex, "\\script\\online\\3festival\\emissary_npc.lua")
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "§Æc sø Vâ L©m", 200,1167,2847)
	SetNpcScript(nNpcIndex, "\\script\\online\\3festival\\wulinmeng_npc.lua")
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "§Æc sø Vâ L©m", 300,1653,3565)
	SetNpcScript(nNpcIndex, "\\script\\online\\3festival\\wulinmeng_npc.lua")
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "§Æc sø Vâ L©m", 100,1439,2807)
	SetNpcScript(nNpcIndex, "\\script\\online\\3festival\\wulinmeng_npc.lua")
end;

function AddTyTuzi()
	-- C« §¶o
	local nNpcIndex = CreateNpc("Thè TiÓu Nha", "Thè TiÓu Nha",117,1663,3083)
	SetNpcScript(nNpcIndex, "\\script\\online\\abluemoon\\tianya_npc.lua")
	-- Trung Nguyªn
	-- local script =  "\\script\\online\\abluemoon\\abluemoon_npc.lua";
	-- local npc = "Thè TiÓu Nha";
	-- nNpcIndex = CreateNpc(npc, npc,200,1169,2845)
	-- SetNpcScript(nNpcIndex,script)
	-- nNpcIndex = CreateNpc(npc, npc,300,1653,3559)
	-- SetNpcScript(nNpcIndex, script)
	-- nNpcIndex = CreateNpc(npc, npc,100,1459,2811)
	-- SetNpcScript(nNpcIndex, script)
	-- nNpcIndex = CreateNpc(npc, npc,150,1680,3118)
	-- SetNpcScript(nNpcIndex, script)
	-- nNpcIndex = CreateNpc(npc, npc,350,1436,2808)
	-- SetNpcScript(nNpcIndex, script)
	-- nNpcIndex = CreateNpc(npc, npc,400,1485,3018)
	-- SetNpcScript(nNpcIndex, script)
end

function AddNewYearNpc()
	local nMonth = tonumber(date("%m"))
	if nMonth ~= 2 then
		return 0;
	end
	local nNpcIndex = CreateNpc("Thiªn V­¬ng Bang Chñ", "Sø gi¶ ho¹t ®éng t©n niªn ",200,1167,2858)
	SetNpcScript(nNpcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
	nNpcIndex = CreateNpc("Thiªn V­¬ng Bang Chñ", "Sø gi¶ ho¹t ®éng t©n niªn ",100,1440,2808)
  SetNpcScript(nNpcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
	nNpcIndex = CreateNpc("Thiªn V­¬ng Bang Chñ", "Sø gi¶ ho¹t ®éng t©n niªn ",300,1649,3560)
  SetNpcScript(nNpcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
	nNpcIndex = CreateNpc("Thiªn V­¬ng Bang Chñ", "Sø gi¶ ho¹t ®éng t©n niªn ",350,1462,2974)
  SetNpcScript(nNpcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
	nNpcIndex = CreateNpc("Thiªn V­¬ng Bang Chñ", "Sø gi¶ ho¹t ®éng t©n niªn ",150,1679,3143)
  SetNpcScript(nNpcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
	nNpcIndex = CreateNpc("Thiªn V­¬ng Bang Chñ", "Sø gi¶ ho¹t ®éng t©n niªn ",400,1560,2963)
  SetNpcScript(nNpcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
end

function add_biwudahui()
	ClearMapNpc(974)
	ClearMapNpc(975)
	ClearMapNpc(976)
	ClearMapNpc(7100)
	CreateNpcList({
		{"Ch©n Tö §¬n hµo hoa","§Æc sø §¹i Héi Tû Vâ",200,1391,2816,"\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua"},
		{"V­¬ng An Th¹ch","ThÇn Vâ ViÖn T­ NghiÖp (TuyÒn Ch©u)",974,1620,3180,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
		{"V­¬ng An Th¹ch","ThÇn Vâ ViÖn T­ NghiÖp (BiÖn Kinh)",975,1620,3180,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
		{"V­¬ng An Th¹ch","ThÇn Vâ ViÖn T­ NghiÖp (Thµnh §«)",976,1620,3180,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
		{"V­¬ng An Th¹ch","ThÇn Vâ ViÖn T­ NghiÖp (Toµn quèc)",7100,1404,2858,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
	});
end;
function add_faction_back_room()
	local nNpcIdx = 0;
	nNpcIdx = CreateNpc("ThiÕu L©m Thñ Täa","HuyÒn Kh«ng",204,1645,3270);	--ÉÙÁÖ
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_master.lua");
	nNpcIdx = CreateNpc("§­êng M«n ®¹i ®å ®Ö","§­êng T« M¹c",305,1674,2936);	--ÌÆÃÅ
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_master.lua");
	nNpcIdx = CreateNpc("Nga My phã ch­ëng m«n","TuÖ V©n S­ Th¸i",303,1715,3059);	--¶ëáÒ
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_master.lua");
	nNpcIdx = CreateNpc("C¸i Bang phã ch­ëng m«n","Bµng L· Väng",209,1530,3209);	--Ø¤°ï
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_master.lua");
	nNpcIdx = CreateNpc("Vâ §ang  m«n nh©n","TiÕt V©n Tranh",312,1871,3276);	--Îäµ±
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_master.lua");
end;

function Add_wuyi_npc()
	local nNpcIdx = 0;
	nNpcIdx = CreateNpc("Giang hå tuÊn kiÖt","Hiªn Viªn Trung",200,1176,2825);
	SetNpcScript(nNpcIdx,"\\script\\online\\laborday08\\mah_jong_npc.lua");
	nNpcIdx = CreateNpc("Giang hå tuÊn kiÖt","Hiªn Viªn Nh©n",300,1649,3538);
	SetNpcScript(nNpcIdx,"\\script\\online\\laborday09\\mah_jong_npc.lua");
	nNpcIdx = CreateNpc("Giang hå tuÊn kiÖt","Hiªn Viªn LÔ",100,1436,2791);
	SetNpcScript(nNpcIdx,"\\script\\online\\labor_2007\\mah_jong_npc.lua");
end

function add_weizhi_npc()
	local n = CreateNpc("Quan sø-trung niªn1","Quèc Tö gi¸m",200,1463,2758)
	SetNpcScript(n, "\\script\\master_prentice\\¹ú×Ó¼àÑ§¹Ù.lua")
	n = CreateNpc("Chñ qu¶n Háa KhÝ phßng","L©m TÞch",106,1557,3069);
	SetNpcScript(n, "\\script\\½­ÄÏÇø\\ÁúÈª´å\\npc\\linxi_npc.lua");
end

function init_xc_ls_sq()
	-- \script\item\xiancao.lua ×¢Òâ£º´Ë±íÓ¦¸ÃÓë¸ÃÎÄ¼þÄÚµÄ±í±£³ÖÒ»ÖÂ£¡
	local tXclInfo =
	{
		{2, 1, 1012, 7200, 150, "Bång Lai Tiªn Thñy",1},
		{2, 0, 109, 7200, 200, "Bång Lai Tiªn Lé",1.5},
		{2, 1, 1013, 7200, 300, "Bång Lai Tiªn §¬n",2},
		{2, 1, 1052, 7200, 120, "Bång Lai Lé Thñy",0},
	}
	for index, value in tXclInfo do
		InitXclSpeed(index, value[5])
	end

	-- \script\item\item_billing\shengwangwan.lua ×¢Òâ£º´Ë±íÓ¦¸ÃÓë¸ÃÎÄ¼þÄÚµÄ±í±£³ÖÒ»ÖÂ£¡
	local tLsInfo =
	{
		{2, 1, 1064, 480, 1, "Lôc ThÇn hoµn"},
		{2, 1, 1065, 480, 2, "C­êng Lôc ThÇn hoµn"},
		{2, 1, 1066, 480, 3, "Lôc ThÇn Tiªn ®¬n"},
	}
	for index, value in tLsInfo do
		InitLiushenSpeed(index, value[5])
	end
	InitLiushenInterval(6)

	-- \script\item\item_billing\sanqingwan.lua ×¢Òâ£º´Ë±íÓ¦¸ÃÓë¸ÃÎÄ¼þÄÚµÄ±í±£³ÖÒ»ÖÂ£¡
	local tSqInfo =
	{
		{2, 1, 1097, 480, 1, "Tam Thanh hoµn"},
		{2, 1, 1098, 480, 2, "C­êng Tam Thanh hoµn"},
		{2, 1, 1099, 480, 3, "Tam Thanh Tiªn ®¬n"},
	}
	for index, value in tSqInfo do
		InitSanqinSpeed(index, value[5])
	end
	InitSanqinInterval(20)
end

function Add_aoyun_npc()
	local nNpcIdx = 0;
	nNpcIdx = CreateNpc("TrÝch ThÇn","Tr­ëng l·o Vâ L©m",200,1412,2807);
	SetNpcScript(nNpcIdx,"\\script\\online\\jiuzhuanxuangong\\jiuzhuan_head.lua");
end
function Add_AoYunQiXi08()
	local nNpcIdx = CreateNpc("V­¬ng An Th¹ch","§Æc sø §¹i Héi Vâ l©m",100,1435,2973);
	SetNpcScript(nNpcIdx,"\\script\\online\\qixi08\\npc.lua");
	nNpcIdx = CreateNpc("V­¬ng An Th¹ch","§Æc sø §¹i Héi Vâ l©m",200,1394,2874);
	SetNpcScript(nNpcIdx,"\\script\\online\\qixi08\\npc.lua");
	nNpcIdx = CreateNpc("V­¬ng An Th¹ch","§Æc sø §¹i Héi Vâ l©m",300,1752,3541);
	SetNpcScript(nNpcIdx,"\\script\\online\\qixi08\\npc.lua");
	for i=0,2 do
		nNpcIdx = CreateNpc("Lý S­ S­","X¶o n÷",966+i,1636,3300);
		SetNpcScript(nNpcIdx,"\\script\\online\\qixi06\\qiaonv_npc.lua");
	end;
end;

function AddLaborDay()
	local nNpcIndex = CreateNpc("G¸nh hµng","Nhµ bu«n Tô B¶o Trai",100,1433,2792);	--ÈªÖÝ
	SetNpcScript(nNpcIndex,"\\script\\online\\laborday06\\collector_npc_QZ.lua");
	nNpcIndex = CreateNpc("G¸nh hµng","Nhµ bu«n Tô B¶o Trai",200,1176,2827);	--ãê¾©
	SetNpcScript(nNpcIndex,"\\script\\online\\laborday06\\collector_npc_BJ.lua");
	nNpcIndex = CreateNpc("G¸nh hµng","Nhµ bu«n Tô B¶o Trai",300,1652,3540);	--³É¶¼
	SetNpcScript(nNpcIndex,"\\script\\online\\laborday06\\collector_npc_CD.lua");

	nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn","¤ng chñ Tô B¶o Trai", 350,1578,2965);	--ÏåÑô
	SetNpcScript(nNpcIndex,"\\script\\online\\laborday06\\awardprize_npc_XY.lua");
	nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn","¤ng chñ Tô B¶o Trai", 150,1783,3148);	--ÑïÖÝ
	SetNpcScript(nNpcIndex,"\\script\\online\\laborday06\\awardprize_npc_YZ.lua");
end;

function add_mail_carrier()
	local script_name = "\\script\\misc\\mail_carrier.lua"
	local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Chñ B­u côc", 200, 1332, 2792);
	SetNpcScript(nNpcIdx, script_name);
	local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Chñ B­u côc", 300, 1760, 3630);
	SetNpcScript(nNpcIdx, script_name);
	local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Chñ B­u côc", 100, 1476, 2905);
	SetNpcScript(nNpcIdx, script_name);
	local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Chñ B­u côc", 350, 1380, 3015);
	SetNpcScript(nNpcIdx, script_name);
	local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn", "Chñ B­u côc", 400, 1425, 3052);
	SetNpcScript(nNpcIdx, script_name);
end

--******************************µÚÒ»°ï»î¶¯*******************************
function AddFirstTongNpc()
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Vâ L©m §Æc Sø",106,1305,2989);	--ÁúÈª´å163/186
	SetNpcScript(nNpcIndex, "\\script\\online\\jpz_event\\first_tong\\wulinteshi_npc.lua");

	nNpcIndex = CreateNpc("R­¬ng tiÒn","B¶o r­¬ng Hoa s¬n",969,1597,2981,-1,1,1,100)			--±¦Ïä
	SetNpcScript(nNpcIndex,"\\script\\online\\jpz_event\\first_tong\\huashan_box_npc.lua")
	SetGlbValue(501,nNpcIndex)

	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Vâ L©m §Æc Sø",969,1643,3225)		--»ªÉ½npc
	SetNpcScript(nNpcIndex,"\\script\\online\\jpz_event\\first_tong\\huashan_npc.lua")
end;


function Add_0910_npc()
	if tonumber(date("%y%m%d%H")) >= 09092800 and tonumber(date("%y%m%d%H")) < 49102524 then
		local nNpcIndex = 0;
		local nRand = random(3);
		
		if nRand == 1 then 
		nNpcIndex = CreateNpc("§ång n÷1","TiÓu Quyªn",350,1424,2973);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_quyen.lua");
		nNpcIndex = CreateNpc("§ång n÷2","TiÓu Ch©u",350,1428,2977);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_chau.lua");
		nNpcIndex = CreateNpc("§ång n÷3","TiÓu Anh",350,1422,2977);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_anh.lua");
		elseif nRand == 2 then 
		nNpcIndex = CreateNpc("§ång n÷1","TiÓu Quyªn",400,1493,3013);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_quyen.lua");
		nNpcIndex = CreateNpc("§ång n÷2","TiÓu Ch©u",400,1498,3018);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_chau.lua");
		nNpcIndex = CreateNpc("§ång n÷3","TiÓu Anh",400,1492,3021);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_anh.lua");
		elseif nRand == 3 then 
		nNpcIndex = CreateNpc("§ång n÷1","TiÓu Quyªn",100,1447,2990);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_quyen.lua");
		nNpcIndex = CreateNpc("§ång n÷2","TiÓu Ch©u",100,1450,2997);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_chau.lua");
		nNpcIndex = CreateNpc("§ång n÷3","TiÓu Anh",100,1444,2996);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_anh.lua");
		end
	end
end

----Ô½ÄÏ2009Äê6¡¢7ÔÂ·Ý»î¶¯NPCÌí¼Ó
function Add67EventNpcs()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 49071924 then
		local nNpcIndex = 0;

	--´´½¨Ò¹²Ý½ð¿âÀÏ°åNPC
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Chñ Ng©n Khè", 200, 1402, 2854);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Chñ Ng©n Khè", 300, 1760, 3550);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Chñ Ng©n Khè", 100, 1445, 2969);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Chñ Ng©n Khè", 350, 1457, 2997);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Chñ Ng©n Khè", 150, 1699, 3151);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Chñ Ng©n Khè", 400, 1491, 3031);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");

	--´´½¨¸´Ô­ÕæÈËNPC
		nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "Phôc Nguyªn Ch©n Nh©n", 200, 1402, 2864);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "Phôc Nguyªn Ch©n Nh©n", 300, 1758, 3529);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "Phôc Nguyªn Ch©n Nh©n", 100, 1440, 2976);--
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "Phôc Nguyªn Ch©n Nh©n", 350, 1442, 2997);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "Phôc Nguyªn Ch©n Nh©n", 150, 1699, 3161);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "Phôc Nguyªn Ch©n Nh©n", 400, 1494, 3016);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		--´´½¨ÅÖÍÃ×ÓNPC
				
		local nSets1 = {{1691, 3081}, {1644, 3124}, {1688, 3194}, {1643, 3282}, {1718, 3263}};
		for i = 1, 5 do--Ç§Ñ°ËþÒ»²ã Thiªn TÇm Th¸p 
			local nRand = random(1, getn(nSets1));
			CreateNpc("Thá MËp", "Thá MËp", 116, nSets1[nRand][1], nSets1[nRand][2]);
		end
		
		local nSets2 = {{1500, 2903}, {1424, 2896}, {1387, 3053}, {1443, 3066}, {1532, 3153}};
		for i = 1, 5 do--Ç§Ñ°ËþÒ»²ã Thiªn TÇm Th¸p 
			local nRand = random(1, getn(nSets2));
			CreateNpc("Thá MËp", "Thá MËp", 403, nSets2[nRand][1], nSets2[nRand][2]);
		end
		
		local nSets3 = {{1528, 3115}, {1584, 2912}, {1488, 2646}, {1390, 2702}, {1392, 2912}};
		for i = 1, 5 do--Ç§Ñ°ËþÒ»²ã Thiªn TÇm Th¸p 
			local nRand = random(1, getn(nSets3));
			CreateNpc("Thá MËp", "Thá MËp", 102, nSets3[nRand][1], nSets3[nRand][2]);
		end
		
		local nSets4 = {{1664, 3424}, {1728, 3504}, {1872, 3264}, {2064, 3456}, {1776, 3696}};
		for i = 1, 5 do--Ç§Ñ°ËþÒ»²ã Thiªn TÇm Th¸p 
			local nRand = random(1, getn(nSets4));
			CreateNpc("Thá MËp", "Thá MËp", 409, nSets4[nRand][1], nSets4[nRand][2]);
		end
		
		local nSets5 = {{1552, 2752}, {1496, 3056}, {1456, 2864}, {1392, 3087}, {1376, 2752}};
		for i = 1, 5 do--Ç§Ñ°ËþÒ»²ã Thiªn TÇm Th¸p 
			local nRand = random(1, getn(nSets5));
			CreateNpc("Thá MËp", "Thá MËp", 151, nSets5[nRand][1], nSets5[nRand][2]);
		end
	end

	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 49080224 then
	--´´½¨Îä·¼½«¾üNPC--NPCÄ£°åÊÇ£¿£¿
		local nNpcIndex = 0;
		nNpcIndex = CreateNpc("Tèng T­íng Qu©n", "Vò Ph­¬ng T­íng Qu©n", 200, 1412, 2864);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		-- nNpcIndex = CreateNpc("Tèng T­íng Qu©n", "Vò Ph­¬ng T­íng Qu©n", 300, 1770, 3560);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		-- nNpcIndex = CreateNpc("Tèng T­íng Qu©n", "Vò Ph­¬ng T­íng Qu©n", 100, 1455, 2979);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		-- nNpcIndex = CreateNpc("Tèng T­íng Qu©n", "Vò Ph­¬ng T­íng Qu©n", 350, 1467, 2987);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		-- nNpcIndex = CreateNpc("Tèng T­íng Qu©n", "Vò Ph­¬ng T­íng Qu©n", 150, 1709, 3161);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		-- nNpcIndex = CreateNpc("Tèng T­íng Qu©n", "Vò Ph­¬ng T­íng Qu©n", 400, 1479, 3031);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
	end
	
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 49080524 then
	--´´½¨åÐÒ£Ê¹ÕßNPC
		nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Sø Gi¶ Tiªu Dao", 200, 1422, 2874);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
		nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Sø Gi¶ Tiªu Dao", 300, 1750, 3570);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
		nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Sø Gi¶ Tiªu Dao", 100, 1465, 2989);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
		nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Sø Gi¶ Tiªu Dao", 350, 1447, 3007);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
		nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Sø Gi¶ Tiªu Dao", 150, 1689, 3171);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
		nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Sø Gi¶ Tiªu Dao", 400, 1501, 3005);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
	end
end

function AddNpcYecao()
	local nNpcIndex = 0;
	-- if tonumber(date("%y%m%d%H")) >= 09073100 and tonumber(date("%y%m%d%H")) <= 49090624 then
			-- ´´½¨Ò¹²ÝNPC
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 200, 1392, 2844);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 300, 1745, 3540);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 100, 1435, 2959);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 350, 1447, 2987);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 150, 1689, 3141);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 400, 1486, 3011);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
	-- else

		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 200, 1392, 2844);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 300, 1745, 3540);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 100, 1435, 2959);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 350, 1447, 2987);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 150, 1689, 3141);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 400, 1486, 3011);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 500, 1733, 3142);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
	-- end
	
	nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 200, 1392, 2844);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
	-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 300, 1745, 3540);
	-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
	-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 100, 1435, 2959);
	-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
	-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 350, 1447, 2987);
	-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
	-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 150, 1689, 3141);
	-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
	-- nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 400, 1486, 3011);
	-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
	
	nNpcIndex = CreateNpc("Chñ T¬ lôa Trung Nguyªn", "D¹ Th¶o", 500, 1733, 3142);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
end
--Ô½ÄÏ09Äê8ÔÂNPCÌí¼Ó
function add_0908_npc()
	local nDate = tonumber(date("%y%m%d"));
	local nNpcIndex = 0;
	if nDate >= 090807 and nDate < 490907 then
		nNpcIndex = CreateNpc("Chñ cÇm ®å Thæ Phån", "Nhµ S­u TÇm MËt TÞch", 500, 1774, 3124);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\6\\npc_mijishoucangjia.lua");
	end
	if nDate >= 090830 and nDate < 490907 then
		nNpcIndex = CreateNpc("Bµ mai", "Bµ x· Thî rÌn L­u", 350, 1412, 2928);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\quockhanh\\npc_quockhanh.lua");
		nNpcIndex = CreateNpc("§ång tö1", "Con Thî rÌn L­u", 350, 1413, 2929);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200908\\quockhanh\\npc_quockhanh_dongtu.lua");
		nNpcIndex = CreateNpc("Bµ l·o2", "MÑ Thî rÌn L­u", 350, 1413, 2924);
	end
end

--Ô½ÄÏ09Äê8ÔÂµ÷Õû£¬ÀëÏßÍÐ¹ÜÖÖÊ÷NPCÌí¼Ó
function add_0908_tuoguan_plant_npc()
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Vâ L©m Sø Gi¶", 200, 1433, 2857);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Vâ L©m Sø Gi¶", 300, 1747, 3490);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Vâ L©m Sø Gi¶", 350, 1358, 2907);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Vâ L©m Sø Gi¶", 150, 1668, 3133);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Vâ L©m Sø Gi¶", 100, 1464, 2987);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Vâ L©m Sø Gi¶", 500, 1729, 3161);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1", "Vâ L©m Sø Gi¶", 400, 1523, 2974);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
end

--Ô½ÄÏ09Äê9ÔÂÖÐÇï»î¶¯NPCÌí¼Ó
function add_0909_npc()
	local nDate = tonumber(date("%m"));
	local nNpcIndex = 0;
	
	--±¦Ïä¹ÜÀí
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Qu¶n Lý B¶o R­¬ng", 100, 1443, 2975);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Qu¶n Lý B¶o R­¬ng", 200, 1415, 2858);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Qu¶n Lý B¶o R­¬ng", 150, 1697, 3159);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Qu¶n Lý B¶o R­¬ng", 350, 1462, 2980);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Qu¶n Lý B¶o R­¬ng", 300, 1778, 3529);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Qu¶n Lý B¶o R­¬ng", 500, 1743, 3122);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
		
	if nDate >= 08 and nDate <= 09 then
		
		--ÖÐÐÄµÆÁý
		-- nNpcIndex = CreateNpc("§Ìn KÐo Qu©n","§Ìn KÐo Qu©n", 100,1439,2993);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		-- nNpcIndex = CreateNpc("§Ìn KÐo Qu©n","§Ìn KÐo Qu©n", 300,1728,3516);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		-- nNpcIndex = CreateNpc("§Ìn KÐo Qu©n","§Ìn KÐo Qu©n", 200,1378,2854);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		-- nNpcIndex = CreateNpc("§Ìn KÐo Qu©n","§Ìn KÐo Qu©n", 400,1486,3025);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		-- nNpcIndex = CreateNpc("§Ìn KÐo Qu©n","§Ìn KÐo Qu©n", 150,1683,3134);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		-- nNpcIndex = CreateNpc("§Ìn KÐo Qu©n","§Ìn KÐo Qu©n", 350,1419,2981);
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		
		local tPos = {
			{100,1592,3150},
			{300,1939,3706},
			{200,1563,3048},
			{400,1593,3156},
			{150,1795,3231},
			{350,1561,3112},
		}
		local szNpcModel = "§Ìn KÐo Qu©n";
		local szNpcName = "§Ìn KÐo Qu©n";
		local szScriptPath = "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua";
		for i = 1, getn(tPos) do
			local nNpcIndex = CreateNpc(szNpcModel,szNpcName,tPos[i][1],tPos[i][2],tPos[i][3]);
			SetNpcScript(nNpcIndex,szScriptPath);
		end
	end
end


--Ô½ÄÏ09Äê11ÔÂNPCÌí¼Ó
function add_0911_npc()
	local nDate = tonumber(date("%y%m%d"));
	local nNpcIndex = 0;
	if nDate >= 091113 and nDate < 491130 then
		-- nNpcIndex = CreateNpc("Chñ cÇm ®å Thæ Phån", "Nhµ S­u TÇm MËt TÞch", 500, 1774, 3124); -- Phông T­êng phñ
		-- SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Thæ Phån", "Nhµ S­u TÇm MËt TÞch", 200,1376,2862);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Thæ Phån", "Nhµ S­u TÇm MËt TÞch", 300,1731,3511);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Thæ Phån", "Nhµ S­u TÇm MËt TÞch", 100,1420,2975);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Thæ Phån", "Nhµ S­u TÇm MËt TÞch", 150,1693,3137);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Thæ Phån", "Nhµ S­u TÇm MËt TÞch", 350,1441,2959);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Thæ Phån", "Nhµ S­u TÇm MËt TÞch", 400,1507,2982);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
	end
end

function Add_ip_npc()
		local nNpcIndex = 0;
		nNpcIndex = CreateNpc("Phu nh©n-phæ th«ng","ChÞ Chñ Phßng M¸y", 200,1372,2865);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn","Anh Chñ Phßng M¸y", 300,1732,3517);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
		nNpcIndex = CreateNpc("Phu nh©n-phæ th«ng","ChÞ Chñ Phßng M¸y", 100,1432,2994);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn","Anh Chñ Phßng M¸y", 350,1431,2973);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
		nNpcIndex = CreateNpc("Phu nh©n-phæ th«ng","ChÞ Chñ Phßng M¸y", 150,1688,3169);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn","Anh Chñ Phßng M¸y", 400,1547,2991);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
end

function Add_bachtiensinh()
		local nNpcIndex = 0
		nNpcIndex = CreateNpc("NguyÖt L·o", "B¹ch Tiªn Sinh", 200, 1372, 2851);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "B¹ch Tiªn Sinh", 300, 1726, 3522);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "B¹ch Tiªn Sinh", 350, 1426, 2982);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "B¹ch Tiªn Sinh", 150, 1694, 3161);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "B¹ch Tiªn Sinh", 100, 1441, 2983);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "B¹ch Tiªn Sinh", 400, 1531, 2964);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "B¹ch Tiªn Sinh", 500, 1743, 3152);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
end

--Ô½ÄÏ09Äê12ÔÂNPCÌí¼Ó
function add_0912_npc()
	local nDate = tonumber(date("%m%d"));
	local nNpcIndex = 0;
	if nDate >= 1218 and nDate < 0117 then
		nNpcIndex = CreateNpc("NguyÖt L·o", "V¹n Niªn Gia", 200, 1402, 2863);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "V¹n Niªn Gia", 300, 1741, 3513);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "V¹n Niªn Gia", 100, 1439, 2964);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "V¹n Niªn Gia", 150, 1696, 3140);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "V¹n Niªn Gia", 350, 1427, 2972);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "V¹n Niªn Gia", 400, 1510, 2988);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		nNpcIndex = CreateNpc("NguyÖt L·o", "V¹n Niªn Gia", 500, 1742, 3138);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		-- C©y th«ng
		nNpcIndex = CreateNpc("C©y Gi¸ng sinh 3a", "Th«ng Gi¸ng Sinh V¹n Niªn", 200, 1433, 2815);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wanniancongshu.lua");
		nNpcIndex = CreateNpc("C©y Gi¸ng sinh 3a", "Th«ng Gi¸ng Sinh V¹n Niªn", 300, 1701, 3456);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wanniancongshu.lua");
		nNpcIndex = CreateNpc("C©y Gi¸ng sinh 3a", "Th«ng Gi¸ng Sinh V¹n Niªn", 100, 1337, 3067);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wanniancongshu.lua");
	end
end
function Add_TianMenZhen()
	local tNpcInfo = {
		"D­¬ng V¨n Siªu",
		"Phiªu kþ t­íng qu©n Qu¸ch Qu©n B»ng ",
		{
			{350,1429,2816},
			{300,1855,3672},
			{400,1437,2869},
		},
		"\\script\\missions\\tianmenzhen\\tmz_npc.lua"
	}
	for i = 1,getn(tNpcInfo[3]) do
		local nNpcIndex = CreateNpc(tNpcInfo[1],tNpcInfo[2],tNpcInfo[3][i][1],tNpcInfo[3][i][2],tNpcInfo[3][i][3])
		SetNpcScript(nNpcIndex,tNpcInfo[4])
	end
	local nNpcIndex = CreateNpc("D¹ LuËt B¶o §å","Liªu Qu©n Quan",604,1554,3125);
	SetNpcDeathScript(nNpcIndex,"\\script\\missions\\tianmenzhen\\tmz_task_npc.lua");
end

--ÁºÉ½´«ËÍNPC´´½¨
function Liangshan_Entrance()
		local tPoes = {
		{200, 1161, 2862},
		{100, 1368, 2873},
		{300, 1967, 3537},
	}
	for _, tPos in tPoes do
		local nNpcIndex = CreateNpc("ThÇn Hµnh Th¸i B¶o §íi T«ng", "ThÇn Hµnh Th¸i B¶o §íi T«ng", tPos[1], tPos[2], tPos[3])
		AddUnitStates(nNpcIndex, 7, 0);
		AddUnitStates(nNpcIndex, 8, -GetUnitCurStates(nNpcIndex, 8));
		SetNpcScript(nNpcIndex, "\\script\\missions\\liangshan\\npc\\entrynpc_.lua");
	end
end

function Add_TuBaoThuongNhan()
  	-- local nNpcIndex111 = CreateNpc("Ch­ëng d­îc Thæ Phån", "Tô B¶o Th­¬ng Nh©n", 200, 1449, 2911);
    -- SetNpcScript(nNpcIndex111, "\\script\\vng\\saleoff\\proday.lua");
	local nNpcIndex111 = CreateNpc("Ch­ëng d­îc Thæ Phån", "Tô B¶o Th­¬ng Nh©n", 350, 1449, 2919);
    SetNpcScript(nNpcIndex111, "\\script\\vng\\saleoff\\proday.lua");
	local nNpcIndex111 = CreateNpc("Ch­ëng d­îc Thæ Phån", "Tô B¶o Th­¬ng Nh©n", 100,1323,2916);
    SetNpcScript(nNpcIndex111, "\\script\\mod\\npc\\jubaoshangren.lua");
end

--¼ÓÔØnpc_list.txtÅäÖÃµÄNPC
function LoadNpcList()
	
	--------------------------------------------------------------------
	do
		--ÔÝÊ±°Ñ´ú±ÒÉÌµêNPCÔÚÕâÀï´´½¨°É
    	local nNpcIndex111 = CreateNpc("Ch­ëng d­îc Thæ Phån", "Tô B¶o Th­¬ng Nh©n", 200, 1449, 2911);
    	SetNpcScript(nNpcIndex111, "\\script\\equip_shop\\bianjing_npc.lua");
    	return
	end
	--------------------------------------------------------------------
	
	
	---ÒÔÏÂ»úÖÆÔÝÊ±ÏÈ²»¿ª·Å°ÉÒÔºóÔÙÕûÀí
	local SZ_NPC_LIST_FILE = "\\settings\\npc\\npc_list.txt"
	local tbNpcListFile = new(KTabFile, SZ_NPC_LIST_FILE);
	if tbNpcListFile then
		if tbNpcListFile.__bOpen ~= 0 then
			local nRowCnt = tbNpcListFile:getRow() or 0;
			local nCurDate = tonumber(date("%Y%m%d"));
			
			local szTemplateName, szNpcName = "", "";
			local nCreateStartDate, nCreateEndDate = 0, 0;
			local nMapId, nPosX, nPosY = 0, 0, 0;
			local szScript = "";
			for i = 3, nRowNum do
				nCreateStartDate = tonumber(tbNpcListFile:getCell(i, "CreateStartDate")) or 0;
				nCreateEndDate = tonumber(tbNpcListFile:getCell(i, "CreateEndDate")) or 0;
				if _IsInCreateDate(nCurDate, nCreateStartDate, nCreateEndDate) == 1 then--Ö»ÓÐÔÚÓÐÐ§ÆÚµÄNPC²Å´´½¨
					szTemplateName = tbNpcListFile:getCell(i, "TemplateName");
					szNpcName = tbNpcListFile:getCell(i, "NpcName");
					szScript = tbNpcListFile:getCell(i, "DialogScript");
					nMapId = tonumber(tbNpcListFile:getCell(i, "MapId")) or 0 
					nPosX = tonumber(tbNpcListFile:getCell(i, "MapX")) or 0 
					nPosY = tonumber(tbNpcListFile:getCell(i, "MapY")) or 0 
					
					local nNpcIndex = CreateNpc(szTemplateName, szNpcName, nMapId, nPosX, nPosY);
					if szScript and szScript ~= "" and nNpcIndex > 0 then
						SetNpcScript(nNpcIndex, szScript);
					end
				end
			end
		end
		tbNpcListFile:close();--¹Ø±ÕÎÄ¼þ
	end
end

--ÅÐ¶Ïµ±Ç°ÈÕÆÚÊÇ·ñÔÚÓÐÐ§ÆÚ
function _IsInCreateDate(nCurDate, nStartDate, nFinishDate)
	if  not nCurDate or nCurDate <= 0 then
		return 0;
	end
	if nStartDate and nStartDate > 0 and nCurDate < nStartDate then
		return 0;
	end
	if nFinishDate and nFinishDate > 0 and nCurDate >= nFinishDate then
		return 0;
	end
	return 1;
end

function DragonBoat_2011_npc()
	local tPos = {
			{150,1691,3159}, --{300,1648,3534} µ¥·þÉÏÃ»ÓÐ´ËµØÍ¼
		}
	local tPosinfo
	for _,tPosinfo in tPos do
		local nNpcIndex = CreateNpc("Thiªn V­¬ng Bang §å","H¶i ChiÕn TiÕp DÉn Sø",tPosinfo[1],tPosinfo[2],tPosinfo[3])
		SetNpcScript(nNpcIndex,"\\script\\missions\\dragonboat2011\\npc_entrance.lua")
	end
end

function Init_newres()
--	if SubWorldID2Idx(606) >= 0 then	
	if mf_GetMissionV(24, 1,606) == 0 then			
    		mf_OpenMission(24, 606)
    		AddGlobalNews("Thiªn M«n TrËn-Tµi nguyªn chiÕn ®· b¾t ®Çu. Mêi c¸c vÞ anh hïng mau chãng ®Õn T­¬ng D­¬ng t×m T­ M· TÊn Nguyªn ®Ó tham gia!",1)
    		Msg2SubWorld("Thiªn M«n TrËn-Tµi nguyªn chiÕn ®· b¾t ®Çu. Mêi c¸c vÞ anh hïng mau chãng ®Õn T­¬ng D­¬ng t×m T­ M· TÊn Nguyªn ®Ó tham gia!")
    	end
--    	end
end

function Init_pet_fighting()
	if mf_GetMissionV(44, 1,101) == 0 then			
    		mf_OpenMission(44, 101)    		    		
    	end
end

function Init_golden_chest()
	local tPos = {
		{513,1645,2983},{513,1649,2979},{513,1636,2993},{513,1642,2972},{513,1666,2772},{513,1666,2780},{513,1666,2786},{513,1665,2790},{513,1558,3090},{513,1567,3084},{513,1573,3093},{513,1567,3108},{513,1627,3160},{513,1621,3172},{513,1632,3177},{513,1604,3158},
		{514,1721,3074},{514,1715,3080},{514,1728,3067},{514,1721,3056},{514,1742,2887},{514,1736,2892},{514,1743,2899},{514,1752,2895},{514,1809,2987},{514,1808,2995},{514,1820,2990},{514,1822,2981},{514,1819,2971},{514,1814,2958},{514,1824,2961},{514,1836,2972},
		{108,1422,3187},{108,1425,3180},{108,1434,3187},{108,1471,3004},
		{301,1565,3110},{301,1569,3102},{301,1564,3090},{301,1510,2977},
	}											
	local nNpcIndex = 0;	
	for i=1, getn(tPos) do 	
		nNpcIndex = CreateNpc("R­¬ng n¸t", "R­¬ng Hoµng Kim", tPos[i][1],  tPos[i][2],  tPos[i][3]);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\golden_card\\npc_golden_chest.lua");
		SetUnitCurStates(nNpcIndex,2,i)
	end
end

function AddTuLinhNpc()
	-- local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	-- print("autoexec >> AddTuLinhNpc::SERVER_INDEX",nNation)
	local nNation = random(94);			-- For offline server
	SetGlbValue(GLB_TSK_SERVER_ID,nNation)
	local szName = "Linh thó" 			-- Default name: "B¹ch Hæ"
	local nGroup = random(4) 			-- Default group: 2
	if nNation >= 77 then 
		szName = "Chñ tr× server";
		nGroup = random(5,14);
	end
	local nDate = tonumber(date("%Y%m%d"))
	
	
	for i = 1, getn(tb_server_group) do
		for j = 1, getn(tb_server_group[i]) do
			if nNation == tb_server_group[i][j] then
				nGroup = i
				break 
			end
		end
	end
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if nNation == TB_NATION_SERVERLIST[i][1] then
			szName = TB_NATION_SERVERLIST[i][2]
			break
		end
	end
	
	nNpcIndex = CreateNpc(tb_npc_type[nGroup], szName, 100, 1416, 2965)
	AddUnitStates(nNpcIndex, 6, nGroup)
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\tulinhthu_npc\\head.lua")
	
	-- Add NPC dua top
	--if tbNPC_TopServer[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
	--	if nDate < tbNPC_TopServer[GetGlbValue(GLB_TSK_SERVER_ID)] then
			nNpcIndex = CreateNpc("NhÞ Hoµng Tö_§¹i Lý", "§ua Top Server B¹ch Hæ", 200,1405,2840)
			SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\top_server\\npc_top.lua")
	--	end
	--end
end


function AddIdolNpc()
	local nNpcIndex = CreateNpc("C«n L«n T©n Phã Ch­ëng M«n", "ThÇn T­îng Vâ L©m", 300, 1789, 3534)
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\karaoke\\head.lua")
end

function get_server_id()
	if GetGlbValue(GLB_TSK_SERVER_ID) == 0 then
		local fileName = ""
		if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
			fileName = "data\\serverid.txt";
		else
			fileName = "data/serverid.txt";
		end		
		local pf = openfile(fileName, "r");
		if not pf then 			
			return
		end		
		local str = read(pf, "*l");
		if not str then
			closefile(pf);
			return 
		end
		local nsid = tonumber(str) or 1;
		closefile(pf);
		SetGlbValue(GLB_TSK_SERVER_ID,nsid)
	end
end

function Add_HoangHuynh()
	local nDate = tonumber(date("%y%m%d"))
	local nNpcIndex = 0
	if nDate >= 100716 then
		nNpcIndex = CreateNpc("TrÇn BÊt Vi", "Hoµng Huynh", 200,1407,2857);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\top_server\\npc_top.lua");
	end
end

function Add_GoldenCard_Manager()
	local nDate = tonumber(date("%y%m%d"))
	local nNpcIndex = 0
	if nDate >= 100928 and nDate <= 421231 then
		nNpcIndex = CreateNpc("NhÞ Hoµng Tö_§¹i Lý", "L«i Hæ Th­¬ng Nh©n", 200,1378,2857);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\golden_card\\npc_golden_saleman.lua");
	end
end

function Add_XaPhu()
    local npcIdx = CreateNpc("Xa phu Trung Nguyªn", "ThuyÒn phu §«ng H¶i", 200,1396,2874);
    SetNpcScript(npcIdx, "\\script\\online\\viet_event\\oversea\\oversea_npc.lua");
    
    local tFighting_pos = {
			{101, 1656, 3081},
			{101, 1638, 3146},
			{101, 1600, 3183},
			{101, 1573, 3176},
			{101, 1543, 3195},
			{101, 1516, 3309},
			{101, 1526, 3244},
			{101, 1547, 3272},
			{101, 1506, 3116},
			{101, 1544, 3131},
    }
    
    for i=1,getn(tFighting_pos) do
    		npcIdx = CreateNpc("Tiªu s­-®èi tho¹i", "Tû thÝ kú", tFighting_pos[i][1],tFighting_pos[i][2],tFighting_pos[i][3]);
    		SetNpcScript(npcIdx, "\\script\\online\\viet_event\\pet_fighting\\fighting_npc.lua");
    		SetUnitCurStates(npcIdx,2,i)
    end    
end


function Add_PetNpc()
	local nNpcIndex = 0
--	nNpcIndex = CreateNpc("Chu BÊt HoÆc","B¾c §Èu L·o Nh©n",  300, 1786, 3532)
--	SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
--	nNpcIndex = CreateNpc("Chu BÊt HoÆc","B¾c §Èu L·o Nh©n",  200, 1392, 2810)
--	SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
	nNpcIndex = CreateNpc("Chu BÊt HoÆc","B¾c §Èu L·o Nh©n",  100, 1453, 2939)
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
--	nNpcIndex = CreateNpc("Chu BÊt HoÆc","B¾c §Èu L·o Nh©n",  150, 1731, 3151)
--	SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
--	nNpcIndex = CreateNpc("Chu BÊt HoÆc","B¾c §Èu L·o Nh©n",  350, 1428, 2940)
--	SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
--	nNpcIndex = CreateNpc("Chu BÊt HoÆc","B¾c §Èu L·o Nh©n",  400, 1565, 2978)
--	SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
--	nNpcIndex = CreateNpc("Chu BÊt HoÆc","B¾c §Èu L·o Nh©n",  500, 1747, 3129)
--	SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
end

function AddHangNga()
	local nNpcIndex = 0
	nNpcIndex = CreateNpc("Phi YÕn Tiªn Tö","H»ng Nga Tiªn Tö",  100, 1428, 2939)
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\nop_event\\hangnga.lua")
end

function AddBirthdayNpc_2010()
	local nNpcIndex = 0
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Sø Gi¶ Ho¹t §éng",  100, 1426, 3012)
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\birthday\\sugia.lua")
end

function Add_Pet_TaiXu()
	local nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "V©n Du Ch©n Nh©n", 200, 1387, 2879)
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\pet_instance\\reg_npc.lua")
	local nNpcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "V©n Du Ch©n Nh©n", 300, 1749, 3535)
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\pet_instance\\reg_npc.lua")
end

function Add_TianMenZhen()
	local nNpcIndex = 0;
	--nNpcIndex = CreateNpc("D­¬ng V¨n Siªu","Phiªu kþ t­íng qu©n Qu¸ch Qu©n B»ng ",350,1429,2816);
	nNpcIndex = CreateNpc("D­¬ng V¨n Siªu","Phiªu kþ t­íng qu©n Qu¸ch Qu©n B»ng ",300,1854,3672);
	SetNpcScript(nNpcIndex,"\\script\\missions\\tianmenzhen\\tmz_npc.lua");
	nNpcIndex = CreateNpc("D­¬ng V¨n Siªu","Phiªu kþ t­íng qu©n Qu¸ch Qu©n B»ng ",400,1435,2864);
	SetNpcScript(nNpcIndex,"\\script\\missions\\tianmenzhen\\tmz_npc.lua");
	nNpcIndex = CreateNpc("D¹ LuËt B¶o §å","Liªu Qu©n Quan",604,1554,3125);
	SetNpcDeathScript(nNpcIndex,"\\script\\missions\\tianmenzhen\\tmz_task_npc.lua");
end

--±¦ÏäÉÌÈË
function create_treasuer_chests()
	local tPos = {
		{300,1723,3537},
		{350,1453,2974},
		{150,1675,3153},
		{200,1379,2852},
		{500,1760,3131},
		{100,1413,2975},
		{400,1517,2968},
	}
	local tPosinfo
	for _,tPosinfo in tPos do
		local nNpcIndex = CreateNpc("Chñ cÇm ®å T©y Nam","Th­¬ng Nh©n B¶o R­¬ng",tPosinfo[1],tPosinfo[2],tPosinfo[3])
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\treasure_box\\npc_treasuer_chests.lua")
	end
end

function dialog_npc_create()
	local nNpcIndex;
	--¶Ô»°NPC´´½¨
	nNpcIndex = CreateNpc("Tr­¬ng §¹i H÷u","Tr­¬ng §¹i H÷u",106,1307,2983);
	SetNpcScript(nNpcIndex,"\\script\\½­ÄÏÇø\\ÁúÈª´å\\npc\\ÕÅ´óÓÑ.lua");
	nNpcIndex = CreateNpc("C«ng t¾c nguyÖt l­îng","C«ng t¾c nguyÖt l­îng",111,1665,2826);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÔÂÁÁ»ú¹Ø.lua");
	nNpcIndex = CreateNpc("Nh¹c BÊt QuÇn","Nh¹c BÊt QuÇn",502,1682,3102);
	SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\»ªÉ½\\npc\\ÔÀ²»Èº.lua");
	nNpcIndex = CreateNpc("D­¬ng M«n ®Ö tö","D­¬ng M«n ®Ö tö",6012,1588,3207);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÉÙÁÖÒéÊÂÌü\\ÑîÃÅµÜ×Ó.lua");
	nNpcIndex = CreateNpc("Nh¹n Kha","Nh¹n Kha",218,1627,3245);
	SetNpcScript(nNpcIndex,"\\script\\ÖÐÔ­Ò»Çø\\Áé±¦É½\\npc\\ÑÕ¿Â.lua");
	nNpcIndex = CreateNpc("H­íng VÊn Thiªn","H­íng VÊn Thiªn",6009,1598,3200);
	SetNpcScript(nNpcIndex,"\\script\\½­ÄÏÇø\\ÌÒ»¨µº\\ÏòÎÊÌì.lua");
	nNpcIndex = CreateNpc("H­íng VÊn Thiªn","H­íng VÊn Thiªn",6010,1598,3200);
	SetNpcScript(nNpcIndex,"\\script\\½­ÄÏÇø\\ÌÒ»¨µº\\ÏòÎÊÌì.lua");
	nNpcIndex = CreateNpc("H­íng VÊn Thiªn","H­íng VÊn Thiªn",6011,1598,3200);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÌÒ»¨Ð¡Õ»\\ÏòÎÊÌì.lua");
	nNpcIndex = CreateNpc("Ngò §éc ®Ö tö","Ngò §éc ®Ö tö",6012,1591,3204);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÉÙÁÖÒéÊÂÌü\\Îå¶¾µÜ×Ó.lua");
	nNpcIndex = CreateNpc("Vâ §ang ®Ö tö","Vâ §ang ®Ö tö",6012,1595,3202);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÉÙÁÖÒéÊÂÌü\\Îäµ±µÜ×Ó.lua");
	nNpcIndex = CreateNpc("V« Danh T¨ng","V« Danh T¨ng",6012,1601,3200);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÉÙÁÖÒéÊÂÌü\\ÎÞÃûÉ®.lua");
	nNpcIndex = CreateNpc("C«ng t¾c « ya","C«ng t¾c « ya",111,1698,3114);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÎÚÑ»»ú¹Ø.lua");
	nNpcIndex = CreateNpc("Tó Bót ¤ng","Tó Bót ¤ng",6016,1562,2938);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\Ã·×¯\\Íº±ÊÎÌ.lua");
	nNpcIndex = CreateNpc("§­êng M«n ®Ö tö","§­êng M«n ®Ö tö",6012,1598,3211);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÉÙÁÖÒéÊÂÌü\\ÌÆÃÅµÜ×Ó.lua");
	nNpcIndex = CreateNpc("C«ng t¾c th¸i d­¬ng","C«ng t¾c th¸i d­¬ng",111,1862,3040);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\Ì«Ñô»ú¹Ø.lua");
	nNpcIndex = CreateNpc("NhËm Doanh Doanh","NhËm Doanh Doanh",6014,1580,3115);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\Î÷µº\\ÈÎÓ¯Ó¯.lua");
	nNpcIndex = CreateNpc("NhËm Doanh Doanh","NhËm Doanh Doanh",6011,1602,3204);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÌÒ»¨Ð¡Õ»\\ÈÎÓ¯Ó¯.lua");
	nNpcIndex = CreateNpc("NhËm Ng· Hµnh","NhËm Ng· Hµnh",6013,1634,3216);
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\Ã·×¯µØÀÎ\\ÈÎÎÒÐÐ.lua");
	nNpcIndex = CreateNpc("NhËm Ng· Hµnh","NhËm Ng· Hµnh",6010,1600,3202);
	SetNpcScript(nNpcIndex,"\\script\\½­ÄÏÇø\\ÌÒ»¨µº\\ÈÎÎÒÐÐ.lua");
	nNpcIndex = CreateNpc("NhËm Ng· Hµnh","NhËm Ng· Hµnh",6011,1600,3201)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÌÒ»¨Ð¡Õ»\\ÈÎÎÒÐÐ.lua")
	nNpcIndex = CreateNpc("Lôc Tróc ¤ng","Lôc Tróc ¤ng",350,1574,2904)
	SetNpcScript(nNpcIndex,"\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\ÂÌÖñÎÌ.lua")
	nNpcIndex = CreateNpc("Lý L·o","Lý L·o",507,1686,3322)
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÀîÀÏ.lua")
	nNpcIndex = CreateNpc("Hoµng Chung C«ng","Hoµng Chung C«ng",6016,1488,2938)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\Ã·×¯\\»ÆÖÓ¹«.lua")
	nNpcIndex = CreateNpc("H¾c Tæng Qu¶n","H¾c Tæng Qu¶n",6015,1503,3179)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ºÚ×Ü¹Ü.lua")
	nNpcIndex = CreateNpc("H¾c B¹ch Tö","H¾c B¹ch Tö",6016,1460,2988)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\Ã·×¯\\ºÚ°××Ó.lua")
	nNpcIndex = CreateNpc("Hµn Tö Phi","Hµn Tö Phi",400,1587,3081)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\º«·É×Ó.lua")
	nNpcIndex = CreateNpc("§Ö tö C¸i Bang","§Ö tö C¸i Bang",6012,1596,3214)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÉÙÁÖÒéÊÂÌü\\Ø¤°ïµÜ×Ó.lua")
	nNpcIndex = CreateNpc("Nga Mi ®Ö tö","Nga Mi ®Ö tö",6012,1601,3209)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÉÙÁÖÒéÊÂÌü\\¶ëÃ¼µÜ×Ó.lua")
	nNpcIndex = CreateNpc("§an Thanh Sinh","§an Thanh Sinh",6016,1517,3003)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\Ã·×¯\\µ¤ÇàÉú.lua")
	nNpcIndex = CreateNpc("Th«n tr­ëng","Th«n tr­ëng",202,1411,2997)
	SetNpcScript(nNpcIndex,"\\script\\ÖÐÔ­Ò»Çø\\ÐÓ»¨´å\\npc\\´å³¤.lua")
	nNpcIndex = CreateNpc("B¸ t¸nh TiÓu Thóy","TiÓu Thóy",507,1706,3384)
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\°ÙÐÕÐ¡´ä.lua")
	nNpcIndex = CreateNpc("B¸ t¸nh Lý Hoa","Lý Hoa",507,1632,3374)
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\°ÙÐÕÀî»ª.lua")
	nNpcIndex = CreateNpc("C«ng t¾c b¹ch v©n","C«ng t¾c b¹ch v©n",111,1830,2849)
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\°×ÔÆ»ú¹Ø.lua")
	nNpcIndex = CreateNpc("NhËm Ng· Hµnh","NhËm Ng· Hµnh",6017,1631,3270);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÈÎÎÒÐÐ.lua");
	nNpcIndex = CreateNpc("H­íng VÊn Thiªn","H­íng VÊn Thiªn",6017,1628,3274);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÏòÎÊÌì.lua");
	nNpcIndex = CreateNpc("NhËm Doanh Doanh","NhËm Doanh Doanh",6017,1636,3273);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÈÎÓ¯Ó¯.lua");
	nNpcIndex = CreateNpc("NhËm Ng· Hµnh","NhËm Ng· Hµnh",6018,1621,2897);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ2\\ÈÎÎÒÐÐ.lua");
	nNpcIndex = CreateNpc("H­íng VÊn Thiªn","H­íng VÊn Thiªn",6018,1596,3040);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ2\\ÏòÎÊÌì.lua");
	nNpcIndex = CreateNpc("NhËm Doanh Doanh","NhËm Doanh Doanh",6018,1581,2889);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ2\\ÈÎÓ¯Ó¯.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch Lam Kú","Bé cò NhËm Ng· Hµnh",6017,1623,3285);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÈÎÎÒÐÐ¾É²¿.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch B¹ch Kú","Bé cò NhËm Ng· Hµnh",6017,1619,3281);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÈÎÎÒÐÐ¾É²¿.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch H¾c Kú","Bé cò NhËm Ng· Hµnh",6017,1633,3286);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÈÎÎÒÐÐ¾É²¿.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch Hång Kú","Bé cò NhËm Ng· Hµnh",6017,1639,3277);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÈÎÎÒÐÐ¾É²¿.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch Lam Kú","Néi øng",6017,1715,2957);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÄÚÓ¦.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch B¹ch Kú","Néi øng",6017,1726,2967);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÄÚÓ¦.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch H¾c Kú","Néi øng",6017,1734,2979);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÄÚÓ¦.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch Hång Kú","Néi øng",6017,1743,2985);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÄÚÓ¦.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch Hoµng Kú","Néi øng",6017,1752,2992);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÄÚÓ¦.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch Lam Kú","Néi øng",6017,1764,2996);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÄÚÓ¦.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch B¹ch Kú","Néi øng",6017,1744,3005);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÄÚÓ¦.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch H¾c Kú","Néi øng",6017,1731,3011);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÄÚÓ¦.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch Hång Kú","Néi øng",6017,1716,3017);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÄÚÓ¦.lua");
	nNpcIndex = CreateNpc("§èi tho¹i ThÝch Kh¸ch Hoµng Kú","Néi øng",6017,1699,3001);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\ÄÚÓ¦.lua");
	nNpcIndex = CreateNpc("D­¬ng Liªn §×nh","D­¬ng Liªn §×nh",6017,1622,2897);
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÑîÁ«Í¤.lua");
	nNpcIndex = CreateNpc("D­¬ng Liªn §×nh","D­¬ng Liªn §×nh",105,1555,3040)
	SetNpcScript(nNpcIndex,"\\script\\½­ÄÏÇø\\ÈªÖÝ¸®Î÷\\npc\\ÑîÁ«Í¤.lua")
	nNpcIndex = CreateNpc("Bao tr­ëng l·o","Bao tr­ëng l·o",215,1748,3066)
	SetNpcScript(nNpcIndex,"\\script\\ÖÐÔ­Ò»Çø\\ºÚ·ç¶´\\npc\\±«³¤ÀÏ.lua")
	--Îï×Ê
	local nMapInfo;
	local tbPos = {
		{6017,1730,3139},		{6017,1736,3146},
		{6017,1741,3157},		{6017,1747,3164},
		{6017,1721,3185},		{6017,1715,3191},
		{6017,1700,3182},		{6017,1676,3164},
		{6017,1680,3148},		{6017,1691,3139},
		{6017,1702,3138},		{6017,1711,3130},
		{6017,1720,3135},		{6017,1718,3156},
		{6017,1716,3171},		{6017,1702,3163},
	}
	for _,nMapInfo in tbPos do
		nNpcIndex = CreateNpc("NhiÖm vô vËt chÊt","Trï bÞ vËt t­",nMapInfo[1],nMapInfo[2],nMapInfo[3])
		SetNpcScript(nNpcIndex,"\\script\\task\\npc\\´¢±¸Îï×Ê.lua")
	end
end

function fight_npc_create()
	--Õ½¶·NPC´´½¨
	local nNpcIndex;
	nNpcIndex = CreateNpc("NhiÖm vô HuyÕt L©n §éc M·ng","HuyÕt L©n §éc M·ng",6013,1636,3147)
	--Ð¡Ò°Öí´´½¨
	local nMapInfo,nMapInfo1,nMapInfo2;
	local tbPos = {
		{420, 1611, 3573},
		{420, 1512, 3308},
		{420, 1492, 3316},
		{420, 1473, 3643},
		{420, 1430, 3611},
		{420, 1717, 3590},
		{420, 1658, 3655},
		{420, 1730, 3432},
		{420, 1669, 3343},
		{420, 1573, 3573},
	}
	for _,nMapInfo in tbPos do
		CreateNpc("H¾c d· tr­","TiÓu H¾c tr­",nMapInfo[1],nMapInfo[2],nMapInfo[3],0,3,1,6)
	end
	--»ðºü´´½¨
	local tbPos1 = {
		{412, 1719, 3002},
		{412, 1572, 2976},
		{412, 1778, 2910},
		{412, 1769, 3051},
		{412, 1680, 3133},
		{412, 1597, 3238},
		{412, 1707, 3243},
		{412, 1778, 3135},
		{412, 1740, 3257},
		{412, 1868, 3064},
	}
	for _,nMapInfo1 in tbPos1 do
		CreateNpc("Háa hå","Háa hå",nMapInfo1[1],nMapInfo1[2],nMapInfo1[3],0,3,1,6)
	end
	--½ÌÍ½
	local tbPos2 = {
		{6014, 1547, 3088},
		{6014, 1536, 3136},
		{6014, 1598, 3155},
		{6014, 1559, 3214},
		{6014, 1542, 3197},
		{6014, 1606, 3130},
		{6014, 1563, 3204},
		{6014, 1540, 3202},
		{6014, 1609, 3135},
	}
	for _,nMapInfo2 in tbPos2 do
		CreateNpc("Gi¸o ®å","Gi¸o ®å",nMapInfo2[1],nMapInfo2[2],nMapInfo2[3],0,3,1,6)
	end
	--ÈªÖÝ¸®Î÷£¬½ÌÍ½
	nNpcIndex = CreateNpc("Gi¸o ®å","Gi¸o ®å",105,1557,3027,0,6,1,6);
	nNpcIndex = CreateNpc("Hoµng Tr­ëng L·o","Hoµng Tr­ëng L·o",6015,1744,3155)
	nNpcIndex = CreateNpc("§«ng Ph­¬ng BÊt B¹i","§«ng Ph­¬ng BÊt B¹i",6015,1626,2896)
	nNpcIndex = CreateNpc("Hoµng Kú Kú Chñ","Tr­ëng l·o Hoµng H÷u Vi",6017,1509,3218);
	nNpcIndex = CreateNpc("Hång Kú Kú Chñ","Tr­ëng l·o Tiªu NhÜ Hång",6017,1601,3048);
	nNpcIndex = CreateNpc("T¶ hé ph¸p M· LËp §ao","T¶ hé ph¸p M· LËp §ao",6017,1624,3056);
	nNpcIndex = CreateNpc("Lam Kú Kú Chñ","Tr­ëng l·o Phi Thiªn Lam Miªu",6017,1709,3161);
	nNpcIndex = CreateNpc("B¹chKú Kú Chñ","Tr­ëng l·o B¹ch Linh Linh",6017,1720,2980);
	nNpcIndex = CreateNpc("H¾c Kú Kú Chñ","Tr­ëng l·o H¾c V« Th­êng",6017,1487,3029);
	SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\ºÚÎÞ³£.lua");
end

function trap_npc_create()
	--µØÍ¼´«ËÍNPC
	local nNpcIndex;
	nNpcIndex = CreateNpc("Nh¹c Linh San","Nh¹c Linh San",502,1645,3224)
	SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\»ªÉ½\\npc\\ÔÀÁéÉº.lua")
	nNpcIndex = CreateNpc("§ång tö 3","M«n §ång",102,1456,3066)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÌÒ»¨Ð¡Õ»\\Í¯×Ó3.lua")
	nNpcIndex = CreateNpc("§ång tö2","M«n §ång",6009,1579,3218)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÌÒ»¨Ð¡Õ»\\Í¯Å®2.lua")
	nNpcIndex = CreateNpc("§ång tö2","M«n §ång",6010,1579,3218)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÌÒ»¨Ð¡Õ»\\Í¯Å®2.lua")
	nNpcIndex = CreateNpc("§ång tö2","M«n §ång",6011,1579,3218)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÌÒ»¨Ð¡Õ»\\Í¯Å®2.lua")
	nNpcIndex = CreateNpc("ThiÕu L©m T¨ng Nh©n","TÞnh Tõ",6012,1579,3218)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÉÙÁÖÒéÊÂÌü\\¾»´È.lua")
	nNpcIndex = CreateNpc("Giang hå tuÊn kiÖt","Gi¸o ®å thÇn bÝ",504,1343,2840)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÉñÃØ½ÌÍ½.lua")
	nNpcIndex = CreateNpc("Xa phu","ThÇn gi¸o gi¸o ®å míi",6015,1632,3242)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÉñÃØÐÂ½ÌÍ½.lua")
	nNpcIndex = CreateNpc("Xa phu","ThÇn gi¸o gi¸o ®å míi",6017,1632,3242)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÉñÃØÐÂ½ÌÍ½.lua")
	nNpcIndex = CreateNpc("Xa phu","ThÇn gi¸o gi¸o ®å míi",6018,1632,3242)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\ºÚÄ¾ÑÂ\\ÉñÃØÐÂ½ÌÍ½.lua")
	nNpcIndex = CreateNpc("§ång tö1","Mai Trang Th­ §ång",106,1300,3110)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\Ã·×¯\\Ã·×¯ÊéÍ¯1.lua")
	nNpcIndex = CreateNpc("§ång tö1","Mai Trang Th­ §ång",6016,1490,3094)
	SetNpcScript(nNpcIndex,"\\script\\Î÷ÄÏÇø\\Ã·×¯\\Ã·×¯ÊéÍ¯2.lua")
	nNpcIndex = CreateNpc("Thiªn V­¬ng Bang §å","Canh gi÷",6016,1586,3140)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\Ã·×¯µØÀÎ\\¿´ÊØ1.lua")
	nNpcIndex = CreateNpc("Thiªn V­¬ng Bang §å","Canh gi÷",6013,1606,3206)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\Ã·×¯µØÀÎ\\¿´ÊØ2.lua")
	nNpcIndex = CreateNpc("Xa phu","ThuyÒn phu",6014,1536,3291)
	SetNpcScript(nNpcIndex,"\\script\\ÊÀ½çµØÍ¼\\Î÷µº\\´¬·ò.lua")
	
	
	for i=1285,1291 do -- Trap Long Tuyen thon --> Mai Trang
		AddMapTrap(106, i*32, 3168*32,"\\script\\½­ÄÏÇø\\ÁúÈª´å\\trap\\ÁúÈª´åtoÃ·×¯.lua");
	end
end

function new_task_npc_create()
	--gtask¹Ø±Õ
	if IsNewTaskSystemOpen() ~= 1 then
		return 1;
	end
	dialog_npc_create();
	fight_npc_create();
	trap_npc_create();
end

function Ambassador_Acitivity()
	local tPos = {
		{300,1734,3523},
		{350,1441,2954},
		{100,1427,2958},
		{200,1382,2845},
	}
	local tPosinfo
	for _,tPosinfo in tPos do
		local nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","§¹i Sø ho¹t ®éng",tPosinfo[1],tPosinfo[2],tPosinfo[3])
		SetNpcScript(nNpcIndex,"\\script\\online\\activity_ambassador.lua")
	end
end

function CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		SetNpcScript(npc, tNpc[6] or "");
		if npc > 0 then
		else
			WriteLogEx(format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or ""))
		end
		
	end
end

function new_ttd_npc_create()
	--ÈÎÓ¯Ó¯
	local nNpcIndex = CreateNpc("NhËm Doanh Doanh","Th¸nh N÷ NhËm Doanh Doanh",150,1664,3165);
	SetNpcScript(nNpcIndex, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\renyingying.lua");
	--ÈÎÓ¯Ó¯Î»ÖÃÒÆ¶¯
	nNpcIndex = CreateNpc("NhËm Doanh Doanh","Th¸nh N÷ NhËm Doanh Doanh",500, 1742, 3039);
	SetNpcScript(nNpcIndex,"\\script\\missions\\hunduantongtianding\\ttd_mission_entry_npc.lua");
end

function new_task_npc_create2()
	local nNpcIndex = CreateNpc("§èi tho¹i víi Giang BiÖt H¹c","Giang BiÖt H¹c",500,1745,3123);
	SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\½­±ðº×.lua");
	nNpcIndex = CreateNpc("Lý S­ S­","L­u T­ Anh",150,1668,3225);
	SetNpcScript(nNpcIndex,"\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\ÁõË¼Ó¢.lua");
	nNpcIndex = CreateNpc("ThÇn gi¸o H¾c Tæng Qu¶n","ThÇn gi¸o H¾c Tæng Qu¶n",500,1699,3059);
	--SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\ÈÕÔÂÉñ½ÌºÚ×Ü¹Ü.lua");
	SetNpcScript(nNpcIndex,"\\script\\missions\\cangjianshanzhuang\\wjz_mission_entry_npc.lua");
	
	nNpcIndex = CreateNpc("H¸m S¬n ®¹i v­¬ng","H¸m S¬n ®¹i v­¬ng",508,1750,3331);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\º³É½´óÍõDeath.lua");
end

function shenghuotai_npc_create()
	if oly_IsActivityOpen() == 1 then
		local nNpcIndex = CreateNpc("aoyunshenghuotai","Th¸nh Háa TuyÒn Ch©u",100,1327,3077);
		SetNpcScript(nNpcIndex,"\\script\\online\\olympic\\npc\\red_sh.lua");
		local nNpcIndex = CreateNpc("aoyunshenghuotai","Th¸nh Háa §¹i Lý",400,1444,2876);
		SetNpcScript(nNpcIndex,"\\script\\online\\olympic\\npc\\black_sh.lua");
		local nNpcIndex = CreateNpc("aoyunshenghuotai","Th¸nh Háa Thµnh §«",300,1853,3553);
		SetNpcScript(nNpcIndex,"\\script\\online\\olympic\\npc\\green_sh.lua");
		local nNpcIndex = CreateNpc("aoyunshenghuotai","Th¸nh Háa Ph­îng T­êng",500,1768,3136);
		SetNpcScript(nNpcIndex,"\\script\\online\\olympic\\npc\\yellow_sh.lua");
		local nNpcIndex = CreateNpc("aoyunshenghuotai","Th¸nh Háa T­¬ng D­¬ng ",350,1431,2810);
		SetNpcScript(nNpcIndex,"\\script\\online\\olympic\\npc\\blue_sh.lua");
		local nNpcIndex = CreateNpc("aoyunshenghuotai","Th¸nh Háa BiÖn Kinh",200,1470,2778);
		SetNpcScript(nNpcIndex,"\\script\\online\\olympic\\npc\\wuhuan_sh.lua");
	end
end

function Activity_Npc_Add_201209()
	--NPC create time£¬test modify
	if gf_CheckEventDateEx(71) == 1 then
		local nNpcIndex = CreateNpc("change","H»ng Nga",400,1480,3024);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\201208\\change.lua");
	end
end

function Qht_Activity_Event()
	--NPC´´½¨
	qht_create_npc_ds();
	--ÇåÀí
	qht_gs_daily_clean();
	--´´½¨mission
	qht_create_mission();
end

function Bkl_baoruong()
	local tbBKL_BaoRuong_Pos = {
					{508,1622,3247},	--Quang Minh §Ønh
					{508,1622,3238},
					{508,1632,3257},
					{508,1641,3259},
					{508,1632,3230},
					{508,1640,3229},
					{508,1649,3237},
					{508,1650,3247},
					{507,1614,3224},	--Long M«n TrÊn
					{507,1609,3230},
					{507,1614,3236},
					{507,1618,3230},
					{403,1478,2939},	--T©y Song B¶n N¹p Nam
					{403,1473,2947},
					{403,1478,2957},
					{403,1482,2947},
					{402,1493,2987},	--T©y Song B¶n N¹p B¾c
					{402,1475,3024},
					{402,1464,3012},
					{513,1472,2989},	--Hoµng L¨ng 1
					{513,1477,2983},
					{513,1482,2990},
					{514,1478,2984},	--Hoµng L¨ng 2
					{514,1485,2975},
					{514,1492,2967},
					{514,1471,2990},
					{410,1647,3278},	--Thiªn TÇm ThÊp 2
					{410,1631,3295},
					{410,1647,3310},
					{410,1662,3295},
					{411,1619,3269},	--Thiªn TÇm ThÊp 3
					{411,1611,3276},
					{411,1611,3261},
					{411,1603,3284},					
					{411,1603,3252},					
					{411,1603,3269},	
					{506,1375,2748},	--Mª Cung Sa M¹c
					{506,1367,2732},
					{506,1382,2763},
					{506,1357,2721},
					{510,1506,3025},	--D­îc V­¬ng §éng
					{510,1506,3037},
					{510,1498,3025},
					{510,1514,3025},
		}
	for i = 1, getn(tbBKL_BaoRuong_Pos) do
		local nNpcIndex = CreateNpc("R­¬ng tiÒn","Vâ L©m B¹ch Kim R­¬ng",tbBKL_BaoRuong_Pos[i][1],tbBKL_BaoRuong_Pos[i][2],tbBKL_BaoRuong_Pos[i][3]);
		SetNpcScript(nNpcIndex,"\\script\\vng\\bkl_box\\bkl_box_npc.lua");
	end
end

function tuyetanh_baoruong()	--QuyTy_baoruong
	local tbQT_BaoRuong_Pos = {
					{100, 1289, 3105},	--TuyÖt ¶nh
					{100, 1294, 3109}, 
					{100, 1302, 3115},
					{100, 1304, 3101},
					{500, 1810, 3014},
					{500, 1810, 2996},
					{500, 1803, 3007},
					{500, 1816, 3003},
					{400, 1400, 2934},
			}
	for i = 1, getn(tbQT_BaoRuong_Pos) do
		local nNpcIndex = CreateNpc("R­¬ng tiÒn","TuyÖt ¶nh BÝ B¶o",tbQT_BaoRuong_Pos[i][1],tbQT_BaoRuong_Pos[i][2],tbQT_BaoRuong_Pos[i][3]);
		SetNpcScript(nNpcIndex,"\\script\\vng\\quyty_box\\quyty2013_box_npc.lua");
	end
end
function chieuda_baoruong()	
	local tbQT_BaoRuong_Pos = {
					{300, 1824, 3670},	--ChiÕu D¹
					{300, 1836, 3666},
					{300, 1829, 3660},
					{300, 1829, 3675},
					{350, 1603, 2935},
					{350, 1603, 2945},
					{350, 1613, 2948},
					{350, 1612, 2935},		
					{400, 1406, 2925},		
			}
	for i = 1, getn(tbQT_BaoRuong_Pos) do
		local nNpcIndex = CreateNpc("R­¬ng tiÒn","ChiÕu D¹ Ph¸p B¶o",tbQT_BaoRuong_Pos[i][1],tbQT_BaoRuong_Pos[i][2],tbQT_BaoRuong_Pos[i][3]);
		SetNpcScript(nNpcIndex,"\\script\\vng\\quyty_box\\quyty2013_box_npc.lua");
	end
end
function xichtho_baoruong()	
	local tbQT_BaoRuong_Pos = {
					{200, 1439, 2716},	-- XÝch Thè
					{200, 1445, 2722},
					{200, 1438, 2728},
					{200, 1430, 2722},	
					{150, 1772, 3118}, 		
					{150, 1772, 3129}, 		
					{150, 1784, 3129}, 		
					{150, 1783, 3116}, 		
					{400, 1412, 2915},		
			}
	for i = 1, getn(tbQT_BaoRuong_Pos) do
		local nNpcIndex = CreateNpc("R­¬ng tiÒn","XÝch Thè Cæ VËt",tbQT_BaoRuong_Pos[i][1],tbQT_BaoRuong_Pos[i][2],tbQT_BaoRuong_Pos[i][3]);
		SetNpcScript(nNpcIndex,"\\script\\vng\\quyty_box\\quyty2013_box_npc.lua");
	end
end
function npcVanMay()
    local nNpcIndexVanMay = CreateNpc("Du Ph­¬ng T­íng SÜ", "ThÇy Bãi Siªu H¹ng",100,1274,2962);
    SetNpcScript(nNpcIndexVanMay, "\\script\\vng\\vanmay_daohuu\\vanmay_npc.lua");
end

function wujiang_task_npc_create()
	local nNpcIndex;
	local tbNpcPos = {
		{218, 1767, 3567},
		{218, 1778, 3562},
		{218, 1781, 3581},
		{218, 1731, 3550},
		{218, 1744, 3531},
		{218, 1749, 3502},
		{218, 1766, 3517},
		{218, 1775, 3486},
		{218, 1760, 3637},
		{218, 1769, 3564},
		{218, 1788, 3573},
		{218, 1805, 3535},
		{218, 1696, 3573},
		{218, 1663, 3589},
		{218, 1645, 3613},
		{218, 1695, 3556},
		{218, 1756, 3540},
		{218, 1711, 3530},
		{218, 1683, 3536},
		{218, 1810, 3523},
	};
	for i = 1, getn(tbNpcPos) do
			CreateNpc("shenmigongjianshou", "ThÇn bÝ cung tiÔn thñ", tbNpcPos[i][1], tbNpcPos[i][2], tbNpcPos[i][3]);
	end
	CreateNpc("chunyizhang", "ThuÇn NhÊt Ch­ëng", 107, 1453, 3006, 6);
	CreateNpc("chengfeng", "Tr×nh Phong", 304, 1463, 2844);
	nNpcIndex = CreateNpc("Nh¹c BÊt QuÇn", "(Nh¹c BÊt QuÇn)", 6024, 1658, 3094);
	SetNpcScript(nNpcIndex, "\\script\\ÊÀ½çµØÍ¼\\ÌúÕÆÉ½×¯\\npc\\yuebuqun.lua");
	nNpcIndex = CreateNpc("jiguan1", "C¬ quan", 6024, 1610, 2984);
	SetNpcScript(nNpcIndex, "\\script\\task\\npc\\jiguan1.lua");
	nNpcIndex = CreateNpc("jiguan2", "C¬ quan", 6024, 1503, 3099);
	SetNpcScript(nNpcIndex, "\\script\\task\\npc\\jiguan2.lua");
	nNpcIndex = CreateNpc("juchihu", "Cù XÝ Hæ", 6024, 1603, 2982);
	SetNpcDeathScript(nNpcIndex, "\\script\\task\\npc\\juchihu.lua");
	nNpcIndex = CreateNpc("shouwei", "Thñ VÖ thø 1", 6024, 1528, 3140);
	SetNpcScript(nNpcIndex, "\\script\\task\\npc\\shouwei.lua");
	nNpcIndex = CreateNpc("shouwei", "Thñ vÖ thø 2", 6024, 1451, 3065);
	SetNpcScript(nNpcIndex, "\\script\\task\\npc\\shouwei.lua");
	nNpcIndex = CreateNpc("shouwei", "Thñ vÖ thø 3", 6024, 1370, 2986);
	SetNpcScript(nNpcIndex, "\\script\\task\\npc\\shouwei.lua");
	nNpcIndex = CreateNpc("shouwei", "Thñ vÖ thø 4", 6024, 1441, 2912);
	SetNpcScript(nNpcIndex, "\\script\\task\\npc\\shouwei.lua");
	nNpcIndex = CreateNpc("shouwei", "Thñ vÖ thø 5", 6024, 1516, 2837);
	SetNpcScript(nNpcIndex, "\\script\\task\\npc\\shouwei.lua");
	nNpcIndex = CreateNpc("shouwei", "Thñ vÖ thø 6", 6024, 1593, 2909);
	SetNpcScript(nNpcIndex, "\\script\\task\\npc\\shouwei.lua");
	nNpcIndex = CreateNpc("shouwei", "Thñ vÖ thø 7", 6024, 1681, 2989);
	SetNpcScript(nNpcIndex, "\\script\\task\\npc\\shouwei.lua");
	nNpcIndex = CreateNpc("shouwei", "Thñ vÖ thø 8", 6024, 1600, 3070);
	SetNpcScript(nNpcIndex, "\\script\\task\\npc\\shouwei.lua");
	nNpcIndex = CreateNpc("linqinghai", "L©m Thanh H¶i", 502, 1579, 3218);
	SetNpcScript(nNpcIndex, "\\script\\Î÷±±Çø\\»ªÉ½\\npc\\linqinghai.lua");
	nNpcIndex = CreateNpc("Nh¹c Linh San", "(Nh¹c Linh San)", 6025, 1588, 3172);
	SetNpcScript(nNpcIndex, "\\script\\ÊÀ½çµØÍ¼\\Éñµî\\npc\\yuelingshan.lua");
	tbNpcPos = {
		{6025, 1599, 3156},
		{6025, 1591, 3161},
		{6025, 1606, 3163},
		{6025, 1602, 3172},
		{6025, 1609, 3175},
		{6025, 1563, 3190},
		{6025, 1573, 3197},
		{6025, 1572, 3181},
		{6025, 1585, 3195},
		{6025, 1587, 3211},
		{6025, 1594, 3226},
		{6025, 1586, 3219},
		{6025, 1611, 3209},
		{6025, 1599, 3204},
		{6025, 1630, 3186},
		{6025, 1623, 3206},
		{6025, 1613, 3192},
		{6025, 1622, 3177},
		{6025, 1606, 3198},
		{6025, 1600, 3206},
		}
	for i = 1, getn(tbNpcPos) do
			CreateNpc("tiezhangyinshi", "ThiÕt Ch­ëng Èn SÜ", tbNpcPos[i][1], tbNpcPos[i][2], tbNpcPos[i][3]);
	end
end

function meihuayingchun_npc_create()
	if gf_CheckEventDateEx(81) ~= 1 then
		return 0;
	end
	local nMonth = tonumber(date("%m"));
	
	if nMonth < 1 or nMonth > 2 then
		return 0;
	end
	local npcIdnex;
	nNpcIndex = CreateNpc("C©y Tø Linh 3_2", "Mai Vµng", 300, 1768, 3536);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	nNpcIndex = CreateNpc("C©y Tø Linh 3_2", "Mai Vµng", 200, 1407, 2832);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	nNpcIndex = CreateNpc("C©y Tø Linh 3_2", "Mai Vµng", 100, 1401, 2992);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	nNpcIndex = CreateNpc("C©y Tø Linh 3_2", "Mai Vµng", 150, 1703, 3136);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	nNpcIndex = CreateNpc("C©y Tø Linh 3_2", "Mai Vµng", 350, 1464, 2960);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	nNpcIndex = CreateNpc("C©y Tø Linh 3_2", "Mai Vµng", 400, 1512, 2977);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	nNpcIndex = CreateNpc("C©y Tø Linh 3_2", "Mai Vµng", 500, 1768, 3136);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
end

function zhenqi_battle_init()
	ZQ_NpcCreate();
	ZQ_CreateChannel();
end

--function kuafu_battle_init()
--	KF_Battle_BMR();
--end
function VBonus_NPC()
	local nVBONUS_STARTDATE = 13062000
	local nVBONUS_ENDDATE = 23080900
	local nDate = tonumber(date("%y%m%d%H"))
	if nDate >= nVBONUS_STARTDATE and nDate <= nVBONUS_ENDDATE then
		if GetGlbValue(1023) == 80 then
			nNpcIndex = CreateNpc("R­¬ng tiÒn","B¶o R­¬ng Phßng M¸y Th©n ThiÖn",200,1433,2866)
			SetNpcScript(nNpcIndex, "\\script\\vng\\vbonus\\top_chuyensinh.lua");
		end
	end
end


function Vip_NPC()
	if CFG_VipCare == 1 then
		local nNpcIndex = CreateNpc("NhÞ Hoµng Tö_§¹i Lý", "§¹i Sø Vip", 300,1776,3552);
		SetNpcScript(nNpcIndex, "\\script\\vng\\vipcare\\daisuvip.lua");	
	end
end

function dixuangong_join_npc()
	local nNpcIndex = CreateNpc("KLyunxihe", "C«n L«n Ph¸i V©n Hi Hßa", 500, 1778, 3097);
	SetNpcScript(nNpcIndex, "\\script\\missions\\dixuangong\\npc\\entrynpc.lua");
end

function biwu_3v3_init()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		ClearMapNpc(8000)
		P3v3_Enable(1);
		local nNpcIndex = CreateNpc("KLyunxihe", "§Æc sø §¹i Héi Tû Vâ", 8000,1404,2858);
		SetNpcScript(nNpcIndex, "\\script\\missions\\nvn\\3v3npc.lua");
	end
end

--ÎäÍõÈÎÎñ
function wuwang_task_createnpc()
	local nNpcIndex;
	nNpcIndex = CreateNpc("Chu BÊt HoÆc", "Chu BÊt HoÆc", 6073, 1589, 3213);
	SetNpcScript(nNpcIndex, "\\script\\ÊÀ½çµØÍ¼\\ÕòÑýÊÒ\\zhoubuhuo.lua");
	nNpcIndex = CreateNpc("Sµi Hoµng Nhi", "Sµi Hoµng Nhi", 6073, 1592, 3213)
	SetNpcScript(nNpcIndex, "\\script\\ÊÀ½çµØÍ¼\\ÕòÑýÊÒ\\caifenger.lua");
end

----°ï»á´óÊ¹
--function tong_melee_npc_create()
--	local nVersion,nCurGs = GetRealmType();
--	if SubWorldID2Idx(6028) ~= -1 and nCurGs == 1 then
--		local nNpcIndex = CreateNpc("ËÎ½«¾ü", "°ï»á´óÊ¹", 6028, 1624, 3221);
--		SetNpcScript(nNpcIndex, "\\script\\ÊÀ½çµØÍ¼\\¿ç·þÑÝÎä³¡\\npc\\tong_ambassagor.lua");
--	end
--end

----ÔÚ³É¶¼´´½¨¿ç·þ¹¦ÄÜÁì½±ÈËnpc
--function kuafu_lingjiang_npc_create()
--	local nVersion,nCurGs = GetRealmType();
--	if SubWorldID2Idx(300) ~= -1 and nCurGs == 0 then
--			local nNpcIndex = CreateNpc("ZM_jieyingren", "¿ç·þÁì½±ÈË", 300, 1855, 3556);
--			SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\kuafu_lingjiang_npc.lua");
--	end
--end

function AddTYNpc()
	--ÏÈ·æÑî×Ú±££¨200 1378 3063£© £¨100 1430 2791£©£¨300,1807,3349£©£¨350£¬1407£¬2853£©
	--ÏÈ·æÄÂ¹ðÓ¢£¨200 1372 3068£©£¨100 1436 2784£©£¨300,1803,3353£©£¨350£¬1413£¬2856£©
	local tNpcs = {
		{"TYT_XianfengYZB", "Tiªn Phong D­¬ng T«n B¶o", {350, 1407, 2853}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
		{"TYT_XianfengYZB", "Tiªn Phong D­¬ng T«n B¶o", {300, 1807, 3349}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
		{"TYT_XianfengYZB", "Tiªn Phong D­¬ng T«n B¶o", {200, 1378, 3063}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
		{"TYT_XianfengYZB", "Tiªn Phong D­¬ng T«n B¶o", {100, 1430, 2791}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
		{"TYT_XianfengMGY", "Tiªn Phong Méc QuÕ Anh", {350, 1413, 2856}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
		{"TYT_XianfengMGY", "Tiªn Phong Méc QuÕ Anh", {300, 1803, 3353}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
		{"TYT_XianfengMGY", "Tiªn Phong Méc QuÕ Anh", {200, 1372, 3068}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
		{"TYT_XianfengMGY", "Tiªn Phong Méc QuÕ Anh", {100, 1436, 2784}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
	};
	for i = 1, getn(tNpcs) do
		if SubWorldID2Idx(tNpcs[i][3][1]) ~= -1 then
			local nIndex = CreateNpc(tNpcs[i][1], tNpcs[i][2], tNpcs[i][3][1], tNpcs[i][3][2], tNpcs[i][3][3]);
			SetNpcScript(nIndex, tNpcs[i][4]);
		end
	end
end

function AddLifeSkillNpc()
	local npcIdx = CreateNpc("Bµ chñ", "§ç Tø N­¬ng", 350, 1441, 2914);
	SetNpcScript(npcIdx, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\dotunuong.lua");
end

function Plus123Pay()
	local nNpcIndexZzd = CreateNpc("Vâ L©m Minh Chñ1", "Ng­êi VËn ChuyÓn", 100, 1408, 3008);
    SetNpcScript(nNpcIndexZzd, "\\script\\vng\\plus123pay.lua");
end

function AddHeiYiZhuangShi()
	local tPos = {
		{219, 1671, 3217},
		{219, 1666, 3222},
		{219, 1663, 3229},
		{219, 1656, 3235},
		{219, 1663, 3246},
		{219, 1671, 3258},
		{219, 1682, 3249},
		{219, 1690, 3239},
		{219, 1683, 3226},
		{219, 1675, 3219},
	}
	for i =1, getn(tPos) do
		CreateNpc("heiyizhuangshi", "H¾c Y Tr¸ng SÜ", tPos[i][1], tPos[i][2], tPos[i][3]);
	end
	tPos = {
		{413,1863,3269},
		{8010,1601,3222},
	}
	for i =1, getn(tPos) do
		local nNpcIndex =CreateNpc("Thiªn V­¬ng Bang §å", "Xi Háa Gi¸o Kh¸n Thñ", tPos[i][1], tPos[i][2], tPos[i][3])
		SetNpcScript(nNpcIndex, "\\script\\Î÷ÄÏÇø\\ÁúÑÛ¶´¶þ²ã\\npc\\ò¿»ð½Ì¿´ÊØ.lua");
	end
	CreateNpc("Th­¬ng ¦ng", "Th­¬ng ¦ng", 8010, 1599, 3188, 6);
end

function AddActivtySnowMan()
	SendScript2VM("\\script\\online_activites\\201412\\tong_christmas_tree.lua", "tct_create_snowman()");
end

function AddSnowBattleNpc()
	local nMonth = tonumber(date("%m"));
	if nMonth >= 11 or nMonth <= 3 then
		SendScript2VM("\\script\\online\\snowbattle\\head.lua", "SB_SnowBattleNpcCreate()");
	end
end

function AddDecorateNpc()
	local nMonth = tonumber(date("%m"));
	if nMonth >= 1 and nMonth <= 2 then
		SendScript2VM("\\script\\online_activites\\201502\\spring_decorate.lua", "sd_CreateDecorateNpc()");
	end
end

function AddYpNpc()
	CreateNpcList({
		{"B¸ch HiÓu Sinh","Tr­ëng l·o B¸ch HiÓu Sinh",425,1788,3152,"\\script\\tong\\npc_talk.lua"},
		{"Hµn §an T©m","Th­ëng thiÖn ph¹t ¸c sø - Hµn §an T©m",425,1705,3174,"\\script\\tong\\npc_talk.lua"},
		{"D­¬ng Tam B¶o","D­¬ng gia gi¸o ®Çu D­¬ng Tam B¶o",425,1646,3225,"\\script\\tong\\npc_talk.lua"},
		{"TrÇn Tr¸c H¹o","TrÇn Tr¸c H¹o-Ngäc diÖn th­ sinh cña Vâ §ang",425,1642,3229,"\\script\\tong\\npc_talk.lua"},
		{"Tiªu Së Së","Thóy Yªn lôc y tiªn tö Tiªu Së Së",425,1751,3100,"\\script\\tong\\npc_talk.lua"},
		{"B¶o Ch©u Kim Cang","B¶o Ch©u Kim Cang cña ThiÕu L©m",425,1658,3217,"\\script\\tong\\npc_talk.lua"},
		{"Träng Khai Vinh","Träng Khai Vinh-Tr­ëng l·o h×nh ®­êng cña C¸i Bang",425,1740,3301,"\\script\\tong\\npc_talk.lua"},
		{"§­êng Méng L©m","§­êng Méng L©m-Ngäc diÖn tri thï cña §­êng M«n",425,1705,3315,"\\script\\tong\\npc_talk.lua"},
		{"TÇn V« MÖnh","TÇn V« MÖnh-T¶ hé ph¸p cña Ngò §éc",425,1721,3300,"\\script\\tong\\npc_talk.lua"},
		{"Ng« BÊt Duy","Ng« BÊt Duy-Tö hµ thiªn s­ cña C«n L«n",425,1853,3190,"\\script\\tong\\npc_talk.lua"},
		{"R­¬ng ®å Trung Nguyªn","Thñ Khè",425,1691,3229,"\\script\\tong\\npc_talk.lua"},
		{"Chñ cÇm ®å Trung Nguyªn","TiÖm T¹p Hãa",425,1723,3259,"\\script\\tong\\npc_talk.lua"},
		{"Ch­ëng d­îc Trung Nguyªn","Chñ D­îc ®iÕm",425,1734,3274,"\\script\\tong\\npc_talk.lua"},
		{"Vâ L©m Minh Hé VÖ","Vâ L©m Minh Hé VÖ",425,1703,3236,"\\script\\tong\\npc_talk.lua"},
		{"Vâ L©m Minh Hé VÖ","Vâ L©m Minh Hé VÖ",425,1717,3251,"\\script\\tong\\npc_talk.lua"},
		{"Vâ L©m Minh Hé VÖ","Vâ L©m Minh Hé VÖ",425,1640,3304,"\\script\\tong\\npc_talk.lua"},
		{"Vâ L©m Minh Hé VÖ","Vâ L©m Minh Hé VÖ",425,1655,3320,"\\script\\tong\\npc_talk.lua"},
		{"Vâ L©m Minh Hé VÖ","Vâ L©m Minh Hé VÖ",425,1668,3325,"\\script\\tong\\npc_talk.lua"},
		{"Vâ L©m Minh Hé VÖ","Vâ L©m Minh Hé VÖ",425,1675,3330,"\\script\\tong\\npc_talk.lua"},
		{"Vâ L©m Minh Hé VÖ","Vâ L©m Minh Hé VÖ",425,1630,3284,"\\script\\tong\\npc_talk.lua"},
		{"Vâ L©m Minh Hé VÖ","Vâ L©m Minh Hé VÖ",425,1635,3289,"\\script\\tong\\npc_talk.lua"},
		{"Vâ L©m Minh Hé VÖ","Vâ L©m Minh Hé VÖ",425,1837,3150,"\\script\\tong\\npc_talk.lua"},
		{"Vâ L©m Minh Hé VÖ","Vâ L©m Minh Hé VÖ",425,1844,3158,"\\script\\tong\\npc_talk.lua"},
	});
	
	CreateNpcList({
		--{"êµ×Óµ¤", "ÁùÉÈÃÅÉùÍûÊ¹", 6300, 1408, 3274, "\\script\\pop\\npc_liushanmen.lua"},
		--{"ïÚ¾ÖÁªÃËÉùÍûÊ¹", "ïÚ¾ÖÁªÃËÉùÍûÊ¹", 6300, 1347, 3251, "\\script\\pop\\npc_biaojulianmeng.lua"},
		--{"ÉÌ»áÁªÃËÉùÍûÊ¹", "ÉÌ»áÁªÃËÉùÍûÊ¹", 6300, 1354, 3128, "\\script\\pop\\npc_shanghuilianmeng.lua"},
		--{"ÈøåÈÃ÷¸¦", "ÎäÁÖÃËÉùÍûÊ¹ÈøåÈÃ÷¸¦", 6100, 1646, 3639, "\\script\\pop\\npc_sajiamingpu.lua"},
		--{"Àî°ÁÌì", "ÎäÁÖÃËÉùÍûÊ¹Àî°ÁÌì", 6200, 1484, 2645, "\\script\\pop\\npc_liaotian.lua"},
		--{"¶Î×Ó½Ü", "ÎäÁÖÃËÉùÍûÊ¹¶Î×Ó½Ü", 6000, 1585, 2756, "\\script\\pop\\npc_duanzijie.lua"},
		{"Tói cao thñ", "Hµnh trang bÞ thÊt l¹c", 311, 1480, 2988},
		{"Thi thÓ ThiÕu L©m chÊp sù", "Thi thÓ ThiÕu L©m chÊp sù", 311, 1365, 2966},
		{"Thi thÓ ®Ö tö C¸i Bang", "Thi thÓ ®Ö tö C¸i Bang", 216, 1783, 3621},
		{"Nga Mi ®¹i s­ tû", "Nga Mi ®¹i s­ tû", 302, 1593, 2805},
		{"Vâ §ang ®¹i s­ huynh", "Vâ §ang ®¹i s­ huynh", 302, 1591, 2896},
		{"Nga Mi tiÓu s­ muéi", "Nga Mi tiÓu s­ muéi", 302, 1533, 2895},
		{"ThiÕu L©m ®¹i ®Ö tö", "ThiÕu L©m ®¹i ®Ö tö", 302, 1600, 2888},
		{"V©n V« Nhai", "V©n V« Nhai", 302,1589,2872},
		{"H¾c y nh©n 1", "H¾c y nh©n 1", 216,1611,3572},
		{"H¾c y nh©n 2", "H¾c y nh©n 2", 216,1672,3677},
		{"H¾c y nh©n 3", "H¾c y nh©n 3", 216,1798,3298},
		{"H¾c y nh©n 4", "H¾c y nh©n 4", 216,1848,3575},
		{"NguyÖt Bµ Bµ", "NguyÖt Bµ Bµ", 408,1563,3172},
		{"Hßa Kh¶ Cam", "Hßa Kh¶ Cam", 420,1721,3587},
		{"Miªu Linh Hån Lùc SÜ", "Miªu LÜnh Kh«i Lçi Lùc", 420,1715,3595},
		{"Miªu Linh Hån Dòng SÜ", "Miªu Linh Hån Dòng SÜ", 420,1725,3596},
		{"ThÇn §µn Thèng LÜnh", "ThÇn §µn Thèng LÜnh", 6000,1476,2437},
	});

--	local nNpcIdx = CreateNpc("ÁéÏ¬½£Òà¿ÉÁê","ÁéÏ¬½£Òà¿ÉÁê",6300,1475,3228)
--	SetNpcScript(nNpcIdx,"\\script\\pop\\npc_yikelin.lua")
--	SetNpcRemoveScript(nNpcIdx, "\\script\\pop\\npc_yikelin.lua");
--	ChangeNpcToFight(nNpcIdx, 0, 6)
--
--	nNpcIdx = CreateNpc("ÆÆ»êµ¶ÁÖ·å", "ÆÆ»êµ¶ÁÖ·å", 6300, 1358, 3385);
--	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua");
--	SetNpcRemoveScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua");
--	ChangeNpcToFight(nNpcIdx, 0, 6)
--
--	nNpcIdx = CreateNpc("¹íÓ°±ÊÀîÖ¾½Ü", "¹íÓ°±ÊÀîÖ¾½Ü", 6300, 1283, 3236)
--	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lizhijie.lua")
--	SetNpcRemoveScript(nNpcIdx, "\\script\\pop\\npc_lizhijie.lua");
--	ChangeNpcToFight(nNpcIdx, 0, 6)
--
--	nNpcIdx = CreateNpc("ÎÞÇé×¦ÏôÇç", "ÎÞÇé×¦ÏôÇç", 6300, 1462, 3382)
--	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua")
--	SetNpcRemoveScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua");
--	ChangeNpcToFight(nNpcIdx, 0, 6)
--
--	nNpcIdx = CreateNpc("ïÚ¾Ö¼éÏ¸Àî³¾·ç", "ïÚ¾Ö¼éÏ¸Àî³¾·ç", 6400, 1780, 3173)
--	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lichenfeng.lua")
--	SetNpcRemoveScript(nNpcIdx, "\\script\\pop\\npc_lichenfeng.lua");
--	ChangeNpcToFight(nNpcIdx, 0, 6);

	CreateNpc("M¹c Yªn Vò", "Tô B¶o C¸c LiÔu B¨ng Thanh",425, 1795, 3187);
	--CreateNpc("zongbiaotou_yuntianqi", "ÌìÐÐïÚ¾Ö×ÜïÚÍ·ÌìÆô", 6300, 1363, 3244);
	CreateNpc("jinre_biaoshi", "Liªn Minh Tiªu Côc-Tiªu S­ Tinh NhuÖ", 6300, 1369, 3228);
	CreateNpc("jinre_biaoshi", "Liªn Minh Tiªu Côc-Tiªu S­ Tinh NhuÖ", 6300, 1360, 3239);
	CreateNpc("Tiªu Xa Tiªu Côc", "Tiªu Xa Tiªu Côc", 6300, 1365, 3234);
	CreateNpc("§¹i kú thµnh m«n", "Cê Tiªu Côc", 6300, 1371, 3224);
	CreateNpc("TriÒu ®×nh mËt th¸m ThÈm Trung", "TriÒu ®×nh mËt th¸m ThÈm Trung", 6400, 1722, 3275);
	CreateNpc("qianfuwren", "Chñ tiÒn trang V¹n gia TiÒn Phu Nh©n", 6300, 1330, 3134);
	CreateNpc("TiÓu B¹ch tr­ (bè)", "Tr­ TiÓu B¹ch", 6300, 1331, 3131);
	CreateNpc("linjiacheng", "Phó Hµo Th­¬ng Héi L©m Gia Thµnh", 6300, 1342, 3121);
	CreateNpc("Thñ Khè Th­¬ng Héi", "Thñ Khè Th­¬ng Héi", 6300, 1350, 3116);
	CreateNpc("Hoa ®¨ng1", " ", 6300, 1342,3115);
	CreateNpc("Hoa ®¨ng1", " ", 6300, 1352,3115);
	CreateNpc("B¶o r­¬ng Tµi nguyªn", "Kho b¸u", 6300, 1347,3111);
	CreateNpc("Sa m¹c b¶o r­¬ng", " ", 6300, 1344,3112);
	CreateNpc("Sa m¹c b¶o r­¬ng", " ", 6300, 1348,3113);
	CreateNpc("Sa m¹c b¶o r­¬ng", " ", 6300, 1351,3111);
	--CreateNpc("±ùÐÄ", "ÁùÉÈÃÅ·çÔÆ¶þÊ¹Ö®Ì¤ÔÆ", 6300, 1410, 3256);
	CreateNpc("Hoa ®¨ng3", " ", 6300, 1409,3248);
	CreateNpc("Hoa ®¨ng3", " ", 6300, 1415,3257);
	CreateNpc("Lôc PhiÕn cao thñ3", "Lôc PhiÕn M«n Tinh Anh", 6300, 1413, 3258);
	CreateNpc("Lôc PhiÕn cao thñ3", "Lôc PhiÕn M«n Tinh Anh", 6300, 1410, 3250);
	CreateNpc("Lôc PhiÕn cao thñ3", "Lôc PhiÕn M«n Tinh Anh", 6300, 1407, 3258);
	CreateNpc("§¹o nh©n l­u vong TriÓn T­êng", "§¹o nh©n l­u vong TriÓn T­êng", 6300,1411,3502);
end

function AddReborn3TaskNpc()
	CreateNpcList({
		{"T¸n Phæ Kham Bè","T¸n Phæ Kham Bè Quèc V­¬ng",6100,1808,3232,"\\script\\task\\npc\\npc_reborn3task.lua"},
		{"Lý §øc Dôc","Lý §øc Dùc Quèc V­¬ng",6200,1391,3126,"\\script\\task\\npc\\npc_reborn3task.lua"},
		{"Lý Nguyªn Tr©n","Lý Nguyªn Tr©n C«ng Chóa",6100,1842,3252,"\\script\\task\\npc\\npc_reborn3task.lua"},
		{"§o¹n Khinh HÇu","§oµn Khinh HÇu Quèc V­¬ng",6000,1541,2596,"\\script\\task\\npc\\npc_reborn3task.lua"},
		{"§oµn Ngäc Nhi","§oµn Ngäc Nhi C«ng Chóa",6000,1519,2592,"\\script\\task\\npc\\npc_reborn3task.lua"},
		{"Sa Ca Ninh Bè","Sa Ca Ninh Bè V­¬ng Tö",6100,1832,3247,"\\script\\task\\npc\\npc_reborn3task.lua"},
		{"tianyinkanshouren","Thiªn ¢m Gi¸o Thñ M«n Nh©n",425,1799,3375,"\\script\\task\\npc\\tyj_gatekeeper.lua"},
		{"tianyinkanshouren","Thiªn ¢m Gi¸o Thñ M«n Nh©n",8012,1590,3219,"\\script\\task\\npc\\tyj_gatekeeper.lua"},
		{"tianyinshenmiren","Thiªn ¢m ThÇn BÝ Nh©n",8012,1601,3177,""},
		{"tianyinshenmiren","Thiªn ¢m ThÇn BÝ Nh©n",8012,1608,3180,""},
		{"tianyinshenmiren","Thiªn ¢m ThÇn BÝ Nh©n",8012,1598,3179,""},
		{"tianyinshenmiren","Thiªn ¢m ThÇn BÝ Nh©n",8012,1594,3182,""},
		{"tianyinshenmiren","Thiªn ¢m ThÇn BÝ Nh©n",8012,1601,3186,""},
		{"tianyinshenmiren","Thiªn ¢m ThÇn BÝ Nh©n",8012,1588,3184,""},
		{"tianyinshenmiren","Thiªn ¢m ThÇn BÝ Nh©n",8012,1591,3191,""},
		{"tianyinshenmiren","Thiªn ¢m ThÇn BÝ Nh©n",8012,1586,3199,""},
		{"tianyinshenmiren","Thiªn ¢m ThÇn BÝ Nh©n",8012,1589,3203,""},
		{"tianyinshenmiren","Thiªn ¢m ThÇn BÝ Nh©n",8012,1593,3199,""},
		{"B¸ch HiÓu Sinh","B¸ch HiÓu Sinh Tr­ëng L·o",8012,1605,3213,"\\script\\task\\npc\\elder_baixiaosheng.lua"},
	});
end