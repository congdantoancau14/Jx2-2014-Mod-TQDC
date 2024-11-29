function TaskShedule()
	TaskName("NhiÖm vô b¶o hé tµi nguyªn");		
	TaskInterval(1440);	
	TaskTime(19,0);	
	TaskCountLimit(0);
end

function TaskContent()		
	GlobalExecute(format("dw conf_res_protect_info()"))
end
