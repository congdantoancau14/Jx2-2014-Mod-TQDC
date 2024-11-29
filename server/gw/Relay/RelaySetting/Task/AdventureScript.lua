function TaskShedule()
	TaskName("T×m kho b¸u")
	TaskInterval(1)
	TaskCountLimit(0)
	randomseed(date("%d%H%M%S"));
end

function TaskContent()
	Aid = Random(320);
	Date = GetCurrentTime()

	success = SaveCustomDataToSDBOw("Adventure",Date, 0, "iis", Aid, 353,  "\\script\\item\\shanhesheji.lua");
	NotifySDBRecordChanged("Adventure", Date ,0 ,1);
	GlobalExecute("dw AddLocalNews([[Khu vùc nµo ®ã xuÊt hiÖn m¶nh S¬n Hµ X· T¾c, mäi ng­êi mau ®Õn t×m thö, thêi gian lµ 30 phót!]])");
	OutputMsg("T¹i"..Aid.."®iÓm, sinh ra 1 b¶o vËt!");

end

