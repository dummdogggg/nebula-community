--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.loader.BounceTemplateUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:17
-- Luau version 6, Types version 3
-- Time taken: 0.001886 seconds

local module_upvr = {
	isBounceTemplate = function(arg1) -- Line 12, Named "isBounceTemplate"
		local var2
		if arg1:GetAttribute("IsBounceTemplate", true) ~= true then
			var2 = false
		else
			var2 = true
		end
		return var2
	end;
}
function module_upvr.getTarget(arg1) -- Line 16
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if not module_upvr.isBounceTemplate(arg1) then
		return nil
	end
	if arg1:IsA("ObjectValue") then
		return arg1.Value
	end
	local BounceTarget = arg1:FindFirstChild("BounceTarget")
	if BounceTarget then
		return BounceTarget.Value
	end
	warn("[BounceTemplateUtils.getTarget] - Bounce template without BounceTarget")
	return nil
end
local BounceTemplate_upvr = script.Parent.BounceTemplate
function module_upvr.create(arg1, arg2) -- Line 34
	--[[ Upvalues[1]:
		[1]: BounceTemplate_upvr (readonly)
	]]
	local var5
	if typeof(arg1) ~= "Instance" then
		var5 = false
	else
		var5 = true
	end
	assert(var5, "Bad target")
	if type(arg2) ~= "string" then
		var5 = false
	else
		var5 = true
	end
	assert(var5, "Bad linkName")
	local clone = BounceTemplate_upvr:Clone()
	var5 = clone:SetAttribute
	var5("IsBounceTemplate", true)
	clone.Name = arg2
	var5 = Instance.new("ObjectValue")
	var5.Name = "BounceTarget"
	var5.Value = arg1
	var5.Parent = clone
	return clone
end
function module_upvr.createLink(arg1, arg2) -- Line 54
	local var7
	if typeof(arg1) ~= "Instance" then
		var7 = false
	else
		var7 = true
	end
	assert(var7, "Bad target")
	if type(arg2) ~= "string" then
		var7 = false
	else
		var7 = true
	end
	assert(var7, "Bad linkName")
	var7 = "ObjectValue"
	local any = Instance.new(var7)
	any.Name = arg2
	any.Value = arg1
	var7 = any:SetAttribute
	var7("IsBounceTemplate", true)
	return any
end
return module_upvr