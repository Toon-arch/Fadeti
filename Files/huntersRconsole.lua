loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"), "IY_FE") "discord.gg/dYHag43eeU"
local cls = function()
    rconsoleclear()
    rconsoleprint("@@WHITE@@")
    rconsolename("Infinite Yield")
    rconsoleprint("\nInfinite Yield\n\nType in the command and click enter. (No prefix needed)\n\n")
end
coroutine.wrap(function(Hunter, on, top)
    while true do
        rconsoleprint(">")
        local str = rconsoleinput()
        if str:lower() == "cls" then
            cls()
        else
            coroutine.wrap(xpcall)(execCmd, function(msg)
                rconsolewarn(debug.traceback("Running the '" .. str .. "' command caused an error:\n" .. msg), rconsoleprint("\n"))
            end, str)
        end
    end
end)(cls(), Hunter, was, here)
