--[[
    Script: ReplicatedStorage.Packages.Freeze.List.toSet
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function(v0) --[[ Line: 10 ]]
    local v1 = {};
    for _, v3 in v0 do
        v1[v3] = true;
    end;
    return v1;
end;