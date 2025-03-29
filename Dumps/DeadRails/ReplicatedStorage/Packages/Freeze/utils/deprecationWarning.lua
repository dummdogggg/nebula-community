--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.deprecationWarning
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function(v0, v1) --[[ Line: 2 ]]
    warn((("[Freeze] %* will be removed in version 1.0, please use %* instead."):format(v0, v1)));
end;