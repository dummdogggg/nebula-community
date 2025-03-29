--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateInstance
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function(v0, v1) --[[ Line: 18 ]] --[[ Name: validateInstance ]]
    if typeof(v0) ~= "Instance" then
        return false;
    else
        return v0:IsA(v1);
    end;
end;