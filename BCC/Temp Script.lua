--> Going to add No Fall, Inf jump, Antivoid, and stuff <--
local UserInputService = game:GetService("UserInputService")

getgenv().InjectionCounter1 = getgenv().InjectionCounter1 or 0
getgenv().InjectionCounter1 = getgenv().InjectionCounter1 + 1

if getgenv().InjectionCounter1 % 2 == 1 then
    -- Injection mode
    local success, result = pcall(function()
        -- Load the aim assist module (replace with your actual raw URL)
        local AimAssist = loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/BCC/Others/AimAssist.lua", true))()
        
        getgenv().AimAssist = AimAssist
        
        if AimAssist and not AimAssist.active then
            AimAssist.toggle(true)
        end
        
        return AimAssist
    end)
    
    if success then
        print("Aim Assist successfully injected")
    else
        warn("Injection failed:", result)
    end
else
    -- Uninjection mode
    if getgenv().AimAssist then
        if type(getgenv().AimAssist.uninject) == "function" then
            getgenv().AimAssist.uninject()
        else
            -- Fallback cleanup if uninject doesn't exist
            if getgenv().AimAssist.components then
                if getgenv().AimAssist.components.loop then
                    getgenv().AimAssist.components.loop:Disconnect()
                end
                if getgenv().AimAssist.components.FOVring then
                    getgenv().AimAssist.components.FOVring:Remove()
                end
            end
        end
        getgenv().AimAssist = nil
        print("Did Hacker thing 1")
    else
        warn("Failed to finished Hacker thing 1")
    end
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/BCC/Others/13.4%20CPS%20clicker.lua",true))()
print("Did Hacker thing 2")

loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/BCC/Others/30%20CPS%20Clicker.lua",true))()
print("Did Hacker thing 3")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌙Night Modified🌙",
   Icon = 0,
   LoadingTitle = "Night Modified 🌙",
   LoadingSubtitle = "Made by A Nerd",
   Theme = "DarkBlue",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = False,
      FolderName = nil,
      FileName = "Vxalware"
   },

   Discord = {
      Enabled = false,
      Invite = "Gam32vXVCW",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Key System",
      Subtitle = "VX KYS",
      Note = "Get key from discord: discord.gg/Gam32vXVCW",
      FileName = "Key_For_VX", 

      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"Vxalware On Top!"}
   }
})

Rayfield:Notify({
   Title = "Thanks for using Vxalware!",
   Content = "Hope you enjoy using this script",
   Duration = 6.5,
   Image = nil,
})

local MainTab = Window:CreateTab("🛠️ Utilities", nil)
local MainSection = MainTab:CreateSection("Animation Changer")

local Button = MainTab:CreateButton({
   Name = "Anim. Changer gui",
   Callback = function()

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Selenix-Animation-Changer-V1-17880"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "AntiHit Counter [BETA]",
   Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/N0t1z4pT"))()
   end,
})

local MainTab = Window:CreateTab("🌏 Universal GUIs", nil)
local MainSection = MainTab:CreateSection("Universal GUIs")

local Button = MainTab:CreateButton({
   Name = "Script Hub GUI",
   Callback = function()

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Animation-Changer-16049"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Mobile Keyboard",
   Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt"))()
   end,
})

local MainTab = Window:CreateTab("⚔️ Other stuff", nil)
local MainSection = MainTab:CreateSection("Other stuff")

local Button = MainTab:CreateButton({
   Name = "Pink Sword Texture",
   Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/fdmZVrFF"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Chat Bypasser [BETA]",
   Callback = function()

loadstring(game:HttpGet('https://pastebin.com/raw/BvPaPChX'))()
   end,
})
print("Did Hacker thing 4")
print("Injected")
