--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.updateIn
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:15
-- Luau version 6, Types version 3
-- Time taken: 0.000475 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
local updateIn_upvr = require(script.Parent.Parent.utils.updateIn)
return function(arg1, arg2, arg3, arg4) -- Line 31, Named "updateIn"
	--[[ Upvalues[2]:
		[1]: maybeFreeze_upvr (readonly)
		[2]: updateIn_upvr (readonly)
	]]
	return maybeFreeze_upvr(updateIn_upvr(arg1, arg2, arg3, arg4))
end