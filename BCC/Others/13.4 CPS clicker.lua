-- Precise 13.4 CPS Autoclicker (R Key) - Position Aware
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Mouse = Players.LocalPlayer:GetMouse()

-- Configuration
local TARGET_CPS = 13.4
local CLICK_DELAY = 1 / TARGET_CPS  -- ~0.0746 second delay
local isClicking = false
local clickConnection = nil

-- Precise click function
local function clickAtPointer()
    if not isClicking then return end
    
    -- Get mouse data
    local target = Mouse.Target
    local viewportPoint = Vector2.new(Mouse.X, Mouse.Y)
    
    -- Handle different target types
    if target then
        if target:IsA("BasePart") then
            -- For 3D objects
            local clickDetector = target:FindFirstChildOfClass("ClickDetector")
            if clickDetector then
                fireclickdetector(clickDetector, 0)
            else
                mouse1click()
            end
        elseif target:IsA("GuiObject") then
            -- For GUI elements
            local centerX = target.AbsolutePosition.X + (target.AbsoluteSize.X/2)
            local centerY = target.AbsolutePosition.Y + (target.AbsoluteSize.Y/2)
            mousemoveabs(centerX, centerY)
            mouse1click()
        else
            mouse1click()
        end
    end
    
    -- Schedule next click with precise timing
    if isClicking then
        clickConnection = task.delay(CLICK_DELAY, clickAtPointer)
    end
end

-- Input handling
local function handleInput(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.R then
        if input.UserInputState == Enum.UserInputState.Begin then
            -- Start clicking
            isClicking = true
            clickAtPointer()
        else
            -- Stop clicking
            isClicking = false
            if clickConnection then
                task.cancel(clickConnection)
                clickConnection = nil
            end
        end
    end
end

-- Set up event listeners
UserInputService.InputBegan:Connect(handleInput)
UserInputService.InputEnded:Connect(handleInput)

-- Cleanup function
local function cleanup()
    isClicking = false
    if clickConnection then
        task.cancel(clickConnection)
    end
end

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "13.4 CPS Autoclicker",
    Text = "Hold R to activate - Clicks at pointer",
    Duration = 5
})

-- Script cleanup
script.Destroying:Connect(cleanup)
