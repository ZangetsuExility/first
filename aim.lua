local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local camera = game.Workspace.CurrentCamera 
local ScreenGui = Instance.new("ScreenGui")
local TargetBox = Instance.new("Frame")
local whitelist = {}
local menuVisible = false

ScreenGui.Name = "TrackingGUI"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

TargetBox.Size = UDim2.new(0, 10, 0, 10) 
TargetBox.BackgroundColor3 = Color3.new(1, 0, 0)  
TargetBox.BackgroundTransparency = 1  
TargetBox.Visible = false
TargetBox.AnchorPoint = Vector2.new(0.5, 0.5)
TargetBox.Parent = ScreenGui

-- GUI меню
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:FindFirstChild("PlayerGui") or player
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 270, 0, 320)
frame.Position = UDim2.new(0.5, -135, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Visible = false

-- Закруглённые углы
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

-- Заголовок
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -10, 0, 40)
title.Position = UDim2.new(0, 5, 0, 5)
title.Text = "🎯ZangetsuExility🎯"
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Кнопка закрытия
local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(1, -10, 0, 35)
closeButton.Position = UDim2.new(0, 5, 1, -40)
closeButton.Text = "❌ Close ❌"
closeButton.TextSize = 16
closeButton.Font = Enum.Font.Gotham
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Обводка кнопки
local stroke = Instance.new("UIStroke", closeButton)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 100, 100)

-- Закруглённые углы кнопки
local buttonCorner = Instance.new("UICorner", closeButton)
buttonCorner.CornerRadius = UDim.new(0, 8)

-- Список игроков
local playerListFrame = Instance.new("ScrollingFrame", frame)
playerListFrame.Size = UDim2.new(1, -10, 1, -90)
playerListFrame.Position = UDim2.new(0, 5, 0, 50)
playerListFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
playerListFrame.BackgroundTransparency = 0.5
playerListFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
playerListFrame.BorderSizePixel = 0
playerListFrame.ScrollBarImageColor3 = Color3.fromRGB(150, 150, 150)

-- Обновление списка игроков
local function updatePlayerList()
    for _, child in pairs(playerListFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    for _, otherPlayer in pairs(Players:GetPlayers()) do -- Змінив players на Players
        local playerButton = Instance.new("TextButton", playerListFrame)
        playerButton.Size = UDim2.new(1, -10, 0, 30)
        playerButton.Position = UDim2.new(0, 5, 0, (#playerListFrame:GetChildren() - 1) * 35)
        playerButton.Text = otherPlayer.Name .. (whitelist[otherPlayer.Name] and " ✅" or " ❌")
        playerButton.Font = Enum.Font.Gotham
        playerButton.TextSize = 14
        playerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        
        local corner = Instance.new("UICorner", playerButton)
        corner.CornerRadius = UDim.new(0, 6)

        playerButton.MouseButton1Click:Connect(function()
            if whitelist[otherPlayer.Name] then
                whitelist[otherPlayer.Name] = nil
                playerButton.Text = otherPlayer.Name .. " ❌"
            else
                whitelist[otherPlayer.Name] = true
                playerButton.Text = otherPlayer.Name .. " ✅"
            end
        end)
    end
end

closeButton.MouseButton1Click:Connect(function()
    frame.Visible = false
    menuVisible = false
end)

local trackingEnabled = false
local trackedPlayer = nil

local function getNearestPlayerToMouse()
    local nearestPlayer = nil
    local shortestDistance = math.huge
    local mouseLocation = UserInputService:GetMouseLocation()

    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") and not whitelist[otherPlayer.Name] then
            local screenPosition, onScreen = camera:WorldToScreenPoint(otherPlayer.Character.HumanoidRootPart.Position)
            if onScreen then
                local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - mouseLocation).magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    nearestPlayer = otherPlayer
                end
            end
        end
    end
    return nearestPlayer
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton3 and not gameProcessed then  
        trackingEnabled = true
        trackedPlayer = getNearestPlayerToMouse()
    elseif input.KeyCode == Enum.KeyCode.End then
        menuVisible = not menuVisible
        frame.Visible = menuVisible
        if menuVisible then
            updatePlayerList()
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton3 and not gameProcessed then  
        trackingEnabled = false
        trackedPlayer = nil
    end
end)

RunService.RenderStepped:Connect(function()
    if trackingEnabled and trackedPlayer and trackedPlayer.Character and trackedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        camera.CFrame = CFrame.new(camera.CFrame.Position, trackedPlayer.Character.HumanoidRootPart.Position)
        local screenPosition, onScreen = camera:WorldToScreenPoint(trackedPlayer.Character.HumanoidRootPart.Position)
        TargetBox.Position = UDim2.new(0, screenPosition.X, 0, screenPosition.Y)
        TargetBox.Visible = onScreen
    else
        TargetBox.Visible = false
    end
end)
local args = {
    [1] = "Eternal - dogs",
    [2] = "All"
}

while true do
    task.spawn(function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
    end)
    task.wait(600)
end
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 5) 
local CommF = Remotes and Remotes:FindFirstChild("CommF_")

if not CommF then
    warn("CommF_ не найден!")
    return
end

while true do
    task.spawn(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", "BanditQuest1", 1)
    end)
    task.wait(0.05) 
end
