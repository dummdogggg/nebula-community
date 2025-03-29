--[[
    Script: Workspace.meanspyrobot.InertiaJumpOLD
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_RunService_0 = game:GetService("RunService");
local _ = game.Players.LocalPlayer;
local l_Parent_0 = script.Parent;
local l_Humanoid_0 = l_Parent_0:WaitForChild("Humanoid");
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = RaycastParams.new();
v7.FilterType = Enum.RaycastFilterType.Exclude;
v7.FilterDescendantsInstances = {
    l_Parent_0
};
local function v11() --[[ Line: 16 ]] --[[ Name: stayAttached ]]
    -- upvalues: l_Parent_0 (copy), v7 (copy), v6 (ref), v5 (ref)
    local l_HumanoidRootPart_0 = l_Parent_0:WaitForChild("HumanoidRootPart");
    local v9 = workspace:Spherecast(l_HumanoidRootPart_0.Position, 2, Vector3.new(0, -50, 0, 0), v7);
    if not v9 then
        return;
    else
        local l_Instance_0 = v9.Instance;
        if l_Instance_0 and l_Instance_0:IsA("BasePart") then
            if v6 == l_Instance_0 then
                l_HumanoidRootPart_0.CFrame = l_Instance_0.CFrame * v5:inverse() * l_HumanoidRootPart_0.CFrame;
                v5 = l_Instance_0.CFrame;
                return;
            else
                v6 = l_Instance_0;
                v5 = l_Instance_0.CFrame;
                return;
            end;
        else
            v6 = nil;
            v5 = nil;
            return;
        end;
    end;
end;
local function _() --[[ Line: 48 ]] --[[ Name: startInertia ]]
    -- upvalues: v5 (ref), v6 (ref), v11 (copy), v4 (ref), l_RunService_0 (copy)
    v5 = nil;
    v6 = nil;
    v11();
    v4 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 54 ]]
        -- upvalues: v11 (ref)
        v11();
    end);
end;
l_Humanoid_0.Jumping:Connect(function(v13) --[[ Line: 63 ]]
    -- upvalues: v4 (ref), v5 (ref), v6 (ref), v11 (copy), l_RunService_0 (copy)
    if v13 and not v4 then
        v5 = nil;
        v6 = nil;
        v11();
        v4 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 54 ]]
            -- upvalues: v11 (ref)
            v11();
        end);
    end;
end);
l_Humanoid_0.StateChanged:Connect(function(_, v15) --[[ Line: 74 ]]
    -- upvalues: v4 (ref), v5 (ref), v6 (ref), v11 (copy), l_RunService_0 (copy)
    if (v15 == Enum.HumanoidStateType.Climbing or v15 == Enum.HumanoidStateType.Freefall) and not v4 then
        v5 = nil;
        v6 = nil;
        v11();
        v4 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 54 ]]
            -- upvalues: v11 (ref)
            v11();
        end);
    end;
    if (v15 == Enum.HumanoidStateType.Landed or v15 == Enum.HumanoidStateType.Running) and v4 then
        v4:Disconnect();
        v4 = nil;
    end;
end);