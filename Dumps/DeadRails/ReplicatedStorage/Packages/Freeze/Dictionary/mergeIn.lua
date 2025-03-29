--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.mergeIn
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.Parent.utils.mergeIn);
local v1 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v2, v3, ...) --[[ Line: 25 ]] --[[ Name: mergeIn ]]
    -- upvalues: v1 (copy), v0 (copy)
    return v1(v0(v2, v3, ...));
end;