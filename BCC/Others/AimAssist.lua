local fov = 150
local smoothing = 1

local RunService = game:GetService("RunService")

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 1.5
FOVring.Radius = fov
FOVring.Transparency = 1
FOVring.Color = Color3.fromRGB(255, 128, 128)
FOVring.Position = workspace.CurrentCamera.ViewportSize/2

local function getClosest(cframe)
   local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
   
   local target = nil
   local mag = math.huge
   
   for i,v in pairs(game.Players:GetPlayers()) do
       if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer then
           -- Bedwars-specific enemy check
           local bedwarsTeam = v:GetAttribute("Team") or v:FindFirstChild("Team")
           local myTeam = game.Players.LocalPlayer:GetAttribute("Team") or game.Players.LocalPlayer:FindFirstChild("Team")
           
           if bedwarsTeam and myTeam and bedwarsTeam ~= myTeam then
               local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
               
               if magBuf < mag then
                   mag = magBuf
                   target = v
               end
           end
       end
   end
   
   return target
end

loop = RunService.RenderStepped:Connect(function()
   local UserInputService = game:GetService("UserInputService")
   local pressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
   local localPlay = game.Players.localPlayer.Character
   local cam = workspace.CurrentCamera
   local zz = workspace.CurrentCamera.ViewportSize/2
   
   if pressed then
       local Line = Drawing.new("Line")
       local curTar = getClosest(cam.CFrame)
       if curTar and curTar.Character and curTar.Character:FindFirstChild("Head") then
           local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
           ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
           if (ssHeadPoint - zz).Magnitude < fov then
               workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing)
           end
       end
   end
   
   if UserInputService:IsKeyDown(Enum.KeyCode.Delete) then
       loop:Disconnect()
       FOVring:Remove()
   end
end)
