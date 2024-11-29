--=============================================
--Created by TuanNA5
--Upgrade weapon
--=============================================

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\weapon_upgrade\\upgrade_head.lua");
Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\weapon_upgrade\\upgrade_extend.lua");
FILE_NAME = "\\script\\weapon_upgrade\\upgrade_npc.lua";
THUONGUNGTUONGQUAN_FILE = "\\script\\vng\\weapon_upgrade\\thuongung.lua";
THUONGUNGNGUYENSOAI_FILE = "\\script\\vng\\weapon_upgrade\\thuongungnguyensoai.lua";
LOIHONGUYENSOAI_FILE = "\\script\\vng\\weapon_upgrade\\loihonguyensoai.lua";
BACHKIMVIEMDE100_FILE = "\\script\\vng\\weapon_upgrade\\bachkimviemde100.lua";
RENLAIVUKHI_FILE = "\\script\\vng\\weapon_upgrade\\renlaivukhi.lua";

NGULONGTUONGQUANCHANGE_FILE = "\\script\\vng\\weapon_upgrade\\ngulongtuongquan_change.lua";
THUONGUNGTUONGQUANCHANGE_FILE = "\\script\\vng\\weapon_upgrade\\thuongungtuongquan_change.lua";
DAINGUYENSOAICHANGE_FILE = "\\script\\vng\\weapon_upgrade\\dainguyensoai_change.lua";
THUONGUNGNGUYENSOAICHANGE_FILE = "\\script\\vng\\weapon_upgrade\\thuongungnguyensoai_change.lua";
THIENCHITUONGQUAN100_FILE = "\\script\\vng\\weapon_upgrade\\thienchituongquan100.lua"
NGULONGTUONGQUAN100_FILE = "\\script\\vng\\weapon_upgrade\\ngulongtuongquan100.lua"
NGULONG2THUONGUNGTUONGQUAN100_FILE = "\\script\\vng\\weapon_upgrade\\thuongungtuongquan100.lua";
TUONGQUAN2THUONGUNGTUONGQUAN_FILE = "\\script\\vng\\weapon_upgrade\\tuongquan2thuongungtuongquan100.lua"
THIENCHITUONGQUAN2THUONGUNGTUONGQUAN_FILE = "\\script\\vng\\weapon_upgrade\\thienchituongquan2thuongungtuongquan100.lua"
BACHU2VOSONG_FILE = "\\script\\vng\\weapon_upgrade\\bachu2vosong.lua"
THUONGUNGNGUYENSOAI100_FILE = "\\script\\vng\\weapon_upgrade\\dainguyensoai2thuongungnguyensoai100.lua";
THUONGUNGTUONGQUAN2LOIHOTUONGQUAN_FILE = "\\script\\vng\\weapon_upgrade\\tuongquan_thuongung2loiho.lua";
THUONGUNGNGUYENSOAI2LOIHONGUYENSOAI_FILE = "\\script\\vng\\weapon_upgrade\\nguyensoai_thuongung2loiho.lua";

g_szNpcName = "<color=green>�� t� th� r�n L�u: <color>";

function npc_upgrade_talk()
	local nDate = tonumber(date("%Y%m%d"))
	local tSay = {	
			"N�ng c�p v� kh� Vi�t Y�n/upgrade_vietyen",
			"C�i t�o v� kh� ��i Vi�t Y�n/remake_daivietyen",
			"N�ng c�p trang b� s� m�n/upgrade_sumon4",
			"Ch� t�o v� n�ng c�p v� kh� B� Phi Y�n/create_bpy",			
			"Ch� t�o trang b� S� m�n c�p 4/make_shimen_tier4",
			"N�ng c�p v� kh� Vi�t Y�n, ��i Vi�t Y�n/upgrade_vy",
			"N�ng c�p trang b� Thi�n Chi Vi�m �� th�nh B�ch Kim Vi�m ��/upgrade_PlatinumEmperor",
			"N�ng c�p trang b� T� Quang Vi�m ��/upgrade_tq_emperor",
			"Chuy�n ��i trang b� T�ng Ki�m/change_cangjiang",
			"C�i t�o trang s�c T�ng Ki�m/upgrade_cangjiang",
			"N�ng c�p trang b� Thi�n Chi T�ng Ki�m/upgrade_tk_equipment",
			"C�i t�o trang b� Thi�n Chi T�ng Ki�m/upgrade_tctk_equipment",
			"N�ng c�p trang b� T� Quang/upgrade_tqc",
			"N�ng c�p trang b� T�ng Li�u/upgrade_songliao",
			"Ch� t�o Thi�n Qu�i Th�ch/make_tianguashi",
			"T�i h� ch� ti�n gh� ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Ng��i trong giang h� b�n t�u ph�i c� c�c lo�i trang b� t�t tr�n ng��i. N�u c�c h� c� th� t�m ���c c�c nguy�n li�u qu� hi�m �em ��n ��y, ta s� gi�p c�c h� ch� t�o c�c lo�i trang b� nh� �. <color=red>L�u �: C�c h� ph�i thi�t ��t m�t kh�u h�nh trang v� m� kh�a h�nh trang m�i c� th� ti�n h�nh n�ng c�p.<color>",getn(tSay),tSay)
end

function NangCapLevelVuKhi_Menu()
	local szSay = "- Sau khi n�ng c�p, hi�u qu� ��nh h�n, ��i ��nh h�n s� bi�n m�t.\n"
	szSay = szSay .. "- V� kh� �p linh th�ch n�ng c�p s� m�t gi� tr� linh kh�, gi� nguy�n thu�c t�nh �� �p.\n"
	szSay = szSay .. "- M�t s� thu�c t�nh sau s� c� t� l� b� gi�m sau khi �em �i n�ng c�p:\n"
	szSay = szSay .. "  + B� qua ph�ng ng� ��i ph��ng: 13%, 16% , 19% , 22%\n"
	szSay = szSay .. "  + H�y Sinh l�c, Nguy�n kh� ��i ph��ng:   25% , 30% , 35%\n"
	szSay = szSay .. "  + N�i l�c ��i ph��ng ti�u hao:  8% ,10% , 12% , 14%\n"
	szSay = szSay .. "  + Khi�n ��i ph��ng b� ch�y:  11% , 14% , 17% , 20%\n"
	szSay = szSay .. "  + S�t th��ng t�ng : 1-150"
	
	local tbSay = {
		"Ta �� hi�u r�, hay gi�p ta r�n l�i v� kh�/RenLaiVuKhi_Form",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(g_szNpcName..szSay,getn(tbSay),tbSay)
end

function ViemDeMenu()
	local tbSay = {
		"N�ng c�p trang b� T� Quang Vi�m �� th�nh Vi�m ��/upgrade_tq_emperor",
		"N�ng c�p trang b� T� Quang Vi�m �� th�nh Vi�m �� (th�nh c�ng 100%)/upgrade_tq_emperor_100",
		"N�ng c�p trang b� Vi�m �� th�nh Thi�n Chi Vi�m ��/upgrade_emperor",
		"N�ng c�p trang b� Vi�m �� th�nh Thi�n Chi Vi�m �� (100%)/upgrade_thienchiviemde",
		"N�ng c�p Thi�n Chi Vi�m �� th�nh B�ch Kim Vi�m ��/upgrade_bachkimviemde",
		"N�ng c�p Thi�n Chi Vi�m �� th�nh B�ch Kim Vi�m �� (100%)/upgrade_bachkimviemde_100_Form",
		"C�i t�o trang b� T� Quang Vi�m ��/upgrade_tqvd",
		"T�i h� ch� ti�n gh� ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Ng��i trong giang h� b�n t�u ph�i c� c�c lo�i trang b� t�t tr�n ng��i. N�u c�c h� c� th� t�m ���c c�c nguy�n li�u qu� hi�m �em ��n ��y, ta s� gi�p c�c h� ch� t�o c�c lo�i trang b� nh� �. <color=red>L�u �: C�c h� ph�i thi�t ��t m�t kh�u h�nh trang v� m� kh�a h�nh trang m�i c� th� ti�n h�nh n�ng c�p.<color>",getn(tbSay),tbSay)
end

function TuongQuanMenu()
	local tbSay = {
		"N�ng c�p trang b� T��ng Qu�n th�nh Thi�n Chi T��ng Qu�n/upgrade_gen",
		"N�ng c�p trang b� T��ng Qu�n th�nh Thi�n Chi T��ng Qu�n (100%)/upgrade_gen_100",
		"N�ng c�p trang b� T��ng Qu�n th�nh Thi�n Chi T��ng Qu�n (100%)/ThienChiTuongQuan100Upgrade_Form",
		"N�ng c�p trang b� Thi�n Chi T��ng Qu�n th�nh Ng� Long T��ng Qu�n/upgrade_gen1",
		"N�ng c�p trang b� Thi�n Chi T��ng Qu�n th�nh Ng� Long T��ng Qu�n (100%)/upgrade_gen2",
		"N�ng c�p trang b� Thi�n Chi T��ng Qu�n th�nh Ng� Long T��ng Qu�n t� l� (100%)/upgrade_gen2_100",
		"N�ng c�p trang b� Thi�n Chi T��ng Qu�n th�nh Ng� Long T��ng Qu�n t� l� (100%)/NguLongTuongQuan100Upgrade_Form",
		"N�ng c�p trang b� Ng� Long T��ng Qu�n th�nh Th��ng �ng T��ng Qu�n/ThienUngTuongQuanUpgrade_Form",
		"N�ng c�p trang b� T��ng Qu�n th�nh Th��ng �ng T��ng Qu�n/TuongQuan2ThuongUngTuongQuan_Form",
		"N�ng c�p trang b� Thi�n Chi T��ng Qu�n th�nh Th��ng �ng T��ng Qu�n/ThienChi2ThuongUngTuongQuan_Form",
		"N�ng c�p trang b� Ng� Long T��ng Qu�n th�nh Th��ng �ng T��ng Qu�n/NguLong2ThuongUngTuongQuan100Upgrade_Form",
		"Chuy�n ��i trang b� Ng� Long T��ng Qu�n/NguLongTuongQuanChange_Form",
		"Chuy�n ��i trang b� Th��ng �ng T��ng Qu�n/ThuongUngTuongQuanChange_Form",
		"C�i t�o trang b� Ng� Long T��ng Qu�n/upgrade_nltq_clothes",
		"Chuy�n ��i trang b� Ng� Long T��ng Qu�n/NguLongTuongQuanChange_Menu",
		"Chuy�n ��i trang b� Th��ng �ng T��ng Qu�n/ThuongUngTuongQuanChange_Menu",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."Ng��i trong giang h� b�n t�u ph�i c� c�c lo�i trang b� t�t tr�n ng��i. N�u c�c h� c� th� t�m ���c c�c nguy�n li�u qu� hi�m �em ��n ��y, ta s� gi�p c�c h� ch� t�o c�c lo�i trang b� nh� �. <color=red>L�u �: C�c h� ph�i thi�t ��t m�t kh�u h�nh trang v� m� kh�a h�nh trang m�i c� th� ti�n h�nh n�ng c�p.<color>",getn(tbSay),tbSay)
end

function NguyenSoaiMenu()
	local tbSay = {
		"N�ng c�p trang b� Nguy�n So�i th�nh Ng� Long - Thi�u Th�nh Nguy�n So�i/upgrade_mar",
		"N�ng c�p trang b� Ng� Long - Thi�u Th�nh th�nh Ng� Long - Chi�u Th�nh Nguy�n So�i/upgrade_upper_mar",
		"Ng� Long - Thi�u Th�nh Nguy�n So�i th�nh ��i T�ng-Li�u Nguy�n So�i (100%)/upgrade_upper_mar_100",
		"N�ng c�p ��i T�ng-Li�u Nguy�n So�i th�nh Th��ng �ng Nguy�n So�i/ThuongUngNguyenSoai_Form",
		"N�ng c�p ��i T�ng-Li�u Nguy�n So�i th�nh Th��ng �ng Nguy�n So�i 100%/ThuongUngNguyenSoai100_Form",
		"Chuy�n ��i trang b� ��i Nguy�n So�i/DaiNguyenSoaiChange_Form",
		"Chuy�n ��i trang b� Th��ng �ng Nguy�n So�i/ThuongUngNguyenSoaiChange_Form",
		"N�ng c�p ��i T�ng-Li�u Nguy�n So�i th�nh L�i H� Nguy�n So�i/LoiHoNguyenSoai_Form",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."Ng��i trong giang h� b�n t�u ph�i c� c�c lo�i trang b� t�t tr�n ng��i. N�u c�c h� c� th� t�m ���c c�c nguy�n li�u qu� hi�m �em ��n ��y, ta s� gi�p c�c h� ch� t�o c�c lo�i trang b� nh� �. <color=red>L�u �: C�c h� ph�i thi�t ��t m�t kh�u h�nh trang v� m� kh�a h�nh trang m�i c� th� ti�n h�nh n�ng c�p.<color>",getn(tbSay),tbSay)
end

function ThienUngTuongQuanUpgrade_Form()
	PutinItemBox("Ch� t�o trang b�" ,1 , "X�c nh�n mu�n th�c hi�n ch� t�o?", THUONGUNGTUONGQUAN_FILE, 1)
end


function ThuongUngTuongQuanChange_Form(nOption)
	local szSay = ""
	if nOption >=0 then
		szSay = "Chuy�n ��i trang b� Th��ng �ng T��ng Qu�n c��ng h�a "..nOption.." tr� l�n c�n:\n"
		szSay = szSay .. "  + Kh�i, Gi�p Trang: C��ng h�a "..nOption.." tr� l�n, 10 Thi�n Th�ch Tinh Th�ch, 2.000 v�ng\n"
		szSay = szSay .. "Nh�n l�i trang b� Th��ng �ng T��ng Qu�n <color=yellow>+"..nOption.."<color>, m�t hi�u qu� ��nh h�n, ��i ��nh h�n.\n"
	else
		szSay = "Chuy�n ��i ng�c b�i Th��ng �ng T��ng Qu�n c�n:\n"
		szSay = szSay .. "  + Ph�, L�nh, K�: 20 Thi�n Th�ch Tinh Th�ch, 4.000 v�ng\n"
	end
	szSay = szSay .. "<color=red>T� l� th�nh c�ng 100%<color>"
	tbSay = {
		"Ti�n h�nh chuy�n ��i/#ThuongUngTuongQuanChange_Done("..nOption..")",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(g_szNpcName..szSay,getn(tbSay),tbSay)
end

function ThuongUngTuongQuanChange_Done(nOption)
	if abs(GetTask(701)) < 250000 then
		Talk(1,"",g_szNpcName.."C�ng tr�ng ng��i �t v�y ta ch�ng mu�n ra tay gi�p ��. H�y c� g�ng ��t 250000 c�ng tr�ng, ta s� ngh� l�i...")
		return 0
	end
	if abs(GetTask(704)) < 5 then
		Talk(1,"",g_szNpcName.."Ta ch� nh�n l�m cho c�c v� T��ng Qu�n th�i, cho n�n.... ng��i h�y c� g�ng th�m n�a nh�!")
		return 0
	end
	SetTaskTemp(TSK_TMP_CHUYENDOITRANGBI, nOption)
	PutinItemBox("Chuy�n ��i trang b�" ,1 , "X�c nh�n mu�n th�c hi�n chuy�n ��i?", THUONGUNGTUONGQUANCHANGE_FILE, 1)
end


function NguLongTuongQuanChange_Form(nOption)
	local szSay = ""
	if nOption >=0 then
		szSay = "Chuy�n ��i trang b� Ng� Long T��ng Qu�n c��ng h�a "..nOption.." tr� l�n c�n:\n"
		szSay = szSay .. "  + Kh�i, Gi�p Trang: C��ng h�a "..nOption.." tr� l�n, 5 Thi�n Th�ch Tinh Th�ch, 1.000 v�ng\n"
		szSay = szSay .. "Nh�n l�i trang b� Ng� Long T��ng Qu�n <color=yellow>+"..nOption.."<color>, m�t hi�u qu� ��nh h�n, ��i ��nh h�n.\n"
	else
		szSay = "Chuy�n ��i ng�c b�i Ng� Long T��ng Qu�n c�n:\n"
		szSay = szSay .. "  + Ph�, L�nh, K�: 10 Thi�n Th�ch Tinh Th�ch, 2.000 v�ng\n"
	end
	szSay = szSay .. "<color=red>T� l� th�nh c�ng 100%<color>"
	tbSay = {
		"Ti�n h�nh chuy�n ��i/#NguLongTuongQuanChange_Done("..nOption..")",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(g_szNpcName..szSay,getn(tbSay),tbSay)
end

function NguLongTuongQuanChange_Done(nOption)
	if abs(GetTask(701)) < 250000 then
		Talk(1,"",g_szNpcName.."C�ng tr�ng ng��i �t v�y ta ch�ng mu�n ra tay gi�p ��. H�y c� g�ng ��t 250000 c�ng tr�ng, ta s� ngh� l�i...")
		return 0
	end
	if abs(GetTask(704)) < 5 then
		Talk(1,"",g_szNpcName.."Ta ch� nh�n l�m cho c�c v� T��ng Qu�n th�i, cho n�n.... ng��i h�y c� g�ng th�m n�a nh�!")
		return 0
	end
	SetTaskTemp(TSK_TMP_CHUYENDOITRANGBI, nOption)
	PutinItemBox("Chuy�n ��i trang b�" ,1 , "X�c nh�n mu�n th�c hi�n chuy�n ��i?", NGULONGTUONGQUANCHANGE_FILE, 1)
end


function DaiNguyenSoaiChange_Form()
	local szSay = "Chuy�n ��i trang b� ��i Nguy�n So�i c�n:\n"
	szSay = szSay .. "  + Kh�i, Gi�p Trang: C��ng h�a 13 tr� l�n, 20 Thi�n Th�ch Tinh Th�ch, 4.000 v�ng\n"
	szSay = szSay .. "  + Ph�, L�nh, K�: 35 Thi�n Th�ch Tinh Th�ch, 5.000 v�ng\n"
	szSay = szSay .. "Nh�n l�i trang b� ��i Nguy�n So�i <color=yellow>+13<color>, m�t hi�u qu� ��nh h�n, ��i ��nh h�n.\n"
	szSay = szSay .. "<color=red>T� l� th�nh c�ng 100%<color>"
	tbSay = {
		"Ti�n h�nh chuy�n ��i/DaiNguyenSoaiChange_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(g_szNpcName.. szSay,getn(tbSay),tbSay)
end

function DaiNguyenSoaiChange_Done()
	PutinItemBox("Chuy�n ��i trang b�" ,1 , "X�c nh�n mu�n th�c hi�n chuy�n ��i?", DAINGUYENSOAICHANGE_FILE, 1)
end


function ThuongUngNguyenSoaiChange_Form()
	local szSay = "Chuy�n ��i trang b� Th��ng �ng Nguy�n So�i c�n:\n"
	szSay = szSay .. "  + Kh�i, Gi�p Trang: C��ng h�a 14 tr� l�n, 35 Thi�n Th�ch Tinh Th�ch, 5.000 v�ng\n"
	szSay = szSay .. "  + Ph�, L�nh, K�: 50 Thi�n Th�ch Tinh Th�ch, 5.000 v�ng\n"
	szSay = szSay .. "Nh�n l�i trang b� Th��ng �ng Nguy�n So�i <color=yellow>+14<color>, m�t hi�u qu� ��nh h�n, ��i ��nh h�n.\n"
	szSay = szSay .. "<color=red>T� l� th�nh c�ng 100%<color>"
	tbSay = {
		"Ti�n h�nh chuy�n ��i/ThuongUngNguyenSoaiChange_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(g_szNpcName.. szSay,getn(tbSay),tbSay)
end

function ThuongUngNguyenSoaiChange_Done()
	PutinItemBox("Chuy�n ��i trang b�" ,1 , "X�c nh�n mu�n th�c hi�n chuy�n ��i?", THUONGUNGNGUYENSOAICHANGE_FILE, 1)
end



function ThuongUngNguyenSoai_Form()
	tbSay = {
		"Ti�n h�nh n�ng c�p/ThuongUngNguyenSoai_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(g_szNpcName.."N�ng c�p trang b� ��i T�ng-Li�u Nguy�n So�i th�nh Th��ng �ng Nguy�n So�i c�n:\n* N�n, gi�p, qu�n: Trang b� ��i T�ng-Li�u Nguy�n So�i c��ng h�a 13 tr� l�n, 15 B�ch Kim H�ng Bao (4000 v�ng), 4 N� Oa Tinh Th�ch, 1000 v�ng <color=red>(th�t b�i s� m�t 1000 v�ng, 1 Ho�ng Kim H�ng Bao ho�c 1 N� Oa Tinh Th�ch)<color>\n* So�i H�, So�i L�nh, So�i Ph�, So�i K�: 20 B�ch Kim H�ng Bao (4000 v�ng), 6 N� Oa Tinh Th�ch, 2000 v�ng <color=red>(th�t b�i s� m�t 2000 v�ng, 1 Ho�ng Kim H�ng Bao ho�c 1 N� Oa Tinh Th�ch)<color>",getn(tbSay),tbSay)
end

function ThuongUngNguyenSoai_Done()
	if abs(GetTask(701)) <1500000 then
		Talk(1,"",g_szNpcName.."C�ng tr�ng ng��i �t v�y ta ch�ng mu�n ra tay gi�p ��. H�y c� g�ng ��t 1500000 c�ng tr�ng, ta s� ngh� l�i...")
		return 0
	end
	if abs(GetTask(704)) < 6 then
		Talk(1,"",g_szNpcName.."Ta ch� nh�n l�m cho c�c v� Nguy�n So�i th�i, cho n�n.... ng��i h�y c� g�ng th�m n�a nh�!")
		return 0
	end
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", THUONGUNGNGUYENSOAI_FILE, 1)
end

function LoiHoNguyenSoai_Form()
	tbSay = {
		"Ti�n h�nh n�ng c�p/LoiHoNguyenSoai_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(g_szNpcName.."N�ng c�p trang b� ��i T�ng-Li�u Nguy�n So�i th�nh L�i H� Nguy�n So�i c�n:\n* Trang b� c�n n�ng c�p (N�n, gi�p, qu�n: C�n c��ng h�a 13 tr� l�n)\n* 3 nguy�n li�u: 200 Hu�n Ch��ng Anh H�ng, 16 C�u Thi�n V� C�c ��n, 120000 �i�m t�ch l�y chi�n tr��ng.\n<color=red>L�u �: t� l� th�nh c�ng 100%.<color>",getn(tbSay),tbSay)
end

function LoiHoNguyenSoai_Done()
	
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", LOIHONGUYENSOAI_FILE, 1)
end

function npc_convert_talk()
		local tSay = {			
			"* Chuy�n ��i trang b� Ti�n Phong (c�n 1 T� Kim H�ng Bao + 100 v�ng)/#do_upgrade(22,0)",			
			"* Chuy�n ��i trang b� T��ng Qu�n (c�n 1 T� Kim H�ng Bao + 100 v�ng)/#do_upgrade(23,0)",
			"* Chuy�n ��i trang b� Thi�n Chi T��ng Qu�n (c�n 1 T� Kim H�ng Bao + 100 v�ng)/#do_upgrade(24,0)",
			"T�i h� ch� ti�n gh� ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Ch�n lo�i trang b� T�ng Li�u mu�n chuy�n ��i?",getn(tSay),tSay)
end

function create_bpy()
	local tSay = {
		"* Ch� t�o v� kh� B� Phi Y�n ng�u nhi�n (c�n 3 Phi Y�n Th�ch + 100 v�ng)/#do_upgrade(1,0)",
		"* Ch� t�o v� kh� B� Phi Y�n t� ch�n (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 100 v�ng)/select_bpy_1",
		"* N�ng c�p v� kh� B� Phi Y�n (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 V� Kh� B� Phi Y�n (s� c�p) c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(21,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta ch� t�o lo�i v� kh� n�o? <color=red>L�u �: t� l� th�nh c�ng 100%.<color>",getn(tSay),tSay)
end

function select_bpy_1()
	local tSay = {	}
	for i=1, 8 do
		tinsert(tSay,format("Ch� t�o %s/#do_upgrade(%d,%d)",tb_upgrade_weapon_bpy_low[i][1],2,i))
	end
	tinsert(tSay,"Trang sau/select_bpy_2")
	tinsert(tSay,"T�i h� ch� ti�n gh� ngang/gf_DoNothing")
	Say(g_szNpcName.."C�c h� mu�n ta ch� t�o lo�i v� kh� n�o?",getn(tSay),tSay)
end

function select_bpy_2()
	local tSay = {	}
	for i=9, getn(tb_upgrade_weapon_bpy_low) do
		tinsert(tSay,format("Ch� t�o %s/#do_upgrade(%d,%d)",tb_upgrade_weapon_bpy_low[i][1],2,i))
	end
	tinsert(tSay,"Trang tr��c/select_bpy_1")
	tinsert(tSay,"T�i h� ch� ti�n gh� ngang/gf_DoNothing")
	Say(g_szNpcName.."C�c h� mu�n ta ch� t�o lo�i v� kh� n�o?",getn(tSay),tSay)
end

function upgrade_emperor()
	local tSay = {
		"* N�ng c�p Thi�n Chi Vi�m �� Kh�i (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 Vi�m �� Kh�i c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(3,0)",
		"* N�ng c�p Thi�n Chi Vi�m �� Gi�p (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 Vi�m �� Gi�p c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(4,0)",
		"* N�ng c�p Thi�n Chi Vi�m �� Trang (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 Vi�m �� Trang c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(5,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o? <color=red>L�u �: th�t b�i ti�u hao 1 N� Oa Tinh Th�ch ho�c 1 Phi Y�n Th�ch v� 100 v�ng. T� l� th�nh c�ng ph� thu�c v�o m�c c��ng h�a c�a v�t ph�m.<color>",getn(tSay),tSay)
end


function upgrade_tq_emperor()
	local tSay = {
		"* N�ng c�p Vi�m �� Kh�i (c�n 1 T� Kim H�ng Bao + 1 N� Oa Tinh Th�ch + 1 T� Quang Vi�m �� Kh�i c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(69,0)",
		"* N�ng c�p Vi�m �� Gi�p (c�n 1 T� Kim H�ng Bao + 1 N� Oa Tinh Th�ch + 1 T� Quang Vi�m �� Gi�p c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(70,0)",
		"* N�ng c�p Vi�m �� Trang (c�n 1 T� Kim H�ng Bao + 1 N� Oa Tinh Th�ch + 1 T� Quang Vi�m �� Trang c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(71,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o? <color=red>L�u �: th�t b�i ti�u hao 1 N� Oa Tinh Th�ch ho�c 1 T� Kim H�ng Bao v� 100 v�ng. T� l� th�nh c�ng ph� thu�c v�o m�c c��ng h�a c�a v�t ph�m.<color>",getn(tSay),tSay)
end

function do_upgrade_tq_type(nType)
	local tSay = {
		format("Nam Ti�u Chu�n/#do_upgrade(%d,1)",nType),
		format("Nam Kh�i Ng�/#do_upgrade(%d,2)",nType),
		format("N� G�i C�m/#do_upgrade(%d,3)",nType),
		format("Ki�u N�/#do_upgrade(%d,4)",nType),		
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o? <color=red>L�u �: T� l� th�nh c�ng ph� thu�c v�o m�c c��ng h�a c�a v�t ph�m.<color>",getn(tSay),tSay)
end

function change_cangjiang()
	local tSay = {
		"* Chuy�n ��i T�ng Ki�m T� Kim M�o (c�n 1 T�ng Ki�m L�nh + 1 N� Oa Tinh Th�ch + 1 T�ng Ki�m T� Kim M�o c��ng h�a 7 tr� l�n + 100 v�ng)/#change_cangjiang_type(6)",
		"* Chuy�n ��i Kim L� Th��ng (c�n 1 T�ng Ki�m L�nh + 1 N� Oa Tinh Th�ch + 1 Kim L� Th��ng c��ng h�a 7 tr� l�n + 100 v�ng)/#change_cangjiang_type(7)",
		"* Chuy�n ��i T�ng Ki�m � Kim Ph�c (c�n 1 T�ng Ki�m L�nh + 1 N� Oa Tinh Th�ch + 1 T�ng Ki�m � Kim Ph�c c��ng h�a 7 tr� l�n + 100 v�ng)/#change_cangjiang_type(8)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta chuy�n ��i lo�i trang b� n�o? <color=red>L�u �: t� l� th�nh c�ng 100%.<color>",getn(tSay),tSay)
end

function change_cangjiang_type(nType)
	local tSay = {
		format("Nam Ti�u Chu�n/#do_upgrade(%d,1)",nType),
		format("Nam Kh�i Ng�/#do_upgrade(%d,2)",nType),
		format("N� G�i C�m/#do_upgrade(%d,3)",nType),
		format("Ki�u N�/#do_upgrade(%d,4)",nType),		
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta chuy�n ��i lo�i trang b� n�o? <color=red>L�u �: t� l� th�nh c�ng 100%.<color>",getn(tSay),tSay)
end

function upgrade_cangjiang()
	local tSay = {
		"* C�i t�o T�ng Ki�m B�o Ch�u (c�n 1 T�ng Ki�m L�nh + 1 N� Oa Tinh Th�ch + 1 T�ng Ki�m B�o Ch�u + 100 v�ng)/#do_upgrade(9,0)",
		"* C�i t�o T�ng Ki�m K� Th�ch (c�n 1 T�ng Ki�m L�nh + 1 N� Oa Tinh Th�ch + 1 T�ng Ki�m K� Th�ch + 100 v�ng)/#do_upgrade(10,0)",
		"* C�i t�o T�ng Ki�m Kim �n (c�n 1 T�ng Ki�m L�nh + 1 N� Oa Tinh Th�ch + 1 T�ng Ki�m Kim �n + 100 v�ng)/#do_upgrade(11,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta c�i t�o lo�i trang b� n�o? <color=red>L�u �: t� l� th�nh c�ng 100%, thu�c t�nh nh�n ���c l� ng�u nhi�n.<color>",getn(tSay),tSay)
end

function upgrade_tqc()
	local tSay = {
		"* N�ng c�p v� kh� T� Quang (c�n 1 T� Quang Th�n Th�ch + 1 N� Oa Tinh Th�ch + 1 V� kh� T� Quang c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(12,0)",
		"* N�ng c�p trang s�c T� Quang (c�n 1 T� Quang Th�n Th�ch + 1 N� Oa Tinh Th�ch + 1 To�n Th�ch Gi�i Ch� + 1 H�ng Ph� Th�y H� Ph� + 100 v�ng)/#do_upgrade(13,0)",
		"* N�ng c�p trang s�c T� Quang (c�n 1 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 To�n Th�ch Gi�i Ch� + 1 H�ng Ph� Th�y H� Ph� + 100 v�ng)/#do_upgrade(14,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o? <color=red>L�u �: th�t b�i ti�u hao 1 N� Oa Tinh Th�ch ho�c 1 T� Quang Th�n Th�ch ho�c 1 Phi Y�n Th�ch ho�c 1 Trang S�c,  v� 100 v�ng. T� l� th�nh c�ng ph� thu�c v�o m�c c��ng h�a c�a v�t ph�m.<color>",getn(tSay),tSay)
end

function upgrade_tqvd()
	local tSay = {
		"* C�i t�o th�nh T� Quang Vi�m �� Kh�i (c�n 2 Phi Y�n Th�ch, 1 N� Oa Tinh Th�ch, 999 V� L�m Ho�ng Kim L�nh, 1 T� Quang Vi�m �� Trang B� c��ng h�a 7 tr� l�n + 1000 v�ng + 1000 �i�m T� Quang)/#do_upgrade(32,0)",
		"* C�i t�o th�nh T� Quang Vi�m �� Gi�p (c�n 2 Phi Y�n Th�ch, 1 N� Oa Tinh Th�ch, 999 V� L�m Ho�ng Kim L�nh, 1 T� Quang Vi�m �� Trang B� c��ng h�a 7 tr� l�n + 1000 v�ng + 1000 �i�m T� Quang)/#do_upgrade(33,0)",
		"* C�i t�o th�nh T� Quang Vi�m �� Trang (c�n 2 Phi Y�n Th�ch, 1 N� Oa Tinh Th�ch, 999 V� L�m Ho�ng Kim L�nh, 1 T� Quang Vi�m �� Trang B� c��ng h�a 7 tr� l�n + 1000 v�ng + 1000 �i�m T� Quang)/#do_upgrade(34,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta c�i t�o th�nh lo�i trang b� n�o? <color=red>L�u �: 999 V� L�m Ho�ng Kim L�nh ph�i �� trong h�nh trang, kh�ng ��t v�o trong � nguy�n li�u.<color>",getn(tSay),tSay)
end

function upgrade_songliao()
	local tSay = {
		"* N�ng c�p trang b� Ng� Long T��ng Qu�n/upgrade_gen1",
		--"* N�ng c�p trang b� Ng� Long T��ng Qu�n t� l� th�nh c�ng 100%/upgrade_gen2",
		"* N�ng c�p trang b� Ng� Long T��ng Qu�n t� l� th�nh c�ng 100%/upgrade_gen2_100",
		"* C�i t�o trang b� Ng� Long T��ng Qu�n/upgrade_nltq_clothes",
		"* N�ng c�p trang b� T��ng Qu�n/upgrade_gen",
		"* N�ng c�p trang b� T��ng Qu�n (th�nh c�ng 100%)/upgrade_gen_100",
		"* N�ng c�p trang b� Nguy�n So�i/upgrade_mar",
		"* N�ng c�p trang b� Ng� Long - Thi�u Th�nh Nguy�n So�i/upgrade_upper_mar",
		"* N�ng c�p trang b� Ng� Long - Thi�u Th�nh Nguy�n So�i th�nh c�ng 100%/upgrade_upper_mar_100",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	
	Say(g_szNpcName.."C�c h� mu�n n�ng c�p lo�i trang b� n�o?", getn(tSay), tSay)
end

function upgrade_gen()
	local tSay = {
		"* N�ng c�p T��ng Qu�n Chi�n Kh�i (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 T��ng Qu�n Chi�n Kh�i c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(15,0)",
		"* N�ng c�p T��ng Qu�n Chi�n B�o (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 T��ng Qu�n Chi�n B�o c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(16,0)",
		"* N�ng c�p T��ng Qu�n Chi�n Trang (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 T��ng Qu�n Chi�n Trang c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(17,0)",
		"* N�ng c�p T��ng Qu�n L�nh B�i (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 T��ng Qu�n L�nh B�i + 100 v�ng)/#do_upgrade(18,0)",
		"* N�ng c�p T��ng Qu�n C� L�nh (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 T��ng Qu�n C� L�nh + 100 v�ng)/#do_upgrade(19,0)",
		"* N�ng c�p T��ng Qu�n L�nh Ph� (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 T��ng Qu�n L�nh Ph� + 100 v�ng)/#do_upgrade(20,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o? <color=red>L�u �: th�t b�i ti�u hao 1 N� Oa Tinh Th�ch ho�c 1 Phi Y�n Th�ch v� 100 v�ng. T� l� th�nh c�ng ph� thu�c v�o m�c c��ng h�a c�a v�t ph�m.<color>",getn(tSay),tSay)
end

function upgrade_gen_100()
	local tSay = {
		"*Ti�n h�nh n�ng c�p/#do_upgrade(78,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N�ng c�p T��ng Qu�n th�nh Thi�n Chi T��ng Qu�n th�nh c�ng 100% ph�i c�n <color=yellow>4 N� Oa Tinh Th�ch, 4 B�ch Kim H�ng Bao (4000v), 400 v�ng<color>. N�n, �o, qu�n mu�n n�ng c�p ph�i <color=red>c��ng h�a 7<color> tr� l�n.",getn(tSay),tSay)
end

-- N�ng c�p trang b� Ng� Long T��ng Qu�n
function upgrade_gen1()
	local tSay = {
		"* N�ng c�p Ng� Long T��ng Qu�n Chi�n Kh�i (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n Chi�n Kh�i c��ng h�a 7 tr� l�n + 300 v�ng)/#do_upgrade(51,0)",
		"* N�ng c�p Ng� Long T��ng Qu�n Chi�n B�o (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n Chi�n B�o c��ng h�a 7 tr� l�n + 300 v�ng)/#do_upgrade(52,0)",
		"* N�ng c�p Ng� Long T��ng Qu�n Chi�n Trang (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n Chi�n Trang c��ng h�a 7 tr� l�n + 300 v�ng)/#do_upgrade(53,0)",
		"* N�ng c�p T��ng Qu�n L�nh B�i (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n L�nh B�i  + 300 v�ng)/#do_upgrade(56,0)",
		"* N�ng c�p T��ng Qu�n C� L�nh (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n L�nh K�  + 300 v�ng)/#do_upgrade(54,0)",
		"* N�ng c�p T��ng Qu�n L�nh Ph� (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n L�nh Ph�  + 300 v�ng)/#do_upgrade(55,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o? <color=red>L�u �: th�t b�i ti�u hao 3 N� Oa Tinh Th�ch ho�c 1 Thi�n Qu�i Th�ch v� 300 v�ng. T� l� th�nh c�ng ph� thu�c v�o m�c c��ng h�a c�a v�t ph�m.<color>",getn(tSay),tSay)
end
-- N�ng c�p trang b� Ng� Long T��ng Qu�n (100%) th�nh c�ng
function upgrade_gen2()
	local tSay = {
		"* N�ng c�p Ng� Long T��ng Qu�n Chi�n Kh�i (c�n 680 Thi�n Ngo�i L�u Tinh + 1 ��nh H�n Thi�n Th�ch + M�t Thi�n Th�ch Linh Th�ch + 2 N� Oa Tinh Th�ch  +1T�ng/Li�u T��ng Qu�n Chi�n Kh�i c��ng h�a 10 tr� l�n)/#do_upgrade(57,0)",
		"* N�ng c�p Ng� Long T��ng Qu�n Chi�n B�o (c�n 680 Thi�n Ngo�i L�u Tinh + 1 ��nh H�n Thi�n Th�ch + M�t Thi�n Th�ch Linh Th�ch + 2 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n Chi�n B�o c��ng h�a 10 tr� l�n)/#do_upgrade(58,0)",
		"* N�ng c�p Ng� Long T��ng Qu�n Chi�n Trang (c�n 680 Thi�n Ngo�i L�u Tinh + 1 ��nh H�n Thi�n Th�ch + M�t Thi�n Th�ch Linh Th�ch + 2 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n Chi�n Trang c��ng h�a 10 tr� l�n)/#do_upgrade(59,0)",
		"* N�ng c�p T��ng Qu�n L�nh B�i (c�n 680 Thi�n Ngo�i L�u Tinh + 1 ��nh H�n Thi�n Th�ch + M�t Thi�n Th�ch Linh Th�ch + 2 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n L�nh B�i)/#do_upgrade(62,0)",
		"* N�ng c�p T��ng Qu�n C� L�nh (c�n 680 Thi�n Ngo�i L�u Tinh + 1 ��nh H�n Thi�n Th�ch + M�t Thi�n Th�ch Linh Th�ch + 2 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n L�nh K�)/#do_upgrade(60,0)",
		"* N�ng c�p T��ng Qu�n L�nh Ph� (c�n 680 Thi�n Ngo�i L�u Tinh + 1 ��nh H�n Thi�n Th�ch + M�t Thi�n Th�ch Linh Th�ch + 2 N� Oa Tinh Th�ch + 1 T�ng/Li�u T��ng Qu�n L�nh Ph�)/#do_upgrade(61,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o? <color=red>L�u �: T� l� th�nh c�ng 100%.<color>",getn(tSay),tSay)
end

function upgrade_mar()
	local tSay = {
		"* N�ng c�p Nguy�n So�i Chi�n Kh�i (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i Chi�n Kh�i c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(25,0)",
		"* N�ng c�p Nguy�n So�i Chi�n B�o (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i Chi�n B�o c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(26,0)",
		"* N�ng c�p Nguy�n So�i Chi�n Ph�c (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i Chi�n Ph�c c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(27,0)",
		"* N�ng c�p Nguy�n So�i Ph� (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i Ph� + 100 v�ng)/#do_upgrade(28,0)",
		"* N�ng c�p Nguy�n So�i H� Ph� (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i H� Ph� + 100 v�ng)/#do_upgrade(29,0)",
		"* N�ng c�p Nguy�n So�i K� (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i K� + 100 v�ng)/#do_upgrade(30,0)",
		"* N�ng c�p Nguy�n So�i L�nh K� (c�n 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i L�nh K� + 100 v�ng)/#do_upgrade(31,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o? <color=red>L�u �: th�t b�i ti�u hao 1 N� Oa Tinh Th�ch ho�c 1 Phi Y�n Th�ch v� 100 v�ng. T� l� th�nh c�ng ph� thu�c v�o m�c c��ng h�a c�a v�t ph�m v� qu�n c�ng.<color>",getn(tSay),tSay)
end

function upgrade_upper_mar()
	local tSay = {
		"* N�ng c�p Nguy�n So�i Chi�n Kh�i (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i Chi�n Kh�i c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(37,0)",
		"* N�ng c�p Nguy�n So�i Chi�n Gi�p (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i Chi�n Gi�p c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(38,0)",
		"* N�ng c�p Nguy�n So�i Chi�n Trang (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i Chi�n Ph�c c��ng h�a 7 tr� l�n + 100 v�ng)/#do_upgrade(39,0)",
		"* N�ng c�p Nguy�n So�i Hi�u Ph� (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i Hi�u Ph� + 100 v�ng)/#do_upgrade(40,0)",
		"* N�ng c�p Nguy�n So�i H� Ph� (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i H� Ph� + 100 v�ng)/#do_upgrade(41,0)",
		"* N�ng c�p Nguy�n So�i Hi�u K� (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i Hi�u K� + 100 v�ng)/#do_upgrade(42,0)",
		"* N�ng c�p Nguy�n So�i L�nh K� (c�n 3 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 1 Nguy�n So�i L�nh K� + 100 v�ng)/#do_upgrade(43,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o?",getn(tSay),tSay)
end

function upgrade_PlatinumEmperor()
	local tSay = {
		"* B�ch Kim Vi�m �� (c�n trang b� b� Thi�n Chi Vi�m �� [+7] + 3 bao B�ch Kim ��i H�ng Bao (ch�a 4000 v�ng))/#confirm_PlatinumEmperor(1)",
		"* B�ch Kim Vi�m �� (c�n trang b� b� Thi�n Chi Vi�m �� [+10] + 2 bao B�ch Kim ��i H�ng Bao (ch�a 4000 v�ng))/#confirm_PlatinumEmperor(2)",
		"* B�ch Kim Vi�m �� (c�n trang b� b� Thi�n Chi Vi�m �� [+13] + 1 bao B�ch Kim ��i H�ng Bao (ch�a 4000 v�ng))/#confirm_PlatinumEmperor(3)",	
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o?",getn(tSay),tSay)
end

function confirm_PlatinumEmperor(nSelected)
	local tSay = {
		"* Nh�n B�ch Kim Vi�m �� Kh�i (c�n "..tbCheck_BKVD[nSelected][1].." Thi�n Chi Vi�m �� Kh�i [+"..tbCheck_BKVD[nSelected][3].."] + "..tbCheck_BKVD[nSelected][2].." bao B�ch Kim ��i H�ng Bao (ch�a 4000 v�ng))/#do_upgrade(72,1,"..nSelected..")",
		"* Nh�n B�ch Kim Vi�m �� Gi�p (c�n "..tbCheck_BKVD[nSelected][1].." Thi�n Chi Vi�m �� Gi�p [+"..tbCheck_BKVD[nSelected][3].."] + "..tbCheck_BKVD[nSelected][2].." bao B�ch Kim ��i H�ng Bao (ch�a 4000 v�ng))/#do_upgrade(73,2,"..nSelected..")",
		"* Nh�n B�ch Kim Vi�m �� Trang(c�n "..tbCheck_BKVD[nSelected][1].." Thi�n Chi Vi�m �� Trang [+"..tbCheck_BKVD[nSelected][3].."] + "..tbCheck_BKVD[nSelected][2].." bao B�ch Kim ��i H�ng Bao (ch�a 4000 v�ng))/#do_upgrade(74,3,"..nSelected..")",	
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	
	Say(g_szNpcName.."C�c h� mu�n ta n�ng c�p lo�i trang b� n�o?",getn(tSay),tSay)
end

function do_upgrade(nUpgradeType,nSelected, nFirstSelected)
	if nUpgradeType == 0 then
		return 0;
	end
	local nCT = GetTask(701)
	if nUpgradeType == 69 or nUpgradeType == 70 or nUpgradeType == 71 then
		if nCT > -150000 and nCT < 150000  then
			Talk(1, "", g_szNpcName.."Nh�n v�t ph�i c� 150000 �i�m c�ng tr�ng tr� l�n m�i c� th� tham gia n�ng c�p �� T� Quang Vi�m �� ���c!!!");
			return 0;
		end
	end
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "", g_szNpcName.."Ph�i gia nh�p h� ph�i ta m�i gi�p ng��i ���c!");
		return 0;
	end
	if GetCash() < 1000000 then
		Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��!");
		return 0;
	end
	
	if gf_JudgeRoomWeight(2,500,g_szNpcName) == 0 then
		return 0;
	end
	
	SetTaskTemp(TSK_TMP_UPGRADE,nUpgradeType)
	SetTaskTemp(TSK_TMP_SELECT,nSelected)	
	if nFirstSelected then
		SetTaskTemp(TSK_TMP_FIRSTSELECT,nFirstSelected)	
	end
	local nSlot = tb_upgrade_needed[nUpgradeType][1]		
	if nUpgradeType >= 72 and nUpgradeType <= 74 then 
		nSlot = tbCheck_BKVD[nFirstSelected][1]
	end
	PutinItemBox("Ch� t�o trang b�" ,nSlot , "X�c nh�n mu�n th�c hi�n ch� t�o?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local nUpgradeType = GetTaskTemp(TSK_TMP_UPGRADE)
	local nSelected = GetTaskTemp(TSK_TMP_SELECT)
	local nFirstSelected = GetTaskTemp(TSK_TMP_FIRSTSELECT)
	if nUpgradeType == 0 then
		return 0;
	end
	if gf_JudgeRoomWeight(2,500,g_szNpcName) == 0 then
		return 0;
	end
	if param ~= 1 then
		return 0;
	end
	
	local tb_item = tb_upgrade_needed[nUpgradeType][3]
	for i = 1, getn(tb_item) do
		local nG, nD, nP, nCount = gf_UnPack(tb_item[i])
		if (genre == nG and detail == nD and particular == nP) then	
			if (nUpgradeType >= 6 and nUpgradeType <= 11) or  (nUpgradeType >= 22 and nUpgradeType <= 24) or (nUpgradeType >= 45 and nUpgradeType <= 50) then
				if GetItemSpecialAttr(idx,"LOCK") == 1 then --�����ж�
					Talk(1,"",g_szNpcName.."V�t ph�m n�y l� v�t ph�m kh�a, m� kh�a r�i ��i nh�!");
					return 0;
				end
			end
			if nUpgradeType ~= 22 and nUpgradeType ~= 23 and nUpgradeType ~= 24 then
				if (genre == 0 and detail ~= 102 and GetEquipAttr(idx,2) < 7) then
					Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
					return 0;			
				elseif (genre == 0 and detail == 102 and (nUpgradeType == 13 or nUpgradeType == 14)) then
					local nMofa1,nLv1 = GetItemAttr(idx,1)
					local nMofa2,nLv2 = GetItemAttr(idx,2)
					local nMofa3,nLv3 = GetItemAttr(idx,3)	
					if nMofa1~= 24 or nLv1 ~= 2 or nMofa2 ~= 14 or nLv2 ~= 3 then
						Talk(1,"",g_szNpcName.."Ph�i l� nh�n c� thu�c t�nh T�ng t�c �� xu�t chi�u 9%, M�i 10 gi�y sinh l�c h�i ph�c 3%.");
						return 0;
					end
				end
			end
			--B�ch Kim Vi�m ��
			if  nUpgradeType >= 72 and nUpgradeType <= 74 then 
				if GetEquipAttr(idx,2) < tbCheck_BKVD[nFirstSelected][3] then
					Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m Thi�n Chi Vi�m �� ph�i t� "..tbCheck_BKVD[nFirstSelected][3].." tr� l�n");
					return 0;			
				end				
			end
			-- C�i t�o Thi�n Chi T�ng Ki�m
			if  nUpgradeType == 63 or nUpgradeType == 64 or nUpgradeType == 65 then 
				local nLev = GetEquipAttr(idx,2)
				if  genre == 0 then
					SetTaskTemp(TSK_TEMP_TQVD, nLev)
				end
			end
			
			-- N�ng c�p T� Quang Vi�m �� l�n Vi�m ��
			if  nUpgradeType >= 69 and nUpgradeType <= 71 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  genre == 0 and detail == 100  then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
					if  genre == 0 and detail == 101  then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
					if  genre == 0 and detail == 103 then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
				end
			end
			
			-- N�ng c�p T� Quang Vi�m �� l�n Vi�m �� th�nh c�ng 100%
			if  nUpgradeType >= 75 and nUpgradeType <= 77 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  genre == 0 and detail == 100  then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
					if  genre == 0 and detail == 101  then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
					if  genre == 0 and detail == 103 then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
				end
			end
			
			-- N�ng c�p trang b� t��ng qu�n th�nh c�ng 100%
			if nUpgradeType == 78 then
				if GetEquipAttr(idx,2)<7 then
					if genre==0 and (detail==100 or detail==101 or detail==103) then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0
					end
				end
			end
			
			-- N�ng c�p Ng� Long T��ng Qu�n
			if  nUpgradeType >= 51 and nUpgradeType <= 56 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  genre == 0 and detail == 100  then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
					if  genre == 0 and detail == 101  then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
					if  genre == 0 and detail == 103 then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
				end
			end
-- N�ng c�p Ng� Long T��ng Qu�n 100%
			if  nUpgradeType >= 57 and nUpgradeType <= 62 then 
				if (GetEquipAttr(idx,2) < 10) then
					if  genre == 0 and detail == 100  then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 10 tr� l�n");
						return 0;			
					end
					if  genre == 0 and detail == 101  then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 10 tr� l�n");
						return 0;			
					end
					if  genre == 0 and detail == 103 then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 10 tr� l�n");
						return 0;			
					end
				end
			end
-- N�ng c�p Ng� Long T��ng Qu�n 100% (ver 2)
			if  nUpgradeType == 79 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  genre == 0 and (detail == 100  or detail == 101 or detail == 103) then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
				end
			end
-- N�ng c�p T�ng/Li�u Nguy�n So�i 100%
			if  nUpgradeType == 80 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  genre == 0 and (detail == 100  or detail == 101 or detail == 103) then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;			
					end
				end
			end
-- N�ng c�p V� kh� Vi�t Y�n + ��i Vi�t Y�n + S� M�n
			if  nUpgradeType == 81 or nUpgradeType == 82 or nUpgradeType == 83  or nUpgradeType == 85 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  detail ~= 102 then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 7 tr� l�n");
						return 0;
					end
				end
			end
-- N�ng c�p B�ch Kim Vi�m ��			
			if  nUpgradeType == 84 then 
				if (GetEquipAttr(idx,2) < 10) then
					if  detail ~= 102 then
						Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 10 tr� l�n");
						return 0;
					end
				end
			end
			
			if nUpgradeType == 44 and genre == 0 then
				local tCheckList = 
				{
					[1] = {"Ph� Y�n �ao trung c�p",{0,3,6001},{0,3,6001,1,1,6,85,7,263,7,264,-1,6}},
					[2] = {"Ph� Y�n C�n trung c�p",{0,5,6002},{0,5,6002,1,1,6,85,7,263,7,264,-1,6}},
					[3] = {"Ph� Y�n Tr��ng trung c�p",{0,8,6003},{0,8,6003,1,1,6,86,7,267,7,263,-1,6}},
					[4] = {"H�m Y�n Th� trung c�p",{0,0,6004},{0,0,6004,1,1,6,86,7,267,7,263,-1,6}},
					[5] = {"T�ng Y�n Ch�m trung c�p",{0,1,6005},{0,1,6005,1,1,4,281,7,265,7,264,-1,6}},
					[6] = {"Phi Y�n Ki�m trung c�p",{0,2,6006},{0,2,6006,1,1,6,86,4,292,4,293,-1,6}},
					[7] = {"V�n Y�n C�m trung c�p",{0,10,6007},{0,10,6007,1,1,2,27,7,266,7,265,-1,6}},
					[8] = {"V�n Y�n Th� trung c�p",{0,0,6008},{0,0,6008,1,1,6,85,7,264,7,263,-1,6}},
					[9] = {"L�u Y�n C�n trung c�p",{0,5,6009},{0,5,6009,1,1,3,268,7,265,7,266,-1,6}},
					[10] = {"Huy�n Y�n Ki�m trung c�p",{0,2,6010},{0,2,6010,1,1,6,86,7,267,7,266,-1,6}},
					[11] = {"V� Y�n B�t trung c�p",{0,9,6011},{0,9,6011,1,1,3,268,7,266,7,265,-1,6}},
					[12] = {"H� Ti�m Th��ng trung c�p",{0,6,6012},{0,6,6012,1,1,6,85,7,264,7,263,-1,6}},
					[13] = {"H�nh Y�n Cung trung c�p",{0,4,6013},{0,4,6013,1,1,3,268,7,265,7,264,-1,6}},
					[14] = {"Tr�c Y�n Nh�n trung c�p",{0,7,6014},{0,7,6014,1,1,4,281,7,265,7,264,-1,6}},
					[15] = {"Y�u Y�n Tr�o trung c�p",{0,11,6015},{0,11,6015,1,1,5,285,7,266,7,267,-1,6}},		
				}
				local nMofa1,nLv1 = GetItemAttr(idx,1)
				local nMofa2,nLv2 = GetItemAttr(idx,2)
				local nMofa3,nLv3 = GetItemAttr(idx,3)
				for i = 1, getn(tCheckList) do
					if (genre == tCheckList[i][3][1] and detail == tCheckList[i][3][2] and particular == tCheckList[i][3][3] and nLv1 == tCheckList[i][3][6] and nMofa1== tCheckList[i][3][7] and nLv2 == tCheckList[i][3][8] and nMofa2== tCheckList[i][3][9] and nLv3 == tCheckList[i][3][10] and nMofa3== tCheckList[i][3][11]) then
						return 1
					end
				end
				Talk(1,"",g_szNpcName.."Ph�i l� v� kh� B� Phi Y�n Trung c�p.");
				return 0
			end
			return 1;
		end
	end	
	Talk(1, "", g_szNpcName.."Ch� c� th� b� v�o "..tb_upgrade_needed[nUpgradeType][2]);
	return 0;
end
	
function OnPutinComplete(param)
	local nUpgradeType = GetTaskTemp(TSK_TMP_UPGRADE)
	local nSelect = GetTaskTemp(TSK_TMP_SELECT)
	local nFirstSelected = GetTaskTemp(TSK_TMP_FIRSTSELECT)
	if nUpgradeType == 0 then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng.");
		return 0;
	end
	if param ~= 1 then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng..");
		return 0;
	end
	local t = GetPutinItem()
	local nupgrade_needed = tb_upgrade_needed[nUpgradeType][1]
	if nUpgradeType >= 72 and nUpgradeType <= 74 then 
		nupgrade_needed = tbCheck_BKVD[nFirstSelected][1]
	end
	if getn(t) ~= nupgrade_needed then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng...");
		return 0;
	end
	local tb_item = tb_upgrade_needed[nUpgradeType][3]
	local nCheck = 1
	local nFlag = 0
	local nQianghua, nDing, nMofa1, nLv1, nMofa2, nLv2, nMofa3, nLv3, nRandSeed, nLock
	local tItem = {}
	-- Ph�n bi�t item ti�u hao v� trang b� b� v�o
	for i = 1, getn(tb_item) do
		local nG, nD, nP, nCount = gf_UnPack(tb_item[i])
		if nG == 0 then			
			if get_item_count(t, nG, nD, nP) == nCount then
				nFlag = nFlag + 1
				_, nQianghua, nDing, nMofa1, nLv1, nMofa2, nLv2, nMofa3, nLv3, nRandSeed, nLock = get_item_count(t, nG, nD, nP)
				tinsert(tItem,tb_item[i])
			end
		else		
			if get_item_count(t, nG, nD, nP) ~= nCount then
				nCheck = 0;
				break;
			end			
		end
	end
	
	if tb_upgrade_needed[nUpgradeType][5] == 0 then
		nFlag = 1
	end
	if nCheck == 0 or nFlag < 1 then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng....");
		return 0;
	end
	
	local tbItemIndex = GetPutinItem()
	
	if GetCash() < 1000000 then
		Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
		return 0;
	end
	
-- N�ng c�p Thi�n Chi T��ng Qu�n 100%
	if nUpgradeType==75 or nUpgradeType==76 or nUpgradeType==77 then
		if GetCash()<6000000 then
			Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
			return 0;
		end
		-- N� Oa Tinh Th�ch
		if GetItemCount(2,1,504)<4 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� N� Oa Tinh Th�ch ta c�n.");
			return 0;
		end
		-- Ho�ng Kim ��i H�ng Bao 999 v�ng
		if GetItemCount(2,1,539)<6 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� Ho�ng Kim ��i H�ng Bao ta c�n.");
			return 0;
		end
	end
-- N�ng c�p T��ng Qu�n B� 1 100%
	if nUpgradeType==78 then
		if GetCash()<4000000 then
			Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
			return 0;
		end
		-- N� Oa Tinh Th�ch
		if GetItemCount(2,1,504)<4 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� N� Oa Tinh Th�ch ta c�n.");
			return 0;
		end
		-- B�ch Kim ��i H�ng Bao 4000 v�ng (2,1,30229)
		if GetItemCount(2,1,30229)<4 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� B�ch Kim ��i H�ng Bao ta c�n.");
			return 0;
		end
	end
	
	if nUpgradeType >= 51 and nUpgradeType <= 62 then
		if GetCash() < 3000000 then
			Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
			return 0;
		end
	end
	if nUpgradeType >= 32 and nUpgradeType <= 34 then
		if GetTask(GLB_TASK_ZIGUANGGE) < 1000 then
			Talk(1, "", g_szNpcName.."Ch�a �� 1000 �i�m T� Quang �� c�i t�o trang b�!")
			return 0
		end
		if GetCash() < 10000000 then
			Talk(1, "", g_szNpcName.."Ch�a �� 1000 v�ng �� c�i t�o trang b�!")
			return 0
		end
		if GetItemCount(2, 1, 30284) < 999 then
			Talk(1, "", g_szNpcName.."Ph�i c� �t nh�t 999 V� L�m Ho�ng Kim L�nh trong h�nh trang m�i c� th� c�i t�o trang b�!")
			return 0
		end
	end
	-- N�ng c�p B�ch Kim Vi�m ��
	if nUpgradeType >= 72 and nUpgradeType <= 74 then
		local nItemNum1 = tbCheck_BKVD[nFirstSelected][2]
		if GetItemCount(2, 1, 30229) < nItemNum1 then
			Talk(1, "", g_szNpcName.."Ph�i c� �t nh�t "..nItemNum1.." B�ch Kim H�ng Bao trong h�nh trang m�i c� th� c�i t�o trang b�!")
			return 0
		end
	end
	if gf_JudgeRoomWeight(2,500,g_szNpcName) == 0 then
		return 0;
	end
-- N�ng c�p Ng� Long T��ng Qu�n 100%
	if nUpgradeType >= 57 and nUpgradeType <= 62 then
		if GetItemCount(2, 1, 30321) < 680 then
			Talk(1, "", g_szNpcName.."Ph�i c� �t nh�t 680 Thi�n Ngo�i L�u Tinh trong h�nh trang m�i c� th� c�i t�o trang b�!")
			return 0
		end
		if GetItemCount(2, 1, 30229) < 3 then
			Talk(1, "", g_szNpcName.."Ph�i c� �t nh�t 3 B�ch Kim H�ng Bao trong h�nh trang m�i c� th� c�i t�o trang b�!")
			return 0
		end
	end
-- N�ng c�p Ng� Long T��ng Qu�n 100% (ver 2)
	if nUpgradeType == 79 then
		if GetCash()<8000000 then
			Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
			return 0;
		end
		-- N� Oa Tinh Th�ch
		if GetItemCount(2,1,504)<1 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� N� Oa Tinh Th�ch ta c�n.");
			return 0;
		end
		-- B�ch Kim ��i H�ng Bao 4000 v�ng (2,1,30229)
		if GetItemCount(2,1,30229)<4 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� B�ch Kim ��i H�ng Bao ta c�n.");
			return 0;
		end
		-- Thi�n Th�ch Linh Th�ch
		if GetItemCount(2,1,1068)<3 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� Thi�n Th�ch Linh Th�ch  ta c�n.");
			return 0;
		end
	end

-- N�ng c�p Nguy�n So�i b� 4 100%
	if nUpgradeType == 80 then
		if GetCash()<5000000 then
			Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
			return 0;
		end
		-- B�ch Kim ��i H�ng Bao 4000 v�ng (2,1,30229)
		if GetItemCount(2,1,30229)<5 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� B�ch Kim ��i H�ng Bao ta c�n.");
			return 0;
		end
		if tbItemIndex[1][3] == 102 then
			-- ��nh H�n Thi�n Th�ch Th�n Th�ch: 2,1,1067
			if GetItemCount(2,1,1067) < 3 then
				Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� ��nh H�n Thi�n Th�ch Th�n Th�ch ta c�n.");
				return 0;
			end
			-- Thi�n Cang L�nh: 2,95,204
			if GetItemCount(2,95,204) < 5 then
				Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� Thi�n Cang L�nh ta c�n.");
				return 0;
			end
		else
			-- ��nh H�n Thi�n Th�ch Th�n Th�ch: 2,1,1067
			if GetItemCount(2,1,1067) < 2 then
				Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� ��nh H�n Thi�n Th�ch Th�n Th�ch ta c�n.");
				return 0;
			end
			-- Thi�n Cang L�nh: 2,95,204
			if GetItemCount(2,95,204) < 4 then
				Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� Thi�n Cang L�nh ta c�n.");
				return 0;
			end
		end
	end

-- N�ng c�p v� kh� Vi�t Y�n
	if nUpgradeType == 81 then
		if GetCash()<2000000 then
			Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
			return 0;
		end
		-- N� Oa Tinh Th�ch
		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� N� Oa Tinh Th�ch ta c�n.");
			return 0;
		end
		-- Thi�n Th�ch Linh Th�ch
		if GetItemCount(2,1,1068) < 2 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� Thi�n Th�ch Linh Th�ch ta c�n.");
			return 0;
		end
		-- B�ch Kim ��i H�ng Bao 4000 v�ng (2,1,30229)
		if GetItemCount(2,1,30229) < 3 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� B�ch Kim ��i H�ng Bao ta c�n.");
			return 0;
		end
	end

-- C�i t�o v� kh� ��i Vi�t Y�n
	if nUpgradeType == 82 then
		if GetCash()<2000000 then
			Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
			return 0;
		end
		-- N� Oa Tinh Th�ch
		if GetItemCount(2,1,504) < 2 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� N� Oa Tinh Th�ch ta c�n.");
			return 0;
		end
		-- Ho�ng Kim H�ng Bao
		if GetItemCount(2,1,539)<2 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� Ho�ng Kim ��i H�ng Bao ta c�n.");
			return 0;
		end
	end

-- N�ng c�p trang b� s� m�n
	if nUpgradeType == 83 then
		if GetCash()<12000000 then
			Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
			return 0;
		end
		if tbItemIndex[1][3] == 102 then
			-- Ho�ng Kim H�ng Bao
			if GetItemCount(2,1,539) < 15 then
				Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� Ho�ng Kim ��i H�ng Bao ta c�n.");
				return 0;
			end
			-- N� Oa Tinh Th�ch
			if GetItemCount(2,1,504) < 1 then
				Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� N� Oa Tinh Th�ch ta c�n.");
				return 0;
			end
		elseif tbItemIndex[1][3] == 100 or tbItemIndex[1][3] == 101 or tbItemIndex[1][3] == 103 then
			-- Ho�ng Kim H�ng Bao
			if GetItemCount(2,1,539) < 12 then
				Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� Ho�ng Kim ��i H�ng Bao ta c�n.");
				return 0;
			end
			-- N� Oa Tinh Th�ch
			if GetItemCount(2,1,504) < 4 then
				Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� N� Oa Tinh Th�ch ta c�n.");
				return 0;
			end
		else
			-- Ho�ng Kim H�ng Bao
			if GetItemCount(2,1,539) < 20 then
				Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� Ho�ng Kim ��i H�ng Bao ta c�n.");
				return 0;
			end
			-- N� Oa Tinh Th�ch
			if GetItemCount(2,1,504) < 1 then
				Talk(1, "", g_szNpcName.."C�c h� kh�ng c� �� s� N� Oa Tinh Th�ch ta c�n.");
				return 0;
			end
		end
	end
	
	-- N�ng c�p trang b� b�ch kim vi�m ��
	if nUpgradeType == 84 then
		if GetCash() < 9990000 then
			Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
			return 0;
		end
		if GetItemCount(2,1,30346) < 39 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng mang �� 39 m�nh b�ch kim!");
			return 0;
		end
		if GetItemCount(2,1,30229) < 10 then
			Talk(1,"","Ta c�n 10 b�ch kim ��i h�ng bao, ng��i �� c� �� ch�a?")
			return 0
		end
	end
	
	-- N�ng c�p trang b� thi�n chi vi�m ��
	if nUpgradeType == 85 then
		if GetCash() < 3000000 then
			Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
			return 0;
		end
		if GetItemCount(2,1,30346) < 15 then
			Talk(1, "", g_szNpcName.."C�c h� kh�ng mang �� 15 m�nh b�ch kim!");
			return 0;
		end
		if GetItemCount(2,1,539) < 15 then
			Talk(1,"","Ta c�n 15 ho�ng kim ��i h�ng bao, ng��i �� c� �� ch�a?")
			return 0
		end
	end
	
	if gf_JudgeRoomWeight(2,500,g_szNpcName) == 0 then
		return 0;
	end
	if Pay(1000000) == 1 then
		if nUpgradeType >= 32 and nUpgradeType <= 44 then
			SetTask(GLB_TASK_ZIGUANGGE, GetTask(GLB_TASK_ZIGUANGGE) - 1000)
		end
		
		-- Tr� ti�n n�ng c�p Ng� Long T��ng Qu�n
		if nUpgradeType >= 51 and nUpgradeType <= 62 then
			if Pay(2000000) == 0 then
				Talk(1,"","N�ng c�p th�t b�i")
				return
			end
		end
		
		local nRand = random(1,100)
		local nMax = tb_upgrade_needed[nUpgradeType][4]
		if tb_upgrade_needed[nUpgradeType][4] < 100 then
			if nUpgradeType <= 44 then
				nMax = nMax + tb_percent_plus[nQianghua]
			elseif nUpgradeType >= 45 and nUpgradeType <= 50 then
				local tb_percent_plus_tk = 
				{
					[0]   = 0,
					[1]   = 0,
					[2]   = 0,
					[3]   = 0,
					[4]   = 0,
					[5]   = 0,
					[6]   = 0,
					[7]   = 0,
					[8]   = 3,
					[9]   = 3,
					[10] = 5,
					[11] = 5,
					[12] = 7,
					[13] = 7,
					[14] = 9,
					[15] = 9,	
				}
				nMax = nMax + tb_percent_plus_tk[nQianghua]
			end
		end
		
		if nUpgradeType >= 25 and nUpgradeType <= 31 then
			local nBonus = 0
			local nPoint = abs(GetTask(701))
			for i = 1, getn(tb_percent_ranking_plus) do
				if nPoint >= tb_percent_ranking_plus[i][1] then
					nBonus =  tb_percent_ranking_plus[i][2]
					break
				end
			end
			nMax = nMax + nBonus
		end
		
		if nUpgradeType >= 37 and nUpgradeType <= 43 then
			local nBonus = 0
			local nPoint = abs(GetTask(701))
			for i = 1, getn(tb_upper_percent_ranking_plus) do
				if nPoint >= tb_upper_percent_ranking_plus[i][1] then
					nBonus =  tb_upper_percent_ranking_plus[i][2]
					break
				end
			end
			nMax = nMax + nBonus
		end
		--- N�ng c�p trang b� Ng� Long t��ng Qu�n
		
		if nUpgradeType >= 51 and nUpgradeType <= 56 then
			
				local tb_percent_plus_tk = 
					{
						[0]   = 0,
						[1]   = 0,
						[2]   = 0,
						[3]   = 0,
						[4]   = 0,
						[5]   = 0,
						[6]   = 0,
						[7]   = 0,
						[8]   = 1,
						[9]   = 1,
						[10] = 2,
						[11] = 2,
						[12] = 3,
						[13] = 4,
						[14] = 6,
						[15] = 10,	
					}
				nMax = nMax + tb_percent_plus_tk[nQianghua]
			
			local nBonus = 0
			local nPoint = abs(GetTask(701))
			for i = 1, getn(tb_upper_percent_ranking_plus) do
				if nPoint >= tb_upper_percent_ranking_plus[i][1] then
					nBonus =  tb_upper_percent_ranking_plus[i][2]
					break
				end
			end
			nMax = nMax + nBonus
		end
		
	    if nRand <= nMax  then	
			local nResult = 1;
			for i = 1, getn(t) do			
				if DelItemByIndex(t[i][1], -1) ~= 1 then
					nResult = 0;
					break;
				end
			end
			if nResult == 1 then
				SetTaskTemp(TSK_TMP_UPGRADE,0)
				SetTaskTemp(TSK_TMP_SELECT,0)
				SetTaskTemp(TSK_TMP_FIRSTSELECT,0)
				local nRet, nItemIdx = 0,0
				if nUpgradeType == 1 then
					local nRandWeapon = random(1,getn(tb_upgrade_weapon_bpy_low))			
					nRet, nItemIdx = gf_AddItemEx(tb_upgrade_weapon_bpy_low[nRandWeapon][2], tb_upgrade_weapon_bpy_low[nRandWeapon][1]);
					if nRet == 1 then
						Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_weapon_bpy_low[nRandWeapon][1])
					else
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem th�t b�i")
					end
				elseif nUpgradeType == 2 then
					nRet, nItemIdx = gf_AddItemEx(tb_upgrade_weapon_bpy_low[nSelect][2], tb_upgrade_weapon_bpy_low[nSelect][1]);
					if nRet == 1 then
						Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_weapon_bpy_low[nSelect][1])
					else
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem th�t b�i")
					end				
				elseif nUpgradeType == 6 or nUpgradeType == 7 or nUpgradeType == 8 then
					local nG, nD, nP = gf_UnPack(tItem[1])
					nP = 95 + nSelect - 1					
					nRet, nItemIdx = gf_AddItemEx({nG,nD,nP,1,1, -1,-1, -1, -1, -1, -1, -1,6}, "Trang b� T�ng Ki�m");
					if nRet == 1 then
						--if nDing > 0 then
							--SetItemSpecialAttr(nItemIdx,"DING7",1)
						--end
						--if nLock > 0 then
							--SetItemSpecialAttr(nItemIdx,"LOCK",1)
						--end
						Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, "Trang b� T�ng Ki�m")
					else
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem th�t b�i")
					end	
				elseif nUpgradeType == 13 or nUpgradeType == 14 then
					nRoute = GetPlayerRoute()
					if random(1,100) <= 50 then
						nRet, nItemIdx = gf_AddItemEx(tb_upgrade_jew_dau[nRoute][2], tb_upgrade_jew_dau[nRoute][1]);
						if nRet == 1 then
							Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_jew_dau[nRoute][1])
						else
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem th�t b�i")
						end	
					else
						nRet, nItemIdx = gf_AddItemEx(tb_upgrade_jew_chien[nRoute][2], tb_upgrade_jew_chien[nRoute][1]);
						if nRet == 1 then
							Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_jew_chien[nRoute][1])
						else
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem th�t b�i")
						end	
					end
				elseif nUpgradeType == 22 or nUpgradeType == 23 or nUpgradeType == 24 then				
					local nG, nD, nP = gf_UnPack(tItem[1])
					local nGet = 0					
					for i=1,getn(tb_convert_item) do
						if nG == tb_convert_item[i][2][1] and nD == tb_convert_item[i][2][2] and nP == tb_convert_item[i][2][3] then
							nGet = i							
							break;
						end					
					end
					if nGet > 0 then
						nRet, nItemIdx = gf_AddItemEx({tb_convert_item[nGet][3][1],tb_convert_item[nGet][3][2],tb_convert_item[nGet][3][3],1,1,-1,-1,-1,-1,-1,-1,0,nQianghua}, tb_convert_item[nGet][1]);
						if nRet == 1 then
							if nDing > 0 then
								SetItemSpecialAttr(nItemIdx,"DING7",1)
							end
							--if nLock > 0 then
								--SetItemSpecialAttr(nItemIdx,"LOCK",1)
							--end
							Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, tb_convert_item[nGet][1])
						else
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem th�t b�i")
						end										
					end
				elseif nUpgradeType >= 32 and nUpgradeType <= 34 then
					Pay(9000000)
					if DelItem(2, 1, 30284, 999) == 1 then
						local nBody = GetBody()
						local nGenre = 103
						local szType = "T� Quang Vi�m �� Kh�i"
						if nUpgradeType == 33 then
							nGenre = 100
							szType = "T� Quang Vi�m �� Gi�p"
						elseif nUpgradeType == 34 then
							nGenre = 101
							szType = "T� Quang Vi�m �� Trang"
						end
						gf_AddItemEx2({0, nGenre, 8050 + nBody, 1, 1, -1,-1,-1,-1,-1,-1, 0, 6})
						Talk(1,"",g_szNpcName.."C�i t�o trang b� m�i th�nh c�ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, szType)	
					end
---- N�ng c�p Trang B� Ng� Long T��ng Qu�n 100%
				elseif nUpgradeType >= 57 and nUpgradeType <= 62 then
					if DelItem(2, 1, 30321, 680) == 1 and DelItem(2, 1, 30229, 3) == 1 then
						local nG, nD, nP = gf_UnPack(tItem[1])
						local nGet = 0
						for i=1,getn(tb_upgrade_item) do
							if nG == tb_upgrade_item[i][2][1] and nD == tb_upgrade_item[i][2][2] and nP == tb_upgrade_item[i][2][3] then
								nGet = i
								break;
							end					
						end
						if nGet > 0 then
							nRet, nItemIdx = gf_AddItemEx(tb_upgrade_item[nGet][3], tb_upgrade_item[nGet][1]);
							if nRet == 1 then
								Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
								WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_item[nGet][1])
							else
								WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem th�t b�i")
							end										
						end	
					end
-- N�ng c�p Trang B� Ng� Long T��ng Qu�n 100% (ver 2)
				elseif nUpgradeType == 79 then
					if Pay(7000000)==1 and DelItem(2,1,504,1)==1 and DelItem(2,1,30229,4)==1 and DelItem(2,1,1068,3)==1 then
						for i=233,280 do
							if get_item_count(t, tb_upgrade_item[i][2][1], tb_upgrade_item[i][2][2], tb_upgrade_item[i][2][3]) >=1 then
								local nGenLevel = 0
								if  tb_upgrade_item[i][3][2]==100 or  tb_upgrade_item[i][3][2]==101 or  tb_upgrade_item[i][3][2]==103 then
									 nGenLevel = 6
								end
								nRet, nItemIdx = gf_AddItemEx({tb_upgrade_item[i][3][1], tb_upgrade_item[i][3][2], tb_upgrade_item[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, nGenLevel}, tb_upgrade_item[i][1]);
								Talk(1,"",g_szNpcName.."Ch� t�o th�nh c�ng! "..tb_upgrade_item[i][1].." n�y l� c�a c�c h�.")
								WriteLogEx("NangCapTrangBi","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_item[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
					end
 --N�ng c�p Nguy�n So�i b� 4 100%
				elseif nUpgradeType == 80 then
					if tbItemIndex[1][3] == 102 then
						if Pay(4000000)==1 and DelItem(2,1,30229,5) == 1 and DelItem(2,1,1067,3) == 1 and DelItem(2,95,204,5) == 1 then
							for i=293, 348 do
								if get_item_count(t, tb_upgrade_item[i][2][1], tb_upgrade_item[i][2][2], tb_upgrade_item[i][2][3]) >=1 then
									nRet, nItemIdx = gf_AddItemEx({tb_upgrade_item[i][3][1], tb_upgrade_item[i][3][2], tb_upgrade_item[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, 0}, tb_upgrade_item[i][1]);
									Talk(1,"",g_szNpcName.."Ch� t�o th�nh c�ng! "..tb_upgrade_item[i][1].." n�y l� c�a c�c h�.")
									WriteLogEx("NANG CAP TRANG BI NGUYEN SOAI 3","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_item[i][1])
									break
								end
							end
						else
							Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
						end
					else
						if Pay(4000000)==1 and DelItem(2,1,30229,5) == 1 and DelItem(2,1,1067,2) == 1 and DelItem(2,95,204,4) == 1 then
							for i=293, 348 do
								if get_item_count(t, tb_upgrade_item[i][2][1], tb_upgrade_item[i][2][2], tb_upgrade_item[i][2][3]) >=1 then
									nRet, nItemIdx = gf_AddItemEx({tb_upgrade_item[i][3][1], tb_upgrade_item[i][3][2], tb_upgrade_item[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, 0}, tb_upgrade_item[i][1]);
									Talk(1,"",g_szNpcName.."Ch� t�o th�nh c�ng! "..tb_upgrade_item[i][1].." n�y l� c�a c�c h�.")
									WriteLogEx("NANG CAP TRANG BI NGUYEN SOAI 3","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_item[i][1])
									break
								end
							end
						else
							Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
						end
					end
--N�ng c�p v� kh� Vi�t Y�n
				elseif nUpgradeType == 81 then
					if Pay(1000000)==1 and DelItem(2,1,504,1)==1 and DelItem(2,1,1068,2)==1 and DelItem(2,1,30229,3)==1 then
						for i=1,15 do
							if get_item_count(t, tb_daivietyen[i][2][1], tb_daivietyen[i][2][2], tb_daivietyen[i][2][3]) >=1 then
								nRet, nItemIdx = gf_AddItemEx({tb_daivietyen[i][3][1], tb_daivietyen[i][3][2], tb_daivietyen[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, tb_daivietyen[i][3][13]}, tb_daivietyen[i][1]);
								Talk(1,"",g_szNpcName.."Ch� t�o th�nh c�ng! "..tb_daivietyen[i][1].." n�y l� c�a c�c h�.")
								WriteLogEx("NANG CAP VU KHI VIET YEN","type "..nUpgradeType.." th�nh c�ng",1, tb_daivietyen[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
					end
--C�i t�o v� kh� ��i Vi�t Y�n
				elseif nUpgradeType == 82 then
					if Pay(1000000)==1 and DelItem(2,1,504,2)==1 and DelItem(2,1,539,2)==1 then
						for i=16,30 do
							if get_item_count(t, tb_daivietyen[i][2][1], tb_daivietyen[i][2][2], tb_daivietyen[i][2][3]) >=1 then
								nRet, nItemIdx = gf_AddItemEx({tb_daivietyen[i][3][1], tb_daivietyen[i][3][2], tb_daivietyen[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, tb_daivietyen[i][3][13]}, tb_daivietyen[i][1]);
								Talk(1,"",g_szNpcName.."Ch� t�o th�nh c�ng! "..tb_daivietyen[i][1].." n�y l� c�a c�c h�.")
								WriteLogEx("CAI TAO VU KHI DAI VIET YEN","type "..nUpgradeType.." th�nh c�ng",1, tb_daivietyen[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
					end
-- N�ng c�p trang b� s� m�n
				elseif nUpgradeType == 83 then
					if tbItemIndex[1][3] == 102 then
						if Pay(11000000)==1 and DelItem(2,1,504,1) == 1 and DelItem(2,1,539,15) == 1 then
							for i=1, 278 do
								if get_item_count(t, tb_sumon[i][2][1], tb_sumon[i][2][2], tb_sumon[i][2][3]) >=1 then
									nRet, nItemIdx = gf_AddItemEx({tb_sumon[i][3][1], tb_sumon[i][3][2], tb_sumon[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, 0}, tb_sumon[i][1]);
									Talk(1,"",g_szNpcName.."N�ng c�p th�nh c�ng! "..tb_sumon[i][1].." n�y l� c�a c�c h�.")
									WriteLogEx("NANG CAP TRANG BI SU MON 3","type "..nUpgradeType.." th�nh c�ng",1, tb_sumon[i][1])
									break
								end
							end
						else
							Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
						end
					elseif tbItemIndex[1][3] == 100 or tbItemIndex[1][3] == 101 or tbItemIndex[1][3] == 103 then
						if Pay(11000000)==1 and DelItem(2,1,504,4) == 1 and DelItem(2,1,539,12) == 1 then
							for i=1, 278 do
								if get_item_count(t, tb_sumon[i][2][1], tb_sumon[i][2][2], tb_sumon[i][2][3]) >=1 then
									nRet, nItemIdx = gf_AddItemEx({tb_sumon[i][3][1], tb_sumon[i][3][2], tb_sumon[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, 0}, tb_sumon[i][1]);
									Talk(1,"",g_szNpcName.."N�ng c�p th�nh c�ng! "..tb_sumon[i][1].." n�y l� c�a c�c h�.")
									WriteLogEx("NANG CAP TRANG BI SU MON 3","type "..nUpgradeType.." th�nh c�ng",1, tb_sumon[i][1])
									break
								end
							end
						else
							Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
						end
					else
						if Pay(11000000)==1 and DelItem(2,1,504,1) == 1 and DelItem(2,1,539,20) == 1 then
							for i=1, 278 do
								if get_item_count(t, tb_sumon[i][2][1], tb_sumon[i][2][2], tb_sumon[i][2][3]) >=1 then
									nRet, nItemIdx = gf_AddItemEx({tb_sumon[i][3][1], tb_sumon[i][3][2], tb_sumon[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, 0}, tb_sumon[i][1]);
									Talk(1,"",g_szNpcName.."N�ng c�p th�nh c�ng! "..tb_sumon[i][1].." n�y l� c�a c�c h�.")
									WriteLogEx("NANG CAP TRANG BI SU MON 3","type "..nUpgradeType.." th�nh c�ng",1, tb_sumon[i][1])
									break
								end
							end
						else
							Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
						end
					end
-- N�ng c�p trang b� B�ch Kim Vi�m ��
				elseif nUpgradeType == 84 then
					if Pay(8990000) == 1 and DelItem(2,1,30346,39) == 1 and DelItem(2,1,30229,10) == 1 then
						LIB_Award.szLogTitle = "NANG CAP TRANG BI BACH KIM VIEM DE"
						LIB_Award.szLogAction = "th�nh c�ng"
						if tbItemIndex[1][3] == 100 then
							LIB_Award:AwardByBody(tbBKVD_Giap)
						elseif tbItemIndex[1][3] == 101 then
							LIB_Award:AwardByBody(tbBKVD_Trang)
						elseif tbItemIndex[1][3] == 103 then
							LIB_Award:AwardByBody(tbBKVD_Khoi)
						end
					else
						Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
					end
--N�ng c�p Thi�n Chi Vi�m ��
				elseif nUpgradeType == 85 then
					if Pay(2000000)==1 and DelItem(2,1,539,15)==1 and DelItem(2,1,30346,15)==1 then
						for i=1,12 do
							if get_item_count(t, tbThienChiViemDe[i][2][1], tbThienChiViemDe[i][2][2], tbThienChiViemDe[i][2][3]) >=1 then
								nRet, nItemIdx = gf_AddItemEx({tbThienChiViemDe[i][3][1], tbThienChiViemDe[i][3][2], tbThienChiViemDe[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, tbThienChiViemDe[i][3][13]}, tbThienChiViemDe[i][1]);
								Talk(1,"",g_szNpcName.."Ch� t�o th�nh c�ng! "..tbThienChiViemDe[i][1].." n�y l� c�a c�c h�.")
								WriteLogEx("NANG CAP THIEN CHI VIEM DE","type "..nUpgradeType.." th�nh c�ng",1, tbThienChiViemDe[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
					end
-------------------------------
				elseif nUpgradeType == 35 then
					local nG, nD, nP = gf_UnPack(tItem[1])
					for i = 1, getn(tb_upgrade_weapon_vy) do
						if nG == tb_upgrade_weapon_vy[i][2][1] and nD == tb_upgrade_weapon_vy[i][2][2] and nP == tb_upgrade_weapon_vy[i][2][3] then
							nRet, nItemIdx = gf_AddItemEx(tb_upgrade_weapon_vy[i][3], tb_upgrade_weapon_vy[i][1])
							break
						end
					end
				elseif nUpgradeType == 44 then
					local nG, nD, nP = gf_UnPack(tItem[1])
					local tUpgradeListVY = 
					{
						[1] = {"Vi�t Y�n Phi Tinh �ao",{0,3,6001},{0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[2] = {"Vi�t Y�n Phi Tinh C�n",{0,5,6002},{0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[3] = {"Vi�t Y�n Phi Tinh Tr��ng",{0,8,6003},{0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[4] = {"Vi�t Y�n Phi Tinh Th�",{0,0,6004},{0,0,30004, 1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[5] = {"Vi�t Y�n Phi Tinh Ch�m",{0,1,6005},{0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[6] = {"Vi�t Y�n Phi Tinh Ki�m",{0,2,6006},{0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[7] = {"Vi�t Y�n Phi Tinh C�m",{0,10,6007},{0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[8] = {"Vi�t Y�n Phi Tinh Th�",{0,0,6008},{0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[9] = {"Vi�t Y�n Tr�m Nguy�t C�n",{0,5,6009},{0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[10] = {"Vi�t Y�n Tr�m Nguy�t Ki�m",{0,2,6010},{0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[11] = {"Vi�t Y�n Tr�m Nguy�t B�t",{0,9,6011},{0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[12] = {"Vi�t Y�n Tr�m Nguy�t Th��ng",{0,6,6012},{0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[13] = {"Vi�t Y�n Tr�m Nguy�t Cung",{0,4,6013},{0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[14] = {"Vi�t Y�n Tr�m Nguy�t Nh�n",{0,7,6014},{0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[15] = {"Vi�t Y�n Tr�m Nguy�t Tr�o",{0,11,6015},{0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},	
					}
					for i = 1, getn(tUpgradeListVY) do
						if nG == tUpgradeListVY[i][2][1] and nD == tUpgradeListVY[i][2][2] and nP == tUpgradeListVY[i][2][3] then
							nRet, nItemIdx = gf_AddItemEx(tUpgradeListVY[i][3], tUpgradeListVY[i][1])
							break
						end
					end
					if nRet == 1 then
						if nDing > 0 then
							SetItemSpecialAttr(nItemIdx,"DING7",1)
						end
						Talk(1,"",g_szNpcName.."C�i t�o trang b� m�i th�nh c�ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, szType)	
					end
				elseif nUpgradeType >= 48 and nUpgradeType <= 50 then
					local nG, nD, nP = gf_UnPack(tItem[1])
					local tbAccesoriesTK =
					{
						[1] = {"Thi�n Chi T�ng Ki�m B�o Ch�u",{0,102,38}},
						[2] = {"Thi�n Chi T�ng Ki�m K� Th�ch",{0,102,39}},
						[3] = {"Thi�n Chi T�ng Ki�m Kim �n",{0,102,40}},				
					}
					
					for i = 1, getn(tbAccesoriesTK) do
						if nG == tbAccesoriesTK[i][2][1] and nD == tbAccesoriesTK[i][2][2] and nP == tbAccesoriesTK[i][2][3] then
							nRet, nItemIdx = gf_AddItemEx({0, 102, 30000 + (3 * (GetBody() - 1) + i),1,1,-1,-1,-1,-1,-1,-1,-1}, tbAccesoriesTK[i][1])
							break
						end
					end
					
					if nRet == 1 then
						Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, szType)	
					end
-- C�i t�o trang b� Thi�n Chi T�ng Ki�m					
				elseif nUpgradeType == 63 or nUpgradeType == 64 or nUpgradeType == 65  then
					local nLevItem = GetTaskTemp(TSK_TEMP_TQVD)
					local nG, nD, nP = gf_UnPack(tItem[1])
					nRet, nItemIdx = gf_AddItemEx({nG,nD,nP,1,1, -1,-1, -1, -1, -1, -1, -1,nLevItem}, "Trang b� Thi�n Chi T�ng Ki�m");
					if nRet == 1 then
						if nDing > 0 then
							SetItemSpecialAttr(nItemIdx,"DING7",1)
						end
						Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
						WriteLogEx("Cai tao trang bi","type "..nUpgradeType.." th�nh c�ng",1, "Trang b� Thi�n Chi T�ng Ki�m")
					else
						WriteLogEx("Cai tao trang bi","type "..nUpgradeType.." additem th�t b�i")
					end
-- N�ng c�p Thi�n Chi T��ng Qu�n 100%
				elseif nUpgradeType == 75 or nUpgradeType == 76 or nUpgradeType == 77  then
					if Pay(5000000)==1 and DelItem(2,1,504,4)==1 and DelItem(2,1,539,6)==1 then
						for i=281,292 do
							if get_item_count(t, tb_upgrade_item[i][2][1], tb_upgrade_item[i][2][2], tb_upgrade_item[i][2][3]) >=1 then
								nRet, nItemIdx = gf_AddItemEx({tb_upgrade_item[i][3][1], tb_upgrade_item[i][3][2], tb_upgrade_item[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1,7}, tb_upgrade_item[i][1]);
								Talk(1,"",g_szNpcName.."Ch� t�o th�nh c�ng! "..tb_upgrade_item[i][1].." n�y l� c�a c�c h�.")
								WriteLogEx("NangCapTrangBi","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_item[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
						return
					end		
-- N�ng c�p T��ng Qu�n 100%
				elseif nUpgradeType == 78 then
					if Pay(3000000)==1 and DelItem(2,1,504,4)==1 and DelItem(2,1,30229,4)==1 then
						for i=31,78 do
							if get_item_count(t, tb_upgrade_item[i][2][1], tb_upgrade_item[i][2][2], tb_upgrade_item[i][2][3]) >=1 then
								local nGenLevel = 0
								if  tb_upgrade_item[i][3][2]==100 or  tb_upgrade_item[i][3][2]==101 or  tb_upgrade_item[i][3][2]==103 then
									 nGenLevel = 7
								end
								nRet, nItemIdx = gf_AddItemEx({tb_upgrade_item[i][3][1], tb_upgrade_item[i][3][2], tb_upgrade_item[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, nGenLevel}, tb_upgrade_item[i][1]);
								Talk(1,"",g_szNpcName.."Ch� t�o th�nh c�ng! "..tb_upgrade_item[i][1].." n�y l� c�a c�c h�.")
								WriteLogEx("NangCapTrangBi","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_item[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh�ng �� v�t ph�m c�n thi�t, trang b� kh�ng ���c n�ng c�p")
					end
				elseif nUpgradeType == 66 or nUpgradeType == 67 or nUpgradeType == 68  then
					local nG, nD, nP = gf_UnPack(tItem[1])
					nRet, nItemIdx = gf_AddItemEx({nG,nD,nP,1,1, -1,-1, -1, -1, -1, -1, -1}, "Trang b� Thi�n Chi T�ng Ki�m");
					if nRet == 1 then
						Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
						WriteLogEx("Cai tao trang bi","type "..nUpgradeType.." th�nh c�ng",1, "Trang b� Thi�n Chi T�ng Ki�m")
					else
						WriteLogEx("Cai tao trang bi","type "..nUpgradeType.." additem th�t b�i")
					end	
					
				elseif nUpgradeType == 72 or nUpgradeType == 73 or nUpgradeType == 74  then
						local nbody = GetBody()
						local nItemBKVD = tbBKVD_suc[nSelect][2][nbody]
						local nItemNum = tbCheck_BKVD[nFirstSelected][2]
						if DelItem(2,1,30229, nItemNum) == 1 then			
							gf_AddItemEx2(nItemBKVD, "N�ng c�p trang b� th�nh c�ng", "NANG CAP TRANG BI BKVD 1", "n�ng c�p th�nh c�ng")
							Talk(1,"","Ch�c m�ng b�n nh�n ���c 1 trang b� B�ch Kim Vi�m ��!")					
						end
				elseif nUpgradeType == 69 or nUpgradeType == 70 or nUpgradeType == 71  then
						local nG, nD, nP = gf_UnPack(tItem[1])
						local nGet = 0
						for i=1,getn(tb_upgrade_item) do
							if nG == tb_upgrade_item[i][2][1] and nD == tb_upgrade_item[i][2][2] and nP == tb_upgrade_item[i][2][3] then
								nGet = i
								break;
							end					
						end
						if nGet > 0 then
							nRet, nItemIdx = gf_AddItemEx(tb_upgrade_item[nGet][3], tb_upgrade_item[nGet][1]);
							if nRet == 1 then
								Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
								WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_item[nGet][1])
							else
								WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem th�t b�i")
							end										
						end			
				else
					local nG, nD, nP = gf_UnPack(tItem[1])
					local nGet = 0
					for i=1,getn(tb_upgrade_item) do
						if nG == tb_upgrade_item[i][2][1] and nD == tb_upgrade_item[i][2][2] and nP == tb_upgrade_item[i][2][3] then
							nGet = i
							break;
						end					
					end
					if nGet > 0 then
						nRet, nItemIdx = gf_AddItemEx(tb_upgrade_item[nGet][3], tb_upgrade_item[nGet][1]);
						if nRet == 1 then
							--if nDing > 0 then
								--SetItemSpecialAttr(nItemIdx,"DING7",1)
							--end
							--if nLock > 0 then
								--SetItemSpecialAttr(nItemIdx,"LOCK",1)
							--end
							Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�nh c�ng!")
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�nh c�ng",1, tb_upgrade_item[nGet][1])
						else
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem th�t b�i")
						end										
					end			
				end				
			else
				WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." x�a trang b� th�t b�i")
			end
		else -- ch� t�o item m�i th�t b�i tr� random item �� ��t v�o			
			local nDelG, nDelD, nDelP = 0,0,0
			local nLossItem = gf_GetRandItemByTable(tb_upgrade_needed[nUpgradeType][6],100,1)			
			nDelG, nDelD, nDelP = gf_UnPack(tb_upgrade_needed[nUpgradeType][6][nLossItem][1])			
			for i = 1, getn(t) do	
				if t[i][2] == nDelG and t[i][3] == nDelD and t[i][4] == nDelP then
					if DelItemByIndex(t[i][1], -1) == 1 then
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." th�t b�i",1,nLossItem, nDelG..","..nDelD..","..nDelP )
						break;
					end
				end
			end
			Talk(1,"",g_szNpcName.."Ch� t�o v�t ph�m m�i th�t b�i!")
			Msg2Player("Ch� t�o v�t ph�m m�i th�t b�i.")			
		end
	end
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	local nQianghua, nDing, nRandSeed, nLock = 0,0,0,0
	local nMofa1,nLv1 = 0,0
	local nMofa2,nLv2 = 0,0
	local nMofa3,nLv3 = 0,0
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
			if t[i][2] == 0 then
				nQianghua = GetEquipAttr(t[i][1],2)
				nDing = GetItemSpecialAttr(t[i][1],"DING7")
				nLock = GetItemSpecialAttr(t[i][1],"LOCK") 
				nRandSeed = GetItemRandSeed(t[i][1])				
				nMofa1,nLv1 = GetItemAttr(t[i][1],1)
				nMofa2,nLv2 = GetItemAttr(t[i][1],2)
				nMofa3,nLv3 = GetItemAttr(t[i][1],3)		
			end
		end
	end
	return nCount, nQianghua, nDing, nMofa1, nLv1, nMofa2, nLv2, nMofa3, nLv3, nRandSeed,nLock;
end

function make_tianguashi()
	local tSay = {			
			"* Ch� t�o Thi�n Qu�i Th�ch (c�n 1 Phi Y�n Th�ch + 100 v�ng)/make_tianguashi_1",			
			"* Ch� t�o Thi�n Qu�i Th�ch (c�n 3 Phi Y�n Th�ch + 100 v�ng)/make_tianguashi_3",
			"T�i h� ch� ti�n gh� ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Ch�n lo�i ch� t�o?",getn(tSay),tSay)
end

function make_tianguashi_1()
	if GetItemCount(2,1,30130) < 1 then
		Talk(1,"",g_szNpcName.."��i hi�p vui l�ng mang �� 1 Phi Y�n Th�ch r�i h�y ��n g�p ta!")
		return
	end
	if GetCash() < 1000000 then
		Talk(1,"",g_szNpcName.."��i hi�p kh�ng mang theo �� 100 v�ng th� sao ch� t�o ���c!")
		return
	end
	
	local nRand = random(1, 100)
	if DelItem(2,1,30130,1) == 1 and Pay(1000000) == 1 and nRand <= 30 then
		gf_AddItemEx2({2,0,1084,1}, "Thi�n Qu�i Th�ch", "Nang cap trang bi", "ch� t�o Thi�n Qu�i Th�ch 30%")
		Talk(1,"","B�n nh�n ���c 1 Thi�n Qu�i Th�ch.")
	else
		Talk(1,"","Th�t ng�i qu�! Ch� t�o th�t b�i r�i!")
		return
	end	
end

function make_tianguashi_3()
	if GetItemCount(2,1,30130) < 3 then
		Talk(1,"",g_szNpcName.."��i hi�p vui l�ng mang �� 3 Phi Y�n Th�ch r�i h�y ��n g�p ta!")
		return
	end
	if GetCash() < 1000000 then
		Talk(1,"",g_szNpcName.."��i hi�p kh�ng mang theo �� 100 v�ng th� sao ch� t�o ���c!")
		return
	end
	
	if DelItem(2,1,30130,3) == 1 and Pay(1000000) == 1 then
		gf_AddItemEx2({2,0,1084,1}, "Thi�n Qu�i Th�ch", "Nang cap trang bi", "ch� t�o Thi�n Qu�i Th�ch 100%")
		Talk(1,"","Nh�n ���c 1 Thi�n Qu�i Th�ch.")
	end	
end

function upgrade_vy()
	local tSay = {			
			"* N�ng c�p v� kh� B� Phi Y�n th�nh Vi�t Y�n (c�n 1 V� Kh� B� Phi Y�n ho�c B� Phi Y�n trung c�p (c��ng h�a + 7 tr� l�n) + 3 Phi Y�n Th�ch + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(35,0)",			
			"* N�ng c�p v� kh� B� Phi Y�n trung c�p th�nh Vi�t Y�n (c�n 1 V� Kh� B� Phi Y�n trung c�p (c��ng h�a + 7 tr� l�n) + 1 Thi�n Qu�i Th�ch + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(44,0)",
			"* N�ng c�p v� kh� Vi�t Y�n th�nh ��i Vi�t Y�n (c�n 1 V� Kh� Vi�t Y�n + 3 Thi�n Qu�i Th�ch + 1 ��nh H�n Thi�n Th�ch + 100 v�ng)/#do_upgrade(36,0)",
			"T�i h� ch� ti�n gh� ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Ch�n lo�i v� kh� mu�n n�ng c�p?",getn(tSay),tSay)
end

function upgrade_tk_equipment()
	local tSay = {			
			"* N�ng c�p Thi�n Chi T�ng Ki�m T� Kim M�o th�nh Thi�n Chi T�ng Ki�m T� Kim M�o (c�n 1 T�ng Ki�m T� Kim M�o (c��ng h�a + 7 tr� l�n) + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(45,0)",
			"* N�ng c�p Thi�n Chi T�ng Ki�m Kim L� Th��ng th�nh Thi�n Chi T�ng Ki�m Kim L� Th��ng (c�n 1 T�ng Ki�m Kim L� Th��ng (c��ng h�a + 7 tr� l�n) + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(46,0)",
			"* N�ng c�p Thi�n Chi T�ng Ki�m � Kim Ph�c th�nh Thi�n Chi T�ng Ki�m � Kim Ph�c (c�n 1 T�ng Ki�m � Kim Ph�c (c��ng h�a + 7 tr� l�n) + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(47,0)",
			"* N�ng c�p Thi�n Chi T�ng Ki�m Kim �n th�nh Thi�n Chi T�ng Ki�m Kim �n (c�n 1 T�ng Ki�m Kim �n + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(48,0)",
			"* N�ng c�p Thi�n Chi T�ng Ki�m K� Th�ch th�nh Thi�n Chi T�ng Ki�m K� Th�ch (c�n 1 T�ng Ki�m K� Th�ch + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(49,0)",
			"* N�ng c�p Thi�n Chi T�ng Ki�m B�o Ch�u th�nh Thi�n Chi T�ng Ki�m B�o Ch�u (c�n 1 T�ng Ki�m B�o Ch�u + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(50,0)",
			"T�i h� ch� ti�n gh� ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Ch�n lo�i trang b� mu�n n�ng c�p?",getn(tSay),tSay)
end

function upgrade_tctk_equipment()
	local tSay = {			
			"* C�i t�o Thi�n Chi T�ng Ki�m T� Kim M�o (c�n 1 Thi�n Chi T�ng Ki�m T� Kim M�o (c��ng h�a + 7 tr� l�n) + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(63,0)",
			"* C�i t�o Thi�n Chi T�ng Ki�m Kim L� Th��ng (c�n 1 Thi�n Chi T�ng Ki�m Kim L� Th��ng (c��ng h�a + 7 tr� l�n) + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(64,0)",
			"* C�i t�o Thi�n Chi T�ng Ki�m � Kim Ph�c (c�n 1 Thi�n Chi T�ng Ki�m � Kim Ph�c (c��ng h�a + 7 tr� l�n) + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(65,0)",
			"* C�i t�o Thi�n Chi T�ng Ki�m Kim �n (c�n 1 Thi�n Chi T�ng Ki�m Kim �n + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(66,0)",
			"* C�i t�o Thi�n Chi T�ng Ki�m K� Th�ch (c�n 1 Thi�n Chi T�ng Ki�m K� Th�ch + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(67,0)",
			"* C�i t�o Thi�n Chi T�ng Ki�m B�o Ch�u (c�n 1 Thi�n Chi T�ng Ki�m B�o Ch�u + 1 Ho�ng Kim ��i H�ng Bao(c� v�ng) + 1 N� Oa Tinh Th�ch + 100 v�ng)/#do_upgrade(68,0)",
			"T�i h� ch� ti�n gh� ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta c�i t�o lo�i trang b� n�o? <color=red>L�u �: t� l� th�nh c�ng 100%, thu�c t�nh nh�n ���c l� ng�u nhi�n.<color>",getn(tSay),tSay)
end

function do_upgrade_type(nType)
	local tSay = {
		format("Nam Ti�u Chu�n/#do_upgrade(%d,1)",nType),
		format("Nam Kh�i Ng�/#do_upgrade(%d,2)",nType),
		format("N� G�i C�m/#do_upgrade(%d,3)",nType),
		format("Ki�u N�/#do_upgrade(%d,4)",nType),		
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�c h� mu�n ta c�i t�o lo�i trang b� n�o? <color=red>L�u �: t� l� th�nh c�ng 100%.<color>",getn(tSay),tSay)
end

function make_shimen_tier4()
	local tSay = {			
			"* Ch� t�o M� s� m�n 4 t��ng �ng v�i m�n ph�i (c�n 999 V� L�m Ho�ng Kim L�nh, 2 N� Oa Tinh Th�ch, 2000 v�ng, 2000 �i�m S� M�n)/#confirm_make_shimen_tier4(1)",
			"* Ch� t�o Th��ng Y s� m�n 4 t��ng �ng v�i m�n ph�i (c�n 999 V� L�m Ho�ng Kim L�nh, 2 N� Oa Tinh Th�ch, 2000 v�ng, 2000 �i�m S� M�n)/#confirm_make_shimen_tier4(2)",
			"* Ch� t�o H� Y s� m�n 4 t��ng �ng v�i m�n ph�i (c�n 999 V� L�m Ho�ng Kim L�nh, 2 N� Oa Tinh Th�ch, 2000 v�ng, 2000 �i�m S� M�n)/#confirm_make_shimen_tier4(3)",
			"* Ch� t�o Trang S�c s� m�n 4 lo�i 1 t��ng �ng v�i m�n ph�i (c�n 999 V� L�m Ho�ng Kim L�nh, 2 N� Oa Tinh Th�ch, 2000 v�ng, 2000 �i�m S� M�n)/#confirm_make_shimen_tier4(4)",
			"* Ch� t�o Trang S�c s� m�n 4 lo�i 2 t��ng �ng v�i m�n ph�i (c�n 999 V� L�m Ho�ng Kim L�nh, 2 N� Oa Tinh Th�ch, 2000 v�ng, 2000 �i�m S� M�n)/#confirm_make_shimen_tier4(5)",
			"T�i h� ch� ti�n gh� ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Ch�n lo�i trang b� mu�n ch� t�o?",getn(tSay),tSay)
end

function confirm_make_shimen_tier4(nUpgradeType)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "", g_szNpcName.."Ph�i gia nh�p h� ph�i ta m�i gi�p ng��i ���c!");
		return 0;
	end
	
	if gf_JudgeRoomWeight(2,500,g_szNpcName) == 0 then
		return 0;
	end
	
	if GetTask(336) < 2000 or GetCash() < 20000000 then
		Talk(1, "", g_szNpcName.."C�n c� �t nh�t 2000 v�ng v� 2000 �i�m S� M�n m�i c� th� th�c hi�n ch� t�o!");
		return 0
	end
	
	if GetItemCount(2, 1, 30284) < 999 or GetItemCount(2, 1, 504) < 2 then
		Talk(1, "", g_szNpcName.."C�n c� 999 V� L�m Ho�ng Kim L�nh v� 2 N� Oa Tinh Th�ch m�i c� th� th�c hi�n ch� t�o!");
		return 0
	end
	-- Ch� s� base c�a c�c trang b� theo m�n ph�i
	local tbShimen4Equip =
	{
		[2] =  {"Thi�u L�m t�c gia", 230}, 
		[3] =  {"Thi�u L�m thi�n t�ng", 330}, 
		[4] =  {"Thi�u L�m v� t�ng", 430}, 
		[14] =  {"V� �ang ��o gia", 1430}, 
		[15] =  {"V� �ang t�c gia", 1530}, 
		[8] =  {"Nga My ph�t gia", 830}, 
		[9] =  {"Nga My t�c gia", 930}, 
		[11] =  {"C�i Bang t�nh y", 1130}, 
		[12] =  {"C�i Bang � y", 1230}, 
		[6] =  {"���ng M�n", 630}, 
		[17] =  {"D��ng Gia th��ng", 1730}, 
		[18] =  {"D��ng Gia cung", 1830}, 
		[20] = {"Ng� ��c hi�p ��c", 2030}, 
		[21] = {"Ng� ��c t� ��c", 2130}, 
	}
	
	local tbUpgradeTypes =
	{
		[1] = {"M�", 103},
		[2] = {"Th��ng Y", 100},
		[3] = {"H� Y", 101},
		[4] = {"Trang S�c 1", 102},
		[5] = {"Trang S�c 2", 102},
	}
	
	-- X�c ��nh s� G, D, P �� add item
	local nPRoute = GetPlayerRoute()
	local nG = 0
	local nD = tbUpgradeTypes[nUpgradeType][2]
	local nP = tbShimen4Equip[nPRoute][2] + GetBody()
	if nUpgradeType == 5 then
		nP = nP + 4
	end
	if nPRoute == 8 or nPRoute == 9 then
		nP = nP - 2
	end
	
	local szEquipmentName = tbUpgradeTypes[nUpgradeType][1].." s� m�n c�p 4 m�n ph�i "..tbShimen4Equip[nPRoute][1]
	
	if Pay(20000000) == 1 and DelItem(2, 1, 30284, 999) == 1 and DelItem(2, 1, 504, 2) == 1 then
		SetTask(336, GetTask(336) - 2000)
		gf_AddItemEx2({nG, nD, nP, 1, 1, -1, -1, -1, -1, -1, -1}, szEquipmentName, "Che tao Trang bi Su Mon 4", "ch� t�o th�nh c�ng")
	end
end


function upgrade_tq_emperor_100()
	local tSay = {
		"* N�ng c�p Vi�m �� Kh�i (c�n 4 N� Oa Tinh Th�ch + 06 Ho�ng Kim ��i H�ng Bao (999 v�ng) + 600 v�ng  + 1 T� Quang Vi�m �� Kh�i c��ng h�a 7 tr� l�n)/#do_upgrade(75,0)",
		"* N�ng c�p Vi�m �� Gi�p (c�n 4 N� Oa Tinh Th�ch + 06 Ho�ng Kim ��i H�ng Bao (999 v�ng) + 600 v�ng  + 1 T� Quang Vi�m �� Gi�p c��ng h�a 7 tr� l�n)/#do_upgrade(76,0)",
		"* N�ng c�p Vi�m �� Trang (c�n 4 N� Oa Tinh Th�ch + 06 Ho�ng Kim ��i H�ng Bao (999 v�ng) + 600 v�ng  + 1 T� Quang Vi�m �� Trang c��ng h�a 7 tr� l�n)/#do_upgrade(77,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."Ta ��m b�o th�nh c�ng 100%, c�c h� mu�n ta n�ng c�p lo�i trang b� n�o?",getn(tSay),tSay)
end


function upgrade_gen2_100()
	local tSay = {
		"*Ti�n h�nh n�ng c�p/#do_upgrade(79,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N�ng c�p Thi�n Chi T��ng Qu�n th�nh c�ng 100% ph�i c�n <color=yellow>3 Thi�n Th�ch Linh Th�ch, 1 N� Oa Tinh Th�ch, 4 B�ch Kim H�ng Bao (4000v), 800 v�ng<color>. N�n, �o, qu�n mu�n n�ng c�p ph�i <color=red>c��ng h�a 7<color> tr� l�n.",getn(tSay),tSay)
end


function upgrade_upper_mar_100()
	local tSay = {
		"*Ti�n h�nh n�ng c�p/#do_upgrade(80,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N�ng c�p Ng� Long/Chi�u Th�nh Nguy�n So�i th�nh ��i T�ng/Li�u Nguy�n So�i th�nh c�ng 100% c�n:\n* N�n, �o, qu�n: 2 ��nh h�n thi�n th�ch th�n th�ch, 4 thi�n cang l�nh, 5 b�ch kim h�ng bao, 500 v�ng, trang b� +7\n* K�, ph�: 3 ��nh h�n thi�n th�ch th�n th�ch, 5 thi�n cang l�nh, 5 b�ch kim h�ng bao, 500 v�ng, k� ho�c ph� t��ng �ng",getn(tSay),tSay)
end


function upgrade_vietyen()
	local tSay = {
		"*Ti�n h�nh n�ng c�p/#do_upgrade(81,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N�ng c�p v� kh� Vi�t Y�n th�nh ��i Vi�t Y�n c�n: V� kh� Vi�t Y�n+7 tr� l�n, 1 N� Oa Tinh Th�ch, 2 Thi�n Th�ch Linh Th�ch, 3 B�ch Kim H�ng Bao, 200 v�ng",getn(tSay),tSay)
end


function remake_daivietyen()
	local tSay = {
		"*Ti�n h�nh n�ng c�p/#do_upgrade(82,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C�i t�o v� kh� ��i Vi�t Y�n c�n: V� kh� Vi�t Y�n+7 tr� l�n, 2 N� Oa Tinh Th�ch, 2 Ho�ng Kim H�ng Bao, 200 v�ng",getn(tSay),tSay)
end


function upgrade_sumon4()
	local tSay = {
		"*Ti�n h�nh n�ng c�p/#do_upgrade(83,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N�ng c�p s� m�n b� 3 th�nh s� m�n b� 4 c�n:\n* N�n, �o, qu�n: Trang b� s� m�n b� 3 c��ng h�a 7 tr� l�n + 4 N� Oa Tinh Th�ch + 12 Ho�ng Kim H�ng Bao + 1200 v�ng\n* Ng�c b�i: Ng�c b�i s� m�n b� 3 + 1 N� Oa Tinh Th�ch + 15 Ho�ng Kim H�ng Bao + 1200 v�ng\n*V� kh�: V� kh� s� m�n b� 3 c��ng h�a 7 tr� l�n + 1 N� Oa Tinh Th�ch + 20 Ho�ng Kim H�ng Bao + 1200 v�ng\n\n<color=red>T� l� th�nh c�ng 100%<color>",getn(tSay),tSay)
end


function upgrade_bachkimviemde()
	local tSay = {
		"*Ti�n h�nh n�ng c�p/#do_upgrade(84,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N�ng c�p Thi�n Chi Vi�m �� th�nh B�ch Kim Vi�m �� c�n: trang b� Thi�n Chi Vi�m �� [+10] + 39 m�nh b�ch kim + 10 b�ch kim ��i h�ng bao (4000 v�ng) + 999 v�ng.\n<color=red>T� l� th�nh c�ng 100%<color>",getn(tSay),tSay)
end


function upgrade_thienchiviemde()
	local tSay = {
		"*Ti�n h�nh n�ng c�p/#do_upgrade(85,0)",
		"T�i h� ch� ti�n gh� ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N�ng c�p Vi�m �� th�nh Thi�n Chi Vi�m �� c�n 15 m�nh b�ch kim + 15 ho�ng kim ��i h�ng bao (999 v�ng) + 300 v�ng.\n<color=red>T� l� th�nh c�ng 100%<color>",getn(tSay),tSay)
end


function upgrade_bachkimviemde_100_Form()
	tbSay = {
		"Ti�n h�nh n�ng c�p/upgrade_bachkimviemde_100_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(g_szNpcName.."N�ng c�p trang b� Thi�n Chi Vi�m �� th�nh B�ch Kim Vi�m �� c�n:\n - Trang b� Thi�n Chi Vi�m �� c��ng h�a 13 tr� l�n.\n - 68 M�nh b�ch kim.\n - 199 Thi�n th�ch tinh th�ch.\n - 3999 v�ng.\n<color=red>(T� l� th�nh c�ng 100%)<color>",getn(tbSay),tbSay)
end


function upgrade_bachkimviemde_100_Done()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", BACHKIMVIEMDE100_FILE, 1)
end

function RenLaiVuKhi_Form()
	local szSay = "N�u v� kh� �ang d�ng kh�ng �� s�c m�nh chinh ph�c v� l�m, h�y ��a ta r�n l�i cho. C� �i�u ph�i tr� c�ng ta x�ng ��ng nh�\n"
	szSay = szSay .. "+ V� kh� 76 (c��ng h�a 11)  th�nh  v� kh� 86 (c��ng h�a 0): 390 Thi�n Th�ch, 290 M�nh Thi�n Th�ch, 79 Thi�n Th�ch Tinh Th�ch\n"
	szSay = szSay .. "+ V� kh� 86 (c��ng h�a 11)  th�nh  v� kh� 96 (c��ng h�a 0): 390 Thi�n Th�ch, 290 M�nh Thi�n Th�ch, 99 Thi�n Th�ch Tinh Th�ch\n"
	szSay = szSay .. "<color=red>L�u �: Sau khi r�n l�i, thu�c t�nh v� kh� s� kh�ng thay ��i.<color>"
	tbSay = {
		"B�t ��u r�n/RenLaiVuKhi_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(g_szNpcName..szSay,getn(tbSay),tbSay)
end

function RenLaiVuKhi_Done()
	PutinItemBox("R�n l�i v� kh�" ,1 , "X�c nh�n mu�n r�n l�i?", RENLAIVUKHI_FILE, 1)
end



-- Nang cap Thien Chi Tuong Quan 100%
function ThienChiTuongQuan100Upgrade_Form()
	local szSay = g_szNpcName.."N�ng c�p trang b� T��ng Qu�n th�nh Thi�n Chi T��ng Qu�n c�n:\n"
	szSay = szSay .. "<color=red>*<color> <color=yellow>N�n, gi�p, qu�n:<color> T��ng Qu�n c��ng h�a 7 tr� l�n, 01 Thi�n Th�ch Linh Th�ch, 01 �inh H�n Thi�n Th�ch Th�n Th�ch, 01 ��i ��nh H�n, 5.000 V�ng.\n"
	szSay = szSay .. "<color=red>*<color> <color=yellow>L�nh, k�, ph�:<color> 02 Thi�n Th�ch Linh Th�ch, 01 �inh H�n Thi�n Th�ch Th�n Th�ch, 01 ��i ��nh H�n, 5.000 V�ng.\n"
	szSay = szSay .. "<color=red>T� l� th�nh c�ng 100%<color>"
	tbSay = {
		"Ti�n h�nh n�ng c�p/ThienChiTuongQuan100Upgrade_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(szSay,getn(tbSay),tbSay)
end

function ThienChiTuongQuan100Upgrade_Done()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p th�nh Thi�n Chi T��ng Qu�n?", THIENCHITUONGQUAN100_FILE, 1)
end


-- Nang cap Ngu Long Tuong Quan 100%
function NguLongTuongQuan100Upgrade_Form()
	local szSay = g_szNpcName.."N�ng c�p trang b� Thi�n Chi T��ng Qu�n th�nh Ng� Long T��ng Qu�n c�n:\n"
	szSay = szSay .. "<color=red>*<color> <color=yellow>N�n, gi�p, qu�n:<color> C��ng h�a 7 tr� l�n, 2 Thi�n Th�ch Linh Th�ch, 1 �inh H�n Thi�n Th�ch Th�n Th�ch, 01 ��i ��nh H�n, 5.000 V�ng.\n"
	szSay = szSay .. "<color=red>*<color> <color=yellow>L�nh, k�, ph�:<color> 2 Thi�n Th�ch Linh Th�ch, 2 �inh H�n Thi�n Th�ch Th�n Th�ch, 01 ��i ��nh H�n, 5.000 V�ng.\n"
	szSay = szSay .. "<color=red>T� l� th�nh c�ng 100%<color>"
	tbSay = {
		"Ti�n h�nh n�ng c�p/NguLongTuongQuan100Upgrade_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(szSay,getn(tbSay),tbSay)
end

function NguLongTuongQuan100Upgrade_Done()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p th�nh Thi�n Chi T��ng Qu�n?", NGULONGTUONGQUAN100_FILE, 1)
end


function NguLong2ThuongUngTuongQuan100Upgrade_Form()
	local szSay = g_szNpcName.."N�ng c�p trang b� Ng� Long T��ng Qu�n th�nh Th��ng �ng T��ng Qu�n c�n:\n"
	szSay = szSay .. "* N�n, gi�p, qu�n: Trang b� c��ng h�a 13 tr� l�n, 9 Thi�n Cang L�nh, 19 Thi�n M�n Kim L�nh, 3.000 v�ng\n"
	szSay = szSay .. "* L�nh, k�, ph�: 9 Thi�n Cang L�nh,,19 Thi�n M�n Kim L�nh, 5.000 v�ng.\n"
	szSay = szSay .. "<color=red>T� l� th�nh c�ng 100%<color>"
	tbSay = {
		"Ti�n h�nh n�ng c�p/NguLong2ThuongUngTuongQuan100Upgrade_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(szSay,getn(tbSay),tbSay)
end

function NguLong2ThuongUngTuongQuan100Upgrade_Done()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", NGULONG2THUONGUNGTUONGQUAN100_FILE, 1)
end


function TuongQuan2ThuongUngTuongQuan_Form()
	local szSay = g_szNpcName.."N�ng c�p trang b� T��ng Qu�n th�nh Th��ng �ng T��ng Qu�n c�n:\n"
	szSay = szSay .. "* N�n, gi�p, qu�n: Trang b� T��ng Qu�n c��ng h�a 7 tr� l�n, 13 Thi�n Cang L�nh, 13 Thi�n M�n Kim L�nh, 3 N� Oa Tinh Th�ch, 60 Thi�n Th�ch Tinh Th�ch, 6.000 V�ng\n"
	szSay = szSay .. "* L�nh, k�, ph�: 13 Thi�n Cang L�nh, 13 Thi�n M�n Kim L�nh, 3 N� Oa Tinh Th�ch, 60 Thi�n Th�ch Tinh Th�ch, 8.000 V�ng\n"
	szSay = szSay .. "<color=red>T� l� th�nh c�ng 100%<color>"
	tbSay = {
		"Ti�n h�nh n�ng c�p/TuongQuan2ThuongUngTuongQuan_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(szSay,getn(tbSay),tbSay)
end

function TuongQuan2ThuongUngTuongQuan_Done()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", TUONGQUAN2THUONGUNGTUONGQUAN_FILE, 1)
end


function ThienChi2ThuongUngTuongQuan_Form()
	local szSay = g_szNpcName.."N�ng c�p trang b� Thi�n Chi T��ng Qu�n th�nh Th��ng �ng T��ng Qu�n c�n:\n"
	szSay = szSay .. "* N�n, gi�p, qu�n: Trang b� T��ng Qu�n c��ng h�a 7 tr� l�n, 11 Thi�n Cang L�nh, 11 Thi�n M�n Kim L�nh, 3 N� Oa Tinh Th�ch, 50 Thi�n Th�ch Tinh Th�ch, 3.000 V�ng\n"
	szSay = szSay .. "* L�nh, k�, ph�: 11 Thi�n Cang L�nh, 11 Thi�n M�n Kim L�nh, 3 N� Oa Tinh Th�ch, 70 Thi�n Th�ch Tinh Th�ch, 4.000 V�ng\n"
	szSay = szSay .. "<color=red>T� l� th�nh c�ng 100%<color>"
	tbSay = {
		"Ti�n h�nh n�ng c�p/ThienChi2ThuongUngTuongQuan_Done",
		"Ta ch� xem th�i/gf_DoNothing",	
	}
	Say(szSay,getn(tbSay),tbSay)
end

function ThienChi2ThuongUngTuongQuan_Done()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", THIENCHITUONGQUAN2THUONGUNGTUONGQUAN_FILE, 1)
end


function NguLongTuongQuanChange_Menu()
	local tbSay = {
		"Trang b� C��ng H�a + 10 tr� l�n/#NguLongTuongQuanChange_Form(10)",
		"Trang b� C��ng h�a + 13 tr� l�n/#NguLongTuongQuanChange_Form(13)",
		"Trang b� C��ng h�a + 14 tr� l�n/#NguLongTuongQuanChange_Form(14)",
		"3 Lo�i Ng�c B�i/#NguLongTuongQuanChange_Form(-1)",
		"Ta ch� xem th�i/gf_DoNothing",
	}
	Say(g_szNpcName.."C�c h� h�y ch�n lo�i c��ng h�a ph� h�p v�i trang b� m�nh c�.", getn(tbSay), tbSay)
end


function ThuongUngTuongQuanChange_Menu()
	local tbSay = {
		"Trang b� C��ng H�a + 10 tr� l�n/#ThuongUngTuongQuanChange_Form(10)",
		"Trang b� C��ng h�a + 13 tr� l�n/#ThuongUngTuongQuanChange_Form(13)",
		"Trang b� C��ng h�a + 14 tr� l�n/#ThuongUngTuongQuanChange_Form(14)",
		"3 Lo�i Ng�c B�i/#ThuongUngTuongQuanChange_Form(-1)",
		"Ta ch� xem th�i/gf_DoNothing",
	}
	Say(g_szNpcName.."C�c h� h�y ch�n lo�i c��ng h�a ph� h�p v�i trang b� m�nh c�.", getn(tbSay), tbSay)
end


function VoSong_Menu()
	local szTalkStr = "Thi�n h� v� song ��ng l� Thi�n h� v� song, mu�n c� n� th�t s� kh�ng d�. Ng��i s� c� b� thi�n h� tuy�t th� chi b�o n�y n�u ��p �ng �� 1 trong 3 �i�u ki�n sau:\n"
	szTalkStr = szTalkStr .. "1. Nguy�n b� V� L�m B� Ch� <color=yellow>+15<color>, <color=red>14<color> C�u Thi�n V� C�c ��n, <color=red>14<color> Th�n T�i B�o R��ng.\n"
	szTalkStr = szTalkStr .. "2. Nguy�n b� V� L�m B� Ch� <color=yellow>+14<color>, <color=red>29<color> C�u Thi�n V� C�c ��n, <color=red>29<color> Th�n T�i B�o R��ng.\n"
	szTalkStr = szTalkStr .. "3. Nguy�n b� V� L�m B� Ch� <color=yellow>+13<color>, <color=red>44<color> C�u Thi�n V� C�c ��n, <color=red>44<color> Th�n T�i B�o R��ng."
	local tbSay = {
		"Ta mu�n Thi�n H� V� Song/VoSong_Upgrade",
		"Ta ��n xem th�i/gf_DoNothing",
	}
	Say(szTalkStr, getn(tbSay), tbSay)
end


function VoSong_Upgrade()
	PutinItemBox("N�ng c�p trang b�" ,3 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", BACHU2VOSONG_FILE, 1)
end


function ThuongUngNguyenSoai100_Form()
	local szSay = g_szNpcName.."N�ng c�p trang b� ��i T�ng-Li�u Nguy�n So�i th�nh Th��ng �ng Nguy�n So�i c�n:\n"
	szSay = szSay  .. "* N�n, gi�p, qu�n: Trang b� ��i T�ng-Li�u Nguy�n So�i c��ng h�a 13 tr� l�n, 9 N� Oa Tinh Th�ch, 19 Thi�n Cang L�nh, 29 Thi�n M�n Kim L�nh, 3900 xu v�t ph�m.\n"
	szSay = szSay  .. "* So�i H�, So�i L�nh, So�i Ph�, So�i K�: 9 N� Oa Tinh Th�ch, 21 Thi�n Cang L�nh, 29 Thi�n M�n Kim L�nh, 7900 xu v�t ph�m.\n"
	szSay = szSay  .. "<color=red>(T� l� th�nh c�ng 100%)<color>"
	tbSay = {
		"Ti�n h�nh n�ng c�p/ThuongUngNguyenSoai100_Done",
		"Ta ch� xem th�i/gf_DoNothing",
	}
	Say(szSay,getn(tbSay),tbSay)
end


function ThuongUngNguyenSoai100_Done()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", THUONGUNGNGUYENSOAI100_FILE, 1)
end


function LoiHo_Menu()
	local tbSay = {}
--	tinsert(tbSay, "Nh�n qu�n c�ng anh h�ng/QuanCongAnhHung_Menu")
	tinsert(tbSay, "N�ng c�p Th��ng �ng T��ng Qu�n th�nh L�i H� T��ng Qu�n/TuongQuan_ThuongUng2LoiHo");
	tinsert(tbSay, "N�ng c�p Th��ng �ng Nguy�n So�i th�nh L�i H� Nguy�n So�i/NguyenSoai_ThuongUng2LoiHo");
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("Trang b� L�i H� �� xu�t hi�n tr�n giang h�, li�u c�c h� c� �� s�c s� h�u?",getn(tbSay),tbSay)
end


function TuongQuan_ThuongUng2LoiHo()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", THUONGUNGTUONGQUAN2LOIHOTUONGQUAN_FILE, 1)
end


function NguyenSoai_ThuongUng2LoiHo()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", THUONGUNGNGUYENSOAI2LOIHONGUYENSOAI_FILE, 1)
end


function QuanCongAnhHung_Menu()
	local tbSay = {}
	tinsert(tbSay, "Nh�n 1 qu�n c�ng anh h�ng (ti�u hao 189 xu v�t ph�m/#QuanCongAnhHung_Nhan(1)")
	tinsert(tbSay, "Nh�n 10 qu�n c�ng anh h�ng (ti�u hao 1890 xu v�t ph�m/#QuanCongAnhHung_Nhan(10)")
	tinsert(tbSay, "Ta ch�a mu�n nh�n/gf_DoNothing")
	Say("Lu�n v� Anh H�ng c�ng c� n�m b�y c�ch, l�m ta ng��ng m� c�ng l� m�t c�ch.",getn(tbSay),tbSay)
end


function QuanCongAnhHung_Nhan(nQty)
	nQty = nQty or 0
	local tbNguyenLieu = {item={{gdp={2,1,30230,189*nQty}}}}
	if gf_JudgeRoomWeight(1,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, h�y s�p x�p l�i h�nh trang.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbNguyenLieu)
	if nCheck == 0 then
		return 0
	end
	LIB_Award.szLogTitle = "LOI HO - NHAN QUAN CONG ANH HUNG"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:PayMaterial(tbNguyenLieu)
	local tbAward = {item={{gdp={2,1,30499,nQty}}}}
	LIB_Award:Award(tbAward)
end