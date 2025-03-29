-- Left Click Autoclicker (13.4 CPS) - Position Aware
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Mouse = Players.LocalPlayer:GetMouse()

local TARGET_CPS = 13.4
local CLICK_DELAY = 1 / TARGET_CPS
local isClicking = false

local function clickAtPointer()
    if not isClicking then return end
    
    -- Get mouse position data
    local target = Mouse.Target
    local hitPosition = Mouse.Hit.Position
    
    -- For GUI elements (alternative method)
    local guiTarget = Mouse.Target
    if guiTarget and guiTarget:IsA("GuiObject") then
        -- This will click the GUI element directly
        local absolutePos = guiTarget.AbsolutePosition
        local absoluteSize = guiTarget.AbsoluteSize
        local clickPos = Vector2.new(
            absolutePos.X + absoluteSize.X/2,
            absolutePos.Y + absoluteSize.Y/2
        )
        mousemoveabs(clickPos.X, clickPos.Y)
    end
    
    -- Perform the click
    mouse1click()
    
    -- Schedule next click
    task.delay(CLICK_DELAY, clickAtPointer)
end

-- Input handling
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isClicking = true
        clickAtPointer()
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isClicking = false
    end
end)

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Pointer Autoclicker (13.4 CPS)",
    Text = "Hold Left Click to activate",
    Duration = 5
})
