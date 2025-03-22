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
