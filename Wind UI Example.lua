local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))() -- loads Wind UI
WindUI:SetNotificationLower(true) -- sets notifications lower

local Window = WindUI:CreateWindow({
    Title = "Example UI",
    Icon = "moon-star",
    Author = "by SynthX",
    Folder = "Wind UI Example",
    
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = false,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("user check")
        end,
    },
    
    -- Optional: Can remove keysystem if you don't need
    KeySystem = { 
        -- NOT optional. Needed for script to recognise key
        Key = { "1234", "5678" },
        
        Note = "Example Key System.",
        
        -- Optional: Can remove if you don't need
        URL = "https://youtube.com/",
        
        SaveKey = false, -- automatically save and load the key.
    },
}) -- total window code

Window:SetToggleKey(Enum.KeyCode.K)
Window:EditOpenButton({
    Title = "Open Example UI",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = true,
    Enabled = true,
    Draggable = true,
}) -- extra customs

local Tab1 = Window:Tab({
    Title = "Features",
    Icon = "arrow-big-right",
    Locked = false,
}) -- features tab

local Section = Tab1:Section({ 
    Title = "Section",
    Box = false,
    TextTransparency = 0.05,
    TextXAlignment = "Left",
    TextSize = 17,
    Opened = true,
}) -- section

local Button = Tab1:Button({
    Title = "Button",
    Desc = "A button",
    Locked = false,
    Callback = function()
        print("Clicked button")
    end
}) -- a button

local Colorpicker = Tab1:Colorpicker({
    Title = "Colorpicker",
    Desc = "A Colorpicker",
    Default = Color3.fromRGB(0, 255, 0),
    Transparency = 0,
    Locked = false,
    Callback = function(color) 
        print("color: " .. tostring(color))
    end
}) -- a colourpicker

local Dropdown = Tab1:Dropdown({
    Title = "Dropdown (Multi)",
    Values = { "...", "You're gay", "You're not gay" },
    Value = { "..." },
    Multi = true,
    AllowNone = true,
    Callback = function(option)
        -- fetches the selected value
        print("Categories selected: " .. game:GetService("HttpService"):JSONEncode(option))

        -- executes based on selected values
        if table.find(option, "...") then
            print("...")
        end
        if table.find(option, "You're gay") then
            print("You're not gay")
        end
        if table.find(option, "You're not gay") then
            print("You're gay")
        end
    end
}) -- dropdown (i think i could do sumth simpler than this but whatever)

local Input = Tab1:Input({
    Title = "Input",
    Desc = "An Input",
    Value = "Default value",
    InputIcon = "bird",
    Type = "Input", -- or "Textarea"
    Placeholder = "Enter text...",
    Callback = function(input) 
        print("text entered: " .. input)
    end
}) -- Input

local Slider = Tab1:Slider({
    Title = "WalkSpeed",
    Step = 1,
    Value = {
        Min = 16,
        Max = 100,
        Default = 21,
    },
    Callback = function(value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            humanoid.WalkSpeed = value
            print("WalkSpeed set to:", value)
        else
            warn("Humanoid not found")
        end
    end
}) -- slider (change walkspeed)

local Toggle = Tab1:Toggle({
    Title = "Toggle",
    Desc = "A Toggle",
    Icon = "bird",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        if state then
            print("executed")
        else
            print("unexecuted")
        end
    end
}) -- toggle with easy logic

local Tab2 = Window:Tab({
    Title = "Credits",
    Icon = "arrow-big-right-dash",
    Locked = false,
}) -- second tab

local Paragraph = Tab2:Paragraph({
    Title = "Credits",
    Desc = "This example is made by SynthX. All credits go to footagesus for making this UI Library",
    Color = "Red",
    Image = "",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
    Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
}) -- paragraph
-- All credits go to footagesus for UI Library. Example.lua made by SynthX
