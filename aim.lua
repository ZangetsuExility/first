local a=game.Players.LocalPlayer
local b=game:GetService("UserInputService")
local c=false

local function d()
    for _,e in pairs(game.Players:GetPlayers())do
        if e.Character then
            local f=e.Character:FindFirstChild("HumanoidRootPart")
            local g=e.Character:FindFirstChild("Head")
            if f then f.Size=f.Size*2 f.CanCollide=true end
            if g then g.Size=g.Size*2 g.CanCollide=true end
        end
    end
end

local function h()
    for _,e in pairs(game.Players:GetPlayers())do
        if e.Character then
            local f=e.Character:FindFirstChild("HumanoidRootPart")
            local g=e.Character:FindFirstChild("Head")
            if f then f.Size=Vector3.new(2,5,2) f.CanCollide=false end
            if g then g.Size=Vector3.new(2,1,1) g.CanCollide=false end
        end
    end
end

b.InputBegan:Connect(function(i,j)
    if i.UserInputType==Enum.UserInputType.Keyboard and i.KeyCode==Enum.KeyCode.M then
        c=not c
        if c then d() else h() end
    end
end)

local k=game:GetService("Players")
local l=game:GetService("RunService")
local m=game:GetService("UserInputService")
local n=k.LocalPlayer
local o=game.Workspace.CurrentCamera
local p=Instance.new("ScreenGui")
local q=Instance.new("Frame")
local r={}
local s=false

p.Name="TrackingGUI"
p.Parent=n:WaitForChild("PlayerGui")

q.Size=UDim2.new(0,10,0,10)
q.BackgroundColor3=Color3.new(1,0,0)
q.BackgroundTransparency=1
q.Visible=false
q.AnchorPoint=Vector2.new(0.5,0.5)
q.Parent=p

local t=Instance.new("ScreenGui")
t.Parent=n:FindFirstChild("PlayerGui")or n
t.ResetOnSpawn=false

local u=Instance.new("Frame")
u.Parent=t
u.Size=UDim2.new(0,270,0,320)
u.Position=UDim2.new(0.5,-135,0.5,-160)
u.BackgroundColor3=Color3.fromRGB(30,30,30)
u.BackgroundTransparency=0.2
u.BorderSizePixel=0
u.Visible=false

Instance.new("UICorner",u).CornerRadius=UDim.new(0,12)

local v=Instance.new("TextLabel",u)
v.Size=UDim2.new(1,-10,0,40)
v.Position=UDim2.new(0,5,0,5)
v.Text="🎯ZangetsuExility🎯"
v.TextSize=18
v.Font=Enum.Font.GothamBold
v.BackgroundTransparency=1
v.TextColor3=Color3.fromRGB(255,255,255)

local w=Instance.new("TextButton",u)
w.Size=UDim2.new(1,-10,0,35)
w.Position=UDim2.new(0,5,1,-40)
w.Text="❌ Close ❌"
w.TextSize=16
w.Font=Enum.Font.Gotham
w.BackgroundColor3=Color3.fromRGB(200,0,0)
w.TextColor3=Color3.fromRGB(255,255,255)
Instance.new("UIStroke",w).Thickness=2
Instance.new("UICorner",w).CornerRadius=UDim.new(0,8)

local x=Instance.new("ScrollingFrame",u)
x.Size=UDim2.new(1,-10,1,-90)
x.Position=UDim2.new(0,5,0,50)
x.CanvasSize=UDim2.new(0,0,5,0)
x.BackgroundTransparency=0.5
x.BackgroundColor3=Color3.fromRGB(20,20,20)
x.BorderSizePixel=0
x.ScrollBarImageColor3=Color3.fromRGB(150,150,150)

local function y()
    for _,z in pairs(x:GetChildren())do
        if z:IsA("TextButton")then z:Destroy()end
    end
    for _,aa in pairs(k:GetPlayers())do
        local ab=Instance.new("TextButton",x)
        ab.Size=UDim2.new(1,-10,0,30)
        ab.Position=UDim2.new(0,5,0,(#x:GetChildren()-1)*35)
        ab.Text=aa.Name..(r[aa.Name]and" ✅"or" ❌")
        ab.Font=Enum.Font.Gotham
        ab.TextSize=14
        ab.TextColor3=Color3.fromRGB(255,255,255)
        ab.BackgroundColor3=Color3.fromRGB(50,50,50)
        Instance.new("UICorner",ab).CornerRadius=UDim.new(0,6)
        ab.MouseButton1Click:Connect(function()
            if r[aa.Name]then
                r[aa.Name]=nil
                ab.Text=aa.Name.." ❌"
            else
                r[aa.Name]=true
                ab.Text=aa.Name.." ✅"
            end
        end)
    end
end

w.MouseButton1Click:Connect(function()
    u.Visible=false
    s=false
end)

local ac,ad=false,nil

local function ae()
    local af,ag=nil,math.huge
    local ah=m:GetMouseLocation()
    for _,ai in pairs(k:GetPlayers())do
        if ai~=n and ai.Character and ai.Character:FindFirstChild("HumanoidRootPart")and not r[ai.Name]then
            local aj,ak=o:WorldToScreenPoint(ai.Character.HumanoidRootPart.Position)
            if ak then
                local al=(Vector2.new(aj.X,aj.Y)-ah).magnitude
                if al<ag then
                    ag=al
                    af=ai
                end
            end
        end
    end
    return af
end

m.InputBegan:Connect(function(am,an)
    if am.UserInputType==Enum.UserInputType.MouseButton3 and not an then
        ac=true
        ad=ae()
    elseif am.KeyCode==Enum.KeyCode.End then
        s=not s
        u.Visible=s
        if s then y()end
    end
end)

m.InputEnded:Connect(function(am,an)
    if am.UserInputType==Enum.UserInputType.MouseButton3 and not an then
        ac=false
        ad=nil
    end
end)

l.RenderStepped:Connect(function()
    if ac and ad and ad.Character and ad.Character:FindFirstChild("HumanoidRootPart")then
        o.CFrame=CFrame.new(o.CFrame.Position,ad.Character.HumanoidRootPart.Position)
        local aj,ak=o:WorldToScreenPoint(ad.Character.HumanoidRootPart.Position)
        q.Position=UDim2.new(0,aj.X,0,aj.Y)
        q.Visible=ak
    else
        q.Visible=false
    end
end)

local al={ [1]="Eternal - dogs", [2]="All" }

while true do
    task.spawn(function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(al))
    end)
    task.wait(600)
end

local am=game:GetService("ReplicatedStorage")
local an=am:WaitForChild("Remotes",5)
local ao=an and an:FindFirstChild("CommF_")

if not ao then
    warn("CommF_ не найден!")
    return
end

while true do
    task.spawn(function()
        am.Remotes.CommF_:InvokeServer("StartQuest","BanditQuest1",1)
    end)
    task.wait(0.05)
end
