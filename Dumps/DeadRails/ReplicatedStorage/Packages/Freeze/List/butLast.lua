--[[
    Script: ReplicatedStorage.Packages.Freeze.List.butLast
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:31
-- Luau version 6, Types version 3
-- Time taken: 0.000317 seconds

local slice_upvr = require(script.Parent.slice)
return function(arg1) -- Line 17, Named "butLast"
	--[[ Upvalues[1]:
		[1]: slice_upvr (readonly)
	]]
	return slice_upvr(arg1, 1, -1)
end