--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateLivingCharacter
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require("./validateInstance");
return function(v1) --[[ Line: 10 ]] --[[ Name: validateLivingCharacter ]]
    -- upvalues: v0 (copy)
    if not v1 then
        return false;
    elseif not v1:IsDescendantOf(workspace) then
        return false;
    elseif not v0(v1, "Model") then
        return false;
    elseif not v1.PrimaryPart then
        return false;
    else
        local l_Humanoid_0 = v1:FindFirstChild("Humanoid");
        if not l_Humanoid_0 or not l_Humanoid_0:IsA("Humanoid") or l_Humanoid_0.Health <= 0 then
            return false;
        else
            return true;
        end;
    end;
end;