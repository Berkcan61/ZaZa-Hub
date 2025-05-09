local ZaZa = {}
ZaZa.__index = ZaZa

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function Create(class, props)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        obj[k] = v
    end
    return obj
end

function ZaZa:CreateWindow(config)
    local self = setmetatable({}, ZaZa)

    self.Gui = Create("ScreenGui", {
        Name = "ZaZaGui",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        Parent = game.CoreGui
    })

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

    Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = self.Window
    })

    self.Title = Create("TextLabel", {
        Text = config.Title or "ZaZa GUI",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        TextColor3 = Color3.new(1, 1, 1),
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        Parent = self.Window
    })

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

    return self
end

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

function ZaZa:SelectTab(index)
    if self.Tabs[index] then
        self.Tabs[index].Button:Fire("MouseButton1Click")
    end
end

return ZaZa
