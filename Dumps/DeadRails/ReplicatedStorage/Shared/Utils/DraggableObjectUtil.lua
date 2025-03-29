--[[
    Script: ReplicatedStorage.Shared.Utils.DraggableObjectUtil
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:43
-- Luau version 6, Types version 3
-- Time taken: 0.002144 seconds

local function findFirstAncestorOfClassWithTag_upvr(arg1, arg2, arg3) -- Line 13, Named "findFirstAncestorOfClassWithTag"
	local instance = arg1:FindFirstAncestorOfClass(arg2)
	while instance and 0 < 10 do
		if instance:HasTag(arg3) then
			return instance
		end
	end
	return nil
end
local Tag_upvr = require(game:GetService("ReplicatedStorage").Shared.SharedConstants.Tag)
local any_IsServer_result1_upvr = game:GetService("RunService"):IsServer()
return {
	isValidDraggableObject = function(arg1) -- Line 31, Named "isValidDraggableObject"
		--[[ Upvalues[2]:
			[1]: Tag_upvr (readonly)
			[2]: any_IsServer_result1_upvr (readonly)
		]]
		if typeof(arg1) ~= "Instance" then
			return false
		end
		if not arg1 or not arg1:HasTag(Tag_upvr.DraggableObject) or not arg1:IsA("Model") or not arg1.PrimaryPart then
			return false
		end
		if any_IsServer_result1_upvr and not arg1.PrimaryPart:CanSetNetworkOwnership() then
			return false
		end
		return true
	end;
	isValidWeldTarget = function(arg1) -- Line 53, Named "isValidWeldTarget"
		--[[ Upvalues[1]:
			[1]: findFirstAncestorOfClassWithTag_upvr (readonly)
		]]
		if arg1 and arg1:HasTag("WeldableSurface") then
			return true
		end
		if not arg1 or not arg1:IsA("BasePart") or arg1:HasTag("DraggableObject") or not arg1:FindFirstAncestor("Train") or arg1:IsGrounded() then
			return false
		end
		if findFirstAncestorOfClassWithTag_upvr(arg1, "Model", "DraggableObject") then
		else
		end
		if false then
			return false
		end
		local class_Model = arg1:FindFirstAncestorOfClass("Model")
		if class_Model then
			local Humanoid_2 = class_Model:FindFirstChild("Humanoid", true)
			if Humanoid_2 and Humanoid_2:IsA("Humanoid") then
				return false
			end
		end
		return true
	end;
	isDraggableObjectWelded = function(arg1) -- Line 88, Named "isDraggableObjectWelded"
		return arg1.PrimaryPart:FindFirstChild("DragWeldConstraint")
	end;
}