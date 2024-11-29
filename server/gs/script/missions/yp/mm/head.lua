Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")

thisFile = "\\script\\missions\\yp\\mm\\mission.lua";

tbXXMM = { 
	name = "T©y H¹ Minh M«n",
--	timerID = 79,
	missionID = 79,
	realMapID = 6200,
	dynamicMap = 0,
	
	timerTriggerID = 1541,
	costomerID = 1541*2,
	tMapTrigger = {3008,3009,3010,3011,3012,3013},
	--ÒÔÏÂÎªmissionV±äÁ¿
	mv1 = 1, --1-10²Ø±¦Í¼µãµÄÎ»ÖÃ
	mv2 = 2,
	mv3 = 3,
	mv4 = 4,
	mv5 = 5,
	mv6 = 6,
	mv7 = 7,
	mv8 = 8,
	mv9 = 9,
	mv10 = 10,
	mv11 = 11, --±£»¤ÊÆÁ¦¿ª¹Ø
	mv12 = 12,   --¿¾»ðÊ±¼ä¶Î
	mv13 = 13,   --¿¾»ðÊ±¼äÈÕÆÚ
}
tbXXMM = gf_CopyInherit(missionHead, tbXXMM)

firePhases = {
	timerID = 113,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7Ìì£¿
};
firePhases = gf_CopyInherit(phaseBase,firePhases)
