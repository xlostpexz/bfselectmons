local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
Camera:Stop()
coroutine.wrap(function()
    game:GetService("RunService").Stepped:Connect(function()
        if getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack then
            getupvalues(CombatFramework)[2].activeController.timeToNextAttack = 0
            getupvalues(CombatFramework)[2].activeController.attacking = false
            getupvalues(CombatFramework)[2].activeController.timeToNextBlock = 0
            getupvalues(CombatFramework)[2].activeController.humanoid.AutoRotate = 80
            getupvalues(CombatFramework)[2].activeController.increment = 3
            getupvalues(CombatFramework)[2].activeController.blocking = false
            getupvalues(CombatFramework)[2].activeController.hitboxMagnitude = 80
        end
    end)
end)()


local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("XzE Hub | Blox Fruits | Select Monster", 5013109572)
 
 
 
local page = venyx:addPage("Auto Farm", 5012544693)
local farm = page:addSection("Auto Farm")
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

mons = {}

for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
   table.insert(mons,v.Name)
end


farm:addToggle("Auto Farm", _G.Fa, function(value)
_G.Fa = value
end)

farm:addDropdown("Select Mons", mons, function(abc)
    Select = abc
end)

farm:addButton("Refresh", function()
        table.clear(mons)
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
   table.insert(mons,v.Name)
end
end)

farm:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
print("Activated Keybind")
venyx:toggle()
end, function()
print("Changed Keybind")
end)


spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa then
    local Distance2 = (game:GetService("Workspace").Enemies[Select].HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new(Distance2/250, Enum.EasingStyle.Linear)
    local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = game:GetService("Workspace").Enemies[Select].HumanoidRootPart.CFrame * CFrame.new(0,20,0)})
    tween:Play()    
        end
    end)
   end)
end)



spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa then
            getupvalues(CombatFramework)[2]['activeController']:attack()
        end
    end)
end) 
end)


spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa then
Method = CFrame.new(0,20,0)

spawn(function()
   while wait(3) do
       if Methodnow == 1 then
        Methodnow = 2
        Method = CFrame.new(0,0,20)
        else
        Methodnow = 1
        Method = CFrame.new(0,20,0)
       end
    end
end)

for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    for i2,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == Select and v2.Name == Select then
                            v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                            v2.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(11)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
end
            
                    end
    end)
   end)
end)

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and _G.Fa then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)


local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(60, 0, 200),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(241, 146, 255)
}
 
 
for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end
 
-- load
venyx:SelectPage(venyx.pages[1], true)
