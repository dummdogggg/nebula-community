--[[
    Script: ReplicatedStorage.Client.Inventory.ClientBackpackHandler
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_ReplicatedStorage_0.Packages.Satchel);
local v3 = require(l_ReplicatedStorage_0.Shared.Remotes);
local v4 = require(l_ReplicatedStorage_0.Shared.SharedConstants.Tag);
local v5 = require(l_ReplicatedStorage_0.Shared.SharedConstants.Attribute);
local v6 = require(l_ReplicatedStorage_0.Client.LocalPlayerObjectsContainer);
local v7 = require(l_ReplicatedStorage_0.Client.Inventory.ImageData);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Inventory_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Inventory");
local l_AmmoFrame_0 = l_Inventory_0:WaitForChild("AmmoFrame");
local l_ArmorFrame_0 = l_Inventory_0:WaitForChild("ArmorFrame");
local v12 = {};
v12.startAsync = function() --[[ Line: 27 ]] --[[ Name: startAsync ]]
    -- upvalues: v2 (copy), v12 (copy)
    v2:GetStateChangedEvent().Event:Connect(v12._onBackpackToggled);
    v12._listenForLocalCharacter();
    v12._listenForAmmoEventsAsync();
    v12._listenForArmorEventsAsync();
end;
v12._onBackpackToggled = function(v13) --[[ Line: 36 ]] --[[ Name: _onBackpackToggled ]]
    -- upvalues: l_Inventory_0 (copy)
    l_Inventory_0.Enabled = v13;
end;
v12._listenForAmmoEventsAsync = function() --[[ Line: 40 ]] --[[ Name: _listenForAmmoEventsAsync ]]
    -- upvalues: l_AmmoFrame_0 (copy), v3 (copy), v5 (copy)
    local l_LightAmmo_0 = l_AmmoFrame_0:WaitForChild("LightAmmo");
    local l_MediumAmmo_0 = l_AmmoFrame_0:WaitForChild("MediumAmmo");
    local l_ShotgunShell_0 = l_AmmoFrame_0:WaitForChild("ShotgunShell");
    l_LightAmmo_0.Activated:Connect(function() --[[ Line: 45 ]]
        -- upvalues: v3 (ref), v5 (ref)
        v3.Events.DropAmmo:FireServer(v5.LightAmmo);
    end);
    l_MediumAmmo_0.Activated:Connect(function() --[[ Line: 49 ]]
        -- upvalues: v3 (ref), v5 (ref)
        v3.Events.DropAmmo:FireServer(v5.MediumAmmo);
    end);
    l_ShotgunShell_0.Activated:Connect(function() --[[ Line: 53 ]]
        -- upvalues: v3 (ref), v5 (ref)
        v3.Events.DropAmmo:FireServer(v5.ShotAmmo);
    end);
end;
v12._listenForArmorEventsAsync = function() --[[ Line: 58 ]] --[[ Name: _listenForArmorEventsAsync ]]
    -- upvalues: l_ArmorFrame_0 (copy), v3 (copy)
    local l_Head_0 = l_ArmorFrame_0:WaitForChild("Head");
    local l_Torso_0 = l_ArmorFrame_0:WaitForChild("Torso");
    local l_RightArm_0 = l_ArmorFrame_0:WaitForChild("RightArm");
    local l_LeftArm_0 = l_ArmorFrame_0:WaitForChild("LeftArm");
    l_Head_0.Activated:Connect(function() --[[ Line: 64 ]]
        -- upvalues: v3 (ref)
        v3.Events.DropEquipment:FireServer("Head");
    end);
    l_Torso_0.Activated:Connect(function() --[[ Line: 68 ]]
        -- upvalues: v3 (ref)
        v3.Events.DropEquipment:FireServer("Torso");
    end);
    l_RightArm_0.Activated:Connect(function() --[[ Line: 72 ]]
        -- upvalues: v3 (ref)
        v3.Events.DropEquipment:FireServer("Right Arm");
    end);
    l_LeftArm_0.Activated:Connect(function() --[[ Line: 76 ]]
        -- upvalues: v3 (ref)
        v3.Events.DropEquipment:FireServer("Left Arm");
    end);
end;
v12._listenForLocalCharacter = function() --[[ Line: 81 ]] --[[ Name: _listenForLocalCharacter ]]
    -- upvalues: v6 (copy), v12 (copy), l_LocalPlayer_0 (copy)
    local v21 = v6.getCharacterLoadedWrapper();
    if v21:isLoaded() then
        v12._onCharacterAdded(l_LocalPlayer_0.Character);
    end;
    v21.loaded:Connect(v12._onCharacterAdded);
end;
v12._onCharacterAdded = function(v22) --[[ Line: 91 ]] --[[ Name: _onCharacterAdded ]]
    -- upvalues: v4 (copy), v5 (copy), l_ArmorFrame_0 (copy), v7 (copy)
    local function v32() --[[ Line: 92 ]] --[[ Name: updateArmorVisuals ]]
        -- upvalues: v22 (copy), v4 (ref), v5 (ref), l_ArmorFrame_0 (ref), v7 (ref)
        local v23 = {};
        for _, v25 in v22:GetChildren() do
            if v25:HasTag(v4.Equippable) then
                table.insert(v23, {
                    name = v25.Name, 
                    slot = v25:GetAttribute(v5.EquipmentSlot)
                });
            end;
        end;
        for _, v27 in l_ArmorFrame_0:GetChildren() do
            if v27:HasTag("AccessoryImage") then
                local v28 = false;
                for _, v30 in v23 do
                    if v30.slot .. "_Display" == v27.Name then
                        v28 = true;
                        local v31 = v7[v30.name];
                        v27.Image = v31.image;
                        v27.Position = v31.position;
                        v27.Size = v31.size;
                        break;
                    end;
                end;
                v27.Visible = v28;
            end;
        end;
    end;
    v22.ChildAdded:Connect(v32);
    v22.ChildRemoved:Connect(v32);
end;
return v12;