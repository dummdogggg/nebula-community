--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.setIn
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:51
-- Luau version 6, Types version 3
-- Time taken: 0.000400 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
local setIn_upvr = require(script.Parent.Parent.utils.setIn)
return function(arg1, arg2, arg3) -- Line 24, Named "setIn"
	--[[ Upvalues[2]:
		[1]: maybeFreeze_upvr (readonly)
		[2]: setIn_upvr (readonly)
	]]
	return maybeFreeze_upvr(setIn_upvr(arg1, arg2, arg3))
end