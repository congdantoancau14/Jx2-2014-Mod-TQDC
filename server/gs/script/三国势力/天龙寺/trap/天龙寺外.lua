Include("\\script\\lib\\define.lua")

function main()
	SetFightState(1);
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 2 or nCamp == 3 then
		Msg2Player("LÝnh g¸c cöa ®ang tËp trung nh×n vÒ ®©y, cã lÏ ®¹i hiÖp kh«ng ®­îc hoan nghªnh, hay lµ h·y l¸nh mÆt tr­íc!");
		SetPos(1456,2773);
		return 0;
	end
end