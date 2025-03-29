--[[
    Script: StarterPlayer.StarterPlayerScripts.WheelMove
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_CollectionService_0 = game:GetService("CollectionService");
print("Helllooo world");
while true do
    task.wait(0.1);
    for _, v2 in pairs(l_CollectionService_0:GetTagged("WheelBase")) do
        if v2:IsDescendantOf(workspace) and v2:FindFirstChild("Axel") then
            v2.Axel.HingeConstraint.ActuatorType = Enum.ActuatorType.Motor;
            local l_Magnitude_0 = v2.Axel.AssemblyLinearVelocity.Magnitude;
            local v4 = l_Magnitude_0 / 1.8;
            print(l_Magnitude_0, v4);
            v2.Axel.HingeConstraint.AngularVelocity = v4 * 10;
        end;
    end;
end;