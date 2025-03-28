local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
    Name = "Bedwars Closet Cheat", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "BCC", 
    IntroText = "BCC 4 Bedwars"
})

-- Closet Tab
local ClosetTab = Window:MakeTab({
    Name = "Closet",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

ClosetTab:AddToggle({
    Name = "AimAssist",
    Default = false,
    Callback = function(Value)
        print("AimAssist toggled:", Value)
        -- Add your AimAssist functionality here
    end    
})

-- Blatant Tab
local BlatantTab = Window:MakeTab({
    Name = "Blatant",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Features Tab
local FeaturesTab = Window:MakeTab({
    Name = "Features",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

OrionLib:MakeNotification({
	Name = "BCC Notification",
	Content = "BCC Has Injected Successfully! Have Fun!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

-- Initialize the UI
OrionLib:Init()
