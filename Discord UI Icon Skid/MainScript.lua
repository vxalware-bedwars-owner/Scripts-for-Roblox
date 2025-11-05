local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"))() -- loads Discord UI
local Window = DiscordLib:Window("Discord UI Icon Skid from ScriptHub V3") -- Window
local Server = Window:Server("Features", "http://www.roblox.com/asset/?id=6031075938") -- Server

local MainTab = Server:Channel("Main") -- Main Tab
MainTab:Button("Button", function()
  print("Clicked button")
end) -- Button

MainTab:Toggle("Toggle", false, function(state)
	if state then
		print("executed")
	else
		print("unexecuted")
	end
end) -- Toggle

MainTab:Slider("Slider (WalkSpeed)", 16, 100, 21, function(value)
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	if not player then
		warn("LocalPlayer not found")
		return
	end

	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = value
		print("WalkSpeed set to:", value)
	else
		warn("Humanoid not found")
	end
end) -- Slider

MainTab:Dropdown("Dropdown", { "None", "Example 1" }, function(option)
	if option == "None" then
		print("None")
	elseif option == "Example 1" then
		print("Example 1")
	end
end) -- Dropdown

MainTab:Colorpicker("Colorpicker", Color3.fromRGB(255, 1, 1), function(color)
	print("color: " .. tostring(color))
end) -- Colorpicker

MainTab:Textbox("Textbox", "Enter text...", true, function(input)
	print("text entered: " .. input)
end) -- Textbook

local CreditsTab = Server:Channel("Credits") -- Credits Tab
CreditsTab:Label("This example is made by SynthX. Script provided by dawidscripts (library author).") -- Labe;

CreditsTab:Button("Notification", function()
	DiscordLib:Notification("Notification", "This is a notification", "Okay")
end) -- Notification
-- This is just an example. Official example with other features may be found at https://github.com/weakhoes/Roblox-UI-Libs/blob/main/Discord%20UI%20Lib/Discord%20Lib%20Example.lua
