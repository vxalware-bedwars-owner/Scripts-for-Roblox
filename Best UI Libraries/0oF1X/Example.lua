local _0oF1X = loadstring(game:HttpGet("https://raw.githubusercontent.com/<yourusername>/<reponame>/main/0oF1X.lua", true))() -- boot lib

local Window = _0oF1X:MakeWindow({
	Name = "0oF1X Example",
	HidePremium = false,
	SaveConfig = false,
	ConfigFolder = "0oF1X Example",
	IntroText = "Example UI by SynthX"
}) -- make window

-- Tab 1
local Tab1 = Window:MakeTab({
	Name = "Features",
	Icon = "rbxassetid://10709762727"
})

local Section = Tab1:AddSection({
	Name = "Section"
}) -- section

Tab1:AddButton({
	Name = "Button",
	Callback = function()
		print("Clicked button")
	end    
}) -- buttn

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
}) -- toggle

Tab1:AddColorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(0, 0, 255),
	Callback = function(color)
		print("color: " .. tostring(color))
	end	  
}) -- colorpicker

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
}) -- slider

Tab1:AddTextbox({
	Name = "Textbox",
	Default = "Input stuff",
	TextDisappear = false,
	Callback = function(Value)
		print(Value)
	end	  
}) -- textbox

Tab1:AddDropdown({
	Name = "Dropdown",
	Default = "...",
	Options = {"...", "You're gay"},
	Callback = function(Value)
		if Value == "..." then
			print("nil.start code")
		elseif Value == "You're gay" then
			print("You're not gay")
		end
	end    
}) -- dropdown

-- Tab 2
local Tab2 = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab2:AddParagraph("Credits", "This Library is made by SynthX. All credits go to me! xd")

_0oF1X:MakeNotification({
	Name = "Finished Loading!!",
	Content = "Thank you for using 0oF1X. Press RightShift to toggle GUI",
	Time = 5
})

Window:Init()
-- I have made this library. You may use it for hosting your own code and stuff not copyright. Give credits if you can! :3
