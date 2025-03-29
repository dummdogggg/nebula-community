--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateCFrame
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.validateVector3);
return function(v1) --[[ Line: 3 ]] --[[ Name: validateCFrame ]]
    -- upvalues: v0 (copy)
    if typeof(v1) ~= "CFrame" then
        return false;
    elseif not v0(v1.Position) then
        return false;
    elseif not v0(v1.LookVector) then
        return false;
    else
        return true;
    end;
end;