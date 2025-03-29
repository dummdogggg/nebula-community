--[[
    Script: Workspace.TyredMich.VelocityTest
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players").LocalPlayer;
local l_Parent_0 = script.Parent;
local l_Humanoid_0 = l_Parent_0:WaitForChild("Humanoid");
local v4 = nil;
local v5 = false;
l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 12 ]]
    -- upvalues: l_Humanoid_0 (copy), l_Parent_0 (copy), v5 (ref), v4 (ref)
    local l_RootPart_0 = l_Humanoid_0.RootPart;
    if not l_RootPart_0 then
        return;
    else
        local v8 = RaycastParams.new();
        v8.FilterType = Enum.RaycastFilterType.Exclude;
        v8.FilterDescendantsInstances = {
            l_Parent_0
        };
        local v9 = workspace:Blockcast(l_RootPart_0.CFrame, l_RootPart_0.Size, l_RootPart_0.CFrame.UpVector * -4, v8);
        if v9 then
            v5 = true;
            v4 = v9.Instance;
        else
            v5 = false;
        end;
        if not v5 and v4 then
            if v4.AssemblyLinearVelocity.Magnitude < 1 then
                return;
            else
                l_RootPart_0.AssemblyLinearVelocity = Vector3.new(v4.AssemblyLinearVelocity.X, l_RootPart_0.AssemblyLinearVelocity.Y, v4.AssemblyLinearVelocity.Z);
                l_RootPart_0.AssemblyAngularVelocity = v4.AssemblyAngularVelocity;
            end;
        end;
        return;
    end;
end);