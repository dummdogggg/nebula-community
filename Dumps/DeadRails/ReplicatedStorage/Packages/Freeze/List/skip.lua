--[[
    Script: ReplicatedStorage.Packages.Freeze.List.skip
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:06
-- Luau version 6, Types version 3
-- Time taken: 0.000334 seconds

local slice_upvr = require(script.Parent.slice)
return function(arg1, arg2) -- Line 15, Named "skip"
	--[[ Upvalues[1]:
		[1]: slice_upvr (readonly)
	]]
	return slice_upvr(arg1, math.max(1, arg2 + 1))
end