--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.action
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:35
-- Luau version 6, Types version 3
-- Time taken: 0.000752 seconds

local table_freeze_result1_upvr = table.freeze({})
local function is_action_upvr(arg1) -- Line 8, Named "is_action"
	--[[ Upvalues[1]:
		[1]: table_freeze_result1_upvr (readonly)
	]]
	local var2
	if getmetatable(arg1) ~= table_freeze_result1_upvr then
		var2 = false
	else
		var2 = true
	end
	return var2
end
local function action_upvr(arg1, arg2) -- Line 12, Named "action"
	--[[ Upvalues[1]:
		[1]: table_freeze_result1_upvr (readonly)
	]]
	local module = {
		priority = arg2 or 1;
	}
	module.callback = arg1
	setmetatable(module, table_freeze_result1_upvr)
	return table.freeze(module)
end
return function() -- Line 23
	--[[ Upvalues[2]:
		[1]: action_upvr (readonly)
		[2]: is_action_upvr (readonly)
	]]
	return action_upvr, is_action_upvr
end