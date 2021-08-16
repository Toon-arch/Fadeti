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
		local Link = string.format("https://raw.githubusercontent.com/Toon-arch/Fadeti/main/main.lua/%s", Asset)
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

local version = "1.0"
local plugin = {}

plugin.PluginName = string.format("Fadeti v%s", version)
plugin.PluginDescription = ""
plugin.Commands = {}

plugin.Commands["example"] = {
	ListName = ("name"),
	Description = ("desc"),
	Aliases = {},
	Function = function(arguments, speaker)

	end
};
