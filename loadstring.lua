-- local weblink = "https://raw.githubusercontent.com/Toon-arch/Fadeti/main/main.lua"; if syn then local req = syn.request({["Url"] = weblink}); success, response = true, req["Body"] else success,response = pcall(game.HttpGet, game, weblink, true) end; return loadstring(response)()
loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/Toon-arch/Fadeti/main/main.lua")))();
