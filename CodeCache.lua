--[[
	Yo bro you reading this, I just want to give credits to the scripthub script for the toggle button and stuff. Thanks!
]]
--> Services <--
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

--> ScriptHub V3 <--
loadstring(game:HttpGet("https://pastebin.com/raw/Yp993s7S", true))()

--> ScriptHub V3 Variables <--
local DiscordUI = CoreGui:FindFirstChild("Discord")
local DiscordUIMainFrame = DiscordUI:FindFirstChild("MainFrame")

--> ScriptHub V3 UI Setup <--
DiscordUI.Enabled = false
DiscordUIMainFrame.Position = UDim2.new(0.5, 0, -1, 0)

--> Toggle Variable <--
local ToggleState = false

--> Creates ScreenGui <--
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.Name = "ScriptHub V3 Toggle Button"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999
ScreenGui.Enabled = true 
ScreenGui.IgnoreGuiInset = false

--> Creates ImageButton <--
local imageButton = Instance.new("ImageButton")
imageButton.Parent = ScreenGui
imageButton.Name = "Toggle Button"
imageButton.Position = UDim2.new(0.5, 0, 2, 0)
imageButton.Size = UDim2.new(0, 50, 0, 50) -- FIXED SIZE TO AVOID STRETCHING
imageButton.Image = "rbxassetid://6031075938"
imageButton.BackgroundTransparency = 1
imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
imageButton.Draggable = true
imageButton.ZIndex = 999

--> Creates UICorner for Button <--
local imageButtonUICorner = Instance.new("UICorner")
imageButtonUICorner.Parent = imageButton
imageButtonUICorner.CornerRadius = UDim.new(1, 0) -- Makes it round

--> Blur Effect <--
local Blur = Instance.new("BlurEffect")
Blur.Name = "Blur Screen Effect"
Blur.Size = 0
Blur.Parent = Lighting

--> Blur Tweens <--
local BlurIn = TweenService:Create(Blur, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = 24})
local BlurOut = TweenService:Create(Blur, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = 0})

--> Toggle Button Animation <--
local ButtonTween = TweenService:Create(imageButton, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, 0, 0.035, 0)})
ButtonTween:Play()

--> Hide Button Blur Effect After Animation <--
ButtonTween.Completed:Connect(function()
    BlurOut:Play()
end)

--> UI Toggle Animation <--
local ShowUI = TweenService:Create(DiscordUIMainFrame, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, 0, 0.5, 0)})
local HideUI = TweenService:Create(DiscordUIMainFrame, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, 0, -1, 0)})

--> Toggle UI On Button Click <--
imageButton.MouseButton1Click:Connect(function()
    ToggleState = not ToggleState
    
    if ToggleState then
        DiscordUI.Enabled = true
        ShowUI:Play()
        BlurIn:Play()
    else
        HideUI:Play()
        BlurOut:Play()
        
        HideUI.Completed:Connect(function()
            if not ToggleState then
                DiscordUI.Enabled = false
            end
        end)
    end
end)
