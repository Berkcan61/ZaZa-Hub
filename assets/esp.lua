local Tabs = {
    ESP = Window:AddTab({ Title = "ESP", Icon = "eye" })
}

local ESP_Boxes_Enabled = false
local ESP_Distance_Enabled = false
local ESP_Lines_Enabled = false

local ESP_Boxes = {}
local ESP_Distances = {}
local ESP_Lines = {}
local ESP_Connections = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

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
