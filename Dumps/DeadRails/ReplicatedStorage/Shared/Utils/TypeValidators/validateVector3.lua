--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateVector3
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function(v0) --[[ Line: 1 ]] --[[ Name: validateVector3 ]]
    if typeof(v0) ~= "Vector3" then
        return false;
    elseif v0 ~= v0 then
        return false;
    else
        return true;
    end;
end;