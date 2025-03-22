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
