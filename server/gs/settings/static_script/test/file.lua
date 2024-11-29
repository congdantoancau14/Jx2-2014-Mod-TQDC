function WriteLogInfo(filePath, strFileName, strString)	
	local file = openfile(filePath..strFileName,  "w+")
	if file == nil then
		execute(format("mkdir -p %s", filePath))
		file = openfile(filePath..strFileName,  "w+")
	end
	write(file,tostring(strString));
	closefile(file);
end