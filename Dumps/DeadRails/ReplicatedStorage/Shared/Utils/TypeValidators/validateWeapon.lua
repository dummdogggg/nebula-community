--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateWeapon
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Shared_0 = game:GetService("ReplicatedStorage").Shared;
local v1 = require(l_Shared_0.DataBanks.WeaponConstants);
local v2 = require("./validateInstance");
return function(v3) --[[ Line: 11 ]] --[[ Name: validateGun ]]
    -- upvalues: v2 (copy), v1 (copy)
    if not v2(v3, "Tool") then
        return false, "wrong instance";
    elseif not v3:HasTag(v1.WEAPON_TAG) then
        return false, "no Weapon tag";
    else
        local l_v3_FirstChild_0 = v3:FindFirstChild(v1.WEAPON_CONFIURATION_FOLDER);
        if not l_v3_FirstChild_0 then
            return false, "No WeaponConfiguration";
        elseif not l_v3_FirstChild_0:FindFirstChild(v1.CONFIGURATION_VALUES.WEAPON_TYPE) then
            return false, "No WeaponType";
        else
            return true;
        end;
    end;
end;