--[[
    Script: Workspace.ObjectiveMarker.BillboardGui.Animate
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_TweenService_0 = game:GetService("TweenService");
local v1 = TweenInfo.new(2, Enum.EasingStyle.Linear);
while true do
    l_TweenService_0:Create(script.Parent, v1, {
        StudsOffsetWorldSpace = Vector3.new(0, 5, 0, 0)
    }):Play();
    task.wait(2);
    l_TweenService_0:Create(script.Parent, v1, {
        StudsOffsetWorldSpace = Vector3.new(0, 4, 0, 0)
    }):Play();
    task.wait(2);
end;