--文件名：进度条回调主函数
--功    能：启动进度条后成功或失败调用的函数
--程序开发人：帅哥
--脚本需求提交人：村长
--开发时间：20070126
--备	注：	调用：DoWait(n1,n2,n3) n1: 成功后调用的函数的索引 n1: 失败后调用的函数的索引 n3: 进度条等待时间
--		回调：main(deal_suc,deal_fail,deal_flag)，第一个参数是成功调用标志，第二个参数是失败调用标志，第三个是处理成功与否的标志。所有调用第一、二个参数不能重复。
--		如：10秒钟的开箱时间。DoWait(1,2,10)，客户端出现10秒的进度条，成功（main(1,2,1)）或失败（main(1,2,0)）均调用回调函数，只是成功传入main函数的deal_flag参数为1，失败为0
--		如有疑问请咨询村长或帅哥。
--赵贵春公共文件
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
Include("\\script\\gongcheng\\prison\\prison_head.lua")
Include("\\script\\task\\npc\\储备物资.lua")
Include("\\script\\lib\\writelog.lua");
--2010年1月春节活动
Include("\\script\\online_activites\\2010_01\\activites_01\\head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\settings\\static_script\\online\\olympic\\oly_define.lua")

--============================公共变量定义区===============================
g_szThisFile = "\\script\\global\\action_bar_callback.lua"

---------帮会攻城战之资源保护相关
	--1、记录是否被占用
	box_belong_ID = 2					--该值初始化为1
	--2、周序数
	box_open_week_ID = 4				--该值初始化为0
	--开始打开的时间
	box_open_time_ID = 5				--初始化为0
	--NPC索引记录ID
	TasktempID_npc_index = 166
	--城郊对应的城市
	Tb_map_2_city = {}
	Tb_map_2_city[105] = 100
	Tb_map_2_city[108] = 100
	Tb_map_2_city[304] = 300
	Tb_map_2_city[308] = 300
	Tb_map_2_city[218] = 350
	Tb_map_2_city[406] = 350
--西北区关卡第四关ID
	grass_index_TasktempID = 188		--存放草的索引
	grass_id_state = 0					--存放该草目前的状态，0为初始状态，1为使用拔出状态
	grass_id_sys_time = 1			--存放该操上次操作的时间，与上一条配合完成占有机制
	grass_kill_num = 1424			--拔除了多少药人草
--结束
--===============================主逻辑区==================================
function main(deal_suc,deal_fail,deal_flag)
	--请通过填table的方式实现调用对应函数---------------
	----------------------------------------------------
	local deal_action_total = {
			--对应调用函数，奇数索引表示成功所调用的函数，偶数索引表示失败所调用的函数
			[1] = af_spring_huashan_open_suc,		--2007年春节华山竞技活动
			[2] = af_spring_huashan_open_fail,	
			[3] = af_killer_hall_open_box_suc,		--杀手堂宝箱
			[4] = af_killer_hall_open_box_fail,	
			[5] = af_arrest_finish,
			[6] = af_arrest_fail,
			[7] = af_conf_resource_open_suc,		--帮会资源保护 
			[8] = af_conf_resource_open_fail,
			[9]	= conf_task_open_suc,
			[10]= conf_task_open_fail,
			[11] = northwest_stage4_grass_suc,
			[12] = northwest_stage4_grass_fail,
			[13] = confirm_lucky_award_suc,
			[14] = confirm_lucky_award_fail,
			[15] = confirm_translife_suc,
			[16] = open_vet_201001_hongbao_success,
			[17] = open_vet_201001_hongbao_failed,
			[19] = open_newres_success,
			[20] = open_newres_failed,
			[21] = open_golden_chest_success,	
		  	[22] = FG_GatherSuccess,
		  	[23] = FG_GatherFailure,
		  	[24] = gtask_WuZi_116_suc,
		  	[25] = gtask_WuZi_116_fail,
		  	[26] = bkl_openbox_suc,
		  	[27] = bkl_openbox_fail,
		  	[28] = tuyetanh_openbox_suc,
		  	[29] = tuyetanh_openbox_fail,
		  	[30] = chieuda_openbox_suc,
		  	[31] = xichtho_openbox_suc,
			[32] = uminhhoa_suc,
			[33] = uminhhoa_fail,
			
			--我们将使用100以后的索引
			--We will use the table index after 100
			[101] = ttd_talk_suc,
			[102] = ttd_talk_fail,
			[103] = gtask_Mfzp_80_suc,
			[104] = gtask_Mfzp_80_fail,
			[105] = qht_diji_box_suc,
			[106] = qht_diji_box_fail,
			[107] = qht_zhongji_box_suc,
			[108] = qht_zhongji_box_fail,
			[109] = qht_gaoji_box_suc,
			[110] = qht_gaoji_box_fail,
			[111] = zq_battle_song_lingqi_suc,
			[112] = zq_battle_song_lingqi_fail,
			[113] = zq_battle_liao_lingqi_suc,
			[114] = zq_battle_liao_lingqi_fail,
			[115] = vet_201305_refinedan_suc,
			[116] = vet_201305_refinedan_fail,
			[117] = tm_use_siling_keyin_suc,
			[118] = tm_use_siling_keyin_fail,
			[119] = eyt_open_flag_suc,
			[120] = eyt_open_flag_fail,		
			[121] = yp1_tree_steal_suc,
			[122] = yp1_tree_steal_fail,
			[123] = yp_read_book_suc,
			[124] = yp_read_book_fail,
			[125] = yp_get_book_sur,
			[126] = yp_get_book_fail,	
			[127] = yp_get_tree_sur,
			[128] = yp_get_tree_fail,	
			[129] = yp_random_fu_sur,
			[130] = yp_random_fu_fail,
			--the max table index is 255
	}
	if deal_flag == 1 then
		deal_action_total[deal_suc]();
	else
		deal_action_total[deal_fail]();
	end;
end

--=====================2007年春节华山竞技活动=========================
--***********************开宝箱成功处理函数****************************
function af_spring_huashan_open_suc()
	if IsTongMember() == 0 then
		Say("Ph秈 gia nh藀 bang h閕 m韎 nh苩 頲 b秓 rng!", 0)
		return
	end

	local npc_index = GetGlbValue(501)
	if npc_index == 0 or GetNpcName(npc_index) ~= "B秓 rng Hoa s琻" then			--判断箱子是否存在
		return
	end
	SetUnitCurStates(npc_index,2,1)
	SetUnitCurStates(npc_index,4,zgc_pub_day_turn(1))						--存入今天时间
	SetNpcLifeTime(npc_index,0)

--	local player_sex = GetSex()
	local add_flag = 0
	local prize_name = ""
	local nRandom = random(1,100)
	
	if nRandom <= 50 then
		add_flag = AddItem(0,102,15,1,1,2,24,3,14,0,0)
		prize_name = "H錸g Ph� Th髖 H� Th﹏ Ph�"
	else
		add_flag = AddItem(0,102,20,1,1,2,24,3,14,0,0)
		prize_name = "To祅 Th筩h Gi韎 Ch�"
	end
	--奖励增加是否成功的相关处理
	if add_flag == 1 then
		Msg2Player("B筺 m� b秓 rng, nh薾 頲: "..prize_name.."!")
		Msg2SubWorld(format("%s  畂箃 頲 b秓 rng Hoa S琻, trong b秓 rng c� ch鴄: %s ", GetName(), prize_name))
		WriteLogEx("Bang hoi tinh anh","nh薾","1",prize_name,"",GetTongName())
	else
		WriteLog("[Ho箃 ng bang h閕 tinh anh] : ".."Ngi ch琲 "..GetName().." Nh薾 頲 ph莕 thng:"..prize_name.." Th猰 th蕋 b筰, k� hi謚:"..add_flag)
	end

	local tBook =
	{
		[1] = {"Chi猰 Y Ph�",	0,	107,	66,	1,	},
		[2] = {"T� H� M藅 t辌h",	0,	107,	65,	1,	},
		[3] = {"Thi猲 H� M藅 t辌h",	0,	107,	64,	1,	},
	}

	for i=1, getn(tBook) do
		add_item_first_tong(tBook[i])
	end

	local tWeapon =
	{
		[1] = {"Чi H祇 L玦 Thng",	0,	6,	108,	130,	},
		[2] = {"Th莕 Cung",		0,	4,	119,	130,	},
		[3] = {"V筺 Nh蒼",		0,	0,	14,		220,	},
		[4] = {"A La H竛 Trng",	0,	8,	97,		100,	},
		[5] = {"C� лnh",		0,	3,	64,		200,	},
		[6] = {"Li謙 Di謒",		0,	5,	40,		200,	},
		[7] = {"Th莕 H祅h",		0,	9,	86,		130,	},
		[8] = {"H醓 Tinh",		0,	2,	36,		90,		},
		[9] = {"Hi Nh﹏ C莔",	0,	10,	75,		140,	},
		[10] = {"M穘h h�",		0,	11,	12,		200,	},
		[11] = {"L╪g Phong",		0,	7,	12,		200,	},
		[12] = {"M穘 Thi猲 Hoa V�",	0,	1,	53,		130,	},
	}
	local tAttribute =
	{
		[1]  	= {28,	100, 	{{5,500}, {6,300}, {7,200}}},
		[2]  	= {41,	80, 	{{5,800}, {6,200}}},
		[3]  	= {42,	80, 	{{5,800}, {6,200}}},
		[4]  	= {63,	20, 	{{5,900}, {6,95}, {7,5}}},
		[5]  	= {64,	20, 	{{5,900}, {6,95}, {7,5}}},
		[6]  	= {7, 		50, 	{{5,700}, {6,250}, {7,50}}},
		[7] 	= {94,	70, 	{{5,500}, {6,300}, {7,200}}},
		[8]  	= {95,	70, 	{{5,500}, {6,300}, {7,200}}},
		[9]  	= {96,	70, 	{{5,500}, {6,300}, {7,200}}},
		[10] 	= {97,	70, 	{{5,500}, {6,300}, {7,200}}},
		[11] 	= {98,	70, 	{{5,500}, {6,300}, {7,200}}},
		[12] 	= {69,	80, 	{{5,500}, {6,300}, {7,200}}},
		[13] 	= {99,	80,	{{2,700}, {3,300}}},
		[14] 	= {30,	50, 	{{5,500}, {6,300}, {7,200}}},
		[15] 	= {50,	20, 	{{6,500}, {7,500}}},
		[16] 	= {49,	20, 	{{6,500}, {7,500}}},
		[17] 	= {102,	15,	{{5,800}, {6,200}}},
		[18] 	= {27,	15, 	{{3,950}, {4,50}}},
		[19] 	= {85,	10, 	{{3,600}, {4,400}}},
		[20] 	= {86,	10, 	{{3,600}, {4,400}}},
	}
	local nRandomWeapon = random(1, getn(tWeapon))
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}

	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib(tAttribute,nPerTurn)
		nPerTurn = nPerTurn - tAttribute[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib(tAttribute[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute[nRandomAttr][1]
		tremove(tAttribute, nRandomAttr)
	end
	
	add_flag = AddItem(tWeapon[nRandomWeapon][2],tWeapon[nRandomWeapon][3],tWeapon[nRandomWeapon][4],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon[nRandomWeapon][1]
	if add_flag == 1 then
		Msg2Player("B筺 m� b秓 rng, nh薾 頲: "..prize_name.."!")
		Msg2SubWorld(format("%s  畂箃 頲 b秓 rng Hoa S琻, trong b秓 rng c� ch鴄: %s ", GetName(), prize_name))
		WriteLogEx("Bang hoi tinh anh","nh薾","1",prize_name,"",GetTongName())
	else
		WriteLog("[Ho箃 ng bang h閕 tinh anh] : ".."Ngi ch琲 "..GetName().." Nh薾 頲 ph莕 thng:"..prize_name.." Th猰 th蕋 b筰, k� hi謚:"..add_flag)
	end

	local nDateStart = tonumber(date("%y%m%d"))		--记录帮众可以领奖的起始时间
	local nPrizeFlag = 1							--记录帮主是否可以领取奖励(只能领取一次，领取奖励后即设置为0)
	AddRelayShareData(RELAY_DB_FIRSTTONG_JPZ, 0, 0, g_szThisFile, "", 0, "0", "dds", nDateStart, nPrizeFlag, GetTongName())
	
	--创建胜利者旗帜	
	local flag_index = CreateNpc("Ti猽 s�-i tho筰",GetTongName(),GetWorldPos())
	SetNpcLifeTime(flag_index,21600)
	
	Msg2Global("Ho箃 ng bang h閕 tinh anh  k誸 th骳, bang h閕 tinh anh l莕 n祔 l�:  "..GetTongName())
	mf_Talk2Camp(46, 0, "Ho箃 ng bang h閕 tinh anh  k誸 th骳, bang h閕 tinh anh l莕 n祔 l�:  "..GetTongName());
	for i=1, 3 do
		AddGlobalNews("Ho箃 ng bang h閕 tinh anh  k誸 th骳, bang h閕 tinh anh l莕 n祔 l�:  "..GetTongName())
	end

	mf_SetMissionV(46,7,1,969)
	mf_SetMissionV(46,1,3,969)
	WriteLogEx("Bang hoi tinh anh","m� b秓 rng th祅h c玭g","","","",GetTongName())
end

function get_random_attrib(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][2]
		if nRandom <= nBase then
			return i			
		end
	end	
end

function add_item_first_tong(tItem)
	local szLogTitle = "[Ho箃 ng bang h閕 tinh anh] : "
	local nRetCode = AddItem(tItem[2],tItem[3],tItem[4],tItem[5]);
	if nRetCode == 1 then
		Msg2Player("B筺 m� b秓 rng, nh薾 頲: "..tItem[1].."!")
		WriteLog(szLogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." c竔 "..tItem[1]);
	else
		WriteLog(szLogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." c竔 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

--***********************开宝箱失败处理函数****************************
function af_spring_huashan_open_fail()
	local npc_index = GetGlbValue(501)
	if npc_index == 0 or GetNpcName(npc_index) ~= "B秓 rng Hoa s琻" then
		return
	end
--	SetUnitCurStates(npc_index,2,0)
end

--***************帮会资源保护任务箱子开启（成功）**********************
function af_conf_resource_open_suc()
	local npc_index = GetTaskTemp(TasktempID_npc_index)			--获取NPC索引
	if GetNpcName(npc_index) ~= "B秓 rng T礽 nguy猲" then
		return
	end
	if GetFightState() == 0 then
		return
	end
	if GetPKFlag() == 0 then
		Talk(1,"","B筺 ph秈 � tr筺g th竔 chi課 u m韎 c� th� m� rng.")
		return
	end
	SetUnitCurStates(npc_index,box_open_week_ID,zgc_pub_day_turn(7))
	SetUnitCurStates(npc_index,box_belong_ID,1)
	--把对应地方的钱减少
	local mapid = GetWorldPos()
	local map_2_city = Tb_map_2_city[mapid]
	if map_2_city == nil then
		print("err2")
		return
	end
	if AddCityBoxCount(map_2_city,-1) == 1 then
		if random(1,100) <= 33 then
			Earn(1000000)
			Msg2Player("B筺  m� 頲 B秓 rng, nh薾 頲 100 v祅g!")
			WriteLogEx("Cong Thanh Chien","M� Rng T礽 Nguy猲",100,"v祅g")
		else
			local nRet, nItemIdx = AddItem(2,1,1210,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,24*60*60)
				Msg2Player("B筺  m� 頲 B秓 rng, nh薾 頲 B秓 rng T礽 nguy猲!")				
			end
			WriteLogEx("Cong Thanh Chien","M� Rng T礽 Nguy猲",1,"B秓 rng T礽 nguy猲")
		end
		Msg2SubWorld("Ngi ch琲: "..GetName().." M� B秓 rng T礽 nguy猲 th祅h c玭g!")
		local flag_index = CreateNpc("Ti猽 s�-i tho筰","Ngi m�:"..GetName(),GetNpcWorldPos(npc_index))
		SetNpcLifeTime(flag_index,21600)	
	end
	print("af_conf_resource_open_suc end",map_2_city,c)
end
--***************帮会资源保护任务箱子开启（失败）**********************
function af_conf_resource_open_fail()
	print("af_conf_resource_open_fail")
	local npc_index = GetTaskTemp(TasktempID_npc_index)			--获取NPC索引
	SetUnitCurStates(npc_index,box_belong_ID,1)
	SetUnitCurStates(npc_index,box_open_time_ID,0)
	SetTaskTemp(TasktempID_npc_index,0)
end

function open_newres_success()
	local npc_index = GetTaskTemp(TSK_TMP_NEWRES)
	if GetNpcName(npc_index) == "" then
		return
	end
	if GetFightState() == 0 then
		return
	end	
	SetUnitCurStates(npc_index,box_belong_ID,1)	
	local mapid = GetWorldPos()	
	if mapid ~= 606 then
		return
	end
	award_point()
end

function open_newres_failed()
	local npc_index = GetTaskTemp(TSK_TMP_NEWRES)
	SetUnitCurStates(npc_index,box_belong_ID,1)
	SetUnitCurStates(npc_index,box_open_time_ID,0)
	SetTaskTemp(TSK_TMP_NEWRES,0)
end

function award_point()
	local nChuyenSinh = GetTranslifeCount()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nLev_GetExp = 0
	local nMapID1, nX1, nY1 = GetWorldPos()
	local nMapID2, nX2, nY2 = 0,0,0
	local nTeamSize = GetTeamSize();
	local nTimeBegin = GetTask(TSK_TIME_KICHHOAT_TNC) -- th猰 t猲 task 2285
	local nRemain = GetTime() - nTimeBegin
	nRemain = 60 - floor(nRemain/60)
	if nRemain < 0 then
		nRemain = 0
	end
	if nPhucSinh >= 1 then
		nLev_GetExp = 5*100 + nPhucSinh*120 + GetLevel()
	else
		nLev_GetExp = nChuyenSinh*100 + GetLevel()
	end
	
	local nTypeDouble = floor(GetTask(TSK_NEWRES_POINT)/10000)
	if nTeamSize == 0 or nTeamSize == 1 then		
		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 1 then
			local nPoint = mod(GetTask(TSK_NEWRES_POINT),10000)--GetTask(TSK_NEWRES_POINT)
			if nPoint < 2500 then
				if 0 < nRemain then
					SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1 * nTypeDouble)
					ModifyExp(nLev_GetExp * 8 * nTypeDouble)
					Msg2Player("Th阨 gian h� tr� c遪 l筰 l�: "..nRemain.." ph髏")
				else
					SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1)
					ModifyExp(nLev_GetExp * 8)
				end
			end
			nPoint = mod(GetTask(TSK_NEWRES_POINT),10000)--GetTask(TSK_NEWRES_POINT)
			if nPoint < 2500 then
				Msg2Player("T輈h l騳 thu th藀: "..nPoint.."/2500")
			else
				Msg2Player("T輈h l騳 thu th藀: 2500/2500")
			end
			if nPoint >= 2500 then
				gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,2)
				TaskTip("B筺  ho祅 th祅h nhi謒 v� thu th藀 t礽 nguy猲.")
				WriteLogEx("TL TNChien","Ho祅 th祅h nhi謒 v�")
			end
		end
	else
	    	local nOldIndex = PlayerIndex;
	    	for i = 1, nTeamSize do
	     		PlayerIndex = GetTeamMember(i);
	     		nMapID2, nX2, nY2 = GetWorldPos()
	     		if nMapID2 == 606 and GetFightState()== 1 then
	     			if IsPlayerDeath() == 0 then
		     			if DistanceBetweenPoints(nMapID1, nX1, nY1, nMapID2, nX2, nY2) <= 23 then
				        	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 1 then
				        		local nTypeDoublePT = floor(GetTask(TSK_NEWRES_POINT)/10000)
							local nPoint = mod(GetTask(TSK_NEWRES_POINT),10000) --GetTask(TSK_NEWRES_POINT)
							local nTimeBeginPT = GetTask(TSK_TIME_KICHHOAT_TNC) -- th猰 t猲 task 2285
							local nRemainPT = GetTime() - nTimeBeginPT
							nRemainPT = 60 - floor(nRemainPT/60)
							if nRemainPT < 0 then
								nRemainPT = 0
							end
							local nChuyenSinh_mem = GetTranslifeCount()
							local nPhucSinh_mem = GetPlayerRebornParam(0)
							local nLev_GetExp_mem = 0
							if nPhucSinh_mem >= 1 then
								nLev_GetExp_mem = 5*100 + nPhucSinh_mem*120 + GetLevel()
							else
								nLev_GetExp_mem = nChuyenSinh_mem*100 + GetLevel()
							end
							if nPoint < 2500 then
								if 0 < nRemainPT then
									SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) + (1 * nTypeDoublePT - 1))
									ModifyExp(nLev_GetExp_mem * 8 * ( nTypeDoublePT - 1))
									Msg2Player("Th阨 gian h� tr� c遪 l筰 l�: "..nRemainPT.." ph髏")
								end
								SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1)
								ModifyExp(nLev_GetExp_mem * 8)							
							end
							nPoint = mod(GetTask(TSK_NEWRES_POINT),10000) --GetTask(TSK_NEWRES_POINT)
							if nPoint < 2500 then
								Msg2Player("B筺  thu th藀 th祅h c玭g: "..nPoint.."/2500")
							else
								Msg2Player("B筺  thu th藀 th祅h c玭g: 2500/2500")
							end
							if nPoint >= 2500 then
								gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,2)
								TaskTip("B筺  ho祅 th祅h nhi謒 v� thu th藀 t礽 nguy猲.")
								WriteLogEx("TL TNChien","Ho祅 th祅h nhi謒 v�")
							end
						end
					end
				end
			end
		end
	    	PlayerIndex = nOldIndex;
	end
end

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end;


function af_killer_hall_open_box_suc()
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	local sNpcName = GetNpcName(nNpcIdx);
	if sNpcName == "Hng ch� B秓 rng" then
		KH_Give_Award(NPC_TYPE_XIANGZHU);
	elseif sNpcName == "Ph� Л阯g Ch� B秓 Rng" then
		KH_Give_Award(NPC_TYPE_FUTANGZHU);	
	elseif sNpcName == "L� Чi Ch駓 B秓 Rng" then
		KH_Give_Award(NPC_TYPE_LIDAZUI);
	else
		WriteLog("[S竧 Th� 阯g b竜 l鏸]: L骳 m� rng ph竧 hi謓 t猲 Npc sai:"..tostring(sNpcName));
	end;
end;

function af_killer_hall_open_box_fail()
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	KH_SetUnit_CurStates(nNpcIdx,2,0)
end;
function af_arrest_finish()
	if GetTaskTemp(10) ~= 2132 then		-- 这里做一下判断，否则很有可能是客户端随意发上来的数据
		return
	end
	SetTaskTemp(10, 0)
	local szSelfName = GetName()
	-- 名捕是哪个帮派的
	local szTixiaTong = GetTongName()
	if IsTongMember() == 0 then
		szTixiaTong = ""
	end
	-- 做距离判断
	local nSelfMapID, nSelfX, nSelfY = GetWorldPos()
	local nTarMapID, nTarX, nTarY
	if GetItemCount(2,1,1211) <= 0 then
		Msg2Player("Ph秈 c� 1 Th祅h Й T莔 N� L謓h m韎 c� th� truy n�.")
		return
	end
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTask(450)
	if PlayerIndex > 0 then
		nTarMapID, nTarX, nTarY = GetWorldPos()
		local nDist = distance_between_points(nSelfMapID, nSelfX, nSelfY, nTarMapID, nTarX, nTarY)
		if nDist ~= -1 and nDist <= 20 then	-- 在有效距离之内
			-- 抓到牢里面去
			if IsPlayerDeath() > 0 then			-- 如果是死的，先原地活了再飞
				RevivePlayer(0)
			end
			
			local nPrisonMap = citywar_get_throw_where()
			print("nPrisonMap = "..nPrisonMap)
			if nPrisonMap ~= nil and nPrisonMap > 0 then
				CleanInteractive()
				if NewWorld(nPrisonMap, tCityWarPrisonPos[1], tCityWarPrisonPos[2]) == 1 then
					SetPlayerRevivalPos(nPrisonMap, nPrisonMap)
					
					StallEnable(0)	-- 不能摆摊
					ForbidRead(1)	--不能修书
					UseScrollEnable(0)	--禁止使用回城
					SetFightState(0)	-- 战斗状态
					CreateTrigger(1, 1109, CITYWAR_STEP_TRIGGER)		-- 牢房时间计步器
					ContinueTimer(GetTrigger(CITYWAR_STEP_TRIGGER))
					-- 根据被抓的一瞬间判断要交多少钱
					local nPay = 0
					local nRet = IsTongMember()
					if nRet == 0 then								-- 无帮派
						nPay = 1
					elseif nRet == 1 or nRet == 2 or nRet == 3 then	-- 帮主,副帮主和长老
						nPay = 100
					elseif nRet == 4 then
						nPay = 50
					elseif nRet == 5 then
						nPay = 10
					elseif nRet ~= 0 then
						nPay = 3
					end
					
					-- 如果是70级一下,就不用交钱
					if GetLevel() < 70 then
						nPay = 0
					end
					CustomDataSave("tongcitywar_arrest_tong", "sd", szTixiaTong, nPay)	--  记录抓你名捕所属的帮会和需要交多少钱
					Msg2Player("B筺 b� "..szSelfName.."Truy n�")
					PlayerIndex = nOldPlayer
					DelItem(2,1,1211,1)
				end
			end
		else
			Msg2Player("B筺  tr鑞 tho竧 th祅h c玭g s� truy n� c馻 "..szSelfName..". ")
			PlayerIndex = nOldPlayer
			Msg2Player("M鬰 ti猽 kh玭g � trong ph筸 vi hi謚 l鵦, truy n� th蕋 b筰")
		end
	end
	PlayerIndex = nOldPlayer
end

function af_arrest_fail()
	if GetTaskTemp(10) ~= 2132 then
		return
	end
	SetTaskTemp(10, 0)
	local szSelfName = GetName()
	Msg2Player("Truy n� b� gi竛 畂筺, truy n� th蕋 b筰")
	local nOldPlayer = PlayerIndex
	-- 
	PlayerIndex = GetTask(450)
	Msg2Player("B筺  tr鑞 tho竧 th祅h c玭g s� truy n� c馻 "..szSelfName..". ")
	PlayerIndex = nOldPlayer
end
--=================帮会步非烟任务宝箱拾取机制修改================
function conf_task_open_suc()
		local npc_index = GetTaskTemp(166) 
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		local add_flag_total = 0
		local npc_name = GetNpcName(npc_index)
		if npc_name == "Rng c馻 C玭 L玭 N�  l筰" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,526,1)
			if add_flag == 0 then
				WriteLog("Nhi謒 v� BOSS ng蓇 nhi猲 bang h閕: C玭 L玭 N� b� l筰 rng th蕋 b筰, k� hi謚:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "Rng c馻 B飅 H祅g  l筰" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,527,1)
			if add_flag == 0 then
				WriteLog("Nhi謒 v� BOSS ng蓇 nhi猲 bang h閕: B飅 H祅g b� l筰 rng th蕋 b筰, k� hi謚:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "Rng c馻 Li評 Ngh�  l筰" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,528,1)
			if add_flag == 0 then
				WriteLog("Nhi謒 v� BOSS ng蓇 nhi猲 bang h閕: Li評 Ngh� b� l筰 rng th蕋 b筰, k� hi謚:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "Rng c馻 H錸g Tuy課  l筰" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,529,1)
			if add_flag == 0 then
				WriteLog("Nhi謒 v� BOSS ng蓇 nhi猲 bang h閕: H錸g Tuy課 b� l筰 rng th蕋 b筰, k� hi謚:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "Rng s総 c馻 H� C秐h Th緉g" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,530,1)
			if add_flag == 0 then
				WriteLog("Nhi謒 v� BOSS ng蓇 nhi猲 bang h閕: Th猰 rng s総 H� C秐h Th緉g th蕋 b筰, k� hi謚:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "Rng s総 c馻 Nhi誴 Чi Ch飝" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,531,1)
			if add_flag == 0 then
				WriteLog("Nhi謒 v� BOSS ng蓇 nhi猲 bang h閕: Th猰 rng s総 Nhi誴 Чi Ch飝 th蕋 b筰, k� hi謚:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "B秓 rng c馻 B� Phi Y猲" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,532,1)
			if random(1,100) <= 30 then
				AddItem(2,1,30130,2)
				SendTongMessage(GetName().." Nh苩 頲 2 Phi Y猲 Th筩h.")
				WriteLogEx("Mo ruong Bo Phi Yen","nh薾",2,"Phi Y猲 Th筩h")
			end			
			AddItem(2,1,30071,1)
			SendTongMessage(GetName().." Nh苩 頲 1 Nh﹎ S﹎ V筺 N╩.")
			WriteLogEx("Mo ruong Bo Phi Yen","nh薾",1,"Nh﹎ S﹎ V筺 N╩")
			if add_flag == 0 then
				WriteLog("Nhi謒 v� BOSS ng蓇 nhi猲 bang h閕: Th猰 B竎h B秓 rng B� Phi Y猲 th蕋 b筰, k� hi謚:"..add_flag)
			else
				add_flag_total = 1
				AddGlobalNews(GetTongName().."H� g鬰 B� Phi Y猲 nh薾 頲 B竎h B秓 rng!")
			end
		end
		if add_flag_total == 1 then
			SendTongMessage(GetName().." Nh苩 頲 "..npc_name..".")
			Msg2SubWorld(GetTongName().." Bang h閕: "..GetName().." Nh苩 頲 "..npc_name..".")
			WriteLog("Nhi謒 v� B� Phi Y猲: Ngi ch琲 ["..GetName().."] t筰 Map :"..GetWorldPos() .."Nh苩 頲 "..npc_name)
		end
end

function conf_task_open_fail()
	local npc_index = GetTaskTemp(166) 
	SetUnitCurStates(npc_index,Box_belong_ID,0)
end
--=================西北区关卡第四关药草拔除======================
Tb_stage4_buff_info = {
	{61210625,60,21},
	{61210626,60,22},
	{61210627,60,23},
	{61210628,60,24},
	{61210629,60,25},
}
--拔除成功
function northwest_stage4_grass_suc()
	local grass_index = GetTaskTemp(grass_index_TasktempID)
	if grass_index_chk(grass_index) ~= 1 then
		return
	end
	SetNpcLifeTime(grass_index,0)
	local num_now = GetTask(grass_kill_num)+1
	SetTask(grass_kill_num,num_now)
	--负面buff增加函数
	local poision_level = num_now/5
	if mod(poision_level,1) == 0 then
		if poision_level > 5 then
			poision_level = 5 
		end
		--加buff
		CastState("state_diffuse_skill_effect",Tb_stage4_buff_info[poision_level][1],-1,1,19801223)
		AddTitle(Tb_stage4_buff_info[poision_level][2],Tb_stage4_buff_info[poision_level][3])
		SetCurTitle(Tb_stage4_buff_info[poision_level][2],Tb_stage4_buff_info[poision_level][3])
		Msg2Player("B筺  h竔 頲 "..num_now.." 'Dc Nh﹏ Th秓', c c馻 Dc Nh﹏ Th秓  th蕀 v祇 ngi b筺!")
	else--未中毒对话
		Msg2Player("B筺  h竔 頲 "..num_now.." 'Dc Nh﹏ Th秓', s� lng h竔 c祅g nhi襲 c tr髇g c祅g n苙g, h穣 c萵 th薾!")
	end
end
--拔除失败
function northwest_stage4_grass_fail()
	local grass_index = GetTaskTemp(grass_index_TasktempID)
	if grass_index_chk(grass_index) ~= 1 then
		return
	end
	SetUnitCurStates(grass_index,grass_id_state,0)
end
--草索引检测函数
function grass_index_chk(grass_index)
	if grass_index == 0 then
		return 0
	elseif GetNpcName(grass_index) ~= "Dc Nh﹏ Th秓" then
		return 0
	else
		return 1
	end
end

tlucky_award = {
				{"V筺 V藅 Quy Nguy猲 Кn", 909, {1,0,11,1}, 0},
				{"H綾 Ng鋍 筺 T鬰 Cao", 909, {1,0,6,1}, 0},
				{"Sinh Sinh H鉧 T竛", 909,{1,0,16,1}, 0},
				{"Ma o Th筩h C﹑ 1", 789, {2,1,30428,1}, 15*24*60*60},
				{"Ma o Th筩h C﹑ 2", 312, {2,1,30429,1}, 15*24*60*60},	
				{"Ma o Th筩h C﹑ 3", 99, {2,1,30430,1}, 15*24*60*60},			
				{"B╪g Th筩h", 600, {2,1,149,1}, 0},			
				{"M秐h B╪g Th筩h", 1464, {2,1,148,1}, 0},	
				{"C� Linh Th筩h", 100, {2,1,30368,1}, 0},	
				{"C� Linh Ng鋍", 100, {2,1,30369,1}, 0},	
				{"M秐h Thi猲 Cang", 253, {2,1,30390,1}, 0},
				{"M閏 Rng", 3553, {2,1,30340,1}, 0},
				{"Thi猲 Th筩h Linh Th筩h", 1, {2,1,1068,1}, 7*24*60*60},
				{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h", 1, {2,1,1067,1}, 7*24*60*60},
				{"Чi мnh H錸", 1, {2,1,1113,1}, 7*24*60*60},								
		}

-------------------------Quay s� Ingame-----------------------------------------------

tbAwardQuaySo  = {
	[1] = {[1] = {nCheckExp = 0, nExp = 5000000}, nRate = 30.00},
	[2] = {[1] = {nCheckExp = 0,nExp = 10000000}, nRate = 12.00},
	[3] = {[1] = {nCheckExp = 0,nExp = 20000000}, nRate = 5.00},
	[4] = {[1] = {nCheckExp = 0,nExp = 50000000}, nRate = 3.00},
	[5] = {[1] = {nCheckExp = 0,nExp = 100000000}, nRate = 2.00},
	[6] = {[1] = {nDanhvong = 100}, nRate = 15.00},
	[7] = {[1] = {nSumon = 100}, nRate = 15.00},
	[8] = {[1] = {nQuancong = 3000}, nRate = 5.00},
	[9] = {[1] = {item={{gdp={2,1,30497,10,4}, name = "Ma Tinh"}}}, nRate = 5.00},
	[10] = {[1] = {item={{gdp={2,1,149,1,1}, name = "B╪g Th筩h"}}}, nRate = 2.00},
	[11] = {[1] = {item={{gdp={2,1,30428,1,1}, name = "Ma o Th筩h c蕄 1", nExpired = 7*24*3600}}}, nRate = 2.00},
	[12] = {[1] = {item={{gdp={2,1,30429,1,1}, name = "Ma o Th筩h c蕄 2", nExpired = 7*24*3600}}}, nRate = 2.00},
	[13] = {[1] = {item={{gdp={2,1,1009,1,1}, name = "Thi猲 Th筩h Tinh Th筩h"}}}, nRate = 1.50},
	[14] = {[1] = {item={{gdp={2,1,1000,1,1}, name = "B祅 Long B輈h", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[6] = {[1] = {item={{gdp={2,1,30523,1,1}, name = "C蕄 3 T葃 T﹎ Th筩h"}}}, nRate = 5.00},
--	[7] = {[1] = {item={{gdp={2,1,30529,1,1}, name = "C蕄 3 Luy謓 L� Thi誸"}}}, nRate = 5.00},
--	[8] = {[1] = {item={{gdp={2,1,30534,1,1}, name = "Thi誸 Tinh c蕄 2"}}}, nRate = 5.00},
--	[9] = {[1] = {item={{gdp={2,1,30535,1,1}, name = "Thi誸 Tinh c蕄 3"}}}, nRate = 5.00},	
--	[11] = {[1] = {item={{gdp={2,1,30426,1,1}, name = "Cng H鉧 Quy觧 14", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[12] = {[1] = {item={{gdp={2,1,30427,1,1}, name = "Cng H鉧 Quy觧 15", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[17] = {[1] = {item={{gdp={2,1,30430,1,1}, name = "Ma o Th筩h c蕄 3", nExpired = 7*24*3600}}}, nRate = 2.00},
--	[21] = {[1] = {item={{gdp={2,1,3356,1,1}, name = "T骾 Thi猲 Th筩h Tinh Th筩h", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[22] = {[1] = {item={{gdp={2,1,1051,1,1}, name = "Bao Thi猲 Th筩h Tinh Th筩h", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[24] = {[1] = {item={{gdp={2,1,1001,1,1}, name = "H遖 Th� B輈h", nExpired = 7*24*3600}}}, nRate = 0.50},
}
--VET_2012_QUAYSOINGAME  = {
--	{1, 555, "Cng H鉧 Quy觧 12", {2,1,30424, 1}, 15* 24 * 3600},
--	{1, 666, "Cng H鉧 Quy觧 13", {2,1,30425, 1}, 15* 24 * 3600},
--	{1, 777, "Cng H鉧 Quy觧 14", {2,1,30426, 1}, 15* 24 * 3600},	
--	{1, 888, "Cng H鉧 Quy觧 15", {2,1,30427, 1}, 15* 24 * 3600},	
--	{1, 3003, "6 M閏 Rng", {2,1,30340, 6}, 0},	
--	{1, 1616, "6 T骾 ti襫", {2,1,30367, 6}, 0},	
--	{1, 1234, "M秐h Thi猲 Cang", {2,1,30390, 1}, 0},
--	{1, 1234, "M秐h Thi猲 M玭", {2,1,30410, 1}, 0},
--	{1, 22, "мnh H錸 Thi猲 Th筩h Th莕 Th筩h", {2,1,1067, 1}, 7* 24 * 3600},
--	{1, 5, "Чi мnh H錸", {2,1,1113, 1}, 7*24*60*60},				
--}
-- M藅 t辌h cao c蕄 
VET_2012_GAOJIMIJI = {
	{1, 988, "Kim Cang B竧 Nh� Ch﹏ Quy觧 ", {0, 107, 204, 1}, 0},
	{1, 368, "Ti襪 Long T骳 Di謙 Ch﹏ Quy觧", {0, 107, 205, 1}, 0},
	{1, 714, "V� Tr莕 B� б Ch﹏ Quy觧", {0, 107, 206, 1}, 0},
	{1, 888, "Thi猲 La Li猲 Ch﹗ Ch﹏ Quy觧", {0, 107, 207, 1}, 0},
	{1, 348, "Nh� � Kim жnh Ch﹏ Quy觧", {0, 107, 208, 1}, 0},
	{1, 524, "B輈h H秈 Tuy謙  Ch﹏ Quy觧", {0, 107, 209, 1}, 0},
	{1, 888, "H鏽 чn Tr蕁 Nh筩 Ch﹏ Quy觧", {0, 107, 210, 1}, 0},
	{1, 888, "Qu� Thi猲 Du Long Ch﹏ Quy觧", {0, 107, 211, 1}, 0},
	{1, 668, "Huy襫 秐h M� T玭g Ch﹏ Quy觧", {0, 107, 212, 1}, 0},
	{1, 714, "Qu﹏ T� ыi Phong Ch﹏ Quy觧", {0, 107, 213, 1}, 0},
	{1, 568, "Tr蕁 Qu﹏ Phi Long Thng Ch﹏ Quy觧", {0, 107, 214, 1}, 0},
	{1, 668, "Xuy猲 V﹏ L筩 H錸g Ch﹏ Quy觧", {0, 107, 215, 1}, 0},
	{1, 888, "Huy襫 Minh Phong Ma Ch﹏ Quy觧", {0, 107, 216, 1}, 0},
	{1, 888, "Linh C� Huy襫 T� Ch﹏ Quy觧", {0, 107, 217, 1}, 0},
	{1, 0, "C鰑 Thi猲 Phong L玦 Ch﹏ Quy觧", {0, 107, 218, 1}, 0},
	{1, 0, "H錸g Tr莕 T髖 M閚g Ch﹏ Quy觧", {0, 107, 222, 1}, 0},
	{1, 0, "Phong Hoa Thi猲 Di謕 Ch﹏ Quy觧", {0, 107, 223, 1}, 0},
}

function VIET_Give70GaojiMiji()
	gf_EventGiveRandAward(VET_2012_GAOJIMIJI,10000,1)
end
--------------------------------------------------------------------
	
--TSK_LUCKY_DRAW = 1539

function confirm_lucky_award_suc()
	local nExtVal = GetExtPoint(EXT_QUAYSOINGAME)
	if nExtVal <= 0 then
		Talk(1, "", szNpcName.."S� l莕 nh薾 thng may m緉 c馻 c竎 h� kh玭g c遪.");
		return
	end
	
	if gf_JudgeRoomWeight(1,100,szNpcName) == 0 then
		return
	end
	
	if PayExtPoint(EXT_QUAYSOINGAME,1) == 1 then
--		SetTask(TSK_LUCKY_DRAW, GetTask(TSK_LUCKY_DRAW) + 1)
		LIB_Award.szLogTitle = "QUAY SO IN GAME 201312"
		LIB_Award.szLogAction = "nh薾"
		LIB_Award:AwardByRate(tbAwardQuaySo)
	end
end

function confirm_lucky_award_fail()
end

function confirm_translife_suc()
	Say("Ch骳 m鮪g ngi  l躰h h閕 頲 th猰 2 th祅h H鏽 Nguy猲 C玭g! H穣 ng nh藀 l筰.",1,"Tho竧!/go_exit")
end

t_dig_award_1 = {		    
	    	{1, 15, "Thi猲 th筩h", {2, 2, 8, 1}, 0},
	    	{1, 15, "M秐h Thi猲 th筩h", {2, 2, 7, 1}, 0},
	    	{1, 25, "B╪g th筩h", {2, 1, 149, 1}, 0},
	    	{3, 45, 100000, 1},
}

t_dig_award_2 = {
		{1, 1, "мnh H錸 Thi猲 Th筩h Th莕 Th筩h", {2, 1, 1067, 1}, 30*24*3600},
	    	{1, 10, "Thi猲 Th筩h Linh Th筩h", {2, 1, 1068, 1}, 30*24*3600},
	    	{1, 5000, "Phi Y猲 Th筩h", {2, 1, 30130, 1}, 0},
	    	{1, 5000, "T� Quang Th莕 Th筩h", {2, 1, 30131, 1}, 0},
	    	{1, 10000, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1}, 0},
	    	{3, 1, 100000000, 1},
	    	{3, 100, 10000000, 1},
	    	{3, 100000, 1000000, 1},
	    	{3, 879888, 100000, 1},	
}
	
function open_golden_chest_success()	
	local npc_index = GetTargetNpc()
	if npc_index < 0 then
		return
	end	
	local nDigCount = GetTask(2189)
	if mod(nDigCount,7) == 0 then
		local nRand = gf_GetRandItemByTable(t_dig_award_2,1000000,9)
		if t_dig_award_2[nRand][1] == 1 then
			gf_AddItemEx2(t_dig_award_2[nRand][4],t_dig_award_2[nRand][3],szHKLBLogHeader,"T莕 L╪g b秓 t祅g",t_dig_award_2[nRand][5],1)
		else
			gf_EventGiveCustomAward(t_dig_award_2[nRand][1] - 1, t_dig_award_2[nRand][3], t_dig_award_2[nRand][4] or 1, szHKLBLogHeader, "T莕 L╪g b秓 t祅g");
		end		
		if nRand >= 1 and nRand <= 4 then
			AddGlobalNews("[T莕 L╪g B秓 T祅g] Nghe n鉯 i hi謕 <color=green>"..GetName().."<color>  may m緉 o 頲 kho b竨 <color=yellow>"..t_dig_award_2[nRand][3].."<color>, xung quanh khu v鵦  ch綾 ch緉 c遪 r蕋  nhi襲 B秓 V藅.")
		end				
	else
		gf_EventGiveRandAward(t_dig_award_1,100,4,szHKLBLogHeader,"T莕 L╪g b秓 t祅g")
	end
end


TASK_USE_HONGBAO = 1542
BYTE_USE_DAY = 1
BYTE_USE_COUNT = 2

function open_vet_201001_hongbao_success()
	local nTaskVal = GetTask(TASK_USE_HONGBAO)
	local nDay = tonumber(date("%d"))
	if GetByte(nTaskVal,BYTE_USE_DAY) ~= nDay then
		nTaskVal = SetByte(nTaskVal,BYTE_USE_DAY,nDay)
		nTaskVal = SetByte(nTaskVal,BYTE_USE_COUNT,0)
		SetTask(TASK_USE_HONGBAO,nTaskVal)
	end
	
	nTaskByte = GetByte(GetTask(TASK_USE_HONGBAO),BYTE_USE_COUNT)
	if nTaskByte >= 8 then
		Talk(1,"","M鏸 ng祔 ch� c� th� s� d鬾g 8 Bao l� x� may m緉!")
		return 0;
	end
	
	SetTask(TASK_USE_HONGBAO, SetByte(GetTask(TASK_USE_HONGBAO),BYTE_USE_COUNT, nTaskByte + 1))
	
    	VET_201001_GiveHongBaoAward(GetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX));
    	SetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX, 0);    
end

function open_vet_201001_hongbao_failed()
    SetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX, 0);
end

function go_exit()
	ExitGame()
end

function gtask_WuZi_116_suc()
	shaohui_wuzi()
end

function gtask_WuZi_116_fail()
	--do_nothing
end

function ttd_talk_suc()
	SendScript2VM("\\settings\\static_script\\missions\\hunduantongtianding\\mission.lua","stageFight3:callBack()");
end

function ttd_talk_fail()
	return 0;
end

function gtask_Mfzp_80_suc()
	SendScript2VM("\\script\\task\\item\\灭法阵盘.lua","deal_rezult()");
end

function gtask_Mfzp_80_fail()
	return 0;
end

function qht_diji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\diji_box.lua","diji_suc_call_back()");
end

function qht_diji_box_fail()
end

function qht_zhongji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\zhongji_box.lua","zhongji_suc_call_back()");
end

function qht_zhongji_box_fail()
end

function qht_gaoji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\gaoji_box.lua","gaoji_suc_call_back()");
end

function qht_gaoji_box_fail()
end

function zq_battle_song_lingqi_suc()
	SendScript2VM("\\script\\function\\zq_battles\\item\\item_song_lq.lua", "exec_transmit()");
end

function zq_battle_song_lingqi_fail()
end

function zq_battle_liao_lingqi_suc()
	SendScript2VM("\\script\\function\\zq_battles\\item\\item_liao_lq.lua", "exec_transmit()");
end

function zq_battle_liao_lingqi_fail()
end

function bkl_openbox_suc()
	SendScript2VM("\\script\\vng\\bkl_box\\bkl_box_npc.lua","bkl_box_award()");
end

function bkl_openbox_fail()
end

function  tuyetanh_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","tuyetanh_box_award()");
end

function  chieuda_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","chieuda_box_award()");
end

function  xichtho_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","xichtho_box_award()");
end

function  tuyetanh_openbox_fail()
end

function vet_201305_refinedan_suc()
	SendScript2VM("\\script\\online_activites\\201305\\refine_dan.lua", "Vet_201305_Refine_Dan_Suc()");
end

function vet_201305_refinedan_fail()
end

function tm_use_siling_keyin_suc()
	SendScript2VM("\\script\\missions\\tong_melee\\item\\siling_keyin.lua", "dowait_cb()");
end

function tm_use_siling_keyin_fail()
end

function eyt_open_flag_suc()
	SetPlayerScript("\\script\\missions\\eyt_battle\\eyt_head.lua");
	SendScript2VM("\\script\\missions\\eyt_battle\\eyt_head.lua", "eyt_OpenFlag()");
end

function eyt_open_flag_fail()
end

function uminhhoa_suc()
	AddItem(Flame_Table[2][1],Flame_Table[2][2],Flame_Table[2][3],1);
	Msg2Player(format("B筺 nh薾 頲 %s", Flame_Table[2][5]))
end

function uminhhoa_fail()
	-- Msg2Player("Nh薾 thng b� gi竛 畂筺. H穣 th鵦 hi謓 l筰!")
	Msg2Player("U Minh hoa r蕋 mong manh. Ch� m閠 ch筸 nh� l� tan bi課 m蕋.")
end

function yp1_tree_steal_suc()
	SendScript2VM("\\script\\missions\\yp\\tls\\tree_npc.lua","tree_talk_3_1()");
end

function yp1_tree_steal_fail()
	return 0;
end

function yp_read_book_suc()
	SendScript2VM("\\script\\missions\\yp\\item\\michuanxinjing.lua","bk_readSuc()");
end

function yp_read_book_fail()
	SendScript2VM("\\script\\missions\\yp\\item\\michuanxinjing.lua","bk_readFail()");
end

function yp_get_book_sur()
	SendScript2VM("\\script\\missions\\yp\\qmy\\mission.lua","stageFight.NpcBookSuc()");
end

function yp_get_book_fail()
	SendScript2VM("\\script\\missions\\yp\\qmy\\mission.lua","stageFight.NpcBookFail()");
end

function yp_get_tree_sur()
	SendScript2VM("\\script\\missions\\yp\\qmy\\mission.lua","stageFight.NpcTreeSuc()");
end

function yp_get_tree_fail()
	SendScript2VM("\\script\\missions\\yp\\qmy\\mission.lua","stageFight.NpcTreeFail()");
end

function yp_random_fu_sur()
	SendScript2VM("\\script\\missions\\yp\\item\\suijifu.lua","yp_suijifu_sur()");
end

function yp_random_fu_fail()
	SendScript2VM("\\script\\missions\\yp\\item\\suijifu.lua","yp_suijifu_fail()");
end
