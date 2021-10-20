local Plugin = {}

Plugin.PluginName = "Infinite Extension"
Plugin.PluginDescription = "random crap go!!"
Plugin.Commands = {}

local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local EventPackage = "IE_Package_Events"
local reqenv = function() return (getgenv() or _G) end

reqenv()[EventPackage] = reqenv()[EventPackage] or {}

for index, value in pairs(reqenv()[EventPackage]) do
	if value and typeof(value) == "RBXScriptConnection" then
		pcall(value.Disconnect, value)
	end
end

local AddCon = function(name, func)
	reqenv()[EventPackage][tostring(name)] = RunService.RenderStepped:Connect(function()
		pcall(func)
	end)
end

local DisCon = function(name)
	if reqenv()[EventPackage][tostring(name)] == nil then return end
	reqenv()[EventPackage][tostring(name)]:Disconnect()
	reqenv()[EventPackage][tostring(name)] = nil
end

Plugin.Commands["loopday"] = {
	["ListName"] = ("loopday / lday"),
	["Description"] = ("Loop making in-game time set to Day"),
	["Aliases"] = {"lday"},
	["Function"] = function(args, speaker)
		AddCon("Perm-Day", function()
			execCmd("day")
		end)
	end
}

Plugin.Commands["unloopday"] = {
	["ListName"] = ("unloopday / unlday"),
	["Description"] = ("Stop the loop from making the in-game time set to Day"),
	["Aliases"] = {"unlday"},
	["Function"] = function(args, speaker)
		DisCon("Perm-Day")
	end
}

Plugin.Commands["loopnight"] = {
	["ListName"] = ("loopnight / lnight"),
	["Description"] = ("Loop making in-game time set to Night"),
	["Aliases"] = {"lnight"},
	["Function"] = function(args, speaker)
		AddCon("Perm-Night", function()
			execCmd("night")
		end)
	end
}

Plugin.Commands["unloopnight"] = {
	["ListName"] = ("unloopnight / unlnight"),
	["Description"] = ("Stop the loop from making the in-game time set to Night"),
	["Aliases"] = {"unlnight"},
	["Function"] = function(args, speaker)
		DisCon("Perm-Night")
	end
}

Plugin.Commands["loopnofog"] = {
	["ListName"] = ("loopnofog / lnofog"),
	["Description"] = ("Loop removing in-game fog"),
	["Aliases"] = {"lnofog"},
	["Function"] = function(args, speaker)
		AddCon("No-Fog", function()
			execCmd("nofog")
		end)
	end
}

Plugin.Commands["unloopnofog"] = {
	["ListName"] = ("unloopnofog / unlnofog"),
	["Description"] = ("Stop the loop from removing in-game fog"),
	["Aliases"] = {"unlnofog"},
	["Function"] = function(args, speaker)
		DisCon("No-Fog")
	end
}

return Plugin
