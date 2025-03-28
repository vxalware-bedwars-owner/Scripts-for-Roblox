local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/BCC/Others/Orion%20src.lua'))()
local Window = OrionLib:MakeWindow({
    Name = "Bedwars Closet Cheat", 
    HidePremium = false, 
    SaveConfig = false, 
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
        getgenv().InjectionCounter1 = getgenv().InjectionCounter1 or 0
        getgenv().InjectionCounter1 = getgenv().InjectionCounter1 + 1
        
        if getgenv().InjectionCounter1 % 2 == 1 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/main/BCC/Others/AimAssist.lua", true))()
        else
            if loop then
                loop:Disconnect()
                loop = nil
            end
            
            if FOVring then
                FOVring:Remove()
                FOVring = nil
            end
            
            print("Aimbot script successfully uninjected.")
        end
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
