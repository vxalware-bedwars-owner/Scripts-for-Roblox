-- 30 CPS Autoclicker (Toggle with X)
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Mouse = Players.LocalPlayer:GetMouse()

-- Configuration
local TARGET_CPS = 30
local CLICK_DELAY = 1 / TARGET_CPS
local isActive = false
local clickConnection = nil

-- Click function
local function clickAtPointer()
    if not isActive then return end
    
    local target = Mouse.Target
    if target then
        if target:IsA("BasePart") then
            local clickDetector = target:FindFirstChildOfClass("ClickDetector")
            if clickDetector then
                fireclickdetector(clickDetector, 0)
            else
                mouse1click()
            end
        elseif target:IsA("GuiObject") then
            local center = target.AbsolutePosition + (target.AbsoluteSize/2)
            mousemoveabs(center.X, center.Y)
            mouse1click()
        else
            mouse1click()
        end
    end
    
    clickConnection = task.delay(CLICK_DELAY, clickAtPointer)
end

-- Toggle function
local function toggleAutoclicker()
    isActive = not isActive
    
    if isActive then
        clickAtPointer()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "30 CPS Autoclicker",
            Text = "Activated (Press X again to stop)",
            Duration = 3
        })
    else
        if clickConnection then
            task.cancel(clickConnection)
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "30 CPS Autoclicker",
            Text = "Deactivated",
            Duration = 2
        })
    end
end

-- Input handling
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.X then
        toggleAutoclicker()
    end
end)

-- Cleanup
script.Destroying:Connect(function()
    isActive = false
    if clickConnection then
        task.cancel(clickConnection)
    end
end)

-- Initial notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "30 CPS Autoclicker",
    Text = "Press X to toggle",
    Duration = 5
})
