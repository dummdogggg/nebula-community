--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.set
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:22
-- Luau version 6, Types version 3
-- Time taken: 0.000536 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
local set_upvr = require(script.Parent.Parent.utils.set)
return function(arg1, arg2, arg3) -- Line 16, Named "set"
	--[[ Upvalues[2]:
		[1]: maybeFreeze_upvr (readonly)
		[2]: set_upvr (readonly)
	]]
	if arg2 == nil then
		return arg1
	end
	return maybeFreeze_upvr(set_upvr(arg1, arg2, arg3))
end