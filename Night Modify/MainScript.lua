-->> Adding Scaffold, CFrame Speed bypass, New method of inf fly, and a health display <<--

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Function to create the GUI
local function createGui(text)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player:WaitForChild("PlayerGui")
    screenGui.Name = "VxalwareGui"

    local frame = Instance.new("Frame")
    frame.Parent = screenGui
    frame.Size = UDim2.new(0.2, 0, 0.05, 0) -- Adjust size
    frame.Position = UDim2.new(0, 10, 1, -50) -- Bottom-left corner
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Dark mode
    frame.BorderSizePixel = 0
    frame.Visible = true

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0.2, 0)
    uiCorner.Parent = frame

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = frame
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 14
    textLabel.TextScaled = true

    return screenGui
end

-- Show "Loading Vxalware..."
local loadingGui = createGui("Loading Night...")
task.wait(1.9) -- Wait for 1.9 seconds
loadingGui:Destroy() -- Remove GUI

-- Start execution timer
local startTime = tick()

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

-- Calculate execution time
local endTime = tick()
local totalTime = math.floor(endTime - startTime) -- Calculate total time

-- Show "Finished loading Vxalware! Took: X seconds"
local finishedGui = createGui("Finished loading Night! Took: " .. totalTime .. " seconds")
task.wait(2) -- Keep the final message visible for a bit
finishedGui:Destroy() -- Remove final GUI
