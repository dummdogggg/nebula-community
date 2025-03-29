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
local l_PickUpTool_0 = l_ReplicatedStorage_0.Remotes.Tool.PickUpTool;
local l_DropTool_0 = l_ReplicatedStorage_0.Remotes.Tool.DropTool;
local v9 = {
    description = "Pick up object", 
    showAction = true, 
    buttonText = "Pick Up", 
    buttonSize = UDim2.fromOffset(48, 48), 
    buttonPosition = UDim2.fromScale(0.92, 0.3)
};
local v10 = {
    description = "Drop object", 
    showAction = true, 
    buttonText = "Drop", 
    buttonSize = UDim2.fromOffset(48, 48), 
    buttonPosition = UDim2.fromScale(0.92, 0.3)
};
local v11 = nil;
local v12 = false;
local v13 = false;
local function v17(v14) --[[ Line: 50 ]] --[[ Name: getCurrentlyHeldTool ]]
    if not v14 then
        return nil;
    else
        for _, v16 in v14:GetChildren() do
            if v16:IsA("Tool") and v16:HasTag("Droppable") then
                return v16;
            end;
        end;
        return nil;
    end;
end;
local function v20(_, v19) --[[ Line: 62 ]] --[[ Name: pickObjectActionCallback ]]
    -- upvalues: v11 (ref), l_PickUpTool_0 (copy)
    if v19 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        if v11 then
            l_PickUpTool_0:FireServer(v11);
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v24(_, v22) --[[ Line: 72 ]] --[[ Name: dropObjectActionCallback ]]
    -- upvalues: v17 (copy), l_LocalPlayer_0 (copy), l_DropTool_0 (copy)
    if v22 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        local v23 = v17(l_LocalPlayer_0.Character);
        if v23 then
            l_DropTool_0:FireServer(v23);
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function _(v25) --[[ Line: 83 ]] --[[ Name: updatePickBound ]]
    -- upvalues: v12 (ref), v6 (copy), v20 (copy), v9 (copy)
    if v25 and not v12 then
        v6.bindAction("PickObjectAction", v20, v9, Enum.KeyCode.E, Enum.KeyCode.DPadLeft, 3);
        v12 = true;
        return;
    else
        if not v25 and v12 then
            v6.unbindAction("PickObjectAction");
            v12 = false;
        end;
        return;
    end;
end;
local function _(v27) --[[ Line: 100 ]] --[[ Name: updateDropBound ]]
    -- upvalues: v13 (ref), v6 (copy), v24 (copy), v10 (copy)
    if v27 and not v13 then
        v6.bindAction("DropObjectAction", v24, v10, Enum.KeyCode.Backspace, Enum.KeyCode.DPadLeft, 3);
        v13 = true;
        return;
    else
        if not v27 and v13 then
            v6.unbindAction("DropObjectAction");
            v13 = false;
        end;
        return;
    end;
end;
local function v33() --[[ Line: 117 ]] --[[ Name: update ]]
    -- upvalues: l_LocalPlayer_0 (copy), v12 (ref), v6 (copy), v13 (ref), l_HoveringObject_0 (copy), v17 (copy), l_isValidDraggableObject_0 (copy), l_isDraggableObjectWelded_0 (copy), v11 (ref), v20 (copy), v9 (copy), v24 (copy), v10 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        if v12 then
            v6.unbindAction("PickObjectAction");
            v12 = false;
        end;
        if v13 then
            v6.unbindAction("DropObjectAction");
            v13 = false;
        end;
        return;
    else
        local l_Value_0 = l_HoveringObject_0.Value;
        local v31 = v17(l_Character_0);
        if l_Value_0 and l_isValidDraggableObject_0(l_Value_0) and not l_isDraggableObjectWelded_0(l_Value_0) and l_Value_0:HasTag("ToolObject") and (not l_Value_0:GetAttribute("OwnerId") or l_Value_0:GetAttribute("OwnerId") == l_LocalPlayer_0.UserId) then
            v11 = l_Value_0;
        else
            v11 = nil;
        end;
        local v32 = v11 ~= nil;
        if v32 and not v12 then
            v6.bindAction("PickObjectAction", v20, v9, Enum.KeyCode.E, Enum.KeyCode.DPadLeft, 3);
            v12 = true;
        elseif not v32 and v12 then
            v6.unbindAction("PickObjectAction");
            v12 = false;
        end;
        v32 = v31 ~= nil;
        if v32 and not v13 then
            v6.bindAction("DropObjectAction", v24, v10, Enum.KeyCode.Backspace, Enum.KeyCode.DPadLeft, 3);
            v13 = true;
            return;
        else
            if not v32 and v13 then
                v6.unbindAction("DropObjectAction");
                v13 = false;
            end;
            return;
        end;
    end;
end;
local function v38(v34) --[[ Line: 143 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v33 (copy), v12 (ref), v6 (copy), v13 (ref)
    local function v35() --[[ Line: 144 ]] --[[ Name: handleChildChanged ]]
        -- upvalues: v33 (ref)
        v33();
    end;
    local v36 = v34.ChildAdded:Connect(v35);
    local v37 = v34.ChildRemoved:Connect(v35);
    v34.Destroying:Once(function() --[[ Line: 151 ]]
        -- upvalues: v36 (copy), v37 (copy), v12 (ref), v6 (ref), v13 (ref)
        v36:Disconnect();
        v37:Disconnect();
        if v12 then
            v6.unbindAction("PickObjectAction");
            v12 = false;
        end;
        if v13 then
            v6.unbindAction("DropObjectAction");
            v13 = false;
        end;
    end);
    v33();
end;
if l_LocalPlayer_0.Character then
    v38(l_LocalPlayer_0.Character);
end;
l_HoveringObject_0.Changed:Connect(v33);
l_LocalPlayer_0.CharacterAdded:Connect(v38);