-- Roblox LocalScript for 30 CPS autoclicker (X key)
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local targetCPS = 30
local clickDelay = 1 / targetCPS  -- ~0.0333 seconds between clicks
local isClicking = false
local clickConnection

local function simulateClick()
    if not isClicking then return end
    
    -- Simulate mouse click
    mouse1click()
    
    -- Schedule next click
    task.delay(clickDelay, simulateClick)
end

local function handleInput(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.X then
        if input.UserInputState == Enum.UserInputState.Begin then
            -- Start clicking
            isClicking = true
            simulateClick()
        else
            -- Stop clicking
            isClicking = false
        end
    end
end

-- Set up input listeners
local beginConnection = UserInputService.InputBegan:Connect(handleInput)
local endConnection = UserInputService.InputEnded:Connect(handleInput)

-- Cleanup function
local function cleanup()
    isClicking = false
    if beginConnection then
        beginConnection:Disconnect()
    end
    if endConnection then
        endConnection:Disconnect()
    end
    if clickConnection then
        clickConnection:Disconnect()
    end
end

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "30 CPS Autoclicker",
    Text = "Hold X to activate",
    Duration = 5
})

-- Automatic cleanup
script.Destroying:Connect(cleanup)
