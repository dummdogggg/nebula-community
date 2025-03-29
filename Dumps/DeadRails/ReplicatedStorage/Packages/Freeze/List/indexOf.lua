--[[
    Script: ReplicatedStorage.Packages.Freeze.List.indexOf
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:32
-- Luau version 6, Types version 3
-- Time taken: 0.000446 seconds

local keyOf_upvr = require(script.Parent.Parent.utils.keyOf)
return function(arg1, arg2) -- Line 15, Named "indexOf"
	--[[ Upvalues[1]:
		[1]: keyOf_upvr (readonly)
	]]
	local keyOf_upvr_result1 = keyOf_upvr(arg1, arg2)
	if keyOf_upvr_result1 == nil then
		return nil
	end
	return keyOf_upvr_result1
end