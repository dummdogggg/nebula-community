--[[
    Script: ReplicatedStorage.Packages.Freeze.List.takeLast
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.slice);
return function(v1, v2) --[[ Line: 14 ]] --[[ Name: takeLast ]]
    -- upvalues: v0 (copy)
    return v0(v1, -math.max(1, v2));
end;