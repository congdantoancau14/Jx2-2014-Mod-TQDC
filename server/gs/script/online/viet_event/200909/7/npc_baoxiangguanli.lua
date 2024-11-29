--=============================================
--create by baiyun 2009.8.24
--describe:越南版9月份中秋活动宝箱管理脚本
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")
function main()
	--do return end
	local tb_dialog = {
		"T筰 h� mu鑞 nh薾 B竎h B秓 Rng/get_baibaoxiang",
		"T筰 h� mu鑞 nh薾 1 C萴 nang i s� ki謓/get_jinnang",
		"K誸 th骳 i tho筰/nothing",
	};
	Say("<color=green>Qu秐 l� b秓 rng: <color>S� ki謓 B竎h B秓 Rng di詎 ra t� 19-09-2009 n 24:00 25-10-2009. Trong th阨 gian ho箃 ng, m鏸 ng祔 c竎 h� c� th� nh薾 mi詎 ph� 1 B竎h B秓 Rng. Rng th� c� th� mua th猰 t� Ng� C竎 . B竎h B秓 Rng l� n琲 c蕋 gi� t遖n b� nh鱪g v藅 ph萴 c馻 v� l﹎ t� nguy猲 li謚, v藅 ph萴 thu th藀, dc ph萴, trang b�, v� kh� �<enter>L璾 � l� m鏸 nh﹏ v藅 ch� c� th� nh薾 mi詎 ph� 1 B竎h B秓 Rng trong 1 ng祔 v� m鏸 ng祔 ch� c� th� m� t鑙 產 8 B竎h B秓 Rng", getn(tb_dialog), tb_dialog);
end

function get_baibaoxiang()
	local nDate = tonumber(date("%y%m%d"));
	if GetLevel() < 70 then
		Talk(1, "", "<color=green>Qu秐 l� b秓 rng: <color>C蕄 70 tr� l猲 m韎 c� th� nh薾 B竎h B秓 Rng. Thi誹 hi謕 h穣 c� g緉g th猰 nh�!");
		return 0;
	end
	if GetTask(VIET_0909_TASK_GET_BOX_DATE) >= nDate then
		Talk(1, "", "<color=green>Qu秐 l� b秓 rng: <color>H玬 nay thi誹 hi謕  nh薾 Rng r錳, kh玭g th� nh薾 th猰 頲 n鱝.");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, "<color=green>Qu秐 l� b秓 rng: <color>") ~= 1 then 
		return 0;
	end
	local nRetCode, nIndex = gf_AddItemEx({2, 1, 30111, 1}, "B竎h B秓 Rng");
	if nRetCode == 1 then
		SetItemExpireTime(nIndex, 15 * 24 * 3600);
		SetTask(VIET_0909_TASK_GET_BOX_DATE, nDate);
	end
end

function get_jinnang()
	if GetItemCount(2, 1, 30045) >= 1 then
		Talk(1, "", "<color=green>Qu秐 l� b秓 rng:<color>C竎 h�  nh薾 C萴 nang i s� ki謓 r錳, kh玭g th� nh薾 th猰 頲 n鱝.");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, "<color=green>Qu秐 l� b秓 rng: <color>") ~= 1 then 
		return 0;
	end
	gf_AddItemEx({2, 1, 30045, 1}, "C萴 Nang Чi S� Ki謓");
end

function nothing()

end