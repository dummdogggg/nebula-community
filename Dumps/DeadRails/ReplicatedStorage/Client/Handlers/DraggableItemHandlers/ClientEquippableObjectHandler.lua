--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientEquippableObjectHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_ClientDraggableObjectHandler_0 = script.Parent.ClientDraggableObjectHandler;
local l_HoveringObject_0 = l_ClientDraggableObjectHandler_0.HoveringObject;
local _ = l_ClientDraggableObjectHandler_0.DraggingObject;
local v5 = require("../../../Shared/Utils/DraggableObjectUtil");
local l_isValidDraggableObject_0 = v5.isValidDraggableObject;
local l_isDraggableObjectWelded_0 = v5.isDraggableObjectWelded;
local v8 = require("../../Controllers/ActionController");
local l_EquipObject_0 = l_ReplicatedStorage_0.Remotes.Object.EquipObject;
local v10 = {
    description = "Equip an object", 
    showAction = true, 
    buttonText = "Equip", 
    buttonSize = UDim2.fromOffset(48, 48), 
    buttonPosition = UDim2.fromScale(0.92, 0.3)
};
local v11 = nil;
local v12 = false;
local function v15(_, v14) --[[ Line: 37 ]] --[[ Name: equipObjectActionCallback ]]
    -- upvalues: v11 (ref), l_EquipObject_0 (copy)
    if v14 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        if v11 then
            game.SoundService.ArmorEquip:Play();
            l_EquipObject_0:FireServer(v11);
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function _(v16) --[[ Line: 50 ]] --[[ Name: updateEquipBind ]]
    -- upvalues: v12 (ref), v8 (copy), v15 (copy), v10 (copy)
    if v16 and not v12 then
        v8.bindAction("EquipObjectAction", v15, v10, Enum.KeyCode.E, Enum.KeyCode.DPadLeft, 3);
        v12 = true;
        return;
    else
        if not v16 and v12 then
            v8.unbindAction("EquipObjectAction");
            v12 = false;
        end;
        return;
    end;
end;
local function v20() --[[ Line: 67 ]] --[[ Name: update ]]
    -- upvalues: l_LocalPlayer_0 (copy), v12 (ref), v8 (copy), l_HoveringObject_0 (copy), l_isValidDraggableObject_0 (copy), l_isDraggableObjectWelded_0 (copy), v11 (ref), v15 (copy), v10 (copy)
    if not l_LocalPlayer_0.Character then
        if v12 then
            v8.unbindAction("EquipObjectAction");
            v12 = false;
        end;
        return;
    else
        local l_Value_0 = l_HoveringObject_0.Value;
        if l_Value_0 and l_isValidDraggableObject_0(l_Value_0) and not l_isDraggableObjectWelded_0(l_Value_0) and l_Value_0:HasTag("Equippable") and (not l_Value_0:GetAttribute("OwnerId") or l_Value_0:GetAttribute("OwnerId") == l_LocalPlayer_0.UserId) then
            v11 = l_Value_0;
        else
            v11 = nil;
        end;
        local v19 = v11 ~= nil;
        if v19 and not v12 then
            v8.bindAction("EquipObjectAction", v15, v10, Enum.KeyCode.E, Enum.KeyCode.DPadLeft, 3);
            v12 = true;
            return;
        else
            if not v19 and v12 then
                v8.unbindAction("EquipObjectAction");
                v12 = false;
            end;
            return;
        end;
    end;
end;
local function v25(v21) --[[ Line: 91 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v20 (copy), v12 (ref), v8 (copy)
    local function v22() --[[ Line: 92 ]] --[[ Name: handleChildChanged ]]
        -- upvalues: v20 (ref)
        v20();
    end;
    local v23 = v21.ChildAdded:Connect(v22);
    local v24 = v21.ChildRemoved:Connect(v22);
    v21.Destroying:Once(function() --[[ Line: 99 ]]
        -- upvalues: v23 (copy), v24 (copy), v12 (ref), v8 (ref)
        v23:Disconnect();
        v24:Disconnect();
        if v12 then
            v8.unbindAction("EquipObjectAction");
            v12 = false;
        end;
    end);
    v20();
end;
if l_LocalPlayer_0.Character then
    v25(l_LocalPlayer_0.Character);
end;
l_HoveringObject_0.Changed:Connect(v20);
l_LocalPlayer_0.CharacterAdded:Connect(v25);