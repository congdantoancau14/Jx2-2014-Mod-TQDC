function main()
	local szNpcName = GetNpcName(GetTargetNpc());
	local tMsg = {
		["T¸n Phæ Kham Bè Quèc V­¬ng"] = "Ta th­êng hay ®i d¹o mét m×nh, suy nghÜ lµm sao ®Ó ph¸t triÓn quèc gia trong t­¬ng lai!",
		["Lý §øc Dùc Quèc V­¬ng"] = "ë trong thµnh thËt lµ buån ch¸n, kh«ng khÝ bªn ngoµi vÉn tèt h¬n!",
		["Lý Nguyªn Tr©n C«ng Chóa"] = "Ta muèn ë cïng víi ng­êi yªu m·i kh«ng xa rêi!",
		["§oµn Khinh HÇu Quèc V­¬ng"] = "Hy väng ng­êi d©n cña ta lu«n sèng trong h¹nh phóc!",
		["§oµn Ngäc Nhi C«ng Chóa"] = "N­íc ch¶y v« t×nh, ng­êi ta yªu l¹i kh«ng yªu ta.",
		["Sa Ca Ninh Bè V­¬ng Tö"] = "Ta muèn b¶o vÖ ng­êi yªu cña ta!",
	}
	Say(format("<color=green>%s<color>:%s", szNpcName, tMsg[szNpcName]), 0);
end