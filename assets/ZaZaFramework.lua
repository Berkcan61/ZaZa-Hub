local ZaZa = {}
ZaZa.__index = ZaZa

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Helper Funktion zum Erstellen von Instanzen
local function Create(class, props)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        obj[k] = v
    end
    return obj
end

-- Hauptfunktion: Fenster erstellen
function ZaZa:CreateWindow(config)
    local self = setmetatable({}, ZaZa)

    -- ScreenGui
    self.Gui = Create("ScreenGui", {
        Name = "ZaZaGui",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        Parent = game.CoreGui
    })

    -- Hauptframe
    self.Window = Create("Frame", {
        Name = "MainWindow",
        Size = config.Size or UDim2.fromOffset(580, 460),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = self.Gui
    })

    -- UICorner
    Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = self.Window
    })

    -- Titel
    self.Title = Create("TextLabel", {
        Text = config.Title or "ZaZa GUI",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        TextColor3 = Color3.new(1, 1, 1),
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        Parent = self.Window
    })

    -- Tab Container
    self.TabButtons = Create("Frame", {
        Size = UDim2.new(0, config.TabWidth or 160, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0,
        Parent = self.Window
    })

    Create("UICorner", { CornerRadius = UDim.new(0, 10), Parent = self.TabButtons })

    self.TabContent = Create("Frame", {
        Size = UDim2.new(1, -(config.TabWidth or 160), 1, -40),
        Position = UDim2.new(0, (config.TabWidth or 160), 0, 40),
        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
        BorderSizePixel = 0,
        Parent = self.Window
    })

    self.Tabs = {}
    self.CurrentTab = nil

    -- Buttons für Minimize, Close und Fullscreen
    self:CreateWindowButtons()

    -- Drag-Funktion aktivieren
    self:EnableDrag()

    return self
end

function ZaZa:EnableDrag()
    local dragging = false
    local dragStart, startPos

    local UIS = game:GetService("UserInputService")

    local DragButton = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 40),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        Parent = self.Window
    })

    DragButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.Window.Position
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            self.Window.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- Buttons für Minimieren, Schließen und Vollbild
function ZaZa:CreateWindowButtons()
    -- Schließen-Button
    self.CloseButton = Create("TextButton", {
        Text = "X",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -40, 0, 10),
        BackgroundColor3 = Color3.fromRGB(255, 0, 0),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        Parent = self.Window
    })

    -- Minimieren-Button
    self.MinimizeButton = Create("TextButton", {
        Text = "-",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -80, 0, 10),
        BackgroundColor3 = Color3.fromRGB(0, 255, 0),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        Parent = self.Window
    })

    -- Vollbild-Button
    self.FullscreenButton = Create("TextButton", {
        Text = "☐",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -120, 0, 10),
        BackgroundColor3 = Color3.fromRGB(0, 0, 255),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        Parent = self.Window
    })

    -- Schließen-Button Funktionalität
    self.CloseButton.MouseButton1Click:Connect(function()
        print("Schließen-Button geklickt")
        self.Gui:Destroy()  -- Fenster schließen
    end)

    -- Minimieren-Button Funktionalität
    self.MinimizeButton.MouseButton1Click:Connect(function()
        print("Minimieren-Button geklickt")
        self.Window.Visible = false  -- Fenster minimieren
    end)

    -- Vollbild-Button Funktionalität
    self.FullscreenButton.MouseButton1Click:Connect(function()
        print("Vollbild-Button geklickt")
        self.Window.Size = UDim2.fromScale(1, 1)  -- Fenster auf Vollbild setzen
        self.Window.Position = UDim2.fromScale(0, 0)
    end)
end

-- Tabs hinzufügen
function ZaZa:AddTab(tabConfig)
    local tab = {}
    tab.Button = Create("TextButton", {
        Text = tabConfig.Title,
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        TextColor3 = Color3.new(1, 1, 1),
        Font = Enum.Font.Gotham,
        TextSize = 14,
        Parent = self.TabButtons
    })

    tab.Content = Create("Frame", {
        Visible = false,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Parent = self.TabContent
    })

    tab.Button.MouseButton1Click:Connect(function()
        self:ActivateTab(tab)
    end)

    table.insert(self.Tabs, tab)
    return tab
end

function ZaZa:ActivateTab(tab)
    if self.CurrentTab then
        self.CurrentTab.Content.Visible = false
    end
    tab.Content.Visible = true
    self.CurrentTab = tab
end

-- Tab auswählen
function ZaZa:SelectTab(index)
    if self.Tabs[index] then
        self:ActivateTab(self.Tabs[index])
    end
end

return ZaZa
