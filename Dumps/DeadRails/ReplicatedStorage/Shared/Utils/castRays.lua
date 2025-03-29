--[[
    Script: ReplicatedStorage.Shared.Utils.castRays
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local _ = game:GetService("CollectionService");
local _ = game:GetService("ReplicatedStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
return function(v4, v5, v6, v7) --[[ Line: 16 ]] --[[ Name: castRays ]]
    -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy)
    local v8 = {};
    if v4 then
        table.insert(v8, v4);
    end;
    local v9 = RaycastParams.new();
    v9.FilterType = Enum.RaycastFilterType.Exclude;
    v9.IgnoreWater = true;
    v9.FilterDescendantsInstances = v8;
    local v10 = {};
    for _, v12 in v6 do
        local v13 = l_Workspace_0:Spherecast(v5, v7, v12, v9);
        local v14 = {
            position = v5 + v12, 
            normal = v12.Unit
        };
        if v13 then
            v14.position = v13.Position;
            v14.normal = v13.Normal;
            v14.instance = v13.Instance;
            v14.material = v13.Material;
            local l_Humanoid_0 = v13.Instance.Parent:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_0 and not l_Players_0:GetPlayerFromCharacter(l_Humanoid_0.Parent) then
                v14.taggedHumanoid = l_Humanoid_0;
            end;
        end;
        table.insert(v10, v14);
    end;
    return v10;
end;