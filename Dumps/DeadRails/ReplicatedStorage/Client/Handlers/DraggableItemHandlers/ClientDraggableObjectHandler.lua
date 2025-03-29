--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientDraggableObjectHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ContextActionService");
local _ = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_ReplicatedStorage_0.Packages.Gizmo);
local _ = l_ReplicatedStorage_0.Shared;
local v7 = require(l_ReplicatedStorage_0.Shared.Remotes);
local l_RequestStartDrag_0 = v7.Events.RequestStartDrag;
local l_UpdateDrag_0 = v7.Events.UpdateDrag;
local l_RequestStopDrag_0 = v7.Events.RequestStopDrag;
local l_RequestWeld_0 = v7.Events.RequestWeld;
local l_RequestUnweld_0 = v7.Events.RequestUnweld;
local v13 = require(l_ReplicatedStorage_0.Shared.SharedConstants.FeatureFlags);
local _ = require(l_ReplicatedStorage_0.Shared.SharedConstants.Tag);
local l_HoveringObject_0 = script:FindFirstChild("HoveringObject");
local l_DraggingObject_0 = script:FindFirstChild("DraggingObject");
local v17 = require("../../Controllers/ActionController");
local v18 = require("../../Controllers/ActionController/InputCategorizer");
local v19 = require(l_ReplicatedStorage_0.Shared.Utils.DraggableObjectUtil);
local v20 = require(l_ReplicatedStorage_0.Shared.Utils.TagUtil);
local v21 = require(l_ReplicatedStorage_0.Shared.SharedConstants.Tag);
local v22 = require(l_ReplicatedStorage_0.Client.DataBanks.ActionData);
local v23 = require(script.RotationGizmo);
local l_isValidDraggableObject_0 = v19.isValidDraggableObject;
local l_isValidWeldTarget_0 = v19.isValidWeldTarget;
local l_isDraggableObjectWelded_0 = v19.isDraggableObjectWelded;
local l_findFirstAncestorOfClassWithTag_0 = v20.findFirstAncestorOfClassWithTag;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("WeldObjectInteraction", 1e999);
local l_DragHighlight_0 = script:FindFirstChild("DragHighlight");
l_DragHighlight_0.Parent = script;
local v32 = false;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = false;
local v38 = 0;
local l_X_0 = Enum.Axis.X;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local function v48() --[[ Line: 78 ]] --[[ Name: raycastInFrontOfCamera ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_LocalPlayer_0 (copy)
    local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
    local v46 = l_CurrentCamera_0.CFrame.LookVector * 10;
    local v47 = RaycastParams.new();
    v47.FilterType = Enum.RaycastFilterType.Exclude;
    v47.FilterDescendantsInstances = {
        l_LocalPlayer_0.Character
    };
    return workspace:Raycast(l_Position_0, v46, v47);
end;
local function v51() --[[ Line: 88 ]] --[[ Name: getDraggableObjectInFrontOfCamera ]]
    -- upvalues: v48 (copy), l_findFirstAncestorOfClassWithTag_0 (copy), v21 (copy), l_isValidDraggableObject_0 (copy), v32 (ref), v36 (ref), l_HoveringObject_0 (copy)
    local v49 = v48();
    if v49 and v49.Instance then
        local v50 = l_findFirstAncestorOfClassWithTag_0(v49.Instance, "Model", v21.DraggableObject);
        if v50 and l_isValidDraggableObject_0(v50) then
            if not v32 and v36 then
                v36.Enabled = l_HoveringObject_0.Value == v50;
            end;
            v36 = v50:FindFirstChild("ObjectInfo");
            return v50;
        end;
    elseif v36 then
        v36.Enabled = false;
        v36 = nil;
    end;
    return nil;
end;
local function v60(v52) --[[ Line: 112 ]] --[[ Name: getWeldTargetTouchingObject ]]
    -- upvalues: l_isValidWeldTarget_0 (copy)
    if not v52 then
        return nil;
    else
        local l_v52_BoundingBox_0 = v52:GetBoundingBox();
        local l_v52_ExtentsSize_0 = v52:GetExtentsSize();
        local v55 = OverlapParams.new();
        v55.FilterType = Enum.RaycastFilterType.Exclude;
        v55.FilterDescendantsInstances = {
            v52
        };
        local l_workspace_PartBoundsInBox_0 = workspace:GetPartBoundsInBox(l_v52_BoundingBox_0, l_v52_ExtentsSize_0 * 1.05, v55);
        local v57 = nil;
        for _, v59 in l_workspace_PartBoundsInBox_0 do
            if v59:IsA("BasePart") and l_isValidWeldTarget_0(v59) then
                return v59;
            end;
        end;
        return v57;
    end;
end;
local function _() --[[ Line: 140 ]] --[[ Name: getWeldedObjectInFrontOfCamera ]]
    -- upvalues: v48 (copy), l_findFirstAncestorOfClassWithTag_0 (copy), v21 (copy), l_isValidDraggableObject_0 (copy)
    local v61 = v48();
    if v61 and v61.Instance then
        local v62 = l_findFirstAncestorOfClassWithTag_0(v61.Instance, "Model", v21.WeldedObject);
        if v62 and l_isValidDraggableObject_0(v62) then
            return v62;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function _(v64) --[[ Line: 153 ]] --[[ Name: requestStartDrag ]]
    -- upvalues: v32 (ref), l_LocalPlayer_0 (copy), l_RequestStartDrag_0 (copy)
    if v32 then
        return;
    elseif not l_LocalPlayer_0.Character then
        return;
    else
        l_RequestStartDrag_0:FireServer(v64);
        return;
    end;
end;
local function v66() --[[ Line: 164 ]] --[[ Name: requestStopDrag ]]
    -- upvalues: v33 (ref), l_RequestStopDrag_0 (copy), v43 (ref), v44 (ref), v42 (ref), l_DragHighlight_0 (copy), v32 (ref), v37 (ref), v38 (ref), v40 (ref), v41 (ref)
    if v33 and v33.PrimaryPart then
        l_RequestStopDrag_0:FireServer();
        if v43 then
            v43:Destroy();
        end;
        if v44 then
            v44:Destroy();
        end;
        if v42 then
            v42:Destroy();
        end;
    end;
    if l_DragHighlight_0 then
        l_DragHighlight_0.Adornee = nil;
    end;
    v32 = false;
    v33 = nil;
    v43 = nil;
    v44 = nil;
    v42 = nil;
    v37 = false;
    v38 = 0;
    v40 = nil;
    if v41 then
        v41:destroy();
    end;
end;
local function _() --[[ Line: 200 ]] --[[ Name: requestUnweldObject ]]
    -- upvalues: v34 (ref), l_RequestUnweld_0 (copy)
    if not v34 then
        return;
    else
        l_RequestUnweld_0:FireServer(v34);
        return;
    end;
end;
local function v72(_, v69, v70) --[[ Line: 209 ]] --[[ Name: handleDragAction ]]
    -- upvalues: v18 (copy), v34 (ref), l_isDraggableObjectWelded_0 (copy), v32 (ref), l_LocalPlayer_0 (copy), l_RequestStartDrag_0 (copy), v66 (copy)
    if v18.getLastInputCategory() == "Gamepad" and v70.UserInputType == Enum.UserInputType.MouseButton1 then
        return Enum.ContextActionResult.Pass;
    else
        if v69 == Enum.UserInputState.Begin then
            if v34 then
                if l_isDraggableObjectWelded_0(v34) then
                    return Enum.ContextActionResult.Pass;
                else
                    local l_v34_0 = v34;
                    if not v32 and l_LocalPlayer_0.Character then
                        l_RequestStartDrag_0:FireServer(l_v34_0);
                    end;
                    return Enum.ContextActionResult.Sink;
                end;
            end;
        elseif v69 == Enum.UserInputState.End and v32 then
            v66();
            return Enum.ContextActionResult.Sink;
        end;
        return Enum.ContextActionResult.Pass;
    end;
end;
local function v75(_, v74) --[[ Line: 240 ]] --[[ Name: handleWeldAction ]]
    -- upvalues: v32 (ref), v35 (ref), l_RequestWeld_0 (copy), v33 (ref), v34 (ref), l_RequestUnweld_0 (copy)
    if v74 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    elseif v32 then
        if v35 then
            l_RequestWeld_0:FireServer(v33, v35);
        end;
        return Enum.ContextActionResult.Pass;
    else
        if v34 then
            l_RequestUnweld_0:FireServer(v34);
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v78(_, v77) --[[ Line: 258 ]] --[[ Name: handleSwitchAxisAction ]]
    -- upvalues: l_X_0 (ref), v41 (ref), v38 (ref)
    if v77 == Enum.UserInputState.Begin then
        if l_X_0 == Enum.Axis.X then
            l_X_0 = Enum.Axis.Y;
        elseif l_X_0 == Enum.Axis.Y then
            l_X_0 = Enum.Axis.Z;
        elseif l_X_0 == Enum.Axis.Z then
            l_X_0 = Enum.Axis.X;
        end;
        if v41 then
            v41:setCurrentAxis(l_X_0);
        end;
        v38 = tick();
        return Enum.ContextActionResult.Sink;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
local function v85(v79) --[[ Line: 280 ]] --[[ Name: updateDrag ]]
    -- upvalues: v32 (ref), v33 (ref), l_CurrentCamera_0 (copy), v17 (copy), v22 (copy), v37 (ref), v38 (ref), v40 (ref), l_X_0 (ref), v13 (copy), v21 (copy), l_UpdateDrag_0 (copy), v43 (ref), v44 (ref)
    if not v32 or not v33 or not v33.PrimaryPart then
        return;
    else
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        local l_LookVector_0 = l_CFrame_0.LookVector;
        local v82 = l_CFrame_0.Position + l_LookVector_0 * 10;
        local l_v33_Pivot_0 = v33:GetPivot();
        if v17.isBound(v22.Action.RotateObject) and v17.isPressed(v22.Action.RotateObject) then
            v37 = true;
            v38 = tick();
            if not v40 then
                v40 = l_v33_Pivot_0 - l_v33_Pivot_0.Position;
            elseif v40 then
                local v84 = v79 * 4;
                if l_X_0 == Enum.Axis.X then
                    v40 = v40 * CFrame.Angles(v84, 0, 0);
                elseif l_X_0 == Enum.Axis.Y then
                    v40 = v40 * CFrame.Angles(0, v84, 0);
                elseif l_X_0 == Enum.Axis.Z then
                    v40 = v40 * CFrame.Angles(0, 0, v84);
                end;
            end;
        end;
        if v13.Experimental.ServerOwnedDragging or v33:HasTag(v21.RopedObject) then
            l_UpdateDrag_0:FireServer(l_LookVector_0, v82);
            return;
        else
            if v43 and v44 then
                v43.Position = v82;
                if not v37 then
                    v44.CFrame = CFrame.new(v82, v82 + l_LookVector_0);
                    return;
                else
                    v44.CFrame = CFrame.new(v82) * v40;
                end;
            end;
            return;
        end;
    end;
end;
local function v89(v86, _, v88) --[[ Line: 333 ]] --[[ Name: onServerDragRequestResponse ]]
    -- upvalues: l_isValidDraggableObject_0 (copy), v32 (ref), v33 (ref), v37 (ref), v41 (ref), v23 (copy), v13 (copy), v21 (copy), v42 (ref), v43 (ref), v44 (ref)
    if not v86 or not l_isValidDraggableObject_0(v88) then
        v32 = false;
        v33 = nil;
        return;
    else
        v32 = true;
        v33 = v88;
        v37 = false;
        v41 = v23.new(v88);
        if not v13.Experimental.ServerOwnedDragging then
            if v88:HasTag(v21.RopedObject) then
                return;
            else
                v42 = Instance.new("Attachment");
                v43 = Instance.new("AlignPosition");
                v44 = Instance.new("AlignOrientation");
                if v33 and v42 and v43 and v44 then
                    v42.Name = "DragAttachment";
                    v42.Parent = v33.PrimaryPart;
                    v43.Name = "DragAlignPosition";
                    v43.Mode = Enum.PositionAlignmentMode.OneAttachment;
                    v43.ApplyAtCenterOfMass = false;
                    v43.MaxForce = 100000;
                    v43.Responsiveness = 50;
                    v43.Attachment0 = v42;
                    v43.Parent = v33.PrimaryPart;
                    v43.Position = v33.PrimaryPart.Position;
                    v44.Name = "DragAlignOrientation";
                    v44.Mode = Enum.OrientationAlignmentMode.OneAttachment;
                    v44.MaxTorque = 10000;
                    v44.Responsiveness = 50;
                    v44.Attachment0 = v42;
                    v44.Parent = v33.PrimaryPart;
                end;
            end;
        end;
        return;
    end;
end;
local function v92(_, _) --[[ Line: 375 ]] --[[ Name: onServerUnweldRequestResponse ]]

end;
local function v100() --[[ Line: 379 ]] --[[ Name: updateInteractionText ]]
    -- upvalues: l_LocalPlayer_0 (copy), v32 (ref), v35 (ref), v34 (ref), l_isDraggableObjectWelded_0 (copy), v17 (copy), v22 (copy), v72 (copy), v78 (copy), v75 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    else
        local l_Humanoid_0 = l_Character_0:FindFirstChildOfClass("Humanoid");
        if not l_Humanoid_0 or l_Humanoid_0 and l_Humanoid_0.Sit then
            return;
        else
            local v95 = false;
            local v96 = false;
            local v97 = false;
            local v98 = "Drag";
            local v99 = "Weld";
            if v32 then
                v98 = "Drop";
                v95 = true;
                v97 = true;
                if v35 then
                    v96 = true;
                end;
            elseif v34 then
                if l_isDraggableObjectWelded_0(v34) then
                    v99 = "Unweld";
                    v96 = true;
                else
                    v95 = true;
                end;
            end;
            if v34 and v34:GetAttribute("OwnerId") and v34:GetAttribute("OwnerId") ~= l_LocalPlayer_0.UserId then
                v95 = false;
            end;
            if v17.isBound(v22.Action.DragObject) ~= v95 then
                if v95 then
                    v17.bindAction(v22.Action.DragObject, v72, v22.ActionContext[v22.Action.DragObject], Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, v22.ActionPriority.High);
                else
                    v17.unbindAction(v22.Action.DragObject);
                end;
            end;
            if v17.isBound(v22.Action.RotateObject) ~= v97 then
                if v97 then
                    v17.bindAction(v22.Action.RotateObject, v22.noOp, v22.ActionContext[v22.Action.RotateObject], Enum.KeyCode.R, Enum.KeyCode.ButtonL2, v22.ActionPriority.Low);
                else
                    v17.unbindAction(v22.Action.RotateObject);
                end;
            end;
            if v17.isBound(v22.Action.ChangeRotationAxis) ~= v97 then
                if v97 then
                    v17.bindAction(v22.Action.ChangeRotationAxis, v78, v22.ActionContext[v22.Action.ChangeRotationAxis], Enum.KeyCode.T, Enum.KeyCode.ButtonY, v22.ActionPriority.Low);
                else
                    v17.unbindAction(v22.Action.ChangeRotationAxis);
                end;
            end;
            if v96 ~= v17.isBound(v22.Action.WeldObject) then
                if v96 then
                    v17.bindAction(v22.Action.WeldObject, v75, v22.ActionContext[v22.Action.WeldObject], Enum.KeyCode.Z, Enum.KeyCode.ButtonX, v22.ActionPriority.Medium);
                else
                    v17.unbindAction(v22.Action.WeldObject);
                end;
            end;
            if v17.isBound(v22.Action.DragObject) then
                v17.setButtonText(v22.Action.DragObject, v98);
            end;
            if v17.isBound(v22.Action.WeldObject) then
                v17.setButtonText(v22.Action.WeldObject, v99);
            end;
            return;
        end;
    end;
end;
local function v101() --[[ Line: 491 ]] --[[ Name: updateVisuals ]]
    -- upvalues: v32 (ref), v33 (ref), l_DragHighlight_0 (copy), v41 (ref), l_CurrentCamera_0 (copy), v34 (ref), v38 (ref)
    if v32 and v33 then
        l_DragHighlight_0.Adornee = v33;
        if v41 then
            v41:setParent(l_CurrentCamera_0);
        end;
    elseif v34 then
        l_DragHighlight_0.Adornee = v34;
        if v41 then
            v41:setParent(nil);
        end;
    else
        l_DragHighlight_0.Adornee = nil;
        if v41 then
            v41:setParent(nil);
        end;
    end;
    if v41 then
        if tick() > v38 + 1.5 then
            v41:hide();
            return;
        else
            v41:show();
        end;
    end;
end;
(function() --[[ Line: 524 ]] --[[ Name: initialize ]]
    -- upvalues: l_RequestStartDrag_0 (copy), v89 (copy), l_RequestWeld_0 (copy), v66 (copy), l_RequestUnweld_0 (copy), v92 (copy), l_RunService_0 (copy), v34 (ref), v51 (copy), v35 (ref), v60 (copy), l_DraggingObject_0 (copy), v85 (copy), v100 (copy), v101 (copy), l_HoveringObject_0 (copy), v33 (ref)
    l_RequestStartDrag_0.OnClientEvent:Connect(v89);
    l_RequestWeld_0.OnClientEvent:Connect(function(v102) --[[ Line: 526 ]]
        -- upvalues: v66 (ref)
        if v102 then
            v66();
        end;
    end);
    l_RequestUnweld_0.OnClientEvent:Connect(v92);
    l_RunService_0.RenderStepped:Connect(function(v103) --[[ Line: 531 ]]
        -- upvalues: v34 (ref), v51 (ref), v35 (ref), v60 (ref), l_DraggingObject_0 (ref), v85 (ref), v100 (ref), v101 (ref), l_HoveringObject_0 (ref), v33 (ref)
        v34 = v51();
        v35 = v60(l_DraggingObject_0.Value);
        v85(v103);
        v100();
        v101();
        l_HoveringObject_0.Value = if v34 ~= v33 then v34 else nil;
        l_DraggingObject_0.Value = v33;
    end);
end)();