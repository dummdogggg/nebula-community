--[[
    Script: ReplicatedStorage.Packages.Freeze.List.sort
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:00
-- Luau version 6, Types version 3
-- Time taken: 0.000391 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, arg2) -- Line 16, Named "sort"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	local clone = table.clone(arg1)
	table.sort(clone, arg2)
	return maybeFreeze_upvr(clone)
end