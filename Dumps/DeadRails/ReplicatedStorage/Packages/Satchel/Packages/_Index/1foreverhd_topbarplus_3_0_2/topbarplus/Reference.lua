--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.1foreverhd_topbarplus@3.0.2.topbarplus.Reference
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:59
-- Luau version 6, Types version 3
-- Time taken: 0.000741 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local module_upvr = {
	objectName = "TopbarPlusReference";
}
function module_upvr.addToReplicatedStorage() -- Line 10
	--[[ Upvalues[2]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	if ReplicatedStorage_upvr:FindFirstChild(module_upvr.objectName) then
		return false
	end
	local ObjectValue = Instance.new("ObjectValue")
	ObjectValue.Name = module_upvr.objectName
	ObjectValue.Value = script.Parent
	ObjectValue.Parent = ReplicatedStorage_upvr
	return ObjectValue
end
function module_upvr.getObject() -- Line 22
	--[[ Upvalues[2]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local SOME = ReplicatedStorage_upvr:FindFirstChild(module_upvr.objectName)
	if SOME then
		return SOME
	end
	return false
end
return module_upvr