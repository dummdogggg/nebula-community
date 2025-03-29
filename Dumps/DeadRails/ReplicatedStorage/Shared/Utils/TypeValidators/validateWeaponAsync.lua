--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateWeaponAsync
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Shared_0 = game:GetService("ReplicatedStorage").Shared;
local v1 = require(l_Shared_0.DataBanks.WeaponConstants);
local v2 = require("./validateInstance");
return function(v3) --[[ Line: 11 ]] --[[ Name: validateWeaponAsync ]]
    -- upvalues: v2 (copy), v1 (copy)
    if not v2(v3, "Tool") then
        return false, "Wrong instance";
    elseif not v3:HasTag(v1.WEAPON_TAG) then
        return false, (("Missing tag %*"):format(v1.WEAPON_TAG));
    else
        local v4 = v3:WaitForChild(v1.WEAPON_CONFIURATION_FOLDER, 10);
        if not v4 then
            return false, "Missing WeaponConfiguration";
        elseif not v4:WaitForChild(v1.CONFIGURATION_VALUES.WEAPON_TYPE, 10) then
            return false, "Missing WeaponType";
        else
            return true;
        end;
    end;
end;