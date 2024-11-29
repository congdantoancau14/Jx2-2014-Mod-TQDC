Include("\\script\\global\\����������.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

Include("\\script\\task\\faction\\faction_main_tm.lua"); -- ����ʦ������Ľű�ͷ�ļ�
--�����б�
SKILLS={
--����
--���Ű��� (����id=58)
[1872]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--���������� (����id=59)
[1873]={
     levelless={3,1,0,60,1},
     [1]={1,14,3000,50},
     [2]={2,16,500,50},
     [3]={9,30,0,50},
     	},
[1874]={
     levelless={3,1,0,60,1},
     [1]={1,14,3000,50},
     [2]={2,16,500,50},
     [3]={9,30,0,50},
     	},
--���� (����id=60)
[1875]={
     levelless={3,1,0,58,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
       },
--׷�ļ� (����id=65)
[1876]={
     levelless={3,1,0,59,3},
     [1]={1,25,15000,200},
     [2]={2,28,5000,200},
     [3]={6,40,0,200},
     },
--������� (����id=66)
[1877]={
     levelless={3,1,0,63,2},
     [1]={1,27,18000,300},
     [2]={2,30,6000,300},
     [3]={6,42,0,300},
     },
--���Ĵ� (����id=67)
[1878]={
     levelless={3,1,0,64,2},
     [1]={1,30,27000,500},
     [2]={2,33,9000,500},
     [3]={7,48,0,500},
     },
--�㶾���� (����id=68)
[1879]={
     levelless={3,1,0,62,4},
     [1]={1,34,45000,500},
     [2]={2,38,15000,500},
     [3]={5,50,0,500},
     },
--�����滨�� (����id=70)
[1880]={
     levelless={3,1,0,65,4},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={7,58,0,700},
     },
--��ɳ��Ӱ (����id=71)
[1881]={
     levelless={3,1,0,68,2},
     [1]={1,45,160000,800},
     [2]={2,48,50000,800},
     [3]={6,60,0,800},
     },
--������ (����id=72)
[1882]={
     levelless={3,2,0,67,5,69,3},
     [1]={1,50,280000,1000},
     [2]={2,53,90000,1000},
     [3]={7,68,0,1000},
     },
--���컨�� (����id=73)
[1883]={
     levelless={3,1,0,70,4},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--������ (����id=74)
[74]={
     levelless={5,3,1,73,7,71,6,72,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function showlimit(n)	--ʦ��˵��
--	if n==1 then
--		Say("<color=green>����Х<color>������书�����ˣ�",0)
	if n==2 then
		Say("Ng��i ch�a �� ��ng c�p �� h�c v� c�ng m�i, h�y r�n luy�n th�m r�i h�y quay l�i?",0)
	elseif n==3 then
		Say("Ng��i ch�a �� kinh nghi�m �� h�c v� c�ng m�i, h�y r�n luy�n th�m h�y quay l�i?",0)
	elseif n==4 then
		Say("Ng��i ch�a �� �i�m danh v�ng �� h�c v� c�ng m�i, h�y l�m v�i nhi�m v� �� t�ch l�y �i�m danh v�ng!",0)
	elseif n==5 then
		Say("V� c�ng vi s� d�y ng��i ch�a luy�n th�nh kh�ng th� h�c v� c�ng m�i!",0)
	elseif n==6 then
		Say("Ng��i kh�ng mang theo ti�n, c� ph�i �� qu�n � r��ng ch�a ��?",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu� 5 gi� ch�i, kh�ng th� h�c v� c�ng n�a, h�y ngh� ng�i �� gi� g�n s�c kh�e!")
	 	return
	 end
	local nTaskValue = FN_GetTaskState(FN_TM)
	if (nTaskValue==1) then
		task_003();
		return
	elseif (nTaskValue<8) then
		Say("T�ng qu�n Y d��c ph�ng ���ng Xu�n �ang ch� m�t lo�i thu�c m�i. H�y ��n �� xem th�.",0);
		return
	else
		Say("�� v�o h� ph�i ta th� ��ng c�u n� l� c� nh� ���ng, c� t�y � h�nh t�u giang h�. <color=yellow>Ch�y th�<color> l� v� kh� s� tr��ng c�a ph�i ta. Ta c� th� gi�p g�?",
			4,
			"�� t� b�i ki�n s� ph�!/entertangmen",
			"H�c v� c�ng ���ng M�n/skilllearn",
			-- "Ta nh�n ���c m�t quy�n M�t t�ch tr�n ph�i/change_mistery_book",
			"Kh�ng c� g�/no");
	end
	-- if GetPlayerFaction() == 5 and GetPlayerRoute() == 5 then
		-- get_in_route(5, 31);
		-- return 0;
	-- end
	-- master_main(5,31);
end;

-- �һ������ؼ��Ĺ��� =============================================end====


function tangmenskill()		--�쿴����
--������
end;

function tedian()		--�쿴����
Say("�� v�o h� ph�i ta th� ��ng c�u n� l� c� nh� ���ng, c� t�y � h�nh t�u giang h�. <color=yellow>Ch�y th�<color> l� v� kh� s� tr��ng c�a ph�i ta.",0)
end;


function entertangmen()		--��������
	if GetPlayerFaction() ~= 5 then	--���ɼ��
		Say("Ng��i ph�i ���c L�o l�o ��ng � m�i c� th� gia nh�p ���ng M�n, sau �� m�i c� th� ��n t�m ta b�i s� h�c ngh�.",0)
	elseif   GetPlayerRoute() == 5 then	--δ�����ɵı��ŵ��� 
		-- if join_route_main(31) == 0 then
			-- return
		-- end
		Say("L�o l�o �� ��ng �! Gi� ta ch�nh th�c thu nh�n ng��i l�m �� t� v� gi�p ng��i �� th�ng kinh m�ch, <color=yellow>t�y l�i ti�m n�ng<color>. V� c�ng h� ph�i xem tr�ng <color=yellow>s�c m�nh<color>, sau n�y ng��i h�y c� g�ng. Gi� ng��i c� th� ��n t�m L�o l�o nh�n <color=yellow>Nhi�m v� m�n ph�i<color>.",0)
		SetPlayerRoute(31)	--ֱ����������
		LearnSkill(1872)
		LearnSkill(1873)
		AddItem(0,14,1,1,1,4,65,4,66)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr� th�nh �� t� ���ng M�n!")
		TaskTip("B�n �� ���c t�y l�i �i�m ti�m n�ng!")
		TaskTip("B�n �� nh�p m�n! C� th� ��n g�p Ch��ng m�n nh�n nhi�m v�")
	else
	 	Say("H�y c� g�ng luy�n t�p, mai sau ph�t d��ng quang ��i b�n m�n.",0)

	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 31 then	--���ɼ��
		Say("Ng��i kh�ng ph�i �� t� c�a ta! Ta kh�ng th� d�y ng��i.",0)
	else
		Say("G�c ph�i ph�a d��i bi�u t��ng v� c�ng xu�t hi�n d�u {v} bi�u th� c� th� h�c v� c�ng n�y, d�u m�i t�n bi�u th� c� th� t�ng c�p, nh�p tr�c ti�p v�o �� t�ng c�p.",0)
		AllowLearnSkill()
	end
end;


function miying()
learnskill(1872)
end;

function shayi()
learnskill(1875)
end;

function linglung()
learnskill(1873)
end;

function lingxi()
learnskill(1874)
end;

function biluo()
learnskill(1876)
end;

function jinghong()
learnskill(1877)
end;

function qifeng()
learnskill(1878)
end;

function hundun()
learnskill(1879)
end;

function suimeng()
learnskill(1880)
end;

function liuxing()
learnskill(1881)
end;

function yanwu()
learnskill(1882)
end;

function tianying()
learnskill(1883)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Kh�ng ng� th�ng qua vi�c luy�n th�c ng��i c� th� nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l� �� �� c�a b�n m�n. Nh�ng tr�n ph�i v� h�c n�y ta c�ng ph�i l�nh ng� m�t th�i gian m�i c� th� truy�n th� ���c, ng��i quay l�i sau nh�!",0)
end;

function beforelearnskill(id)
	if (id == 74) then	--������
		if (GetSkillLevel("H�p Tinh Tr�n") <= 0) then
			return "\'H�p Tinh Tr�n\' l� <color=red>Tuy�t h�c tr�n ph�i<color>, kh�ng ph�i �� t� b�n m�n th� kh�ng th� n�m ���c."
		end
	end
end

function afterlearnskill(id)
	if (id == 74) then	--������
		if (GetSkillLevel("H�p Tinh Tr�n") == 1) then
			Say("Thi�u hi�p qu� nhi�n t� ch�t th�m s�u, �� b��c ��u l�nh ng� ���c \'H�p Tinh Tr�n\', th�t ��ng n�! <enter><color=green>Ng��i ch�i<color>: Nh�ng...s� ph�, t�i sao khi con th� thi tri�n \'H�p Tinh Tr�n\', n�i kh� ph�n t�n, kh� m� thi tri�n? Nghe n�i L�c M�ch Th�n Ki�m � �o�n Th�, �� ao ��c t� l�u, h�m nay m�i th� ���c. <enter>\'H�p Tinh Tr�n\' r�t l�i h�i, cho d� c� may m�n h�c ���c, mu�n s� d�ng th�nh th�o, �� kh�ng ph�i l� chuy�n d�.", 1, "��ng �/GiveMomentum")
		elseif (GetSkillLevel("H�p Tinh Tr�n") == 5) then
			Say("Thi�u hi�p qu� nhi�n t� ch�t th�ng minh, \'H�p Tinh Tr�n\' �� l�nh h�i ���c 5 ph�n. C�n xa m�i ��t ��n c�nh gi�i cao nh�t. Lo�i v� c�ng n�y g�m 20 c�p, 5 c�p sau c�n thi�u hi�p kh� luy�n h�n n�a, 10 c�p cu�i c�n c� m�t t�ch tr�n ph�i m�i l�nh h�i ���c.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th�i ���c, �� ta gi�p ng��i thi tri�n \'H�p Tinh Tr�n\'. <enter><enter>R�t l�u....<enter><enter>���c r�i, s�t kh� �� h�nh th�nh, c� th� th� thi tri�n \'H�p Tinh Tr�n\'. Tuy�t h�c tr�n ph�i r�t m�nh, d�ng �� tr� gian di�t b�o, thay tr�i h�nh ��o, kh�ng h�i ng��i v� t�i...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh� s� ph� truy�n cho", "momentumtip")
end

