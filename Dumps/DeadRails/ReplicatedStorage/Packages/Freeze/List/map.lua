--[[
    Script: ReplicatedStorage.Packages.Freeze.List.map
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:43:56
-- Luau version 6, Types version 3
-- Time taken: 0.000397 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
local map_upvr = require(script.Parent.Parent.utils.map)
return function(arg1, arg2) -- Line 22, Named "map"
	--[[ Upvalues[2]:
		[1]: maybeFreeze_upvr (readonly)
		[2]: map_upvr (readonly)
	]]
	return maybeFreeze_upvr(map_upvr(arg1, arg2))
end