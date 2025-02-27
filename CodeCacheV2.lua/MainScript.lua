local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"))()
local win = DiscordLib:Window("CodeCacheV2 Re-made by SynthX, A Nerd, and Vxalware")
local serv = win:Server("Game Scripts", "http://www.roblox.com/asset/?id=6031075938")

local scripts = {
    fruitscripts = {
        Redzhub = loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))(),
        Ronix = loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b5f968ca22436160479678e830766cc4.lua"))(),
        Speed = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))(),
        Alchemy = loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))(),
        Kncrypt = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Kncrypt/refs/heads/main/sources/BloxFruit.lua"))()
    },
    bedwarscripts = {
        VoidPaste = loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua", true))(),
        Vxalware = loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware-Rewrite/refs/heads/main/Vxware-Bedwars.lua"))(),
        AuroraGPT = loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/Aurora/main/Aurora_Loader"))(),
        VapeV4 = loadstring(game:HttpGet("https://raw.githubusercontent.com/sstvskids/VapeV4ForRoblox/main/NewMainScript.lua", true))(),
        Alsploit = loadstring(game:HttpGet("https://dpaste.com/BQ7GD3DD2.txt", true))(),
        Night = loadstring(game:HttpGet("https://raw.githubusercontent.com/warprbx/NightRewrite/refs/heads/main/Night/Loader.luau"))()
    }
}

local drop =
    drops:Dropdown("Blox Fruits Script Hubs 🍎", scripts.fruitscripts,
    function(value)
        for i,v in pairs(scripts.fruitscripts) do
            if v == value then
                loadstring(v)()
            end
        end
    end
)

local drop =
    drops:Dropdown("Bedwars Scripts 🛏️", scripts.bedwarscripts,
    function(value)
        for i,v in pairs(scripts.bedwarscripts) do
            if v == value then
                loadstring(v)()
            end
        end
    end
)