--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.filterNot
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:26
-- Luau version 6, Types version 3
-- Time taken: 0.000416 seconds

local filter_upvr = require(script.Parent.filter)
return function(arg1, arg2) -- Line 17, Named "filterNot"
	--[[ Upvalues[1]:
		[1]: filter_upvr (readonly)
	]]
	return filter_upvr(arg1, function(arg1_2, arg2_2) -- Line 18
		--[[ Upvalues[1]:
			[1]: arg2 (readonly)
		]]
		return not arg2(arg1_2, arg2_2)
	end)
end