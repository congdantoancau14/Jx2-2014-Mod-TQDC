--Çàº£ÑÎÉÌ
Include("\\script\\missions\\yp\\award.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\message.lua");

g_NpcName = "<color=green>Thanh H¶i Diªm Th­¬ng<color>: "

function main()
	local strtab = {
		"Ta muèn giao tiªu/qhys_talk_1",
		"NhËn phÇn th­ëng mua b¶o hiÓm/qhys_talk_2",
		"KÕt thóc ®èi tho¹i/nothing"
	};
	Say(g_NpcName.."Ta lµ ®¹i diªm th­¬ng cña vïng bê hå Thanh H¶i, gÇn ®©y h×nh nh­ cã rÊt nhiÒu tiªu cña TrÊn ViÔn Tiªu Côc ®Òu b¾t nguån tõ chç cña ta, xem ra ta s¾p ph¸t tµi råi.",
		getn(strtab),
		strtab)
end

function qhys_talk_1()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."Ng­¬i ch­a nhËn nhiÖm vô Tiªu Xa!");
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nAwardType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	local nDouble = GetTask(TASK_FIELD_PVP_CAR_DOUBLE);
	local nCurNpcID = GetNpcID(nNpcIdx);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Talk(1,"",g_NpcName.."Tiªu Xa cña ng­¬i bÞ ph¸ hñy hoÆc qu¸ thêi gian vËn tiªu vÉn ch­a ®Õn ®Ých, vËn tiªu thÊt b¹i!");
		SetTask(TASK_FIELD_PVP_CAR_RAND,0)
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
		local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	if nMapID ~= nNpcMapID or nDistance > 16 then
		Talk(1,"",g_NpcName.."Tiªu Xa cña ®¹i hiÖp vÉn ch­a giao ®Õn, h·y nhanh chãng ®i kiÓm tra!")
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end	
	SetTask(TASK_FIELD_PVP_CAR_RAND,0)
	SetTask(TASK_FIELD_PVP_CAR_START,0);
	SetTask(TASK_FIELD_PVP_CAR_IDX,0);
	SetTask(TASK_FIELD_PVP_CAR_ID,0);
	SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
	SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
	SetTask(TASK_FIELD_PVP_CAR_TB,0);
	SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
	SetNpcRemoveScript(nNpcIdx,"");
	SetNpcLifeTime(nNpcIdx,0);
	-----
	--¸ø½±Àø
	yp_aw_giveAward_14(nAwardType,nDouble+1);
	-----
	Talk(1,"",g_NpcName.."§¹i hiÖp qu¶ lµ cã th©n thñ tèt, qu¶ng ®­êng xa nh­ thÕ mµ vËn tiªu ®Õn ®©y nhanh thÕ nµy, vÊt v¶ råi, mêi ng­êi nghØ ng¬i!")	
end

function qhys_talk_2()
	local nTouBao = GetTask(TASK_FIELD_PVP_CAR_TB);
	local nState = GetTask(TASK_FIELD_PVP_CAR_START);
	if nState == 0 and nTouBao ~= 0 then
		SetTask(TASK_FIELD_PVP_CAR_TB,0);
		yp_aw_giveAward_16(nTouBao);
	elseif nState ~= 0 then
		Talk(1,"",g_NpcName.."Tiªu Xa cña ng­êi ch­a bÞ ph¸ hñy, h·y yªn t©m vËn chuyÓn Tiªu Xa ®Õn ®©y nµo!");
	elseif nTouBao == 0 then
		Talk(1,"",g_NpcName.."Ng­¬i ch­a mua b¶o hiÓm cho Tiªu Xa, ®Þnh lõa ta giao phÇn th­ëng mua b¶o hiÓm µ!");
	end
end