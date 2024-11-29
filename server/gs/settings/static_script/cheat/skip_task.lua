tbTasks = {
	{1,"NhiÖm vô S¬ nhËp"},
	{104,"NhiÖm vô V­¬ng NghiÖp VÜ"},
	{105,"NhiÖm vô V­¬ng NghiÖp VÜ"},
	{106,"NhiÖm vô V­¬ng NghiÖp VÜ"},
	{107,"NhiÖm vô V­¬ng NghiÖp VÜ"},
	{117,"NhiÖm vô V­¬ng NghiÖp VÜ"},
	{118,"NhiÖm vô V­¬ng NghiÖp VÜ"},
	{119,"NhiÖm vô V­¬ng NghiÖp VÜ"},
	{1402,"NhiÖm vô Phong §« Quû Thµnh"},
	{1401,"NhiÖm vô Thiªn M«n trËn"},
	{110,"NhiÖm vô KhÊu ChuÈn"},
	{111,"NhiÖm vô KhÊu ChuÈn"},
	{140,"NhiÖm vô C«ng T«n Th­"},
	{144,"NhiÖm vô C«ng T«n Th­"},
	{141,"NhiÖm vô C«ng T«n Th­"},
	{121,"NhiÖm vô Ph¹m Träng Yªm"},
	{122,"NhiÖm vô Ph¹m Träng Yªm"},
	{123,"NhiÖm vô Ph¹m Träng Yªm"},
	{150,"NhiÖm vô Ph¹m Träng Yªm"},
	{147,"NhiÖm vô H¹ HÇu CÇm"},
	{148,"NhiÖm vô H¹ HÇu CÇm"},
	{146,"NhiÖm vô H¹ HÇu CÇm"},
	{1300,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1301,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1302,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1303,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1305,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1306,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1307,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1308,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1309,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1311,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1312,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1315,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1316,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1317,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{1318,"NhiÖm vô TrŞnh Qu¸n Chi"},
	{2030,"NhiÖm vô T©y B¾c"},
	{2031,"NhiÖm vô T©y B¾c"},
	{2032,"NhiÖm vô T©y B¾c"},
	
}

function main_task_skipper()
	tbSay = {}
	for i=1, getn(tbTasks) do 
		if GetTask(tbTasks[i][1]) ~= 0 then 
			tinsert(tbSay, tbTasks[i][2]..format("/#skip_task(%d)",tbTasks[i][1]));
		end
	end
	tinsert(tbSay,"Tho¸t/nothing");
	Say("B¶ng nhiÖm vô hiÖn t¹i\n<color=gray>H·y më b¶ng nhiÖm vô [F11], vµ chän nhiÖm vô cÇn bá qua tr­íc khi sö dông chøc n¨ng<color>.",getn(tbSay),tbSay);
end;

function skip_task(nTaskId)
	SetTask(nTaskId,GetTask(nTaskId)+1);
	SendScript2Client("Open([[tasknote]])")
	SendScript2Client("Open([[tasknote]])")
	main_task_skipper();
end;

function nothing() end;