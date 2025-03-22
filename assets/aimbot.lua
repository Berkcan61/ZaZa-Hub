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
