--[[
    Script: ReplicatedStorage.Packages.Freeze.List.takeLast
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:31
-- Luau version 6, Types version 3
-- Time taken: 0.000343 seconds

local slice_upvr = require(script.Parent.slice)
return function(arg1, arg2) -- Line 14, Named "takeLast"
	--[[ Upvalues[1]:
		[1]: slice_upvr (readonly)
	]]
	return slice_upvr(arg1, -math.max(1, arg2))
end