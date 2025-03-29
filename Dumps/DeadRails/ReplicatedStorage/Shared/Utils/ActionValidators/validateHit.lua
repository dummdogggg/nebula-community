--[[
    Script: ReplicatedStorage.Shared.Utils.ActionValidators.validateHit
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local _ = require(l_Shared_0.Utils.castRays);
return function(v4, v5, v6, v7, v8) --[[ Line: 11 ]] --[[ Name: validateHit ]]
    -- upvalues: l_Players_0 (copy)
    local l_v4_FirstAncestorOfClass_0 = v4:FindFirstAncestorOfClass("Model");
    if not l_v4_FirstAncestorOfClass_0 then
        return false;
    elseif v8 and l_Players_0:GetPlayerFromCharacter(l_v4_FirstAncestorOfClass_0) then
        return false;
    else
        local v10 = l_v4_FirstAncestorOfClass_0:GetPivot().Position - v5;
        local l_Magnitude_0 = v10.Magnitude;
        if (v5 - v7.position).Magnitude < l_Magnitude_0 - 10 then
            return false, "Server hit static geometry";
        else
            local _ = math.atan(10 / l_Magnitude_0);
            local _ = v10:Angle(v6);
            return true;
        end;
    end;
end;