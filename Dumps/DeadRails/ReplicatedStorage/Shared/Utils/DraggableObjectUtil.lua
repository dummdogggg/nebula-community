--[[
    Script: ReplicatedStorage.Shared.Utils.DraggableObjectUtil
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(l_ReplicatedStorage_0.Shared.SharedConstants.Tag);
local v4 = l_RunService_0:IsServer();
local function v10(v5, v6, v7) --[[ Line: 13 ]] --[[ Name: findFirstAncestorOfClassWithTag ]]
    local l_v5_FirstAncestorOfClass_0 = v5:FindFirstAncestorOfClass(v6);
    local v9 = 0;
    while true do
        if l_v5_FirstAncestorOfClass_0 and v9 < 10 then
            if l_v5_FirstAncestorOfClass_0:HasTag(v7) then
                return l_v5_FirstAncestorOfClass_0;
            else
                l_v5_FirstAncestorOfClass_0 = l_v5_FirstAncestorOfClass_0:FindFirstAncestorOfClass(v6);
                v9 = v9 + 1;
            end;
        else
            return nil;
        end;
    end;
end;
return {
    isValidDraggableObject = function(v11) --[[ Line: 31 ]] --[[ Name: isValidDraggableObject ]]
        -- upvalues: v3 (copy), v4 (copy)
        if typeof(v11) ~= "Instance" then
            return false;
        elseif not v11 or not v11:HasTag(v3.DraggableObject) or not v11:IsA("Model") or not v11.PrimaryPart then
            return false;
        elseif v4 and not v11.PrimaryPart:CanSetNetworkOwnership() then
            return false;
        else
            return true;
        end;
    end, 
    isValidWeldTarget = function(v12) --[[ Line: 53 ]] --[[ Name: isValidWeldTarget ]]
        -- upvalues: v10 (copy)
        if v12 and v12:HasTag("WeldableSurface") then
            return true;
        elseif not v12 or not v12:IsA("BasePart") or v12:HasTag("DraggableObject") or not v12:FindFirstAncestor("Train") or v12:IsGrounded() then
            return false;
        elseif v10(v12, "Model", "DraggableObject") and true or false then
            return false;
        else
            local l_v12_FirstAncestorOfClass_0 = v12:FindFirstAncestorOfClass("Model");
            if l_v12_FirstAncestorOfClass_0 then
                local l_l_v12_FirstAncestorOfClass_0_FirstChild_0 = l_v12_FirstAncestorOfClass_0:FindFirstChild("Humanoid", true);
                if l_l_v12_FirstAncestorOfClass_0_FirstChild_0 and l_l_v12_FirstAncestorOfClass_0_FirstChild_0:IsA("Humanoid") then
                    return false;
                end;
            end;
            return true;
        end;
    end, 
    isDraggableObjectWelded = function(v15) --[[ Line: 88 ]] --[[ Name: isDraggableObjectWelded ]]
        return (v15.PrimaryPart:FindFirstChild("DragWeldConstraint"));
    end
};