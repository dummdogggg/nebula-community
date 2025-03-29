--[[
    Script: ReplicatedStorage.Client.Handlers.ViewModelHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Client_0 = l_ReplicatedStorage_0.Client;
local v2 = require(l_Client_0.Controllers.WeaponController);
local v3 = require(l_ReplicatedStorage_0.ViewModelControl.Utility.ViewModelController);
local v4 = require(l_ReplicatedStorage_0.ViewModelControl.Utility.bindToInstanceDestroyed);
local v5 = require(l_Client_0.Effects.drawRayResults);
local v6 = nil;
v2.OnWeaponActivated:Connect(function(v7, _, v9) --[[ Line: 16 ]]
    -- upvalues: v5 (copy), v6 (ref)
    v5(v7, v6.model:GetPivot().Position, v9);
    v6:playShootAnimation();
end);
v2.OnClientReload:Connect(function(v10, v11) --[[ Line: 23 ]]
    -- upvalues: v6 (ref)
    v6:playReloadAnimation(v10 or 2, v11);
end);
v2.OnClientThrow:Connect(function() --[[ Line: 27 ]]
    -- upvalues: v6 (ref)
    v6:playThrowAnimation();
end);
v2.OnServerCancelledReload:Connect(function() --[[ Line: 31 ]]
    -- upvalues: v6 (ref)
    if v6 then
        v6:cancelReloadAnimation();
    end;
end);
v2.OnWeaponEquipped:Connect(function(v12) --[[ Line: 38 ]]
    -- upvalues: v6 (ref), v3 (copy), v4 (copy)
    if not v6 then
        v6 = v3.new(v12);
        v4(v12, function() --[[ Line: 43 ]]
            -- upvalues: v6 (ref)
            if v6 then
                v6:destroy();
            end;
        end);
    end;
    v6:enable();
end);
v2.OnWeaponUnequipped:Connect(function() --[[ Line: 56 ]]
    -- upvalues: v6 (ref)
    if v6 then
        v6:destroy();
    end;
    v6 = nil;
end);