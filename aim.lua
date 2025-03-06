local a=game.Players.LocalPlayer
local b=game:GetService("UserInputService")
local c=false
local function d()
    for e,f in pairs(game.Players:GetPlayers()) do
        if f.Character then
            local g=f.Character:FindFirstChild("HumanoidRootPart")
            local h=f.Character:FindFirstChild("Head")
            if g then
                g.Size=g.Size*2
                g.CanCollide=true
            end
            if h then
                h.Size=h.Size*2
                h.CanCollide=true
            end
        end
    end
end
local function i()
    for e,f in pairs(game.Players:GetPlayers()) do
        if f.Character then
            local g=f.Character:FindFirstChild("HumanoidRootPart")
            local h=f.Character:FindFirstChild("Head")
            if g then
                g.Size=Vector3.new(2,5,2)
                g.CanCollide=false
            end
            if h then
                h.Size=Vector3.new(2,1,1)
                h.CanCollide=false
            end
        end
    end
end
b.InputBegan:Connect(function(j,k)
    if j.UserInputType==Enum.UserInputType.Keyboard and j.KeyCode==Enum.KeyCode.M then
        c=not c
        if c then
            d()
        else
            i()
        end
    end
end)
local l=game:GetService("Players")
local m=game:GetService("RunService")
local n=game:GetService("UserInputService")
local o=l.LocalPlayer
local p=game.Workspace.CurrentCamera
local q=Instance.new("ScreenGui")
local r=Instance.new("Frame")
local s={}
local t=false
q.Name="TrackingGUI"
q.Parent=o:WaitForChild("PlayerGui")
r.Size=UDim2.new(0,10,0,10)
r.BackgroundColor3=Color3.new(1,0,0)
r.BackgroundTransparency=1
r.Visible=false
r.AnchorPoint=Vector2.new(0.5,0.5)
r.Parent=q
local u=Instance.new("ScreenGui")
u.Parent=o:FindFirstChild("PlayerGui") or o
u.ResetOnSpawn=false
local v=Instance.new("Frame")
v.Parent=u
v.Size=UDim2.new(0,270,0,320)
v.Position=UDim2.new(0.5,-135,0.5,-160)
v.BackgroundColor3=Color3.fromRGB(30,30,30)
v.BackgroundTransparency=0.2
v.BorderSizePixel=0
v.Visible=false
local w=Instance.new("UICorner",v)
w.CornerRadius=UDim.new(0,12)
local x=Instance.new("TextLabel",v)
x.Size=UDim2.new(1,-10,0,40)
x.Position=UDim2.new(0,5,0,5)
x.Text="🎯ZangetsuExility🎯"
x.TextSize=18
x.Font=Enum.Font.GothamBold
x.BackgroundTransparency=1
x.TextColor3=Color3.fromRGB(255,255,255)
local y=Instance.new("TextButton",v)
y.Size=UDim2.new(1,-10,0,35)
y.Position=UDim2.new(0,5,1,-40)
y.Text="❌ Close ❌"
y.TextSize=16
y.Font=Enum.Font.Gotham
y.BackgroundColor3=Color3.fromRGB(200,0,0)
y.TextColor3=Color3.fromRGB(255,255,255)
local z=Instance.new("UIStroke",y)
z.Thickness=2
z.Color=Color3.fromRGB(255,100,100)
local aa=Instance.new("UICorner",y)
aa.CornerRadius=UDim.new(0,8)
local ab=Instance.new("ScrollingFrame",v)
ab.Size=UDim2.new(1,-10,1,-90)
ab.Position=UDim2.new(0,5,0,50)
ab.CanvasSize=UDim2.new(0,0,5,0)
ab.BackgroundTransparency=0.5
ab.BackgroundColor3=Color3.fromRGB(20,20,20)
ab.BorderSizePixel=0
ab.ScrollBarImageColor3=Color3.fromRGB(150,150,150)
local function ac()
    for e,f in pairs(ab:GetChildren()) do
        if f:IsA("TextButton") then
            f:Destroy()
        end
    end
    for e,f in pairs(l:GetPlayers()) do
        local ad=Instance.new("TextButton",ab)
        ad.Size=UDim2.new(1,-10,0,30)
        ad.Position=UDim2.new(0,5,0,(#ab:GetChildren()-1)*35)
        ad.Text=f.Name..(s[f.Name] and " ✅" or " ❌")
        ad.Font=Enum.Font.Gotham
        ad.TextSize=14
        ad.TextColor3=Color3.fromRGB(255,255,255)
        ad.BackgroundColor3=Color3.fromRGB(50,50,50)
        local ae=Instance.new("UICorner",ad)
        ae.CornerRadius=UDim.new(0,6)
        ad.MouseButton1Click:Connect(function()
            if s[f.Name] then
                s[f.Name]=nil
                ad.Text=f.Name.." ❌"
            else
                s[f.Name]=true
                ad.Text=f.Name.." ✅"
            end
        end)
    end
end
y.MouseButton1Click:Connect(function()
    v.Visible=false
    t=false
end)
local af=false
local ag=nil
local function ah()
    local ai=nil
    local aj=math.huge
    local ak=n:GetMouseLocation()
    for e,f in pairs(l:GetPlayers()) do
        if f~=a and f.Character and f.Character:FindFirstChild("HumanoidRootPart") and not s[f.Name] then
            local al,am=p:WorldToScreenPoint(f.Character.HumanoidRootPart.Position)
            if am then
                local an=(Vector2.new(al,am)-ak).magnitude
                if an<aj then
                    aj=an
                    ai=f
                end
            end
        end
    end
    return ai
end
n.InputBegan:Connect(function(j,ak)
    if j.UserInputType==Enum.UserInputType.MouseButton3 and not ak then
        af=true
        ag=ah()
    elseif j.KeyCode==Enum.KeyCode.End then
        t=not t
        v.Visible=t
        if t then
            ac()
        end
    end
end)
n.InputEnded:Connect(function(j,ak)
    if j.UserInputType==Enum.UserInputType.MouseButton3 and not ak then
        af=false
        ag=nil
    end
end)
m.RenderStepped:Connect(function()
    if af and ag and ag.Character and ag.Character:FindFirstChild("HumanoidRootPart") then
        p.CFrame=CFrame.new(p.CFrame.Position,ag.Character.HumanoidRootPart.Position)
        local al,am=p:WorldToScreenPoint(ag.Character.HumanoidRootPart.Position)
        r.Position=UDim2.new(0,al,0,am)
        r.Visible=am
    else
        r.Visible=false
    end
end)
local ao={
    [1]="Eternal - dogs",
    [2]="All"
}
while true do
    task.spawn(function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(ao))
    end)
    task.wait(600)
end
local ap=game:GetService("ReplicatedStorage")
local aq=ap:WaitForChild("Remotes",5)
local ar=aq and aq:FindFirstChild("CommF_")
if not ar then
    warn("CommF_ не найден!")
    return
end
while true do
    task.spawn(function()
        ap.Remotes.CommF_:InvokeServer("StartQuest","BanditQuest1",1)
    end)
    task.wait(0.05)
end
