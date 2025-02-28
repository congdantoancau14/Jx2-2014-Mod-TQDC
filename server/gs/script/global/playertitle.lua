-- 设置称号和取消设置声望时执行

-- type = 0x1, equip;  type = 0x2, have;

function Equip(nGeren, nDetail, nType)
	--WriteLog("Equip::geren: "..nGeren..", detai: "..nDetail..", type: "..nType);
	local nStateID = nGeren * 10000 + nDetail * 100
	if check_battle_rank(nGeren, nDetail) == 0 then
		if nType == 2 then
			RemoveState(nStateID)
			return 0;
		end;
		SetCurTitle(0,0);
		return 0;
	end;
	if check_new_battle_rank(nGeren, nDetail) == 0 then
		if nType == 2 then
			RemoveState(nStateID)
			return 0;
		end;
		SetCurTitle(0,0);
		return 0;
	end;
	local szfunc = format("_%.2d_%.2d_(%d, %d)", nGeren, nDetail, nType, nStateID)
	dostring(szfunc)
	if nType == 1 then
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGeren, nDetail, 0)
		--WriteLog("year: "..nYear..", month: "..nMonth..", day: "..nDay..", hour: "..nHour..", minute: "..nMin..", second: "..nSec);
		if nYear ~= 1970 then
			Msg2Player("X璶g hi謚 c馻 b筺 h誸 h筺 v祇"..nYear.."ni猲"..nMonth.."Nguy謙"..nDay.."Nh藅"..nHour.." gi� "..nMin.." Ph髏 "..nSec.." gi﹜")
		end
	end
end

function UnEquip(nGeren, nDetail, nType)
	local nStateID = nGeren * 10000 + nDetail * 100
	RemoveState(nStateID)
	RemoveState(nStateID+1)	--针对组合属性
	RemoveState(nStateID+2)
	RemoveState(nStateID+3)
end

function _22_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 1, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 3, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
	end
end

function _22_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
	end
end

function _22_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
	end
end

function _22_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
	end
end

function _22_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 25, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

-- 初级
function _23_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_vitality", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: G﹏ c鑤 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_vitality", 3, -1, 1, nStateID);
		Msg2Player("Л頲 hi謚 qu�: G﹏ c鑤 + 3 甶觤");
	end;
end

function _23_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 3 甶觤");
	end;
end

function _23_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 3 甶觤");
	end;
end

function _23_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 3 甶觤");
	end;
end

function _23_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 3 甶觤");
	end;
end

function _23_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 3 甶觤");
	end;
end

function _23_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 3 甶觤");
	end;
end

function _23_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 3 甶觤");
	end;
end

function _23_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 3 甶觤");
	end;
end

-- 中级
function _24_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID);
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

-- 高级
function _25_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

-- 最高
function _26_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end
--师门第4称号
function _27_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end
--师门第5称号
function _28_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3% ");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3% ");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3% ");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end
--宋方士兵
function _30_01_(nType, nStateID)

end;
--宋军武勇校尉
function _30_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
	end;
end;
--宋军常胜都统
function _30_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
	end;
end;
--宋军定北大先锋
function _30_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
	end;
end;
--大宋无双大将军
function _30_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	end;
end;
--大宋护国大元帅
function _30_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
	end;
end;
--辽方士兵
function _30_07_(nType, nStateID)

end;
--辽军骁勇校尉
function _30_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
	end;
end;
--辽军绝尘都统
function _30_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
	end;
end;
--辽军平南大先锋
function _30_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
	end;
end;
--大辽通天大将军
function _30_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	end;
end;
--南院大王
function _30_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
	end;
end;
--大宋破阵督护
function _30_13_(nType, nStateID)
	if nType == 1 then	--增加内外攻15%
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	elseif nType == 2 then	
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	end;
end;
--大辽破阵督护
function _30_14_(nType, nStateID)
	if nType == 1 then	--增加内外攻15%
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	end;
end;
--大宋破阵督护
function _30_15_(nType, nStateID)
	if nType == 1 then	--增加伤害100点
		CastState("state_damage_point", 100, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_damage_point", 100, -1, 1, nStateID)
	end;
end;
--大辽破阵督护
function _30_16_(nType, nStateID)
	if nType == 1 then	--增加伤害100点
		CastState("state_damage_point", 100, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_damage_point", 100, -1, 1, nStateID)
	end;
end;
--宋镇军虎骑
function _30_17_(nType, nStateID)
	if nType == 1 then	--伤害减半概率25%
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
	end;
end;
--辽镇军虎骑
function _30_18_(nType, nStateID)
	if nType == 1 then	--伤害减半概率25%
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
	end;
end;
--大宋铁骨龙卫
function _30_19_(nType, nStateID)
	if nType == 1 then	--所有属性60点
		CastState("state_add_allability", 60, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 60, -1, 1, nStateID)
	end;
end;
--大辽铁骨龙卫
function _30_20_(nType, nStateID)
	if nType == 1 then	--所有属性60点
		CastState("state_add_allability", 60, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 60, -1, 1, nStateID)
	end;
end;
--大宋无双飞将
function _30_21_(nType, nStateID)
	if nType == 1 then	--生命上限增加10000点
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
	end;
end;
--大辽无双飞将
function _30_22_(nType, nStateID)
	if nType == 1 then	--生命上限增加10000点
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
	end;
end;
--大宋御敌猛士
function _30_23_(nType, nStateID)
	if nType == 1 then	--所有属性40点
		CastState("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
	end;
end;
--大辽御敌猛士
function _30_24_(nType, nStateID)
	if nType == 1 then	--所有属性40点
		CastState("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
	end;
end;

function _63_01_(nType, nStateID)
    if nType == 1 then	--所有属性8点
		CastState("state_add_allability", 8, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
	end;
end

function _64_01_(nType, stateID)
	if nType == 1 then
		CastState("state_add_energy", 20, -1, 1, stateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 20 甶觤");
	end
end

function _64_02_(nType, stateID)
	if nType == 1 then
		CastState("state_add_strength", 20, -1, 1, stateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 20 甶觤");	
	end
end

--function _64_03_(type, stateID)
--	if 1 == type then
--		CastState("state_add_dexterity", 20, -1, 1, stateID)
--		Msg2Player("获得效果：身法增加20点");
--	end
--end
--
--function _64_04_(type, stateID)
--	if 1 == type then
--		CastState("state_add_vitality", 20, -1, 1, stateID)
--		Msg2Player("获得效果：根骨增加20点");
--	end
--end
--
--function _64_05_(type, stateID)
--	if 1 == type then
--		CastState("state_add_observe", 20, -1, 1, stateID)
--		Msg2Player("获得效果：洞察增加20点");
--	end
--end

function PT_AddAllWhenEquip(type, stateID, number1, number2)
	if 1 == type then
		CastState("state_burst_enhance_rate", number1, -1, 1, stateID+1);
		CastState("state_add_allability", number2, -1, 1, stateID+2);
		Msg2Player(format("%s%d%%%s%d%s","Hi謚 qu� nh薾 頲: T╪g t鑓  thi tri觧", number1, ",T╪g Sinh l鵦", number2, " 甶觤"));
	end
end

function _65_01_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 10, 10);
end

function _65_02_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 12, 12);
end

function _65_03_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 14, 14);
end

--function _65_04_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_05_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_06_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_07_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_08_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_09_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_10_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_11_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_12_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_13_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_14_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_15_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_16_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_17_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_18_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_19_(type, stateID)
--	if 2 == type then
--		CastState("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：生命值下降15%");		
--	end
--end
--
--function _65_20_(type, stateID)
--	if 2 == type then
--		CastState("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：内力值下降15%");		
--	end
--end
--
--function _65_21_(type, stateID)
--	if 2 == type then
--		CastState("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：生命值下降15%");		
--	end
--end
--
--function _65_22_(type, stateID)
--	if 2 == type then
--		CastState("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：生命值下降15%");		
--	end
--end
--
--function _65_23_(type, stateID)
--	if 2 == type then
--		CastState("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：内力值下降15%");		
--	end
--end
--
--function _65_24_(type, stateID)
--	if 2 == type then
--		CastState("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：内力值下降15%");		
--	end
--end
--
--function _65_25_(type, stateID)
--	if 2 == type then
--		CastState("state_slow", 10, -1, 1, stateID);
--		Msg2Player("获得效果：移动速度下降10%");		
--	end
--end
--
--function _65_26_(type, stateID)
--	if 2 == type then
--		CastState("state_add_allability", 8, -1, 1, stateID);
--		Msg2Player("获得效果：全属性增加8点");
--	end
--end
--
--function _65_27_(type, stateID)
--	if 2 == type then
--		CastState("state_add_allability", 8, -1, 1, stateID);
--		Msg2Player("获得效果：全属性增加8点");
--	end
--end

function _65_19_(nType, stateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", -15, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  Sinh m謓h gi秏 15%");		
	end
end

function _65_20_(nType, stateID)
	if nType == 1 then
		CastState("state_neili_max_percent_add", -15, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  N閕 l鵦 gi秏 15%");		
	end
end

function _65_21_(nType, stateID)
	if nType == 1 then
		CastState("state_physical_parmor_poi_add", -15, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  Ngo筰 ph遪g gi秏 15%");		
	end
end

function _65_22_(nType, stateID)
	if nType == 1 then
		CastState("state_magic_parmor_poi_add", -15, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  N閕 ph遪g gi秏 15%");		
	end
end

function _65_23_(nType, stateID)
	if nType == 1 then
		CastState("state_attack_speed_dec", 50, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  T鑓  t蕁 c玭g gi秏 50%");		
	end
end

function _65_24_(nType, stateID)
	if nType == 1 then
		CastState("state_burst_enhance_rate", -50, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  T鑓  xu蕋 chi猽 gi秏 50%");		
	end
end

function _65_25_(nType, stateID)
	if nType == 1 then
		CastState("state_slow", 20, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  T鑓  di chuy觧 gi秏 20%");
	end
end

function _65_29_(nType, stateID)
	if nType == 1 then
		CastState("state_add_allability", 25, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  Kh竛g t蕋 c� t╪g 25 甶觤");
	end
end

function _65_26_(nType, stateID)
	if nType == 1 then
		CastState("state_add_strength", 50, -1, 1, stateID);
		CastState("state_add_vitality", 50, -1, 1, stateID+1);
		CastState("state_add_energy", 50, -1, 1, stateID+2);
		Msg2Player("Hi謚 鴑g:   S鴆 m筺h t╪g 50, G﹏ c鑤 t╪g 50, N閕 kh� t╪g 50");
	end
end

function _65_27_(nType, stateID)
	if nType == 1 then
		CastState("state_add_dexterity", 50, -1, 1, stateID);
		CastState("state_add_observe", 50, -1, 1, stateID+1);
		CastState("state_add_energy", 50, -1, 1, stateID+2);

		Msg2Player("Hi謚 鴑g:  Th﹏ ph竝 t╪g 50, Linh ho箃 t╪g 50, N閕 kh� t╪g 50");
	end
end

function _65_28_(nType, stateID)
	if nType == 1 then
		CastState("state_move_speed_percent_add", 20, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  T鑓  di chuy觧 t╪g 20%");
	end
end

function _65_30_(nType, stateID)
	-- Msg2Player("_65_30_ hungry")
	if nType == 1 then
		CastState("state_life_max_percent_add", -50, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  Sinh m謓h gi秏 50%");
		CastState("state_physical_parmor_poi_add", -50, -1, 1, stateID+1);
		Msg2Player("Hi謚 鴑g:  Ngo筰 ph遪g gi秏 50%");	
	end
end

function _65_31_(nType, stateID)
	-- Msg2Player("_65_31_ thirsty")
	if nType == 1 then
		CastState("state_neili_max_percent_add", -50, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  N閕 l鵦 gi秏 50%");
		CastState("state_magic_parmor_poi_add", -50, -1, 1, stateID+1);
		Msg2Player("Hi謚 鴑g:  N閕 ph遪g gi秏 50%");	
	end
end

function _65_32_(nType, stateID)
	-- Msg2Player("_65_32_ sleepy")
	if nType == 1 then
		CastState("state_attack_speed_dec", 50, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  T鑓  t蕁 c玭g gi秏 50%");
		CastState("state_burst_enhance_rate", -50, -1, 1, stateID+1);
		Msg2Player("Hi謚 鴑g:  T鑓  xu蕋 chi猽 gi秏 50%");
		CastState("state_slow", 20, -1, 1, stateID+2);
		Msg2Player("Hi謚 鴑g:  T鑓  di chuy觧 gi秏 20%");
	end
end


function _65_33_(nType, stateID)
	-- Msg2Player("_65_33_ drunken")
	if nType == 1 then
		CastState("state_poison_damage", 1, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  Ng� c ru");
		CastState("state_add_dexterity", -50, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  Th﹏ ph竝 gi秏 50 甶觤");
	end
end


function _65_34_(nType, stateID)
	-- Msg2Player("_65_34_ indigestion")
	if nType == 1 then
		CastState("state_add_strength", -50, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  S鴆 m筺h gi秏 50 甶觤");
		CastState("state_add_vitality", -50, -1, 1, stateID+1);
		Msg2Player("Hi謚 鴑g:  G﹏ c鑤 gi秏 50 甶觤");	
	end
end


function _65_35_(nType, stateID)
	-- Msg2Player("_65_35_ Oedema ")
	if nType == 1 then
		CastState("state_add_energy", -50, -1, 1, stateID);
		Msg2Player("Hi謚 鴑g:  N閕 l鵦 gi秏 50 甶觤");
		CastState("state_add_observe", -50, -1, 1, stateID+1);
		Msg2Player("Hi謚 鴑g:  Linh ho箃 50 甶觤");	
	end
end

--------------------------------------------------------------------------------------
-- 攻城战称号

function CityWarEquip(nGeren, nDetail, nType)
	local szfunc = format("_%.2d_%.2d_(%d)", nGeren, nDetail, nType)
	dostring(szfunc)
	if nType == 1 then
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGeren, nDetail, 0)
		if nYear ~= 1970 then
			Msg2Player("X璶g hi謚 c馻 b筺 h誸 h筺 v祇 "..nYear.." Ni猲 "..nMonth.." Nguy謙 "..nDay.." Nh藅 - "..nHour.." gi� "..nMin.." ph髏 "..nSec.." gi﹜.")
		end
	end
end

function CityWarUnEquip(nGeren, nDetail, nType)
	SetCityWarDutyFlag(0, 0)
	VerifyEquip()
end

function _51_01_(nType)		-- 成都城主
	SetCityWarDutyFlag(300, 0)
end

function _51_02_(nType)		-- 成都郡主
	SetCityWarDutyFlag(300, 0)
end

function _51_03_(nType)		-- 成都军师
	SetCityWarDutyFlag(300, 1)
end

function _51_04_(nType)		-- 成都名捕
	if nType == 1 then
		SetCityWarDutyFlag(300, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
end

function _51_05_(nType)		-- 泉州城主
	SetCityWarDutyFlag(100, 0)
end

function _51_06_(nType)		-- 泉州郡主
	SetCityWarDutyFlag(100, 0)
end

function _51_07_(nType)		-- 泉州军师
	SetCityWarDutyFlag(100, 1)
end

function _51_08_(nType)		-- 泉州名捕
	if nType == 1 then
		SetCityWarDutyFlag(100, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
end

function _51_09_(nType)		-- 襄阳城主
	SetCityWarDutyFlag(350, 0)
end

function _51_10_(nType)		-- 襄阳郡主
	SetCityWarDutyFlag(350, 0)
end

function _51_11_(nType)		-- 襄阳军师
	SetCityWarDutyFlag(350, 1)
end

function _51_12_(nType)		-- 襄阳名捕
	if nType == 1 then
		SetCityWarDutyFlag(350, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
end

--西北关卡称号
--纵横西夏（击败李元庆获得的称号）
function _60_08_(nType, nStateID)
	if nType == 1 then	--经验获得增加5%
		CastState("state_inc_exp_gain", 5, -1, 1, nStateID)
	elseif nType == 2 then  --经验获得增加5%
		CastState("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end;

-- 攻城战称号结束

--==========判断战场称号的============================================================
tTitleTab =
{
--称号名称，对应称号表内的大类，副类，所需军衔
	{"T鑞g_V� D騨g Hi謚 髖",	30, 2, 2},
	{"Li猽_Ki猽 D騨g Й 髖",	30, 8,-2},
	{"T鑞g_Thng Th緉g Й th鑞g",	30, 3, 3},
	{"Li猽_Tuy謙 tr莕 Й th鑞g",	30, 9,-3},
	{"T鑞g_мnh B綾 i Ti猲 phong",	30, 4, 4},
	{"Li猽_B譶h Nam i Ti猲 phong",	30,10,-4},	
	{"T鑞g_V� Song Чi tng qu﹏",	30, 5, 5},	
	{"Li猽_Th玭g Thi猲 Чi tng qu﹏",	30,11,-5},	
	{"T鑞g_H� Qu鑓 Чi nguy猲 so竔",	30, 6, 6},	
	{"Nam Vi謓 i Vng",		30,12,-6},	
} 

tNewTitleTab =
{
--称号名称，对应称号表内的大类，副类，所需军功，是否支持永久元帅军衔
	{"T鑞g -Ph� Tr薾 цc h�",	30,	13,		300000,		1}, 
	{"Li猽-Ph� Tr薾 цc h� ",	30,	14,		-300000,	1},
	{"T鑞g -Ph� Tr薾 цc h�",	30,	15,		300000,		1}, 
	{"Li猽-Ph� Tr薾 цc h� ",	30,	16,		-300000,	1},
	{"T鑞g-Tr蕁 Qu﹏ H� k�",	30,	17,		450000,		0}, 
	{"Li猽-Tr蕁 Qu﹏ H� k�",	30,	18,		-450000,	0},	
	{"T鑞g -Thi誸 C� Long V�",	30,	19,		400000,		0}, 
	{"Li猽- Thi誸 C� Long V�",	30,	20,		-400000,	0},
	{"T鑞g- V� Song Phi Tng",	30,	21,		500000,		0}, 
	{"Li猽-V� Song Phi Tng",	30,	22,		-500000,	0},
	{"T鑞g- Ng� мch M穘h S�",	30,	23,		250000,		1}, 
	{"Li猽- Ng� мch M穘h S�",	30,	24,		-250000,	1},
}
--检查当前是不是战场称号并且符合顶这个称号的资格
function check_battle_rank(nGeren, nDetail)
	local nTitleIdx = 0;
	for i,v in tTitleTab do
		if tTitleTab[i][2] == nGeren and tTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--不是战场称号
		return 1;
	end;
	local nCurRank = GetTask(704);
	local nNeedRank = tTitleTab[nTitleIdx][4];	
	if nCurRank > 0 then
		if nNeedRank < 0 then
			Msg2Player("B筺 hi謓 thu閏 phe T鑞g, kh玭g th� d飊g danh hi謚 c馻 phe Li猽");
			return 0
		end
	elseif nCurRank < 0 then
		if nNeedRank > 0 then
			Msg2Player("B筺 hi謓 thu閏 phe Li猽 kh玭g th� d飊g danh hi謚 c馻 phe T鑞g");
			return 0
		end;
	end;

	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	
	nCurRank = abs(nCurRank)
	nNeedRank = abs(nNeedRank)
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end
	if nCurRank < nNeedRank then
		Msg2Player("Qu﹏ h祄 c馻 b筺 qu� th蕄 kh玭g th� s� d鬾g danh hi謚 n祔.")
		return 0
	end
	return 1
end;
--第二批战场称号检查
function check_new_battle_rank(nGeren, nDetail)
	local tCampNameZ =					--阵营名字（中文），显示对话的时候用的
	{
		[0] = "",
		[1] = "T鑞g",
		[2] = "Li猽",
	}
	local nTitleIdx = 0;
	for i,v in tNewTitleTab do
		if tNewTitleTab[i][2] == nGeren and tNewTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--不是战场称号
		return 1;
	end;
	local nCurCamp = 0;
	local nNeedJunGong = tNewTitleTab[nTitleIdx][4];
	local nNeedEverRank = tNewTitleTab[nTitleIdx][5];
	local nCurJunGong = GetTask(701);
	local bEverMarshal = 0;
	local nTitleCamp = 0;
	if nNeedJunGong > 0 then
		nTitleCamp = 1;
	else
		nTitleCamp = 2;
	end;
	if nCurJunGong >= 0 then
		nCurCamp = 1;
	else
		nCurCamp = 2;
	end;
	if GetTask(765) >= 15 then
		bEverMarshal = 1;	--是永久元帅
	end;
	if nCurCamp == 1 then	--当前为宋方
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong < nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("B筺 ph秈 t 頲 "..tCampNameZ[nTitleCamp].."Phng "..abs(nNeedJunGong).." chi課 c玭g ho芻 c� "..tCampNameZ[nTitleCamp].." Qu﹏ h祄 Phng V躰h c鰑 Nguy猲 So竔 m韎 c� th� s� d鬾g x璶g hi謚 n祔");				
				return 0;
			end;
		else
			if nCurJunGong < nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("B筺 ph秈 t 頲 "..tCampNameZ[nTitleCamp].."Phng "..abs(nNeedJunGong).." Qu﹏ c玭g m韎 頲 s� d鬾g x璶g hi謚 n祔");				
				return 0;
			end;
		end;
	else
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong > nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("B筺 ph秈 t 頲 "..tCampNameZ[nTitleCamp].."Phng "..abs(nNeedJunGong).." chi課 c玭g ho芻 c� "..tCampNameZ[nTitleCamp].." Qu﹏ h祄 Phng V躰h c鰑 Nguy猲 So竔 m韎 c� th� s� d鬾g x璶g hi謚 n祔");				
				return 0;
			end;
		else
			if nCurJunGong > nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("B筺 ph秈 t 頲 "..tCampNameZ[nTitleCamp].."Phng "..abs(nNeedJunGong).." Qu﹏ c玭g m韎 頲 s� d鬾g x璶g hi謚 n祔");				
				return 0;
			end;
		end;		
	end;
	return 1;
end;
--===================================================================================

function ZhenzaiEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2021))
end

function ZhenzaiUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2021))
end

--召回老玩家活动 武林称号
function CallbackEquip(nGeren, nDetail, nType)
	if nType == 1 then
		local n = CreateTrigger(1, 51, 2022)
		ContinueTimer(n)
	elseif nType == 2 then
		RemoveTrigger(GetTrigger(2022))
	end
end

function CallbackUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2022))
end

--二十周年称号
function YearsEquip(nGeren, nDetail, nType)
	if nType == 1 then
		local n = CreateTrigger(1, 52, 2023)
		ContinueTimer(n)
	elseif nType == 2 then
		RemoveTrigger(GetTrigger(2023))
	end
end

function YearsUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2023))
end

--四灵转身称号属性
function _61_05_(nType, nStateID)
--	print(nType, nStateID)
--	print(GetPlayerRebornParam(1))
	if nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID);
		CastState("state_medicine_time_increase", 10, -1, 1, nStateID + 1);
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 2);
	end
end

--四灵转身2称号属性
function _61_06_(nType, nStateID)
--	print(nType, nStateID)
--	print(GetPlayerRebornParam(1))
	if nType == 2 then
		CastState("state_add_allability", 21, -1, 1, nStateID);
		CastState("state_medicine_time_increase", 10, -1, 1, nStateID + 1);
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 2);
		CastState("state_life_max_point_add", 5000, -1, 1, nStateID + 3);
	end
end

function _66_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID);
		CastState("imme_life_percent_add", 15, -1, 1, nStateID + 1);
		CastState("state_burst_enhance_rate2", 5, -1, 1, nStateID + 2);
		CastState("state_move_speed_percent_add", 5, -1, 1, nStateID + 3);
	end
end

function _66_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID);
		CastState("imme_life_percent_add", 12, -1, 1, nStateID + 1);
		CastState("state_burst_enhance_rate2", 4, -1, 1, nStateID + 2);
		CastState("state_move_speed_percent_add", 4, -1, 1, nStateID + 3);
	end
end

function _66_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID);
		CastState("imme_life_percent_add", 9, -1, 1, nStateID + 1);
		CastState("state_burst_enhance_rate2", 3, -1, 1, nStateID + 2);
		CastState("state_move_speed_percent_add", 3, -1, 1, nStateID + 3);
	end
end

function _66_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID);
		CastState("imme_life_percent_add", 6, -1, 1, nStateID + 1);
		CastState("state_burst_enhance_rate2", 3, -1, 1, nStateID + 2);
		CastState("state_move_speed_percent_add", 3, -1, 1, nStateID + 3);
	end
end

function _67_01_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,1)
end
function _67_02_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,2)
end
function _67_03_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,3)
end
function _67_11_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,1)
end
function _67_12_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,2)
end
function _67_13_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,3)
end
T_NEW_BATTLE_ATTR = {
    [2] = {"state_add_strength", "S鴆 m筺h",}, --少林俗家
    [3] = {"state_add_energy", "N閕 c玭g ",}, --少林禅宗
    [4] = {"state_add_energy", "N閕 c玭g ",}, --少林武宗
    [6] = {"state_add_dexterity", "Th﹏ ph竝",}, --唐门
    [8] = {"state_add_energy", "N閕 c玭g ",}, --娥嵋佛家
    [9] = {"state_add_dexterity", "Th﹏ ph竝",}, --娥嵋俗家
    [11] = {"state_add_strength", "S鴆 m筺h",}, --丐帮净衣
    [12] = {"state_add_dexterity", "Th﹏ ph竝",}, --丐帮污衣
    [14] = {"state_add_energy", "N閕 c玭g ",}, --武当道家
    [15] = {"state_add_observe", "Linh ho箃",}, --武当俗家
    [17] = {"state_add_strength", "S鴆 m筺h",}, --杨门枪骑
    [18] = {"state_add_dexterity", "Th﹏ ph竝",}, --杨门弓骑
    [20] = {"state_add_dexterity", "Th﹏ ph竝",}, --五毒邪侠
    [21] = {"state_add_observe", "Linh ho箃",}, --五毒蛊师
    [23] = {"state_add_energy", "N閕 c玭g ",}, --昆仑
    [29] = {"state_add_strength", "S鴆 m筺h",}, --翠烟舞仙
    [30] = {"state_add_observe", "Linh ho箃",}, --翠烟灵女
}
T_NEW_BATTLE_TYPE = {100, 60, 40}


function newbattle_season_titile(nType, nStateID, nSubId)
	if nType == 2 then
		local tAttr = T_NEW_BATTLE_ATTR[GetPlayerRoute()]
		local nVal = T_NEW_BATTLE_TYPE[nSubId]
		if tAttr and nVal then
			CastState(tAttr[1], nVal, -1, 1, nStateID);
		end
	end
end

function _68_01_(nType, nStateID)
	if 1 == nType then
		CastState("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_02_(nType, nStateID)
	if 1 == nType then
		CastState("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_03_(nType, nStateID)
	if 1 == nType then
		CastState("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_04_(nType, nStateID)
	if 1 == nType then
		CastState("state_add_allability", 20, -1, 1, nStateID);
	end
end

function _70_01_(nType, nStateID)
	CastState("state_physical_parmor_poi_add", 3, -1, 1, nStateID);
	CastState("state_life_max_point_add", 10000, -1, 1, nStateID+1);
	CastState("state_dodge_point_increase", 200, -1, 1, nStateID+2);
end

function _71_01_(nType, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID);
		CastState("state_medicine_time_increase", 30, -1, 1, nStateID +1);
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID+2);
		CastState("state_add_book_attribute_value", 5, -1, 1, nStateID+3);
		CastState("state_add_allability", 25, -1, 1, nStateID+4);
end

function _73_01_(nType, nStateID)
		CastState("state_burst_enhance_rate", 7, -1, 1, nStateID);
		CastState("state_medicine_time_increase", 35, -1, 1, nStateID+1);
		CastState("state_life_max_point_add", 15000, -1, 1, nStateID+2);
		CastState("state_add_book_attribute_value", 5, -1, 1, nStateID+3);
		CastState("state_add_allability", 27, -1, 1, nStateID+4);
end

function _74_01_(nType, nStateID)
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID +1);
		CastState("state_def_critical_point_increase", 30, -1, 1, nStateID +2);
end

function _74_02_(nType, nStateID)
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_def_critical_damage_increase", 60, -1, 1, nStateID+2);
end

function _74_03_(nType, nStateID)
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_critical_damage_increase", 50, -1, 1, nStateID+2);	
end

function _75_01_(nType, nStateID)
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_critical_point_increase", 15, -1, 1, nStateID+2);
end

function _75_02_(nType, nStateID)
		CastState("state_life_max_point_add", 30000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_m_attack_percent_add", 30, -1, 1, nStateID+2);
		CastState("state_p_attack_percent_add", 30, -1, 1, nStateID+3);
end

function _76_01_(nType, nStateID)
		CastState("state_burst_enhance_rate", 8, -1, 1, nStateID);
		CastState("state_medicine_time_increase", 40, -1, 1, nStateID+1);
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID+2);
		CastState("state_add_book_attribute_value", 5, -1, 1, nStateID+3);
		CastState("state_add_allability", 30, -1, 1, nStateID+4);
end

--Hieu Bang
function _72_10_(nType, nStateID)
		CastState("state_life_max_point_add", 40000, -1, 1, nStateID);
		CastState("state_def_critical_damage_increase", 100, -1, 1, nStateID+1);
		CastState("state_def_critical_point_increase", 50, -1, 1, nStateID +2);
		CastState("state_dodge_point_increase", 550, -1, 1, nStateID+3);
end

function _72_09_(nType, nStateID)
		CastState("state_life_max_point_add", 35000, -1, 1, nStateID);
		CastState("state_def_critical_damage_increase", 80, -1, 1, nStateID+1);
		CastState("state_def_critical_point_increase", 40, -1, 1, nStateID +2);
		CastState("state_dodge_point_increase", 500, -1, 1, nStateID+3);
end

function _72_08_(nType, nStateID)
	CastState("state_life_max_point_add", 30000, -1, 1, nStateID);
	CastState("state_def_critical_damage_increase", 70, -1, 1, nStateID+1);
	CastState("state_def_critical_point_increase", 35, -1, 1, nStateID +2);
	CastState("state_dodge_point_increase", 450, -1, 1, nStateID+3);
end

function _72_07_(nType, nStateID)
	CastState("state_life_max_point_add", 25000, -1, 1, nStateID);
	CastState("state_def_critical_damage_increase", 60, -1, 1, nStateID+1);
	CastState("state_def_critical_point_increase", 30, -1, 1, nStateID +2);
	CastState("state_dodge_point_increase", 400, -1, 1, nStateID+3);
end

function _72_06_(nType, nStateID)
	CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
	CastState("state_def_critical_damage_increase", 50, -1, 1, nStateID+1);
	CastState("state_def_critical_point_increase", 25, -1, 1, nStateID +2);
	CastState("state_dodge_point_increase", 350, -1, 1, nStateID+3);
end

function _72_05_(nType, nStateID)
	CastState("state_life_max_point_add", 18000, -1, 1, nStateID);
	CastState("state_def_critical_damage_increase", 40, -1, 1, nStateID+1);
	CastState("state_def_critical_point_increase", 20, -1, 1, nStateID +2);
	CastState("state_dodge_point_increase", 300, -1, 1, nStateID+3);
end

function _72_04_(nType, nStateID)
	CastState("state_life_max_point_add", 16000, -1, 1, nStateID);
	CastState("state_def_critical_damage_increase", 25, -1, 1, nStateID+1);
	CastState("state_def_critical_point_increase", 16, -1, 1, nStateID +2);
	CastState("state_dodge_point_increase", 250, -1, 1, nStateID+3);
end

function _72_03_(nType, nStateID)
	CastState("state_life_max_point_add", 14000, -1, 1, nStateID);
	CastState("state_def_critical_damage_increase", 20, -1, 1, nStateID+1);
	CastState("state_def_critical_point_increase", 14, -1, 1, nStateID +2);
	CastState("state_dodge_point_increase", 200, -1, 1, nStateID+3);
end

function _72_02_(nType, nStateID)
	CastState("state_life_max_point_add", 12000, -1, 1, nStateID);
	CastState("state_def_critical_damage_increase", 15, -1, 1, nStateID+1);
	CastState("state_def_critical_point_increase", 12, -1, 1, nStateID +2);
	CastState("state_dodge_point_increase", 150, -1, 1, nStateID+3);
end

function _72_01_(nType, nStateID)
	CastState("state_life_max_point_add", 10000, -1, 1, nStateID);
	CastState("state_def_critical_damage_increase", 10, -1, 1, nStateID+1);
	CastState("state_def_critical_point_increase", 10, -1, 1, nStateID +2);
	CastState("state_dodge_point_increase", 100, -1, 1, nStateID+3);
end

function _69_01_(nType, nStateID)
	CastState("state_life_max_point_add", 8000, -1, 1, nStateID);
	CastState("state_add_allability", 20, -1, 1, nStateID + 1)
	CastState("state_physical_armor_add", 60, -1, 1, nStateID+2);
	CastState("state_magic_armor_add", 60, -1, 1, nStateID+3);
	CastState("state_p_attack_percent_add", 6, -1, 1, nStateID+4);
	CastState("state_m_attack_percent_add", 6, -1, 1, nStateID+5);
end


function _69_02_(nType, nStateID)
	CastState("state_life_max_point_add", 6000, -1, 1, nStateID);
	CastState("state_add_allability", 10, -1, 1, nStateID + 1)
	CastState("state_physical_armor_add", 35, -1, 1, nStateID+2);
	CastState("state_magic_armor_add", 35, -1, 1, nStateID+3);
end