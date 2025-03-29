--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.update
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:30
-- Luau version 6, Types version 3
-- Time taken: 0.000418 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
local update_upvr = require(script.Parent.Parent.utils.update)
return function(arg1, arg2, arg3, arg4) -- Line 24, Named "update"
	--[[ Upvalues[2]:
		[1]: maybeFreeze_upvr (readonly)
		[2]: update_upvr (readonly)
	]]
	return maybeFreeze_upvr(update_upvr(arg1, arg2, arg3, arg4))
end