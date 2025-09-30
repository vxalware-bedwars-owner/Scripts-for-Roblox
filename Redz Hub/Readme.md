# Redz Hub Library
**This documentation is for the stable release of Redz Hub Library**
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
Tab1:AddDiscordInvite({
    Name = "Name Hub",
    Description = "Join server",
    Logo = "rbxassetid://18751483361",
    Invite = "Link discord invite",
})
```


## Creating a Tab
```lua
local Tab1 = Window:MakeTab({"Pro tab", "cherry"})
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
Window:SelectTab(Tab1)
```
## Creating a Section
```lua
local Section = Tab1:AddSection({"Section"})
```

## Adding Paragraphs
```lua
local Paragraph = Tab1:AddParagraph({"Paragraph", "This is a Paragraph\nSecond Line"})
```
## Creating Dialogs
```lua
  local Dialog = Window:Dialog({
    Title = "Dialog",
    Text = "This is a Dialog",
    Options = {
      {"Confirm", function()
        
      end},
      {"Maybe", function()
        
      end},
      {"Cancel", function()
        
      end}
    }
  })
```
## Creating a Button
```lua
Tab1:AddButton({"Print", function(Value)
print("Hello World!")
end})
```
## Making a Toggle
```lua
local Toggle1 = Tab1:AddToggle({
  Name = "Toggle",
  Description = "This is a <font color='rgb(88, 101, 242)'>Toggle</font> Example",
  Default = false 
})
Toggle1:Callback(function(Value)
 
end)
```



## A Second Toggle
```lua
Tab1:AddToggle({
    Name = "Toggle",
    Default = false,
    Callback = function(v)

    end
})
```



## Creating Sliders
```lua
Tab1:AddSlider({
  Name = "Speed",
  Min = 1,
  Max = 100,
  Increase = 1,
  Default = 16,
  Callback = function(Value)
  
  end
})
```

## Adding a Dropdown
```lua
local Dropdown = Tab1:AddDropdown({
  Name = "Players List",
  Description = "Select the <font color='rgb(88, 101, 242)'>Number</font>",
  Options = {"one", "two", "three"},
  Default = "two",
  Flag = "dropdown teste",
  Callback = function(Value)
    
  end
})
```

## Making a Textbox
```lua
Tab1:AddTextBox({
  Name = "Name item",
  Description = "1 Item on 1 Server", 
  PlaceholderText = "item only",
  Callback = function(Value)
    
  end
})
```
## Example 
![Image Alt](https://github.com/tbao143/Library-ui/blob/main/Screenshot_2025-02-13-22-22-32-885_com.roblox.client.vnggames.jpg)

## Credits
**Credits to Wayback Machine for helping me find the Source**
**Credits to Tbao Hub for the Doccumentation framework**
**© 2025 Made by SynthX**
