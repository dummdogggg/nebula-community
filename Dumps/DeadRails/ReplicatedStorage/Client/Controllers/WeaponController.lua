--[[
    Script: ReplicatedStorage.Client.Controllers.WeaponController
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Remotes_0 = l_ReplicatedStorage_0.Remotes;
local l_Shoot_0 = l_Remotes_0.Weapon.Shoot;
local l_Reload_0 = l_Remotes_0.Weapon.Reload;
local l_Throw_0 = l_Remotes_0.Weapon.Throw;
local l_ReplicateShot_0 = l_Remotes_0.Weapon.ReplicateShot;
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local v11 = require(l_Packages_0.Signal);
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local v13 = require(l_Shared_0.DataBanks.WeaponConstants);
local _ = require(l_Shared_0.DataBanks.WeaponTypes);
local _ = require(l_Shared_0.Utils.DraggableObjectUtil);
local l_TypeValidators_0 = l_Shared_0.Utils.TypeValidators;
local _ = require(l_TypeValidators_0.validateWeapon);
local v18 = require(l_TypeValidators_0.validateWeaponAsync);
local v19 = require(l_TypeValidators_0.validateLivingCharacter);
local v20 = require(l_Shared_0.Utils.getRayDirections);
local v21 = require(l_Shared_0.Utils.castRays);
local l_Client_0 = l_ReplicatedStorage_0.Client;
local v23 = require(l_Client_0.Effects.drawRayResults);
local v24 = require(l_Client_0.Effects.playSoundAtPosition);
local l_CONFIGURATION_VALUES_0 = v13.CONFIGURATION_VALUES;
local l_GUN_VALUES_0 = v13.CONFIGURATION_VALUES.GUN_VALUES;
local l_GUN_VALUES_1 = v13.STATE_VALUES.GUN_VALUES;
local v28 = {
    OnWeaponEquipped = v11.new(), 
    OnWeaponUnequipped = v11.new(), 
    OnWeaponActivated = v11.new(), 
    OnClientReload = v11.new(), 
    OnClientThrow = v11.new(), 
    OnServerCancelledReload = v11.new()
};
v28.FireBullet = function(v29) --[[ Line: 56 ]] --[[ Name: FireBullet ]]
    -- upvalues: l_CurrentCamera_0 (copy), v28 (copy), v13 (copy), v20 (copy), v21 (copy), l_LocalPlayer_0 (copy), l_Shoot_0 (copy)
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Value_0 = v29.WeaponConfiguration.FireDelay.Value;
    local l_Value_1 = v29.ClientWeaponState.CurrentAmmo.Value;
    local l_Value_2 = v29.ClientWeaponState.LastFireTime.Value;
    local l_Value_3 = v29.ClientWeaponState.IsReloading.Value;
    if l_Value_1 <= 0 then
        v28.ReloadGun(v29);
        return;
    elseif l_workspace_ServerTimeNow_0 - l_Value_2 < l_Value_0 then
        return;
    elseif l_Value_3 then
        return;
    else
        v29.ClientWeaponState.LastFireTime.Value = l_workspace_ServerTimeNow_0;
        local l_CurrentAmmo_0 = v29.ClientWeaponState.CurrentAmmo;
        l_CurrentAmmo_0.Value = l_CurrentAmmo_0.Value - 1;
        l_CurrentAmmo_0 = v29.WeaponConfiguration.BulletType.Value;
        local l_Value_4 = v29.WeaponConfiguration.SpreadAngle.Value;
        local v38 = 1;
        if l_CurrentAmmo_0 == v13.BULLET_TYPE.SHOT then
            v38 = v29.WeaponConfiguration.PelletsPerBullet.Value;
        end;
        local v39 = v20(l_CFrame_0, v38, math.rad(l_Value_4), l_workspace_ServerTimeNow_0);
        for v40, v41 in v39 do
            v39[v40] = v41 * v13.BULLET_RANGE;
        end;
        local v42 = v21(l_LocalPlayer_0.Character, l_CFrame_0.Position, v39, v13.RAY_RADIUS);
        local v43 = {};
        local v44 = false;
        for v45, v46 in v42 do
            if v46.taggedHumanoid then
                v43[tostring(v45)] = v46.taggedHumanoid;
                v44 = true;
            end;
        end;
        l_Shoot_0:FireServer(l_workspace_ServerTimeNow_0, v29, l_CFrame_0, v43);
        v28.OnWeaponActivated:Fire(l_workspace_ServerTimeNow_0, v29, v42);
        return;
    end;
end;
v28.ReloadGun = function(v47) --[[ Line: 117 ]] --[[ Name: ReloadGun ]]
    -- upvalues: v19 (copy), l_LocalPlayer_0 (copy), l_Reload_0 (copy), v28 (copy)
    if not v19(l_LocalPlayer_0.Character) then
        return;
    else
        local l_Character_0 = l_LocalPlayer_0.Character;
        local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
        local l_Value_5 = v47.WeaponConfiguration.BulletType.Value;
        local l_Value_6 = v47.WeaponConfiguration.MagazineSize.Value;
        local l_Value_7 = v47.WeaponConfiguration.ReloadDuration.Value;
        local l_Value_8 = v47.ClientWeaponState.IsReloading.Value;
        local l_Value_9 = v47.ClientWeaponState.CurrentAmmo.Value;
        local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute(l_Value_5 .. "Ammo");
        local v56 = math.min(l_Value_6 - l_Value_9, l_l_Character_0_Attribute_0);
        local v57 = l_Value_9 + v56;
        local v58 = l_Value_7 / l_Value_6 * v56;
        if l_Value_8 then
            return;
        elseif v56 <= 0 then
            return;
        else
            if v47.WeaponConfiguration:FindFirstChild("MagazineFed") and v47.WeaponConfiguration.MagazineFed.Value == true then
                v56 = 1;
                v58 = l_Value_7;
            end;
            task.delay(v58, function() --[[ Line: 152 ]]
                -- upvalues: l_Character_0 (copy), l_Value_5 (copy), l_l_Character_0_Attribute_0 (copy), v56 (ref), v47 (copy), v57 (copy)
                l_Character_0:SetAttribute(l_Value_5 .. "Ammo", l_l_Character_0_Attribute_0 - v56);
                v47.ClientWeaponState.CurrentAmmo.Value = v57;
                v47.ClientWeaponState.IsReloading.Value = false;
            end);
            v47.ClientWeaponState.IsReloading.Value = true;
            l_Reload_0:FireServer(l_workspace_ServerTimeNow_1, v47);
            v28.OnClientReload:Fire(v56, v58);
            return;
        end;
    end;
end;
v28.ThrowWeapon = function(v59) --[[ Line: 168 ]] --[[ Name: ThrowWeapon ]]
    -- upvalues: v28 (copy), l_CurrentCamera_0 (copy), l_Throw_0 (copy)
    if v59.WeaponConfiguration.WeaponType.Value ~= "Throwable" then
        return;
    elseif v59.WeaponConfiguration.Thrown.Value == true then
        return;
    else
        local l_Value_10 = v59.WeaponConfiguration.ThrowTime.Value;
        v28.OnClientThrow:Fire();
        v59.WeaponConfiguration.Thrown.Value = true;
        task.delay(l_Value_10, function() --[[ Line: 184 ]]
            -- upvalues: l_CurrentCamera_0 (ref), l_Throw_0 (ref), v59 (copy)
            local l_CFrame_1 = l_CurrentCamera_0.CFrame;
            l_Throw_0:FireServer(v59, l_CFrame_1);
        end);
        return;
    end;
end;
v28._onServerReplicateShot = function(v62, v63, v64, v65) --[[ Line: 191 ]] --[[ Name: _onServerReplicateShot ]]
    -- upvalues: v24 (copy), v23 (copy)
    if v63 and v63:IsDescendantOf(game) then
        v64 = v63:GetPivot().Position;
        v24(v63.WeaponConfiguration.Sounds.Shoot, v64);
    end;
    v23(v62, v64, v65);
end;
v28._initializeWeapon = function(v66) --[[ Line: 202 ]] --[[ Name: _initializeWeapon ]]
    -- upvalues: v18 (copy), l_Players_0 (copy), v13 (copy), l_CONFIGURATION_VALUES_0 (copy), l_GUN_VALUES_0 (copy), l_GUN_VALUES_1 (copy), v28 (copy)
    local v67, v68 = v18(v66);
    if not v67 then
        warn("Invalid weapon:", v68);
        return;
    elseif not v66.Parent or not v66.Parent:IsDescendantOf(workspace) and not v66.Parent:IsDescendantOf(l_Players_0) then
        if not v66.Parent then
            warn("no parent");
            return;
        elseif not v66.Parent:IsDescendantOf(workspace) then
            warn("parent not in workspace", v66:IsDescendantOf(workspace));
            return;
        else
            if not v66.Parent:IsDescendantOf(l_Players_0) then
                warn("parent not in players either", v66:IsDescendantOf(l_Players_0));
            end;
            return;
        end;
    else
        local l_ServerWeaponState_0 = v66:WaitForChild("ServerWeaponState");
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "Client" .. v13.WEAPON_STATE_FOLDER;
        l_Folder_0.Parent = v66;
        local l_v66_FirstChild_0 = v66:FindFirstChild(v13.WEAPON_CONFIURATION_FOLDER);
        if l_v66_FirstChild_0:FindFirstChild(l_CONFIGURATION_VALUES_0.WEAPON_TYPE).Value == v13.WEAPON_TYPE.GUN then
            local _ = l_v66_FirstChild_0:FindFirstChild(l_GUN_VALUES_0.MAGAZINE_SIZE);
            local v73 = l_ServerWeaponState_0:WaitForChild(l_GUN_VALUES_1.CURRENT_AMMO);
            local v74 = l_ServerWeaponState_0:WaitForChild(l_GUN_VALUES_1.LAST_FIRE_TIME);
            local v75 = l_ServerWeaponState_0:WaitForChild(l_GUN_VALUES_1.IS_RELOADING);
            local l_NumberValue_0 = Instance.new("NumberValue");
            l_NumberValue_0.Name = l_GUN_VALUES_1.CURRENT_AMMO;
            l_NumberValue_0.Value = v73.Value;
            l_NumberValue_0.Parent = l_Folder_0;
            local l_NumberValue_1 = Instance.new("NumberValue");
            l_NumberValue_1.Name = l_GUN_VALUES_1.LAST_FIRE_TIME;
            l_NumberValue_1.Value = v74.Value;
            l_NumberValue_1.Parent = l_Folder_0;
            local l_BoolValue_0 = Instance.new("BoolValue");
            l_BoolValue_0.Name = l_GUN_VALUES_1.IS_RELOADING;
            l_BoolValue_0.Value = v75.Value;
            l_BoolValue_0.Parent = l_Folder_0;
            local v79 = nil;
            local function v80() --[[ Line: 262 ]] --[[ Name: onNewServerState ]]
                -- upvalues: v79 (ref), l_BoolValue_0 (copy), v75 (copy), v28 (ref), l_NumberValue_0 (copy), v73 (copy), l_NumberValue_1 (copy), v74 (copy)
                if v79 then
                    task.cancel(v79);
                end;
                v79 = task.delay(1, function() --[[ Line: 267 ]]
                    -- upvalues: l_BoolValue_0 (ref), v75 (ref), v28 (ref), l_NumberValue_0 (ref), v73 (ref), l_NumberValue_1 (ref), v74 (ref)
                    if l_BoolValue_0.Value and not v75.Value then
                        v28.OnServerCancelledReload:Fire();
                    end;
                    l_NumberValue_0.Value = v73.Value;
                    l_NumberValue_1.Value = v74.Value;
                    l_BoolValue_0.Value = v75.Value;
                end);
            end;
            l_NumberValue_0.Changed:Connect(v80);
            l_NumberValue_1.Changed:Connect(v80);
            l_BoolValue_0.Changed:Connect(v80);
            v73.Changed:Connect(v80);
            v74.Changed:Connect(v80);
            v75.Changed:Connect(v80);
            return;
        else
            warn("Melee not handled yet:", v66:GetFullName());
            return;
        end;
    end;
end;
v28._listenForWeapons = function() --[[ Line: 291 ]] --[[ Name: _listenForWeapons ]]
    -- upvalues: l_CollectionService_0 (copy), v13 (copy), v28 (copy)
    l_CollectionService_0:GetInstanceAddedSignal(v13.WEAPON_TAG):Connect(v28._initializeWeapon);
end;
v28.start = function() --[[ Line: 295 ]] --[[ Name: start ]]
    -- upvalues: l_CollectionService_0 (copy), v13 (copy), v28 (copy), l_ReplicateShot_0 (copy)
    for _, v82 in l_CollectionService_0:GetTagged(v13.WEAPON_TAG) do
        v28._initializeWeapon(v82);
    end;
    v28._listenForWeapons();
    l_ReplicateShot_0.OnClientEvent:Connect(v28._onServerReplicateShot);
end;
return v28;