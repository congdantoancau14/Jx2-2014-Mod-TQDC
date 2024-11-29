function TaskShedule()
	TaskName("Kú L©n Du Xu©n");		
	TaskInterval(1440);	
	TaskTime(23,1);	
	TaskCountLimit(0);
end

function TaskContent()		
	GlobalExecute(format("dw call_niansou(%d)",2))
end
