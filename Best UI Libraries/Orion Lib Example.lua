local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhdat4461/GUI-Library/refs/heads/main/Orion%20Library.lua", true))() -- boots library

local Window = OrionLib:MakeWindow({
	Name = "Orion Example",
	HidePremium = false,
	SaveConfig = false,
	ConfigFolder = "OrionExample",
	IntroText = "Example UI by SynthX"
}) -- make custom window

local Tab1 = Window:MakeTab({
	Name = "Features",
	Icon = "rbxassetid://10709762727",
	PremiumOnly = false
}) -- make a tab

local Section = Tab1:AddSection({
	Name = "Section"
}) -- make a section

Tab1:AddButton({
	Name = "Button",
	Callback = function()
		print("Clicked button")
	end    
}) -- make a button

Tab1:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(state)
		if state then
			print("executed")
		else
			print("unexecuted")
		end
	end    
}) -- make a toggle

Tab1:AddColorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(0, 0, 255),
	Callback = function(color)
		print("color: " .. tostring(color))
	end	  
}) -- a colorpicker

Tab1:AddSlider({
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
}) -- make slider

Tab1:AddTextbox({
	Name = "Textbox",
	Default = "Input stuff",
	TextDisappear = false,
	Callback = function(Value)
		print(Value)
	end	  
}) -- make textbox

Tab1:AddDropdown({
	Name = "Dropdown",
	Default = "...",
	Options = {"...", "You're gay"},
	Callback = function(Value)
		-- executes based on selected value
		if Value == "..." then
			print("nil.start code")
		elseif Value == "You're gay" then
			print("You're not gay")
		end
	end    
}) -- make a dropdown

local Tab2 = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
}) -- make another tab

Tab2:AddParagraph("Credits", "This Library is made by Sirius. Custom source by thanhdat4461 and example.lua by SynthX")
-- credits.lol
OrionLib:MakeNotification({
	Name = "Finished Loading!!",
	Content = "Thank you for using Orion Library. Press Left Control to toggle GUI",
	Image = "rbxassetid://10709762727",
	Time = 5
}) -- make execution notification

OrionLib:Init() -- finalize library
-- This is just an example. Official doccumentation with other features may be found at https://github.com/jensonhirst/Orion/blob/main/Documentation.md
