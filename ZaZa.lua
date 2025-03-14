local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "ZaZa Hub  0.1.0",
    SubTitle = "by Brxyk_",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.P -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    ESP = Window:AddTab({ Title = "ESP", Icon = "eye" }),
    Spieler = Window:AddTab({ Title = "Player", Icon = "user" }),
    Aimbot = Window:AddTab({ Title = "Aimbot", Icon = "crosshair" }),
    MiscTab = Window:AddTab({ Title = "Misc", Icon = "misc" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "info" })
}

local Options = Fluent.Options

local ESP_Boxes_Enabled = false
local ESP_Distance_Enabled = false
local ESP_Lines_Enabled = false
local ESP_Skeleton_Enabled = false
local ESP_Items_Enabled = false

local ESP_Boxes = {}
local ESP_Distances = {}
local ESP_Lines = {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local function UpdateESPState()
    for _, espData in pairs(ESP_Boxes) do
        espData.Box.Visible = ESP_Boxes_Enabled
        espData.Name.Visible = ESP_Boxes_Enabled
    end
    for _, distance in pairs(ESP_Distances) do
        distance.Visible = ESP_Distance_Enabled
    end
    for _, line in pairs(ESP_Lines) do
        line.Visible = ESP_Lines_Enabled
    end
end

local function CreateESP(player)
    if player == LocalPlayer then return end

    local Box = Drawing.new("Square")
    Box.Thickness = 2
    Box.Color = Color3.fromRGB(255, 0, 0)
    Box.Filled = false
    Box.Transparency = 1
    Box.Visible = false

    local Name = Drawing.new("Text")
    Name.Size = 16
    Name.Center = true
    Name.Outline = true
    Name.OutlineColor = Color3.new(0, 0, 0)
    Name.Color = Color3.fromRGB(255, 255, 255)
    Name.Transparency = 1
    Name.Visible = false
	
	local HealthBar = Drawing.new("Square")
	HealthBar.Thickness = 1
	HealthBar.Filled = true
	HealthBar.Transparency = 1
	HealthBar.Visible = false

    local Distance = Drawing.new("Text")
    Distance.Size = 14
    Distance.Center = true
    Distance.Outline = true
    Distance.Color = Color3.fromRGB(0, 255, 255)
    Distance.Visible = false

    local Line = Drawing.new("Line")
    Line.Thickness = 1.5
    Line.Color = Color3.fromRGB(0, 255, 0)
    Line.Transparency = 1
    Line.Visible = false

    ESP_Boxes[player] = {Box = Box, Name = Name}
    ESP_Distances[player] = Distance
    ESP_Lines[player] = Line

    RunService.RenderStepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local RootPart = player.Character.HumanoidRootPart
            local Head = player.Character:FindFirstChild("Head")
            local Humanoid = player.Character:FindFirstChildOfClass("Humanoid")

            if RootPart and Head and Humanoid then
                local HeadPos, OnScreen = Camera:WorldToViewportPoint(Head.Position)
                local RootPos = Camera:WorldToViewportPoint(RootPart.Position)
                local LegPos = Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, Humanoid.HipHeight + 2, 0))

                if OnScreen then
                    local Height = math.abs(HeadPos.Y - LegPos.Y)
                    local Width = Height * 0.6
                    local BoxPosition = Vector2.new(RootPos.X - Width / 2, RootPos.Y - Height / 2)
					local HP_Percentage = Humanoid.Health / Humanoid.MaxHealth
					local HealthHeight = Height * HP_Percentage
                
                    Box.Size = Vector2.new(Width, Height)
                    Box.Position = BoxPosition
                    Box.Visible = ESP_Boxes_Enabled

                    Name.Position = Vector2.new(HeadPos.X, HeadPos.Y - 30)
                    Name.Text = player.Name
                    Name.Visible = ESP_Boxes_Enabled
					
					HealthBar.Size = Vector2.new(4, HealthHeight)
					HealthBar.Position = Vector2.new(BoxPosition.X - 6, BoxPosition.Y + (Height - HealthHeight))
					HealthBar.Color = Color3.fromRGB(255 * (1 - HP_Percentage), 255 * HP_Percentage, 0)
					HealthBar.Visible = ESP_Boxes_Enabled

                    Distance.Position = Vector2.new(HeadPos.X, HeadPos.Y - 20)
                    Distance.Text = string.format("%.1f m", (LocalPlayer.Character.HumanoidRootPart.Position - RootPart.Position).Magnitude)
                    Distance.Visible = ESP_Distance_Enabled

                    Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y - 50)
                    Line.To = Vector2.new(HeadPos.X, HeadPos.Y)
                    Line.Visible = ESP_Lines_Enabled
                else
                    Box.Visible = false
                    Name.Visible = false
					HealthBar.Visible = false
                    Distance.Visible = false
                    Line.Visible = false
                end
            end
        else
            Box.Visible = false
            Name.Visible = false
			HealthBar.Visible = false
            Distance.Visible = false
            Line.Visible = false
        end
    end)
end

local ESPSection = Tabs.ESP:AddSection("Wallhack")

ESPSection:AddToggle("ESP", {
    Title = "ESP",
    Description = "Draws a box around players and displays their names.",
    Default = false,
    Callback = function(state)
        ESP_Boxes_Enabled = state
        UpdateESPState()
    end
})

ESPSection:AddToggle("Distance", {
    Title = "Distance",
    Description = "Shows the distance between the player and the target.",
    Default = false,
    Callback = function(state)
        ESP_Distance_Enabled = state
        UpdateESPState()
    end
})

ESPSection:AddToggle("Lines", {
    Title = "Line",
    Description = "Draws lines connecting the player to in-game players.",
    Default = false,
    Callback = function(state)
        ESP_Lines_Enabled = state
        UpdateESPState()
    end
})

for _, player in pairs(Players:GetPlayers()) do
    CreateESP(player)
end

Players.PlayerAdded:Connect(CreateESP)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local LocalPlayer = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local speedValue = 16  -- Speichert die Geschwindigkeit

-- Funktion zum Sicherstellen, dass die Geschwindigkeit nicht zurückgesetzt wird
humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    if humanoid.WalkSpeed ~= speedValue then
        humanoid.WalkSpeed = speedValue
    end
end)

local FlySpeed = 50
local Flying = false
local FlyVelocity, FlyGyro

function StartFly()
    if Flying then return end
    Flying = true
    local Character = LocalPlayer.Character
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")
    if not Root then return end
    
    FlyVelocity = Instance.new("BodyVelocity", Root)
    FlyVelocity.Velocity = Vector3.new(0, 0, 0)
    FlyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    
    FlyGyro = Instance.new("BodyGyro", Root)
    FlyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    FlyGyro.CFrame = Root.CFrame
    
    RunService.RenderStepped:Connect(function()
        if not Flying then return end
        local Camera = workspace.CurrentCamera
        local MoveDirection = Vector3.new()
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            MoveDirection = MoveDirection + Camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            MoveDirection = MoveDirection - Camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            MoveDirection = MoveDirection - Camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            MoveDirection = MoveDirection + Camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            MoveDirection = MoveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            MoveDirection = MoveDirection - Vector3.new(0, 1, 0)
        end
        
        if MoveDirection.Magnitude > 0 then
            FlyVelocity.Velocity = MoveDirection.Unit * FlySpeed
        else
            FlyVelocity.Velocity = Vector3.new(0, 0, 0)
        end
        FlyGyro.CFrame = Camera.CFrame
    end)
end

function StopFly()
    Flying = false
    if FlyVelocity then FlyVelocity:Destroy() end
    if FlyGyro then FlyGyro:Destroy() end
end

local PlayerSection = Tabs.Spieler:AddSection("Movement & Control")

PlayerSection:AddToggle("FlyToggle", {
    Title = "Fly",
    Description = "Toggles flying on/off",
    Default = false,
    Callback = function(state)
        if state then
            StartFly()
        else
            StopFly()
        end
    end
})

PlayerSection:AddSlider("FlySpeedSlider", {
    Title = "Flight speed",
    Description = "Changes the flying speed",
    Default = 50,
    Min = 10,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
        FlySpeed = Value
    end
})

-- Geschwindigkeit-Schieberegler
PlayerSection:AddSlider("SpeedSlider", {
    Title = "Speed",
    Description = "Changes the running speed",
    Default = 16,
    Min = 10,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
        speedValue = Value  -- Speichert den Wert
        humanoid.WalkSpeed = speedValue
    end
})

-- Sprungkraft-Schieberegler
PlayerSection:AddSlider("JumpSlider", {
    Title = "Jump power",
    Description = "Changes the jump power",
    Default = 50,
    Min = 30,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
        humanoid.JumpPower = Value
    end
})

local PlayerSection = Tabs.Spieler:AddSection("Name")

PlayerSection:AddInput("ChangeName", {
    Title = "Change Name",
    Description = "Changes your in-game name (local)",
    Default = LocalPlayer.Name,
    Numeric = false,
    Finished = true, -- Nur nach Drücken der Enter-Taste wird es angewendet
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
            local Head = LocalPlayer.Character.Head
            local NameTag = Head:FindFirstChild("BillboardGui")

            if not NameTag then
                NameTag = Instance.new("BillboardGui", Head)
                NameTag.Name = "BillboardGui"
                NameTag.Size = UDim2.new(0, 200, 0, 50)
                NameTag.StudsOffset = Vector3.new(0, 2, 0)
                NameTag.AlwaysOnTop = true

                local TextLabel = Instance.new("TextLabel", NameTag)
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextStrokeTransparency = 0
                TextLabel.Font = Enum.Font.SourceSansBold
                TextLabel.TextScaled = true
            end
            NameTag.TextLabel.Text = Value
        end
    end
})

local NoclipEnabled = false
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local function ToggleNoclip(state)
    NoclipEnabled = state
    if NoclipEnabled then
        RunService.Stepped:Connect(function()
            if NoclipEnabled and Character then
                for _, part in pairs(Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end
end

local PlayerSection = Tabs.Spieler:AddSection("Noclip")

PlayerSection:AddToggle("NoclipToggle", {
    Title = "Noclip",
    Description = "Allows you to walk through walls",
    Default = false,
    Callback = function(state)
        ToggleNoclip(state)
    end
})

local Aimbot_Enabled = false
local Aim_Smoothness = 5 -- Je höher, desto langsamer das Zielen
local AimKey = Enum.UserInputType.MouseButton2 -- Rechtsklick für Aimbot

local function GetClosestTarget()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local camera = workspace.CurrentCamera
    local localPlayer = game.Players.LocalPlayer
    local mouseLocation = UserInputService:GetMouseLocation()

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local headPos, onScreen = camera:WorldToViewportPoint(player.Character.Head.Position)

            if onScreen then
                local distance = (Vector2.new(headPos.X, headPos.Y) - mouseLocation).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end
    return closestPlayer
end

local function AimAt(target)
    if target and target.Character and target.Character:FindFirstChild("Head") then
        local camera = workspace.CurrentCamera
        local headPos = camera:WorldToViewportPoint(target.Character.Head.Position)

        local mouseMove = Vector2.new(headPos.X, headPos.Y) - UserInputService:GetMouseLocation()
        mouseMove = mouseMove / Aim_Smoothness

        mousemoverel(mouseMove.X, mouseMove.Y)
    end
end

RunService.RenderStepped:Connect(function()
    if Aimbot_Enabled and UserInputService:IsMouseButtonPressed(AimKey) then
        local target = GetClosestTarget()
        if target then
            AimAt(target)
        end
    end
end)

local AimbotSection = Tabs.Aimbot:AddSection("Aimbot")

AimbotSection:AddToggle("AimbotToggle", {
    Title = "Aimbot",
    Default = false,
    Callback = function(state)
        Aimbot_Enabled = state
    end
})

AimbotSection:AddSlider("Smoothness", {
    Title = "Target Speed",
    Description = "Controls how fast the aimbot moves",
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 1,
    Callback = function(value)
        Aim_Smoothness = value
    end
})

Tabs.MiscTab:AddButton({
    Title = "Button",
    Description = "Very important button",
    Callback = function()
        Window:Dialog({
            Title = "Title",
            Content = "This is a dialog",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        print("Confirmed the dialog.")
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Credits:AddParagraph({
    Title = "",
    Content = "Script Created by: #berkcan61 . \n\nDisclaimer: This script is intended for educational purposes. The author is not responsible for any misuse or violation of Roblox's terms of service. \n\nThis script is licensed under Apache-2.0 license \n\nCopyright © 2025 Berkcan. All rights reserved."
})

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("")
SaveManager:SetFolder("")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "ZaZa",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
