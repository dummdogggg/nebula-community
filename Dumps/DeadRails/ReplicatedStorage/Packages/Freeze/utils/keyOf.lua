--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.keyOf
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:11
-- Luau version 6, Types version 3
-- Time taken: 0.000446 seconds

local findKey_upvr = require(script.Parent.findKey)
local is_upvr = require(script.Parent.is)
return function(arg1, arg2) -- Line 4
	--[[ Upvalues[2]:
		[1]: findKey_upvr (readonly)
		[2]: is_upvr (readonly)
	]]
	return findKey_upvr(arg1, function(arg1_2) -- Line 5
		--[[ Upvalues[2]:
			[1]: is_upvr (copied, readonly)
			[2]: arg2 (readonly)
		]]
		return is_upvr(arg1_2, arg2)
	end)
end