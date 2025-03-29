--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.mergeIn
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:11
-- Luau version 6, Types version 3
-- Time taken: 0.000408 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
local mergeIn_upvr = require(script.Parent.Parent.utils.mergeIn)
return function(arg1, arg2, ...) -- Line 25, Named "mergeIn"
	--[[ Upvalues[2]:
		[1]: maybeFreeze_upvr (readonly)
		[2]: mergeIn_upvr (readonly)
	]]
	return maybeFreeze_upvr(mergeIn_upvr(arg1, arg2, ...))
end