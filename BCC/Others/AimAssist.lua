-- Store all script components in a table for easy cleanup
local AimAssist = {
    fov = 150,
    smoothing = 1,
    components = {},
    active = true
}

-- Initialize function
local function initAimAssist()
    -- Create FOV ring
    AimAssist.components.FOVring = Drawing.new("Circle")
    local FOVring = AimAssist.components.FOVring
    FOVring.Visible = true
    FOVring.Thickness = 1.5
    FOVring.Radius = AimAssist.fov
    FOVring.Transparency = 1
    FOVring.Color = Color3.fromRGB(255, 128, 128)
    FOVring.Position = workspace.CurrentCamera.ViewportSize/2

    -- Target finding function
    local function getClosest(cframe)
        local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
        local target, mag = nil, math.huge
        
        for _, v in pairs(game.Players:GetPlayers()) do
            if v.Character and 
               v.Character:FindFirstChild("Head") and 
               v.Character:FindFirstChild("Humanoid") and 
               v.Character:FindFirstChild("HumanoidRootPart") and 
               v ~= game.Players.LocalPlayer and 
               v.Team ~= game.Players.LocalPlayer.Team then
                
                local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
                if magBuf < mag then
                    mag = magBuf
                    target = v
                end
            end
        end
        return target
    end

    -- Main loop
    AimAssist.components.loop = game:GetService("RunService").RenderStepped:Connect(function()
        if not AimAssist.active then return end
        
        local UserInputService = game:GetService("UserInputService")
        local pressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        local cam = workspace.CurrentCamera
        local screenCenter = cam.ViewportSize / 2
        
        if pressed then
            local curTar = getClosest(cam.CFrame)
            if curTar and curTar.Character and curTar.Character:FindFirstChild("Head") then
                local headPos, onScreen = cam:WorldToScreenPoint(curTar.Character.Head.Position)
                local ssHeadPoint = Vector2.new(headPos.X, headPos.Y)
                if onScreen and (ssHeadPoint - screenCenter).Magnitude < AimAssist.fov then
                    cam.CFrame = cam.CFrame:Lerp(
                        CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), 
                        AimAssist.smoothing
                    )
                end
            end
        end
    end)
end

-- Uninject function
function AimAssist.uninject()
    if AimAssist.components.loop then
        AimAssist.components.loop:Disconnect()
    end
    if AimAssist.components.FOVring then
        AimAssist.components.FOVring:Remove()
    end
    AimAssist.active = false
    warn("Aim assist successfully uninjected")
end

-- Toggle function
function AimAssist.toggle(state)
    if state == nil then
        state = not AimAssist.active
    end
    AimAssist.active = state
    return AimAssist.active
end

-- Initialize on load
initAimAssist()

-- Example usage:
-- To uninject: AimAssist.uninject()
-- To toggle: AimAssist.toggle() or AimAssist.toggle(true/false)

-- Optional: Bind to Delete key
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        AimAssist.uninject()
    end
end)

return AimAssist
