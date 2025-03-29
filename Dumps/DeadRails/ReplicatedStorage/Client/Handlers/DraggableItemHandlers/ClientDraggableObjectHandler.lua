--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientDraggableObjectHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_ReplicatedStorage_0.Packages.Gizmo);
local _ = l_ReplicatedStorage_0.Shared;
local v6 = require(l_ReplicatedStorage_0.Shared.Remotes);
local l_RequestStartDrag_0 = v6.Events.RequestStartDrag;
local l_UpdateDrag_0 = v6.Events.UpdateDrag;
local l_RequestStopDrag_0 = v6.Events.RequestStopDrag;
local l_RequestWeld_0 = v6.Events.RequestWeld;
local l_RequestUnweld_0 = v6.Events.RequestUnweld;
local v12 = require(l_ReplicatedStorage_0.Shared.SharedConstants.FeatureFlags);
local v13 = require(l_ReplicatedStorage_0.Shared.SharedConstants.Tag);
local l_HoveringObject_0 = script:FindFirstChild("HoveringObject");
local l_DraggingObject_0 = script:FindFirstChild("DraggingObject");
local v16 = require("../../Controllers/ActionController");
local v17 = require("../../Controllers/ActionController/InputCategorizer");
local v18 = require(l_ReplicatedStorage_0.Shared.Utils.DraggableObjectUtil);
local v19 = require(l_ReplicatedStorage_0.Shared.Utils.TagUtil);
local l_isValidDraggableObject_0 = v18.isValidDraggableObject;
local l_isValidWeldTarget_0 = v18.isValidWeldTarget;
local l_isDraggableObjectWelded_0 = v18.isDraggableObjectWelded;
local l_findFirstAncestorOfClassWithTag_0 = v19.findFirstAncestorOfClassWithTag;
local v24 = {
    description = "Drag a draggable object", 
    showAction = true, 
    buttonText = "Drag", 
    buttonSize = UDim2.fromOffset(55, 55), 
    buttonPosition = UDim2.fromScale(0.9, 0.5)
};
local v25 = {
    description = "Weld a draggable object", 
    showAction = true, 
    buttonText = "Weld", 
    buttonSize = UDim2.fromOffset(55, 55), 
    buttonPosition = UDim2.fromScale(0.75, 0.55)
};
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("WeldObjectInteraction", 1e999);
local l_DragHighlight_0 = script:FindFirstChild("DragHighlight");
l_DragHighlight_0.Parent = script;
local v30 = false;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = false;
local v36 = false;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local function v43() --[[ Line: 82 ]] --[[ Name: raycastInFrontOfCamera ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_LocalPlayer_0 (copy)
    local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
    local v41 = l_CurrentCamera_0.CFrame.LookVector * 10;
    local v42 = RaycastParams.new();
    v42.FilterType = Enum.RaycastFilterType.Exclude;
    v42.FilterDescendantsInstances = {
        l_LocalPlayer_0.Character
    };
    return workspace:Raycast(l_Position_0, v41, v42);
end;
local function v46() --[[ Line: 92 ]] --[[ Name: getDraggableObjectInFrontOfCamera ]]
    -- upvalues: v43 (copy), l_findFirstAncestorOfClassWithTag_0 (copy), l_isValidDraggableObject_0 (copy), v30 (ref), v34 (ref), l_HoveringObject_0 (copy)
    local v44 = v43();
    if v44 and v44.Instance then
        local v45 = l_findFirstAncestorOfClassWithTag_0(v44.Instance, "Model", "DraggableObject");
        if v45 and l_isValidDraggableObject_0(v45) then
            if not v30 and v34 then
                v34.Enabled = l_HoveringObject_0.Value == v45;
            end;
            v34 = v45:FindFirstChild("ObjectInfo");
            return v45;
        end;
    elseif v34 then
        v34.Enabled = false;
        v34 = nil;
    end;
    return nil;
end;
local function v55(v47) --[[ Line: 116 ]] --[[ Name: getWeldTargetTouchingObject ]]
    -- upvalues: l_isValidWeldTarget_0 (copy)
    if not v47 then
        return nil;
    else
        local l_v47_BoundingBox_0 = v47:GetBoundingBox();
        local l_v47_ExtentsSize_0 = v47:GetExtentsSize();
        local v50 = OverlapParams.new();
        v50.FilterType = Enum.RaycastFilterType.Exclude;
        v50.FilterDescendantsInstances = {
            v47
        };
        local l_workspace_PartBoundsInBox_0 = workspace:GetPartBoundsInBox(l_v47_BoundingBox_0, l_v47_ExtentsSize_0 * 1.05, v50);
        local v52 = nil;
        for _, v54 in l_workspace_PartBoundsInBox_0 do
            if v54:IsA("BasePart") and l_isValidWeldTarget_0(v54) then
                return v54;
            end;
        end;
        return v52;
    end;
end;
local function _() --[[ Line: 149 ]] --[[ Name: getWeldedObjectInFrontOfCamera ]]
    -- upvalues: v43 (copy), l_findFirstAncestorOfClassWithTag_0 (copy), l_isValidDraggableObject_0 (copy)
    local v56 = v43();
    if v56 and v56.Instance then
        local v57 = l_findFirstAncestorOfClassWithTag_0(v56.Instance, "Model", "WeldedObject");
        if v57 and l_isValidDraggableObject_0(v57) then
            return v57;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function _(v59) --[[ Line: 162 ]] --[[ Name: requestStartDrag ]]
    -- upvalues: v30 (ref), l_LocalPlayer_0 (copy), l_RequestStartDrag_0 (copy)
    if v30 then
        return;
    elseif not l_LocalPlayer_0.Character then
        return;
    else
        l_RequestStartDrag_0:FireServer(v59);
        return;
    end;
end;
local function v61() --[[ Line: 173 ]] --[[ Name: requestStopDrag ]]
    -- upvalues: v31 (ref), l_RequestStopDrag_0 (copy), v38 (ref), v39 (ref), v37 (ref), l_DragHighlight_0 (copy), v30 (ref)
    if v31 and v31.PrimaryPart then
        l_RequestStopDrag_0:FireServer();
        if v38 then
            v38:Destroy();
        end;
        if v39 then
            v39:Destroy();
        end;
        if v37 then
            v37:Destroy();
        end;
    end;
    if l_DragHighlight_0 then
        l_DragHighlight_0.Adornee = nil;
    end;
    v30 = false;
    v31 = nil;
    v38 = nil;
    v39 = nil;
    v37 = nil;
end;
local function _() --[[ Line: 201 ]] --[[ Name: requestUnweldObject ]]
    -- upvalues: v32 (ref), l_RequestUnweld_0 (copy)
    if not v32 then
        return;
    else
        l_RequestUnweld_0:FireServer(v32);
        return;
    end;
end;
local function v67(_, v64, v65) --[[ Line: 210 ]] --[[ Name: handleDragAction ]]
    -- upvalues: v17 (copy), v32 (ref), l_isDraggableObjectWelded_0 (copy), v30 (ref), l_LocalPlayer_0 (copy), l_RequestStartDrag_0 (copy), v61 (copy)
    if v17.getLastInputCategory() == "Gamepad" and v65.UserInputType == Enum.UserInputType.MouseButton1 then
        return Enum.ContextActionResult.Pass;
    else
        if v64 == Enum.UserInputState.Begin then
            if v32 then
                if l_isDraggableObjectWelded_0(v32) then
                    return Enum.ContextActionResult.Pass;
                else
                    local l_v32_0 = v32;
                    if not v30 and l_LocalPlayer_0.Character then
                        l_RequestStartDrag_0:FireServer(l_v32_0);
                    end;
                    return Enum.ContextActionResult.Sink;
                end;
            end;
        elseif v64 == Enum.UserInputState.End and v30 then
            v61();
            return Enum.ContextActionResult.Sink;
        end;
        return Enum.ContextActionResult.Pass;
    end;
end;
local function v70(_, v69) --[[ Line: 241 ]] --[[ Name: handleWeldAction ]]
    -- upvalues: v30 (ref), v33 (ref), l_RequestWeld_0 (copy), v31 (ref), v32 (ref), l_RequestUnweld_0 (copy)
    if v69 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    elseif v30 then
        if v33 then
            l_RequestWeld_0:FireServer(v31, v33);
        end;
        return Enum.ContextActionResult.Pass;
    else
        if v32 then
            l_RequestUnweld_0:FireServer(v32);
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v74() --[[ Line: 259 ]] --[[ Name: updateDrag ]]
    -- upvalues: v30 (ref), v31 (ref), l_CurrentCamera_0 (copy), v12 (copy), v13 (copy), l_UpdateDrag_0 (copy), v38 (ref), v39 (ref)
    if not v30 or not v31 or not v31.PrimaryPart then
        return;
    else
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        local l_LookVector_0 = l_CFrame_0.LookVector;
        local v73 = l_CFrame_0.Position + l_LookVector_0 * 10;
        if v12.Experimental.ServerOwnedDragging or v31:HasTag(v13.RopedObject) then
            l_UpdateDrag_0:FireServer(l_LookVector_0, v73);
            return;
        else
            if v38 and v39 then
                v38.Position = v73;
                v39.CFrame = CFrame.new(v73, v73 + l_LookVector_0);
            end;
            return;
        end;
    end;
end;
local function v78(v75, _, v77) --[[ Line: 279 ]] --[[ Name: onServerDragRequestResponse ]]
    -- upvalues: l_isValidDraggableObject_0 (copy), v30 (ref), v31 (ref), v12 (copy), v13 (copy), v37 (ref), v38 (ref), v39 (ref)
    if not v75 or not l_isValidDraggableObject_0(v77) then
        v30 = false;
        v31 = nil;
        return;
    else
        v30 = true;
        v31 = v77;
        if not v12.Experimental.ServerOwnedDragging then
            if v77:HasTag(v13.RopedObject) then
                return;
            else
                v37 = Instance.new("Attachment");
                v38 = Instance.new("AlignPosition");
                v39 = Instance.new("AlignOrientation");
                if v31 and v37 and v38 and v39 then
                    v37.Name = "DragAttachment";
                    v37.Parent = v31.PrimaryPart;
                    v38.Name = "DragAlignPosition";
                    v38.Mode = Enum.PositionAlignmentMode.OneAttachment;
                    v38.ApplyAtCenterOfMass = false;
                    v38.MaxForce = 100000;
                    v38.Responsiveness = 50;
                    v38.Attachment0 = v37;
                    v38.Parent = v31.PrimaryPart;
                    v38.Position = v31.PrimaryPart.Position;
                    v39.Name = "DragAlignOrientation";
                    v39.Mode = Enum.OrientationAlignmentMode.OneAttachment;
                    v39.MaxTorque = 10000;
                    v39.Responsiveness = 50;
                    v39.Attachment0 = v37;
                    v39.Parent = v31.PrimaryPart;
                end;
            end;
        end;
        return;
    end;
end;
local function v81(_, _) --[[ Line: 319 ]] --[[ Name: onServerUnweldRequestResponse ]]

end;
local function v88() --[[ Line: 323 ]] --[[ Name: updateInteractionText ]]
    -- upvalues: l_LocalPlayer_0 (copy), v30 (ref), v33 (ref), v32 (ref), l_isDraggableObjectWelded_0 (copy), v35 (ref), v16 (copy), v67 (copy), v24 (copy), v36 (ref), v70 (copy), v25 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    else
        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
        if l_Humanoid_0 and l_Humanoid_0.Sit then
            return;
        else
            local v84 = false;
            local v85 = false;
            local v86 = "Drag";
            local v87 = "Weld";
            if v30 then
                v86 = "Drop";
                v84 = true;
                if v33 then
                    v85 = true;
                end;
            elseif v32 then
                if l_isDraggableObjectWelded_0(v32) then
                    v87 = "Unweld";
                    v85 = true;
                else
                    v84 = true;
                end;
            end;
            if v32 and v32:GetAttribute("OwnerId") and v32:GetAttribute("OwnerId") ~= l_LocalPlayer_0.UserId then
                v84 = false;
            end;
            if v84 ~= v35 then
                if v84 then
                    v16.bindAction("DragObjectAction", v67, v24, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, 2);
                else
                    v16.unbindAction("DragObjectAction");
                end;
                v35 = v84;
            end;
            if v85 ~= v36 then
                if v85 then
                    v16.bindAction("WeldObjectAction", v70, v25, Enum.KeyCode.Z, Enum.KeyCode.ButtonX, 2);
                else
                    v16.unbindAction("WeldObjectAction");
                end;
                v36 = v85;
            end;
            if v35 then
                v16.setButtonText("DragObjectAction", v86);
            end;
            if v36 then
                v16.setButtonText("WeldObjectAction", v87);
            end;
            return;
        end;
    end;
end;
local function _() --[[ Line: 410 ]] --[[ Name: updateHighlight ]]
    -- upvalues: v30 (ref), v31 (ref), l_DragHighlight_0 (copy), v32 (ref)
    if v30 and v31 then
        l_DragHighlight_0.Adornee = v31;
        return;
    elseif v32 then
        l_DragHighlight_0.Adornee = v32;
        return;
    else
        l_DragHighlight_0.Adornee = nil;
        return;
    end;
end;
(function() --[[ Line: 420 ]] --[[ Name: initialize ]]
    -- upvalues: l_RequestStartDrag_0 (copy), v78 (copy), l_RequestWeld_0 (copy), v61 (copy), l_RequestUnweld_0 (copy), v81 (copy), l_RunService_0 (copy), v32 (ref), v46 (copy), v33 (ref), v55 (copy), l_DraggingObject_0 (copy), v74 (copy), v88 (copy), v30 (ref), v31 (ref), l_DragHighlight_0 (copy), l_HoveringObject_0 (copy)
    l_RequestStartDrag_0.OnClientEvent:Connect(v78);
    l_RequestWeld_0.OnClientEvent:Connect(function(v90) --[[ Line: 422 ]]
        -- upvalues: v61 (ref)
        if v90 then
            v61();
        end;
    end);
    l_RequestUnweld_0.OnClientEvent:Connect(v81);
    l_RunService_0.RenderStepped:Connect(function() --[[ Line: 427 ]]
        -- upvalues: v32 (ref), v46 (ref), v33 (ref), v55 (ref), l_DraggingObject_0 (ref), v74 (ref), v88 (ref), v30 (ref), v31 (ref), l_DragHighlight_0 (ref), l_HoveringObject_0 (ref)
        v32 = v46();
        v33 = v55(l_DraggingObject_0.Value);
        v74();
        v88();
        if v30 and v31 then
            l_DragHighlight_0.Adornee = v31;
        elseif v32 then
            l_DragHighlight_0.Adornee = v32;
        else
            l_DragHighlight_0.Adornee = nil;
        end;
        l_HoveringObject_0.Value = if v32 ~= v31 then v32 else nil;
        l_DraggingObject_0.Value = v31;
    end);
end)();