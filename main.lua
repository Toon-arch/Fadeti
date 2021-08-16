local env
if getgenv then
	env = function()
		return getgenv()
	end
else
	env = function()
		return _G
	end
end

env().Fadeti_Events = env().Fadeti_Events or ({});

for index, value in pairs(env().Fadeti_Events) do
	if value and typeof(value) == "RBXScriptConnection" then
		pcall(value.Disconnect, value)
	end
end

local Import = function(Asset)
	if type(Asset) == "number" then
		return game:GetObjects("rbxassetid://" .. Asset)[1]
	else
		local Link = string.format("https://raw.githubusercontent.com/Toon-arch/Fadeti/main/Files/%s", Asset)
		local Response = game:HttpGetAsync(Link)
		local Function = loadstring(Response)
		local Success, Return = pcall(Function)
		if Success then
			return Return
		else
			warn("[Fadeti]: Failed to Import Asset " .. "'" .. Asset .. "'")
		end
	end
end

local Serv = setmetatable({}, {__index = function(self, index) return game:GetService(index) end})
local Players = Serv.Players
local RunService = Serv.RunService

local AddCon = function(name, notif, callback)
	name = name or "Name"
	callback = callback or function() end
	env().Fadeti_Events[tostring(name)] = RunService.Stepped:Connect(function()
		pcall(callback)
	end)
	if notif ~= nil then
		coroutine.wrap(notify)(tostring(notif))
	end
end

local DisCon = function(name, notif)
	name = name or "Name"
	for index, value in pairs(env().Fadeti_Events) do
		if value and typeof(value) == "RBXScriptConnection" and tostring(index) == tostring(name) then
			value:Disconnect()
		end
	end
	if notif ~= nil then
		coroutine.wrap(notify)(tostring(notif))
	end
end








local version = "1.0"
local plugin = {}

plugin.PluginName = string.format("Fadeti v%s", version)
plugin.PluginDescription = ""
plugin.Commands = {}

plugin.Commands["iyconsole"] = {
	ListName = ("iyconsole / iycon"),
	Description = ("Load Hunter's IY Console Script to run Infinite Yield commands in a rconsole window"),
	Aliases = {"iycon"},
	Function = function(args, speaker)
		Import("huntersRconsole.lua")
	end
}

return plugin








--[[
plugin.Commands["example"] = {
	ListName = ("name"),
	Description = ("desc"),
	Aliases = {},
	Function = function(args, speaker)
		
	end
}
]]--
