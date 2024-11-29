--ÎäÁÖÈËÊ¿
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\define.lua")
tInfo ={
{"§Ö Tö Vâ §ang",	"Danh väng Vâ §ang §¹o Gia Thñ Täa",},
{"§Ö tö ThiÕu L©m",		"Giam CÇm §Şa1",},
{"§Ö tö Minh Gi¸o",		"Danh väng Minh Gi¸o Th¸nh ChiÕn Thñ Täa",},
}
sDeathScript = "\\script\\pop\\2012\\liaoguo_cike_npc.lua";

function main()
	if tGtTask:check_cur_task(940) ~= 1 then
			return 0;
	end
	if GetTime() - GetTask(TASKID_SW_ITEM_WXZYH_CD) < 120 then
		Talk(1,"","H·y nghØ ng¬i råi míi quay l¹i t×m ta! (Thêi gian gi·n c¸ch: 2 phót)");
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	for i = 1,getn(tInfo) do
		if tInfo[i] then
			local nIdx = CreateNpc(tInfo[i][2],tInfo[i][1],nMapId,nX,nY,-1,1,1,40);
			SetNpcLifeTime(nIdx,60*3);
			SetNpcDeathScript(nIdx,sDeathScript);
		end
	end
	if GetFollower() ~= 0 then
--		KillFollower();
	end
	SummonNpc("ThiÕu n÷ h«n mª","ThiÕu n÷ h«n mª");
	SetTask(TASKID_SW_ITEM_WXZYH_CD,GetTime());
end

--ÎŞÏà×ÚÑÌ»ğ
function OnUse(nItemIdx)
	if tGtTask:check_cur_task(1011) ~= 1 then
			return 0;
	end
	local nMapId1,nX1,nY1 = GetWorldPos();
	local nMapZXC = 5079; --ÔáÑ©³Ç
	if nMapId1 ~=  nMapZXC then
		Talk(1,"","V« T­¬ng T«ng Yªn Háa: H·y ®Õn T¸ng TuyÕt Thµnh ®Ó sö dông.")
		return 0;
	end
	if GetTime() - GetTask(TASKID_SW_ITEM_WXZYH_CD) < 120 then
		Talk(1,"","H·y sö dông sau (Gi·n c¸ch sö dông: 2 phót).")
		return 0;
	end
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	if g ~= 2 or d ~= 96 or p ~= 136 then
		return 0;
	end 
	for i = 1,getn(tInfo) do
		if tInfo[i] then
			local nIdx = CreateNpc(tInfo[i][2],tInfo[i][1],nMapId1,nX1,nY1,-1,1,1,40);
			SetNpcLifeTime(nIdx,60*5);
			SetNpcDeathScript(nIdx,sDeathScript);
		end
	end
	SetTask(TASKID_SW_ITEM_WXZYH_CD,GetTime());
end

	