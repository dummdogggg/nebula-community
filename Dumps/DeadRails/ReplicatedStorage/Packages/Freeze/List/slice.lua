--[[
    Script: ReplicatedStorage.Packages.Freeze.List.slice
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:40
-- Luau version 6, Types version 3
-- Time taken: 0.000414 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
local slice_upvr = require(script.Parent.Parent.utils.slice)
return function(arg1, arg2, arg3) -- Line 29, Named "slice"
	--[[ Upvalues[2]:
		[1]: maybeFreeze_upvr (readonly)
		[2]: slice_upvr (readonly)
	]]
	return maybeFreeze_upvr(slice_upvr(arg1, arg2, arg3))
end