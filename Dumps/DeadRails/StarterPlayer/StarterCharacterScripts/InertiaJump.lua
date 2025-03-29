--[[
    Script: StarterPlayer.StarterCharacterScripts.InertiaJump
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local _ = require(l_Packages_0.Gizmo);
local _ = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local l_Humanoid_0 = l_Parent_0:WaitForChild("Humanoid");
local v8 = nil;
local v9 = nil;
local v10 = RaycastParams.new();
v10.FilterType = Enum.RaycastFilterType.Exclude;
v10.FilterDescendantsInstances = {
    l_Parent_0
};
l_RunService_0.PreSimulation:Connect(function() --[[ Line: 22 ]]
    -- upvalues: l_Parent_0 (copy), v10 (copy), l_Humanoid_0 (copy), v9 (ref), v8 (ref)
    local l_HumanoidRootPart_0 = l_Parent_0:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_0 then
        return;
    else
        local v12 = workspace:Raycast(l_HumanoidRootPart_0.Position, Vector3.new(0, -50, 0, 0), v10);
        if not v12 then
            return;
        else
            local l_Instance_0 = v12.Instance;
            if l_Instance_0 and l_Instance_0:IsA("BasePart") then
                local l_l_Humanoid_0_State_0 = l_Humanoid_0:GetState();
                local v15 = true;
                if l_l_Humanoid_0_State_0 ~= Enum.HumanoidStateType.Jumping then
                    v15 = l_l_Humanoid_0_State_0 == Enum.HumanoidStateType.Freefall;
                end;
                local v16 = v9 == l_Instance_0;
                if v15 then
                    if v16 then
                        l_HumanoidRootPart_0.CFrame = l_Instance_0.CFrame * v8:inverse() * l_HumanoidRootPart_0.CFrame;
                        v8 = l_Instance_0.CFrame;
                        return;
                    else
                        v9 = l_Instance_0;
                        v8 = l_Instance_0.CFrame;
                        return;
                    end;
                else
                    v9 = nil;
                    v8 = nil;
                    return;
                end;
            else
                v9 = nil;
                v8 = nil;
                return;
            end;
        end;
    end;
end);