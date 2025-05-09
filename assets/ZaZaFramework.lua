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

--// Drag Funktion für das Fenster hinzufügen
function ZaZa:EnableDrag()
    local dragging = false
    local dragStart, startPos

    -- Titelbereich als Drag-Bereich verwenden
    self.Title.MouseButton1Down:Connect(function()
        dragging = true
        dragStart = Mouse.Position
        startPos = self.Window.Position
    end)

    Mouse.Move:Connect(function()
        if dragging then
            local delta = Mouse.Position - dragStart
            self.Window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    Mouse.Button1Up:Connect(function()
        dragging = false
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
        self.Gui:Destroy()  -- Fenster schließen
    end)

    -- Minimieren-Button Funktionalität
    self.MinimizeButton.MouseButton1Click:Connect(function()
        self.Window.Visible = false  -- Fenster minimieren
    end)

    -- Vollbild-Button Funktionalität
    self.FullscreenButton.MouseButton1Click:Connect(function()
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
        if self.CurrentTab then
            self.CurrentTab.Content.Visible = false
        end
        tab.Content.Visible = true
        self.CurrentTab = tab
    end)

    table.insert(self.Tabs, tab)
    return tab
end

-- Tab auswählen
function ZaZa:SelectTab(index)
    if self.Tabs[index] then
        self.Tabs[index].Button:Fire("MouseButton1Click")
    end
end

return ZaZa
