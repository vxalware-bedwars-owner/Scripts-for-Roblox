-- X Key Autoclicker (30 CPS) - Position Aware
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Mouse = Players.LocalPlayer:GetMouse()

local TARGET_CPS = 30
local CLICK_DELAY = 1 / TARGET_CPS
local isClicking = false

local function clickAtPointer()
    if not isClicking then return end
    
    -- Get precise mouse data
    local target = Mouse.Target
    local hitPosition = Mouse.Hit.Position
    local viewportPoint = Vector2.new(Mouse.X, Mouse.Y)
    
    -- Handle different clickable types
    if target then
        if target:IsA("BasePart") then
            -- For 3D objects with ClickDetectors
            local clickDetector = target:FindFirstChildOfClass("ClickDetector")
            if clickDetector then
                fireclickdetector(clickDetector, 0)
            else
                mouse1click()
            end
        elseif target:IsA("GuiObject") then
            -- For GUI elements - click at center position
            local absolutePos = target.AbsolutePosition
            local absoluteSize = target.AbsoluteSize
            local clickPos = Vector2.new(
                absolutePos.X + absoluteSize.X/2,
                absolutePos.Y + absoluteSize.Y/2
            )
            mousemoveabs(clickPos.X, clickPos.Y)
            mouse1click()
        else
            -- Default click behavior
            mouse1click()
        end
    end
    
    -- Schedule next click
    task.delay(CLICK_DELAY, clickAtPointer)
end

-- Input handling
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.X then
        isClicking = true
        clickAtPointer()
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.X then
        isClicking = false
    end
end)

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "30 CPS Autoclicker",
    Text = "Hold X to activate",
    Duration = 5
})
