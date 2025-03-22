local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
print("Fluent geladen")

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
print("SaveManager geladen")

local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
print("InterfaceManager geladen")

local Window = Fluent:CreateWindow({
    Title = "ZaZa Hub  0.1.3",
    SubTitle = "by Brxyk_",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.P -- Used when theres no MinimizeKeybind
})
print("Fenster erstellt")

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    ESP = Window:AddTab({ Title = "ESP", Icon = "eye" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Aimbot = Window:AddTab({ Title = "Aimbot", Icon = "crosshair" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "locate-fixed" }),
    MiscTab = Window:AddTab({ Title = "Misc", Icon = "misc" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "info" })
}
print("Tabs erstellt")

local Options = Fluent.Options
print("Optionen geladen")

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
    print("WalkSpeed geändert: " .. humanoid.WalkSpeed)
    if humanoid.WalkSpeed ~= speedValue then
        humanoid.WalkSpeed = speedValue
        print("WalkSpeed auf " .. speedValue .. " gesetzt")
    end
end)

local FlySpeed = 50
local Flying = false
local FlyVelocity, FlyGyro

function StartFly()
    print("StartFly aufgerufen")
    if Flying then 
        print("Bereits fliegend")
        return 
    end
    Flying = true
    local Character = LocalPlayer.Character
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")
    if not Root then 
        print("HumanoidRootPart nicht gefunden")
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
        local Camera = workspace.CurrentCamera
        local MoveDirection = Vector3.new()
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            MoveDirection = MoveDirection + Camera.CFrame.LookVector
            print("Bewege nach vorne")
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            MoveDirection = MoveDirection - Camera.CFrame.LookVector
            print("Bewege nach hinten")
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            MoveDirection = MoveDirection - Camera.CFrame.RightVector
            print("Bewege nach links")
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            MoveDirection = MoveDirection + Camera.CFrame.RightVector
            print("Bewege nach rechts")
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            MoveDirection = MoveDirection + Vector3.new(0, 1, 0)
            print("Bewege nach oben")
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            MoveDirection = MoveDirection - Vector3.new(0, 1, 0)
            print("Bewege nach unten")
        end
        
        if MoveDirection.Magnitude > 0 then
            FlyVelocity.Velocity = MoveDirection.Unit * FlySpeed
            print("Fluggeschwindigkeit: " .. FlySpeed)
        else
            FlyVelocity.Velocity = Vector3.new(0, 0, 0)
        end
        FlyGyro.CFrame = Camera.CFrame
    end)
    print("Fliegen gestartet")
end

function StopFly()
    print("StopFly aufgerufen")
    Flying = false
    if FlyVelocity then 
        FlyVelocity:Destroy() 
        print("FlyVelocity zerstört")
    end
    if FlyGyro then 
        FlyGyro:Destroy() 
        print("FlyGyro zerstört")
    end
end

local PlayerSection = Tabs.Player:AddSection("Movement & Control")

PlayerSection:AddToggle("FlyToggle", {
    Title = "Fly",
    Description = "Toggles flying on/off",
    Default = false,
    Callback = function(state)
        print("FlyToggle geändert: " .. tostring(state))
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
        print("FlySpeed geändert: " .. Value)
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
        print("Speed geändert: " .. Value)
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
        print("Sprungkraft geändert: " .. Value)
        humanoid.JumpPower = tonumber(Value) -- Wert in Zahl umwandeln
    end
})

-- Optional: Wenn der Input sich ändert, kann die Callback-Funktion aktualisiert werden
Input:OnChanged(function()
    print("Input aktualisiert:", Input.Value)
end)

local PlayerSection = Tabs.Player:AddSection("Name")

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

local PlayerSection = Tabs.Player:AddSection("Noclip")

PlayerSection:AddToggle("NoclipToggle", {
    Title = "Noclip",
    Description = "Allows you to walk through walls",
    Default = false,
    Callback = function(state)
        ToggleNoclip(state)
    end
})

--// Cache

local select = select
local pcall, getgenv, next, Vector2, mathclamp, type, mousemoverel = select(1, pcall, getgenv, next, Vector2.new, math.clamp, type, mousemoverel or (Input and Input.MouseMove))

--// Preventing Multiple Processes

pcall(function()
	getgenv().Aimbot.Functions:Exit()
end)

--// Environment

getgenv().Aimbot = {}
local Environment = getgenv().Aimbot

--// Services

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
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
		RequiredDistance = (Environment.FOVSettings.Enabled and Environment.FOVSettings.Amount or 2000)

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
			Environment.FOVCircle.Radius = Environment.FOVSettings.Amount
			Environment.FOVCircle.Thickness = Environment.FOVSettings.Thickness
			Environment.FOVCircle.Filled = Environment.FOVSettings.Filled
			Environment.FOVCircle.NumSides = Environment.FOVSettings.Sides
			Environment.FOVCircle.Color = Environment.FOVSettings.Color
			Environment.FOVCircle.Transparency = Environment.FOVSettings.Transparency
			Environment.FOVCircle.Visible = Environment.FOVSettings.Visible
			Environment.FOVCircle.Position = Vector2(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
		else
            Environment.Settings.Enabled = false
			Environment.FOVCircle.Visible = false
		end

		if Running and Environment.Settings.Enabled then
			GetClosestPlayer()
			if Environment.Locked then
				if Environment.Settings.ThirdPerson then
					Environment.Settings.ThirdPersonSensitivity = mathclamp(Environment.Settings.ThirdPersonSensitivity, 0.1, 5)

					local Vector = Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position)
					mousemoverel((Vector.X - UserInputService:GetMouseLocation().X) * Environment.Settings.ThirdPersonSensitivity, (Vector.Y - UserInputService:GetMouseLocation().Y) * Environment.Settings.ThirdPersonSensitivity)
				else
					if Environment.Settings.Sensitivity > 0 then
						Animation = TweenService:Create(Camera, TweenInfo.new(Environment.Settings.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)})
						Animation:Play()
					else
						Camera.CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)
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

--// Functions

Environment.Functions = {}

function Environment.Functions:Exit()
	for _, v in next, ServiceConnections do
		v:Disconnect()
	end

	if Environment.FOVCircle.Remove then Environment.FOVCircle:Remove() end

	getgenv().Aimbot.Functions = nil
	getgenv().Aimbot = nil
	
	Load = nil; GetClosestPlayer = nil; CancelLock = nil
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

AimbotSection:AddToggle("AimbotTogToggle FOV Circlegle", {
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

local savedLocations = {}  -- Hier werden die gespeicherten Orte gespeichert
local locationNames = {}   -- Namen für das Dropdown-Menü

-- Dropdown-Menü erstellen
local Dropdown = Tabs.Teleport:AddDropdown("TeleportDropdown", {
    Title = "Teleport to...",
    Values = {"No location saved"},
    Multi = false,
    Default = 1,
})

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

-- Initialisiere die Liste der Spieler zu Beginn
UpdatePlayerList()

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
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

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
