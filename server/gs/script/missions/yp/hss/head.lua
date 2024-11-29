Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")

thisFile = "\\script\\missions\\yp\\hss\\mission.lua";

tbTBHSS = { 
	name = "Thæ Phån Hãa Sinh Tù",
--	timerID = 79,
	missionID = 80,
	realMapID = 6100,
	dynamicMap = 0,
	
	timerTriggerID = 1542,
	costomerID = 1542*2,
	tMapTrigger = {3014,3015,3016,3017},
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
tbTBHSS = gf_CopyInherit(missionHead, tbTBHSS)

firePhases = {
	timerID = 114,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7Ìì£¿
};
firePhases = gf_CopyInherit(phaseBase,firePhases)