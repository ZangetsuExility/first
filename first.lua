local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")
local userInput = game:GetService("UserInputService")

local aimlockEnabled = false
local targetPlayer = nil

-- Функция поиска ближайшего игрока
local function getClosestPlayer()
    local closest = nil
    local shortestDist = math.huge

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local hrp = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local screenPos, onScreen = camera:WorldToViewportPoint(hrp.Position)
                local dist = (Vector2.new(userInput:GetMouseLocation().X, userInput:GetMouseLocation().Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude

                if dist < shortestDist and onScreen then
                    closest = hrp
                    shortestDist = dist
                end
            end
        end
    end

    return closest
end

-- Функция для включения/выключения Aimlock
local function toggleAimlock()
    aimlockEnabled = not aimlockEnabled
    if aimlockEnabled then
        targetPlayer = getClosestPlayer()
    else
        targetPlayer = nil
    end
end

-- Включение Aimlock при удержании боковой кнопки мышки (MouseButton4)
userInput.InputBegan:Connect(function(input, processed)
    if input.UserInputType == Enum.UserInputType.MouseButton3 then
        aimlockEnabled = true
        targetPlayer = getClosestPlayer()
    end
end)

-- Выключение Aimlock при отпускании боковой кнопки мышки (MouseButton3)
userInput.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton3 then
        aimlockEnabled = false
        targetPlayer = nil
    end
end)

-- Постоянное наведение на цель
runService.RenderStepped:Connect(function()
    if aimlockEnabled and targetPlayer then
        camera.CFrame = CFrame.new(camera.CFrame.Position, targetPlayer.Position)
    end
end)
