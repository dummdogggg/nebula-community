--[[
    Script: ReplicatedStorage.Client.Components.LocalDeath
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Satchel);
local v3 = require(l_ReplicatedStorage_0.Client.Controllers.MouseController);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_LocalPlayer_0 (copy)
    local v7 = {};
    setmetatable(v7, v5);
    if v6 == l_LocalPlayer_0.Character then
        v7:_onLocalCharacterDied(v6);
    end;
    return v7;
end;
v5._onLocalCharacterDied = function(_, v9) --[[ Line: 33 ]] --[[ Name: _onLocalCharacterDied ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy), v3 (copy)
    l_LocalPlayer_0.CameraMode = Enum.CameraMode.Classic;
    l_LocalPlayer_0.CameraMinZoomDistance = 12;
    l_LocalPlayer_0.CameraMaxZoomDistance = 12;
    local l_Humanoid_0 = v9:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        l_Humanoid_0:UnequipTools();
    end;
    v2:SetBackpackEnabled(false);
    v3.setMouseBehavior(Enum.MouseBehavior.Default, true);
end;
v5.destroy = function(_) --[[ Line: 48 ]] --[[ Name: destroy ]]

end;
return v5;