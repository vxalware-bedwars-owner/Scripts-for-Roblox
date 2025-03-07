local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/sstvskids/Scripts-for-Roblox/refs/heads/main/libs/gui.lua"))()
local win = DiscordLib:Window("CodeCacheV2 Re-made by SynthX, A Nerd, and Vxalware")
local serv = win:Server("Game Scripts", "http://www.roblox.com/asset/?id=6031075938")
local core = {
    tabs = {
        bloxfruits = serv:Channel("Blox-Fruits"),
        bedwars = serv:Channel("Bedwars")
    }
}

local scripts = {
    fruitscripts = {
        Redzhub = "https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua",
        Ronix = "https://api.luarmor.net/files/v3/loaders/b5f968ca22436160479678e830766cc4.lua",
        Speed = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",
        Alchemy = "https://scripts.alchemyhub.xyz",
        Kncrypt = "https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Kncrypt/refs/heads/main/sources/BloxFruit.lua"
    },
    bedwarscripts = {
        VoidPaste = "https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua",
        Vxalware = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware-Rewrite/refs/heads/main/Vxware-Bedwars.lua",
        AuroraGPT = "https://raw.githubusercontent.com/cocotv666/Aurora/main/Aurora_Loader",
        VapeV4 = "https://raw.githubusercontent.com/sstvskids/VapeV4ForRoblox/main/NewMainScript.lua",
        Alsploit = "https://dpaste.com/BQ7GD3DD2.txt",
        Night = "https://raw.githubusercontent.com/warprbx/NightRewrite/refs/heads/main/Night/Loader.luau"
    }
}

local function gettable(v)
    local tables = {}
    for i, _ in pairs(v) do
        table.insert(tables, i)
    end
    return tables
end

core.tabs.bloxfruits:Dropdown(
    "Blox Fruits Script Hubs 🍎",
    gettable(scripts.fruitscripts),
    function(value)
        local url = scripts.fruitscripts[value]
        loadstring(game:HttpGet(url))()
    end
)

core.tabs.bloxfruits:Dropdown(
    "Bedwars Scripts 🛏️",
    gettable(scripts.bedwarscripts),
    function(value)
        local url = scripts.bedwarscripts[value]
        loadstring(game:HttpGet(url))()
    end
)