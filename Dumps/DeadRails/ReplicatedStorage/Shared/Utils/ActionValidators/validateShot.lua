--[[
    Script: ReplicatedStorage.Shared.Utils.ActionValidators.validateShot
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local _ = require("../../DataBanks/WeaponTypes");
return function(v1, v2, _) --[[ Line: 9 ]] --[[ Name: validateShot ]]
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    if l_workspace_ServerTimeNow_0 < v1 then
        return false, "Client timestamp in the future";
    elseif v1 < l_workspace_ServerTimeNow_0 - 1 then
        return false, "Client timestamp too far in the past";
    else
        local l_Value_0 = v2.WeaponConfiguration.FireDelay.Value;
        local l_Value_1 = v2.ServerWeaponState.CurrentAmmo.Value;
        local l_Value_2 = v2.ServerWeaponState.LastFireTime.Value;
        if v2.ServerWeaponState.IsReloading.Value then
            return false, "Gun is reloading";
        elseif l_Value_1 <= 0 then
            return false, "Gun has no ammo";
        elseif v1 - l_Value_2 + 0.05 < l_Value_0 then
            return false, (("Gun is on fire cooldown %*"):format(v1 - l_Value_2));
        else
            return true;
        end;
    end;
end;