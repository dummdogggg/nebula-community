--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientInteractableObjectHandler
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:44
-- Luau version 6, Types version 3
-- Time taken: 0.002128 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurrentCamera_upvr = workspace.CurrentCamera
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local function raycastInFrontOfCamera_upvr() -- Line 22, Named "raycastInFrontOfCamera"
	--[[ Upvalues[2]:
		[1]: CurrentCamera_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	local RaycastParams_new_result1 = RaycastParams.new()
	RaycastParams_new_result1.FilterType = Enum.RaycastFilterType.Exclude
	RaycastParams_new_result1.FilterDescendantsInstances = {LocalPlayer_upvr.Character}
	return workspace:Raycast(CurrentCamera_upvr.CFrame.Position, CurrentCamera_upvr.CFrame.LookVector * 10, RaycastParams_new_result1)
end
local module_upvr = {
	_hoveringObject = nil;
	OnHoveringObjectChanged = require(ReplicatedStorage.Packages.Signal).new();
}
local RunService_upvr = game:GetService("RunService")
function module_upvr.start() -- Line 38
	--[[ Upvalues[2]:
		[1]: RunService_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	RunService_upvr.RenderStepped:Connect(module_upvr._updateHoveringObject)
	module_upvr.OnHoveringObjectChanged:Connect(module_upvr._updateHighlight)
	module_upvr.OnHoveringObjectChanged:Connect(function() -- Line 42
		warn("changed!!")
	end)
end
function module_upvr.getHoveringInteractableObject() -- Line 47
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr._hoveringObject
end
local ObjectHighlight_upvr = script:FindFirstChild("ObjectHighlight")
function module_upvr._updateHighlight() -- Line 51
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: ObjectHighlight_upvr (readonly)
	]]
	local _hoveringObject = module_upvr._hoveringObject
	if _hoveringObject then
		ObjectHighlight_upvr.Adornee = _hoveringObject
	else
		ObjectHighlight_upvr.Adornee = nil
	end
end
local findFirstAncestorOfClassWithTag_upvr = require(ReplicatedStorage.Shared.Utils.findFirstAncestorOfClassWithTag)
local InteractableObjectTags_upvr = require(ReplicatedStorage.Shared.SharedConstants.CollectionServiceTag.InteractableObjectTags)
local InteractableObjectValidation_upvr = require(ReplicatedStorage.Shared.InteractableObjectValidation)
function module_upvr._updateHoveringObject() -- Line 61
	--[[ Upvalues[5]:
		[1]: raycastInFrontOfCamera_upvr (readonly)
		[2]: findFirstAncestorOfClassWithTag_upvr (readonly)
		[3]: InteractableObjectTags_upvr (readonly)
		[4]: InteractableObjectValidation_upvr (readonly)
		[5]: module_upvr (readonly)
	]]
	local raycastInFrontOfCamera_upvr_result1_2 = raycastInFrontOfCamera_upvr()
	local var18
	if raycastInFrontOfCamera_upvr_result1_2 and raycastInFrontOfCamera_upvr_result1_2.Instance then
		local findFirstAncestorOfClassWithTag_upvr_result1 = findFirstAncestorOfClassWithTag_upvr(raycastInFrontOfCamera_upvr_result1_2.Instance, "Model", InteractableObjectTags_upvr.InteractableObject)
		if findFirstAncestorOfClassWithTag_upvr_result1 and InteractableObjectValidation_upvr.isObject(findFirstAncestorOfClassWithTag_upvr_result1) then
			var18 = findFirstAncestorOfClassWithTag_upvr_result1
		end
	end
	if module_upvr._hoveringObject ~= var18 then
		module_upvr._hoveringObject = var18
		module_upvr.OnHoveringObjectChanged:Fire(var18)
	end
end
return module_upvr