--[[
-->> Adding CFrame Speed bypass, New method of inf fly, and a health display <<--

local UserInputService = game:GetService("UserInputService")

if UserInputService.TouchEnabled then
    -- Night Extension for stuff
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/Night%20Modify/Night%20Extension.lua"))()
    -- Night Script loader
    loadstring(game:HttpGet("https://raw.githubusercontent.com/warprbx/NightRewrite/refs/heads/main/Night/Loader.luau"))()
    -- Mobile Keyboard (you NEED this for Night to work on mobile 💀)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt"))()
else
    -- Night Extension for stuff
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/Night%20Modify/Night%20Extension.lua"))()
    -- Night Script loader
    loadstring(game:HttpGet("https://raw.githubusercontent.com/warprbx/NightRewrite/refs/heads/main/Night/Loader.luau"))()
end
]]
