--filename:汴京饺子楼老板.lua
--create date:2006-01-05
--author:yanjun
--describe:汴京饺子楼老板脚本

RING_COUNTER = 0	--龙戒计数器

Include("\\script\\online\\春节活动\\newyear_head.lua")	

function main()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	-- local nDate = tonumber(date("%m%d"))
	-- if nDate < 0216 then
		-- Say("Ch骳 m鋓 ngi n╩ m韎 vui v�, v祇 <color=red>ng祔 16/02/2008<color> b鎛 ti謒 s� ch輓h th鴆 m� c鯽, c竎 v�"..strSex.."nh� gh� nh�!",0)
		-- return 0
	-- end
	-- if nDate > 0221 then
		-- Say("T誸 qua r錳, b鎛 ti謒 xin ph衟 ng c鯽 ngh�! C竎 v� "..strSex.." nh� t誸 n╩ sau n 駈g h� b鎛 ti謒 nh�!",0)
		-- return 0
	-- end
	if NEWYEAR_SWITCH == 1 then
		local selTab = {
					"Ch� bi課 s駃 c秓./make_dumpling",
					"фi ph莕 thng/request_award",
					"Ti謒 s駃 c秓/know_detail",
					"Ta ch� gh� ngang qua th玦./nothing"
					}
		Say("骾 ch�!"..strSex.."m阨 v祇 trong, h穣 gi髉  qu竛 nh�!",4,selTab)
	else
		Say("B鎛 ti謒 ch璦 m� c鯽,"..strSex.."h穣 i v礽 ng祔.",0)
		return 0
	end
end

function make_dumpling()
	local selTab = {
		"S駃 c秓 b緋 c秈/select_baicai",
		"S駃 c秓 c� r鑤/select_luobo",
		"S駃 c秓 rau c莕/select_qincai",
		"S駃 c秓 kim chi/select_suancai",
		"S駃 c秓 rau h�/select_jiucai",
		"Trang sau./see_nextpage",
		"Ta ch璦 mu鑞 ╪!/nothing"
		}
	Say("Kh竎h quan mu鑞 ╪ s駃 c秓 lo筰 n祇?",7,selTab)
end

function see_nextpage()
	local selTab = {
		"S駃 c秓 th辴 heo/select_zhurou",
		"S駃 c秓 th辴 b�/select_niurou",
		"S駃 c秓 t玬/select_xiaren",
		"Tam Ti猲 s駃 c秓/select_sanxian",
		"S駃 c秓 may m緉/select_xingyun",
		"S駃 c秓 th駓 tinh/select_shuijing",
		"Trang trc./see_prepage",
		"Ta ch璦 mu鑞 ╪!/nothing"
		}
	Say("Kh竎h quan mu鑞 ╪ s駃 c秓 lo筰 n祇?",8,selTab)
end

function see_prepage()
	make_dumpling()
end

function request_award()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	local selTab = {
		"Ta mu鑞 i s駃 c秓 may m緉 l蕐 1 quy觧 m藅 t辌h./want_miji",
		"Ta mu鑞 i s駃 c秓 th駓 tinh v� Long c鑤 l蕐 1 m鉵 trang s鴆./want_shipin",
		"Ta ch璦 mu鑞 i l蕐 ph莕 thng./nothing"
		}
	Say("Kh竎h quan mu鑞 d飊g s駃 c秓 lo筰 n祇  i ph莕 thng?",3,selTab)
end

function know_detail()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	Say("S駃 c秓 c馻 b鎛 ti謒 n鎖 ti課g kh緋 n琲, n╩ x璦 Th竔 t� ho祅g   ch th﹏ t竛 thng m飅 v� th琺 ngon c馻 s駃 c秓. Nh璶g b鎛 ti謒 c� 2 quy t綾: m鏸 n╩ ch� b竛 m蕐 ng祔 t誸 v� s駃 c秓 ch� l祄 gi髉 ch� kh玭g b竛, nguy猲 li謚 ph秈 t� chu萵 b�."..strSex.."N誹  n緈 r� quy t綾, sao kh玭g tranh th� thu th藀 nguy猲 li謚, b鎛 ti謒 b秓 m s� l祄 ra nh鱪g s駃 c秓 th琺 ngon, ╪ v祇 nh� m穒 hng v�.",0)
end

function nothing()

end

function want_miji()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(2,1,252) >= 1 then
		if DelItem(2,1,252,1) == 1 then
			if AddItem(0,107,155,1) == 1 then
				WriteLog("[Ho箃 ng m颽 xu﹏ d飊g s駃 c秓 i ph莕 thng]:"..GetName().."i s駃 c秓 may m緉 l蕐 1 quy觧 m藅 t辌h.")
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 quy觧 m藅 t辌h.")
			end
		end
	else
		Say("Dng nh�"..strSex..", qu猲 mang hay l�  ╪ h誸 r錳?",0)
	end
end

function want_shipin()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if RING_COUNTER >= 50 then
		Say("Ho箃 ng s駃 c秓 x秠 ra l鏸 h� th鑞g, h穣 li猲 h� GM  kh綾 ph鬰!",0)
		return 0
	end
	if GetItemCount(2,1,253) >= 1 and GetItemCount(2,1,116) >= 1 then
		if DelItem(2,1,253,1) == 1 and DelItem(2,1,116,1) == 1 then
			if AddItem(0,102,24,1,1,-1,-1,-1,-1,-1,-1) == 1 then
				RING_COUNTER = RING_COUNTER + 1
				WriteLog("[Ho箃 ng m颽 xu﹏ d飊g s駃 c秓 i ph莕 thng]:"..GetName().."d飊g s駃 c秓 th駓 tinh v� Long c鑤 i Йng Phng Long Ch﹗.")
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 m鉵 trang s鴆.")
				AddGlobalNews("Ch骳 m鮪g"..GetName().."Nh薾 頲 Йng Phng Long Ch﹗.")
			end
		end
	else
		Say("Dng nh�"..strSex..", qu猲 mang theo �?",0)
	end
end
--===========================================================================
--===========================================================================
--===========================================================================
--===========================================================================
function select_niurou()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 th辴 b�./make_niurou",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 th辴 b�<color>: <color=red>1 S駃 c秓 th辴 heo, 1 th辴 b�, 1 b閠 m�<color>, 30 lng b筩, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 h誸. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end

function select_zhurou()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 th辴 heo./make_zhurou",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 th辴 heo<color>: <color=red>1 S駃 c秓 rau h�, 1 th辴 heo, 1 b閠 m�<color>, 20 lng b筩, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 h誸. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end

function select_xiaren()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 t玬./make_xiaren",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 t玬<color>: <color=red>1 s駃 c秓 th辴 b�, 1 t玬 n鈔, 1 b閠 m�<color>, 40 lng b筩, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 h誸. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end

function select_luobo()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 c� c秈./make_luobo",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 c� c秈<color>: <color=red>1 S駃 c秓 c秈 tr緉g, 1 c� c秈, 1 b閠 m�, 1 th藀 tam hng<color>, 1 lng b筩, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 h誸. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end

function select_suancai()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 d璦 chua./make_suancai",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 d璦 chua<color>: <color=red>1 S駃 c秓 c莕 t﹜, 1 c秈 tr緉g, 1 b閠 m�, 1 th藀 tam hng<color>, 4 lng b筩, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 h誸. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end

function select_baicai()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 c秈 tr緉g./make_baicai",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 c秈 tr緉g<color>: <color=red>1 c秈 tr緉g, 1 b閠 m�, 1 th藀 tam hng<color>, 1 lng b筩, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 h誸. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end

function select_qincai()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 c莕 t﹜./make_qincai",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 c莕 t﹜<color>: <color=red>1 s駃 c秓 c� c秈, 1 c莕 t﹜, 1 b閠 m�, 1 th藀 tam hng<color>, 2 lng b筩, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 h誸. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end

function select_jiucai()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 rau h�./make_jiucai",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 rau h�<color>: <color=red>1 s駃 c秓 d璦 chua, 1 rau h�, 1 b閠 m�, 1 th藀 tam hng<color>, 8 lng b筩, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 h誸. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end

function select_sanxian()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 ba m鉵./make_sanxian",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 ba m鉵<color>: <color=red>3 S駃 c秓 t玬<color>, 1 lng v祅g, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 1 s駃 c秓 t玬. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end

function select_xingyun()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 may m緉./make_xingyun",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 may m緉<color>: <color=red>3 S駃 c秓 ba m鉵<color>, 4 lng v祅g, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 1 S駃 c秓 ba m鉵. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end

function select_shuijing()
	local selTab = {
				"Л琻g nhi猲, ta 產ng mu鑞 ╪ s駃 c秓 th駓 tinh./make_shuijing",
				"в ta suy ngh� l筰./noting"
				}
	Say("Nguy猲 li謚  l祄 <color=yellow>S駃 c秓 th駓 tinh<color>: <color=red>3 S駃 c秓 may m緉<color>, 20 lng v祅g, n誹 th蕋 b筰 nguy猲 li謚 s� m蕋 1 s駃 c秓 may m緉. Ng礽 c� mu鑞 l祄 kh玭g?",2,selTab)
end
--===========================================================================
--===========================================================================
--===========================================================================
--===========================================================================
function make_niurou()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(1,1,33) == 0 or GetItemCount(2,1,258) == 0  or GetItemCount(2,1,255) == 0 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end
	if GetCash() < 3000 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if DelItem(1,1,33,1) == 1 and DelItem(2,1,258,1) == 1 and DelItem(2,1,255,1) == 1 then
		Pay(3000)
		if nRandomNum <= 50 then
			if AddItem(1,1,34,1) == 1 then
				WriteLog("[Ho箃 ng m颽 xu﹏ Ch� bi課 s駃 c秓]:"..GetName().."Nh薾 頲 1 s駃 c秓 th辴 b�.")
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 th辴 b�")
			end
		else
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸!",0)
			Msg2Player("Ch� bi課 s駃 c秓 th辴 b� th蕋 b筰.")
		end
	end
end

function make_zhurou()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(2,1,247) == 0 or GetItemCount(2,1,257) == 0  or GetItemCount(2,1,255) == 0 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end		
	if GetCash() < 2000 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end
	if DelItem(2,1,247,1) == 1 and DelItem(2,1,257,1) == 1 and DelItem(2,1,255,1) == 1 then
		Pay(2000)
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			if AddItem(1,1,33,1) == 1 then
				WriteLog("[Ho箃 ng m颽 xu﹏ Ch� bi課 s駃 c秓]:"..GetName().."Nh薾 頲 1 s駃 c秓 th辴 heo.")
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 th辴 heo")
			end
		else
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸!",0)
			Msg2Player("Ch� bi課 s駃 c秓 th辴 heo th蕋 b筰.")
		end	
	end
end

function make_xiaren()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(2,1,259) == 0 or GetItemCount(1,1,34) == 0  or GetItemCount(2,1,255) == 0 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end		
	if GetCash() < 4000 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end
	if DelItem(2,1,259,1) == 1 and DelItem(1,1,34,1) == 1 and DelItem(2,1,255,1) == 1 then
		Pay(4000)
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			if AddItem(1,1,35,1) == 1 then
				WriteLog("[Ho箃 ng m颽 xu﹏ Ch� bi課 s駃 c秓]:"..GetName().."Nh薾 頲 1 s駃 c秓 t玬.")
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 t玬")
			end
		else
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸!",0)
			Msg2Player("Ch� bi課 s駃 c秓 t玬 th蕋 b筰.")
		end		
	end
end

function make_luobo()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(2,1,243) == 0 or GetItemCount(2,1,260) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end
	if GetCash() < 100 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end
	if DelItem(2,1,243,1) == 1 and DelItem(2,1,260,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(100)
		local nRandomNum = random(1,100)
		if nRandomNum <= 70 then	
			if AddItem(2,1,244,1) == 1 then
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 c� c秈")
			end
		else
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸!",0)
			Msg2Player("Ch� bi課 s駃 c秓 c� c秈 th蕋 b筰.")
		end
	end
end

function make_suancai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(2,1,245) == 0 or GetItemCount(2,1,262) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end	
	if GetCash() < 400 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end	
	if DelItem(2,1,245,1) == 1 and DelItem(2,1,262,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(400)
		local nRandomNum = random(1,100)
		if nRandomNum <= 60 then
			if AddItem(2,1,246,1) == 1 then
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 d璦 chua")
			end
		else
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸! .",0)
			Msg2Player("Ch� bi課 s駃 c秓 d璦 chua th蕋 b筰.")
		end		
	end
end

function make_baicai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(2,1,262) == 0 or GetItemCount(2,1,255) == 0  or GetItemCount(2,1,256) == 0 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end		
	if GetCash() < 100 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end
	if DelItem(2,1,262,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(100)
		local nRandomNum = random(1,100)
		if nRandomNum <= 70 then
			if AddItem(2,1,243,1) == 1 then
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 c秈 tr緉g")
			end
		else
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸!",0)
			Msg2Player("Ch� bi課 s駃 c秓 c秈 tr緉g th蕋 b筰.")
		end		
	end
end

function make_qincai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(2,1,244) == 0 or GetItemCount(2,1,263) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end		
	if GetCash() < 200 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end
	if DelItem(2,1,244,1) == 1 and DelItem(2,1,263,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(200)
		local nRandomNum = random(1,100)
		if nRandomNum <= 70 then
			if AddItem(2,1,245,1) == 1 then
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 c莕 t﹜")
			end
		else
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸!",0)
			Msg2Player("Ch� bi課 s駃 c秓 c莕 t﹜ th蕋 b筰.")
		end			
	end
end

function make_jiucai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(2,1,246) == 0 or GetItemCount(2,1,264) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end	
	if GetCash() < 800 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end	
	if DelItem(2,1,246,1) == 1 and DelItem(2,1,264,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(800)
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			if AddItem(2,1,247,1) == 1 then
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 rau h�")
			end
		else
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸! .",0)
			Msg2Player("Ch� bi課 s駃 c秓 rau h� th蕋 b筰.")
		end		
	end
end

function make_sanxian()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(1,1,35) < 3 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end		
	if GetCash() < 10000 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if nRandomNum <= 33 then
		if DelItem(1,1,35,3) == 1 then
			Pay(10000)
			if AddItem(2,1,251,1) == 1 then
				WriteLog("[Ho箃 ng m颽 xu﹏ Ch� bi課 s駃 c秓]:"..GetName().."Nh薾 頲 1 s駃 c秓 ba m鉵.")
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 ba m鉵")
			end
		end
	else
			DelItem(1,1,35,1)
			Pay(10000)
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸! .",0)
			Msg2Player("Ch� bi課 s駃 c秓 ba m鉵 th蕋 b筰.")	
	end
end

function make_xingyun()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if GetItemCount(2,1,251) < 3 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end		
	if GetCash() < 40000 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if nRandomNum <= 33 then
		if DelItem(2,1,251,3) == 1 then
			Pay(40000)
			if AddItem(2,1,252,1) == 1 then
				WriteLog("[Ho箃 ng m颽 xu﹏ Ch� bi課 s駃 c秓]:"..GetName().."Nh薾 頲 1 s駃 c秓 may m緉.")
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 may m緉")
			end
		end
	else
			DelItem(2,1,251,1)
			Pay(40000)
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸!",0)
			Msg2Player("Ch� bi課 s駃 c秓 may m緉 th蕋 b筰.")	
	end
end

function make_shuijing()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C� nng"
	else
		strSex = "Thi誹 hi謕/N� hi謕"
	end
	if RING_COUNTER >= 50 then	--超过50个就不再产生了
		return 0
	end
	if GetItemCount(2,1,252) < 3 then
		Say("Xin l鏸, b筺 kh玭g  v藅 li謚.",0)
		return 0
	end		
	if GetCash() < 200000 then
		Say("Xin l鏸, b筺 kh玭g  ti襫.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if nRandomNum <= 20 then
		if DelItem(2,1,252,3) == 1 then
			Pay(200000)
			if AddItem(2,1,253,1) == 1 then
				WriteLog("[Ho箃 ng m颽 xu﹏ Ch� bi課 s駃 c秓]:"..GetName().."nh薾 頲 1 s駃 c秓 th駓 tinh.")
				Say("S駃 c秓 th琺 ngon y!"..strSex.."h穣 thng th鴆!",0)
				Msg2Player("B筺 nh薾 頲 1 s駃 c秓 th駓 tinh")
			end
		end
	else
			DelItem(2,1,252,1)
			Pay(200000)
			Say("Sao th�? L� n祇 l筰 th蕋 b筰? Th藅 xin l鏸!",0)
			Msg2Player("Ch� bi課 s駃 c秓 th駓 tinh th蕋 b筰.")	
	end
end
