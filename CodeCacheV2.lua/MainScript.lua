local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"))()

local win = DiscordLib:Window("CodeCacheV2 Re-made by SynthX, A Nerd, and Vxalware")

local serv = win:Server("Game Scripts", "http://www.roblox.com/asset/?id=6031075938")

local drops = serv:Channel("Blox Fruits")

local drop =
    drops:Dropdown(
    "Blox Fruits Script Hubs 🍎",
    {"Redzhub", "Ronix Hub", "Speed Hub X", "Alchemy Hub", "Kncrypt"},
    function(selectedHub)
        -- Check which hub was selected and print the corresponding message
        if selectedHub == "Redzhub" then
            print("Successfully executed the redz hub script")
        elseif selectedHub == "Ronix Hub" then
            print("Successfully executed the ronix hub script")
        elseif selectedHub == "Speed Hub X" then
            print("Successfully executed the speed hub script")
        elseif selectedHub == "Alchemy Hub" then
            print("Successfully executed the alchemy hub script")
        elseif selectedHub == "Kncrypt" then
            print("Successfully executed the kncrypt script")
        end
    end
)
print("Finished loading! SCRIPT STILL IN DEVELOPMENT!")
