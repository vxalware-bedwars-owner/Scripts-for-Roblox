local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))() -- loads Wind UI
WindUI:SetNotificationLower(false) -- sets notifications lower

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
        -- Put key here
        Key = { "1234", "5678" },
        Note = "Example Key System.",
        URL = "https://youtube.com/",
        SaveKey = false, -- automatically save and load the key.
    },
}) -- Window

Window:SetToggleKey(Enum.KeyCode.K)
Window:SetIconSize(26)
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
}) -- Extras

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "circle-user-round",
    Locked = false,
}) -- Main Tab

local Section = MainTab:Section({ 
    Title = "Section",
    Box = false,
    TextTransparency = 0.05,
    TextXAlignment = "Left",
    TextSize = 17,
    Opened = true,
}) -- Section

local Button = MainTab:Button({
    Title = "Button",
    Desc = "A button",
    Locked = false,
    Callback = function()
        print("Clicked button")
    end
}) -- Button

local Colorpicker = MainTab:Colorpicker({
    Title = "Colorpicker",
    Desc = "A Colorpicker",
    Default = Color3.fromRGB(0, 0, 255),
    Transparency = 0,
    Locked = false,
    Callback = function(color) 
        print("color: " .. tostring(color))
    end
}) -- Colourpicker

local Dropdown = Tab1:Dropdown({
    Title = "Multi Dropdown",
    Values = { "None", "Example 1", "Example 2" },
    Value = { "None" },
    Multi = true,
    AllowNone = true,
    Callback = function(option)
        -- selected value
        print("Categories selected: " .. game:GetService("HttpService"):JSONEncode(option))
        -- executes selected values
        if table.find(option, "...") then
            print("None")
        end
        if table.find(option, "Example 1") then
            print("Example 1")
        end
        if table.find(option, "Example 2") then
            print("Example 2")
        end
    end
}) -- Dropdown

local Input = Tab1:Input({
    Title = "Input",
    Desc = "An Input",
    Value = "Default value",
    InputIcon = "arrow-right",
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
    Icon = "check",
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
    Image = "",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
    Buttons = {
        {
            Icon = "arrow-right",
            Title = "Ok",
            Callback = function() print("Thanks for using!") end,
        }
    }
}) -- paragraph

WindUI:Notify({
    Title = "Finished Loading!",
    Content = "Thank you for using Wind UI! Press 'K' to toggle GUI!",
    Duration = 5,
    Icon = "arrow-right",
}) -- notification
-- This is just an example. Official doccumentation with other features may be found at https://footagesus.github.io/WindUI-Docs/
