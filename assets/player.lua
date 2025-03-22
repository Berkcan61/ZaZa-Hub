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
