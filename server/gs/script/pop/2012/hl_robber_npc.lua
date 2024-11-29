--ºìÁ«Ç¿µÁ
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function nothing()
end

nLevelLimit = 99;
function give_money()
	if Pay(500) == 1 then
		local nRand = random(1,100);
		if nRand < nLevelLimit then
			Talk(1,"","Hång Liªn C­êng §¹o: Ta ®o¸n r»ng ng­¬i còng kh«ng ph¶i ng­êi tèt!")
			local nIdx = CreateNpc("Hång Liªn C­êng §¹o","Hång Liªn C­êng §¹o",GetWorldPos());
			ChangeNpcToFight(nIdx);
			SetNpcDeathScript(nIdx,"\\script\\pop\\2012\\hl_robber_npc.lua");
		else
			Talk(1,"","Hång Liªn C­êng §¹o: Ng­¬i ®óng lµ ng­êi tèt! NhËn ®­îc 1 ThÎ Ng­êi Tèt.")
			gf_AddItemEx({2,96,131,1,4},"ThÎ Ng­êi Tèt");
		end
		SetTask(TASKID_SW_TASK948_FINISH,GetTask(TASKID_SW_TASK948_FINISH) + 1);
	end
end
tInfo = {931,948,};
function main()
	local nHasTask = 0;
	for i = 1,getn(tInfo) do
		if 1 == tGtTask:check_cur_task(tInfo[i])  then
			nHasTask = 1
			break;
		end
	end
	if nHasTask ~= 1 then
		return 0;
	end
	
	if GetCash() < 5*10000 then
		Talk(1,"","Hång Liªn C­êng §¹o: §¹i hiÖp kh«ng ®ñ vµng, sau khi cã ®ñ vµng h·y quay l¹i!");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,"Hång Liªn C­êng §¹o") ~= 1 then
		return 0;
	end
	local nNpcIdx = GetTargetNpc();
	local strtab = {
		"Nghe ®ån c­êng ®¹o c¸c ng­¬i rÊt thÝch tiÒn b¹c, nh÷ng ng­êi ®¹o gia chóng t«i xem nh÷ng thø nµy lµ vËt ngoµi th©n, nªn th­ëng cho ng­¬i mét Ýt vËy!/give_money" ,
		}
	
	Say("Hång Liªn C­êng §¹o:",
		getn(strtab),
		strtab)
end

function OnDeath(nNpcIdx)
	RemoveNpc(nNpcIdx);
end