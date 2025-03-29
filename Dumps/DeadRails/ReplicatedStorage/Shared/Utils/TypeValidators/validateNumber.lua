--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateNumber
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function(v0) --[[ Line: 1 ]] --[[ Name: validateNumber ]]
    if typeof(v0) ~= "number" then
        return false;
    elseif v0 ~= v0 then
        return false;
    else
        return true;
    end;
end;