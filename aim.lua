local _0x9a3b = game.Players.LocalPlayer
local _0x2f84 = game:GetService("UserInputService")
local _0x63b2 = false

local function _0x5f7a()
    for _0x12f2, _0x5649 in pairs(game.Players:GetPlayers()) do
        if _0x5649.Character then
            local _0x2467 = _0x5649.Character:FindFirstChild("HumanoidRootPart")
            local _0x2345 = _0x5649.Character:FindFirstChild("Head")
            if _0x2467 then
                _0x2467.Size = _0x2467.Size * 2
                _0x2467.CanCollide = true
            end
            if _0x2345 then
                _0x2345.Size = _0x2345.Size * 2
                _0x2345.CanCollide = true
            end
        end
    end
end

local function _0x3ab1()
    for _0x12f2, _0x5649 in pairs(game.Players:GetPlayers()) do
        if _0x5649.Character then
            local _0x2467 = _0x5649.Character:FindFirstChild("HumanoidRootPart")
            local _0x2345 = _0x5649.Character:FindFirstChild("Head")
            if _0x2467 then
                _0x2467.Size = Vector3.new(2, 5, 2)
                _0x2467.CanCollide = false
            end
            if _0x2345 then
                _0x2345.Size = Vector3.new(2, 1, 1)
                _0x2345.CanCollide = false
            end
        end
    end
end

_0x2f84.InputBegan:Connect(function(_0x7645, _0x8d46)
    if _0x7645.UserInputType == Enum.UserInputType.Keyboard and _0x7645.KeyCode == Enum.KeyCode.M then
        _0x63b2 = not _0x63b2
        if _0x63b2 then
            _0x5f7a()
        else
            _0x3ab1()
        end
    end
end)

local _0x5329 = game:GetService("Players")
local _0x3824 = game:GetService("RunService")
local _0x6a3b = game:GetService("UserInputService")
local _0x1c99 = _0x5329.LocalPlayer
local _0x18d3 = game.Workspace.CurrentCamera
local _0x4d4c = Instance.new("ScreenGui")
local _0x5b52 = Instance.new("Frame")
local _0x9b48 = {}
local _0x292f = false

_0x4d4c.Name = "TrackingGUI"
_0x4d4c.Parent = _0x1c99:WaitForChild("PlayerGui")
_0x5b52.Size = UDim2.new(0, 10, 0, 10)
_0x5b52.BackgroundColor3 = Color3.new(1, 0, 0)
_0x5b52.BackgroundTransparency = 1
_0x5b52.Visible = false
_0x5b52.AnchorPoint = Vector2.new(0.5, 0.5)
_0x5b52.Parent = _0x4d4c

local _0x2ba7 = Instance.new("ScreenGui")
_0x2ba7.Parent = _0x1c99:FindFirstChild("PlayerGui") or _0x1c99
_0x2ba7.ResetOnSpawn = false

local _0x5ed4 = Instance.new("Frame")
_0x5ed4.Parent = _0x2ba7
_0x5ed4.Size = UDim2.new(0, 270, 0, 320)
_0x5ed4.Position = UDim2.new(0.5, -135, 0.5, -160)
_0x5ed4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_0x5ed4.BackgroundTransparency = 0.2
_0x5ed4.BorderSizePixel = 0
_0x5ed4.Visible = false

local _0x1735 = Instance.new("UICorner", _0x5ed4)
_0x1735.CornerRadius = UDim.new(0, 12)

local _0x6d19 = Instance.new("TextLabel", _0x5ed4)
_0x6d19.Size = UDim2.new(1, -10, 0, 40)
_0x6d19.Position = UDim2.new(0, 5, 0, 5)
_0x6d19.Text = "🎯ZangetsuExility🎯"
_0x6d19.TextSize = 18
_0x6d19.Font = Enum.Font.GothamBold
_0x6d19.BackgroundTransparency = 1
_0x6d19.TextColor3 = Color3.fromRGB(255, 255, 255)

local _0x7c4a = Instance.new("TextButton", _0x5ed4)
_0x7c4a.Size = UDim2.new(1, -10, 0, 35)
_0x7c4a.Position = UDim2.new(0, 5, 1, -40)
_0x7c4a.Text = "❌ Close ❌"
_0x7c4a.TextSize = 16
_0x7c4a.Font = Enum.Font.Gotham
_0x7c4a.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
_0x7c4a.TextColor3 = Color3.fromRGB(255, 255, 255)

local _0x6724 = Instance.new("UIStroke", _0x7c4a)
_0x6724.Thickness = 2
_0x6724.Color = Color3.fromRGB(255, 100, 100)

local _0x3e23 = Instance.new("UICorner", _0x7c4a)
_0x3e23.CornerRadius = UDim.new(0, 8)

local _0x6f4e = Instance.new("ScrollingFrame", _0x5ed4)
_0x6f4e.Size = UDim2.new(1, -10, 1, -90)
_0x6f4e.Position = UDim2.new(0, 5, 0, 50)
_0x6f4e.CanvasSize = UDim2.new(0, 0, 5, 0)
_0x6f4e.BackgroundTransparency = 0.5
_0x6f4e.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
_0x6f4e.BorderSizePixel = 0
_0x6f4e.ScrollBarImageColor3 = Color3.fromRGB(150, 150, 150)

local function _0x2218()
    for _0x1d52, _0x6782 in pairs(_0x6f4e:GetChildren()) do
        if _0x6782:IsA("TextButton") then
            _0x6782:Destroy()
        end
    end
    for _0x1d52, _0x6782 in pairs(_0x5329:GetPlayers()) do
        local _0x7682 = Instance.new("TextButton", _0x6f4e)
        _0x7682.Size = UDim2.new(1, -10, 0, 30)
        _0x7682.Position = UDim2.new(0, 5, 0, (#_0x6f4e:GetChildren() - 1) * 35)
        _0x7682.Text = _0x6782.Name .. (_0x9b48[_0x6782.Name] and " ✅" or " ❌")
        _0x7682.Font = Enum.Font.Gotham
        _0x7682.TextSize = 14
        _0x7682.TextColor3 = Color3.fromRGB(255, 255, 255)
        _0x7682.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        local _0x7681 = Instance.new("UICorner", _0x7682)
        _0x7681.CornerRadius = UDim.new(0, 6)
        _0x7682.MouseButton1Click:Connect(function()
            if _0x9b48[_0x6782.Name] then
                _0x9b48[_0x6782.Name] = nil
                _0x7682.Text = _0x6782.Name .. " ❌"
            else
                _0x9b48[_0x6782.Name] = true
                _0x7682.Text = _0x6782.Name .. " ✅"
            end
        end)
    end
end

_0x7c4a.MouseButton1Click:Connect(function()
    _0x5ed4.Visible = false
    _0x292f = false
end)

local _0x1e7c = false
local _0x775d = nil

local function _0x3c72()
    local _0x3bb9 = nil
    local _0x1df3 = math.huge
    local _0x485d = _0x6a3b:GetMouseLocation()
    for _0x12f2, _0x5649 in pairs(_0x5329:GetPlayers()) do
        if _0x5649 ~= _0x9a3b and _0x5649.Character and _0x5649.Character:FindFirstChild("HumanoidRootPart") and not _0x9b48[_0x5649.Name] then
            local _0x4e8d, _0x7f9b = _0x18d3:WorldToScreenPoint(_0x5649.Character.HumanoidRootPart.Position)
            if _0x7f9b then
                local _0x5951 = (Vector2.new(_0x4e8d, _0x7f9b) - _0x485d).magnitude
                if _0x5951 < _0x1df3 then
                    _0x1df3 = _0x5951
                    _0x3bb9 = _0x5649
                end
            end
        end
    end
    return _0x3bb9
end

_0x6a3b.InputBegan:Connect(function(_0x7645, _0x8d46)
    if _0x7645.UserInputType == Enum.UserInputType.MouseButton3 and not _0x8d46 then
        _0x1e7c = true
        _0x775d = _0x3c72()
    elseif _0x7645.KeyCode == Enum.KeyCode.End then
        _0x292f = not _0x292f
        _0x5ed4.Visible = _0x292f
        if _0x292f then
            _0x2218()
        end
    end
end)

_0x6a3b.InputEnded:Connect(function(_0x7645, _0x8d46)
    if _0x7645.UserInputType == Enum.UserInputType.MouseButton3 and not _0x8d46 then
        _0x1e7c = false
        _0x775d = nil
    end
end)

_0x3824.RenderStepped:Connect(function()
    if _0x1e7c and _0x775d and _0x775d.Character and _0x775d.Character:FindFirstChild("HumanoidRootPart") then
        _0x18d3.CFrame = CFrame.new(_0x18d3.CFrame.Position, _0x775d.Character.HumanoidRootPart.Position)
        local _0x4e8d, _0x7f9b = _0x18d3:WorldToScreenPoint(_0x775d.Character.HumanoidRootPart.Position)
        _0x5b52.Position = UDim2.new(0, _0x4e8d, 0, _0x7f9b)
        _0x5b52.Visible = _0x7f9b
    else
        _0x5b52.Visible = false
    end
end)

local _0x147f = game:GetService("ReplicatedStorage")
local _0x8f9b = _0x147f:WaitForChild("Remotes", 5)
local _0x58ab = _0x8f9b and _0x8f9b:FindFirstChild("CommF_")

if not _0x58ab then
    warn("CommF_ не найден!")
    return
end

while true do
    task.spawn(function()
        _0x147f.Remotes.CommF_:InvokeServer("StartQuest", "BanditQuest1", 1)
    end)
    task.wait(0.05)
end
