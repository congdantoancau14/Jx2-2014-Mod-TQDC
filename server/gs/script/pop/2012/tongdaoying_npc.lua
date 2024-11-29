--µÀÍ¯Ó±\Í¯ÃôÖ®
Include("\\script\\lib\\define.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

tInfo = {
	{930,},
	{77,},}

function goto_ziluoshan(nTask)
	nTask = nTask or 0;
--	if nTask == 0 then
--		NewWorld(5077,1606,3402);
--		return 0;
--	end
	CastState("state_block_left_skill",1,7*24*60*60);
	CastState("state_block_qinggong",2,7*24*60*60);
	CastState("state_lock",3,7*24*60*60);
	Restore()
	SetFightState(1);
	NewWorld(5077,1606,3402);
end

function leave_ziluoshan(nTask)
	nTask = nTask or 0;
	RemvoeTempEffect();
	SetFightState(0);
	NewWorld(5077,1627,3395);
end

function get_book()
	if gf_Judge_Room_Weight(1,10,"§¹o §ång Khuynh Chi") ~= 1 then return 0; end
	if BigGetItemCount(2,96,142) >= 10  then
		Talk(1,"","Ng­¬i ®· lÊy ®ñ kinh th­ råi, h·y mau ®i giao cho ®¹o tr­ëng Tö La S¬n-Nguyªn H­ Tö xem thö!");
		return 0;
	end
	local nCurLife = GetLife();
	local nMaxLife = GetMaxLife();
	local nValue = nCurLife/nMaxLife;
	local nCount = 1;
	if nCurLife == nMaxLife  then
		nCount = 5;
	elseif nValue  >= 0.8 then
		nCount = 4;
	elseif nValue >= 0.6 then
		nCount = 3;
	elseif nValue >= 0.4 then
		nCount = 2;		
	end
	gf_SetLogCaption("NhiÖm vô tuÇn hoµn Tö La S¬n (Phiªn b¶n 2012)")
	gf_AddItemEx({2,96,142,nCount,4},"Tö La S¬n Kinh Th­");
	Restore();
	NewWorld(5077,1606,3402);
end

function main()
	local nNpcIdx = GetTargetNpc()
	local sNpcName = GetNpcName(nNpcIdx);
	local nTask = 0;

	for i = 1,getn(tInfo) do
		if tGtTask:check_cur_task(tInfo[i][1]) == 1 then
			nTask = 1;
			break;
		end
	end
	if nTask == 0 then
		return 0;
	end
	local tMsg = {
	["§¹o §ång DÜnh Chi"] =  	format("Ta muèn vµo Tö La S¬n-Khu Tu LuyÖn!/#goto_ziluoshan(%d)",nTask),
	["§¹o §ång MÉn Chi"]	= 	format("Ta muèn rêi khái Tö La S¬n-Khu Tu LuyÖn!/#leave_ziluoshan(%d)",nTask),
	["§¹o §ång Khuynh Chi"] = "NhËn Tö La S¬n Kinh Th­./get_book",
	}
	if not tMsg[sNpcName] then
		return 0;
	end
	
	local strtab = {
		tMsg[sNpcName],
		"Ta chØ xem thö th«i./nothing",
		}
	Say(sNpcName .. ":",getn(strtab),strtab);
end