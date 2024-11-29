
function showKX()
	local tSay = {
		g_szTitle.."L�a ch�n",
		"Nh�n Th�n Nguy�t l�nh (KX6)/Get_KimXa",
		"Trang b� Kim x� 4 (ng�u nhi�n)/showKX4",
		"Trang b� Kim x� 5 (ng�u nhi�n)/showKX5",
		"Trang b� Kim x� 6 (ng�u nhi�n)/showKX6",
		"Trang b� Kim x� 7 (ng�u nhi�n)/showKX7",
		"Trang b� Kim x� 3 v� d��ng/getKX3",
		"Trang b� Kim x� 4 v� d��ng/getKX4",
		"Trang b� Kim x� theo h� ph�i/Get_JinShe",
		"Trang b� Kim x� thu�c t�nh/getKXNormalAttr",
		-- "Trang b� Kim x� thu�c t�nh ��c bi�t/getKXSpecialAttr",
	}
	tinsert(tSay,"Ra kh�i/nothing");
	SelectSay(tSay);	
end;

tbAttributes = { -- id	name	line

	{147,"Ph�t tri�n nh�m �i�n v�o B",0},
	{148,"Hao m�n v� kh� gi�m 1% ",1},
	{149,"S�c l�c+1",1},
	{150,"T�ng gi�i h�n tr�ng l��ng1%",1},
	{151,"Th� l�c",1},
	{152,"Th� l�c 1%",1},
	{153,"�i�m kinh nghi�m nh�n ���c t�ng 1% ",1},
	{154,"T�a thi�n m�i 10 gi�y h�i ph�c sinh l�c1",1},
	{155,"T�a thi�n m�i 10 gi�y h�i ph�c n�i l�c1",1},
	{156,"T�a thi�n m�i 10 gi�y h�i ph�c th� l�c1",1},
	{157,"Hi�u qu� d��c ph�m h�i n�i1%",1},
	{158,"y�u c�u ��ng c�p gi�m 1",1},
	{159,"Ti�u di�t ��ch nh�n kh�i ph�c sinh l�c",1},
	{160,"Ti�u di�t ��ch nh�n kh�i ph�c n�i l�c",1},
	{161,"Ph�t tri�n thu�c t�nh ch�nh B",0},
	{162,"S�c m�nh",2},
	{163,"Th�n ph�p",2},
	{164,"N�i c�ng ",2},
	{165,"Linh ho�t",2},
	{166,"G�n c�t",2},
	{167,"N�i l�c ",2},
	{168,"N�i l�c %",2},
	{169,"�i�m sinh l�c",2},
	{170,"Sinh m�nh %",2},
	{171,"Ph�t tri�n nh�m c�ng k�ch B",0},
	{172,"Ng�ai c�ng l�n nh�t tr�n v� kh� t�ng 1",3},
	{173,"Ngo�i c�ng nh� nh�t tr�n v� kh� t�ng 1",3},
	{174,"N�i c�ng l�n nh�t tr�n v� kh� t�ng 1",3},
	{175,"N�i c�ng nh� nh�t tr�n v� kh� t�ng 1",3},
	{176,"T�ng �i�m s� t�ng l�c c�ng k�ch ngo�i c�ng",3},
	{177,"T�ng �i�m s� t�ng l�c c�ng k�ch n�i c�ng",3},
	{178,"S�t th��ng t�ng 1",3},
	{179,"S�t th��ng ��c",3},
	{180,"��c s�t t�ng 1",3},
	{181,"Ngo�i c�ng t�ng 1% ",3},
	{182,"N�i c�ng t�ng 1% ",3},
	{183,"S�c m�nh B",3},
	{184,"Th�n ph�p B",3},
	{185,"N�i l�c B",3},
	{186,"Linh ho�t B",3},
	{187,"G�n c�t B",3},
	{188,"Sinh m�nh % B",3},
	{395,"Nh�m m� kh�a B",0},
	{396,"Hao m�n v� kh� gi�m 1% ",4},
	{397,"S�c l�c+1",4},
	{398,"T�ng gi�i h�n tr�ng l��ng1%",4},
	{399,"Th� l�c",4},
	{400,"Th� l�c 1%",4},
	{401,"�i�m kinh nghi�m nh�n ���c t�ng 1% ",4},
	{402,"T�a thi�n m�i 10 gi�y h�i ph�c sinh l�c1",4},
	{403,"T�a thi�n m�i 10 gi�y h�i ph�c n�i l�c1",4},
	{404,"T�a thi�n m�i 10 gi�y h�i ph�c th� l�c1",4},
	{405,"Hi�u qu� d��c ph�m h�i n�i1%",4},
	{406,"y�u c�u ��ng c�p gi�m 1",4},
	{407,"N�i c�ng nh� nh�t tr�n v� kh� t�ng 1",4},
	{408,"N�i c�ng l�n nh�t tr�n v� kh� t�ng 1",4},
	{409,"Ngo�i c�ng nh� nh�t tr�n v� kh� t�ng 1",4},
	{410,"Ng�ai c�ng l�n nh�t tr�n v� kh� t�ng 1",4},
	{411,"T�ng �i�m s� n�i c�ng",4},
	{412,"T�ng �i�m s� ngo�i c�ng",4},
	{413,"S�t th��ng t�ng 1",4},
	{414,"T�ng s�t th��ng ��c",4},
	{415,"��c s�t t�ng 1",4},
	{416,"S�c m�nh",4},
	{417,"Th�n ph�p",4},
	{418,"N�i c�ng ",4},
	{419,"Linh ho�t",4},
	{420,"G�n c�t",4},
	{421,"�i�m s� tri�t ti�u s�t th��ng ngo�i c�ng",4},
	{422,"�i�m s� tri�t ti�u s�t th��ng n�i c�ng",4},
	{423,"Gi�m ��c s�t 1",4},
	{424,"Th�i gian h� tr� t�n c�ng t�ng 1% ",4},
	{425,"Th�i gian h� tr� ph�ng th� t�ng 1% ",4},
	{426,"D��c hi�u k�o d�i",4},
	{427,"Ti�u di�t ��ch nh�n kh�i ph�c sinh l�c",4},
	{428,"Ti�u di�t ��ch nh�n kh�i ph�c n�i l�c",4},
	{429,"Ngo�i c�ng t�ng 1% ",4},
	{430,"N�i c�ng t�ng 1% ",4},
	{431,"T� l� s�t th��ng tuy�t ��i 1%",4},
	{432,"N�i l�c ",4},
	{433,"N�i l�c %",4},
	{434,"�i�m sinh l�c",4},
	{435,"�i�m s� ph�n ��n s�t th��ng ngo�i c�ng",4},
	{436,"�i�m s� ph�n ��n s�t th��ng n�i c�ng",4},
	{437,"Sinh m�nh %",4},
	{438,"Ho�n to�n b� qua t� l� ti�u hao k� n�ng1%",4},
	{439,"T�c �� ��nh t�ng 1% ",4},
	{440,"X�c su�t t�n c�ng trong ph�m vi 1% ",4},
	{441,"X�c su�t t�n c�ng ch� m�ng 1% ",4},
	{442,"D�ng k� n�ng kh�ng t�nh t� l� gi�n c�ch1%",4},
	{443,"Ph�n ��n s�t th��ng ��c",4},
	{444,"T� l� ph�n ��n s�t th��ng ngo�i th��ng",4},
	{445,"T� l� ph�n ��n s�t th��ng n�i th��ng",4},
	{446,"M� kh�a + Huy ch��ng ��c tr�ng D-B",0},
	{447,"Nh�m m� kh�a D",0},
	{498,"Nh�m m� kh�a C",0},
	{549,"Nh�m m� kh�a B",0},
	{550,"Hao m�n v� kh� gi�m 1% ",51},
	{551,"S�c l�c+1",51},
	{552,"T�ng gi�i h�n tr�ng l��ng1%",51},
	{553,"Th� l�c",51},
	{554,"Th� l�c 1%",51},
	{555,"�i�m kinh nghi�m nh�n ���c t�ng 1% ",51},
	{556,"T�a thi�n m�i 10 gi�y h�i ph�c sinh l�c1",51},
	{557,"T�a thi�n m�i 10 gi�y h�i ph�c n�i l�c1",51},
	{558,"T�a thi�n m�i 10 gi�y h�i ph�c th� l�c1",51},
	{559,"Hi�u qu� d��c ph�m h�i n�i1%",51},
	{560,"y�u c�u ��ng c�p gi�m 1",51},
	{561,"N�i c�ng nh� nh�t tr�n v� kh� t�ng 1",51},
	{562,"N�i c�ng l�n nh�t tr�n v� kh� t�ng 1",51},
	{563,"Ngo�i c�ng nh� nh�t tr�n v� kh� t�ng 1",51},
	{564,"Ng�ai c�ng l�n nh�t tr�n v� kh� t�ng 1",51},
	{565,"T�ng �i�m s� n�i c�ng",51},
	{566,"T�ng �i�m s� ngo�i c�ng",51},
	{567,"S�t th��ng t�ng 1",51},
	{568,"T�ng s�t th��ng ��c",51},
	{569,"��c s�t t�ng 1",51},
	{570,"S�c m�nh",51},
	{571,"Th�n ph�p",51},
	{572,"N�i c�ng ",51},
	{573,"Linh ho�t",51},
	{574,"G�n c�t",51},
	{575,"�i�m s� tri�t ti�u s�t th��ng ngo�i c�ng",51},
	{576,"�i�m s� tri�t ti�u s�t th��ng n�i c�ng",51},
	{577,"Gi�m ��c s�t 1",51},
	{578,"Th�i gian h� tr� t�n c�ng t�ng 1% ",51},
	{579,"Th�i gian h� tr� ph�ng th� t�ng 1% ",51},
	{580,"D��c hi�u k�o d�i",51},
	{581,"Ti�u di�t ��ch nh�n kh�i ph�c sinh l�c",51},
	{582,"Ti�u di�t ��ch nh�n kh�i ph�c n�i l�c",51},
	{583,"Ngo�i c�ng t�ng 1% ",51},
	{584,"N�i c�ng t�ng 1% ",51},
	{585,"T� l� s�t th��ng tuy�t ��i 1%",51},
	{586,"N�i l�c ",51},
	{587,"N�i l�c %",51},
	{588,"�i�m sinh l�c",51},
	{589,"�i�m s� ph�n ��n s�t th��ng ngo�i c�ng",51},
	{590,"�i�m s� ph�n ��n s�t th��ng n�i c�ng",51},
	{591,"Sinh m�nh %",51},
	{592,"Ho�n to�n b� qua t� l� ti�u hao k� n�ng1%",51},
	{593,"T�c �� ��nh t�ng 1% ",51},
	{594,"X�c su�t t�n c�ng trong ph�m vi 1% ",51},
	{595,"X�c su�t t�n c�ng ch� m�ng 1% ",51},
	{596,"D�ng k� n�ng kh�ng t�nh t� l� gi�n c�ch1%",51},
	{597,"Ph�n ��n s�t th��ng ��c",51},
	{598,"T� l� ph�n ��n s�t th��ng ngo�i th��ng",51},
	{599,"T� l� ph�n ��n s�t th��ng n�i th��ng",51},
	{600,"Nh�m huy ch��ng ��c tr�ng D",0},
	{611,"Nh�m huy ch��ng ��c tr�ng C",0},
	{622,"Nh�m huy ch��ng ��c tr�ng B",0},
	{623,"H�t th� l�c1",61},
	{624,"H�t N�i l�c 1",61},
	{625,"Khi c�ng k�ch c� t� l� 3% khi�n cho ��ch nh�n gi�m t�c2 gi�y",61},
	{626,"Khi c�ng k�ch c� t� l� 3% khi�n cho ��ch nh�n ch�m2 gi�y",61},
	{627,"Khi c�ng k�ch c� t� l� 3% khi�n cho ��ch nh�n ��nh th�n2 gi�y",61},
	{628,"Khi c�ng k�ch c� t� l� 3% khi�n cho ��ch nh�n t� li�t2 gi�y",61},
	{629,"Khi c�ng k�ch c� t� l� 3% khi�n cho ��ch nh�n ng�2 gi�y",61},
	{630,"H�t Sinh l�c 1",61},
	{631,"Khi c�ng k�ch c� t� l� 3% khi�n cho ��ch nh�n cho�ng2 gi�y",61},
	{632,"Khi c�ng k�ch c� t� l� 3% khi�n cho ��ch nh�n lo�n2 gi�y",61},
	{633,"M� kh�a + nh�m �o cho�ng ��c s�c D-B",0},
	{634,"Nh�m m� kh�a D",0},
	{685,"Nh�m m� kh�a C",0},
	{736,"Nh�m m� kh�a B",0},
	{737,"Hao m�n v� kh� gi�m 1% ",52},
	{738,"S�c l�c+1",52},
	{739,"T�ng gi�i h�n tr�ng l��ng1%",52},
	{740,"Th� l�c",52},
	{741,"Th� l�c 1%",52},
	{742,"�i�m kinh nghi�m nh�n ���c t�ng 1% ",52},
	{743,"T�a thi�n m�i 10 gi�y h�i ph�c sinh l�c1",52},
	{744,"T�a thi�n m�i 10 gi�y h�i ph�c n�i l�c1",52},
	{745,"T�a thi�n m�i 10 gi�y h�i ph�c th� l�c1",52},
	{746,"Hi�u qu� d��c ph�m h�i n�i1%",52},
	{747,"y�u c�u ��ng c�p gi�m 1",52},
	{748,"N�i c�ng nh� nh�t tr�n v� kh� t�ng 1",52},
	{749,"N�i c�ng l�n nh�t tr�n v� kh� t�ng 1",52},
	{750,"Ngo�i c�ng nh� nh�t tr�n v� kh� t�ng 1",52},
	{751,"Ng�ai c�ng l�n nh�t tr�n v� kh� t�ng 1",52},
	{752,"T�ng �i�m s� n�i c�ng",52},
	{753,"T�ng �i�m s� ngo�i c�ng",52},
	{754,"S�t th��ng t�ng 1",52},
	{755,"T�ng s�t th��ng ��c",52},
	{756,"��c s�t t�ng 1",52},
	{757,"S�c m�nh",52},
	{758,"Th�n ph�p",52},
	{759,"N�i c�ng ",52},
	{760,"Linh ho�t",52},
	{761,"G�n c�t",52},
	{762,"�i�m s� tri�t ti�u s�t th��ng ngo�i c�ng",52},
	{763,"�i�m s� tri�t ti�u s�t th��ng n�i c�ng",52},
	{764,"Gi�m ��c s�t 1",52},
	{765,"Th�i gian h� tr� t�n c�ng t�ng 1% ",52},
	{766,"Th�i gian h� tr� ph�ng th� t�ng 1% ",52},
	{767,"D��c hi�u k�o d�i",52},
	{768,"Ti�u di�t ��ch nh�n kh�i ph�c sinh l�c",52},
	{769,"Ti�u di�t ��ch nh�n kh�i ph�c n�i l�c",52},
	{770,"Ngo�i c�ng t�ng 1% ",52},
	{771,"N�i c�ng t�ng 1% ",52},
	{772,"T� l� s�t th��ng tuy�t ��i 1%",52},
	{773,"N�i l�c ",52},
	{774,"N�i l�c %",52},
	{775,"�i�m sinh l�c",52},
	{776,"�i�m s� ph�n ��n s�t th��ng ngo�i c�ng",52},
	{777,"�i�m s� ph�n ��n s�t th��ng n�i c�ng",52},
	{778,"Sinh m�nh %",52},
	{779,"Ho�n to�n b� qua t� l� ti�u hao k� n�ng1%",52},
	{780,"T�c �� ��nh t�ng 1% ",52},
	{781,"X�c su�t t�n c�ng trong ph�m vi 1% ",52},
	{782,"X�c su�t t�n c�ng ch� m�ng 1% ",52},
	{783,"D�ng k� n�ng kh�ng t�nh t� l� gi�n c�ch1%",52},
	{784,"Ph�n ��n s�t th��ng ��c",52},
	{785,"T� l� ph�n ��n s�t th��ng ngo�i th��ng",52},
	{786,"T� l� ph�n ��n s�t th��ng n�i th��ng",52},
	{787,"Nh�m �o Cho�ng ��c s�c D",0},
	{800,"Nh�m �o Cho�ng ��c s�c C",0},
	{813,"Nh�m �o Cho�ng ��c s�c B",0},
	{814,"Kh�ng ��c1%",62},
	{815,"X�c su�t ch�ng ch�m1%",62},
	{816,"X�c su�t ch�ng l�m ch�m1%",62},
	{817,"Ph� ph�ng th� c�a ��i ph��ng1%",62},
	{818,"X�c su�t ch�ng t� li�t1%",62},
	{819,"X�c su�t ch�ng ��nh th�n1%",62},
	{820,"X�c su�t ch�ng ng� m�1%",62},
	{821,"X�c su�t ch�ng ��nh l�i1%",62},
	{822,"X�c su�t ch�ng ��nh ng�1%",62},
	{823,"X�c su�t ch�ng cho�ng1%",62},
	{824,"X�c su�t ch�ng h�n lo�n1%",62},
	{825,"Tr�nh m�i tr�ng th�i ph�1%",62},
	{826,"M� kh�a + nh�m gi�y ��c tr�ng D-B",0},
	{827,"Nh�m m� kh�a D",0},
	{878,"Nh�m m� kh�a C",0},
	{929,"Nh�m m� kh�a B",0},
	{930,"Hao m�n v� kh� gi�m 1% ",53},
	{931,"S�c l�c+1",53},
	{932,"T�ng gi�i h�n tr�ng l��ng1%",53},
	{933,"Th� l�c",53},
	{934,"Th� l�c 1%",53},
	{935,"�i�m kinh nghi�m nh�n ���c t�ng 1% ",53},
	{936,"T�a thi�n m�i 10 gi�y h�i ph�c sinh l�c1",53},
	{937,"T�a thi�n m�i 10 gi�y h�i ph�c n�i l�c1",53},
	{938,"T�a thi�n m�i 10 gi�y h�i ph�c th� l�c1",53},
	{939,"Hi�u qu� d��c ph�m h�i n�i1%",53},
	{940,"y�u c�u ��ng c�p gi�m 1",53},
	{941,"N�i c�ng nh� nh�t tr�n v� kh� t�ng 1",53},
	{942,"N�i c�ng l�n nh�t tr�n v� kh� t�ng 1",53},
	{943,"Ngo�i c�ng nh� nh�t tr�n v� kh� t�ng 1",53},
	{944,"Ng�ai c�ng l�n nh�t tr�n v� kh� t�ng 1",53},
	{945,"T�ng �i�m s� n�i c�ng",53},
	{946,"T�ng �i�m s� ngo�i c�ng",53},
	{947,"S�t th��ng t�ng 1",53},
	{948,"T�ng s�t th��ng ��c",53},
	{949,"��c s�t t�ng 1",53},
	{950,"S�c m�nh",53},
	{951,"Th�n ph�p",53},
	{952,"N�i c�ng ",53},
	{953,"Linh ho�t",53},
	{954,"G�n c�t",53},
	{955,"�i�m s� tri�t ti�u s�t th��ng ngo�i c�ng",53},
	{956,"�i�m s� tri�t ti�u s�t th��ng n�i c�ng",53},
	{957,"Gi�m ��c s�t 1",53},
	{958,"Th�i gian h� tr� t�n c�ng t�ng 1% ",53},
	{959,"Th�i gian h� tr� ph�ng th� t�ng 1% ",53},
	{960,"D��c hi�u k�o d�i",53},
	{961,"Ti�u di�t ��ch nh�n kh�i ph�c sinh l�c",53},
	{962,"Ti�u di�t ��ch nh�n kh�i ph�c n�i l�c",53},
	{963,"Ngo�i c�ng t�ng 1% ",53},
	{964,"N�i c�ng t�ng 1% ",53},
	{965,"T� l� s�t th��ng tuy�t ��i 1%",53},
	{966,"N�i l�c ",53},
	{967,"N�i l�c %",53},
	{968,"�i�m sinh l�c",53},
	{969,"�i�m s� ph�n ��n s�t th��ng ngo�i c�ng",53},
	{970,"�i�m s� ph�n ��n s�t th��ng n�i c�ng",53},
	{971,"Sinh m�nh %",53},
	{972,"Ho�n to�n b� qua t� l� ti�u hao k� n�ng1%",53},
	{973,"T�c �� ��nh t�ng 1% ",53},
	{974,"X�c su�t t�n c�ng trong ph�m vi 1% ",53},
	{975,"X�c su�t t�n c�ng ch� m�ng 1% ",53},
	{976,"D�ng k� n�ng kh�ng t�nh t� l� gi�n c�ch1%",53},
	{977,"Ph�n ��n s�t th��ng ��c",53},
	{978,"T� l� ph�n ��n s�t th��ng ngo�i th��ng",53},
	{979,"T� l� ph�n ��n s�t th��ng n�i th��ng",53},
	{980,"Nh�m gi�y ��c tr�ng D",0},
	{991,"Nh�m gi�y ��c tr�ng C",0},
	{1002,"Nh�m gi�y ��c tr�ng B",0},
	{1003,"T�ng t�c �� l�n ng�a",63},
	{1004,"T�c �� di chuy�n ",63},
	{1005,"T�ng t� l� t�c �� thu h�i v� tri�u h�i",63},
	{1006,"R�t ng�n th�i gian t� li�t %",63},
	{1007,"R�t ng�n th�i gian cho�ng %",63},
	{1008,"R�t ng�n th�i gian ��nh th�n %",63},
	{1009,"R�t ng�n th�i gian lo�n %",63},
	{1010,"R�t ng�n th�i gian ng� %",63},
	{1011,"R�t ng�n th�i gian l�m ch�m %",63},
	{1012,"R�t ng�n th�i gian gi�m t�c %",63},

}

function getKXNormalAttr()
	local tbSay = {
		"Huy ch��ng/#showListKXAttr(1)",
		"�o cho�ng/#showListKXAttr(2)",
		"Chi�n h�i/#showListKXAttr(3)",
		"H�y/nothing",
	}
	Say("",getn(tbSay),tbSay)
end;

function showListKXAttr(nPos,nLine)
	if nLine == nil or nLine == 0 then nLine = 1 end
	local tbSay = {}
	-- print(nLine);
	local nLineSend = 0;
	if nLine > 4 then 
		nLineSend = floor(nLine / 10);
	else
		nLineSend = nLine;
	end
	for i=1,getn(tbAttributes) do 
		if tbAttributes[i][3] == nLine then
			tinsert(tbSay,format("Thu�c t�nh %s/#chooseAttr(%d,%d,%d)",tbAttributes[i][2],nPos,nLineSend,tbAttributes[i][1]))
		end
	end
	print("getn(tbSay)",getn(tbSay))
	tinsert(tbSay,"Tho�t/nothing")
	Say(format("Ch�n thu�c t�nh %d",nLine),getn(tbSay),tbSay);
end;

tbChoosenAttr = {}

function chooseAttr(nPos,nLine,nAttr)
	tbChoosenAttr[nLine] = nAttr;
	local nLineSend = 0;
	if nLine < 4 then 
		nLineSend = nLine + 1;
	else
		nLineSend = (nLine+1) * 10 + nPos;
	end
	-- print("nLine,nLineSend",nLine,nLineSend)
	if nLine < 6 then 
		showListKXAttr(nPos,nLineSend)
	else
		addKXAttrFinal(nPos)
	end
end;

function addKXAttrFinal(nPos)
	local tPos = {
		[1] = 153,
		[2] = 152,
		[3] = 154,
	}
	local nResult,nItemIndex	=AddItem(0,tPos[nPos],9,1,1,-1,-1,-1,-1,-1,-1,0,15)
	local t = tbChoosenAttr;
	-- local nIndex5 = 50 + nPos;
	-- local nIndex6 = 60 + nPos;
	SetItemFeedUpAttrs(nItemIndex,t[1],t[2],t[3],t[4],t[5],t[6])
	FeedItem(nItemIndex,1000000)
end;

function addKXAttr(nAttr)
	local nLevel  = 10;
	
	local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
	SetItemFeedUpAttrs(pIndex,nAttr,nAttr,nAttr,nAttr,nAttr,nAttr)
	FeedItem(pIndex,1000000)
	local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
	SetItemFeedUpAttrs(pIndex,nAttr,nAttr,nAttr,nAttr,nAttr,nAttr)
	FeedItem(hIndex,1000000)
	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
	SetItemFeedUpAttrs(pIndex,nAttr,nAttr,nAttr,nAttr,nAttr,nAttr)
	FeedItem(xIndex,1000000)
end;

function getKX3()
	AddItem(2,1,30544,3);
	AddItem(2,1,30599,3);
end;

function getKX4()
	AddItem(2,1,31231,3);
end;

function getRandomKX4(nSet)
	KXDH = {
		[1] = {
			[1056] = "Linh ho�t B",
			[1057] = "Th�n ph�p B",
		},
		[2] = {
			[1069] = "S�c m�nh B",
			[1070] = "G�n c�t B",
			[1071] = "N�i c�ng B",
			[1072] = "Sinh l�c B",
			[1073] = "T� l� sinh l�c B",
		},
		[3] = {
			[1079] = "Linh ho�t B",
			[1080] = "Th�n ph�p B",
		},
		[4] = {
			[1] = {
				[1092] = "Ph�n ��n ngo�i c�ng/1%B",
				[1093] = "Ph�n ��n n�i c�ng/1%B",
				[1094] = "T�ng s�t th��ng/1B",
				[1095] = "K�m theo ��c s�t/1B",
				[1096] = "T�ng s�t th��ng c� ��c/1B",
			},
			[2] = {
				[1108] = "Ph�n ��n ngo�i c�ng/1%B",
				[1109] = "Ph�n ��n n�i c�ng/1%B",
				[1110] = "T�ng s�t th��ng/1B",
				[1111] = "K�m theo ��c s�t/1B",
				[1112] = "T�ng s�t th��ng c� ��c/1B",
			},
			[3] = {
				[1123] = "T�ng t�c �� xu�t chi�u/1%B",
				[1124] = "Kh�ng t�t c� B",
				[1125] = "T�ng ch� m�nh/1%B",
			}
		}
	}
	
	KXTH = {
		[1] = {
			[1129] = "S�c m�nh B",
		},
		[2] = {
			[1143] = "Linh ho�t B",
			[1144] = "Th�n ph�p B",
			[1145] = "G�n c�t B",
			[1146] = "N�i c�ng B",
			[1147] = "Sinh l�c B",
			[1148] = "T� l� sinh l�c B",
		},
		[3] = {
			[1156] = "S�c m�nh B",
			[1157] = "G�n c�t B",
			[1158] = "Sinh l�c %B",
		},
		[4] = {
			[1] = {
				[1168] = "Ph�n ��n ngo�i c�ng/1B",
				[1169] = "Ph�n ��n n�i c�ng/1B",
				[1170] = "T�ng ngo�i c�ng/1%B",
				[1171] = "T�ng c�ng k�ch ngo�i c�ng/1B",
			},
			[2] = {
				[1181] = "Ph�n ��n ngo�i c�ng/1B",
				[1182] = "Ph�n ��n n�i c�ng/1B",
				[1183] = "T�ng ngo�i c�ng/1%B",
				[1184] = "T�ng c�ng k�ch ngo�i c�ng/1B",
			},
			[3] = {
				[1194] = "T�c �� di chuy�n/1%B",
				[1195] = "T�ng t�c �� xu�t chi�u/1%B",
				[1196] = "H�t sinh l�c B",
				[1197] = "Gi�m th� th��ng/1%B",
			}
		}
	}
	
	KXVD = {
		[1] = {
			[1201] = "N�i c�ng B",
		},
		[2] = {
			[1213] = "Linh ho�t B",
			[1214] = "Th�n ph�p B",
			[1215] = "G�n c�t B",
			[1216] = "Sinh l�c B",
			[1217] = "T� l� sinh l�c B",
		},
		[3] = {
			[1225] = "Linh ho�t B",
			[1226] = "Th�n ph�p B",
			[1227] = "N�i c�ng B",
		},
		[4] = {
			[1] = {
				[1237] = "T�ng n�i c�ng/1%B",
				[1238] = "T�ng c�ng k�ch n�i c�ng/1B",
				[1239] = "N�i c�ng l�n nh�t tr�n v� kh� t�ng/1B",
				[1240] = "N�i c�ng nh� nh�t tr�n v� kh� t�ng/1B",
			},
			[2] = {
				[1250] = "T�ng n�i c�ng/1%B",
				[1251] = "T�ng c�ng k�ch n�i c�ng/1B",
				[1252] = "N�i c�ng l�n nh�t tr�n v� kh� t�ng/1B",
				[1253] = "N�i c�ng nh� nh�t tr�n v� kh� t�ng/1B",
			},
			[3] = {
				[1263] = "T�c �� di chuy�n/1%B",
				[1264] = "T�ng t�c �� xu�t chi�u/1%B",
				[1265] = "Gi�m th� th��ng/1%B",
				[1266] = "T�ng ch� m�nh/1%B",
			}
		}
	}
	
	local tSet = {};
	if nSet == 26 then tSet = KXDH
	elseif nSet == 27 then tSet = KXTH
	elseif nSet == 28 then tSet = KXVD end;
	
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("Nh�n kim x� th�nh c�ng!");
	end;
end;

function getRandomKX5(nSet)
	KXHC = {
		[1] = {
			[1955] = "Linh ho�t - V�ng",
			[1956] = "Th�n ph�p - V�ng",
		},
		[2] = {
			[1973] = "N�i c�ng - V�ng",
			[1974] = "S�c m�nh - V�ng",
			[1975] = "C�n c�t - V�ng",
			[1976] = "T�ng �i�m sinh l�c - V�ng",
			[1977] = "T�ng t� l� �i�m sinh l�c - V�ng",
		},
		[3] = {
			[1997] = "B�o k�ch - V�ng",
			[1999] = "T�ng �i�m s� ngo�i c�ng - V�ng",
			[2000] = "T�ng �i�m s� n�i c�ng - V�ng",
			[2001] = "T�ng �i�m s� n�i ngo�i - V�ng",
			[2002] = "To�n thu�c t�nh - V�ng",
		},
		[4] = {
			[2022] = "Ph�ng b�c - V�ng",
			[2023] = "Gi�m b�c - V�ng",
			[2024] = "H� gi�p ngo�i ph�ng - V�ng",
			[2025] = "H� gi�p n�i ph�ng - V�ng",
			[2026] = "H� gi�p n�i ngo�i ph�ng - V�ng",
			[2027] = "�i�m sinh l�c - V�ng",
		},
		[5] = {
			[2035] = "Linh ho�t - V�ng",
			[2036] = "Th�n ph�p - V�ng",
		},
		[6] = {
			[1] = {
				[2055] = "T�ng s�t th��ng - V�ng",
				[2056] = "C�ng k�ch k�m ��c - V�ng",
				[2057] = "S�t th��ng ��c tr�ng - V�ng",
			},
			[2] = {
				[2074] = "T�c �� ch�y - V�ng",
				[2075] = "Ph�t huy V� c�ng - V�ng",
				[2076] = "Gi�m n�a ch�u th��ng - V�ng",
				[2077] = "X�c su�t chu�n x�c - V�ng",
				[2078] = "To�n thu�c t�nh - V�ng",
			}
		}
	}
	
	KXQP = {
		[1] = {
			[2086] = "S�c m�nh - V�ng",
			[2087] = "C�n c�t - V�ng",
		},
		[2] = {
			[2104] = "N�i c�ng - V�ng",
			[2105] = "Th�n ph�p - V�ng",
			[2106] = "Linh ho�t - V�ng",
			[2107] = "�i�m sinh l�c - V�ng",
			[2108] = "T� l� �i�m sinh l�c - V�ng",
		},
		[3] = {
			[2128] = "B�o k�ch - V�ng",
			[2130] = "�i�m ngo�i c�ng - V�ng",
			[2131] = "�i�m n�i c�ng - V�ng",
			[2132] = "�i�m n�i ngo�i c�ng - V�ng",
			[2133] = "T�ng �i�m sinh l�c - V�ng",
		},
		[4] = {
			[2153] = "Ph�ng b�c - V�ng",
			[2154] = "Gi�m b�c - V�ng",
			[2155] = "H� gi�p ngo�i ph�ng - V�ng",
			[2156] = "H� gi�p n�i ph�ng - V�ng",
			[2157] = "H� gi�p n�i ngo�i ph�ng - V�ng",
			[2158] = "�i�m sinh l�c - V�ng",
		},
		[5] = {
			[2169] = "S�c m�nh - V�ng",
			[2170] = "C�n c�t - V�ng",
			[2171] = "T�ng t� l� �i�m sinh l�c - V�ng",
		},
		[6] = {
			[1] = {
				[2193] = "Gi�i h�n cao nh�t ngo�i c�ng v� kh� - v�ng ",
				[2194] = "Gi�i h�n th�p nh�t ngo�i c�ng v� kh� - V�ng",
				[2195] = "T� l� ngo�i c�ng - V�ng",
				[2196] = "�i�m t�ng c�ng k�ch ngo�i c�ng - V�ng",
			},
			[2] = {
				[2213] = "T�c �� ch�y - V�ng",
				[2214] = "Ph�t huy V� c�ng - V�ng",
				[2215] = "Gi�m n�a ch�u th��ng - V�ng",
				[2216] = "X�c su�t chu�n x�c - V�ng",
			}
		}
	}
	
	KXDV = {
		[1] = {
			[2225] = "N�i c�ng - V�ng",
			[2226] = "C�n c�t - V�ng",
		},
		[2] = {
			[2243] = "S�c m�nh - V�ng",
			[2244] = "Th�n ph�p - V�ng",
			[2245] = "Linh ho�t - V�ng",
			[2246] = "�i�m sinh l�c - V�ng",
			[2247] = "T� l� �i�m sinh l�c - V�ng",
		},
		[3] = {
			[2267] = "B�o k�ch - V�ng",
			[2269] = "�i�m ngo�i c�ng - V�ng",
			[2270] = "�i�m n�i c�ng - V�ng",
			[2271] = "�i�m n�i ngo�i c�ng - V�ng",
			[2272] = "T�ng �i�m sinh l�c - V�ng",
		},
		[4] = {
			[2292] = "Ph�ng b�c - V�ng",
			[2293] = "Gi�m b�c - V�ng",
			[2294] = "H� gi�p ngo�i ph�ng - V�ng",
			[2295] = "H� gi�p n�i ph�ng - V�ng",
			[2296] = "H� gi�p n�i ngo�i ph�ng - V�ng",
			[2297] = "�i�m sinh l�c - V�ng",
		},
		[5] = {
			[2308] = "N�i c�ng - V�ng",
			[2309] = "Th�n ph�p - V�ng",
			[2310] = "Linh ho�t - V�ng",
		},
		[6] = {
			[1] = {
				[2332] = "Gi�i h�n cao nh�t n�i c�ng v� kh� - V�ng",
				[2333] = "Gi�i h�n th�p nh�t n�i c�ng v� kh� - V�ng",
				[2334] = "T� l� n�i c�ng-v�ng",
				[2335] = "�i�m t�ng c�ng k�ch n�i c�ng- v�ng",
			},
			[2] = {
				[2352] = "T�c �� ch�y - V�ng",
				[2353] = "Ph�t huy V� c�ng - V�ng",
				[2354] = "Gi�m n�a ch�u th��ng - V�ng",
				[2355] = "X�c su�t chu�n x�c - V�ng",
				[2356] = "R�t ng�n ��ng t�c b� th��ng- V�ng",
			}
		}
	}

	local tSet = {};
	if nSet == 29 then tSet = KXHC
	elseif nSet == 30 then tSet = KXQP
	elseif nSet == 31 then tSet = KXDV end;
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("Nh�n kim x� th�nh c�ng!");
	end;

end;

function getRandomKX6(nSet)
	KXDG = {
		[1] = {
			[2618] = {"S�c m�nh"},
			[2619] = {"G�n c�t"},
		},
		[2] = {
			[2631] = {"N�i c�ng"},
			[2632] = {"Th�n ph�p"},
			[2633] = {"Linh ho�t"},
			[2634] = {"�i�m sinh l�c"},
			[2635] = {"T� l� �i�m sinh l�c"},
		},
		[3] = {
			[2647] = {"B�o k�ch"},
			[2648] = {"�i�m ngo�i c�ng"},
			[2649] = {"�i�m n�i c�ng"},
			[2650] = {"�i�m n�i ngo�i c�ng"},
			[2651] = {"T�ng �i�m sinh l�c"},
		},
		[4] = {
			[2665] = {"Ph�ng b�c"},
			[2666] = {"Gi�m b�c"},
			[2667] = {"H� gi�p ngo�i ph�ng"},
			[2668] = {"H� gi�p n�i ph�ng"},
			[2669] = {"H� gi�p n�i ngo�i ph�ng"},
			[2670] = {"�i�m sinh l�c"},
		},
		[5] =  {
			[2678] = {"S�c m�nh"},
			[2679] = {"G�n c�t"},
			[2680] = {"T�ng t� l� �i�m sinh l�c"},
		},
		[6] = {
			[1] = { -- �o cho�ng v� huy ch��ng
				[2690] = {"Gi�i h�n cao nh�t ngo�i c�ng v� kh�"},
				[2691] = {"Gi�i h�n th�p nh�t ngo�i c�ng v� kh�"},
				[2692] = {"T� l� ngo�i c�ng"},
				[2693] = {"�i�m t�ng c�ng k�ch ngo�i c�ng"},
			},
			[2] = { -- Gi�y (154)
				[2703] = {"T�c �� ch�y"},
				[2704] = {"Ph�t huy v� c�ng"},
				[2705] = {"Gi�m n�a th� th��ng"},
				[2706] = {"X�c su�t chu�n x�c"},
			}
		}
	}
	
	KXHL = {
		[1] = {
			[2514] = {"Linh ho�t"},
			[2515] = {"Th�n Ph�p"},
		},
		[2] = {
			[2527] = {"N�i c�ng"},
			[2528] = {"S�c m�nh"},
			[2529] = {"G�n c�t"},
			[2530] = {"�i�m sinh l�c"},
			[2531] = {"T� l� �i�m sinh l�c"},
		},
		[3] = {
			[2543] = {"B�o k�ch"},
			[2544] = {"�i�m ngo�i c�ng"},
			[2545] = {"�i�m n�i c�ng"},
			[2546] = {"�i�m n�i ngo�i c�ng"},
			[2547] = {"T�ng �i�m sinh l�c"},
		},
		[4] = {
			[2561] = {"Ph�ng b�c"},
			[2562] = {"Gi�m b�c"},
			[2563] = {"H� gi�p ngo�i ph�ng"},
			[2564] = {"H� gi�p n�i ph�ng"},
			[2565] = {"H� gi�p n�i ngo�i ph�ng"},
			[2566] = {"�i�m sinh m�nh"},
		},
		[5] = {
			[2572] = {"Linh ho�t"},
			[2573] = {"Th�n ph�p"},
		},
		[6] = {
			[1] = {
				[2583] = {"T�ng s�t th��ng"},
				[2584] = {"C�ng k�ch k�m ��c"},
				[2585] = {"S�t th��ng ��c tr�ng"},
				[2586] = {"T� l� kh�ng tr�ng th�i b�t th��ng"},
			},
			[2] = {
				[2608] = {"T�c �� ch�y"},
				[2609] = {"Ph�t huy V� c�ng"},
				[2610] = {"Gi�m n�a ch�u th��ng"},
				[2611] = {"X�c su�t chu�n x�c"},
				[2612] = {"To�n thu�c t�nh"},
			}
		}
	}
	
	KXKP = {
		[1] = {
			[2712] = {"N�i c�ng"},
			[2713] = {"G�n c�t"},
		},
		[2] = {
			[2725] = {"S�c m�nh"},
			[2726] = {"Th�n ph�p"},
			[2727] = {"Linh ho�t"},
			[2728] = {"�i�m sinh l�c"},
			[2729] =  {"T� l� �i�m sinh l�c"},
		},
		[3] = {
			[2741] = {"B�o k�ch"},
			[2742] = {"�i�m ngo�i c�ng"},
			[2743] = {"�i�m n�i c�ng"},
			[2744] = {"�i�m n�i ngo�i c�ng"},
			[2745] = {"T�ng �i�m sinh l�c"},
		},
		[4] = {
			[2759] = {"Ph�ng b�c"},
			[2760] = {"Gi�m b�c"},
			[2761] = {"H� gi�p ngo�i ph�ng"},
			[2762] = {"H� gi�p n�i ph�ng"},
			[2763] = {"H� gi�p n�i ngo�i ph�ng"},
			[2764] = {"�i�m sinh l�c"},
		},
		[5] = {
			[2772] = {"N�i c�ng"},
			[2773] = {"Th�n ph�p"},
			[2774] = {"Linh ho�t"},
		},
		[6] = {
			[1] = {
				[2784] = {"Gi�i h�n cao nh�t n�i c�ng v� kh�"},
				[2785] = {"Gi�i h�n th�p nh�t n�i c�ng v� kh�"},
				[2786] = {"T�ng n�i c�ng"},
				[2787] = {"�i�m c�ng k�ch n�i c�ng"},
			},
			[2] = {
				[2803] = {"R�t ng�n th�i gian th� th��ng"},
				[2799] = {"T�c �� ch�y"},
				[2800] = {"Ph�t huy v� c�ng"},
				[2801] = {"Gi�m n�a th� th��ng"},
				[2802] = {"X�c su�t chu�n x�c"},
			}
		}
	}

	local tSet = {};
	if nSet == 32 then tSet = KXHL
	elseif nSet == 33 then tSet = KXDG
	elseif nSet == 34 then tSet = KXKP end;
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("Nh�n kim x� th�nh c�ng!");
	end;
end


function getRandomKX7(nSet)
	
	KXSL = {
		[1] = {
			[3388]="Linh ho�t",
			[3389]="Th�n ph�p",
		},
		[2] = {
			[3401] = "N�i c�ng",
			[3402] = "S�c m�nh",
			[3403] = "C�n c�t",
			[3404] = "T�ng �i�m sinh l�c",
			[3405] = "T�ng t� l� �i�m sinh l�c",
		},
		[3] = {
			[3417] = "B�o k�ch",
			[3418] = "T�ng �i�m s� ngo�i c�ng",
			[3419] = "T�ng �i�m s� n�i c�ng",
			[3420] = "T�ng �i�m s� n�i ngo�i",
			[3421] = "To�n thu�c t�nh",
		},
		[4] = {
			[3435] = "Ph�ng b�c",
			[3436] = "Gi�m b�c",
			[3437] = "H� gi�p ngo�i ph�ng",
			[3438] = "H� gi�p n�i ph�ng",
			[3439] = "H� gi�p n�i ngo�i ph�ng",
			[3440] = "�i�m sinh l�c",
		},
		[5] = {
			[3446] = "Linh ho�t",
			[3447] = "Th�n ph�p",
		},
		[6] = {
			[1] = {
				[3457] = "T�ng s�t th��ng",
				[3458] = "C�ng k�ch k�m ��c",
				[3459] = "S�t th��ng ��c tr�ng",
			},
			[2] = {
				[3468] = "T�ng s�t th��ng",
				[3469] = "C�ng k�ch k�m ��c",
				[3470] = "S�t th��ng ��c tr�ng",
			},
			[3] = {
				[3482] = "T�c �� ch�y",
				[3483] = "Ph�t huy V� c�ng",
				[3484] = "Gi�m n�a ch�u th��ng",
				[3485] = "X�c su�t chu�n x�c",
				[3486] = "To�n thu�c t�nh",
			}
		}
	}

	KXNN = {
		[1] = {
			[3492] = "S�c m�nh",
			[3493] = "C�n c�t",
		},
		[2] = {
			[3505] = "N�i c�ng",
			[3506] = "Th�n ph�p",
			[3507] = "Linh ho�t",
			[3508] = "�i�m sinh l�c",
			[3509] = "T� l� �i�m sinh l�c",
		},
		[3] = {
			[3521] = "B�o k�ch",
			[3522] = "�i�m ngo�i c�ng",
			[3523] = "�i�m n�i c�ng",
			[3524] = "�i�m n�i ngo�i c�ng",
			[3525] = "T�ng �i�m sinh l�c",
		},
		[4] = {
			[3539] = "Ph�ng b�c",
			[3540] = "Gi�m b�c",
			[3541] = "H� gi�p ngo�i ph�ng",
			[3542] = "H� gi�p n�i ph�ng",
			[3543] = "H� gi�p n�i ngo�i ph�ng",
			[3544] = "�i�m sinh l�c",
		},
		[5] = {
			[3552] = "S�c m�nh",
			[3553] = "C�n c�t",
			[3554] = "T�ng t� l� �i�m sinh l�c",
		},
		[6] = {
			[1] = {
				[3564] = "Gi�i h�n cao nh�t ngo�i c�ng v� kh� ",
				[3565] = "Gi�i h�n th�p nh�t ngo�i c�ng v� kh�",
				[3566] = "T� l� ngo�i c�ng",
				[3567] = "�i�m t�ng c�ng k�ch ngo�i c�ng",
			},
			[2] = {
				[3577] = "T�c �� ch�y",
				[3578] = "Ph�t huy V� c�ng",
				[3579] = "Gi�m n�a ch�u th��ng",
				[3580] = "X�c su�t chu�n x�c",
			}
		}
	}
			
	KXMS = {
		[1] = {
			[3586] = "N�i c�ng",
			[3587] = "C�n c�t",
		},
		[2] = {
			[3599] = "S�c m�nh",
			[3600] = "Th�n ph�p",
			[3601] = "Linh ho�t",
			[3602] = "�i�m sinh l�c",
			[3603] = "T� l� �i�m sinh l�c",
		},
		[3] = {
			[3615] = "B�o k�ch",
			[3616] = "�i�m ngo�i c�ng",
			[3617] = "�i�m n�i c�ng",
			[3618] = "�i�m n�i ngo�i c�ng",
			[3619] = "T�ng �i�m sinh l�c",
		},
		[4] = {
			[3633] = "Ph�ng b�c",
			[3634] = "Gi�m b�c",
			[3635] = "H� gi�p ngo�i ph�ng",
			[3636] = "H� gi�p n�i ph�ng",
			[3637] = "H� gi�p n�i ngo�i ph�ng",
			[3638] = "�i�m sinh l�c",
		},
		[5] = {
			[3646] = "N�i c�ng",
			[3647] = "Th�n ph�p",
			[3648] = "Linh ho�t",
		},
		[6] = {
			[1] = {
				[3658] = "Gi�i h�n cao nh�t n�i c�ng v� kh�",
				[3659] = "Gi�i h�n th�p nh�t n�i c�ng v� kh�",
				[3660] = "T� l� n�i c�ng-v�ng",
				[3661] = "�i�m t�ng c�ng k�ch n�i c�ng- v�ng",
			},
			[2] = {
				[3673] = "T�c �� ch�y",
				[3674] = "Ph�t huy V� c�ng",
				[3675] = "Gi�m n�a ch�u th��ng",
				[3676] = "X�c su�t chu�n x�c",
				[3677] = "R�t ng�n ��ng t�c b� th��ng- V�ng",
			}
		}
	}
	local tSet = {};
	if nSet == 35 then tSet = KXSL
	elseif nSet == 36 then tSet = KXNN
	elseif nSet == 37 then tSet = KXMS end;
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("Nh�n kim x� th�nh c�ng!");
	end;
end;



function showKX7()
	tSay = {
		"S�t Lang/#getRandomKX7(35)",
		"Nhu� Nha/#getRandomKX7(36)",
		"M�ng S�t/#getRandomKX7(37)",
	}
	tinsert(tSay,"Ch�a mu�n nh�n/nothing");
	Say("Ch�n lo�i kim x�",getn(tSay),tSay);
end;

function showKX6()
	tSay = {
		"Hoan L�ng/#getRandomKX6(32)",
		"��ng Giao/#getRandomKX6(33)",
		"Kh�i Ph��ng/#getRandomKX6(34)",
	}
	tinsert(tSay,"Ch�a mu�n nh�n/nothing");
	Say("Ch�n lo�i kim x�",getn(tSay),tSay);
end;

function showKX5()
	tSay = {
		"Hi�p c�t/#getRandomKX5(29)",
		"Qu� ph�/#getRandomKX5(30)",
		"��ng v�n/#getRandomKX5(31)",
	}
	tinsert(tSay,"Ch�a mu�n nh�n/nothing");
	Say("Ch�n lo�i kim x�",getn(tSay),tSay);
end;


function showKX4()
	tSay = {
		"Du hi�p/#getRandomKX4(26)",
		"Thi�t huy�t/#getRandomKX4(27)",
		"V�n du/#getRandomKX4(28)",
	}
	tinsert(tSay,"Ch�a mu�n nh�n/nothing");
	Say("Ch�n lo�i kim x�",getn(tSay),tSay);
end;

function addSetofKX(tSet, nSet)
	local r1,r2,r3,r4,r5,r6;
	-- Add Phi phong
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,1);
	AddKX(152,nSet,r1,r2,r3,r4,r5,r6);
	-- Add Huy ch��ng
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,2);
	AddKX(153,nSet,r1,r2,r3,r4,r5,r6);
	-- Add Chi�n h�i
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,3);
	AddKX(154,nSet,r1,r2,r3,r4,r5,r6);
	return 1;
end

function getIndexs(tList,nPos)
	local tSubList = {}
	local nListLen = getn(tList);
	
	if nPos == 1 then
		tSubList = tList[nListLen][1];
	elseif nPos == 2 then
		if getn(tList[nListLen]) == 3 then
			tSubList = tList[nListLen][2];
		else
			tSubList = tList[nListLen][1];
		end
	elseif nPos == 3 then
		if getn(tList[nListLen]) == 3 then 
			tSubList = tList[nListLen][3];
		else
			tSubList = tList[nListLen][2];
		end
	end
	
	local r1,r2,r3,r4,r5,r6;
	if nListLen == 6 then 			
		r1 = getRandomIndex(tList[1]);
		r2 = getRandomIndex(tList[2]);
		r3 = getRandomIndex(tList[3]);
		r4 = getRandomIndex(tList[4]);
		r5 = getRandomIndex(tList[5]);
		r6 = getRandomIndex(tSubList);
		-- print(r1,r2,r3,r4,r5,r6);
	elseif nListLen == 4 then 
		r1 = getRandomIndex(tList[1]);
		r2 = getRandomIndex(tList[2]);
		r3 = getRandomIndex(tList[3]);
		r4 = getRandomIndex(tSubList);
	end
		
	return r1,r2,r3,r4,r5,r6;
end;

function getRandomIndex(tList)
	local nIndexResult = -1;
	if tList == nil then 
		return 0
	end
	local nRandNum = random(tlen(tList));
	local i = 0;
	for k,v in tList do 
		i = i+1;
		if i == nRandNum then
			nIndexResult = k;
			break
		end
	end
	return nIndexResult;
end;

function tlen(tList)
	local i = 0;
	for k,v in tList do 
		i = i+1;
	end
	return i;
end;

function AddKX(nType,nSet,ID1,ID2,ID3,ID4,ID5,ID6)
	local nResult,nItemIndex = AddItem(0,nType,nSet,1,4,-1,-1,-1,-1,-1,-1,0,15)
    FeedItem(nItemIndex,1000000)
	if ID5 ~= nil and ID6 ~= nil then 
		SetItemFeedUpAttrs(nItemIndex,ID1,ID2,ID3,ID4,ID5,ID6);
	else
		SetItemFeedUpAttrs(nItemIndex,ID1,ID2,0,ID3,0,ID4);
	end
end


function Get_JinShe()
		if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		local nLevel  = 10;
		if nRoute == 2 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,186,164,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,186,164,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,186,164,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 3 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 4 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		
		if nRoute == 6 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 8 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		

		if nRoute == 9 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 11 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,183,181,757,770,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,183,181,757,770,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,183,181,757,770,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 12 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,163,178,758,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,163,178,758,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,163,178,758,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 14 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 15 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,164,178,760,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,164,178,760,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,164,178,760,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 17 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,183,181,757,770,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,183,181,757,770,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,183,181,757,770,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 18 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 20 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,163,179,758,755,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,163,179,758,755,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,163,179,758,755,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 21 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,180,760,756,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,180,760,756,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,180,760,756,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 23 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 29 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 30	then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,164,178,760,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,164,178,760,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,164,178,760,754,1004)
				FeedItem(xIndex,1000000)
		end
	
end