--[[
    Script: Workspace.RuntimeItems.Werewolf.AnimateWalk
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = script.Parent.Humanoid.Animator:LoadAnimation(script.Parent.Walk);
while script.Parent.Humanoid.Health > 0 do
    if v0.IsPlaying == false and script.Parent.HumanoidRootPart.Velocity.Magnitude > 1 then
        v0:Play();
    elseif script.Parent.HumanoidRootPart.Velocity.Magnitude < 1 then
        v0:Stop();
    end;
    task.wait(0.3);
end;
v0:Stop();