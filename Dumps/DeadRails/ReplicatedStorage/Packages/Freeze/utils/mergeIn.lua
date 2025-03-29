--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.mergeIn
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:59
-- Luau version 6, Types version 3
-- Time taken: 0.000519 seconds

local updateIn_upvr = require(script.Parent.updateIn)
local merge_upvr = require(script.Parent.merge)
return function(arg1, arg2, ...) -- Line 5
	--[[ Upvalues[2]:
		[1]: updateIn_upvr (readonly)
		[2]: merge_upvr (readonly)
	]]
	local args_list_upvr = {...}
	return updateIn_upvr(arg1, arg2, function(arg1_2) -- Line 7
		--[[ Upvalues[2]:
			[1]: merge_upvr (copied, readonly)
			[2]: args_list_upvr (readonly)
		]]
		return merge_upvr(arg1_2, table.unpack(args_list_upvr))
	end, {})
end