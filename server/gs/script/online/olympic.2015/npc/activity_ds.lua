--���˻��ʹ
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 

tbSay_201207 = {
	"Gi�i thi�u ho�t ��ng/introduce_201207",
	"Gh�p Ng� S�c Th�nh H�a Th�ch/combining_flame_201207",
	"�o�n s� tr�ng Lam S�c Th�nh H�a Th�ch/guess_flame_201207",
	"��n H�a V�c C�u Ch�u thu th�p Th�nh H�a Th�ch/goto_caji_map_201207",
	"��n Thi�n S� B� C�nh thu th�p Th�nh H�a Th�ch/goto_tianshimijing",
	"R�t th��ng H�nh V�n/oly_lucky_star_201207",
	"��i Ng� Th�i Th�nh H�a sang Ng� S�c Th�nh H�a Th�ch/ExchangeItem",
}

sTitle_201207 = "Ch�o m�ng phi�n b�n m�i, th�p s�ng Th�nh H�a ��n �� nh�n ph�n th��ng t�t. Ng��i ch�i ��t c�p 80, �� gia nh�p l�u ph�i v� h�c h�t k� n�ng c�p 55 c� th� tham gia.";

Activity_Ds_Name = "<color=green>��i S� ho�t ��ng: <color>";

sTitle_201207_1 = "T�i m�i th�nh Thuy�n Ch�u (165/192), Th�nh �� (180/179), ��i L� ( 231/222), T��ng D��ng (221/195), Ph��ng T��ng (221/195), Bi�n Kinh ( 183/173) ��u c� m�t Th�nh H�a ��n";

function introduce_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		"Ngu�n g�c v� ch�ng lo�i Th�nh H�a/source_201207",
		"Ph�n th��ng v� s� l�n s� d�ng 5 lo�i Th�nh H�a �� th�p s�ng/danse_award_201207",
		"Ph�n th��ng v� s� l�n s� d�ng Ng� Th�i Th�nh H�a �� th�p s�ng/wucai_award_201207",
		"R�t th��ng H�nh V�n Tinh m�i ng�y/lucky_star_201207",
		"H�ng ng�y th�p l�a g�i BOSS/lucky_call_boss",
		"\n r�t lui/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1,getn(tbSay),tbSay);
end

function source_201207()
	local tbBody = "  \n H�c S�c Th�nh H�a��R�i ra t� Boss �i L��ng S�n, V�n Ki�m Tr�ng;  \n Ho�ng S�c Th�nh H�a��Nh�n ���c khi gi�t qu�i � Qu� M�n H�i Lang;  \n H�ng S�c Th�nh H�a��R�i ra t� Thi�n M�n Tr�n;  \n L�c S�c Th�nh H�a��Thu th�p U Minh Hoa � Qu� M�n H�i Lang (c� x�c su�t sinh ra khi gi�t ch�t qu�i v�t);   \n Lam S�c Th�nh H�a��Nh�n ���c khi tham gia �o�n s�;  \n Ng� Th�i Th�nh H�a��Gh�p � ��i S� ho�t ��ng ho�c c� th� nh�n ���c khi gi�t qu�i chi�u d� Minh H�a Qu� Linh";
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..tbBody;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function danse_award_201207()
	local tbBody = format("S� l�n: Th�nh H�a ��n � m�i th�nh th� ���c th�p s�ng 3 l�n/ng�y. Ph�n th��ng:\n   S� l�n th�p s�ng +1;\n   S� l�n th�p s�ng trong ng�y c�a server +1;\n   exp <color=green>%d<color>;\n   H�p Trang Tr� Gi�ng Sinh;\n   ho�c 1 ��o c� ng�u nhi�n.", OLY_EXP_2);
	local tbSay = {
		"S� l�n th�p s�ng c�ng d�n c� l�i �ch g� kh�ng?/fire_used_201207",
		"\n tr� v� t�ng tr��c/introduce_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function wucai_award_201207()
	local tbBody = format("S� l�n: C� th� th�p s�ng Th�nh H�a ��n t�i �a 2000 l�n. Ph�n th��ng:\n   S� l�n th�p s�ng +1;\n   S� l�n th�p s�ng trong ng�y c�a server +3;\n   exp <color=green>%d<color>;\n   H�p Trang Tr� Gi�ng Sinh*3;\n   ho�c 1 ��o c� ng�u nhi�n.", OLY_EXP_3);
	local tbSay = {
		"S� l�n th�p s�ng c�ng d�n c� l�i �ch g� kh�ng?/fire_used_201207",
		"\n tr� v� t�ng tr��c/introduce_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function fire_used_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."S� l�n th�p s�ng ��t ��n c�c m�c kh�c nhau s� nh�n ���c nh�ng ph�n th��ng sau:\n";
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function combining_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		"Gh�p b�ng Ng� Th�i Th�n Th�ch (b�n � Ng� C�c)/combining_1_201207",
		--"Gh�p Th�nh H�a v� V�ng/combining_2_201207",
		"\n r�t lui/nothing",
	}
	Say(Activity_Ds_Name.."C�c h� mu�n ch�n c�ch th�c n�o �� gh�p Ng� Th�i Th�nh H�a v�y?",getn(tbSay),tbSay);
end

function combining_1_201207()
	local tbSay = {
		format("Gh�p %d H�ng S�c Th�nh H�a+%d Ng� Th�i Th�n Th�ch/#begin_combining_1(1)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh�p %d L�c S�c Th�nh H�a+%d Ng� Th�i Th�n Th�ch/#begin_combining_1(2)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh�p %d Ho�ng S�c Th�nh H�a+%d Ng� Th�i Th�n Th�ch/#begin_combining_1(3)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh�p %d Lam S�c Th�nh H�a+%d Ng� Th�i Th�n Th�ch/#begin_combining_1(4)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh�p %d H�c S�c Th�nh H�a+%d Ng� Th�i Th�n Th�ch/#begin_combining_1(5)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		"\n tr� v� t�ng tr��c/combining_flame_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name.."5 Th�nh H�a Th�ch ��n s�c b�t k� + 1 Ng� S�c Th�n Th�ch (Mua trong Ng� C�c) = 1 Ng� S�c Th�nh H�a Th�ch",getn(tbSay),tbSay);
end

function combining_2_201207()
	local tbSay = {
		format("Gh�p %d H�ng S�c Th�nh H�a+%d V�ng/#begin_combining_2(1)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh�p %d L�c S�c Th�nh H�a+%d V�ng/#begin_combining_2(2)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh�p %d Ho�ng S�c Th�nh H�a+%d V�ng/#begin_combining_2(3)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh�p %d Lam S�c Th�nh H�a+%d V�ng /#begin_combining_2(4)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh�p %d H�c S�c Th�nh H�a+%d V�ng/#begin_combining_2(5)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		"\n tr� v� t�ng tr��c/combining_flame_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name.."9 Th�nh H�a Th�ch ��n s�c b�t k� + 30 v�ng = 1 Ng� S�c Th�nh H�a Th�ch",getn(tbSay),tbSay);
end

function guess_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbBody = "T�i h� ra 1 ch� s� (t� 1-100) �� c�c h� �o�n 5 l�n, s� l�n �o�n tr�ng c�ng �t th� ph�n th��ng c�ng l�n. S� l�n tham gia tr� ch�i m�i ng�y l� t�y �, nh�ng ch� ���c nh�n th��ng 3 l�n.";
	local tbSay = {
		"H�y b�t ��u �i /oly_begin_guess",
		"Nh�n ph�n th��ng l�n tr��c/oly_get_last_guess_award",
		"\n r�t lui/nothing",
	}
	Say(Activity_Ds_Name..tbBody,getn(tbSay),tbSay);
end

function lucky_star_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."S� l�n th�p s�ng ��t 6 l�n/ng�y, s� c� th� tham gia ho�t ��ng R�t Th�m May M�n:\n   C�ch th�c: Nh�p 1 con s� trong kho�ng 1-9999;\n   Quy tr�nh nh�n th��ng: 21:00 h�ng ng�y m� th��ng, t� 21:00-21:30 ng��i ch�i tr�ng th��ng ph�i ��n ch� c�a ta �� ��ng k� tr�ng th��ng, 10 ng��i ch�i ��u ti�n ��ng k� c� th� chia ��u ph�n th��ng. Sau 21:30 c� th� nh�n th��ng, ��n 22:00 th� k�t th�c nh�n th��ng, qu� gi� s� kh�ng th� nh�n.\n   Ph�n th��ng: M�i ng�y 50 Thi�n Ki�u L�nh, trong ng�y kh�ng ai tr�ng th��ng (nh�n th��ng), th� ph�n th��ng s� t�ch l�y cho ��n khi c� ng��i tr�ng th��ng ho�c ho�t ��ng k�t th�c.\n   Ch� �: Con s� may m�n ch� c� hi�u l�c trong ng�y.";
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function lucky_call_boss()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."Sau khi s� l�n th�p s�ng trong ng�y c�a server ��t 5000 l�n, v�o l�c 20:00 � T�y Th�nh �� s� xu�t hi�n Ph� Th�y B�ng Gi�, sau khi ti�u di�t s� r�i ra nhi�u ph�n th��ng. D�ng Th�nh H�a Th�ch th��ng �� th�p s�ng, s� l�n th�p s�ng +1, n�u d�ng Ng� S�c Th�nh H�a Th�ch �� th�p s�ng, s� l�n th�p s�ng +3.";
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function oly_lucky_star_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	CheckAndDoRegularClear(EM_REGULAR_CLEAR_TYPE_DAILY);
	local tbBody = "S� l�n th�p s�ng ��t 6 l�n/ng�y, s� c� th� tham gia ho�t ��ng R�t Th�m May M�n.\n    Ph�n th��ng t�ch l�y hi�n t�i l�: <color=green>%d Thi�n Ki�u L�nh<color>;\n    Con s� may m�n h�m nay l�: <color=green>%s<color>;\n    Con s� may m�n c�a b�n l�: <color=green>%d<color>;\n    Ph�n th��ng: M�i ng�y 50 Thi�n Ki�u L�nh, trong ng�y kh�ng ai tr�ng th��ng (nh�n th��ng), th� ph�n th��ng s� t�ch l�y cho ��n khi c� ng��i tr�ng th��ng ho�c ho�t ��ng k�t th�c.";
	local tbSay = oly_CreateDlgTable();
	local nTglNum,strNum,nMyluckNum = oly_GetBaseInfo();	
	tinsert(tbSay,"Tho�t/nothing");
	Say(Activity_Ds_Name..format(tbBody,nTglNum,strNum,nMyluckNum),getn(tbSay),tbSay);
end

function input_luck_num_201207()
	if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
		AskClientForNumber("input_luck_num_cb_201207",1,OLY_MAX_LUCK_NUM,"Nh�p ch� s� may m�n c�a c�c h�");
	end
end

function input_luck_num_cb_201207(nNum)
	local nDayTime = oly_GetDayCurrTime(); --����ʱ��
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,nNum,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("Ch� s� may m�n c�a c�c h� l� %d",nNum));
	else
		Msg2Player("B�y gi� kh�ng th� nh�p ch� s� may m�n , h�y quay l�i v�o ng�y mai.");
	end
end

function goto_caji_map_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		"��ng �/sure_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name.."��ng � ��n b�n �� thu th�p �� t�m L�c S�c Th�nh H�a Th�ch?",getn(tbSay),tbSay);
end

function sure_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(328,1628,3981);
	SetFightState(1);
end

function goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		"��ng �/sure_goto_tianshimijing",
		"Ra kh�i/nothing",
	}
	Say(Activity_Ds_Name.."��ng � ��n b�n �� thu th�p �� t�m L�c S�c Th�nh H�a Th�ch?",getn(tbSay),tbSay);
end

function sure_goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(329, 1734, 3428);
	SetFightState(1);
end

--�Ǽ�
function register_mylucknum_201207()
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister");
end

--�콱
function get_lucknum_award_201207()
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 0 then
		Talk(1,"","C�c h� ch�a ��ng k� kh�ng th� nh�n ph�n th��ng");
	end
	--�콱
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckPersonNum");
end

function ExchangeItem()
	nItem = GetItemCount(2,1,30402)
	
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",Activity_Ds_Name.."Tr�ng th�i hi�n t�i kh�ng th� ��i v�t ph�m!")
		return
	end	
	
	if gf_Judge_Room_Weight(2, 200) == 0 then
		Talk(1,"", Activity_Ds_Name.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 
	end

	if nItem < 1 then
		Talk(1,"",Activity_Ds_Name.."C�c h� kh�ng c� Ng� Th�i Th�nh H�a trong ng��i!")
		return
	end
	
	if DelItem(2,1,30402,nItem) == 1 then
		gf_AddItemEx2({2,1,30753,nItem}, "Ng� Th�i Th�nh H�a", "��i Item Ng� Th�i Th�nh H�a", "nh�n")
		Talk(1,"",Activity_Ds_Name.."C�c h� �� ��i th�nh c�ng <color=yellow>"..nItem.."<color> Ng� Th�i Th�nh H�a sang Ng� S�c Th�nh H�a th�ch")
	end
end