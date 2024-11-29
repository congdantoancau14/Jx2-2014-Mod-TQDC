--万剑冢数据统计

Include("\\settings\\static_script\\missions\\base\\runtime_data_stat.lua")

MAIN_ID = 4
--开启时对玩家的统计
function _stat_on_player_when_open_misson()
	AddRuntimeStat(MAIN_ID, 3, 0, 1) --开启人数
	AddRuntimeStat(MAIN_ID, 13, GetPlayerRoute(), 1) --开启人数
	_stat_trans_player_count(MAIN_ID, 7, 1, 100)
	_stat_level_player_count(MAIN_ID, 5, 80, 89)
	_stat_level_player_count(MAIN_ID, 6, 90, 99)
end

--全通时对玩家的统计
function _stat_on_player_when_all_pass()
	AddRuntimeStat(MAIN_ID, 4, 0, 1) --人数
	AddRuntimeStat(MAIN_ID, 14, GetPlayerRoute(), 1) --人数
end

--开启时的统计
function _stat_when_open_mission(bTianJiaolingMode)
	AddRuntimeStat(MAIN_ID, 1, bTianJiaolingMode, 1)
end

--全通时的统计
function _stat_when_all_pass()
	AddRuntimeStat(MAIN_ID, 2, 0, 1)
end

--免费翻盘统计
function _stat_when_open_free_card()
	AddRuntimeStat(MAIN_ID, 8, 0, 1)
end

--收费翻盘统计
function _stat_when_open_ib_card()
	AddRuntimeStat(MAIN_ID, 9, 0, 1)
end

--ib消耗计数
function _stat_when_ib_consume(nConsume)
	AddRuntimeStat(MAIN_ID, 10, 0, nConsume)
end


--ib产出1计数
function _stat_when_ib_produce_gulingyu(nProduce)
	AddRuntimeStat(MAIN_ID, 11, 0, nProduce)
end

--ib产出2计数
function _stat_when_ib_produce_super_book(nProduce)
	AddRuntimeStat(MAIN_ID, 12, 0, nProduce)
end

