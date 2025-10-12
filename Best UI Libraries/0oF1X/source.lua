local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local library = {}
library._version = "0oF1X v1.0"

-- detect mobile
local function isMobile()
    return UserInputService.TouchEnabled and not UserInputService.MouseEnabled
end

-- utility tween
local function tween(instance, props, info)
    info = info or TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local ok, t = pcall(function() return TweenService:Create(instance, info, props) end)
    if ok and t then t:Play() end
    return t
end

-- create Gui
local function getParentGui()
    local success, core = pcall(function() return game:GetService("CoreGui") end)
    if success and core then
        return core
    else
        return LocalPlayer:WaitForChild("PlayerGui")
    end
end

-- Make icon
local function styleFrame(frame, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 12)
    corner.Parent = frame
end

-- create icon
local function pulse(instance)
    spawn(function()
        while instance and instance.Parent do
            tween(instance, {Size = instance.Size + UDim2.new(0,4,0,4)}, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true))
            task.wait(1.2)
        end
    end)
end

-- main MakeWindow
function library:MakeWindow(opts)
    opts = opts or {}
    local Name = opts.Name or "0oF1X Window"
    local IntroText = opts.IntroText or "Welcome"
    local SaveConfig = opts.SaveConfig or false

    local parentGui = getParentGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "0oF1X_UI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = parentGui

    -- containers
    local topContainer = Instance.new("Frame")
    topContainer.Name = "TopContainer"
    topContainer.Size = UDim2.new(1, 0, 0, 72)
    topContainer.Position = UDim2.new(0, 0, 0, 8)
    topContainer.AnchorPoint = Vector2.new(0,0)
    topContainer.BackgroundTransparency = 1
    topContainer.Parent = ScreenGui

    -- Toggle
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = "Toggle"
    toggleFrame.Size = UDim2.new(0, 48, 0, 48)
    toggleFrame.Position = UDim2.new(0.5, 0, 0, 12)
    toggleFrame.AnchorPoint = Vector2.new(0.5,0)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    toggleFrame.Parent = topContainer
    styleFrame(toggleFrame, 12)

    local toggleImage = Instance.new("ImageLabel")
    toggleImage.Name = "Icon"
    toggleImage.Size = UDim2.new(1, -10, 1, -10)
    toggleImage.Position = UDim2.new(0, 5, 0, 5)
    toggleImage.BackgroundTransparency = 1
    toggleImage.Image = "rbxassetid://4483345998"
    toggleImage.Parent = toggleFrame

    -- make toggle draggable
    do
        local dragging, dragStart, startPos, dragInput
        local function update(input)
            local delta = input.Position - dragStart
            toggleFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
        toggleFrame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = toggleFrame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                update(input)
            end
        end)
    end

    -- main
    local hubFrame = Instance.new("Frame")
    hubFrame.Name = "HubFrame"
    hubFrame.Size = UDim2.new(0, 640, 0, 420)
    hubFrame.Position = UDim2.new(0.5, -320, 0.25, 0)
    hubFrame.AnchorPoint = Vector2.new(0.5,0)
    hubFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    hubFrame.BorderSizePixel = 0
    hubFrame.Parent = ScreenGui
    styleFrame(hubFrame, 20)
    hubFrame.Visible = false
    hubFrame.ClipsDescendants = true

    -- header
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 52)
    header.Position = UDim2.new(0, 0, 0, 0)
    header.BackgroundTransparency = 0
    header.Parent = hubFrame
    styleFrame(header, 20)

    local headerLeft = Instance.new("TextLabel")
    headerLeft.Text = Name
    headerLeft.Font = Enum.Font.GothamBold
    headerLeft.TextSize = 18
    headerLeft.TextColor3 = Color3.fromRGB(240,240,240)
    headerLeft.BackgroundTransparency = 1
    headerLeft.Position = UDim2.new(0, 16, 0, 10)
    headerLeft.Size = UDim2.new(0.5, 0, 0, 30)
    headerLeft.Parent = header

    local headerSub = Instance.new("TextLabel")
    headerSub.Text = IntroText
    headerSub.Font = Enum.Font.Gotham
    headerSub.TextSize = 12
    headerSub.TextColor3 = Color3.fromRGB(180,180,180)
    headerSub.BackgroundTransparency = 1
    headerSub.Position = UDim2.new(0, 16, 0, 28)
    headerSub.Size = UDim2.new(0.5, 0, 0, 16)
    headerSub.Parent = header

    -- content container for tabs
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Size = UDim2.new(1, 0, 1, -52)
    content.Position = UDim2.new(0, 0, 0, 52)
    content.BackgroundTransparency = 1
    content.Parent = hubFrame

    -- tab content area
    local pagesFolder = Instance.new("Folder")
    pagesFolder.Name = "Pages"
    pagesFolder.Parent = content

    -- left column for tab buttons
    local leftColumn = Instance.new("Frame")
    leftColumn.Name = "LeftColumn"
    leftColumn.Size = UDim2.new(0, 160, 1, 0)
    leftColumn.Position = UDim2.new(0, 0, 0, 0)
    leftColumn.BackgroundTransparency = 1
    leftColumn.Parent = content

    local leftLayout = Instance.new("UIListLayout")
    leftLayout.Padding = UDim.new(0, 10)
    leftLayout.FillDirection = Enum.FillDirection.Vertical
    leftLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    leftLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    leftLayout.Parent = leftColumn

    -- right content area
    local rightArea = Instance.new("Frame")
    rightArea.Name = "RightArea"
    rightArea.Size = UDim2.new(1, -170, 1, 0)
    rightArea.Position = UDim2.new(0, 160, 0, 0)
    rightArea.BackgroundTransparency = 1
    rightArea.Parent = content

    -- table
    local tabs = {}
    local topRectContainer = Instance.new("Frame")
    topRectContainer.Name = "TopRectContainer"
    topRectContainer.Size = UDim2.new(1, -40, 0, 40)
    topRectContainer.Position = UDim2.new(0, 20, 0, 8)
    topRectContainer.BackgroundTransparency = 1
    topRectContainer.AnchorPoint = Vector2.new(0,0)
    topRectContainer.Parent = topContainer

    local listLayout = Instance.new("UIListLayout")
    listLayout.FillDirection = Enum.FillDirection.Horizontal
    listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    listLayout.Padding = UDim.new(0, 8)
    listLayout.Parent = topRectContainer

    -- arrow button
    local arrowFrame = Instance.new("Frame")
    arrowFrame.Size = UDim2.new(0, 34, 0, 34)
    arrowFrame.Position = UDim2.new(0, 8, 0, 4)
    arrowFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    arrowFrame.Parent = topContainer
    styleFrame(arrowFrame, 10)

    local arrowLabel = Instance.new("TextLabel")
    arrowLabel.Text = "❯"
    arrowLabel.Font = Enum.Font.GothamBold
    arrowLabel.TextSize = 20
    arrowLabel.TextColor3 = Color3.fromRGB(220,220,220)
    arrowLabel.BackgroundTransparency = 1
    arrowLabel.AnchorPoint = Vector2.new(0.5,0.5)
    arrowLabel.Size = UDim2.new(1, 0, 1, 0)
    arrowLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    arrowLabel.Parent = arrowFrame

    -- separation line
    local sep = Instance.new("Frame")
    sep.Size = UDim2.new(1, 0, 0, 6)
    sep.Position = UDim2.new(0, 0, 0, 56)
    sep.BackgroundTransparency = 0
    sep.Parent = topContainer
    local sepColor = Instance.new("UIGradient")
    sepColor.Rotation = 0
    sepColor.Color = ColorSequence.new(Color3.fromRGB(0,153,255), Color3.fromRGB(0,153,255))
    sepColor.Parent = sep
    -- fade out both sides via transparency sequence
    sepColor.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1),   
        NumberSequenceKeypoint.new(0.45, 0),
        NumberSequenceKeypoint.new(0.55, 0),
        NumberSequenceKeypoint.new(1, 1)    
    }
    sep.BackgroundTransparency = 0

    -- expand state
    local expanded = false
    local pcHoverEnabled = not isMobile()

    local function setHubVisible(on)
        if on then
            hubFrame.Visible = true
            hubFrame.Position = UDim2.new(0.5, -320, 0.25, 0)
            hubFrame.Size = UDim2.new(0, 20, 0, 20) -- start small
            tween(hubFrame, {Size = UDim2.new(0, 640, 0, 420), Position = UDim2.new(0.5, -320, 0.15, 0)}, TweenInfo.new(0.45, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out))
            tween(hubFrame, {BackgroundTransparency = 0}, TweenInfo.new(0.3))
        else
            tween(hubFrame, {Size = UDim2.new(0, 20, 0, 20), Position = UDim2.new(0.5, -10, -0.1, 0)}, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In))
            delay(0.35, function()
                if hubFrame then hubFrame.Visible = false end
            end)
        end
    end

    -- toggle click
    local toggleState = false
    local function togglePressed()
        toggleState = not toggleState
        -- rotate small bounce
        tween(toggleFrame, {BackgroundColor3 = toggleState and Color3.fromRGB(38, 90, 255) or Color3.fromRGB(28,28,28)}, TweenInfo.new(0.25))
        tween(toggleImage, {Rotation = toggleState and 12 or 0}, TweenInfo.new(0.2))
        setHubVisible(toggleState)
    end
    toggleFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            togglePressed()
        end
    end)

    -- arrow click toggles
    arrowFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            expanded = not expanded
            arrowLabel.Rotation = expanded and 90 or 0
            toggleState = expanded
            setHubVisible(expanded)
            tween(arrowFrame, {BackgroundColor3 = expanded and Color3.fromRGB(48,48,48) or Color3.fromRGB(30,30,30)}, TweenInfo.new(0.3))
        end
    end)

    -- rightshift toggle
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.RightShift then
            toggleState = not toggleState
            setHubVisible(toggleState)
            -- small flash on toggle
            tween(toggleFrame, {BackgroundColor3 = Color3.fromRGB(60,60,60)}, TweenInfo.new(0.12))
            delay(0.12, function()
                tween(toggleFrame, {BackgroundColor3 = Color3.fromRGB(28,28,28)}, TweenInfo.new(0.12))
            end)
        end
    end)

    -- hover to open for PC
    if pcHoverEnabled then
        topRectContainer.MouseEnter:Connect(function()
            expanded = true
            setHubVisible(true)
        end)
        topRectContainer.MouseLeave:Connect(function()
            -- small delay before collapsing
            delay(0.4, function()
                if not topRectContainer:IsMouseOver() and not hubFrame:IsMouseOver() then
                    expanded = false
                    setHubVisible(false)
                end
            end)
        end)
    end

    -- allow hub frame drag
    do
        local dragging, dragStart, startPos
        local dragInput
        local function update(input)
            local delta = input.Position - dragStart
            hubFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
        hubFrame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = hubFrame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                update(input)
            end
        end)
    end

    -- responsive sizing for mobile
    if isMobile() then
        hubFrame.Size = UDim2.new(0, 360, 0, 320)
        hubFrame.Position = UDim2.new(0.5, -180, 0.2, 0)
    else
        hubFrame.Size = UDim2.new(0, 640, 0, 420)
        hubFrame.Position = UDim2.new(0.5, -320, 0.15, 0)
    end

    -- API to create tabs
    local WindowAPI = {}

    function WindowAPI:MakeTab(tabData)
        tabData = tabData or {}
        local TabName = tabData.Name or "Tab"
        local Icon = tabData.Icon or ""
        local PremiumOnly = tabData.PremiumOnly or false

        -- create top
        local rect = Instance.new("Frame")
        rect.Name = "Rect_" .. TabName
        rect.Size = isMobile() and UDim2.new(0, 90, 0, 30) or UDim2.new(0, 120, 0, 34)
        rect.BackgroundColor3 = Color3.fromRGB(30,30,30)
        rect.Parent = topRectContainer
        styleFrame(rect, 10)

        local txt = Instance.new("TextLabel")
        txt.Text = TabName
        txt.Font = Enum.Font.GothamBold
        txt.TextSize = isMobile() and 12 or 13
        txt.TextColor3 = Color3.fromRGB(240,240,240)
        txt.BackgroundTransparency = 1
        txt.Size = UDim2.new(1, -12, 1, 0)
        txt.Position = UDim2.new(0, 8, 0, 0)
        txt.Parent = rect

        -- make top draggable
        do
            local dragging, dragStart, startPos, dragInput
            local function update(input)
                local delta = input.Position - dragStart
                rect.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
            rect.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    dragStart = input.Position
                    startPos = rect.Position
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end)
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    update(input)
                end
            end)
        end

        -- create page in hub
        local page = Instance.new("Frame")
        page.Name = "Page_" .. TabName
        page.Size = UDim2.new(1, 0, 1, 0)
        page.Position = UDim2.new(0, 0, 0, 0)
        page.BackgroundTransparency = 1
        page.Visible = false
        page.Parent = rightArea

        -- layout inside page
        local pageLayout = Instance.new("UIListLayout")
        pageLayout.Parent = page
        pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        pageLayout.Padding = UDim.new(0, 8)

        -- when clicking rect
        rect.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                setHubVisible(true)
                -- show/hide pages
                for _, c in ipairs(rightArea:GetChildren()) do
                    if c:IsA("Frame") then c.Visible = false end
                end
                page.Visible = true
                tween(rect, {BackgroundColor3 = Color3.fromRGB(52,52,52)}, TweenInfo.new(0.18))
                delay(0.2, function()
                    tween(rect, {BackgroundColor3 = Color3.fromRGB(30,30,30)}, TweenInfo.new(0.3))
                end)
            end
        end)

        -- hover expand individual
        if not isMobile() then
            rect.MouseEnter:Connect(function()
                tween(rect, {Size = UDim2.new(rect.Size.X.Scale, rect.Size.X.Offset + 6, rect.Size.Y.Scale, rect.Size.Y.Offset + 4)}, TweenInfo.new(0.18))
            end)
            rect.MouseLeave:Connect(function()
                tween(rect, {Size = rect.Size}, TweenInfo.new(0.18))
            end)
        end

        -- Tab API for adding elements
        local TabAPI = {}

        function TabAPI:AddSection(data)
            local title = Instance.new("TextLabel")
            title.Text = data.Name or "Section"
            title.Font = Enum.Font.GothamBold
            title.TextSize = 15
            title.TextColor3 = Color3.fromRGB(190, 220, 255)
            title.BackgroundTransparency = 1
            title.Size = UDim2.new(1, -20, 0, 24)
            title.Parent = page
            return title
        end

        function TabAPI:AddButton(data)
            local btn = Instance.new("TextButton")
            btn.Text = data.Name or "Button"
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.TextColor3 = Color3.fromRGB(240,240,240)
            btn.Size = UDim2.new(1, -20, 0, 34)
            btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
            btn.Parent = page
            styleFrame(btn, 10)
            btn.MouseButton1Click:Connect(function()
                pcall(function() if data.Callback then data.Callback() end end)
                tween(btn, {BackgroundColor3 = Color3.fromRGB(68, 68, 68)}, TweenInfo.new(0.08))
                delay(0.09, function() tween(btn, {BackgroundColor3 = Color3.fromRGB(40,40,40)}, TweenInfo.new(0.15)) end)
            end)
            return btn
        end

        function TabAPI:AddToggle(data)
            local container = Instance.new("Frame")
            container.Size = UDim2.new(1, -20, 0, 34)
            container.BackgroundTransparency = 1
            container.Parent = page

            local label = Instance.new("TextLabel")
            label.Text = data.Name or "Toggle"
            label.Font = Enum.Font.Gotham
            label.TextSize = 14
            label.TextColor3 = Color3.fromRGB(230,230,230)
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0, 6, 0, 6)
            label.Size = UDim2.new(0.75, 0, 1, 0)
            label.Parent = container

            local box = Instance.new("Frame")
            box.Size = UDim2.new(0, 36, 0, 22)
            box.Position = UDim2.new(1, -42, 0, 6)
            box.BackgroundColor3 = data.Default and Color3.fromRGB(58,150,255) or Color3.fromRGB(45,45,45)
            box.Parent = container
            styleFrame(box, 12)

            local state = data.Default or false
            box.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    state = not state
                    box.BackgroundColor3 = state and Color3.fromRGB(58,150,255) or Color3.fromRGB(45,45,45)
                    pcall(function() if data.Callback then data.Callback(state) end end)
                    tween(box, {Size = UDim2.new(0, 34, 0, 20)}, TweenInfo.new(0.08))
                    delay(0.08, function() tween(box, {Size = UDim2.new(0, 36, 0, 22)}, TweenInfo.new(0.08)) end)
                end
            end)
            return container
        end

        function TabAPI:AddColorpicker(data)
            local btn = Instance.new("TextButton")
            btn.Text = data.Name or "Colorpicker"
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.TextColor3 = Color3.fromRGB(240,240,240)
            btn.Size = UDim2.new(1, -20, 0, 34)
            btn.BackgroundColor3 = data.Default or Color3.fromRGB(0, 140, 255)
            btn.Parent = page
            styleFrame(btn, 10)
            btn.MouseButton1Click:Connect(function()
                pcall(function() if data.Callback then data.Callback(btn.BackgroundColor3) end end)
            end)
            return btn
        end

        function TabAPI:AddSlider(data)
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, -20, 0, 36)
            frame.BackgroundTransparency = 1
            frame.Parent = page

            local label = Instance.new("TextLabel")
            label.Text = data.Name .. ": " .. tostring(data.Default)
            label.Font = Enum.Font.Gotham
            label.TextSize = 13
            label.TextColor3 = Color3.fromRGB(230,230,230)
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, 0, 0, 16)
            label.Parent = frame

            local sliderBg = Instance.new("Frame")
            sliderBg.Size = UDim2.new(1, 0, 0, 12)
            sliderBg.Position = UDim2.new(0, 0, 0, 20)
            sliderBg.BackgroundColor3 = Color3.fromRGB(45,45,45)
            sliderBg.Parent = frame
            styleFrame(sliderBg, 8)

            local knob = Instance.new("Frame")
            knob.Size = UDim2.new(0, 16, 0, 12)
            knob.Position = UDim2.new(0, 0, 0, 0)
            knob.BackgroundColor3 = Color3.fromRGB(80,160,255)
            styleFrame(knob, 6)
            knob.Parent = sliderBg

            local min = data.Min or 0
            local max = data.Max or 100
            local step = data.Increment or 1
            local cur = data.Default or min

            local dragging = false
            local function updateFromPos(x)
                local absX = math.clamp(x - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
                local t = absX / sliderBg.AbsoluteSize.X
                local val = math.floor(((min + (max - min) * t) / step) + 0.5) * step
                cur = math.clamp(val, min, max)
                label.Text = data.Name .. ": " .. tostring(cur)
                knob.Position = UDim2.new((cur - min) / (max - min), 0, 0, 0)
                pcall(function() if data.Callback then data.Callback(cur) end end)
            end

            knob.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement or dragging and input.UserInputType == Enum.UserInputType.Touch then
                    updateFromPos(input.Position.X)
                end
            end)
            return frame
        end

        function TabAPI:AddTextbox(data)
            local tb = Instance.new("TextBox")
            tb.PlaceholderText = data.Name or "Textbox"
            tb.Text = data.Default or ""
            tb.Font = Enum.Font.Gotham
            tb.TextSize = 14
            tb.TextColor3 = Color3.fromRGB(240,240,240)
            tb.BackgroundColor3 = Color3.fromRGB(35,35,35)
            tb.Size = UDim2.new(1, -20, 0, 34)
            styleFrame(tb, 8)
            tb.Parent = page
            tb.FocusLost:Connect(function(enter)
                if data.Callback then pcall(data.Callback, tb.Text) end
            end)
            return tb
        end

        function TabAPI:AddDropdown(data)
            local container = Instance.new("Frame")
            container.Size = UDim2.new(1, -20, 0, 34)
            container.BackgroundTransparency = 1
            container.Parent = page

            local label = Instance.new("TextLabel")
            label.Text = data.Name .. ": " .. (data.Default or "")
            label.Font = Enum.Font.Gotham
            label.TextSize = 14
            label.TextColor3 = Color3.fromRGB(230,230,230)
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0, 6, 0, 6)
            label.Size = UDim2.new(1, -60, 1, 0)
            label.Parent = container

            local btn = Instance.new("TextButton")
            btn.Text = "v"
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 14
            btn.BackgroundColor3 = Color3.fromRGB(48,48,48)
            btn.Size = UDim2.new(0, 36, 0, 26)
            btn.Position = UDim2.new(1, -44, 0, 4)
            btn.Parent = container
            styleFrame(btn, 6)

            local menu = Instance.new("Frame")
            menu.Size = UDim2.new(0, 220, 0, (#(data.Options or {}) * 28))
            menu.Position = UDim2.new(0, 6, 0, 40)
            menu.BackgroundColor3 = Color3.fromRGB(28,28,28)
            menu.Visible = false
            menu.ClipsDescendants = true
            styleFrame(menu, 8)
            menu.Parent = page

            for i, opt in ipairs(data.Options or {}) do
                local optBtn = Instance.new("TextButton")
                optBtn.Size = UDim2.new(1, -8, 0, 26)
                optBtn.Position = UDim2.new(0, 4, 0, (i - 1) * 28)
                optBtn.BackgroundColor3 = Color3.fromRGB(36,36,36)
                optBtn.Font = Enum.Font.Gotham
                optBtn.Text = opt
                optBtn.TextColor3 = Color3.fromRGB(240,240,240)
                optBtn.Parent = menu
                styleFrame(optBtn, 6)
                optBtn.MouseButton1Click:Connect(function()
                    label.Text = data.Name .. ": " .. opt
                    menu.Visible = false
                    pcall(function() if data.Callback then data.Callback(opt) end end)
                end)
            end

            btn.MouseButton1Click:Connect(function()
                menu.Visible = not menu.Visible
                tween(menu, {Size = menu.Size}, TweenInfo.new(0.2))
            end)

            return container
        end

        function TabAPI:AddParagraph(title, content)
            local p = Instance.new("TextLabel")
            p.Text = title .. "\n" .. tostring(content)
            p.Font = Enum.Font.Gotham
            p.TextSize = 13
            p.TextColor3 = Color3.fromRGB(200,200,200)
            p.BackgroundTransparency = 1
            p.Size = UDim2.new(1, -20, 0, 60)
            p.TextWrapped = true
            p.Parent = page
            return p
        end

        -- add to tabs table and show first tab by default if none shown
        tabs[TabName] = { Rect = rect, Page = page, API = TabAPI }

        -- if first tab, show it
        if (#rightArea:GetChildren()) == 1 then
            page.Visible = true
        end

        return TabAPI
    end

    function WindowAPI:MakeNotification(data)
        pcall(function()
            game.StarterGui:SetCore("SendNotification", {
                Title = data.Name or "Notification",
                Text = data.Content or "",
                Duration = data.Time or 3,
                Icon = data.Image or nil
            })
        end)
    end

    function WindowAPI:Init()
        -- show small intro animation
        hubFrame.Visible = false
        tween(toggleFrame, {Rotation = 360}, TweenInfo.new(0.6))
        -- small spawn pop
        WindowAPI:MakeNotification({Name = "0oF1X", Content = "UI Loaded: " .. Name, Time = 3})
    end

    return WindowAPI
end

return library
