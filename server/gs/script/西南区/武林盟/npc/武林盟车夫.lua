

Include("\\script\\lib\\transport_head.lua")

function main()

	local szTransportPrice = ""

	if GetLevel() >= 15 and GetLevel() < 73 then
		szTransportPrice = tTransportPrice[6][1]
	elseif GetLevel() >= 73 and GetLevel() < 80 then
		szTransportPrice = tTransportPrice[7][1]
	elseif GetLevel() >= 80 and GetLevel() < 90 then
		szTransportPrice = tTransportPrice[8][1]
	elseif GetLevel() >= 90 then
		szTransportPrice = tTransportPrice[9][1]
	end

	if GetLevel() < 15 then
		Say("Ta s� ��a �i mi�n ph� cho t�n th� d��i <color=yellow>c�p 15<color>, xin h�i kh�ch quan mu�n �i ��u?",
		3,
		"Th�nh ��/chengdu",
		"Tuy�n Ch�u/quanzhou",
		"Kh�ng �i ��u c�/no")
	else
		Say("L� ph� ch� c� <color=yellow>"..szTransportPrice.." l��ng<color> th�i, ng��i mu�n �i ��u?",
		8,
		"V� Trung Nguy�n - Bi�n Kinh ("..szTransportPrice.." l��ng b�c)/bianjing",
		"Ng�c Dung phong/yurongfeng",
		"S��ng Phong nhai/shuangfengya",
		"Ng�ng Nguy�t cung/ningyuegong",
		"Ma Huy�n cung/dixuangong",
		"V�n ��c tr�i/wanduzhai",
		"Thi�n �m th�nh ��a/tianyinshengdi",
		"Kh�ng �i ��u c�/no")
	return
	end	
end

function moneygo()

	local nTransportPrice = 0
	if GetLevel() >= 15 and GetLevel() < 73 then
		nTransportPrice = tTransportPrice[6][2]
	elseif GetLevel() >= 73 and GetLevel() < 80 then
		nTransportPrice = tTransportPrice[7][2]
	elseif GetLevel() >= 80 and GetLevel() < 90 then
		nTransportPrice = tTransportPrice[8][2]
	elseif GetLevel() >= 90 then
		nTransportPrice = tTransportPrice[9][2]
	end
	
	if GetLevel() <15 then 
		return 1
	elseif GetCash() >=nTransportPrice then
		PrePay(nTransportPrice)
		return 1
	else
		return 0
	end
end;

function tianyinshengdi()
	CleanInteractive();	--�����һ������� added by congdantoancau 2020-07-29
	NewWorld(6400, 1649 ,3232)
	SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by congdantoancau 2020-07-29
end;

function dixuangong()
	CleanInteractive();	--�����һ������� added by congdantoancau 2020-07-29
	NewWorld(427, 1683 ,3220)
	SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by congdantoancau 2020-07-29
end;

function wanduzhai()
	CleanInteractive();	--�����һ������� added by congdantoancau 2020-07-29
	NewWorld(422, 1649 ,3232)
	SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by congdantoancau 2020-07-29
end;

function ningyuegong()
	CleanInteractive();	--�����һ������� added by congdantoancau 2020-07-29
	NewWorld(428, 1400 ,2700)
	SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by congdantoancau 2020-07-29
end;

function shuangfengya()
	CleanInteractive();	--�����һ������� added by congdantoancau 2020-07-29
	NewWorld(429, 1600 ,3078)
	SetFightState(1); --����������ս��״̬Ϊ��ƽģʽ added by congdantoancau 2020-07-29
end;

function yurongfeng()

	CleanInteractive();	--�����һ������� added by congdantoancau 2020-07-29
	NewWorld(426, 1549 ,3132)
	SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by congdantoancau 2020-07-29
end;

function bianjing()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti�n th� h�y ng�i xe!")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(200, 1501 ,2978)
		elseif i==2 then
			NewWorld(200, 1267,2970)
		else  
			NewWorld(200, 1249 ,2732)
		end
		SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by vivi 2008-06-03
	end
end

function chengdu()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti�n th� h�y ng�i xe!")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
		i=random(1,3)
--		if i==1 then
--			NewWorld(300, 1896 ,3655)
		if i==2 then
			NewWorld(300, 1677 ,3671)
		elseif i==3 then
			NewWorld(300, 1681 ,3464)
		else 
			NewWorld(300, 1911 ,3442)
		end
		SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by vivi 2008-06-03
	end
end




function quanzhou()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti�n th� h�y ng�i xe!")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
		i=random(1,3)
		if i==1 then
			NewWorld(100, 1521 ,2870)
		elseif i==2 then
			NewWorld(100, 1386 ,2905)
		else 
			NewWorld(100, 1555 ,3080)
		end
		SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by vivi 2008-06-03
	end
end


function xiangyang()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti�n th� h�y ng�i xe!")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(350, 1518 ,3050)
		elseif i==2 then
			NewWorld(350, 1362 ,3053)
		elseif i==3 then
			NewWorld(350, 1332 ,2865)
		else 
			NewWorld(350, 1542 ,2865)
		end
		SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by vivi 2008-06-03
	end
end

function yangzhou()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti�n th� h�y ng�i xe!")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(150, 1724 ,3075)
		elseif i==2 then
			NewWorld(150, 1630 ,3050)
		elseif i==3 then
			NewWorld(150, 1615 ,3175)			
		else 
			NewWorld(150, 1757 ,3179)
		end
		SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by vivi 2008-06-03
	end
end


function fengxiang()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti�n th� h�y ng�i xe!")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(500, 1846 ,3043)
		elseif i==2 then
			NewWorld(500, 1800 ,3229)
		elseif i==3 then
			NewWorld(500, 1659 ,3090)
		else
			NewWorld(500, 1664 ,3226)
		end
		SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by vivi 2008-06-03
	end
end;

function dali()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti�n th� h�y ng�i xe!")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
		i=random(1,3)
		if i==1 then
			NewWorld(400, 1567 ,3117)
		elseif i==2 then
			NewWorld(400, 1434 ,3109)
		else
			NewWorld(400, 1579 ,2883)
		end
		SetFightState(0); --����������ս��״̬Ϊ��ƽģʽ added by vivi 2008-06-03
	end
end;

function no()
end;


