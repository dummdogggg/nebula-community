--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.setIn
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:58
-- Luau version 6, Types version 3
-- Time taken: 0.000424 seconds

local updateIn_upvr = require(script.Parent.updateIn)
local None_upvr = require(script.Parent.Parent.None)
return function(arg1, arg2, arg3) -- Line 4
	--[[ Upvalues[2]:
		[1]: updateIn_upvr (readonly)
		[2]: None_upvr (readonly)
	]]
	return updateIn_upvr(arg1, arg2, function() -- Line 5
		--[[ Upvalues[1]:
			[1]: arg3 (readonly)
		]]
		return arg3
	end, None_upvr)
end