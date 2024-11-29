-- observer.lua
-- by windle
-- 观察者, 集中游戏事件, 封装变化

Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

ObserverImpt = {
	agents = {},
}

function ObserverImpt:register(id, name, ...)
	if not self.agents[id] then self.agents[id] = {} end
	if self.agents[id][name] then
		print(format("[ObserverImpt:register] [id=%s, name=%s] name already exist", tostring(id), tostring(name)))
		return nil
	end
	if getn(arg) == 1 then
		self.agents[id][name] = arg[1];
	else
		self.agents[id][name] = arg;
	end
	return 1
end

function ObserverImpt:unregister(id, name)
	if not self.agents[id] then return end
	if not self.agents[id][name] then return end
	print(format("[ObserverImpt:unregister] [id=%s, name=%s] %s", tostring(id), tostring(name), Val2Str(self.agents[id][name])))
	self.agents[id][name] = nil;
end

function ObserverImpt:onEvent(id, data)
	local agents = self.agents[id];
	if not agents then
		--print(format("[ObserverImpt:onEvent] [Error] [id = %d, data = %s]", id, Val2Str(data)));
		return nil;
	end
	
	for name, func in agents do
		local functype = type(func);
		if functype == "function" then
			func(id, data);
		elseif functype == "string" then
			local sCall = format("%s(%d, %s)", func, tonumber(id), Val2Str(data));
			dostring(sCall)
		elseif functype == "table" then
			local tCall = func;
			SendScript2VM(tCall[1], format("%s(%d, %s)", tCall[2], tonumber(id), Val2Str(data)));
		end
	end
end

function ObserverImpt:show_regs()
	print(format("reges of Observer:"))
	for id,reg in self.agents do
		print(format("reges of event %d:", id))
		for name, func in reg do
			print(format("%s of %d: %s", name, id, Val2Str(func)))
		end
	end
end

Include("\\script\\misc\\observer\\observer_functions.lua")