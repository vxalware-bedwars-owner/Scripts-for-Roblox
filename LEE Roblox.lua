-- HEADS UP! THIS SCRIPT IS STILL IN DEVELOPMENT!
local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local win = DiscordLib:Window("JJSploit SS | Scripts that support JJSploit. | Beta V1 release")
local serv = win:Server("Game Scripts!", "http://www.roblox.com/asset/?id=6031075938")

local btns = serv:Channel("Bedwars")

btns:Button("Voidware", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua", true))()
DiscordLib:Notification("Notification", "Executed Voidware", "Okay!")
end)
