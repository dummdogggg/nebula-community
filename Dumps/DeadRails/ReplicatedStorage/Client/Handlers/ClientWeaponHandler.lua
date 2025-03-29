--[[
    Script: ReplicatedStorage.Client.Handlers.ClientWeaponHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local v4 = require("../Controllers/ActionController");
local _ = require("../../Shared/DataBanks/WeaponTypes");
local _ = require(l_Shared_0.Utils.bindToInstanceDestroyed);
local l_Client_0 = l_ReplicatedStorage_0.Client;
local v8 = require(l_Client_0.Controllers.WeaponController);
local v9 = {
    showAction = true, 
    buttonText = "Shoot", 
    buttonSize = UDim2.fromOffset(55, 55), 
    buttonPosition = UDim2.fromScale(0.9, 0.5)
};
local v10 = {
    showAction = true, 
    buttonText = "Throw", 
    buttonSize = UDim2.fromOffset(55, 55), 
    buttonPosition = UDim2.fromScale(0.9, 0.5)
};
local v11 = {
    showAction = true, 
    buttonText = "Reload", 
    buttonSize = UDim2.fromOffset(55, 55), 
    buttonPosition = UDim2.fromScale(0.75, 0.55)
};
local v12 = nil;
local v13 = false;
local v14 = false;
local v15 = tick();
local function v21() --[[ Line: 54 ]] --[[ Name: onHeartbeat ]]
    -- upvalues: v12 (ref), v15 (ref), v14 (ref), v8 (copy)
    if not v12 then
        return;
    elseif v12.WeaponConfiguration.WeaponType.Value ~= "Gun" then
        return;
    elseif not v12:FindFirstChild("ClientWeaponState") then
        return;
    elseif not v12.ClientWeaponState:FindFirstChild("CurrentAmmo") then
        return;
    else
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        local l_Value_0 = v12.WeaponConfiguration.FireDelay.Value;
        local l_Value_1 = v12.ClientWeaponState.LastFireTime.Value;
        local l_Value_2 = v12.ClientWeaponState.IsReloading.Value;
        local _ = v12.ClientWeaponState.CurrentAmmo.Value;
        if l_Value_2 then
            return;
        elseif tick() < v15 then
            return;
        else
            if v14 then
                if l_workspace_ServerTimeNow_0 - l_Value_1 < l_Value_0 then
                    return;
                else
                    v8.FireBullet(v12);
                end;
            end;
            return;
        end;
    end;
end;
local function v24(_, v23) --[[ Line: 105 ]] --[[ Name: shootWeaponCallback ]]
    -- upvalues: v14 (ref)
    if v23 == Enum.UserInputState.Begin then
        v14 = true;
        return Enum.ContextActionResult.Sink;
    elseif v23 == Enum.UserInputState.End or v23 == Enum.UserInputState.Cancel then
        v14 = false;
        return Enum.ContextActionResult.Sink;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
local function v27(_, v26) --[[ Line: 117 ]] --[[ Name: reloadWeaponCallback ]]
    -- upvalues: v12 (ref), v8 (copy)
    if not v12 then
        return;
    elseif v26 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        v8.ReloadGun(v12);
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v30(_, v29) --[[ Line: 131 ]] --[[ Name: throwWeaponCallback ]]
    -- upvalues: v12 (ref), v8 (copy)
    if not v12 then
        return;
    elseif v29 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        v8.ThrowWeapon(v12);
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v31() --[[ Line: 145 ]] --[[ Name: onWeaponEquipped ]]
    -- upvalues: v13 (ref), v12 (ref), v4 (copy), v24 (copy), v9 (copy), v27 (copy), v11 (copy), v30 (copy), v10 (copy), v8 (copy)
    if not v13 then
        if v12.WeaponConfiguration.WeaponType.Value == "Gun" then
            v4.bindAction("Shoot", v24, v9, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, 1);
            v4.bindAction("Reload", v27, v11, Enum.KeyCode.R, Enum.KeyCode.ButtonX, 1);
        elseif v12.WeaponConfiguration.WeaponType.Value == "Throwable" then
            v4.bindAction("Throw", v30, v10, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, 1);
        end;
        v13 = true;
    end;
    v8.OnWeaponEquipped:Fire(v12);
end;
local function v32() --[[ Line: 185 ]] --[[ Name: onWeaponUnequipped ]]
    -- upvalues: v13 (ref), v4 (copy), v12 (ref), v15 (ref), v8 (copy)
    if v13 then
        v4.unbindAction("Shoot");
        v4.unbindAction("Reload");
        v4.unbindAction("Throw");
        v13 = false;
    end;
    if not v12 then
        return;
    else
        v12 = nil;
        v15 = tick() + 0.5;
        v8.OnWeaponUnequipped:Fire();
        return;
    end;
end;
local function v40(v33) --[[ Line: 204 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v12 (ref), v31 (copy), v32 (copy)
    local function v35(v34) --[[ Line: 205 ]] --[[ Name: onChildAdded ]]
        -- upvalues: v12 (ref), v31 (ref)
        if not v12 and v34:IsA("Tool") and v34:HasTag("Weapon") then
            v12 = v34;
            v31();
        end;
    end;
    local function v37(v36) --[[ Line: 216 ]] --[[ Name: onChildRemoved ]]
        -- upvalues: v12 (ref), v32 (ref)
        if v36 == v12 then
            v32();
        end;
    end;
    local _ = v33.ChildAdded:Connect(v35);
    local _ = v33.ChildRemoved:Connect(v37);
end;
if l_LocalPlayer_0.Character then
    task.spawn(v40, l_LocalPlayer_0.Character);
end;
l_LocalPlayer_0.CharacterAdded:Connect(v40);
l_RunService_0.Heartbeat:Connect(v21);