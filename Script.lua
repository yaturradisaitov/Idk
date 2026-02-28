local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com"))() -- Пример простой библиотеки GUI
local Window = Library.CreateLib("My Script Hub", "RJTheme3")

-- ПЕРЕМЕННЫЕ
local CorrectKey = "Mykeyscriptrobloxhahakeysckripthamu"
local LootLink = "https://lootdest.org/s?VGzi7Ad0"

-- ВКЛАДКА КЛЮЧА
local KeyTab = Window:NewTab("Key System")
local KeySection = KeyTab:NewSection("Enter Key to Unlock")

KeySection:NewTextBox("Enter Key Here", "Paste the key", function(input)
    if input == CorrectKey then
        print("Access Granted!")
        -- Здесь можно добавить уведомление об успехе
    else
        warn("NO - Wrong Key")
    end
end)

KeySection:NewButton("Copy Key Link (Loot-link)", "Get the key here", function()
    setclipboard(LootLink)
    print("Link copied to clipboard!")
end)

-- ВКЛАДКА ФУНКЦИЙ (MAIN)
local MainTab = Window:NewTab("Main Features")
local MainSection = MainTab:NewSection("Player Mods")

-- Скорость (Speed)
MainSection:NewTextBox("WalkSpeed", "Default is 16", function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(value)
end)

-- Прыжок (JumpPower)
MainSection:NewTextBox("JumpPower", "Default is 50", function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(value)
end)

-- Fly (Полет)
MainSection:NewButton("Toggle Fly", "Enable/Disable Flight", function()
    -- Здесь обычно вставляется сложный код на полет
    print("Fly Toggled")
end)

-- Noclip (Сквозь стены)
local noclip = false
MainSection:NewButton("Noclip", "Walk through walls", function()
    noclip = not noclip
    game:GetService("RunService").Stepped:Connect(function()
        if noclip then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)
