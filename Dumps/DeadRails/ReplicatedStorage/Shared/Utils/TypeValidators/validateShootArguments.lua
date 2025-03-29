--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateShootArguments
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require("../TypeValidators/validateNumber");
local v1 = require("../TypeValidators/validateCFrame");
local v2 = require("../TypeValidators/validateInstance");
local v3 = require("../TypeValidators/validateGun");
local v4 = require("../TypeValidators/validateSimpleTable");
local function v6(v5) --[[ Line: 7 ]] --[[ Name: hitValidator ]]
    -- upvalues: v2 (copy)
    return v2(v5, "Humanoid");
end;
return function(v7, v8, v9, v10) --[[ Line: 11 ]] --[[ Name: validateShootArguments ]]
    -- upvalues: v0 (copy), v3 (copy), v1 (copy), v4 (copy), v6 (copy)
    if not v0(v7) then
        return false;
    elseif not v3(v8) then
        return false;
    elseif not v1(v9) then
        return false;
    elseif not v4(v10, "string", v6) then
        return false;
    else
        return true;
    end;
end;