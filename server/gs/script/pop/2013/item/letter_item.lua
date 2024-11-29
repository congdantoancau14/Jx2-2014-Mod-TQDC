Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\lib\\message.lua")

g_tLetterMsg = {
	[[红印亲鉴：忆昔日得到中原，与君参研佛法，收获颇丰。更与君惺惺，高山流水，有大自在。每思君当日音容笑貌，如在昨日。君再邀我入中原，吾亦心向往之。只是世俗纷争，无非因果轮回，不欲涉足过深，恐有碍于佛法修行。但若有不利于君者，定竭尽所能，以报昔日拳拳之情。吾将不日抵达坠龙山，望能得再次与君印证佛法之缘，吾之幸矣。沙罗顿首
	]],
}

function OnUse(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	suSay(g_tLetterMsg[1],
		1,
		"K誸 th骳 i tho筰/nothing")
end
