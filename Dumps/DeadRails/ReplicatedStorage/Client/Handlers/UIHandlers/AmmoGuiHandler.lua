--[[
    Script: ReplicatedStorage.Client.Handlers.UIHandlers.AmmoGuiHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v1 = require(game.ReplicatedStorage.Client.Controllers.WeaponController);
local v2 = nil;
local v3 = nil;
local v4 = nil;
v1.OnWeaponEquipped:Connect(function(v5) --[[ Line: 10 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (ref), v2 (ref), v4 (ref)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    elseif v5.WeaponConfiguration.WeaponType.Value ~= "Gun" then
        return;
    else
        if not v3 then
            v3 = l_Character_0.AttributeChanged:Connect(function(v7) --[[ Line: 21 ]]
                -- upvalues: v2 (ref), v5 (copy), l_LocalPlayer_0 (ref), l_Character_0 (copy)
                if v2 .. "Ammo" == v7 then
                    v2 = v5.WeaponConfiguration.BulletType.Value;
                    l_LocalPlayer_0.PlayerGui.GunGui.Ammo.Text = v5.ClientWeaponState.CurrentAmmo.Value .. "/" .. l_Character_0:GetAttribute(v2 .. "Ammo");
                end;
            end);
        end;
        if not v4 then
            v4 = v5.ClientWeaponState.CurrentAmmo.Changed:Connect(function() --[[ Line: 30 ]]
                -- upvalues: v2 (ref), v5 (copy), l_LocalPlayer_0 (ref), l_Character_0 (copy)
                v2 = v5.WeaponConfiguration.BulletType.Value;
                l_LocalPlayer_0.PlayerGui.GunGui.Ammo.Text = v5.ClientWeaponState.CurrentAmmo.Value .. "/" .. l_Character_0:GetAttribute(v2 .. "Ammo");
            end);
        end;
        v2 = v5.WeaponConfiguration.BulletType.Value;
        l_LocalPlayer_0.PlayerGui.GunGui.Ammo.Text = v5.ClientWeaponState.CurrentAmmo.Value .. "/" .. l_Character_0:GetAttribute(v2 .. "Ammo");
        l_LocalPlayer_0.PlayerGui.GunGui.Ammo.Visible = true;
        return;
    end;
end);
v1.OnWeaponUnequipped:Connect(function(_) --[[ Line: 45 ]]
    -- upvalues: v4 (ref), v3 (ref), l_LocalPlayer_0 (copy)
    if v4 then
        v4:Disconnect();
    end;
    if v3 then
        v3:Disconnect();
    end;
    v4 = nil;
    v3 = nil;
    l_LocalPlayer_0.PlayerGui.GunGui.Ammo.Visible = false;
end);