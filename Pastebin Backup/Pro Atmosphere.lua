local lighting = game:GetService("Lighting")

local atmosphere = Instance.new("Atmosphere")
atmosphere.Parent = lighting

atmosphere.Density = 0.2
atmosphere.Offset = 0
atmosphere.Color = Color3.fromRGB(80, 120, 200)
atmosphere.Decay = Color3.fromRGB(40, 60, 100)

lighting.TimeOfDay = "21:00:00"
lighting.Brightness = 2
lighting.Ambient = Color3.fromRGB(60, 90, 150)
lighting.OutdoorAmbient = Color3.fromRGB(70, 100, 180)
lighting.FogStart = 200
lighting.FogEnd = 1200
lighting.FogColor = Color3.fromRGB(90, 130, 200)

local bloom = Instance.new("BloomEffect")
bloom.Parent = lighting
bloom.Intensity = 0.3
bloom.Threshold = 0.8
bloom.Size = 30

print("Brighter night atmosphere applied!")
