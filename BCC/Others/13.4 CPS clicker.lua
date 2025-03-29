-- Roblox LocalScript for 13.4 CPS autoclicker
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local targetCPS = 13.4
local clickDelay = 1 / targetCPS
local isClicking = false
local connection

local function simulateClick()
    if not isClicking then return end
    
    -- Simulate mouse click
    mouse1click()
    
    -- Schedule next click
    task.delay(clickDelay, simulateClick)
end

local function handleInput(input, gameProcessed)
    if gameProcessed then return end
    
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if input.UserInputState == Enum.UserInputState.Begin then
            isClicking = true
            simulateClick()
        else
            isClicking = false
        end
    end
end

-- Initialize
connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    handleInput(input, gameProcessed)
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    handleInput(input, gameProcessed)
end)

-- Cleanup
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Autoclicker Loaded",
    Text = "Hold left click for 13.4 CPS",
    Duration = 5
})

-- Disconnect when script is destroyed
script.Destroying:Connect(function()
    if connection then
        connection:Disconnect()
    end
    isClicking = false
end)
