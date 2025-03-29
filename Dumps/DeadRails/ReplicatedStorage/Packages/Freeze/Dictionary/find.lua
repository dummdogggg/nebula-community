--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.find
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:26
-- Luau version 6, Types version 3
-- Time taken: 0.000416 seconds

local findPair_upvr = require(script.Parent.Parent.utils.findPair)
return function(arg1, arg2, arg3) -- Line 16, Named "find"
	--[[ Upvalues[1]:
		[1]: findPair_upvr (readonly)
	]]
	local findPair_upvr_result1, findPair_upvr_result2 = findPair_upvr(arg1, arg2)
	if findPair_upvr_result2 == nil then
		return arg3
	end
	return findPair_upvr_result2
end