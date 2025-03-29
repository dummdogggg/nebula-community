--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.compat.toArray
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.Parent.values);
local v1 = require(script.Parent.Parent.Parent.utils.deprecationWarning);
return function(v2) --[[ Line: 10 ]] --[[ Name: toArray ]]
    -- upvalues: v1 (copy), v0 (copy)
    v1("Dictionary." .. script.Name, "Dictionary.values");
    return v0(v2);
end;