local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/BCC/Others/Orion%20src.lua'))()
local Window = OrionLib:MakeWindow({
    Name = "Bedwars Closet Cheat", 
    HidePremium = false, 
    SaveConfig = false, 
    ConfigFolder = "BCC", 
    IntroText = "BCC 4 Bedwars"
})

local Tab = Window:MakeTab({
	Name = "Closet",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab = Window:MakeTab({
	Name = "Blatant",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab = Window:MakeTab({
	Name = "Feature",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

OrionLib:MakeNotification({
	Name = "Injected",
	Content = "Successfuly injected BCC! Have fun!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
