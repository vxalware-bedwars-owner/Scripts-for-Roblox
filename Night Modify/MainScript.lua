-->> Adding Scaffold, CFrame Speed bypass, New method of inf fly requiring 1 block, and Creating seperate Extension <<--
-- Night Script loader
loadstring(game:HttpGet("https://raw.githubusercontent.com/warprbx/NightRewrite/refs/heads/main/Night/Loader.luau"))()
-- Vxalware Extension for stuff
loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware-Rewrite/refs/heads/main/Assets/Vxalware%20Extension.lua"))()
-- Antivoid (MADE BY ME NO SKIDDING PLZ !!1!1)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local VOID_Y = 10
local BOUNCE_HEIGHT = 125
local INDICATOR_Y = VOID_Y + 1

local function createVoidIndicator()
    local indicator = Instance.new("Part")
    indicator.Size = Vector3.new(99999, 1, 99999)
    indicator.Position = Vector3.new(0, INDICATOR_Y, 0)
    indicator.Anchored = true
    indicator.CanCollide = false
    indicator.Material = Enum.Material.ForceField
    indicator.Color = Color3.fromRGB(0, 0, 0)
    indicator.Transparency = 0

    indicator.Parent = game.Workspace
end

local function checkVoid()
    if humanoidRootPart.Position.Y < VOID_Y then
        humanoidRootPart.Velocity = Vector3.new(0, BOUNCE_HEIGHT, 0)
    end
end

_G.AntiVoidConnection = game:GetService("RunService").RenderStepped:Connect(checkVoid)

createVoidIndicator()

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)
