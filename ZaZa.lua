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

-- Esp.lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Berkcan61/ZaZa-Hub/refs/heads/main/assets/esp.lua"))()
print("esp loaded!")

-- Player.lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Berkcan61/ZaZa-Hub/refs/heads/main/assets/player.lua"))()

-- Aimbot.lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Berkcan61/ZaZa-Hub/refs/heads/main/assets/aimbot.lua"))()

-- Teleport.lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Berkcan61/ZaZa-Hub/refs/heads/main/assets/teleport.lua"))()

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
