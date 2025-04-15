if isfolder("Night") then
    -- Folder exists, run the loader
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local function createGui(text)
        local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
        screenGui.Name = "VxalwareGui"

        local frame = Instance.new("Frame", screenGui)
        frame.Size = UDim2.new(0.2, 0, 0.05, 0)
        frame.Position = UDim2.new(0, 10, 1, -50)
        frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        frame.BorderSizePixel = 0

        local uiCorner = Instance.new("UICorner", frame)
        uiCorner.CornerRadius = UDim.new(0.2, 0)

        local textLabel = Instance.new("TextLabel", frame)
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = text
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = 14
        textLabel.TextScaled = true

        return screenGui
    end

    local loadingGui = createGui("Loading Night VX...")
    task.wait(1.9)
    loadingGui:Destroy()

    local startTime = tick()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/Night%20VX/Assets/Night%20Extension.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/warprbx/NightRewrite/refs/heads/main/Night/Loader.luau"))()

    local endTime = tick()
    local totalTime = math.floor(endTime - startTime)

    local finishedGui = createGui("Finished loading Night VX! Took: " .. totalTime .. " seconds")
    task.wait(2)
    finishedGui:Destroy()
else
    -- Create folder and dev file
    makefolder("Night")
    writefile("Night/Test.txt", game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/Night%20VX/Assets/Night%20VX%20ACL/Test.txt"))

    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local function createGui(text)
        local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
        screenGui.Name = "VxalwareGui"

        local frame = Instance.new("Frame", screenGui)
        frame.Size = UDim2.new(0.2, 0, 0.05, 0)
        frame.Position = UDim2.new(0, 10, 1, -50)
        frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        frame.BorderSizePixel = 0

        local uiCorner = Instance.new("UICorner", frame)
        uiCorner.CornerRadius = UDim.new(0.2, 0)

        local textLabel = Instance.new("TextLabel", frame)
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = text
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = 14
        textLabel.TextScaled = true

        return screenGui
    end

    local loadingGui = createGui("Loading Night VX...")
    task.wait(1.9)
    loadingGui:Destroy()

    local startTime = tick()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/Night%20VX/Assets/Night%20Extension.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/warprbx/NightRewrite/refs/heads/main/Night/Loader.luau"))()

    local endTime = tick()
    local totalTime = math.floor(endTime - startTime)

    local finishedGui = createGui("Finished loading Night VX! Took: " .. totalTime .. " seconds")
    task.wait(2)
    finishedGui:Destroy()
end
