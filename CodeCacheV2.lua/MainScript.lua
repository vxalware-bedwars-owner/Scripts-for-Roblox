local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"))()

local win = DiscordLib:Window("CodeCacheV2 Re-made by SynthX, A Nerd, and Vxalware")

local serv = win:Server("Preview", "http://www.roblox.com/asset/?id=6031075938")

local drops = serv:Channel("Blox Fruits")

local drop =
    drops:Dropdown(
    "Pick me!",
    {"Redzhub", "Ronix Hub", "Speed Hub X", "Alchemy Hub", "Kncrypt"},
    function(bool)
        print(bool)
    end
)
print("Finished loading! SCRIPT STILL IN DEVELOPMENT!")
