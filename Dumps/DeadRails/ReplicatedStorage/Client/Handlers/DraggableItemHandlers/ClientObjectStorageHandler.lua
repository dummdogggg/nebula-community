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
local v12 = require(l_ReplicatedStorage_0.Client.DataBanks.ActionData);
local v13 = require(l_Shared_0.Utils.DraggableObjectUtil);
local l_isValidDraggableObject_0 = v13.isValidDraggableObject;
local l_isDraggableObjectWelded_0 = v13.isDraggableObjectWelded;
local v16 = nil;
local function v19(_, v18) --[[ Line: 31 ]] --[[ Name: storeObjectActionCallback ]]
    -- upvalues: v16 (ref), l_StoreItem_0 (copy), l_DropItem_0 (copy)
    if v18 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        if v16 then
            l_StoreItem_0:FireServer(v16);
        else
            l_DropItem_0:FireServer();
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v21(v20) --[[ Line: 45 ]] --[[ Name: updateStoreBinding ]]
    -- upvalues: v11 (copy), v12 (copy), v19 (copy)
    if v20 ~= v11.isBound(v12.Action.StoreObject) then
        if v20 then
            v11.bindAction(v12.Action.StoreObject, v19, v12.ActionContext[v12.Action.StoreObject], Enum.KeyCode.F, Enum.KeyCode.ButtonY, v12.ActionPriority.Low);
            return;
        else
            v11.unbindAction(v12.Action.StoreObject);
        end;
    end;
end;
l_HoveringObject_0.Changed:Connect(function() --[[ Line: 63 ]]
    -- upvalues: v11 (copy), v12 (copy), v16 (ref)
    if v11.isBound(v12.Action.StoreObject) then
        v11.setButtonText(v12.Action.StoreObject, v16 and "Store" or "Unstore");
    end;
end);
local function v29(v22) --[[ Line: 70 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v21 (copy), v11 (copy), v12 (copy), v16 (ref)
    local function v25() --[[ Line: 71 ]] --[[ Name: updateStoreAction ]]
        -- upvalues: v22 (copy), v21 (ref), v11 (ref), v12 (ref), v16 (ref)
        local v23 = false;
        local l_Tool_0 = v22:FindFirstChildOfClass("Tool");
        if l_Tool_0 and l_Tool_0.Name == "Sack" then
            v23 = true;
        end;
        v21(v23);
        if v23 and v11.isBound(v12.Action.StoreObject) then
            v11.setButtonText(v12.Action.StoreObject, v16 and "Store" or "Unstore");
        end;
    end;
    v25();
    local function v26() --[[ Line: 91 ]] --[[ Name: handleChildChanged ]]
        -- upvalues: v25 (copy)
        v25();
    end;
    local v27 = v22.ChildAdded:Connect(v26);
    local v28 = v22.ChildRemoved:Connect(v26);
    v22.Destroying:Once(function() --[[ Line: 98 ]]
        -- upvalues: v27 (copy), v28 (copy), v21 (ref)
        v27:Disconnect();
        v28:Disconnect();
        v21(false);
    end);
end;
local function v31() --[[ Line: 105 ]] --[[ Name: onRenderStepped ]]
    -- upvalues: v16 (ref), l_HoveringObject_0 (copy), l_isValidDraggableObject_0 (copy), l_isDraggableObjectWelded_0 (copy)
    v16 = nil;
    local l_Value_0 = l_HoveringObject_0.Value;
    if not l_Value_0 then
        return;
    elseif not l_isValidDraggableObject_0(l_Value_0) then
        return;
    elseif l_isDraggableObjectWelded_0(l_Value_0) then
        return;
    else
        v16 = l_Value_0;
        return;
    end;
end;
local function _() --[[ Line: 125 ]] --[[ Name: initialize ]]
    -- upvalues: l_RunService_0 (copy), v31 (copy), l_LocalPlayer_0 (copy), v29 (copy)
    l_RunService_0.RenderStepped:Connect(v31);
    if l_LocalPlayer_0.Character then
        task.spawn(v29, l_LocalPlayer_0.Character);
    end;
    l_LocalPlayer_0.CharacterAdded:Connect(v29);
end;
l_RunService_0.RenderStepped:Connect(v31);
if l_LocalPlayer_0.Character then
    task.spawn(v29, l_LocalPlayer_0.Character);
end;
l_LocalPlayer_0.CharacterAdded:Connect(v29);