local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Window = Fluent:CreateWindow({
    Title = "ZaZa Hub - v1.2.0",
    SubTitle = "by Brxyk_ #berkcan61",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.P -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    ESP = Window:AddTab({ Title = "ESP", Icon = "eye" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Aimbot = Window:AddTab({ Title = "Aimbot", Icon = "crosshair" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "locate-fixed" }),
    MiscTab = Window:AddTab({ Title = "Misc", Icon = "wrench" }),
    Emote = Window:AddTab({ Title = "Emote", Icon = "smile" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "info" })
}

Window:SelectTab(1)

wait(0.2)

local Options = Fluent.Options

local ESP_Boxes_Enabled = false
local ESP_Distance_Enabled = false
local ESP_Lines_Enabled = false

local ESP_Boxes = {}
local ESP_Distances = {}
local ESP_Lines = {}
local ESP_Connections = {}

local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = game.Players.LocalPlayer

-- Konstanten für bessere Lesbarkeit
local NAME_OFFSET_Y = -30
local DISTANCE_OFFSET_Y = -20
local LINE_OFFSET_BOTTOM = -50
local BOX_WIDTH_FACTOR = 0.6
local HEALTH_BAR_WIDTH = 4
local HEALTH_BAR_OFFSET_X = -6
local LINE_THICKNESS = 1.5

local BOX_COLOR = Color3.fromRGB(255, 0, 0)
local NAME_COLOR = Color3.fromRGB(255, 255, 255)
local DISTANCE_COLOR = Color3.fromRGB(0, 255, 255)
local LINE_COLOR = Color3.fromRGB(0, 255, 0)

local function UpdateESPState()
    for _, espData in pairs(ESP_Boxes) do
        if espData then
            -- Aktualisiere die Farben hier, falls sich die Colorpicker-Werte ändern
            espData.Box.Color = BOX_COLOR
            espData.Name.Color = NAME_COLOR
            espData.HealthBar.Color = Color3.fromRGB(255 * (1 - (espData.HealthBar.Size.Y / espData.Box.Size.Y)), 255 * (espData.HealthBar.Size.Y / espData.Box.Size.Y), 0)
            espData.Box.Visible = ESP_Boxes_Enabled
            espData.Name.Visible = ESP_Boxes_Enabled
            espData.HealthBar.Visible = ESP_Boxes_Enabled
        end
    end
    for _, distance in pairs(ESP_Distances) do
        if distance then
            distance.Visible = ESP_Distance_Enabled
        end
    end
    for _, line in pairs(ESP_Lines) do
        if line then
            line.Color = LINE_COLOR  -- Aktualisiere die Linienfarbe
            line.Visible = ESP_Lines_Enabled
        end
    end
end

-- Funktion zum Aktualisieren der Farben in der Render-Stepped-Schleife
local function UpdateESPColors()
    for _, espData in pairs(ESP_Boxes) do
        if espData then
            espData.Box.Color = BOX_COLOR  -- Boxfarbe
            espData.Name.Color = NAME_COLOR  -- Namensfarbe
            espData.HealthBar.Color = Color3.fromRGB(255 * (1 - (espData.HealthBar.Size.Y / espData.Box.Size.Y)), 255 * (espData.HealthBar.Size.Y / espData.Box.Size.Y), 0)
        end
    end
    for _, line in pairs(ESP_Lines) do
        if line then
            line.Color = LINE_COLOR  -- Linienfarbe
        end
    end
    for _, distance in pairs(ESP_Distances) do
        if distance then
            distance.Color = DISTANCE_COLOR  -- Distanzfarbe
        end
    end
end

local function RemoveESP(player)
    if ESP_Boxes[player] then
        local espData = ESP_Boxes[player]
        espData.Box:Destroy()
        espData.Name:Destroy()
        espData.HealthBar:Destroy()
        ESP_Boxes[player] = nil
    end
    if ESP_Distances[player] then
        ESP_Distances[player]:Destroy()
        ESP_Distances[player] = nil
    end
    if ESP_Lines[player] then
        ESP_Lines[player]:Destroy()
        ESP_Lines[player] = nil
    end
    if ESP_Connections[player] then
        ESP_Connections[player]:Disconnect()
        ESP_Connections[player] = nil
    end
end

local function CreateESP(player)
    if player == LocalPlayer then return end

    repeat wait() until player.Character and player.Character:FindFirstChild("HumanoidRootPart")

    local Box = Drawing.new("Square")
    Box.Thickness = 2
    Box.Color = BOX_COLOR  -- Anfangsfarbe
    Box.Filled = false
    Box.Transparency = 1
    Box.Visible = false

    local Name = Drawing.new("Text")
    Name.Size = 16
    Name.Center = true
    Name.Outline = true
    Name.Color = NAME_COLOR  -- Anfangsfarbe
    Name.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = true
    HealthBar.Visible = false

    local Distance = Drawing.new("Text")
    Distance.Size = 14
    Distance.Center = true
    Distance.Color = DISTANCE_COLOR
    Distance.Visible = false

    local Line = Drawing.new("Line")
    Line.Thickness = LINE_THICKNESS
    Line.Color = LINE_COLOR  -- Anfangsfarbe
    Line.Visible = false

    ESP_Boxes[player] = {Box = Box, Name = Name, HealthBar = HealthBar}
    ESP_Distances[player] = Distance
    ESP_Lines[player] = Line

    ESP_Connections[player] = RunService.RenderStepped:Connect(function()
        local character = player.Character
        if not player.Parent or not character then
            RemoveESP(player)
            return
        end

        local RootPart = character:FindFirstChild("HumanoidRootPart")
        local Head = character:FindFirstChild("Head")
        local Humanoid = character:FindFirstChildOfClass("Humanoid")

        if RootPart and Head and Humanoid then
            local HeadPos, OnScreen = Camera:WorldToViewportPoint(Head.Position)
            local RootPos = Camera:WorldToViewportPoint(RootPart.Position)
            local LegPos = Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, Humanoid.HipHeight + 2, 0))

            if OnScreen then
                local Height = math.abs(HeadPos.Y - LegPos.Y)
                local Width = Height * BOX_WIDTH_FACTOR
                local BoxPosition = Vector2.new(RootPos.X - Width / 2, RootPos.Y - Height / 2)
                local HP_Percentage = Humanoid.Health / Humanoid.MaxHealth
                local HealthHeight = Height * HP_Percentage

                Box.Size = Vector2.new(Width, Height)
                Box.Position = BoxPosition
                Box.Visible = ESP_Boxes_Enabled

                Name.Position = Vector2.new(HeadPos.X, HeadPos.Y + NAME_OFFSET_Y)
                Name.Text = player.Name
                Name.Visible = ESP_Boxes_Enabled

                HealthBar.Size = Vector2.new(HEALTH_BAR_WIDTH, HealthHeight)
                HealthBar.Position = Vector2.new(BoxPosition.X + HEALTH_BAR_OFFSET_X, BoxPosition.Y + (Height - HealthHeight))
                HealthBar.Color = Color3.fromRGB(255 * (1 - HP_Percentage), 255 * HP_Percentage, 0)
                HealthBar.Visible = ESP_Boxes_Enabled

                Distance.Position = Vector2.new(HeadPos.X, HeadPos.Y + DISTANCE_OFFSET_Y)
                Distance.Text = string.format("%.1f m", (LocalPlayer.Character.HumanoidRootPart.Position - RootPart.Position).Magnitude)
                Distance.Visible = ESP_Distance_Enabled

                Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y + LINE_OFFSET_BOTTOM)
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
    end)
end

local xrayEnabled = false
local xray = function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChildWhichIsA("Humanoid") and not v.Parent.Parent:FindFirstChildWhichIsA("Humanoid") then
            v.LocalTransparencyModifier = xrayEnabled and 0.5 or 0
        end
    end
end

wait(0.2)

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
    Description = "Displays the distance between the player and the target.",
    Default = false,
    Callback = function(state)
        ESP_Distance_Enabled = state
        UpdateESPState()
    end
})

ESPSection:AddToggle("Lines", {
    Title = "Lines",
    Description = "Draws lines that connect the player to other players in the game.",
    Default = false,
    Callback = function(state)
        ESP_Lines_Enabled = state
        UpdateESPState()
    end
})

ESPSection:AddToggle("Xray", {
    Title = "Xray",
    Description = "Enables or disables the X-ray effect, making non-human parts semi-transparent to help you see through obstacles.",
    Default = false,
    Callback = function(state)
        xrayEnabled = state  -- Setzt xrayEnabled basierend auf dem Toggle-Status
        xray()  -- Wendet den X-ray-Effekt an
    end
})

local EspSettings = Tabs.ESP:AddSection("Settings")

-- Colorpicker für die Boxfarbe hinzufügen
local BoxColorpicker = EspSettings:AddColorpicker("BoxColorpicker", {
    Title = "Box Color",
    Default = Color3.fromRGB(255, 0, 0)
})

-- Colorpicker für die Linienfarbe hinzufügen
local LineColorpicker = EspSettings:AddColorpicker("LineColorpicker", {
    Title = "Line Color",
    Default = Color3.fromRGB(0, 255, 0)
})

-- Colorpicker für die Namensfarbe hinzufügen
local NameColorpicker = EspSettings:AddColorpicker("NameColorpicker", {
    Title = "Name Color",
    Default = Color3.fromRGB(255, 255, 255)
})

-- Colorpicker für die Distanzfarbe hinzufügen
local DistanceColorpicker = EspSettings:AddColorpicker("DistanceColorpicker", {
    Title = "Distance Color",
    Default = Color3.fromRGB(0, 255, 255)
})

-- Aufruf der Funktion für die sofortige Anwendung der Colorpicker-Werte
BoxColorpicker:OnChanged(function(Value)
    BOX_COLOR = BoxColorpicker.Value
    UpdateESPColors()  -- Aktualisiere die Farben sofort
end)

LineColorpicker:OnChanged(function(Value)
    LINE_COLOR = LineColorpicker.Value
    UpdateESPColors()  -- Aktualisiere die Farben sofort
end)

NameColorpicker:OnChanged(function(Value)
    NAME_COLOR = NameColorpicker.Value
    UpdateESPColors()  -- Aktualisiere die Farben sofort
end)

DistanceColorpicker:OnChanged(function(Value)
    DISTANCE_COLOR = DistanceColorpicker.Value
    UpdateESPColors()  -- Aktualisiere die Farben sofort
end)

for _, player in pairs(Players:GetPlayers()) do
    CreateESP(player)
end

Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(RemoveESP)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")

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

local function StartFly()
    Flying = true
    local Character = LocalPlayer.Character
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")
    if not Root then 
        return 
    end
    
    FlyVelocity = Instance.new("BodyVelocity", Root)
    FlyVelocity.Velocity = Vector3.new(0, 0, 0)
    FlyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    
    FlyGyro = Instance.new("BodyGyro", Root)
    FlyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    FlyGyro.CFrame = Root.CFrame
    
    RunService.RenderStepped:Connect(function()
        if not Flying then return end
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

local function StopFly()

    Flying = false
    if FlyVelocity then 
        FlyVelocity:Destroy() 
    end
    if FlyGyro then 
        FlyGyro:Destroy() 

    end
end

wait(0.2)

local PlayerSection = Tabs.Player:AddSection("Movement & Control")

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
    Min = 16,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
        speedValue = Value  -- Speichert den Wert
        humanoid.WalkSpeed = speedValue
    end
})

-- Sprungkraft-Eingabefeld
local Input = PlayerSection:AddInput("JumpInput", {
    Title = "Jump power",
    Default = "50", -- Standardwert als String
    Placeholder = "Enter jump power",
    Numeric = true, -- Nur Zahlen zulassen
    Finished = false, -- Callback nur bei Drücken von Enter
    Callback = function(Value)
        humanoid.JumpPower = tonumber(Value) -- Wert in Zahl umwandeln
    end
})

local PlayerSection2 = Tabs.Player:AddSection("Name")

PlayerSection2:AddInput("ChangeName", {
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

local PlayerSection3 = Tabs.Player:AddSection("Noclip")

PlayerSection3:AddToggle("NoclipToggle", {
    Title = "Noclip",
    Description = "Allows you to walk through walls",
    Default = false,
    Callback = function(state)
        ToggleNoclip(state)
    end
})

wait(0.2)

--// Cache

local select = select
local pcall, getgenv, next, Vector2, mathclamp, mousemoverel = select(1, pcall, getgenv, next, Vector2.new, math.clamp, type, mousemoverel or (Input and Input.MouseMove))

--// Preventing Multiple Processes

pcall(function()
    getgenv().Aimbot.Functions:Exit()
end)

--// Environment

getgenv().Aimbot = {}
local Environment = getgenv().Aimbot

local LocalPlayer = Players.LocalPlayer

--// Variables

local RequiredDistance, Typing, Running, Animation, ServiceConnections = 2000, false, false, nil, {}

--// Script Settings

Environment.Settings = {
    Enabled = true,
    TeamCheck = false,
    AliveCheck = true,
    WallCheck = false, -- Laggy
    Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
    ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
    ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
    TriggerKey = "MouseButton2",
    Toggle = false,
    LockPart = "Head" -- Body part to lock on
}

Environment.FOVSettings = {
    Enabled = true,
    Visible = true,
    Amount = 90,
    Color = Color3.fromRGB(255, 255, 255),
    LockedColor = Color3.fromRGB(255, 70, 70),
    Transparency = 0.5,
    Sides = 60,
    Thickness = 1,
    Filled = false
}

Environment.FOVCircle = Drawing.new("Circle")

--// Functions

local function CancelLock()
    Environment.Locked = nil
    Running = false
    if Animation and Animation.Play then -- Sicherstellen, dass Animation existiert
        Animation:Cancel()
    end
    if Environment.FOVCircle then
        Environment.FOVCircle.Color = Environment.FOVSettings.Color
    end
end

local function GetClosestPlayer()
    if not Environment.Locked then
        RequiredDistance = (Environment.FOVSettings.Enabled and tonumber(Environment.FOVSettings.Amount) or 2000)

        for _, v in next, Players:GetPlayers() do
            if v ~= LocalPlayer then
                if v.Character and v.Character:FindFirstChild(Environment.Settings.LockPart) and v.Character:FindFirstChildOfClass("Humanoid") then
                    if Environment.Settings.TeamCheck and v.Team == LocalPlayer.Team then continue end
                    if Environment.Settings.AliveCheck and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then continue end
                    if Environment.Settings.WallCheck and #(Camera:GetPartsObscuringTarget({v.Character[Environment.Settings.LockPart].Position}, v.Character:GetDescendants())) > 0 then continue end

                    local Vector, OnScreen = Camera:WorldToViewportPoint(v.Character[Environment.Settings.LockPart].Position)
                    local Distance = (Vector2(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2(Vector.X, Vector.Y)).Magnitude

                    if Distance < RequiredDistance and OnScreen then
                        RequiredDistance = Distance
                        Environment.Locked = v
                    end
                end
            end
        end
    elseif (Vector2(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2(Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position).X, Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position).Y)).Magnitude > RequiredDistance then
        CancelLock()
    end
end 

wait(0.2)

--// Typing Check

ServiceConnections.TypingStartedConnection = UserInputService.TextBoxFocused:Connect(function()
    Typing = true
end)

ServiceConnections.TypingEndedConnection = UserInputService.TextBoxFocusReleased:Connect(function()
    Typing = false
end)

--// Main
local function Load()
    ServiceConnections.RenderSteppedConnection = RunService.RenderStepped:Connect(function()
        if Environment.FOVSettings.Enabled and Environment.Settings.Enabled then
            local fovSettings = Environment.FOVSettings
            local fovCircle = Environment.FOVCircle
            local mousePos = UserInputService:GetMouseLocation()
        
            fovCircle.Radius = fovSettings.Amount
            fovCircle.Thickness = fovSettings.Thickness
            fovCircle.Filled = fovSettings.Filled
            fovCircle.NumSides = fovSettings.Sides
            fovCircle.Color = fovSettings.Color
            fovCircle.Transparency = fovSettings.Transparency
            fovCircle.Visible = fovSettings.Visible
            fovCircle.Position = Vector2(mousePos.X, mousePos.Y)
        else
            Environment.FOVCircle.Visible = false
        end

        if Running and Environment.Settings.Enabled then
            GetClosestPlayer()
        
            if Environment.Locked then
                local lockPart = Environment.Settings.LockPart
                local targetCharacter = Environment.Locked.Character[lockPart]
                local targetPos = targetCharacter.Position
        
                if Environment.Settings.ThirdPerson then
                    Environment.Settings.ThirdPersonSensitivity = mathclamp(Environment.Settings.ThirdPersonSensitivity, 0.1, 5)
                    
                    local viewportPos = Camera:WorldToViewportPoint(targetPos)
                    local mousePos = UserInputService:GetMouseLocation()
                    local deltaX = (viewportPos.X - mousePos.X) * Environment.Settings.ThirdPersonSensitivity
                    local deltaY = (viewportPos.Y - mousePos.Y) * Environment.Settings.ThirdPersonSensitivity
                    
                    mousemoverel(deltaX, deltaY)
                else
                    if Environment.Settings.Sensitivity > 0 then
                        local tweenInfo = TweenInfo.new(Environment.Settings.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                        Animation = TweenService:Create(Camera, tweenInfo, { CFrame = CFrame.new(Camera.CFrame.Position, targetPos) })
                        Animation:Play()
                    else
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
                    end
                end
        
                Environment.FOVCircle.Color = Environment.FOVSettings.LockedColor
            end
        end        
    end)

    ServiceConnections.InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
        if not Typing then
            pcall(function()
                if Input.KeyCode == Enum.KeyCode[Environment.Settings.TriggerKey] then
                    if Environment.Settings.Toggle then
                        Running = not Running

                        if not Running then
                            CancelLock()
                        end
                    else
                        Running = true
                    end
                end
            end)

            pcall(function()
                if Input.UserInputType == Enum.UserInputType[Environment.Settings.TriggerKey] then
                    if Environment.Settings.Toggle then
                        Running = not Running

                        if not Running then
                            CancelLock()
                        end
                    else
                        Running = true
                    end
                end
            end)
        end
    end)

    ServiceConnections.InputEndedConnection = UserInputService.InputEnded:Connect(function(Input)
        if not Typing then
            if not Environment.Settings.Toggle then
                pcall(function()
                    if Input.KeyCode == Enum.KeyCode[Environment.Settings.TriggerKey] then
                        Running = false; CancelLock()
                    end
                end)

                pcall(function()
                    if Input.UserInputType == Enum.UserInputType[Environment.Settings.TriggerKey] then
                        Running = false; CancelLock()
                    end
                end)
            end
        end
    end)
end

wait(0.2)

--// Functions

Environment.Functions = {}

function Environment.Functions:Exit()
    for _, v in next, ServiceConnections do
        v:Disconnect()
    end

    if Environment.FOVCircle.Remove then Environment.FOVCircle:Remove() end

    getgenv().Aimbot.Functions = nil
    getgenv().Aimbot = nil
end

function Environment.Functions:Restart()
    for _, v in next, ServiceConnections do
        v:Disconnect()
    end
end

function Environment.Functions:ResetSettings()
    Environment.Settings = {
        Enabled = true,
        TeamCheck = false,
        AliveCheck = true,
        WallCheck = false,
        Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
        ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
        ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
        TriggerKey = "MouseButton2",
        Toggle = false,
        LockPart = "Head" -- Body part to lock on
    }

    Environment.FOVSettings = {
        Enabled = true,
        Visible = true,
        Amount = 90,
        Color = Color3.fromRGB(255, 255, 255),
        LockedColor = Color3.fromRGB(255, 70, 70),
        Transparency = 0.5,
        Sides = 60,
        Thickness = 1,
        Filled = false
    }
end

-- GUI Options (Toggle, Slider)
local AimbotSection = Tabs.Aimbot:AddSection("Aimbot")

AimbotSection:AddToggle("Aimbot", {
    Title = "Aimbot",
    Description = "Automatically locks onto the nearest target within the FOV",
    Default = false,
    Callback = function(value)
        Environment.FOVSettings.Visible = value
        Environment.Settings.Enabled = value
    end
})

local FovSection = Tabs.Aimbot:AddSection("Fov Settings")

FovSection:AddSlider("FOVRadius", {
    Title = "FOV Radius",
    Description = "Controls the Field of View radius",
    Default = 80,
    Min = 0,
    Max = 300,
    Rounding = 1,
    Callback = function(value)
        Environment.FOVSettings.Amount = value
    end
})

-- Colorpicker for FOV Color
local ColorpickerFov = FovSection:AddColorpicker("FOVColor", {
    Title = "FOV Color",
    Description = "Select a color to customize the FOV circle",
    Default = Environment.FOVSettings.Color
})

ColorpickerFov:OnChanged(function()
    Environment.FOVSettings.Color = ColorpickerFov.Value
    Environment.FOVCircle.Color = ColorpickerFov.Value
end)

-- Colorpicker for FOV Locked Color
local ColorpickerLocked = FovSection:AddColorpicker("FOVLockedColor", {
    Title = "FOV Locked Color",
    Description = "Select a color to customize the locked FOV circle",
    Default = Environment.FOVSettings.LockedColor
})

ColorpickerLocked:OnChanged(function()
    Environment.FOVSettings.LockedColor = ColorpickerLocked.Value
    Environment.FOVCircle.LockedColor = ColorpickerLocked.Value
end)

FovSection:AddSlider("FOVThickness", {
    Title = "FOV Thickness",
    Description = "Adjust the thickness of the FOV circle",
    Default = 1,  -- Default thickness is set to 1
    Min = 0,      -- Minimum value for thickness
    Max = 10,     -- Maximum value for thickness
    Rounding = 1, -- Rounding to 1 decimal
    Callback = function(value)
        Environment.FOVSettings.Thickness = value
        -- Assuming there is a method to set the thickness of the circle
        Environment.FOVCircle.Thickness = value
    end
})

--// Filled Toggle for FOV Circle
FovSection:AddToggle("FilledFOV", {
    Title = "Filled FOV",
    Description = "Toggle to fill the FOV circle",
    Default = false,
    Callback = function(value)
        Environment.FOVSettings.Filled = value
        Environment.FOVCircle.Filled = value  -- Set the filled property of the circle
    end
})

local RainbowFovSection = Tabs.Aimbot:AddSection("Rainbow FOV Settings")

RainbowFovSection:AddToggle("RainbowFOV", {
    Title = "Rainbow FOV",
    Description = "Cycles through rainbow colors for the FOV circle",
    Default = false,
    Callback = function(value)
        Environment.FOVSettings.Rainbow = value
        if value then
            task.spawn(function()
                while Environment.FOVSettings.Rainbow do
                    for hue = 0, 1, 0.01 do
                        Environment.FOVSettings.Color = Color3.fromHSV(hue, 1, 1)
                        Environment.FOVSettings.LockedColor = Color3.fromHSV(hue, 1, 1)
                        task.wait(Environment.FOVSettings.RainbowSpeed)
                    end
                end
            end)
        else
            -- Standardfarbe setzen, wenn RainbowFOV deaktiviert ist
            Environment.FOVSettings.Color = Color3.fromRGB(255, 255, 255)
            Environment.FOVSettings.LockedColor = Color3.fromRGB(255, 255, 255)
        end
    end
})

RainbowFovSection:AddSlider("RainbowSpeed", {
    Title = "Rainbow Speed",
    Description = "Controls the speed of the rainbow effect",
    Default = 10,
    Min = 1,
    Max = 50,
    Rounding = 0,
    Callback = function(value)
        Environment.FOVSettings.RainbowSpeed = 1 / value
    end
})

Load()

wait(0.2)

local savedLocations = {}  -- Hier werden die gespeicherten Orte gespeichert
local locationNames = {}   -- Namen für das Dropdown-Menü

-- Dropdown-Menü erstellen
local Dropdown = Tabs.Teleport:AddDropdown("TeleportDropdown", {
    Title = "Teleport to...",
    Values = {"No location saved"},
    Multi = false,
    Default = 1,
})

-- Teleport-Logik beim Wechsel des Dropdowns
Dropdown:OnChanged(function(Value)
    local index = table.find(locationNames, Value) -- Finde den gewählten Ort in der Liste
    if index and savedLocations[index] then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character.PrimaryPart then
            player.Character:SetPrimaryPartCFrame(CFrame.new(savedLocations[index]))
            Window:Dialog({
                Title = "Teleported!",
                Content = "You have been teleported to '" .. Value .. "'.",
                Buttons = { { Title = "Okay" } }
            })
        end
    end
end)

-- Speichern eines neuen Ortes
Tabs.Teleport:AddButton({
    Title = "Save location",
    Description = "Save your current location",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character.PrimaryPart then
            if #savedLocations < 5 then
                local pos = player.Character.PrimaryPart.Position
                table.insert(savedLocations, pos)
                table.insert(locationNames, "Location " .. #savedLocations)
                
                Dropdown:SetValues(locationNames) -- Dropdown-Liste aktualisieren
                Window:Dialog({
                    Title = "Location saved.",
                    Content = "Your location has been saved. (" .. #savedLocations .. "/5)",
                    Buttons = { { Title = "Okay" } }
                })
            else
                Window:Dialog({
                    Title = "Storage full.",
                    Content = "You can save up to 5 locations.",
                    Buttons = { { Title = "Okay" } }
                })
            end
        end
    end
})

-- Füge das Dropdown-Menü hinzu
local PlayerDropdown = Tabs.Teleport:AddDropdown("TeleportToPlayerDropdown", {
    Title = "Teleport to player",
    Values = {"No players online"},
    Multi = false,
    Default = 1,
})

-- Funktion, um das Dropdown mit den online Spielern zu aktualisieren
local function UpdatePlayerList()
    local playerNames = {}
    
    -- Hole alle online Spieler
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then -- Entferne den eigenen Spieler aus der Liste
            table.insert(playerNames, player.Name)
        end
    end
    
    -- Wenn keine Spieler online sind, setze den Wert im Dropdown auf "No players online"
    if #playerNames == 0 then
        playerNames = {"No players online"}
    end
    
    PlayerDropdown:SetValues(playerNames)  -- Setze die Werte im Dropdown
end

-- Rufe die UpdatePlayerList Funktion auf, wenn der Spieler beitritt oder das Spieler-Event ausgelöst wird
Players.PlayerAdded:Connect(UpdatePlayerList)
Players.PlayerRemoving:Connect(UpdatePlayerList)

-- Teleport-Logik beim Auswählen eines Spielers im Dropdown
PlayerDropdown:OnChanged(function(selectedPlayerName)
    -- Überprüfe, ob ein Spieler im Dropdown ausgewählt wurde
    if selectedPlayerName and selectedPlayerName ~= "No players online" then
        -- Suche nach dem ausgewählten Spieler
        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        
        -- Teleportiere den Spieler, wenn der Spieler existiert
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character:SetPrimaryPartCFrame(targetPlayer.Character.HumanoidRootPart.CFrame)
        end
    end
end)

wait(0.2)

-- Initialisiere die Liste der Spieler zu Beginn
UpdatePlayerList()

wait(0.2)

local AC = Tabs.MiscTab:AddSection("AntiCheat Scanner")

Tabs.MiscTab:AddButton({
    Title = "AntiCheat Scanner",
    Description = "Scans for potentially AntiCheats",
    Callback = function()

        -- GUI Setup
        local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
        ScreenGui.Name = "ACScannerGui"

        local MainFrame = Instance.new("Frame", ScreenGui)
        MainFrame.Size = UDim2.new(0, 500, 0, 600)
        MainFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
        MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        MainFrame.BorderSizePixel = 1
        MainFrame.BorderColor3 = Color3.fromRGB(100, 100, 100)
        MainFrame.Name = "ScanWindow"
        MainFrame.Style = Enum.FrameStyle.RobloxRound

        local Scroll = Instance.new("ScrollingFrame", MainFrame)
        Scroll.Size = UDim2.new(1, 0, 1, -30)
        Scroll.CanvasSize = UDim2.new(0, 0, 10, 0)
        Scroll.ScrollBarThickness = 4
        Scroll.BackgroundTransparency = 1

        local UIList = Instance.new("UIListLayout", Scroll)
        UIList.SortOrder = Enum.SortOrder.LayoutOrder
        UIList.Padding = UDim.new(0, 6) -- Mehr Abstand zwischen Texten

        -- Innenabstand (Padding)
        local padding = Instance.new("UIPadding", Scroll)
        padding.PaddingLeft = UDim.new(0, 10)
        padding.PaddingRight = UDim.new(0, 10)
        padding.PaddingTop = UDim.new(0, 10)
        padding.PaddingBottom = UDim.new(0, 10)

        local function AddText(msg)
            local label = Instance.new("TextLabel", Scroll)
            label.Size = UDim2.new(1, 0, 0, 20)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.fromRGB(200, 200, 200)
            label.Font = Enum.Font.Code
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.TextWrapped = true
            label.Text = msg
            label.TextSize = 14
            return label
        end

        local closeBtn = Instance.new("TextButton", MainFrame)
        closeBtn.Size = UDim2.new(0, 60, 0, 25)
        closeBtn.Position = UDim2.new(1, -65, 0, 5)
        closeBtn.Text = "Close"
        closeBtn.Font = Enum.Font.Code
        closeBtn.TextSize = 14
        closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        closeBtn.TextColor3 = Color3.new(1, 1, 1)
        closeBtn.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)

        -- Main Functions
        local function GetAllGameScripts()
            local scripts = {}
            for _, v in pairs(game:GetDescendants()) do
                if v.Name ~= "CoreGui" and v.Name ~= "CorePackages" then
                    pcall(function()
                        if (v:IsA("LocalScript") or v:IsA("ModuleScript") or v:IsA("Script")) then
                            table.insert(scripts, v)
                        end
                    end)
                end
            end
            return scripts
        end

        local function AnalyzeScript(script)
            local acPatterns = {
                ["names"] = {
                    "anti", "check", "secure", "protect", "detect", "validate", "verify",
                    "shield", "guard", "scan", "monitor", "watch", "block", "prevent",
                    "security", "defense", "safety", "enforcement", "protection", "firewall",
                    "barrier", "safeguard", "sentinel", "warden", "overseer", "supervisor",
                    "controller", "moderator", "enforcer", "keeper", "ac", "anticheat",
                    "bypass", "exploit", "hack", "cheat", "illegal", "violation", "abuse"
                },
                ["code"] = {
                    "ban", "kick", "punish", "teleport", "report", "getrawmetatable",
                    "hookfunction", "checkcaller", "fireserver", "invokeserver", "remote",
                    "network", "velocity", "speed", "position", "walkspeed", "jumppower",
                    "health", "damage", "tool", "weapon", "ammo", "reload", "shoot", "kill"
                },
                ["functions"] = {
                    "GetChildren", "GetDescendants", "FindFirstChild", "WaitForChild",
                    "Clone", "Destroy", "GetPropertyChangedSignal", "Connect", "Fire",
                    "Invoke", "IsA", "ClearAllChildren"
                }
            }

            local findings = {
                confidence = 0,
                matches = {}
            }

            pcall(function()
                local nameLower = script.Name:lower()
                for _, pattern in pairs(acPatterns.names) do
                    if string.find(nameLower, pattern) then
                        findings.confidence = findings.confidence + 2
                        table.insert(findings.matches, {type = "Name", pattern = pattern})
                    end
                end

                if script:IsA("LocalScript") or script:IsA("ModuleScript") then
                    local source = script.Source:lower()

                    for _, pattern in pairs(acPatterns.code) do
                        local count = select(2, string.gsub(source, pattern, ""))
                        if count > 0 then
                            findings.confidence = findings.confidence + count
                            table.insert(findings.matches, {type = "Code", pattern = pattern, count = count})
                        end
                    end

                    for _, func in pairs(acPatterns.functions) do
                        local count = select(2, string.gsub(source, func, ""))
                        if count > 2 then
                            findings.confidence = findings.confidence + math.floor(count / 2)
                            table.insert(findings.matches, {type = "Function", pattern = func, count = count})
                        end
                    end
                end
            end)

            return findings
        end

        local function ScanRemotes()
            local remotes = {}
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                    table.insert(remotes, v)
                end
            end
            return remotes
        end

        local function StartUniversalAnticheatScan()
            AddText("🔍 ZaZa Anti-Cheat Scanner v1")
            AddText("Scanning game: " .. game.Name)

            local remotes = ScanRemotes()
            AddText("Found " .. #remotes .. " remotes")

            local scripts = GetAllGameScripts()
            AddText("Analyzing " .. #scripts .. " scripts")

            local potentialAntiCheats = {}
            local totalAnalyzed = 0
            local lastPercent = -1 -- neue Prozentverfolgung

            for _, script in pairs(scripts) do
                local findings = AnalyzeScript(script)

                if findings.confidence >= 3 then
                    table.insert(potentialAntiCheats, {
                        script = script,
                        findings = findings
                    })
                end

                totalAnalyzed = totalAnalyzed + 1
                local percent = math.floor((totalAnalyzed / #scripts) * 100)

                if percent ~= lastPercent then
                    lastPercent = percent
                    AddText("Progress: " .. percent .. "%")
                end

                if totalAnalyzed % 50 == 0 then
                    task.wait()
                end
            end

            AddText("📊 Scan Results:")
            AddText("Total Scripts Analyzed: " .. #scripts)
            AddText("Potential Anti-Cheat Systems Found: " .. #potentialAntiCheats)

            if #potentialAntiCheats > 0 then
                AddText("🚨 High Confidence Matches:")
                table.sort(potentialAntiCheats, function(a,b)
                    return a.findings.confidence > b.findings.confidence
                end)

                for i, result in ipairs(potentialAntiCheats) do
                    if i > 15 then break end
                    AddText(result.script:GetFullName())
                    AddText("Confidence Score: " .. result.findings.confidence)
                    for _, match in pairs(result.findings.matches) do
                        if match.count then
                            AddText("• " .. match.type .. ": " .. match.pattern .. " (x" .. match.count .. ")")
                        else
                            AddText("• " .. match.type .. ": " .. match.pattern)
                        end
                    end
                end
            end

            AddText("✅ Scan Complete!")
        end

        StartUniversalAnticheatScan()
    end
})

local UNC = Tabs.MiscTab:AddSection("UNC")

UNC:AddParagraph({
    Title = "UNC Test Info",
    Content = "With this, you can find out the UNC percentage of your executor/exploit. It doesn't have the newest functions, but it's enough to get a rough overview."
})

UNC:AddButton({
    Title = "UNC Test",
    Description = "Wait until the complete check is finished. You'll know it's done when the summary is displayed.",
    Callback = function()
        Window:Dialog({
            Title = "Important",
            Content = "Caution! Running the UNC test requires a lot of performance, so use it carefully — a weak PC could crash immediately.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()

                        -- GUI Setup
                        local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
                        ScreenGui.Name = "ACScannerGui"

                        local MainFrame = Instance.new("Frame", ScreenGui)
                        MainFrame.Size = UDim2.new(0, 500, 0, 600)
                        MainFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
                        MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                        MainFrame.BorderSizePixel = 1
                        MainFrame.BorderColor3 = Color3.fromRGB(100, 100, 100)
                        MainFrame.Name = "ScanWindow"
                        MainFrame.Style = Enum.FrameStyle.RobloxRound

                        local Scroll = Instance.new("ScrollingFrame", MainFrame)
                        Scroll.Size = UDim2.new(1, 0, 1, -30)
                        Scroll.CanvasSize = UDim2.new(0, 0, 10, 0)
                        Scroll.ScrollBarThickness = 4
                        Scroll.BackgroundTransparency = 1

                        local UIList = Instance.new("UIListLayout", Scroll)
                        UIList.SortOrder = Enum.SortOrder.LayoutOrder
                        UIList.Padding = UDim.new(0, 6) -- Mehr Abstand zwischen Texten

                        -- Innenabstand (Padding)
                        local padding = Instance.new("UIPadding", Scroll)
                        padding.PaddingLeft = UDim.new(0, 10)
                        padding.PaddingRight = UDim.new(0, 10)
                        padding.PaddingTop = UDim.new(0, 10)
                        padding.PaddingBottom = UDim.new(0, 10)

                        local function AddText(msg)
                            local label = Instance.new("TextLabel", Scroll)
                            label.Size = UDim2.new(1, 0, 0, 20)
                            label.BackgroundTransparency = 1
                            label.TextColor3 = Color3.fromRGB(200, 200, 200)
                            label.Font = Enum.Font.Code
                            label.TextXAlignment = Enum.TextXAlignment.Left
                            label.TextWrapped = true
                            label.Text = msg
                            label.TextSize = 14
                            return label
                        end

                        local closeBtn = Instance.new("TextButton", MainFrame)
                        closeBtn.Size = UDim2.new(0, 60, 0, 25)
                        closeBtn.Position = UDim2.new(1, -65, 0, 5)
                        closeBtn.Text = "Close"
                        closeBtn.Font = Enum.Font.Code
                        closeBtn.TextSize = 14
                        closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                        closeBtn.TextColor3 = Color3.new(1, 1, 1)
                        closeBtn.MouseButton1Click:Connect(function()
                            ScreenGui:Destroy()
                        end)

                        local totalTests = 0
                        local passedTests = 0
                        
                        local function printResult(testName, success)
                            totalTests = totalTests + 1
                            if success then 
                                passedTests = passedTests + 1
                                AddText("✅ " .. testName .. " passed!") 
                            else 
                                AddText("❌ " .. testName .. " failed!") 
                            end
                        end
                        
                        local function testBasicFunctions()
                            printResult("Print Function", pcall(function() 
                                AddText("test", 123, true, {key = "value"}, function() end)
                            end))
                        
                            printResult("Warn Function", pcall(function()
                                warn("[ERROR]", debug.traceback("test warning", 2))
                            end))
                        
                            printResult("Type Function", type("test") == "string" 
                                and type(123) == "number" 
                                and type(true) == "boolean"
                                and type({}) == "table"
                                and type(function() end) == "function")
                        
                            printResult("LoadString", pcall(function()
                                local x = 10
                                assert(loadstring("local y = ... return y + 5")(x) == 15)
                            end))
                        
                            printResult("Assert", pcall(function()
                                assert(type(1) == "number" and 1 > 0, "Invalid number")
                                assert(type("test") == "string" and #"test" > 0, "Invalid string")
                            end))
                        
                            printResult("Error Handling", pcall(function()
                                local success, result = xpcall(
                                    function() error({code = 500, message = "test error"}) end,
                                    function(err) return err end
                                )
                                assert(not success and result.code == 500)
                            end))
                        
                            printResult("Coroutine", pcall(function()
                                local co = coroutine.create(function(x)
                                    local y = coroutine.yield(x + 1)
                                    return y * 2
                                end)
                                local _, first = coroutine.resume(co, 5)
                                local _, result = coroutine.resume(co, first)
                                assert(result == 12)
                            end))

                            printResult("Table Functions", pcall(function()
                                local t = {1, 2, 3}
                                table.insert(t, 2, 4)
                                table.sort(t)
                                assert(table.concat(t, ",") == "1, 2, 3, 4")
                            end))
                        
                            printResult("Math Functions", pcall(function()
                                assert(math.abs(math.sin(math.pi/2) - 1) < 0.0001)
                                assert(math.floor(math.log(math.exp(5))) == 5)
                                assert(math.min(math.random(), 1) <= 1)
                            end))
                        
                            printResult("String Functions", pcall(function()
                                local str = "Hello World"
                                assert(string.format("%q %d %.2f", str, 42, math.pi) == '"Hello World" 42 3.14')
                                assert(string.match(str:lower(), "^h%w+") == "hello")
                                assert(string.gsub(str, "(%w)(%w+)", "%1.") == "H. W.")
                            end))
                        end
                        
                        local function testRobloxBasics()
                            printResult("Game Hierarchy", pcall(function()
                                assert(game.Parent == nil and game:IsA("DataModel"))
                                assert(typeof(game:GetDescendants()[1]) == "Instance")
                            end))
                        
                            printResult("Workspace Physics", pcall(function()
                                local part = Instance.new("Part")
                                part.Anchored = false
                                part.Position = Vector3.new(0, 100, 0)
                                part.Parent = workspace
                                task.wait(0.1)
                                assert(part.Position.Y < 100) 
                                part:Destroy()  -- Zerstöre den Part
                            end))
                        
                            printResult("Service Interaction", pcall(function()
                                local players = game:GetService("Players")
                                local lighting = game:GetService("Lighting")
                                local runService = game:GetService("RunService")
                                assert(players and lighting and runService)
                                assert(players:IsA("Players") and lighting:IsA("Lighting"))
                            end))
                        
                            printResult("Instance Manipulation", pcall(function()
                                local model = Instance.new("Model")
                                local part = Instance.new("Part")
                                part.Size = Vector3.new(2, 3, 4)
                                part.CFrame = CFrame.new(5, 5, 5) * CFrame.Angles(math.rad(45), 0, 0)
                                part.Material = Enum.Material.Neon
                                part.Parent = model
                                assert(model:FindFirstChild("Part") == part)
                                assert(part.Size == Vector3.new(2, 3, 4))
                                model:Destroy()  -- Zerstöre das Modell und alle seine Teile
                            end))
                        
                            printResult("Event Handling", pcall(function()
                                local part = Instance.new("Part")
                                local connections = {}
                                local eventsFired = {changed = false, touched = false}
                                
                                table.insert(connections, part.Changed:Connect(function(property)
                                    eventsFired.changed = property == "Position"
                                end))
                                
                                table.insert(connections, part.Touched:Connect(function(hit)
                                    eventsFired.touched = hit:IsA("BasePart")
                                end))
                                
                                part.Position = Vector3.new(10, 10, 10)
                                assert(eventsFired.changed)
                                
                                -- Verbindungen und das Part entfernen
                                for _, connection in ipairs(connections) do
                                    connection:Disconnect()
                                end
                                part:Destroy()  -- Zerstöre den Part
                            end))
                        end
                        
                        local function testEnvironmentFunctions()
                            printResult("Getgenv", pcall(function()
                                local env = getgenv()
                                env.testVar = "test"
                                assert(env.testVar == "test")
                            end))
                            
                            printResult("Getrenv", pcall(function()
                                local renv = getrenv()
                                assert(type(renv) == "table")
                                assert(renv._G)
                            end))
                            
                            printResult("Getsenv", pcall(function()
                                local senv = getsenv(script)
                                assert(type(senv) == "table")
                                assert(senv.printResult)
                            end))
                            
                            printResult("GetfEnv", pcall(function()
                                local fenv = getfenv(2)
                                assert(type(fenv) == "table")
                                assert(fenv.script)
                            end))
                            
                            printResult("SetfEnv", pcall(function()
                                local newEnv = {
                                    print = print,
                                    assert = assert
                                }
                                local testFunc = function() return _ENV end
                                setfenv(testFunc, newEnv)
                                assert(getfenv(testFunc) == newEnv)
                            end))
                            
                            printResult("CheckCaller", pcall(function()
                                local result = checkcaller()
                                assert(type(result) == "boolean")
                            end))
                            
                            printResult("NewCClosure", pcall(function()
                                local wrapped = newcclosure(function(x) return x * 2 end)
                                assert(wrapped(5) == 10)
                            end))
                            
                            printResult("LoadLibrary", pcall(function()
                                local util = loadlibrary("RbxUtility")
                                assert(type(util) == "userdata")
                            end))
                            
                            printResult("IsLuau", pcall(function()
                                local luauEnabled = isluau()
                                assert(type(luauEnabled) == "boolean")
                            end))
                            
                            printResult("GetThreadIdentity", pcall(function()
                                local identity = getthreadidentity()
                                assert(type(identity) == "number")
                                assert(identity >= 0)
                            end))
                        end
                        
                        local function testMemoryManipulation()
                            printResult("GetRawMetatable", pcall(function()
                                local mt = getrawmetatable(game)
                                assert(type(mt) == "table")
                                assert(mt.__index)
                            end))
                            
                            printResult("SetRawMetatable", pcall(function()
                                local tbl = {}
                                local mt = {
                                    __index = function(t,k) return k.."_modified" end,
                                    __newindex = function(t,k,v) rawset(t,k.."_protected",v) end
                                }
                                setrawmetatable(tbl, mt)
                                assert(tbl.test == "test_modified")
                            end))
                            
                            printResult("HookFunction", pcall(function()
                                local original = print
                                local callCount = 0
                                hookfunction(print, function(...)
                                    callCount = callCount + 1
                                    return original(...)
                                end)
                                print("test")
                                assert(callCount == 1)
                            end))
                            
                            printResult("HookMetamethod", pcall(function()
                                local original = game.__index
                                hookmetamethod(game, "__index", function(self, key)
                                    if key == "HookedProperty" then return "Hooked" end
                                    return original(self, key)
                                end)
                                assert(game.HookedProperty == "Hooked")
                            end))
                            
                            printResult("GetNamecallMethod", pcall(function()
                                local method = getnamecallmethod()
                                assert(type(method) == "string")
                            end))
                            
                            printResult("SetNamecallMethod", pcall(function()
                                setnamecallmethod("FireServer")
                                assert(getnamecallmethod() == "FireServer")
                            end))
                            
                            printResult("GetGc", pcall(function()
                                local gc = getgc(true)
                                assert(type(gc) == "table")
                                assert(#gc > 0)
                            end))
                            
                            printResult("GetRegistry", pcall(function()
                                local reg = getreg()
                                assert(type(reg) == "table")
                                assert(#reg > 0)
                            end))
                            
                            printResult("GetConstants", pcall(function()
                                local constants = getconstants(print)
                                assert(type(constants) == "table")
                            end))
                            
                            printResult("GetUpvalues", pcall(function()
                                local upvalues = getupvalues(print)
                                assert(type(upvalues) == "table")
                            end))
                        end
                        
                        local function testUIFunctions()
                            printResult("Drawing Complex", pcall(function()
                                local square = Drawing.new("Square")
                                square.Size = Vector2.new(100, 100)
                                square.Position = Vector2.new(200, 200)
                                square.Color = Color3.fromRGB(255, 0, 0)
                                square.Filled = true
                                square.Transparency = 0.5
                                square.Visible = true
                                -- Zerstören, wenn nicht mehr benötigt
                                square:Destroy()
                            end))
                            
                            printResult("Mouse Tracking", pcall(function()
                                local mouse = game:GetService("Players").LocalPlayer:GetMouse()
                                mouse.Move:Connect(function()
                                    return mouse.X, mouse.Y, mouse.Hit
                                end)
                            end))
                            
                            printResult("Input Handling", pcall(function()
                                local UIS = game:GetService("UserInputService")
                                UIS.InputBegan:Connect(function(input, gameProcessed)
                                    if input.KeyCode == Enum.KeyCode.Space then
                                        return "Space Pressed"
                                    end
                                end)
                            end))
                            
                            printResult("Dynamic GUI", pcall(function()
                                local screenGui = Instance.new("ScreenGui")
                                local frame = Instance.new("Frame")
                                frame.Size = UDim2.new(0, 200, 0, 200)
                                frame.Position = UDim2.new(0.5, -100, 0.5, -100)
                                frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                                
                                local textLabel = Instance.new("TextLabel")
                                textLabel.Size = UDim2.new(1, -20, 0, 30)
                                textLabel.Position = UDim2.new(0, 10, 0, 10)
                                textLabel.Text = "Dynamic GUI Test"
                                textLabel.Parent = frame
                                
                                local button = Instance.new("TextButton")
                                button.Size = UDim2.new(0, 100, 0, 30)
                                button.Position = UDim2.new(0.5, -50, 0.5, -15)
                                button.Text = "Click Me"
                                button.Parent = frame
                                
                                frame.Parent = screenGui
                                -- Zerstören, wenn nicht mehr benötigt
                                screenGui:Destroy()
                            end))
                            
                            printResult("Viewport Manipulation", pcall(function()
                                local viewport = Instance.new("ViewportFrame")
                                local camera = Instance.new("Camera")
                                local part = Instance.new("Part")
                                
                                viewport.Size = UDim2.new(0, 300, 0, 300)
                                viewport.Position = UDim2.new(0.5, -150, 0.5, -150)
                                viewport.CurrentCamera = camera
                                
                                part.Size = Vector3.new(5, 5, 5)
                                part.CFrame = CFrame.new(0, 0, -10)
                                part.Parent = viewport
                                
                                camera.CFrame = CFrame.new(0, 0, -15) * CFrame.lookAt(Vector3.new(0,0,-15), Vector3.new(0,0,-10))
                                -- Zerstören, wenn nicht mehr benötigt
                                viewport:Destroy()
                                part:Destroy()
                                camera:Destroy()
                            end))
                        end                        
                        
                        local function testNetworkFunctions()
                            printResult("Advanced HTTP", pcall(function()
                                local response = game:HttpGet("https://api.github.com/users/github")
                                local success = response:find("login") ~= nil
                                
                                local postResponse = request({
                                    Url = "https://httpbin.org/post",
                                    Method = "POST",
                                    Headers = {
                                        ["Content-Type"] = "application/json"
                                    },
                                    Body = game:GetService("HttpService"):JSONEncode({
                                        test = "data",
                                        number = 123
                                    })
                                })
                                return success and postResponse.Success
                            end))
                            
                            printResult("WebSocket Handler", pcall(function()
                                local ws = WebSocket.connect("wss://echo.websocket.org")
                                ws.OnMessage:Connect(function(msg)
                                    if msg == "ping" then
                                        ws:Send("pong")
                                    end
                                end)
                                ws:Send("ping")
                            end))
                            
                            printResult("Network Monitoring", pcall(function()
                                local NetworkClient = game:GetService("NetworkClient")
                                local MarketplaceService = game:GetService("MarketplaceService")
                                local MessagingService = game:GetService("MessagingService")
                                
                                MessagingService:SubscribeAsync("TestChannel", function(message)
                                    return message.Data
                                end)
                                
                                MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, gamePassId, wasPurchased)
                                    return {player = player, gamePassId = gamePassId, purchased = wasPurchased}
                                end)
                            end))
                            
                            printResult("Teleport Handler", pcall(function()
                                game:GetService("TeleportService").TeleportInitiated:Connect(function(teleportData)
                                    queue_on_teleport([[
                                        local data = ...
                                        print("Teleported with data:", data)
                                    ]])
                                end)
                            end))
                        end
                        
                        local function testPhysicsFunctions()
                            printResult("Physics Service Configuration", pcall(function()
                                local PhysicsService = game:GetService("PhysicsService")
                                local collisionGroupId = PhysicsService:CreateCollisionGroup("TestGroup")
                                PhysicsService:CollisionGroupSetCollidable("TestGroup", "Default", false)
                                return collisionGroupId ~= nil
                            end))
                            
                            printResult("Advanced Raycast", pcall(function()
                                local raycastParams = RaycastParams.new()
                                raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                                raycastParams.FilterDescendantsInstances = {game.Players.LocalPlayer.Character}
                                local result = workspace:Raycast(
                                    Vector3.new(0, 100, 0), 
                                    Vector3.new(0, -200, 0), 
                                    raycastParams
                                )
                                return result and result.Position
                            end))
                            
                            printResult("Complex CFrame Operations", pcall(function()
                                local cf = CFrame.new(10, 20, 30) * CFrame.Angles(math.rad(45), math.rad(90), math.rad(180))
                                local inverse = cf:Inverse()
                                local lookAt = CFrame.lookAt(Vector3.new(0,5,0), Vector3.new(10,5,10))
                                return cf:ToObjectSpace(lookAt)
                            end))
                            
                            printResult("Vector3 Mathematics", pcall(function()
                                local v1 = Vector3.new(1, 2, 3)
                                local v2 = Vector3.new(4, 5, 6)
                                local cross = v1:Cross(v2)
                                local dot = v1:Dot(v2)
                                local lerp = v1:Lerp(v2, 0.5)
                                return cross.Magnitude > 0
                            end))
                            
                            printResult("Region3 Intersection", pcall(function()
                                local region = Region3.new(
                                    Vector3.new(-10, -10, -10),
                                    Vector3.new(10, 10, 10)
                                )
                                local parts = workspace:FindPartsInRegion3(region, nil, math.huge)
                                return #parts > 0
                            end))
                            
                            printResult("Color Operations", pcall(function()
                                local color = Color3.fromHSV(0.5, 1, 1)
                                local lerped = color:Lerp(Color3.new(1,0,0), 0.5)
                                local h, s, v = color:ToHSV()
                                return h >= 0 and s <= 1 and v <= 1
                            end))
                            
                            printResult("Advanced Tweening", pcall(function()
                                local TweenService = game:GetService("TweenService")
                                local info = TweenInfo.new(
                                    2,                     
                                    Enum.EasingStyle.Bounce,
                                    Enum.EasingDirection.InOut,
                                    2,                    
                                    true,                 
                                    0.1                   
                                )
                                return TweenService:Create(Instance.new("Part"), info, {
                                    Size = Vector3.new(5,5,5),
                                    CFrame = CFrame.new(0,10,0)
                                })
                            end))
                            
                            printResult("Debris Management", pcall(function()
                                local Debris = game:GetService("Debris")
                                local part = Instance.new("Part")
                                Debris:AddItem(part, 5)
                                return Debris:GetUnreplicatedInstances()
                            end))
                            
                            printResult("RunService Binding", pcall(function()
                                local RunService = game:GetService("RunService")
                                local connection = RunService.Heartbeat:Connect(function() end)
                                local stepped = RunService.Stepped:Connect(function() end)
                                connection:Disconnect()
                                stepped:Disconnect()
                                return RunService:IsStudio()
                            end))
                        end
                        
                        local function testSecurityFunctions()
                            printResult("Protected GUI Hierarchy", pcall(function()
                                local gui = Instance.new("ScreenGui")
                                local frame = Instance.new("Frame", gui)
                                frame.Size = UDim2.new(1, 0, 1, 0)
                                protect_gui(gui)
                                return gui.Parent ~= nil
                            end))
                            
                            printResult("Secure Environment", pcall(function()
                                local env = getfenv(0)
                                local protected = secure_call(function()
                                    return env._G ~= nil
                                end, game)
                                return protected
                            end))
                            
                            printResult("Thread Management", pcall(function()
                                local originalIdentity = get_thread_context()
                                set_thread_identity(7)
                                local success = pcall(function()
                                    return game:GetService("MarketplaceService")
                                end)
                                set_thread_identity(originalIdentity)
                                return success
                            end))
                            
                            printResult("Cryptography", pcall(function()
                                local data = "Sensitive information"
                                local key = syn.crypt.random(32)
                                local encrypted = syn.crypt.encrypt(data, key)
                                local decrypted = syn.crypt.decrypt(encrypted, key)
                                return data == decrypted
                            end))
                            
                            printResult("Clipboard Integration", pcall(function()
                                local data = {
                                    timestamp = os.time(),
                                    random = math.random(),
                                    info = "Test data"
                                }
                                setclipboard(game:GetService("HttpService"):JSONEncode(data))
                                return true
                            end))
                        end
                        
                        local function testDebugFunctions()
                            printResult("Debug Info", pcall(function()
                                local info = debug.info(print, "slnfa")
                                assert(type(info) == "table")
                                assert(info.source and info.linedefined and info.name)
                            end))
                        
                            printResult("Debug GetUpvalue", pcall(function()
                                local closure = function() local x = 1; return function() return x end end
                                local innerFunc = closure()
                                local name, value = debug.getupvalue(innerFunc, 1)
                                assert(name == "x" and value == 1)
                            end))
                        
                            printResult("Debug SetUpvalue", pcall(function()
                                local closure = function() local x = 1; return function() return x end end
                                local innerFunc = closure()
                                debug.setupvalue(innerFunc, 1, 100)
                                assert(innerFunc() == 100)
                            end))
                        
                            printResult("Debug GetProtos", pcall(function()
                                local function test()
                                    local function inner1() end
                                    local function inner2() end
                                    return inner1, inner2
                                end
                                local protos = debug.getprotos(test)
                                assert(#protos == 2)
                            end))
                        
                            printResult("Debug GetStack", pcall(function()
                                local function deep3() return debug.getstack(3) end
                                local function deep2() return deep3() end
                                local function deep1() return deep2() end
                                local stack = deep1()
                                assert(type(stack) == "table")
                            end))
                        
                            printResult("Debug GetLocal", pcall(function()
                                local testVar = "test"
                                local name, value = debug.getlocal(1, 1)
                                assert(name == "testVar" and value == "test")
                            end))
                        
                            printResult("Debug SetLocal", pcall(function()
                                local testVar = "old"
                                debug.setlocal(1, 1, "new")
                                assert(testVar == "new")
                            end))
                        
                            printResult("Debug GetMetatable", pcall(function()
                                local t = setmetatable({}, {__index = function() return true end})
                                local mt = debug.getmetatable(t)
                                assert(type(mt.__index) == "function")
                            end))
                        
                            printResult("Debug SetMetatable", pcall(function()
                                local t = {}
                                local mt = {__index = function() return "intercepted" end}
                                debug.setmetatable(t, mt)
                                assert(t.anything == "intercepted")
                            end))
                        
                            printResult("Debug GetFenv", pcall(function()
                                local function test() end
                                local env = debug.getfenv(test)
                                assert(type(env) == "table")
                                assert(env._G == getgenv())
                            end))
                        end
                        
                        local function testMiscFunctions()
                            printResult("Executor Information", pcall(function()
                                local executor = identifyexecutor()
                                local name = getexecutorname()
                                local debugger = isdbgpresent()
                                return {executor = executor, name = name, debugger = debugger}
                            end))
                        
                            printResult("Instance Analysis", pcall(function()
                                local instances = getinstancelist()
                                local modules = getloadedmodules()
                                local filtered = {}
                                for _, inst in ipairs(instances) do
                                    if inst:IsA("BasePart") then
                                        table.insert(filtered, inst)
                                    end
                                end
                                return #filtered > 0 and #modules > 0
                            end))
                        
                            printResult("Event Handling", pcall(function()
                                local part = Instance.new("Part")
                                local connections = getconnections(part.Changed)
                                for _, connection in ipairs(connections) do
                                    connection:Enable()
                                    connection:Fire()
                                    connection:Disable() 
                                end
                                return #connections
                            end))
                        
                            printResult("Input Simulation", pcall(function()
                              
                                for i = 1, 5 do
                                    mousemoveabs(100 + i * 50, 100 + math.sin(i) * 30)
                                    task.wait(0.1)
                                end
                                
                              
                                mouse1click()
                                mouse2click()
                                mouse1press()
                                task.wait(0.1)
                                mouse1release()
                                
                              
                                keypress(0x11)
                                keypress(0x41)
                                task.wait(0.1)
                                keyrelease(0x11)
                                keyrelease(0x41)
                            end))
                        
                            printResult("Spatial Analysis", pcall(function()
                                local points = {
                                    Vector3.new(0, 0, 0),
                                    Vector3.new(10, 5, 3),
                                    Vector3.new(-5, 2, 8)
                                }
                                local closest = nil
                                local minDist = math.huge
                                
                                for _, point in ipairs(points) do
                                    local dist = getclosestpoint(point).Magnitude
                                    if dist < minDist then
                                        minDist = dist
                                        closest = point
                                    end
                                end
                                return closest
                            end))
                        end
                        local function testAdditionalServices()
                            printResult("SoundService", pcall(function()
                                local soundService = game:GetService("SoundService")
                                soundService.RespectFilteringEnabled = false
                                local sound = Instance.new("Sound")
                                sound.SoundId = "rbxasset://sounds/victory.ogg"
                                sound.Volume = 0.5
                                sound.Parent = soundService
                                sound:Play()
                                -- Zerstört den Sound nach der Wiedergabe
                                sound:Destroy()
                                return sound.IsPlaying
                            end))
                        
                            printResult("Lighting", pcall(function()
                                local lighting = game:GetService("Lighting")
                                lighting.Brightness = 2
                                lighting.ClockTime = 14.5
                                lighting.FogEnd = 100
                                lighting.GlobalShadows = true
                                
                                local blur = Instance.new("BlurEffect")
                                blur.Size = 24
                                blur.Parent = lighting
                                -- Zerstört den BlurEffect nach der Verwendung
                                blur:Destroy()
                                return lighting.ClockTime
                            end))
                        
                            printResult("ReplicatedStorage", pcall(function()
                                local rs = game:GetService("ReplicatedStorage")
                                local folder = Instance.new("Folder")
                                folder.Name = "SharedAssets"
                                
                                local remoteEvent = Instance.new("RemoteEvent")
                                remoteEvent.Name = "DataSync"
                                remoteEvent.Parent = folder
                                
                                folder.Parent = rs
                                -- Zerstört den Ordner und das RemoteEvent nach der Verwendung
                                folder:Destroy()
                                return #rs:GetChildren()
                            end))
                        
                            printResult("StarterGui", pcall(function()
                                local sg = game:GetService("StarterGui")
                                sg:SetCore("SendNotification", {
                                    Title = "Test",
                                    Text = "Advanced StarterGui Test",
                                    Duration = 5
                                })
                                
                                local screenGui = Instance.new("ScreenGui")
                                screenGui.ResetOnSpawn = false
                                screenGui.Parent = sg
                                -- Zerstört das ScreenGui nach der Verwendung
                                screenGui:Destroy()
                                return screenGui.Parent == sg
                            end))
                        
                            printResult("StarterPack", pcall(function()
                                local sp = game:GetService("StarterPack")
                                local tool = Instance.new("Tool")
                                tool.Name = "TestTool"
                                
                                local handle = Instance.new("Part")
                                handle.Name = "Handle"
                                handle.Parent = tool
                                
                                tool.Parent = sp
                                -- Zerstört das Tool nach der Verwendung
                                tool:Destroy()
                                return tool.Parent == sp
                            end))
                        
                            printResult("StarterPlayer", pcall(function()
                                local splayer = game:GetService("StarterPlayer")
                                splayer.AutoJumpEnabled = false
                                splayer.CameraMaxZoomDistance = 100
                                splayer.DevComputerCameraMovementMode = Enum.DevComputerCameraMovementMode.UserChoice
                                splayer.DevTouchCameraMovementMode = Enum.DevTouchCameraMovementMode.Classic
                                return splayer.AutoJumpEnabled == false
                            end))
                        
                            printResult("Teams", pcall(function()
                                local teams = game:GetService("Teams")
                                local team1 = Instance.new("Team")
                                team1.Name = "Red Team"
                                team1.TeamColor = BrickColor.new("Really red")
                                team1.AutoAssignable = true
                                team1.Parent = teams
                                
                                local team2 = Instance.new("Team")
                                team2.Name = "Blue Team"
                                team2.TeamColor = BrickColor.new("Really blue")
                                team2.AutoAssignable = true
                                team2.Parent = teams
                                -- Zerstört die Teams nach der Verwendung
                                team1:Destroy()
                                team2:Destroy()
                                return #teams:GetChildren() >= 2
                            end))
                        
                            printResult("Chat", pcall(function()
                                local chat = game:GetService("Chat")
                                chat:FilterStringAsync("Test message", game.Players.LocalPlayer.UserId)
                                chat.BubbleChatEnabled = true
                                chat.LoadDefaultChat = true
                                return chat.BubbleChatEnabled
                            end))
                        
                            printResult("LocalizationService", pcall(function()
                                local localization = game:GetService("LocalizationService")
                                local translator = localization:GetTranslatorForPlayer(game.Players.LocalPlayer)
                                translator:Translate(workspace, "Hello World", "en")
                                return translator ~= nil
                            end))
                        
                            printResult("TestService", pcall(function()
                                local testService = game:GetService("TestService")
                                testService:Message("Running advanced tests")
                                testService.AutoRuns = true
                                testService:Check(true, "Condition check passed")
                                return testService.AutoRuns
                            end))
                        end                        
                        
                        local function testExtraFunctions()
                            printResult("FireSignal", pcall(function()
                                local bindableEvent = Instance.new("BindableEvent")
                                local triggered = false
                                bindableEvent.Event:Connect(function(data)
                                    triggered = data.test == "success"
                                end)
                                firesignal(bindableEvent.Event, {test = "success"})
                                -- Zerstört das BindableEvent nach der Verwendung
                                bindableEvent:Destroy()
                                return triggered
                            end))
                        
                            printResult("FireClickDetector", pcall(function()
                                local clickDetector = Instance.new("ClickDetector")
                                local part = Instance.new("Part")
                                clickDetector.Parent = part
                                local clicked = false
                                clickDetector.MouseClick:Connect(function()
                                    clicked = true
                                end)
                                fireclickdetector(clickDetector, 10)
                                -- Zerstört den ClickDetector und Part nach der Verwendung
                                clickDetector:Destroy()
                                part:Destroy()
                                return clicked
                            end))
                        
                            printResult("FireProximityPrompt", pcall(function()
                                local prompt = Instance.new("ProximityPrompt")
                                prompt.ActionText = "Test Action"
                                prompt.ObjectText = "Test Object"
                                prompt.KeyboardKeyCode = Enum.KeyCode.E
                                prompt.RequiresLineOfSight = false
                                prompt.MaxActivationDistance = 10
                                
                                local triggered = false
                                prompt.Triggered:Connect(function()
                                    triggered = true
                                end)
                                fireproximityprompt(prompt)
                                -- Zerstört den ProximityPrompt nach der Verwendung
                                prompt:Destroy()
                                return triggered
                            end))
                        
                            printResult("FireTouchInterest", pcall(function()
                                local part1 = Instance.new("Part")
                                local part2 = Instance.new("Part")
                                local touched = false
                                part1.Touched:Connect(function(hit)
                                    if hit == part2 then
                                        touched = true
                                    end
                                end)
                                firetouchinterest(part1, part2, 0)
                                task.wait(0.1)
                                firetouchinterest(part1, part2, 1)
                                -- Zerstört die Parts nach der Verwendung
                                part1:Destroy()
                                part2:Destroy()
                                return touched
                            end))
                        
                            printResult("Advanced Instance Operations", pcall(function()
                                local success = true
                                success = success and game:IsA("DataModel")
                                
                                local children = game:GetChildren()
                                success = success and #children > 0
                                
                                local descendants = game:GetDescendants()
                                success = success and #descendants > #children
                                
                                local workspace = game:FindFirstAncestor("Workspace") or game:WaitForChildOfClass("Workspace")
                                success = success and workspace:IsA("Workspace")
                                
                                local firstScript = game:FindFirstDescendant("Script")
                                if firstScript then
                                    success = success and firstScript:IsA("LuaSourceContainer")
                                end
                                
                                return success
                            end))
                        end                        
                        
                        local function testAdvancedMemoryFunctions()
                            printResult("GetProtos", pcall(function()
                                local function testFunc()
                                    local function inner1() end
                                    local function inner2() end
                                    return function() inner1(); inner2() end
                                end
                                local protos = getprotos(testFunc)
                                assert(#protos == 3)
                                return protos
                            end))
                        
                            printResult("GetStacks", pcall(function()
                                local function deep3() return getstacks() end
                                local function deep2() return deep3() end
                                local function deep1() return deep2() end
                                local stacks = deep1()
                                assert(#stacks >= 3)
                                return stacks
                            end))
                        
                            printResult("GetStackVariables", pcall(function()
                                local testVar1, testVar2 = "test1", {key = "value"}
                                local vars = getstackvar(1)
                                assert(vars.testVar1 == "test1" and vars.testVar2.key == "value")
                                return vars
                            end))
                        
                            printResult("GetClosures", pcall(function()
                                local function genClosures()
                                    local x = 1
                                    return function() x = x + 1 end,
                                           function() return x end
                                end
                                local closures = getclosures(genClosures)
                                assert(#closures == 2)
                                -- Optional: Zerstöre closures, falls nötig
                                for _, closure in ipairs(closures) do
                                    closure = nil
                                end
                                return closures
                            end))
                        
                            printResult("GetInfo", pcall(function()
                                local info = getinfo(print)
                                assert(info.source and info.linedefined and info.what == "C")
                                return info
                            end))
                        
                            printResult("GetLocals", pcall(function()
                                local complex = {nested = {value = 123}}
                                local locals = getlocals(1)
                                assert(locals.complex.nested.value == 123)
                                return locals
                            end))
                        
                            printResult("GetRegisters", pcall(function()
                                local function testRegisters()
                                    local a, b = 1, 2
                                    return a + b
                                end
                                local regs = getregisters(testRegisters)
                                assert(#regs > 0)
                                return regs
                            end))
                        
                            printResult("SetStack", pcall(function()
                                local original = {value = 1}
                                local new = {value = 2}
                                setstack(1, new)
                                assert(original.value == 2)
                                return true
                            end))
                        
                            printResult("TableToString", pcall(function()
                                local complexTable = {
                                    nested = {array = {1,2,3}},
                                    func = function() end,
                                    thread = coroutine.create(function() end)
                                }
                                local str = tabletostring(complexTable)
                                assert(type(str) == "string" and #str > 0)
                                return str
                            end))
                        
                            printResult("LoadTable", pcall(function()
                                local tableStr = [[{
                                    number = 123,
                                    string = "test",
                                    array = {1,2,3},
                                    nested = {key = "value"}
                                }]]
                                local loaded = loadtable(tableStr)
                                assert(loaded.number == 123 and loaded.nested.key == "value")
                                return loaded
                            end))
                        end                        
                        
                        local function testFileSystemFunctions()
                            printResult("File Operations", pcall(function()
                            
                                makefolder("testRoot")
                                makefolder("testRoot/subFolder")
                                
                        
                                local testData = {
                                    timestamp = os.time(),
                                    array = {1,2,3},
                                    nested = {key = "value"}
                                }
                                local jsonData = game:GetService("HttpService"):JSONEncode(testData)
                                writefile("testRoot/data.json", jsonData)
                                
                               
                                for i = 1, 3 do
                                    appendfile("testRoot/log.txt", 
                                        string.format("[%s] Log entry %d\n", 
                                        os.date(), i))
                                end
                                
                                local readJson = game:GetService("HttpService"):JSONDecode(
                                    readfile("testRoot/data.json"))
                                assert(readJson.timestamp == testData.timestamp)
                                
                                local files = listfiles("testRoot")
                                assert(#files >= 2) 
                                
                                writefile("testRoot/script.lua", [[
                                    return function(x) return x * 2 end
                                ]])
                                local fn = loadfile("testRoot/script.lua")()
                                assert(fn(5) == 10)
                                
                                delfile("testRoot/data.json")
                                delfile("testRoot/log.txt")
                                delfile("testRoot/script.lua")
                                delfolder("testRoot/subFolder")
                                delfolder("testRoot")
                                
                                return true
                            end))
                        end
                        
                        local function testDrawingFunctions()
                            printResult("Advanced Line Drawing", pcall(function()
                                local line = Drawing.new("Line")
                                line.Visible = true
                                line.From = Vector2.new(100, 100)
                                line.To = Vector2.new(300, 300)
                                line.Color = Color3.fromRGB(255, 0, 0)
                                line.Thickness = 2
                                line.Transparency = 0.5
                                local result = line.From.X == 100 and line.To.Y == 300
                                line:Destroy()  -- Zerstören des Objekts nach dem Test
                                return result
                            end))
                        
                            printResult("Dynamic Circle", pcall(function()
                                local circle = Drawing.new("Circle")
                                circle.Visible = true
                                circle.Position = Vector2.new(200, 200)
                                circle.Radius = 50
                                circle.Color = Color3.fromHSV(0, 1, 1)
                                circle.NumSides = 32
                                circle.Filled = true
                                
                                for i = 1, 10 do
                                    circle.Radius = 50 + math.sin(i) * 10
                                    task.wait(0.1)
                                end
                                local result = circle.NumSides == 32
                                circle:Destroy()  -- Zerstören des Objekts nach dem Test
                                return result
                            end))
                        
                            printResult("Animated Text", pcall(function()
                                local text = Drawing.new("Text")
                                text.Visible = true
                                text.Position = Vector2.new(150, 150)
                                text.Size = 24
                                text.Center = true
                                text.Outline = true
                                text.Font = Drawing.Fonts.UI
                                
                                local messages = {"Hello", "World", "Testing", "Drawing"}
                                for _, msg in ipairs(messages) do
                                    text.Text = msg
                                    text.Color = Color3.fromRGB(
                                        math.random(0, 255),
                                        math.random(0, 255),
                                        math.random(0, 255)
                                    )
                                    task.wait(0.2)
                                end
                                local result = text.Size == 24
                                text:Destroy()  -- Zerstören des Objekts nach dem Test
                                return result
                            end))
                        
                            printResult("Complex Image Manipulation", pcall(function()
                                local image = Drawing.new("Image")
                                image.Visible = true
                                image.Position = Vector2.new(400, 100)
                                image.Size = Vector2.new(200, 200)
                                image.Data = game:HttpGet("https://example.com/test.png")
                                image.Rounding = 8
                                
                                for i = 0, 1, 0.1 do
                                    image.Transparency = i
                                    task.wait(0.1)
                                end
                                local result = image.Rounding == 8
                                image:Destroy()  -- Zerstören des Objekts nach dem Test
                                return result
                            end))
                        
                            printResult("Interactive Triangle", pcall(function()
                                local triangle = Drawing.new("Triangle")
                                triangle.Visible = true
                                triangle.PointA = Vector2.new(100, 100)
                                triangle.PointB = Vector2.new(200, 300)
                                triangle.PointC = Vector2.new(300, 100)
                                triangle.Color = Color3.fromRGB(0, 255, 0)
                                triangle.Filled = true
                                triangle.Transparency = 0.8
                                
                                local function rotateTri(angle)
                                    local center = Vector2.new(200, 200)
                                    local function rotatePoint(point)
                                        local x = point.X - center.X
                                        local y = point.Y - center.Y
                                        return Vector2.new(
                                            x * math.cos(angle) - y * math.sin(angle) + center.X,
                                            x * math.sin(angle) + y * math.cos(angle) + center.Y
                                        )
                                    end
                                    
                                    triangle.PointA = rotatePoint(triangle.PointA)
                                    triangle.PointB = rotatePoint(triangle.PointB)
                                    triangle.PointC = rotatePoint(triangle.PointC)
                                end
                                
                                for i = 0, math.pi * 2, 0.2 do
                                    rotateTri(i)
                                    task.wait(0.05)
                                end
                                local result = true
                                triangle:Destroy()  -- Zerstören des Objekts nach dem Test
                                return result
                            end))
                        
                            printResult("Dynamic Quad Effects", pcall(function()
                                local quad = Drawing.new("Quad")
                                quad.Visible = true
                                quad.PointA = Vector2.new(400, 100)
                                quad.PointB = Vector2.new(600, 100)
                                quad.PointC = Vector2.new(600, 300)
                                quad.PointD = Vector2.new(400, 300)
                                quad.Filled = true
                                
                                local function pulseQuad()
                                    for i = 0, math.pi * 2, 0.2 do
                                        local scale = 1 + math.sin(i) * 0.2
                                        quad.PointA = Vector2.new(400 * scale, 100 * scale)
                                        quad.PointB = Vector2.new(600 * scale, 100 * scale)
                                        quad.PointC = Vector2.new(600 * scale, 300 * scale)
                                        quad.PointD = Vector2.new(400 * scale, 300 * scale)
                                        quad.Color = Color3.fromHSV(i / (math.pi * 2), 1, 1)
                                        task.wait(0.05)
                                    end
                                end
                                
                                pulseQuad()
                                local result = true
                                quad:Destroy()  -- Zerstören des Objekts nach dem Test
                                return result
                            end))
                        
                            printResult("Drawing Layer Management", pcall(function()
                                local drawings = {}
                                for i = 1, 5 do
                                    local circle = Drawing.new("Circle")
                                    circle.Visible = true
                                    circle.Position = Vector2.new(300, 300)
                                    circle.Radius = i * 20
                                    circle.Color = Color3.fromHSV(i/5, 1, 1)
                                    circle.Transparency = 0.2
                                    circle.ZIndex = i
                                    table.insert(drawings, circle)
                                end
                                
                                local allDrawings = Drawing.getDrawings()
                                for _, drawing in ipairs(drawings) do
                                    drawing:Destroy()  -- Zerstören des Objekts nach dem Test
                                end
                                local result = #allDrawings >= 5
                                return result
                            end))
                        end                        
                        
                        AddText("🔧 ZaZa UNC Executor Test v1")
                        AddText("=============================================")
                        
                        testBasicFunctions()
                        testRobloxBasics()
                        testEnvironmentFunctions()
                        testMemoryManipulation()
                        testUIFunctions()
                        testNetworkFunctions()
                        testPhysicsFunctions()
                        testSecurityFunctions()
                        testDebugFunctions()
                        testMiscFunctions()
                        testAdditionalServices()
                        testExtraFunctions()
                        testAdvancedMemoryFunctions()
                        testFileSystemFunctions() 
                        testDrawingFunctions()
                        
                        AddText("=============================================")
                        AddText("🏁 ZaZa UNC Test Completed! 🏁")
                        AddText("📊 Final Score: " .. passedTests .. "/" .. totalTests .. " tests passed (" .. math.floor((passedTests/totalTests)*100) .. "%)")
                        if passedTests == totalTests then
                            AddText("🌟 Perfect Score! All tests passed! 🌟")
                        elseif passedTests >= totalTests * 0.8 then
                            AddText("🎉 Great Score! Most tests passed! 🎉")
                        elseif passedTests >= totalTests * 0.5 then
                            AddText("⚠️ Average Score. Some features might be missing. ⚠️")
                        else
                            AddText("❗ Low Score. Many features are not supported. ❗")
                        end
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled")
                    end
                }
            }
        })
    end
})

UNC:AddParagraph({
    Title = "More UNC Info",
    Content = "This button gives you more UNC by enabling functions your executor doesn't have yet. These functions are experimental and do not guarantee that you will get more UNC. They simply provide additional features that are intended to help increase your UNC."
})

UNC:AddButton({
    Title = "More UNC",
    Description = "Wait until the complete check is finished. You'll know it's done when the summary is displayed.",
    Callback = function()
        Window:Dialog({
            Title = "Important",
            Content = "Caution! Running the More UNC requires a lot of performance, so use it carefully — a weak PC could crash immediately.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()

                        -- GUI Setup
                        local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
                        ScreenGui.Name = "ACScannerGui"

                        local MainFrame = Instance.new("Frame", ScreenGui)
                        MainFrame.Size = UDim2.new(0, 500, 0, 600)
                        MainFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
                        MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                        MainFrame.BorderSizePixel = 1
                        MainFrame.BorderColor3 = Color3.fromRGB(100, 100, 100)
                        MainFrame.Name = "ScanWindow"
                        MainFrame.Style = Enum.FrameStyle.RobloxRound

                        local Scroll = Instance.new("ScrollingFrame", MainFrame)
                        Scroll.Size = UDim2.new(1, 0, 1, -30)
                        Scroll.CanvasSize = UDim2.new(0, 0, 10, 0)
                        Scroll.ScrollBarThickness = 4
                        Scroll.BackgroundTransparency = 1

                        local UIList = Instance.new("UIListLayout", Scroll)
                        UIList.SortOrder = Enum.SortOrder.LayoutOrder
                        UIList.Padding = UDim.new(0, 6) -- Mehr Abstand zwischen Texten

                        -- Innenabstand (Padding)
                        local padding = Instance.new("UIPadding", Scroll)
                        padding.PaddingLeft = UDim.new(0, 10)
                        padding.PaddingRight = UDim.new(0, 10)
                        padding.PaddingTop = UDim.new(0, 10)
                        padding.PaddingBottom = UDim.new(0, 10)

                        local function AddText(msg)
                            local label = Instance.new("TextLabel", Scroll)
                            label.Size = UDim2.new(1, 0, 0, 20)
                            label.BackgroundTransparency = 1
                            label.TextColor3 = Color3.fromRGB(200, 200, 200)
                            label.Font = Enum.Font.Code
                            label.TextXAlignment = Enum.TextXAlignment.Left
                            label.TextWrapped = true
                            label.Text = msg
                            label.TextSize = 14
                            return label
                        end

                        local closeBtn = Instance.new("TextButton", MainFrame)
                        closeBtn.Size = UDim2.new(0, 60, 0, 25)
                        closeBtn.Position = UDim2.new(1, -65, 0, 5)
                        closeBtn.Text = "Close"
                        closeBtn.Font = Enum.Font.Code
                        closeBtn.TextSize = 14
                        closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                        closeBtn.TextColor3 = Color3.new(1, 1, 1)
                        closeBtn.MouseButton1Click:Connect(function()
                            ScreenGui:Destroy()
                        end)

                        local Operations = { -- Fixes executors that only use lua, not luau
                        Addition = {'(%w+)(%s*)%+=(%s*)(%w+)', '%1%2=%3%1%2+%3%4'}, -- v1+=v2 -> v1=v1+v2
                        Subtraction = {'(%w+)(%s*)%-=(%s*)(%w+)', '%1%2=%3%1%2-%3%4'}, -- v1-=v2
                        Multiplication = {'(%w+)(%s*)%*=(%s*)(%w+)', '%1%2=%3%1%2*%3%4'}, -- v1*=v2
                        Division = {'(%w+)(%s*)/=(%s*)(%w+)', '%1%2=%3%1%2/%3%4'}, -- v1/=v2
                        Modulus = {'(%w+)(%s*)%%=(%s*)(%w+)','%1%2=%3%1%2%%%3%4'}, -- v1%=v2
                        Concatenation = {'(%w+)(%s*)%.%.=(%s*)(%w+)', '%1%2=%3%1%2..%3%4'} -- v1..=v2
                        }
                        local forceoverride = {}

                        function replace(Code)
                        for _, t in next, Operations do
                            Code = string.gsub(Code, t[1], t[2])
                        end
                        return Code
                        end

                        local Options = {
                        OverrideFunctions = true, -- If the executor Overrides already existing functions
                        enviroment = setmetatable({}, {__protected = 'This metatable is protected'}),-- i don't really care if you unprotect it.
                        OverrideIgnore = {'loadstring', 'checkcaller', 'isexecutorclosure', 'isourclosure', 'isexecclosure'} -- Functions you don't wanna override if they already exist
                        }

                        -- // Localization:

                        local rawget = rawget
                        local loadstring = loadstring
                        local oldLoadstring = loadstring
                        local setmetatable = setmetatable
                        local type = type
                        local pairs = pairs
                        local next = next
                        local typeof = typeof
                        local debug = debug
                        local table = table
                        local string = string
                        local bit32 = bit32
                        local require = require

                        local Queue = {}
                        Queue.__index = Queue
                        function Queue.new()
                        local self = setmetatable({}, Queue)
                        self.elements = {}
                        return self
                        end

                        function Queue:Queue(element)
                        table.insert(self.elements, element)
                        end

                        function Queue:Update()
                        if #self.elements == 0 then
                            return nil
                        end
                        return table.remove(self.elements, 1)
                        end

                        function Queue:IsEmpty()
                        return #self.elements == 0
                        end
                        function Queue:Current()
                        return self.elements
                        end
                        local ClipboardQueue = Queue.new()

                        -- // Instances:

                        local Players = game:GetService("Players")
                        local ScriptType = script.ClassName == 'Script' and 'Server' or script.ClassName == 'LocalScript' and 'Client' or script.ClassName == 'ModuleScript' and 'Module'
                        local lp = ScriptType == 'Client' and Players.LocalPlayer or Players.PlayerAdded:Wait()

                        getgenv = getgenv or function()
                        return getfenv(0)
                        end

                        -- // Variables

                        local hui = nil

                        local valid = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'

                        local nilinstances, CachedInstances, DrawingCache = {Instance.new("LocalScript")}, {}, {}

                        local keys={[0x08]=Enum.KeyCode.Backspace,[0x09]=Enum.KeyCode.Tab,[0x0C]=Enum.KeyCode.Clear,[0x0D]=Enum.KeyCode.Return,[0x10]=Enum.KeyCode.LeftShift,[0x11]=Enum.KeyCode.LeftControl,[0x12]=Enum.KeyCode.LeftAlt,[0x13]=Enum.KeyCode.Pause,[0x14]=Enum.KeyCode.CapsLock,[0x1B]=Enum.KeyCode.Escape,[0x20]=Enum.KeyCode.Space,[0x21]=Enum.KeyCode.PageUp,[0x22]=Enum.KeyCode.PageDown,[0x23]=Enum.KeyCode.End,[0x24]=Enum.KeyCode.Home,[0x2D]=Enum.KeyCode.Insert,[0x2E]=Enum.KeyCode.Delete,[0x30]=Enum.KeyCode.Zero,[0x31]=Enum.KeyCode.One,[0x32]=Enum.KeyCode.Two,[0x33]=Enum.KeyCode.Three,[0x34]=Enum.KeyCode.Four,[0x35]=Enum.KeyCode.Five,[0x36]=Enum.KeyCode.Six,[0x37]=Enum.KeyCode.Seven,[0x38]=Enum.KeyCode.Eight,[0x39]=Enum.KeyCode.Nine,[0x41]=Enum.KeyCode.A,[0x42]=Enum.KeyCode.B,[0x43]=Enum.KeyCode.C,[0x44]=Enum.KeyCode.D,[0x45]=Enum.KeyCode.E,[0x46]=Enum.KeyCode.F,[0x47]=Enum.KeyCode.G,[0x48]=Enum.KeyCode.H,[0x49]=Enum.KeyCode.I,[0x4A]=Enum.KeyCode.J,[0x4B]=Enum.KeyCode.K,[0x4C]=Enum.KeyCode.L,[0x4D]=Enum.KeyCode.M,[0x4E]=Enum.KeyCode.N,[0x4F]=Enum.KeyCode.O,[0x50]=Enum.KeyCode.P,[0x51]=Enum.KeyCode.Q,[0x52]=Enum.KeyCode.R,[0x53]=Enum.KeyCode.S,[0x54]=Enum.KeyCode.T,[0x55]=Enum.KeyCode.U,[0x56]=Enum.KeyCode.V,[0x57]=Enum.KeyCode.W,[0x58]=Enum.KeyCode.X,[0x59]=Enum.KeyCode.Y,[0x5A]=Enum.KeyCode.Z,[0x5D]=Enum.KeyCode.Menu,[0x60]=Enum.KeyCode.KeypadZero,[0x61]=Enum.KeyCode.KeypadOne,[0x62]=Enum.KeyCode.KeypadTwo,[0x63]=Enum.KeyCode.KeypadThree,[0x64]=Enum.KeyCode.KeypadFour,[0x65]=Enum.KeyCode.KeypadFive,[0x66]=Enum.KeyCode.KeypadSix,[0x67]=Enum.KeyCode.KeypadSeven,[0x68]=Enum.KeyCode.KeypadEight,[0x69]=Enum.KeyCode.KeypadNine,[0x6A]=Enum.KeyCode.KeypadMultiply,[0x6B]=Enum.KeyCode.KeypadPlus,[0x6D]=Enum.KeyCode.KeypadMinus,[0x6E]=Enum.KeyCode.KeypadPeriod,[0x6F]=Enum.KeyCode.KeypadDivide,[0x70]=Enum.KeyCode.F1,[0x71]=Enum.KeyCode.F2,[0x72]=Enum.KeyCode.F3,[0x73]=Enum.KeyCode.F4,[0x74]=Enum.KeyCode.F5,[0x75]=Enum.KeyCode.F6,[0x76]=Enum.KeyCode.F7,[0x77]=Enum.KeyCode.F8,[0x78]=Enum.KeyCode.F9,[0x79]=Enum.KeyCode.F10,[0x7A]=Enum.KeyCode.F11,[0x7B]=Enum.KeyCode.F12,[0x90]=Enum.KeyCode.NumLock,[0x91]=Enum.KeyCode.ScrollLock,[0xBA]=Enum.KeyCode.Semicolon,[0xBB]=Enum.KeyCode.Equals,[0xBC]=Enum.KeyCode.Comma,[0xBD]=Enum.KeyCode.Minus,[0xBE]=Enum.KeyCode.Period,[0xBF]=Enum.KeyCode.Slash,[0xC0]=Enum.KeyCode.Backquote,[0xDB]=Enum.KeyCode.LeftBracket,[0xDD]=Enum.KeyCode.RightBracket,[0xDE]=Enum.KeyCode.Quote}
                        local vim;

                        -- // Drawing:

                        local FakeFonts = setmetatable({
                        UI = 0,
                        System = 1,
                        Plex = 2,
                        Monospace = 3,
                        }, {
                        __call = function(s) return s end
                        })
                        local Fonts = {
                        [0] = Enum.Font.Arial,
                        [1] = Enum.Font.BuilderSans,
                        [2] = Enum.Font.Gotham,
                        [3] = Enum.Font.RobotoMono
                        }

                        local Base = {
                        Visible = false,
                        Color = Color3.new(0,0,0),
                        ClassName = nil,
                        Remove = function(self)
                            for i, v in next, DrawingCache do
                                if v == self then
                                    local a = i
                                    i:Destroy()
                                    DrawingCache[a] = nil
                                end
                            end
                        end
                        }
                        Base.Destroy = Base.Remove

                        -- // Drawing end

                        local function try(fn, ...)
                        return (pcall(fn, ...))
                        end

                        local function newcclosure(f)
                        local a = coroutine.wrap(function(...)
                            local b = {coroutine.yield()}
                            while true do
                                b = {coroutine.yield(f(table.unpack(b)))}
                            end
                        end)
                        a()
                        return a
                        end

                        local function getthreadidentity()
                        local securityChecks = {
                            {
                                name = "None",
                                number = 0,
                                canAccess = try(function() return game.Name end)
                            },
                            {
                                name = "PluginSecurity",
                                number = 1,
                                canAccess = try(function() return game:GetService("CoreGui").Name end)
                            },
                            {
                                name = "LocalUserSecurity",
                                number = 3,
                                canAccess = try(function() return game.DataCost end)
                            },
                            {
                                name = "WritePlayerSecurity",
                                number = 4,
                                canAccess = try(Instance.new, "Player")
                            },
                            {
                                name = "RobloxScriptSecurity",
                                number = 5,
                                canAccess = try(function() return game:GetService("CorePackages").Name end)
                            },
                            {
                                name = "RobloxSecurity",
                                number = 6,
                                canAccess = try(function() return Instance.new("SurfaceAppearance").TexturePack end)
                            },
                            {
                                name = "NotAccessibleSecurity",
                                number = 7,
                                canAccess = try(function() Instance.new("MeshPart").MeshId = "" end)
                            }
                        }
                        local lasti = 1
                        for i = 1, #securityChecks do
                            if securityChecks[i].canAccess then
                                lasti = i
                            else
                                return lasti
                            end
                        end
                        return lasti
                        end

                        if getthreadidentity() >= 3 then
                        vim = Instance.new("VirtualInputManager")
                        end

                        local RBXActive = true

                        local ClipboardUI = Instance.new("ScreenGui")
                        local ClipboardBox = Instance.new('TextBox') -- For setclipboard
                        ClipboardBox.Position = UDim2.new(100, 0, 100, 0) -- VERY off screen
                        ClipboardBox.Parent = ClipboardUI

                        local HttpService, DrawingUI = game:GetService('HttpService'), Instance.new("ScreenGui")

                        -- // Libararies:
                        local protected_guis = {}

                        -- // Events:

                        game.DescendantRemoving:Connect(function(d)
                        table.insert(nilinstances, d)
                        end)
                        game:FindFirstChildOfClass('UserInputService').WindowFocused:Connect(function()
                        RBXActive = true
                        end)
                        game:FindFirstChildOfClass('UserInputService').WindowFocusReleased:Connect(function()
                        RBXActive = false
                        end)

                        function rawlength(t1)
                        if type(t1) ~= 'table' then return 0 end
                        local count = 0
                        for _, _ in next, t1 do count = count + 1 end
                        end

                        function shallowequals(t1, t2)
                        if t1 == nil or t2 == nil then
                            return false
                        end

                        if type(t1) ~= 'table' or type(t2) ~= 'table' then
                            return false
                        end

                        for key, value in next, t1 do
                            if t2[key] ~= value then
                                return false
                            end
                        end

                        for key, value in next, t2 do
                            if t1[key] ~= value then
                                return false
                            end
                        end

                        return true
                        end

                        function SetAliases(func, aliases)
                        for _, Name in next, aliases do
                            Options.enviroment[Name] = getgenv()[func] or Options.enviroment[func]
                        end
                        end

                        function AddElement(name, val, aliases, forcebypass)
                        if forcebypass == true then table.insert(forceoverride, name) end
                        Options.enviroment[name] = val
                        if typeof(aliases) == 'table' then
                            SetAliases(name, aliases)
                        end
                        return val
                        end

                        function AddEnviroment()
                        local env = (getgenv and getgenv()) or getfenv(0)
                        for Name, Value in next, Options.enviroment do
                            if Options.OverrideFunctions or not env[Name] or table.find(forceoverride, Name) or (type(Value) == 'table' and (not shallowequals(env[Name], Value) or rawlength(Value) > rawlength(env[Name]))) and not table.find(Options.OverrideIgnore, Name) then
                                AddText("✅ Added",Name)
                                env[Name] = Value
                            elseif env[Name] and not table.find(forceoverride, Name) and not Options.OverrideFunctions or (type(Value) == 'table' and (shallowequals(env[Name], Value) or rawlength(Value) <= rawlength(env[Name]))) or table.find(Options.OverrideIgnore, Name) then
                                AddText("❌",Name,'already exists.')
                            end
                        end
                        end

                        local Base64 = AddElement('base64', {
                        encode = function(data)
                            local letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
                            return ((data:gsub('.', function(x) 
                                local r,b='',x:byte()
                                for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
                                return r;
                            end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
                                if (#x < 6) then return '' end
                                local c=0
                                for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
                                return letters:sub(c+1,c+1)
                            end)..({ '', '==', '=' })[#data%3+1])
                        end,
                        decode = function(data)
                            local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
                            data = string.gsub(data, '[^'..b..'=]', '')
                            return (data:gsub('.', function(x)
                                if x == '=' then return '' end
                                local r, f = '', (b:find(x) - 1)
                                for i = 6, 1, -1 do
                                    r = r .. (f % 2^i - f % 2^(i - 1) > 0 and '1' or '0')
                                end
                                return r;
                            end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
                                if #x ~= 8 then return '' end
                                local c = 0
                                for i = 1, 8 do
                                    c = c + (x:sub(i, i) == '1' and 2^(8 - i) or 0)
                                end
                                return string.char(c)
                            end))
                        end
                        })
                        AddElement('base64encode', Base64.encode, {'base64_encode'})
                        AddElement('base64decode', Base64.decode, {'base64_decode'})
                        AddElement('debug', {
                        getinfo = function(f)
                            assert(type(f)=='number' or type(f) == 'function', 'invalid argument #1 to \'getinfo\', number or function expected, got ' .. tostring(typeof(f)))
                            local ParamCount, IsVararg = debug.info(f, 'a')
                            local n = debug.info(f, 'n') ~= '' and debug.info(f, 'n') or ''
                            local source = debug.info(f, 's')
                            return{
                                numparams = ParamCount,
                                is_vararg = IsVararg and 1 or 0,
                                name = n,
                                currentline = debug.info(f, 'l'),
                                source = source,
                                short_src = source:sub(1, 60),
                                what = source == '[C]' and 'C' or 'Lua',
                                func = f,
                                nups = 0
                            }
                        end
                        })

                        -- // Sandboxing Game:

                        -- // HTTP Requests Support

                        function rqst(Options)
                        assert(type(Options) == 'table', 'Argument #1 to \'request\' must be a table, got ' .. typeof(Options))
                        if typeof(script) == 'Instance' and script.ClassName == 'Script' then
                            return HttpService:RequestAsync(Options)
                        end
                        local Timeout, Done, Time = 5, false, 0
                        local Return = {
                            Success = false,
                            StatusCode = 408,
                            StatusMessage = 'Request Timeout',
                            Headers = {},
                            Body = ''
                        }
                        local function Callback(Success, Response)
                            Done = true
                            Return.Success = Success
                            Return.StatusCode = Response.StatusCode
                            Return.StatusMessage = Response.StatusMessage
                            Return.Headers = Response.Headers
                            Return.Body = Response.Body
                        end
                        HttpService:RequestInternal(Options):Start(Callback)
                        while not Done and Time < Timeout do -- probably a bad approach?
                            Time = Time + .1
                            task.wait(.1)
                        end
                        return Return
                        end

                        AddElement('http', {
                        request = rqst
                        })
                        local s, e = pcall(function()
                        return game.HttpGet
                        end)
                        local _game = game
                        AddElement('request', rqst, {'http_request', 'syn_backup.request', 'syn.request'})
                        if not s then
                        AddElement('game', setmetatable({}, {
                            __index = function(self, key)
                                if key == 'HttpGet' then
                                    return function(_, Url)
                                        return rqst({Url = Url, Method = "GET"}).Body
                                    end
                                elseif key == 'HttpPost' then
                                    return function(Url, Data, contentType)
                                        local Args = {Url = Url, Method = "POST", Body = Data}
                                        if contentType then
                                            Args.Headers = {['Content-Type'] = contentType}
                                        end
                                        return rqst(Args).Body
                                    end
                                else
                                    local k = _game[key]
                                    if type(k) == 'function' then
                                        return function(_, ...)
                                            local args = {...}
                                            if (key == 'GetService' or key == 'FindFirstChildOfClass') and args[1] == 'Players' then
                                                return setmetatable({},
                                                {
                                                    __index = function(_, t)
                                                        if t == 'LocalPlayer' then return lp end
                                                        local p = Players[t]
                                                        if type(p) == 'function' then
                                                            return function(_, ...)
                                                                return Players[t](Players, ...)
                                                            end
                                                        else
                                                            return p
                                                        end
                                                    end,
                                                })
                                            end
                                            return k(_game, ...)
                                        end
                                    else
                                        return k
                                    end
                                end
                            end,
                            __tostring = function() return tostring(game) end
                        }))
                        end

                        local LoadSuccess, HashCode = pcall((not s and Options.enviroment.game.HttpGet or game.HttpGet), (not s and _game or game), "https://pastebin.com/raw/iRDTgy7w", true)
                        local LoadSuccessV2, rconsolecode = pcall((not s and Options.enviroment.game.HttpGet or game.HttpGet), (not s and _game or game), "https://pastebin.com/raw/haqApsFE", true)
                        local rconsole

                        if not LoadSuccess then
                        Hash = {}
                        else
                        Hash = loadstring(HashCode)()
                        end
                        if LoadSuccessV2 then
                        rconsole = loadstring(rconsolecode)()
                        else
                        warn("Hey! rconsole did not successfully load, This could be due to an HTTP error, Message:",rconsolecode)
                        end

                        local HashLib = setmetatable({}, {
                        __metatable = 'HashLib // Protected',
                        __index = function(self, key) -- Make it work for both _ and -
                            local k1 = key:gsub('_', '-')
                            local k2 = key:gsub('%-', '_')
                            local m1, m2 = Hash[k1], Hash[k2]
                            if m1 then return m1 end
                            if m2 then return m2 end
                            return rawget(self, key)
                        end
                        })

                        -- // crypt library

                        AddElement('crypt', {
                        hex = {
                            encode = function(data)
                                assert(type(data)=='string', 'argument #1 to \'hex.encode\' must be of type string, Received ' .. typeof(data))
                                local hex = ''
                                for i = 1, #data do
                                    hex = hex .. string.format("%02x", string.byte(data, i))
                                end
                                return hex
                            end,
                            decode = function(data)
                                assert(type(data)=='string', 'argument #1 to \'hex.decode\' must be of type string, Received ' .. typeof(data))
                                local text = ""
                                for i = 1, #data, 2 do
                                    local byte_str = string.sub(data, i, i+1)
                                    local byte = tonumber(byte_str, 16)
                                    text = text .. string.char(byte)
                                end
                                return text
                            end
                        },
                        custom = {
                            hash = function(data, alg)
                                local v1 = HashLib[alg]
                                local v2 = HashLib[data]
                                if not v1 and not v2 then
                                    error(string.format("No algorithm found with name '%s' or '%s'", alg, data))
                                end
                                if v1 then
                                    return v1(data)
                                elseif v2 then
                                    return v2(alg)
                                end
                            end
                        },
                        hash = function(data, alg)
                            local v1 = HashLib[alg]
                            local v2 = HashLib[data]
                            if not v1 and not v2 then
                                error(string.format("No algorithm found with name '%s' or '%s'", alg, data))
                            end
                            if v1 then
                                return v1(data)
                            elseif v2 then
                                return v2(alg)
                            end
                        end,
                        url = {
                            encode = function(data)
                                return game:GetService("HttpService"):UrlEncode(data)
                            end,
                            decode = function(data)
                                -- replace + with space
                                data = string.gsub(data, '%+', ' ')
                                -- replace hexadecimals with the character for them
                                data = string.gsub(data, "%%(%x%x)", function(hex)
                                    return string.char(tonumber(hex, 16))
                                end)
                                data = string.gsub(data, "\r\n", "\n") -- obvious
                                return data
                            end
                        },
                        base64 = Base64,
                        base64_encode = Base64.encode,
                        base64_decode = Base64.decode,
                        base64encode = Base64.encode,
                        base64decode = Base64.decode,
                        random = function(len)
                            assert(type(len) == 'number', 'Argument #1 to \'random\' must be a number, got ' .. typeof(len))
                            assert(len > 0 and len < 1025, 'Argument #1 to \'random\' must be over 0 and must not exceed 1024.')
                            local a = {}
                            for _=1,len do local r=math.random(1, #valid)table.insert(a,valid:sub(r,r))end;return table.concat(a)
                        end,
                        generatekey = function(len)
                            len = len or 32
                            local key = ''
                            local Valid = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
                            for _ = 1, len do local n = math.random(1, #Valid) key = key .. string.sub(Valid, n, n) end
                            return Base64.encode(key)
                        end,
                        generatebytes = function(len)
                            assert(type(len) == 'number', 'Argument #1 to \'generatebytes\' must be a number, got ' .. typeof(len))
                            local key = ''
                            local Valid = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
                            for _ = 1, len do local n = math.random(1, #Valid) key = key .. string.sub(Valid, n, n) end
                            return Base64.encode(key)
                        end
                        }, {'crypto', 'syn.crypto', 'syn_backup.crypto'})

                        -- // syn Library

                        AddElement('syn', {
                        is_beta = function() return true end, -- ???? i do not know why this is needed
                        protect_gui = function(gui) -- Unofficial protect
                            protected_guis[gui] = { Parent = gui.Parent, Name = gui.Name }
                            gui.Parent = gethui()
                            gui.Name = randomstring(math.random(8, 16))
                        end,
                        unprotect_gui = function(gui)
                            local Gui = rawget(protected_guis, gui)
                            if not Gui then return error(`GUI {gui.Name} does not exist in the protected guis list.`, 1) end
                            gui.Name = Gui.Name
                            gui.Parent = Gui.Parent
                            protected_guis[gui] = nil
                        end,
                        request = rqst,
                        get_thread_identity = getthreadidentity,
                        crypto = Options.enviroment.crypt
                        }, {'syn_backup'})

                        -- // cache Library

                        AddElement('cache', {
                        iscached = function(d)
                            return CachedInstances[d] ~= 'invalid'
                        end,
                        invalidate = function(d)
                            CachedInstances[d] = 'invalid'
                            d.Parent = nil
                        end,
                        replace = function(a, b)
                            CachedInstances[a] = b
                            b.Name = a.Name
                            b.Parent = a.Parent
                            a.Parent = nil
                        end
                        })
                        -- // Drawing Library

                        AddElement('Drawing', {
                        Fonts = FakeFonts,
                        new = function(Type)
                            local function SetBase(tbl)
                                local baseProps = {
                                    Visible = false,
                                    Color = Color3.new(0,0,0),
                                    ClassName = nil,
                                    ZIndex = 1,
                                    Remove = function(self)
                                        for i, v in next, DrawingCache do
                                            if v == self then
                                                local a = i
                                                i:Destroy()
                                                DrawingCache[a] = nil
                                            end
                                        end
                                    end
                                }
                                baseProps.Destroy = baseProps.Remove
                                for i, v in next, baseProps do
                                    rawset(tbl.__index, i, v)
                                end
                            end
                            if Type == 'Line' then
                                local a = Instance.new("Frame", DrawingUI)
                                a.Visible = false
                                a.Size = UDim2.new(0, 0, 0, 0)
                                a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                a.BackgroundTransparency = 1
                                a.BorderSizePixel = 0

                                local meta = {}
                                meta.ClassName = Type
                                meta.__index = {
                                    Thickness = 1,
                                    From = Vector2.new(0, 0),
                                    To = Vector2.new(0, 0),
                                    Transparency = 0,
                                    updateLine = function(self)
                                        if not a then return end
                                        local from = self.From
                                        local to = self.To
                                        local distance = (to - from).Magnitude
                                        local angle = math.deg(math.atan2(to.Y - from.Y, to.X - from.X))

                                        a.Size = UDim2.new(0, distance, 0, self.Thickness)
                                        a.Position = UDim2.new(0, from.X, 0, from.Y)
                                        a.Rotation = angle
                                        a.BackgroundTransparency = 1 - self.Transparency
                                        a.BackgroundColor3 = self.Color
                                        a.Visible = self.Visible
                                        a.ZIndex = self.ZIndex
                                    end
                                }
                                SetBase(meta)
                                meta.__newindex = function(self, key, value)
                                    if not self then return end
                                    if typeof(meta.__index[key]) == typeof(value) then
                                        rawset(self, key, value)
                                        self:updateLine()
                                    end
                                end
                                meta.__metatable = 'This metatable is protected.'
                                local meta1 = setmetatable({}, meta)
                                DrawingCache[a] = meta1
                                return meta1
                            elseif Type == 'Square' then
                                local a = Instance.new("Frame", DrawingUI)
                                a.Visible = false
                                a.Size = UDim2.new(0, 0, 0, 0)
                                a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                a.BackgroundTransparency = 1
                                a.BorderSizePixel = 0
                                local b = Instance.new("UIStroke", a)
                                b.Color = Color3.fromRGB(255, 255, 255)
                                b.Enabled = true

                                local meta = {}
                                meta.ClassName = Type
                                meta.__index = {
                                    Size = Vector2.new(0,0),
                                    Position = Vector2.new(0, 0),
                                    Filled = false,
                                    updateSquare = function(self)
                                        if not a then return end
                                        a.Size = UDim2.new(0, self.Size.X, 0, self.Size.Y)
                                        a.Position = UDim2.new(0, self.Position.X, 0, self.Position.Y)
                                        b.Enabled = self.Filled
                                        b.Color = self.Color
                                        a.BackgroundColor3 = self.Color
                                        a.ZIndex = self.ZIndex
                                    end
                                }
                                SetBase(meta)

                                meta.__newindex = function(self, key, value)
                                    if not self then return end
                                    if typeof(self[key]) == typeof(value) then
                                        rawset(self, key, value)
                                        self:updateSquare()
                                    end
                                end
                                local meta1 = setmetatable({}, meta)
                                DrawingCache[a] = meta1
                                return meta1
                            elseif Type == 'Circle' then
                                local a = Instance.new("Frame", DrawingUI)
                                a.Visible = false
                                a.Size = UDim2.new(0, 0, 0, 0)
                                a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                a.BackgroundTransparency = 1
                                a.BorderSizePixel = 0
                                local b = Instance.new("UIStroke", a)
                                b.Color = Color3.fromRGB(255, 255, 255)
                                b.Enabled = false
                                b.Thickness = 1
                                local c = Instance.new("UICorner", a)
                                c.CornerRadius = UDim.new(1, 0)

                                local meta = {}
                                meta.ClassName = Type
                                meta.__index = {
                                    Thickness = 1,
                                    Filled = false,
                                    NumSides = 0,
                                    Radius = 1,
                                    Position = Vector2.new(0, 0),
                                    Transparency = 0,
                                    updateCircle = function(self)
                                        if not b or not a then return end
                                        a.Visible = self.Visible
                                        a.BackgroundTransparency = self.Transparency - 1
                                        a.Size = UDim2.new(0, self.Radius, 0, self.Radius)
                                        a.Position = UDim2.new(0, self.Position.X, 0, self.Position.Y)
                                        b.Enabled = not self
                                        b.Color = self.Color
                                        a.ZIndex = self.ZIndex
                                    end
                                }

                                SetBase(meta)

                                meta.__newindex = function(self, key, value)
                                    if not self then return end
                                    if self[key] ~= nil and typeof(self[key]) == typeof(value) then
                                        rawset(self, key, value)
                                        self:updateCircle()
                                    else
                                        warn("Type mismatch or key doesn't exist:", key, value)
                                    end
                                end                                

                                local meta1 = setmetatable({}, meta)
                                DrawingCache[a] = meta1
                                return meta1
                            elseif Type == 'Text' then
                                local a = Instance.new("TextLabel", DrawingUI)
                                a.Visible = false
                                a.Size = UDim2.new(0, 0, 0, 0)
                                a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                a.BackgroundTransparency = 1
                                a.BorderSizePixel = 0
                                a.TextStrokeColor3 = Color3.new(0,0,0)
                                a.TextStrokeTransparency = 1

                                local meta = {}
                                meta.ClassName = Type
                                meta.__index = {
                                    Text = '',
                                    Transparency = 0,
                                    Size = 0,
                                    Center = false,
                                    Outline = false,
                                    OutlineColor = Color3.new(0,0,0),
                                    Position = Vector2.new(0,0),
                                    Font = 3,
                                    updateText = function(self)
                                        if not a then return end
                                        a.TextScaled = true
                                        a.Size = UDim2.new(0, self.Size * 3, 0, self.Size / 2)
                                        a.Position = UDim2.new(0, self.Position.X, 0, self.Position.Y)
                                        a.Text = self.Text
                                        a.Font = Fonts[self.Font]
                                        a.Visible = self.Visible
                                        a.TextColor3 = self.Color
                                        a.BackgroundTransparency = 1 - self.Transparency
                                        a.BorderSizePixel = self.Outline and 1 or 0
                                        if self.Center then
                                            a.TextXAlignment = Enum.TextXAlignment.Center
                                            a.TextYAlignment = Enum.TextYAlignment.Center
                                        else
                                            a.TextXAlignment = Enum.TextXAlignment.Left
                                            a.TextYAlignment = Enum.TextYAlignment.Top
                                        end
                                        a.TextStrokeTransparency = self.Outline and 0 or 1
                                        a.TextStrokeColor3 = self.OutlineColor
                                        a.ZIndex = self.ZIndex
                                    end
                                }

                                SetBase(meta)

                                meta.__newindex = function(self, key, value)
                                    if not self then return end
                                    if typeof(self[key]) == typeof(value) then
                                        rawset(self, key, value)
                                        self:updateText()
                                    end
                                end

                                local meta1 = setmetatable({}, meta)
                                DrawingCache[a] = meta1
                                return meta1
                            end
                        end})
                        local old = Options.enviroment.Drawing.new
                        Options.enviroment.Drawing.new = function(Type)
                        if Type ~= 'Image' then
                            return old(Type)
                        else
                            return old('Circle')
                        end
                        end
                        AddElement('loadstring', function(code)
                        local test = oldLoadstring('local result=3;result+=1;return result')()
                        local test2 = oldLoadstring('local result="h";result..="i";return result')()
                        if test ~= 4 or test2 ~= 'hi' then
                            return oldLoadstring(replace(code))
                        elseif test == 4 and test2 == 'hi' then
                            return oldLoadstring(code)
                        end
                        end, {}, true)
                        AddElement('getrenderproperty', function(drawing, prop)
                        return drawing[prop]
                        end)
                        AddElement('setrenderproperty', function(a, b, c)
                        if Options.enviroment.isrenderobj(a) then
                            a[b] = c
                        end
                        end)
                        AddElement('isrenderobj', function(a)
                        for c, b in next, DrawingCache do
                            if b == a then
                                return true
                            end
                        end
                        return false
                        end)

                        AddElement('gethui', function()
                        if not hui then
                            local s, _ = pcall(function()
                                local Path1 = _game:FindFirstChildOfClass('CoreGui')
                                hui = Instance.new("Folder", Path1)
                                hui.Name = 'hidden_ui\0'
                            end)
                            if not s then
                                if lp then
                                    hui = Instance.new("Folder", lp:FindFirstChildOfClass("PlayerGui"))
                                    hui.Name = 'hidden_ui\0'
                                else
                                    if #Players:GetChildren() == 0 then
                                        repeat task.wait() until #Players:GetChildren() > 0
                                    end
                                    local random_player = Players:GetChildren()[math.random(1, #Players:GetChildren())]
                                    hui = Instance.new("Folder", random_player:FindFirstChild("PlayerGui")) -- Add it into a random player's PlayerGui if there isn't a local player
                                    hui.Name = 'hidden_ui\0'
                                end
                            end
                        end
                        return hui
                        end, {'get_hidden_ui', 'gethiddenui'})
                        AddElement('randomstring', function(length)
                        length = length or 32
                        local str = {}
                        for i = 1, length do
                            local r = math.random(1, #valid)
                            str[i] = valid:sub(r, r)
                        end
                        return table.concat(str)
                        end)
                        AddElement('iscclosure', function(a)
                        return debug.info(a, 's') == '[C]'
                        end, {'is_c_closure'})
                        AddElement('islclosure', function(a)
                        return debug.info(a, 's') ~= '[C]'
                        end, {'is_l_closure'})
                        AddElement('isourclosure', function(a) -- Credits to empereans for this
                        return debug.info(a, 's') == debug.info(1, 's')
                        end, {'isexecclosure', 'isexeclosure', 'is_executor_closure', 'isexecutorclosure', 'checkclosure'})
                        AddElement('getinstances', function() return game:GetDescendants() end)
                        AddElement('getnilinstances', function() return nilinstances end)
                        AddElement('isreadonly', function(t)
                        return table.isfrozen(t)
                        end)
                        AddElement('isscriptable', function(instance, prop)
                        assert(typeof(instance) == 'Instance', 'Argument #1 to \'setscriptable\' must be an Instance, got ' .. typeof(instance))
                        return select(1, pcall(function()
                            return instance[prop]
                        end))
                        end, {'is_scriptable'})
                        AddElement('getscripts', function()
                        local a = {}for _, v in next, game:GetDescendants() do if v.ClassName == 'ModuleScript' or v.ClassName == 'LocalScript' then table.insert(a, v) end end;return a
                        end)
                        AddElement('getloadedmodules', function()
                        local a = {}for _, v in next, game:GetDescendants() do if v.ClassName == 'ModuleScript' then table.insert(a, v) end end;return a
                        end)
                        AddElement('getcallingscript', function()
                        local Source = debug.info(1, 's')
                        for i, v in next, game:GetDescendants() do if v:GetFullName() == Source then return v end end
                        end, {'get_calling_script'})
                        AddElement('isrbxactive', function()
                        return RBXActive
                        end, {'isgameactive'})
                        AddElement('newcclosure', newcclosure) -- Credits to empereans and myworld for this
                        AddElement('getthreadidentity', getthreadidentity, {'getthreadcontext', 'getidentity'})
                        AddElement('getrunningscripts', function() -- Purposely made ugly code to make it a 1 liner.
                        local a={}for _,v in next,game:GetDescendants()do if v.ClassName=='LocalScript'or v.ClassName=='ModuleScript'then table.insert(a,v)end;end;return a
                        end)
                        AddElement('getexecutorname', function()
                        return 'MoreUNC', '2.0.0'
                        end, {'identifyexecutor'})
                        AddElement('cleardrawcache', function()
                        for _, m in next, DrawingCache do m:Remove() end
                        end)

                        -- // File System:
                        local Files = {}
                        local function startswith(a, b)
                        return a:sub(1, #b) == b
                        end
                        local function endswith(hello, lo) 
                        return hello:sub(#hello - #lo + 1, #hello) == lo
                        end
                        AddElement('writefile', function(path, content)
                        local Path = path:split('/')
                        local CurrentPath = {}
                        for i = 1, #Path do
                            local a = Path[i]
                            CurrentPath[i] = a
                            if not Files[a] and i ~= #Path then
                                Files[table.concat(CurrentPath, '/')] = {}
                                Files[table.concat(CurrentPath, '/') .. '/'] = Files[table.concat(CurrentPath, '/')]
                            elseif i == #Path then
                                Files[table.concat(CurrentPath, '/')] = tostring(content)
                            end
                        end
                        end)
                        AddElement('makefolder', function(path)
                        Files[path] = {}
                        Files[path .. '/'] = Files[path]
                        end)
                        AddElement('isfolder', function(path)
                        return type(Files[path]) == 'table'
                        end)
                        AddElement('isfile', function(path)
                        return type(Files[path]) == 'string'
                        end)
                        AddElement('readfile', function(path)
                        return Files[path]
                        end)
                        AddElement('appendfile', function(path, text2)
                        writefile(path, readfile(path) .. text2)
                        end)
                        AddElement('loadfile', function(path)
                        local content = readfile(path)
                        if not content then error('File \'' .. tostring(path) .. '\' does not exist.') return '' end
                        local s, func = pcall(function()
                            return loadstring(content)
                        end)
                        return func, not s and func or nil
                        end)
                        AddElement('delfolder', function(path)
                        local f = Files[path]
                        if type(f) == 'table' then Files[path] = nil end
                        end)
                        AddElement('delfile', function(path)
                        local f = Files[path]
                        if type(f) == 'string' then Files[path] = nil end
                        end)
                        AddElement('listfiles', function(path)
                        if not path or path == '' then
                            local Files = {}
                            for i, v in pairs(Files) do
                                if #i:split('/') == 1 then table.insert(Files, i) end
                            end
                            return Files
                        end
                        if type(Files[path]) ~= 'table' then return error(path .. ' is not a folder.') end
                        local Files_2 = {}
                        for i, v in pairs(Files) do
                            if startswith(i, path .. '/') and not endswith(i, '/') and i ~= path and #i:split('/') == (#path:split('/') + 1) then table.insert(Files_2, i) end
                        end
                        return Files_2
                        end)
                        AddElement('checkcaller', function()
                        local info = debug.info(getgenv, 'slnaf')
                        return debug.info(1, 'slnaf')==info
                        end)
                        AddElement('clonefunction', function(f)
                        return function(...) -- Probably a bad way to do this...
                            return f(...)
                        end
                        end, {'newlclosure'})
                        AddElement('getscriptclosure', function(module)
                        assert(typeof(module) ~= 'Instance', 'Argument #1 to \'getscriptclosure\' must be an Instance.')
                        return function() return require(module) end
                        end, {'getscriptfunction'})
                        AddElement('getgenv', function()
                        return getfenv(0)
                        end)
                        if vim then
                        AddElement('mouse1click', function(x, y)
                            x = x or 0
                            y = y or 0
                            vim:SendMouseButtonEvent(x, y, 0, true, game, false)
                            task.wait()
                            vim:SendMouseButtonEvent(x, y, 0, false, game, false)
                        end)

                        AddElement('mouse2click', function(x, y)
                            x = x or 0
                            y = y or 0
                            vim:SendMouseButtonEvent(x, y, 1, true, game, false)
                            task.wait()
                            vim:SendMouseButtonEvent(x, y, 1, false, game, false)
                        end)

                        AddElement('mouse1press', function(x, y)
                            x = x or 0
                            y = y or 0
                            vim:SendMouseButtonEvent(x, y, 0, true, game, false)
                        end)

                        AddElement('mouse1release', function(x, y)
                            x = x or 0
                            y = y or 0
                            vim:SendMouseButtonEvent(x, y, 0, false, game, false)
                        end)

                        AddElement('mouse2press', function(x, y)
                            x = x or 0
                            y = y or 0
                            vim:SendMouseButtonEvent(x, y, 1, true, game, false)
                        end)

                        AddElement('mouse2release', function(x, y)
                            x = x or 0
                            y = y or 0
                            vim:SendMouseButtonEvent(x, y, 1, false, game, false)
                        end)

                        AddElement('mousescroll', function(x, y, a)
                            x = x or 0
                            y = y or 0
                            a = a and true or false
                            vim:SendMouseWheelEvent(x, y, a, game)
                        end)

                        AddElement('keyclick', function(key)
                            if typeof(key) == 'number' then
                                if not keys[key] then return error("Key "..tostring(key) .. ' not found!') end
                                vim:SendKeyEvent(true, keys[key], false, game)
                                task.wait()
                                vim:SendKeyEvent(false, keys[key], false, game)
                            elseif typeof(key) == 'EnumItem' then
                                vim:SendKeyEvent(true, key, false, game)
                                task.wait()
                                vim:SendKeyEvent(false, key, false, game)
                            end
                        end)

                        AddElement('keypress', function(key)
                            if typeof(key) == 'number' then
                                if not keys[key] then return error("Key "..tostring(key) .. ' not found!') end
                                vim:SendKeyEvent(true, keys[key], false, game)
                            elseif typeof(key) == 'EnumItem' then
                                vim:SendKeyEvent(true, key, false, game)
                            end
                        end)

                        AddElement('keyrelease', function(key)
                            if typeof(key) == 'number' then
                                if not keys[key] then return error("Key "..tostring(key) .. ' not found!') end
                                vim:SendKeyEvent(false, keys[key], false, game)
                            elseif typeof(key) == 'EnumItem' then
                                vim:SendKeyEvent(false, key, false, game)
                            end
                        end)

                        AddElement('mousemoverel', function(relx, rely)
                            local Pos = workspace.CurrentCamera.ViewportSize
                            relx = relx or 0
                            rely = rely or 0
                            local x = Pos.X * relx
                            local y = Pos.Y * rely
                            vim:SendMouseMoveEvent(x, y, game)
                        end)

                        AddElement('mousemoveabs', function(x, y)
                            x = x or 0
                            y = y or 0
                            vim:SendMouseMoveEvent(x, y, game)
                        end)
                        AddElement(
                            "fireproximityprompt",
                            function(ProximityPrompt)
                                local Old, Text = game:GetService("UserInputService"):GetFocusedTextBox(), ""
                                if Old then
                                    Text = Old.Text
                                    Old:ReleaseFocus()
                                end
                                local Properties = {"HoldDuration", "MaxActivationDistance", "Enabled", "RequiresLineOfSight"}
                                local Values = {}
                                for _, Property in next, Properties do
                                    Values[Property] = ProximityPrompt[Property]
                                end
                                -- * Change it's propreties so you can activate it from anywhere!
                                ProximityPrompt.Enabled = true
                                ProximityPrompt.RequiresLineOfSight = false
                                ProximityPrompt.MaxActivationDistance = math.huge
                                ProximityPrompt.HoldDuration = 0
                                vim:SendKeyEvent(true, ProximityPrompt.KeyboardKeyCode, false, game)
                                task.wait()
                                vim:SendKeyEvent(false, ProximityPrompt.KeyboardKeyCode, false, game)
                                for PropertyName, PropertyValue in next, Values do
                                    ProximityPrompt[PropertyName] = PropertyValue
                                end
                                if Old then
                                    Old:CaptureFocus()
                                    Old.Text = Text
                                end
                            end
                        )
                        AddElement('setclipboard', function(data)
                            repeat task.wait() until ClipboardQueue:Current()[1] == data or ClipboardQueue:IsEmpty()
                            ClipboardQueue:Queue(data)
                            local old = game:GetService("UserInputService"):GetFocusedTextBox()
                            local copy = ClipboardQueue:Current()[1]
                            ClipboardBox:CaptureFocus()
                            ClipboardBox.Text = copy

                            local KeyCode = Enum.KeyCode
                            local Keys = {KeyCode.RightControl, KeyCode.A}
                            local Keys2 = {KeyCode.RightControl, KeyCode.C, KeyCode.V}

                            for _, v in ipairs(Keys) do
                                vim:SendKeyEvent(true, v, false, game)
                                task.wait()
                            end
                            for _, v in ipairs(Keys) do
                                vim:SendKeyEvent(false, v, false, game)
                                task.wait()
                            end
                            for _, v in ipairs(Keys2) do
                                vim:SendKeyEvent(true, v, false, game)
                                task.wait()
                            end
                            for _, v in ipairs(Keys2) do
                                vim:SendKeyEvent(false, v, false, game)
                                task.wait()
                            end
                            ClipboardBox.Text = ''
                            if old then old:CaptureFocus() end
                            task.wait(.18)
                            ClipboardQueue:Update()
                        end, {'toclipboard', 'writeclipboard', 'setrbxclipboard', 'syn.write_clipboard'})
                        else
                        warn("Your executor is not high level enough to support input functions (Including setclipboard & fireproximityprompt)")
                        end
                        local Consoles = {}
                        AddElement('rconsolecreate', function()
                        local cnsl = rconsole:init()
                        table.insert(Consoles, cnsl)
                        cnsl.Parent = gethui()
                        end, {'consolecreate'})
                        AddElement('rconsoledestroy', function()
                        for i, v in next, Consoles do v:Destroy() end
                        end, {'consoledestroy'})
                        AddElement('rconsoleprint', function(msg)
                        assert(type(msg) == 'string', 'Argument #1 to \'rconsoleprint\' must be a string, not ' .. type(msg))
                        rconsole:addmessage(msg)
                        end, {'consoleprint'})
                        AddElement('rconsoleinput', function(text)
                        assert(type(text) == 'string', 'Argument #1 to \'rconsoleinput\' must be a string, not ' .. type(text))
                        return rconsole:addinput(text)
                        end, {'rconsoleinputasync', 'consoleinput'})
                        AddElement('rconsoleclear', function()
                        local v = Consoles[#Consoles]
                        if not v then return end 
                        if v:FindFirstChild('MainFrame') and v.MainFrame:FindFirstChild('Messages') then
                            for _, q in next, v.MainFrame:FindFirstChild('Messages'):GetChildren() do
                                if q.ClassName ~= 'UIListLayout' then
                                    q:Destroy()
                                end
                            end
                        end
                        end, {'consoleclear'})
                        AddElement("rconsolesettitle", function(title)
                        assert(type(title) == 'string', 'Argument #1 to \'rconsoleinput\' must be a string, not ' .. type(title))
                        local v = Consoles[#Consoles]
                        if not v then return end 
                        v:FindFirstChild("MainFrame"):FindFirstChild("TopBar"):FindFirstChild("Title").Text = title
                        end, {"rconsolename", "consolesettitle"})
                        AddElement('getscripthash', function(scr)
                        assert(typeof(scr) == 'Instance', 'Argument #1 to \'getscripthash\' must be an Instance, not ' .. typeof(scr))
                        assert(scr.ClassName ~= 'LocalScript' or scr.ClassName ~= 'Script', 'Argument #1 to \'getscripthash\' must be a LocalScript or Script')
                        return scr:GetHash()
                        end)
                        AddElement('saveinstance', function() -- Not mine, But still wanted to add it
                        local Params = {
                            RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
                            SSI = "saveinstance",
                        }
                        local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
                        local SaveOptions = {
                            ReadMe = true,
                            IsolatePlayers = true,
                            FilePath = string.format("%d", tick())
                        }
                        synsaveinstance(SaveOptions)
                        end)

                        -- Finalize:
                        if not getgenv().MoreUNCV2 then
                        AddEnviroment()
                        getgenv().MoreUNCV2 = true
                        syn.protect_gui(DrawingUI)
                        syn.protect_gui(ClipboardUI)
                        end
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled.")
                    end
                }
            }
        })
    end
})

-- Liste mit Emotes und deren Animation IDs
local emotes = {
    Wave = "507770239",
    Point = "507770453",
    Cheer = "507770677",
    Laugh = "507771019",
    Dance = "507771019",
    Dance2 = "507776043",
    Dance3 = "507777268"
}

local emoteNames = {} -- Liste der Emote-Namen
for name, _ in pairs(emotes) do
    table.insert(emoteNames, name)
end

-- Dropdown erstellen
local Emote = Tabs.Emote:AddDropdown("Emote", {
    Title = "Select an Emote",
    Values = emoteNames,
    Multi = false,
})

-- Variable zur Speicherung der aktiven Animation
local currentAnimation

Emote:OnChanged(function(Value)
    local success, err = pcall(function()
        if not emotes[Value] then
            warn("Fehler: Emote '" .. tostring(Value) .. "' has no valid animation ID!")
            return
        end

        local player = game:GetService("Players").LocalPlayer
        if not player.Character then return end

        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end

        local animator = humanoid:FindFirstChildOfClass("Animator")
        if not animator then return end

        if currentAnimation then
            currentAnimation:Stop()
        end

        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://" .. emotes[Value]
        currentAnimation = animator:LoadAnimation(animation)
        currentAnimation:Play()
    end)

    if not success then
        warn("OnChanged: " .. err)
    end
end)

-- Button erstellen
Tabs.Emote:AddButton({
    Title = "Cancel Emote",
    Callback = function()
        currentAnimation:Stop()
        currentAnimation = nil
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

-- InterfaceManager:SetFolder("FluentScriptHub")
-- SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Fluent:Notify({
    Title = "ZaZa",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
