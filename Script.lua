repeat task.wait() until game:IsLoaded()
local Wizard = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Wizard:NewWindow("Dead Rails")
local Section = Window:NewSection("Main")
Section:CreateButton("Noclip Camera", function()
for _, v in pairs(getgc()) do
if type(v) == 'function' and getfenv(v).script == game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("ZoomController"):WaitForChild("Popper") then
for i, v1 in pairs(getconstants(v)) do
if tonumber(v1) == .25 then
setconstant(v, i, 0)
elseif tonumber(v1) == 0 then
setconstant(v, i, .25)
end
end
end
end
end)
Section:CreateButton("Third Person", function()
game:GetService("Players").LocalPlayer.CameraMode = "Classic"
end)
Section:CreateButton("First Person", function()
game:GetService("Players").LocalPlayer.CameraMode = "LockFirstPerson"
end)
Section:CreateButton("Unlimited Zoom", function()
game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 999999999
end)
Section:CreateButton("Touch Interest", function()
local function touch(x)
x = x:FindFirstAncestorWhichIsA("Part")
if x then
if firetouchinterest then
task.spawn(function()
firetouchinterest(x, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 1)
wait()
firetouchinterest(x, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 0)
end)
end
x.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
end
end
local name = tostring(1)
for _, descendant in ipairs(workspace:GetDescendants()) do
if descendant:IsA("TouchTransmitter") or descendant.Name == name or descendant.Parent.Name == name then
touch(descendant)
end
end
end)
Section:CreateTextbox("Enter a HitBox", function(num)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v ~= game:GetService("Players").LocalPlayer and v.Character.HumanoidRootPart then
local sizeArg = 1
local Size = Vector3.new(sizeArg,sizeArg,sizeArg)
local Root = v.Character.HumanoidRootPart
if Root:IsA("BasePart") then
if sizeArg == 1 then
Root.Size = Vector3.new(num,num,num)
Root.Transparency = 0.6
end
end
end
end
end)
