local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/sstvskids/Scripts-for-Roblox/refs/heads/main/libs/gui.lua"))()
local win = DiscordLib:Window("CodeCacheV2 remade by stav")
local serv = win:Server("Game Scripts", "http://www.roblox.com/asset/?id=6031075938")
local core = {
    tabs = {
        bloxfruits = serv:Channel("Blox-Fruits"),
        bedwars = serv:Channel("Bedwars")
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
    gettable(DiscordLib.scripts.fruitscripts),
    function(value)
        local url = DiscordLib.scripts.fruitscripts[value]
        loadstring(game:HttpGet(url))()
    end
)

core.tabs.bloxfruits:Dropdown(
    "Bedwars Scripts 🛏️",
    gettable(DiscordLib.scripts.bedwarscripts),
    function(value)
        local url = DiscordLib.scripts.bedwarscripts[value]
        loadstring(game:HttpGet(url))()
    end
)