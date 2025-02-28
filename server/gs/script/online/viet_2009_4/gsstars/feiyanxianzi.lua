--=============================================
--create by baiyun 2009.4.12
--describe:越南版4月份金星星银星星活动 飞燕仙子
--=============================================

Include("\\script\\online\\viet_2009_4\\gsstars\\gsstars_head.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")

GS_AWARD_PARAM = {
							"Dc th秓 qu﹏ d鬾g",
							"L骯 m筩h qu﹏ d鬾g",
							"Kho竛g th筩h qu﹏ d鬾g",
							"Linh huy誸 qu﹏ d鬾g",
							"T� t籱 qu﹏ d鬾g",
							"G� qu﹏ d鬾g",
							"Thu閏 da qu﹏ d鬾g",
							"Phong l謓h-trung c蕄",
							"Phong thng l謓h_T鑞g (Й Th鑞g)",
							"Phong thng l謓h_Li猽 (Й Th鑞g)",
							"Phong thng l謓h_T鑞g (Ti猲 Phong)",
							"Phong thng l謓h_Li猽 (Ti猲 Phong)",
							"Qu﹏ C玭g Чi",
							"S� tay s鑞g",
							"T葃 T駓 linh n",
							"B竧 B秓 T葃 T駓 Ti猲 Кn",
							"Phong thng l謓h_T鑞g (Tng Qu﹏)",
							"Phong thng l謓h_Li猽 (Tng Qu﹏)"
};

--------------------------------------
--main()
--主函数
--------------------------------------
function main()
	if tonumber(date("%y%m%d%H")) >= 49053124 then
			Talk(1, "", "Th阨 gian ho箃 ng  h誸.");
			return 0;
	end
	if tonumber(date("%y%m%d%H")) < 09042400 then
		Talk(1, "", "Ho箃 ng n祔 v蒼 ch璦 m�.");
		return 0;
	end
-----判断等级----------------------------------------------------
	if GetLevel() < GSSTARS_ROLE_LEVEL_LIMIT then
		Talk(1, "", "V蒼 ch璦 t n c蕄 <color=yellow>" .. GSSTARS_ROLE_LEVEL_LIMIT .. "<color> c蕄 kh玭g th� tham d� ho箃 ng.");
		return 0;
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ph秈 gia nh藀 m玭 ph竔 m韎 c� th� tham gia ho箃 ng.")
		return 0;
	end
	
-----星期一至星期五----------------------------------------------
	Say(
		"Phi Y課 Ti猲 T�: Trong kho秐g th阨 gian 24-04-2009 n 24:00 31-05-2009, c竎 h� c� th� n g苝 ta  n﹏g c蕄 c竎 Ng玦 Sao B筩 th祅h Ng玦 Sao V祅g, chi ph� cho m鏸 l莕 n﹏g c蕄 l� 20 b筩.",
		7,
		"N﹏g c蕄 Ng玦 Sao B筩 th祅h Ng玦 Sao V祅g (C莕 30 ng玦 sao b筩 v� 20 b筩)/GSStarsLevelSToG",
		"200" .. "Dc th秓 qu﹏ d鬾g" .. "(C莕 1 Ng玦 Sao V祅g)/#GSStarsGetReward(1, 2, 0, 312, 200, 1, 0)",
		"200" .. "L骯 m筩h qu﹏ d鬾g" .. "(C莕 1 Ng玦 Sao V祅g)/#GSStarsGetReward(2, 2, 0, 309, 200, 1, 0)",
		"200" .. "Kho竛g th筩h qu﹏ d鬾g" .. "(C莕 1 Ng玦 Sao V祅g)/#GSStarsGetReward(3, 2, 0, 307, 200, 1, 0)",
		"200" .. "Linh huy誸 qu﹏ d鬾g" .. "(C莕 1 Ng玦 Sao V祅g)/#GSStarsGetReward(4, 2, 0, 313, 200, 1, 0)",
		"Trang k�.../Feiyanxianzi_talk_1",
		"T筰 h� ch� gh� ngang!/GSStarsDoNothing"
	)
end

--------------------------------------
--GSStarsLevelSToG()
--把银星星升级成金星星
--------------------------------------
function GSStarsLevelSToG()
-----判断背包和负重------------------------
	if gf_Judge_Room_Weight(1, 0, "Xin l鏸, ") == 0 then
		return 0
	end
-----钱不够--------	
	if GetCash() < GSSTARS_LEVEL_TO_GSTAR_MONEY then
		Talk(1, "", "Ng﹏ lng c馻 b筺 kh玭g !");
		return 0;
	end
-----银星星不够-------
	if DelItem(2, 1, 30077, GSSTARS_LEVEL_TO_GSTAR_NUM) ~= 1 then
		Say("Nguy猲 li謚 mang theo kh玭g !", 1, "Th藅 ng筰 qu�! T筰 h� s� quay l筰 sau./GSStarsDoNothing");
		return 0;
	end
	if Pay(GSSTARS_LEVEL_TO_GSTAR_MONEY) ~= 1 then
		WriteLog("[Ho箃 ng ng玦 sao v祅g ng玦 sao b筩 th竛g 4]:" .. GetName() .. "Chi tr�".. GSSTARS_LEVEL_TO_GSTAR_MONEY .. " xu th蕋 b筰");
		return 0;
	end
	
	local nRand = 0;
	nRand = random(1, 100);
	if nRand > 0 and nRand <= 80 then --80%的概率升级成功
		if AddItem(2, 1, 30076, 1) == 1 then
			Msg2Player("Thu 頲 1 Ng玦 Sao V祅g");			
			WriteLogEx("Hoat dong thang 4","n﹏g c蕄",1,"Ng玦 Sao V祅g")
		end
	else
		WriteLogEx("Hoat dong thang 4","n﹏g c蕄 th蕋 b筰",1,"Ng玦 Sao V祅g")
		Msg2Player("N﹏g c蕄 th祅h Ng玦 Sao V祅g th蕋 b筰!");
	end
	
	
end

--------------------------------------
--GSStarsGetReward()
--换取奖励
--------------------------------------
function GSStarsGetReward(nID, nMainType, nSecondryType, nDetailType, nCount, nGStars, nTimeLimit)
--	if GSStarsGetCurDay() == 0 or GSStarsGetCurDay() == 6 then 
--		Say("Hi猲 t筰 ch璦 th� i Ng玦 Sao V祅g", 1, "T筰 h� s� quay l筰 sau/GSStarsDoNothing");
--		return 0;
--	end
-----判断背包和负重------------------------
	if gf_Judge_Room_Weight(1, 200, "Xin l鏸, ") == 0 then
		return 0
	end
	
	if nGStars > 0 then
		if DelItem(2, 1, 30076, nGStars) ~= 1 then
			Say("Ng玦 Sao V祅g mang theo kh玭g !", 1, "Th藅 ng筰 qu�! T筰 h� s� quay l筰 sau./GSStarsDoNothing");
			return 0;
		end
	end
	local sItemName = GS_AWARD_PARAM[nID];
	local nResult, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount);
	if nResult == 1 then
		if nTimeLimit == 1 then --如果有使用期限 7 天
			SetItemExpireTime(nIndex, 7 * 24 * 60 * 60);
		end
		Msg2Player("B筺 nh薾 頲 ".. nCount .. "c竔" .. sItemName);
		WriteLogEx("Hoat dong thang 4","Ng玦 Sao V祅g",nCount,sItemName)
	end
end

function GSStarsDoNothing()
end

function Feiyanxianzi_talk_1()
	Say("", 11, 
			"200" .. "T� t籱 qu﹏ d鬾g" .. "(C莕 1 Ng玦 Sao V祅g)/#GSStarsGetReward(5, 2, 0, 311, 200, 1, 0)",
			"200" .. "G� qu﹏ d鬾g" .. "(C莕 1 Ng玦 Sao V祅g)/#GSStarsGetReward(6, 2, 0, 308, 200, 1, 0)",
			"200" .. "Thu閏 da qu﹏ d鬾g" .. "(C莕 1 Ng玦 Sao V祅g)/#GSStarsGetReward(7, 2, 0, 310, 200, 1, 0)",
			"фi th祅h " .. "Phong l謓h-trung c蕄" .. "(C莕 50 Ng玦 Sao V祅g)/#GSStarsGetReward(8, 2, 1, 1054, 1, 50, 1)",
			"фi th祅h " .. "Phong thng l謓h_T鑞g (Й Th鑞g)" .. "(C莕 100 Ng玦 Sao V祅g)/#GSStarsGetReward(9, 2, 1, 9990, 1, 100, 1)",
			"фi th祅h " .. "Phong thng l謓h_Li猽 (Й Th鑞g)" .. "(C莕 100 Ng玦 Sao V祅g)/#GSStarsGetReward(10, 2, 1, 9989, 1, 100, 1)",
			"фi th祅h " .. "Phong thng l謓h_T鑞g (Ti猲 Phong)" .. "(C莕 300 Ng玦 Sao V祅g)/#GSStarsGetReward(11, 2, 1, 9986, 1, 300, 1)",
			"фi th祅h " .. "Phong thng l謓h_Li猽 (Ti猲 Phong)" .. "(C莕 300 Ng玦 Sao V祅g)/#GSStarsGetReward(12, 2, 1, 9985, 1, 300, 1)",
			"Trang k�.../Feiyanxianzi_talk_2",
			"tr� l筰/main",
			"T筰 h� ch� gh� ngang!/GSStarsDoNothing"
			);
end

function Feiyanxianzi_talk_2()
	Say("", 8, 
			"фi th祅h " .. "Qu﹏ C玭g Чi" .. "(C莕 200 Ng玦 Sao V祅g)/#GSStarsGetReward(13, 2, 1, 9998, 1, 200, 1)",
			"фi th祅h " .. "S� tay s鑞g" .. "(C莕 500 Ng玦 Sao V祅g)/#GSStarsGetReward(14, 2, 19, 1, 1, 500, 1)",
			"фi th祅h " .. "T葃 T駓 linh n" .. "(C莕 600 Ng玦 Sao V祅g)/#GSStarsGetReward(15, 2, 0, 137, 1, 600, 1)",
			"фi th祅h " .. "B竧 B秓 T葃 T駓 Ti猲 Кn" .. "(C莕 800 Ng玦 Sao V祅g)/#GSStarsGetReward(16, 2, 0, 138, 1, 800, 1)",
			"фi th祅h " .. "Phong thng l謓h_T鑞g (Tng Qu﹏)" .. "(C莕 400 Ng玦 Sao V祅g)/#GSStarsGetReward(17, 2, 1, 9984, 1, 400, 1)",
			"фi th祅h " .. "Phong thng l謓h_Li猽 (Tng Qu﹏)" .. "(C莕 400 Ng玦 Sao V祅g)/#GSStarsGetReward(18, 2, 1, 9983, 1, 400, 1)",
			"tr� l筰/main",
			"T筰 h� ch� gh� ngang!/GSStarsDoNothing"
			);
end