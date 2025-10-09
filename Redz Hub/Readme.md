# Redz Hub Library
**This documentation contains elements needed to make your own script with the Redz Hub UI Library**
## Booting the Library
```lua
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/Redz%20Hub/assets/UI%20Source.lua"))()
```

## Creating a Window
```lua
local Window = redzlib:MakeWindow({
    Title = "Redz Hub UI Library",
    SubTitle = "by SynthX",
    SaveFolder = "redzlibgui"
})
```

## Adding Icons 
```lua
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71014873973869", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})
```

## Adding Discord invites
```lua
MainTab:AddDiscordInvite({
    Name = "Name Hub",
    Description = "Join server",
    Logo = "rbxassetid://18751483361",
    Invite = "Link discord invite",
})
```

## Creating a Tab
```lua
local MainTab = Window:MakeTab({"Pro tab", "cherry"})
```

## Setting the themes
Dark
```lua
  redzlib:SetTheme("Dark")
```
Darker
```lua
  redzlib:SetTheme("Darker")
```
Purple
```lua
  redzlib:SetTheme("Purple")
```

## Adding a Main Tab
```lua
Window:SelectTab(MainTab)
```

## Creating a Section
```lua
local Section = MainTab:AddSection({"Section"})
```

## Adding Paragraphs
```lua
local Paragraph = MainTab:AddParagraph({"Paragraph", "This is a Paragraph\nSecond Line"})
```

## Creating Dialogs
```lua
local Dialog = Window:Dialog({
    Title = "Dialog",
    Text = "This is a Dialog",
    Options = {
        {"Confirm", function() print("Confirm") end},
        {"Maybe", function() print("Maybe") end},
        {"Cancel", function() print("Cancel") end}
    }
})
```

## Creating a Button
```lua
MainTab:AddButton({
    Name = "Print",
    Callback = function()
        print("Hello World!")
    end
})
```

## Making a Toggle
```lua
local Toggle1 = MainTab:AddToggle({
    Name = "Toggle",
    Description = "This is a <font color='rgb(88, 101, 242)'>Toggle</font> Example",
    Default = false,
    Callback = function(Value)
        print("Toggle is now:", Value)
    end
})
```

## A Second Toggle
```lua
local Toggle1 = MainTab:AddToggle({
    Name = "Toggle",
    Default = false,
    Callback = function(Value)
        print("Toggle is now:", Value)
    end
})
```

## Creating Sliders
```lua
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
```

## Adding a Dropdown
```lua
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
```

## Making a Textbox
```lua
MainTab:AddTextBox({
    Name = "Name item",
    Description = "1 Item on 1 Server", 
    PlaceholderText = "item only",
    Callback = function(Value)
        print("You entered:", Value)
    end
})
```

## Example 
![Image Alt](https://github.com/tbao143/Library-ui/blob/main/Screenshot_2025-02-13-22-22-32-885_com.roblox.client.vnggames.jpg)

## Credits
**Credits to Wayback Machine for helping me find the Source**
**Credits to Tbao Hub for the Doccumentation framework**
**© 2025 Made by SynthX**
