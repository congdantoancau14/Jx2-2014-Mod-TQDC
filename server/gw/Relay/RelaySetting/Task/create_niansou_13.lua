function TaskShedule()
	TaskName("Kú L©n Du Xu©n");		
	TaskInterval(1440);	
	TaskTime(13,5);	
	TaskCountLimit(0);
end

function TaskContent()		
	GlobalExecute("dw call_niansou()")
end
