--=============================================
--create by baiyun 2009.8.27
--describe:越南版9月份中秋活动走军灯笼脚本
--=============================================
Include("\\script\\online\\viet_event\\200909\\2\\mission_functions.lua");
Include("\\script\\lib\\globalfunctions.lua");
--pk状态对照表
t_pk_states = {
	[0] = {0, 0, "Tr筺g th竔 luy謓 c玭g"},
	[1] = {1, 0, "D筺g chi課 u 1"},
	[2] = {1, 1, "D筺g chi課 u 2"},
	[3] = {1, 2, "D筺g chi課 u 3"},
	[4] = {2, 0, "у s竧"},
};

function main()
	local nNpcIndex = GetTargetNpc()
	local nAwardFlag = GetUnitCurStates(nNpcIndex, 4);--是否已经有第一个玩家点击获得奖励
	local nActiveFlag = GetUnitCurStates(nNpcIndex, 5);
	
	-- local nState1 = get_flag_bit(nActiveFlag, 1);--以下四种状态玩家点击的判断记录
	-- local nState2 = get_flag_bit(nActiveFlag, 2);
	-- local nState3 = get_flag_bit(nActiveFlag, 3);
	-- local nState4 = get_flag_bit(nActiveFlag, 4);
	local nPkFlag1, nPkFlag2 = GetPKFlag();	--取得两个值表示的PK状态
	local nPkFlag = get_pk_flag(nPkFlag1, nPkFlag2);
	
	
	if nActiveFlag == 1111 then
		Talk(1, "", "Nghe n <color=yellow>Ho祅g Kim L謓h B礽<color> c馻 <color=green>Ho祅g Kim Thng Nh﹏<color> "
		.."- Bi謓 Kinh (171/178) c� th� gi髉 nh﹏ s� v� l﹎ c蕄 t鑓 th╪g n c蕄 73, t 3000 甶觤 danh v鋘g. "
		.."Ngo礽 ra, tr猲 con h祅h tr譶h b玭 t萿, nh﹏ s� c遪 頲 h� tr� th猰 nhi襲 lo筰 trang b�, "
		.."v� kh� c蕄 cao khi s� h鱱 頲 Ho祅g Kim L謓h B礽 n祔");
		if nAwardFlag == 0 then
			ModifyExp(500000);
			Talk(1, "", "Thu 頲 ph莕 thng may m緉 500000 kinh nghi謒");
			Msg2Player("Thu 頲 ph莕 thng may m緉 500000 kinh nghi謒");
			local nYears,nMonths,nDays = GmTime(GetTime()+28800);
			local nAdd,nIdx = AddItem(2,0,556,1) -- Th� th﹏ ph�
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
			local nAdd,nIdx = AddItem(2,0,141,1) -- Ti猽 ki誴 t竛
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
			
			AddUnitStates(nNpcIndex, 4, 1);
		end
		return 0;
	end
	
	if active_denglong(nNpcIndex, nPkFlag) == 0 then
		return 0;
	end
	
end

function get_pk_flag(nPkFlag1, nPkFlag2)
	for i = 0, getn(t_pk_states) do
		if t_pk_states[i][1] == nPkFlag1 and t_pk_states[i][2] == nPkFlag2 then
			return i;
		end
	end
	return 0;
end


function active_denglong(nNpcIndex, nPkFlag)
	local nMapId = SubWorldIdx2ID(SubWorld);
	local nActiveFlag = GetUnitCurStates(nNpcIndex, 5);
	local nResult = 1;
	local szMsg;
	if nPkFlag == 0 then
		Talk(1, "", "D筺g PK c馻 i hi謕 l� <color=red>"..t_pk_states[nPkFlag][3].."<color> kh玭g th� m� L� Nng");
		return 0;
	else
		if get_flag_bit(nActiveFlag, nPkFlag) == 0 then
			AddUnitStates(nNpcIndex, 5, set_flag_bit(nActiveFlag, nPkFlag, 1) - nActiveFlag);
		end
		local szPkMsg = "<enter>";
		
		for i = 1, 4 do
			if get_flag_bit(GetUnitCurStates(nNpcIndex, 5), i) == 0 then
				if i==2 or i==3 then
					szPkMsg = szPkMsg.."* <color=green>"..t_pk_states[i][3].."<color><enter>";
				else
					szPkMsg = szPkMsg.."* <color=red>"..t_pk_states[i][3].."<color><enter>";
				end
				nResult = 0;
			end
		end
		
		szMsg = "D筺g PK c馻 i hi謕 l� <color=yellow>"..t_pk_states[nPkFlag][3].."<color>, hi謓 t筰 m� L� Nng c莕: "..szPkMsg.."\n<color=green>Ngi ch琲 d筺g PK m韎 m� 頲 L� Nng<color>";
	end
	local nState = GetUnitCurStates(nNpcIndex, 5)
	-- if GetUnitCurStates(nNpcIndex, 5) ~= 1111 then
		-- Talk(1, "", szMsg);
	-- else
	if nState == 1001 or nState == 1011 or nState == 1111 then
		local nTimeStart = GetUnitCurStates(nNpcIndex, 6);
		local nMissionTime = 55 - floor((GetTime() - nTimeStart) / 60);--计算mission应该开启持续的时间
		if nMissionTime >= 5 then--如果时间小于5分钟，则不开启mission了，因为刷胖兔子至少要5分钟的时间
			local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);

			SetGlbValue(1014, nNpcIndex);
			SetGlbValue(1015, nMapId);
			SetGlbValue(1016, nMapX);
			SetGlbValue(1017, nMapY);
			SetGlbValue(1018, nMissionTime);
			
			OpenMission(MISSION_ID, nMapId);
			Talk(1, "", "L� Nng Х M� Th祅h C玭g. Vui L遪g ьi Boss Xu蕋 Hi謓");
		end
	else
		Talk(1, "", szMsg);
	end
	
	return nResult;
end

function get_flag_bit(nFlag, nBit)--取得第1，2，3，4其中一位
	if nBit == 1 then
		return mod(nFlag, 10);
	elseif nBit == 2 then
		return floor(mod(nFlag, 100) / 10);
	elseif nBit == 3 then
		return floor(mod(nFlag, 1000) / 100);
	else
		return floor(nFlag / 1000);
	end
end

function set_flag_bit(nFlag, nBit, nValue)--设置第1,2,3,4其中一位
	if nBit == 1 then
		return nFlag - get_flag_bit(nFlag, nBit) + nValue;
	elseif nBit == 2 then
		return nFlag - get_flag_bit(nFlag, nBit) * 10 + nValue * 10;
	elseif nBit == 3 then
		return nFlag - get_flag_bit(nFlag, nBit) * 100 + nValue * 100;
	else
		return nFlag - get_flag_bit(nFlag, nBit) * 1000 + nValue * 1000;
	end
end