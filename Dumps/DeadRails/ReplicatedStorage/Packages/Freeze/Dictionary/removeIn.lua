--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.removeIn
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:01
-- Luau version 6, Types version 3
-- Time taken: 0.000392 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
local removeIn_upvr = require(script.Parent.Parent.utils.removeIn)
return function(arg1, arg2) -- Line 16, Named "removeIn"
	--[[ Upvalues[2]:
		[1]: maybeFreeze_upvr (readonly)
		[2]: removeIn_upvr (readonly)
	]]
	return maybeFreeze_upvr(removeIn_upvr(arg1, arg2))
end