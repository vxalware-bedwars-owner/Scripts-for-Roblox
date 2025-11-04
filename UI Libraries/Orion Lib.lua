local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhdat4461/GUI-Library/refs/heads/main/Orion%20Library.lua", true))() -- loads Orion

local Window = OrionLib:MakeWindow({
	Name = "Orion Example",
	HidePremium = false,
	SaveConfig = false,
	ConfigFolder = "OrionExample",
	IntroText = "Example UI by SynthX"
}) -- Window

local MainTab = Window:MakeTab({
	Name = "Features",
	Icon = "rbxassetid://10709762727",
	PremiumOnly = false
}) -- Tab

local Section = MainTab:AddSection({
	Name = "Section"
}) -- Section

MainTab:AddButton({
	Name = "Button",
	Callback = function()
		print("Clicked button")
	end    
}) -- Button

MainTab:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(state)
		if state then
			print("executed")
		else
			print("unexecuted")
		end
	end    
}) -- Toggle

MainTab:AddColorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(0, 0, 255),
	Callback = function(color)
		print("color: " .. tostring(color))
	end	  
}) -- Colourpicker

MainTab:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 100,
	Default = 21,
	Color = Color3.fromRGB(0, 0, 255),
	Increment = 1,
	ValueName = "speed",
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
}) -- Slider

MainTab:AddTextbox({
	Name = "Textbox",
	Default = "Input stuff",
	TextDisappear = false,
	Callback = function(Value)
		print(Value)
	end	  
}) -- Input

MainTab:AddDropdown({
	Name = "Dropdown",
	Default = "None",
	Options = {"None", "Example 1"},
	Callback = function(Value)
		if Value == "None" then
			print("None")
		elseif Value == "Example 1" then
			print("Example 1")
		end
	end    
}) -- Dropdown

local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
}) -- Credits Tab

CreditsTab:AddParagraph("Credits", "This Library is made by Sirius. Custom source by thanhdat4461 and example by SynthX")
-- Paragraph
OrionLib:MakeNotification({
	Name = "Finished Loading!!",
	Content = "Thank you for using Orion Library. Press Left Control to toggle GUI",
	Image = "rbxassetid://10709762727",
	Time = 5
}) -- Notification

OrionLib:Init() -- Finish script
-- This is just an example. Official doccumentation with other features may be found at https://github.com/jensonhirst/Orion/blob/main/Documentation.md
