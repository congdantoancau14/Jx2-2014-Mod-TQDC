--ÌìÒõ½Ì·ýÂ²
Include("\\script\\lib\\define.lua")

tInfo = {
	{3,"Kh¾c 4 ch÷ lín Nçi nhôc vâ l©m lªn mÆt cña h¾n, khiÕn h¾n gi·y giôa trong ®au ®ín.",},
	{5,"C¾t ®øt mét ®èt ngãn tay cña h¾n, kªu khãc trong ®au ®ín.",},
	{8,"Ng­¬i dïng søc bÎ g·y c¸c x­¬ng cña h¾n.",},
	{10,"Ng­¬i dïng søc ®¸nh g·y c¸c g©n m¹ch cña h¾n.",},
	{20,"Ng­¬i qu¸ tµn nhÉn råi, dµy vß h¾n ®Õn chÕt.",},
	}
	
	
function nothing()
end
	
function kill(nNpcIdx,n)
	if not tInfo[n] or not nNpcIdx then
		return 0;
	end
	Talk(1,"",tInfo[n][2]);
	local nCurNum = GetTask(TASKID_SW_TASK935_FINISH);
	SetTask(TASKID_SW_TASK935_FINISH,tInfo[n][1] + nCurNum);
	nCurNum = tInfo[n][1] + nCurNum
	if nCurNum >= 75 then
		Talk(2,"","Tï Binh Thiªn ¢m Gi¸o: Ta biÕt r»ng sÏ khã tho¸t ®­îc n¹n h«m nay, nh­ng dï ta cã chÕt còng kh«ng b¸n ®øng Thiªn ¢m Gi¸o. ChØ hËn bän vâ l©m nh©n sÜ....","Xem ra tªn tï binh ®· c¾n l­ìi tù tö råi. Nh­ng c©u nãi cuèi cïng cña h¾n lµ sao? ViÖc nµy cã liªn quan g× ®Õn vâ l©m nh©n sÜ?")
	end
end	
	
function main()
	local nNpcIdx = GetTargetNpc();
	local strtab = {
	"Kh¾c ch÷ trªn mÆt/#kill(" ..nNpcIdx ..",1)",
	"C¾t ®øt ngãn tay/#kill(" ..nNpcIdx ..",2)",
	"BÎ g·y x­¬ng khíp/#kill(" ..nNpcIdx ..",3)",
	"§¸nh g·y g©n m¹ch/#kill(" ..nNpcIdx ..",4)",
	"L¨ng tr×/#kill(" ..nNpcIdx ..",5)",
	"Hñy bá/nothing",
		}
	Say("Tï Binh Thiªn ¢m Gi¸o :",
		getn(strtab),
		strtab)
end