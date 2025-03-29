--[[
    Script: ReplicatedStorage.Shared.PlayerClassData
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:42
-- Luau version 6, Types version 3
-- Time taken: 0.001412 seconds

local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.new(arg1, arg2) -- Line 52
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local module = {}
	module._classId = arg1
	module._classData = arg2
	module._destroyed = false
	module._connections = {}
	setmetatable(module, module_2_upvr)
	return module
end
function module_2_upvr.getStartingToolsData(arg1) -- Line 64
	return arg1._classData.startingTools
end
function module_2_upvr.getStartingEquippables(arg1) -- Line 68
	return arg1._classData.startingEquippables
end
function module_2_upvr.getStartingObjects(arg1) -- Line 72
	return arg1._classData.startingObjects
end
function module_2_upvr.getStartingEntities(arg1) -- Line 76
	return arg1._classData.startingEntities
end
function module_2_upvr.hasTag(arg1, arg2) -- Line 80
	local var3
	if not var3 then
		var3 = false
		return var3
	end
	if table.find(arg1._classData.tags, arg2) == nil then
		var3 = false
	else
		var3 = true
	end
	return var3
end
function module_2_upvr.getValueForModifier(arg1, arg2) -- Line 88
	if not arg1._classData.modifiers then
		return 1
	end
	return arg1._classData.modifiers[arg2] or 1
end
function module_2_upvr.destroy(arg1) -- Line 97
	arg1._destroyed = true
	for _, v in pairs(arg1._connections) do
		v:Disconnect()
	end
end
return module_2_upvr