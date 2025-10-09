local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/Redz%20Hub/assets/UI%20Source.lua"))()

local Window = redzlib:MakeWindow({
    Title = "Redz Hub UI Library",
    SubTitle = "by SynthX",
    SaveFolder = "redzlibgui"
})

local MainTab = Window:MakeTab({"Pro tab", "cherry"})

MainTab:AddDiscordInvite({
    Name = "Name Hub",
    Description = "Join server",
    Logo = "rbxassetid://18751483361",
    Invite = "Link discord invite",
})

local Section = MainTab:AddSection({"Section"})

local Paragraph = MainTab:AddParagraph({"Paragraph", "This is a Paragraph\nSecond Line"})

MainTab:AddButton({
    Name = "Print",
    Callback = function()
        print("Hello World!")
    end
})

local Toggle1 = MainTab:AddToggle({
    Name = "Toggle",
    Description = "This is a <font color='rgb(88, 101, 242)'>Toggle</font> Example",
    Default = false,
    Callback = function(Value)
        print("Toggle is now:", Value)
    end
})

MainTab:AddSlider({
    Name = "Speed",
    Min = 1,
    Max = 100,
    Increase = 1,
    Default = 16,
    Callback = function(Value)
        local Player = game.Players.LocalPlayer
        if Player and Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = Value
        end
    end
})

MainTab:AddDropdown({
    Name = "Players List",
    Description = "Select the <font color='rgb(88, 101, 242)'>Number</font>",
    Options = {"one", "two", "three"},
    Default = "two",
    Flag = "dropdown test",
    Callback = function(Value)
        if Value == "one" then
            print("You selected 1")
        elseif Value == "two" then
            print("You selected 2")
        elseif Value == "three" then
            print("You selected 3")
        end
    end
})

MainTab:AddTextBox({
    Name = "Name item",
    Description = "1 Item on 1 Server", 
    PlaceholderText = "item only",
    Callback = function(Value)
        print("You entered:", Value)
    end
})

local Dialog = Window:Dialog({
    Title = "Dialog",
    Text = "This is a Dialog",
    Options = {
        {"Confirm", function() print("Confirm") end},
        {"Maybe", function() print("Maybe") end},
        {"Cancel", function() print("Cancel") end}
    }
})
