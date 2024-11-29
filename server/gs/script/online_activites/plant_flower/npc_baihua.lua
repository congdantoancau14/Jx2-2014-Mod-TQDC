Include("\\script\\online_activites\\2011_10\\activity_04\\plant_flower.lua");

function main()
	local tbSay = {};
	local szSay = "Quan kh¸ch mua hoa µ?";
	tbSay, szSay = VET_201111_PlantFlowerDialog(tbSay, szSay);
	tinsert(tbSay,"§óng vËy! Ta muèn mua mét Ýt hoa/buyFlower");
	tinsert(tbSay,"Ta ghÐ xem th«i/nothing");
	Say(szSay,getn(tbSay),tbSay);
end;

function buyFlower()
	Sale(177);
end;

function nothing()
end;