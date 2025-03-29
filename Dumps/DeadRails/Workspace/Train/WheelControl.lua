--[[
    Script: Workspace.Train.WheelControl
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = {
    Medium = game.ReplicatedStorage.Assets.MediumWheelBase, 
    Large = game.ReplicatedStorage.Assets.WheelBaseLarge
};
local l_RunService_0 = game:GetService("RunService");
(function() --[[ Line: 8 ]] --[[ Name: initializeWheels ]]
    -- upvalues: v0 (copy), l_RunService_0 (copy)
    script.Parent.WheelBases:ClearAllChildren();
    for _, v3 in pairs(script.Parent.AxelNodes:GetChildren()) do
        local v4 = v0[v3.Name]:Clone();
        v4.Parent = script.Parent.WheelBases;
        l_RunService_0.Heartbeat:Connect(function() --[[ Line: 15 ]]
            -- upvalues: v3 (copy), v4 (copy)
            local l_Magnitude_0 = v3.AssemblyLinearVelocity.Magnitude;
            local l_Value_0 = v4.Radius.Value;
            local v7, _, _ = v4:GetPivot():ToEulerAnglesXYZ();
            v4:PivotTo(v3.CFrame * CFrame.Angles(v7 - math.rad(l_Magnitude_0 / l_Value_0), 0, 0));
        end);
    end;
end)();