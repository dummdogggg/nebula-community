--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientToolObjectHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_HoveringObject_0 = script.Parent.ClientDraggableObjectHandler.HoveringObject;
local v3 = require("../../../Shared/Utils/DraggableObjectUtil");
local l_isValidDraggableObject_0 = v3.isValidDraggableObject;
local l_isDraggableObjectWelded_0 = v3.isDraggableObjectWelded;
local v6 = require("../../Controllers/ActionController");
local v7 = require(l_ReplicatedStorage_0.Client.DataBanks.ActionData);
local l_PickUpTool_0 = l_ReplicatedStorage_0.Remotes.Tool.PickUpTool;
local l_DropTool_0 = l_ReplicatedStorage_0.Remotes.Tool.DropTool;
local v10 = nil;
local function v14(v11) --[[ Line: 27 ]] --[[ Name: getCurrentlyHeldTool ]]
    if not v11 then
        return nil;
    else
        for _, v13 in v11:GetChildren() do
            if v13:IsA("Tool") and v13:HasTag("Droppable") then
                return v13;
            end;
        end;
        return nil;
    end;
end;
local function v17(_, v16) --[[ Line: 41 ]] --[[ Name: pickObjectActionCallback ]]
    -- upvalues: v10 (ref), l_PickUpTool_0 (copy)
    if v16 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        if v10 then
            l_PickUpTool_0:FireServer(v10);
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v21(_, v19) --[[ Line: 53 ]] --[[ Name: dropObjectActionCallback ]]
    -- upvalues: v14 (copy), l_LocalPlayer_0 (copy), l_DropTool_0 (copy)
    if v19 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        local v20 = v14(l_LocalPlayer_0.Character);
        if v20 then
            l_DropTool_0:FireServer(v20);
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v24(v22) --[[ Line: 66 ]] --[[ Name: updatePickBound ]]
    -- upvalues: v6 (copy), v7 (copy), v17 (copy)
    local v23 = v6.isBound(v7.Action.PickUpObject);
    if v22 and not v23 then
        v6.bindAction(v7.Action.PickUpObject, v17, v7.ActionContext[v7.Action.PickUpObject], Enum.KeyCode.E, Enum.KeyCode.DPadLeft, v7.ActionPriority.Low);
        return;
    else
        if not v22 and v23 then
            v6.unbindAction(v7.Action.PickUpObject);
        end;
        return;
    end;
end;
local function v27(v25) --[[ Line: 83 ]] --[[ Name: updateDropBound ]]
    -- upvalues: v6 (copy), v7 (copy), v21 (copy)
    local v26 = v6.isBound(v7.Action.DropObject);
    if v25 and not v26 then
        v6.bindAction(v7.Action.DropObject, v21, v7.ActionContext[v7.Action.DropObject], Enum.KeyCode.Backspace, Enum.KeyCode.DPadLeft, v7.ActionPriority.Low);
        return;
    else
        if not v25 and v26 then
            v6.unbindAction(v7.Action.DropObject);
        end;
        return;
    end;
end;
local function v31() --[[ Line: 100 ]] --[[ Name: update ]]
    -- upvalues: l_LocalPlayer_0 (copy), v24 (copy), v27 (copy), l_HoveringObject_0 (copy), v14 (copy), l_isValidDraggableObject_0 (copy), l_isDraggableObjectWelded_0 (copy), v10 (ref)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        v24(false);
        v27(false);
        return;
    else
        local l_Value_0 = l_HoveringObject_0.Value;
        local v30 = v14(l_Character_0);
        if l_Value_0 and l_isValidDraggableObject_0(l_Value_0) and not l_isDraggableObjectWelded_0(l_Value_0) and l_Value_0:HasTag("ToolObject") and (not l_Value_0:GetAttribute("OwnerId") or l_Value_0:GetAttribute("OwnerId") == l_LocalPlayer_0.UserId) then
            v10 = l_Value_0;
        else
            v10 = nil;
        end;
        v24(v10 ~= nil);
        v27(v30 ~= nil);
        return;
    end;
end;
local function v36(v32) --[[ Line: 126 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v31 (copy), v24 (copy), v27 (copy)
    local function v33() --[[ Line: 127 ]] --[[ Name: handleChildChanged ]]
        -- upvalues: v31 (ref)
        v31();
    end;
    local v34 = v32.ChildAdded:Connect(v33);
    local v35 = v32.ChildRemoved:Connect(v33);
    v32.Destroying:Once(function() --[[ Line: 134 ]]
        -- upvalues: v34 (copy), v35 (copy), v24 (ref), v27 (ref)
        v34:Disconnect();
        v35:Disconnect();
        v24(false);
        v27(false);
    end);
    v31();
end;
if l_LocalPlayer_0.Character then
    v36(l_LocalPlayer_0.Character);
end;
l_HoveringObject_0.Changed:Connect(v31);
l_LocalPlayer_0.CharacterAdded:Connect(v36);