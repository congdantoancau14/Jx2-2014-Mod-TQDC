Include("\\script\\lib\\string.lua")

function EventRigster(id, name, script, szfunc)
	local sCall = format("ObserverImpt:register(%d, %s, %s, %s)", tonumber(id), name, script, szfunc);
	SendScript2VM("\\script\\misc\\observer\\observer.lua", sCall);
end

function EventOnTrigger(id, data)
	local sCall = format("ObserverImpt:onEvent(%d, %s)", tonumber(id), Val2Str(data));
	SendScript2VM("\\script\\misc\\observer\\observer.lua", sCall);
end