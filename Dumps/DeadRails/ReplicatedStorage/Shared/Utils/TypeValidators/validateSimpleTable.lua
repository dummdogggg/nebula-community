--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateSimpleTable
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: validateSimpleTable ]]
    if typeof(v0) ~= "table" then
        return false;
    else
        for v3, v4 in v0 do
            if typeof(v3) ~= v1 then
                return false;
            elseif not v2(v4) then
                return false;
            end;
        end;
        return true;
    end;
end;