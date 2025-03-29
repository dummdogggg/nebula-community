--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateGun
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Shared_0 = game:GetService("ReplicatedStorage").Shared;
local v1 = require(l_Shared_0.DataBanks.WeaponConstants);
local v2 = require("./validateWeapon");
return function(v3) --[[ Line: 11 ]] --[[ Name: validateGun ]]
    -- upvalues: v2 (copy), v1 (copy)
    if not v2(v3) then
        return false;
    elseif v3:FindFirstChild(v1.WEAPON_CONFIURATION_FOLDER):FindFirstChild(v1.CONFIGURATION_VALUES.WEAPON_TYPE).Value ~= v1.WEAPON_TYPE.GUN then
        return false;
    else
        return true;
    end;
end;