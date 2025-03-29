--[[
    Script: Workspace.RuntimeItems.Runner.LocalAnimate
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local _ = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Animations"):WaitForChild("Entity"):WaitForChild("Walker");
local l_Humanoid_0 = script.Parent:WaitForChild("Humanoid");
local l_Animator_0 = Instance.new("Animator");
l_Animator_0.Parent = l_Humanoid_0;
local l_Value_0 = script:WaitForChild("IdleAnimation").Value;
while not l_Value_0 do
    task.wait();
    l_Value_0 = script:WaitForChild("IdleAnimation").Value;
end;
l_Animator_0:LoadAnimation(l_Value_0):Play();