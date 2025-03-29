--[[
    Script: ReplicatedStorage.Shared.InteractableObjectValidation
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:40
-- Luau version 6, Types version 3
-- Time taken: 0.001609 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InteractableObjectTags_upvr = require(ReplicatedStorage.Shared.SharedConstants.CollectionServiceTag.InteractableObjectTags)
local module_upvr = {
	isObject = function(arg1) -- Line 19, Named "isObject"
		--[[ Upvalues[1]:
			[1]: InteractableObjectTags_upvr (readonly)
		]]
		if not arg1 or typeof(arg1) ~= "Instance" or not arg1:IsA("Model") or not arg1:HasTag(InteractableObjectTags_upvr.InteractableObject) or not arg1.PrimaryPart then
			return false
		end
		return true
	end;
}
function module_upvr.isBeingDragged(arg1) -- Line 32
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: InteractableObjectTags_upvr (readonly)
	]]
	assert(module_upvr.isObject(arg1), "Invalid object")
	return arg1:HasTag(InteractableObjectTags_upvr.IsBeingDragged)
end
function module_upvr.isWelded(arg1) -- Line 38
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: InteractableObjectTags_upvr (readonly)
	]]
	assert(module_upvr.isObject(arg1), "Invalid object")
	return arg1:HasTag(InteractableObjectTags_upvr.Welded)
end
function module_upvr.canWeldTo(arg1) -- Line 44
	--[[ Upvalues[1]:
		[1]: InteractableObjectTags_upvr (readonly)
	]]
	if not arg1 or typeof(arg1) ~= "Instance" or not arg1:HasTag(InteractableObjectTags_upvr.CanWeldTo) then
		return false
	end
	return true
end
local Attribute_upvr = require(ReplicatedStorage.Shared.SharedConstants.Attribute)
function module_upvr.isPlayerOwner(arg1, arg2) -- Line 58
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: Attribute_upvr (readonly)
	]]
	local var5
	if typeof(arg1) ~= "Player" then
		var5 = false
	else
		var5 = true
	end
	assert(var5, "First argument must be a player")
	var5 = module_upvr.isObject(arg2)
	assert(var5, "Invalid object")
	local attribute = arg2:GetAttribute(Attribute_upvr.OwnerId)
	var5 = not attribute
	if not var5 then
		if attribute ~= arg1.UserId then
			var5 = false
		else
			var5 = true
		end
	end
	return var5
end
return module_upvr