--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientObjectStorageHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_StoreItem_0 = l_ReplicatedStorage_0.Remotes.StoreItem;
local l_DropItem_0 = l_ReplicatedStorage_0.Remotes.DropItem;
local l_ClientDraggableObjectHandler_0 = script.Parent.ClientDraggableObjectHandler;
local l_HoveringObject_0 = l_ClientDraggableObjectHandler_0.HoveringObject;
local _ = l_ClientDraggableObjectHandler_0.DraggingObject;
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local v11 = require("../../Controllers/ActionController");
local v12 = require(l_Shared_0.Utils.DraggableObjectUtil);
local l_isValidDraggableObject_0 = v12.isValidDraggableObject;
local l_isDraggableObjectWelded_0 = v12.isDraggableObjectWelded;
local v15 = nil;
local v16 = false;
local v17 = {
    description = "Store objects in the sack", 
    showAction = true, 
    buttonText = "Store", 
    buttonSize = UDim2.fromOffset(48, 48), 
    buttonPosition = UDim2.fromScale(0.92, 0.3)
};
local function v20(_, v19) --[[ Line: 44 ]] --[[ Name: storeObjectActionCallback ]]
    -- upvalues: v15 (ref), l_StoreItem_0 (copy), l_DropItem_0 (copy)
    if v19 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        if v15 then
            l_StoreItem_0:FireServer(v15);
        else
            l_DropItem_0:FireServer();
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function _(v21) --[[ Line: 58 ]] --[[ Name: updateStoreBinding ]]
    -- upvalues: v16 (ref), v11 (copy), v20 (copy), v17 (copy)
    if v21 == v16 then
        return;
    else
        if v21 then
            v11.bindAction("StoreObjectAction", v20, v17, Enum.KeyCode.F, Enum.KeyCode.ButtonY, 3);
        else
            v11.unbindAction("StoreObjectAction");
        end;
        v16 = v21;
        return;
    end;
end;
l_HoveringObject_0.Changed:Connect(function() --[[ Line: 80 ]]
    -- upvalues: v16 (ref), v11 (copy), v15 (ref)
    if v16 then
        v11.setButtonText("StoreObjectAction", v15 and "Store" or "Unstore");
    end;
end);
local function v34(v23) --[[ Line: 87 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v16 (ref), v11 (copy), v20 (copy), v17 (copy), v15 (ref)
    local function _() --[[ Line: 88 ]] --[[ Name: updateStoreAction ]]
        -- upvalues: v23 (copy), v16 (ref), v11 (ref), v20 (ref), v17 (ref), v15 (ref)
        local v24 = false;
        local l_Tool_0 = v23:FindFirstChildOfClass("Tool");
        if l_Tool_0 and l_Tool_0.Name == "Sack" then
            v24 = true;
        end;
        local l_v24_0 = v24;
        if l_v24_0 ~= v16 then
            if l_v24_0 then
                v11.bindAction("StoreObjectAction", v20, v17, Enum.KeyCode.F, Enum.KeyCode.ButtonY, 3);
            else
                v11.unbindAction("StoreObjectAction");
            end;
            v16 = l_v24_0;
        end;
        if v24 and v16 then
            v11.setButtonText("StoreObjectAction", v15 and "Store" or "Unstore");
        end;
    end;
    local v28 = false;
    local l_Tool_1 = v23:FindFirstChildOfClass("Tool");
    if l_Tool_1 and l_Tool_1.Name == "Sack" then
        v28 = true;
    end;
    local l_v28_0 = v28;
    if l_v28_0 ~= v16 then
        if l_v28_0 then
            v11.bindAction("StoreObjectAction", v20, v17, Enum.KeyCode.F, Enum.KeyCode.ButtonY, 3);
        else
            v11.unbindAction("StoreObjectAction");
        end;
        v16 = l_v28_0;
    end;
    if v28 and v16 then
        v11.setButtonText("StoreObjectAction", v15 and "Store" or "Unstore");
    end;
    v28 = function() --[[ Line: 110 ]] --[[ Name: handleChildChanged ]]
        -- upvalues: v23 (copy), v16 (ref), v11 (ref), v20 (ref), v17 (ref), v15 (ref)
        local v31 = false;
        local l_Tool_2 = v23:FindFirstChildOfClass("Tool");
        if l_Tool_2 and l_Tool_2.Name == "Sack" then
            v31 = true;
        end;
        local l_v31_0 = v31;
        if l_v31_0 ~= v16 then
            if l_v31_0 then
                v11.bindAction("StoreObjectAction", v20, v17, Enum.KeyCode.F, Enum.KeyCode.ButtonY, 3);
            else
                v11.unbindAction("StoreObjectAction");
            end;
            v16 = l_v31_0;
        end;
        if v31 and v16 then
            v11.setButtonText("StoreObjectAction", v15 and "Store" or "Unstore");
        end;
    end;
    l_Tool_1 = v23.ChildAdded:Connect(v28);
    l_v28_0 = v23.ChildRemoved:Connect(v28);
    v23.Destroying:Once(function() --[[ Line: 117 ]]
        -- upvalues: l_Tool_1 (copy), l_v28_0 (copy), v16 (ref), v11 (ref)
        l_Tool_1:Disconnect();
        l_v28_0:Disconnect();
        if v16 == false then
            return;
        else
            v11.unbindAction("StoreObjectAction");
            v16 = false;
            return;
        end;
    end);
end;
local function v36() --[[ Line: 124 ]] --[[ Name: onRenderStepped ]]
    -- upvalues: v15 (ref), l_HoveringObject_0 (copy), l_isValidDraggableObject_0 (copy), l_isDraggableObjectWelded_0 (copy)
    v15 = nil;
    local l_Value_0 = l_HoveringObject_0.Value;
    if not l_Value_0 then
        return;
    elseif not l_isValidDraggableObject_0(l_Value_0) then
        return;
    elseif l_isDraggableObjectWelded_0(l_Value_0) then
        return;
    else
        v15 = l_Value_0;
        return;
    end;
end;
local function _() --[[ Line: 144 ]] --[[ Name: initialize ]]
    -- upvalues: l_RunService_0 (copy), v36 (copy), l_LocalPlayer_0 (copy), v34 (copy)
    l_RunService_0.RenderStepped:Connect(v36);
    if l_LocalPlayer_0.Character then
        task.spawn(v34, l_LocalPlayer_0.Character);
    end;
    l_LocalPlayer_0.CharacterAdded:Connect(v34);
end;
l_RunService_0.RenderStepped:Connect(v36);
if l_LocalPlayer_0.Character then
    task.spawn(v34, l_LocalPlayer_0.Character);
end;
l_LocalPlayer_0.CharacterAdded:Connect(v34);