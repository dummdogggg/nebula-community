--[[
    Script: StarterPlayer.StarterPlayerScripts.TrainReplication
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_RunService_0 = game:GetService("RunService");
local l_VisualTrain_0 = game.Workspace:WaitForChild("VisualTrain");
local l_Train_0 = game.Workspace:WaitForChild("Train");
l_RunService_0.Heartbeat:Connect(function() --[[ Line: 8 ]]
    -- upvalues: l_VisualTrain_0 (copy), l_Train_0 (copy)
    print(1);
    l_VisualTrain_0:PivotTo(l_Train_0.Leader:GetPivot());
end);