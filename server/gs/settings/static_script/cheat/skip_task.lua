tbTasks = {
	{1,"Nhi�m v� S� nh�p"},
	{104,"Nhi�m v� V��ng Nghi�p V�"},
	{105,"Nhi�m v� V��ng Nghi�p V�"},
	{106,"Nhi�m v� V��ng Nghi�p V�"},
	{107,"Nhi�m v� V��ng Nghi�p V�"},
	{117,"Nhi�m v� V��ng Nghi�p V�"},
	{118,"Nhi�m v� V��ng Nghi�p V�"},
	{119,"Nhi�m v� V��ng Nghi�p V�"},
	{1402,"Nhi�m v� Phong �� Qu� Th�nh"},
	{1401,"Nhi�m v� Thi�n M�n tr�n"},
	{110,"Nhi�m v� Kh�u Chu�n"},
	{111,"Nhi�m v� Kh�u Chu�n"},
	{140,"Nhi�m v� C�ng T�n Th�"},
	{144,"Nhi�m v� C�ng T�n Th�"},
	{141,"Nhi�m v� C�ng T�n Th�"},
	{121,"Nhi�m v� Ph�m Tr�ng Y�m"},
	{122,"Nhi�m v� Ph�m Tr�ng Y�m"},
	{123,"Nhi�m v� Ph�m Tr�ng Y�m"},
	{150,"Nhi�m v� Ph�m Tr�ng Y�m"},
	{147,"Nhi�m v� H� H�u C�m"},
	{148,"Nhi�m v� H� H�u C�m"},
	{146,"Nhi�m v� H� H�u C�m"},
	{1300,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1301,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1302,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1303,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1305,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1306,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1307,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1308,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1309,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1311,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1312,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1315,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1316,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1317,"Nhi�m v� Tr�nh Qu�n Chi"},
	{1318,"Nhi�m v� Tr�nh Qu�n Chi"},
	{2030,"Nhi�m v� T�y B�c"},
	{2031,"Nhi�m v� T�y B�c"},
	{2032,"Nhi�m v� T�y B�c"},
	
}

function main_task_skipper()
	tbSay = {}
	for i=1, getn(tbTasks) do 
		if GetTask(tbTasks[i][1]) ~= 0 then 
			tinsert(tbSay, tbTasks[i][2]..format("/#skip_task(%d)",tbTasks[i][1]));
		end
	end
	tinsert(tbSay,"Tho�t/nothing");
	Say("B�ng nhi�m v� hi�n t�i\n<color=gray>H�y m� b�ng nhi�m v� [F11], v� ch�n nhi�m v� c�n b� qua tr��c khi s� d�ng ch�c n�ng<color>.",getn(tbSay),tbSay);
end;

function skip_task(nTaskId)
	SetTask(nTaskId,GetTask(nTaskId)+1);
	SendScript2Client("Open([[tasknote]])")
	SendScript2Client("Open([[tasknote]])")
	main_task_skipper();
end;

function nothing() end;