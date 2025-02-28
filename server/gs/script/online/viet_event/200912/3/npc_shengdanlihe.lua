--=============================================
--create by baiyun 2009.11.25
--describe:越南版12月份活动 圣诞礼盒NPC脚本文件
--============================================

Include("\\script\\online\\viet_event\\200912\\event_head.lua")

function main()
    local nNpcIndex = GetTargetNpc();
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_DATE) < nDate then
        SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT, 0);
    end
    if GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT) >= VIET_0912_SHENGDANLIHE_MAX_COUNT then
        Talk(1, "", "H玬 nay i hi謕 s� d鬾g ph莕 thng thu 頲 gi韎 h筺 cao nh蕋, xin i ng祔 mai s� d鬾g ti誴.");
        return 0;
    end
    if GetTime() - GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_TIME) < 300 then
        Talk(1, "", format("Чi hi謕 c莕 ph秈 i th猰  %d gi﹜ m韎 c� th� ti誴 t鬰 nh薾 thng", (300 - GetTime() + GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_TIME))));
        return 0;
    end
    SetNpcLifeTime(nNpcIndex, 0);
    
    CustomAwardGiveGroup("WinterBoss_Box", 0);	
    
    SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_DATE, nDate);
    SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT, GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT) + 1);
    SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_TIME, GetTime());
    ModifyExp(100000)
    WriteLogEx("Hoat dong thang 12","nh薾 thng h閜 qu�",100000,"甶觤 kinh nghi謒")
end
