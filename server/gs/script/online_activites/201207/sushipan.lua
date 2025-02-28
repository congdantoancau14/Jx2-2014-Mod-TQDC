--2012年8月素食盘活动
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\meridian\\meridian_script_api.lua")

VET_201207_ACITIVITY_ID = 69;

VET_201207_NPC = "<color=green>Ch� T鰑 L莡:<color>";

VET_201207_Say_Tb = {
	"Ta mu鑞 thng th鴆 Gi� Chay (Ti猽 hao 25 сa Hoa Vu Lan + 25 V祅g) /#exchange_one(1)",
	"Ta mu鑞 thng th鴆 Nem (Ti猽 hao 25 сa Hoa Vu Lan + 25 V祅g) /#exchange_one(2)",
	"Ta mu鑞 thng th鴆 Rau X祇 Th藀 C萴 (Ti猽 hao 25 сa Hoa t苙g M� + 25 V祅g) /#exchange_two(1)",
	"Ta mu鑞 thng th鴆 C秈 Th秓 Ti襪 N蕀 Йng C� (Ti猽 hao 25 сa Hoa t苙g M� + 25 V祅g) /#exchange_two(2)",
	"Ta mu鑞 thng th鴆 M﹎ C� Vu Lan (Ti猽 hao 50 сa Hoa Vu Lan + 50 сa Hoa t苙g M� + 50 V祅g)/exchange_both",
	"Ta mu鑞 nh薾 thng Si猽 Thng Th鴆 (K輈h ho箃 06 l莕 t蕋 c� d遪g ch鋘)/super_award",
};

VET_201207_ExcAw_TaskGroup = TaskManager:Create(5,13);
VET_201207_ExcAw_TaskGroup.DaySeq = 1;
VET_201207_ExcAw_TaskGroup.Times1 = 2;
VET_201207_ExcAw_TaskGroup.Times2 = 3;
VET_201207_ExcAw_TaskGroup.Times3 = 4;
VET_201207_ExcAw_TaskGroup.Times4 = 5;
VET_201207_ExcAw_TaskGroup.Times5 = 6;
VET_201207_ExcAw_TaskGroup.Tag = 7;


Max_Count = 6; --每天单项最多8次
Exp_Award_Normal1 = 6000000;
Exp_Award_Normal2 = 24000000;
Item_Count1 = 25;
Item_Count2 = 25;
Coin_Consume = 25;
Item_table1 = {2,1,30423,"сa Hoa Vu Lan"};
Item_table2 = {2,1,30422,"сa Hoa t苙g M�"};
Acitivity_log1 = "HOAT DONG PHU THANG 8";
Acitivity_log2 = "M﹎ C� Chay";

strMsg2Player1 = "Thng th鴆 Gi� Chay %d/%d";
strMsg2Player2 = "Thng th鴆 Nem %d/%d";
strMsg2Player3 = "Thng th鴆 Rau X祇 Th藀 C萴 %d/%d";
strMsg2Player4 = "Thng th鴆 C秈 Th秓 Ti襪 N蕀 Йng C� %d/%d";
strMsg2Player5 = "Thng th鴆 M﹎ C� Vu Lan %d/%d";

--奖励表
Vet_201207_Award  = {
    {1, 1919, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 2}, 0},
    {1, 1838, "u h錸", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2525, "Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 522, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 200, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 333, "M秐h B筩h Kim", {2, 1, 30346, 1}, 0},
    {1, 15, "Чi мnh H錸 ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {3, 123, 9990000, 1},
    {3, 2525, 990000, 1},
};
Vet_201207_Award_Special  = {
    {1, 1515, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 4}, 0},
    {1, 2020, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 1010, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 678, "M秐h B筩h Kim", {2, 1, 30346, 1}, 0},
    {1, 73, "Чi мnh H錸 ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {1, 2020, "M秐h Thi猲 Cang", {2, 1, 30390, 100}, 0},
    {3, 2525, 990000, 1},
    {3, 159, 9990000, 1},
};

function exchange_one(nFlag)
	if condition_check() == 0 then
		return 0;
	end
	if nFlag == 1 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("M鏸 ng祔 m鏸 nh﹏ v藅 t鑙 產 ch� c� th� ho祅 th祅h<color=green>%d<color>l莕",Max_Count));
			return 0;
		end
	end
	if nFlag == 2 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("M鏸 ng祔 m鏸 nh﹏ v藅 t鑙 產 ch� c� th� ho祅 th祅h<color=green>%d<color>l莕",Max_Count));
			return 0;
		end
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_Count1 then
		Talk(1,"",VET_201207_NPC..format("S� lng %s trong h祅h trang kh玭g  <color=green>%d c竔 <color>",Item_table1[4],Item_Count1));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_201207_NPC..format("Trong h祅h trang kh玭g  s� lng v祅g<color=green>%d c竔 <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_Count1) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	if nFlag == 1 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times1,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1)+1);
	end
	if nFlag == 2 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times2,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2)+1);
	end
	gf_Modify("Exp",Exp_Award_Normal1);
	gf_EventGiveRandAward(Vet_201207_Award,10000,1,Acitivity_log1,Acitivity_log2)
	 gf_WriteLogEx(Acitivity_log1, "nh薾 th祅h c玭g", 1, "T鎛g nh薾 6 tri謚 Gi� Nem (21/8) lo筰 "..nFlag)
	if nFlag == 1 then
		Msg2Player(format(strMsg2Player1, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1),Max_Count));
	end
	if nFlag == 2 then
		Msg2Player(format(strMsg2Player2, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2),Max_Count));
	end
end


function exchange_two(nFlag)
	if condition_check() == 0 then
		return 0
	end
	if nFlag == 1 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("M鏸 ng祔 m鏸 nh﹏ v藅 t鑙 產 ch� c� th� ho祅 th祅h<color=green>%d<color>l莕",Max_Count));
			return 0;
		end
	end
	if nFlag == 2 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("M鏸 ng祔 m鏸 nh﹏ v藅 t鑙 產 ch� c� th� ho祅 th祅h<color=green>%d<color>l莕",Max_Count));
			return 0;
		end
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_Count2 then
		Talk(1,"",VET_201207_NPC..format("S� lng %s trong h祅h trang kh玭g  <color=green>%d c竔 <color>",Item_table2[4],Item_Count2));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_201207_NPC..format("Trong h祅h trang kh玭g  s� lng v祅g<color=green>%d c竔 <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_Count2) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	if nFlag == 1 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times3,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3)+1);
	end
	if nFlag == 2 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times4,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4)+1);
	end
	gf_Modify("Exp",Exp_Award_Normal1);
	gf_EventGiveRandAward(Vet_201207_Award,10000,1,Acitivity_log1,Acitivity_log2)
	gf_WriteLogEx(Acitivity_log1, "nh薾 th祅h c玭g", 1, "T鎛g nh薾 6 tri謚 Rau C秈 (21/8) lo筰 "..nFlag)
	if nFlag == 1 then
		Msg2Player(format(strMsg2Player3, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3),Max_Count));
	end
	if nFlag == 2 then
		Msg2Player(format(strMsg2Player4, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4),Max_Count));
	end
end


function exchange_both()
	if condition_check() == 0 then 
		return 0;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5) >= Max_Count then
		Talk(1,"",format("M鏸 ng祔 m鏸 nh﹏ v藅 t鑙 產 ch� c� th� ho祅 th祅h<color=green>%d<color>l莕",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_Count1*2 then
		Talk(1,"",VET_201207_NPC..format("S� lng %s trong h祅h trang kh玭g  <color=green>%d c竔 <color>",Item_table1[4], Item_Count1*2));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_Count2*2 then
		Talk(1,"",VET_201207_NPC..format("S� lng %s trong h祅h trang kh玭g  <color=green>%d c竔 <color>",Item_table2[4],Item_Count1*2));
		return 0;
	end
	if GetCash() < Coin_Consume*10000*2 then
		Talk(1,"",VET_201207_NPC..format("Trong h祅h trang kh玭g  s� lng v祅g<color=green>%d c竔 <color>",Coin_Consume*2));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_Count1*2) ~= 1 then return 0; end
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_Count2*2) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000*2) ~= 1 then return 0; end
	
	VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times5,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5)+1);
	gf_Modify("Exp",Exp_Award_Normal2);
	gf_EventGiveRandAward(Vet_201207_Award,10000,1,Acitivity_log1,Acitivity_log2)
	gf_WriteLogEx(Acitivity_log1, "nh薾 th祅h c玭g", 1, "T鎛g nh薾 24 tri謚 (21/8)")
	Msg2Player(format(strMsg2Player5,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5),Max_Count))
end

function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201207_NPC.."Nh﹏ v藅 c蕄 <color=green>79<color> tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 <color=green>1<color> k� n╪g c蕄 <color=green>55<color> m韎 c� th� tham gia");
		return 0;
	end	
	--判断背包空间
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"",VET_201207_NPC.."Kh玭g gian h祅h trang kh玭g ")
	    return 0
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times1,0)		
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times2,0)	
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times3,0)
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times4,0)	
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times5,0)
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Tag,0)
	end
	return 1;
end

function super_award()
	if condition_check() == 0 then
		return 0;
	end
	local nFlag = 0;
	local strMsg = "Kh玭g  甶襲 ki謓 nh薾 ph莕 thng Si猽 Thng Th鴆: \n";
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Tag) == 1 then
		Talk(1,"","C竎 h�  nh薾 ph莕 thng Si猽 Thng Th鴆 r錳")
		return 0;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player1,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player2,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player3,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player4,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player5,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if nFlag == 1 then
		Talk(1,"",strMsg);
		return 0;
	end
	VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Tag,1);
	local nRand = gf_EventGiveRandAward(Vet_201207_Award_Special,10000,1,Acitivity_log1,Acitivity_log2)
	gf_WriteLogEx(Acitivity_log1, "nh薾 th祅h c玭g", 1, "T鎛g nh薾 c bi謙 (21/8)")
	--大定魂光爆一下
	if nRand == 5 then
		Msg2Global(format("Ch骳 m鮪g %s nh薾 頲 ph莕 thng Si猽 Thng Th鴆 trong ho箃 ng Vu Lan B竜 Hi誹 %s x %d",GetName(),Vet_201207_Award_Special[nRand][3],Vet_201207_Award_Special[nRand][4][4]));
	end
end