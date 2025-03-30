-- Fixed injection counter logic
getgenv().InjectionCounter1 = (getgenv().InjectionCounter1 or 0) + 1
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lplr = Players.LocalPlayer

if getgenv().InjectionCounter1 % 2 == 1 then
    -- Injection mode
    print("Injecting features...")
    
    -- 1. Aim Assist Injection
    local success, result = pcall(function()
        local AimAssist = loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/main/BCC/Others/AimAssist.lua", true))()
        getgenv().AimAssist = AimAssist
        if AimAssist and not AimAssist.active then
            AimAssist.toggle(true)
        end
    end)
    if not success then warn("Aim Assist failed:", result) end

    -- 2. No Fall Damage
    getgenv().NoFallConnection = getgenv().NoFallConnection or nil
    if getgenv().NoFallConnection then
        getgenv().NoFallConnection:Disconnect()
    end
    getgenv().NoFallConnection = RunService.Heartbeat:Connect(function()
        if lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") then
            local velocity = lplr.Character.HumanoidRootPart.Velocity
            if velocity.Y < -70 then
                lplr.Character.HumanoidRootPart.Velocity = Vector3.new(velocity.X, -10, velocity.Z)
            end
        end
    end)
    print("No Fall Damage enabled")

    -- 3. AntiVoid
    local antiVoidSuccess, antiVoidErr = pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/spkhZwBT",true))()
    end)
    if not antiVoidSuccess then warn("AntiVoid failed:", antiVoidErr) end

else
    -- Cleanup mode
    print("Cleaning up injections...")
    
    -- 1. Aim Assist Cleanup
    if getgenv().AimAssist then
        if type(getgenv().AimAssist.uninject) == "function" then
            getgenv().AimAssist.uninject()
        else
            if getgenv().AimAssist.components then
                if getgenv().AimAssist.components.loop then
                    getgenv().AimAssist.components.loop:Disconnect()
                end
                if getgenv().AimAssist.components.FOVring then
                    getgenv().AimAssist.components.FOVring:Destroy()
                end
            end
        end
        getgenv().AimAssist = nil
    end

    -- 2. No Fall Damage Cleanup
    if getgenv().NoFallConnection then
        getgenv().NoFallConnection:Disconnect()
        getgenv().NoFallConnection = nil
    end
end

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
print("BCC Successful Inject")
