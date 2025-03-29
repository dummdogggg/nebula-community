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
local v9 = require(l_ReplicatedStorage_0.Client.DataBanks.ActionData);
local v10 = false;
local v11 = false;
local v12 = nil;
local v13 = tick();
local function v19() --[[ Line: 28 ]] --[[ Name: onHeartbeat ]]
    -- upvalues: v12 (ref), v13 (ref), v11 (ref), v8 (copy)
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
        elseif tick() < v13 then
            return;
        else
            if v11 then
                if l_workspace_ServerTimeNow_0 - l_Value_1 < l_Value_0 then
                    return;
                else
                    v13 = tick() + 0.5;
                    v8.FireBullet(v12);
                end;
            end;
            return;
        end;
    end;
end;
local function v22(_, v21) --[[ Line: 81 ]] --[[ Name: shootWeaponCallback ]]
    -- upvalues: v11 (ref)
    if v21 == Enum.UserInputState.Begin then
        v11 = true;
        return Enum.ContextActionResult.Sink;
    elseif v21 == Enum.UserInputState.End or v21 == Enum.UserInputState.Cancel then
        v11 = false;
        return Enum.ContextActionResult.Sink;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
local function v25(_, v24) --[[ Line: 93 ]] --[[ Name: reloadWeaponCallback ]]
    -- upvalues: v12 (ref), v8 (copy)
    if not v12 then
        return;
    elseif v24 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        v8.ReloadGun(v12);
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v28(_, v27) --[[ Line: 107 ]] --[[ Name: throwWeaponCallback ]]
    -- upvalues: v12 (ref), v8 (copy)
    if not v12 then
        return;
    elseif v27 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        v8.ThrowWeapon(v12);
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v29() --[[ Line: 121 ]] --[[ Name: onWeaponEquipped ]]
    -- upvalues: v10 (ref), v12 (ref), v4 (copy), v9 (copy), v22 (copy), v25 (copy), v28 (copy), v8 (copy)
    if not v10 then
        if v12.WeaponConfiguration.WeaponType.Value == "Gun" then
            v4.bindAction(v9.Action.Shoot, v22, v9.ActionContext[v9.Action.Shoot], Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, v9.ActionPriority.Highest);
            v4.bindAction(v9.Action.Reload, v25, v9.ActionContext[v9.Action.Reload], Enum.KeyCode.R, Enum.KeyCode.ButtonX, v9.ActionPriority.Highest);
        elseif v12.WeaponConfiguration.WeaponType.Value == "Throwable" then
            v4.bindAction(v9.Action.Throw, v28, v9.ActionContext[v9.Action.Throw], Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, v9.ActionPriority.Highest);
        end;
        v10 = true;
    end;
    v8.OnWeaponEquipped:Fire(v12);
end;
local function v30() --[[ Line: 158 ]] --[[ Name: onWeaponUnequipped ]]
    -- upvalues: v10 (ref), v4 (copy), v9 (copy), v12 (ref), v8 (copy)
    if v10 then
        v4.unbindAction(v9.Action.Shoot);
        v4.unbindAction(v9.Action.Reload);
        v4.unbindAction(v9.Action.Throw);
        v10 = false;
    end;
    if not v12 then
        return;
    else
        v12 = nil;
        v8.OnWeaponUnequipped:Fire();
        return;
    end;
end;
local function v38(v31) --[[ Line: 176 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v12 (ref), v29 (copy), v30 (copy)
    local function v33(v32) --[[ Line: 177 ]] --[[ Name: onChildAdded ]]
        -- upvalues: v12 (ref), v29 (ref)
        if not v12 and v32:IsA("Tool") and v32:HasTag("Weapon") then
            v12 = v32;
            v29();
        end;
    end;
    local function v35(v34) --[[ Line: 188 ]] --[[ Name: onChildRemoved ]]
        -- upvalues: v12 (ref), v30 (ref)
        if v34 == v12 then
            v30();
        end;
    end;
    local _ = v31.ChildAdded:Connect(v33);
    local _ = v31.ChildRemoved:Connect(v35);
end;
if l_LocalPlayer_0.Character then
    task.spawn(v38, l_LocalPlayer_0.Character);
end;
l_LocalPlayer_0.CharacterAdded:Connect(v38);
l_RunService_0.Heartbeat:Connect(v19);