--[[
    Script: Workspace.TyredMich.AntiSlideClientTest
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_RunService_0 = game:GetService("RunService");
local l_HumanoidRootPart_0 = script.Parent:WaitForChild("HumanoidRootPart");
local v2 = {};
local v3 = 1;
l_RunService_0.Stepped:Connect(function() --[[ Line: 11 ]]
    -- upvalues: l_HumanoidRootPart_0 (copy), v3 (ref), v2 (copy)
    local l_Magnitude_0 = l_HumanoidRootPart_0.AssemblyLinearVelocity.Magnitude;
    v2[v3 % 20] = l_Magnitude_0;
    local v5 = 0;
    for v6 = 1, #v2 do
        v5 = v5 + v2[v6];
    end;
    v5 = v5 / #v2;
    v3 = v3 + 1;
    if math.abs(v5) < 0.1 then
        l_HumanoidRootPart_0.AssemblyLinearVelocity = Vector3.new(0, 0, 0, 0);
    end;
end);