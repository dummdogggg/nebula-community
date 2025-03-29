--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.includes
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function(v0, v1) --[[ Line: 3 ]]
    for _, v3 in v0 do
        if v3 == v1 then
            return true;
        end;
    end;
    return false;
end;