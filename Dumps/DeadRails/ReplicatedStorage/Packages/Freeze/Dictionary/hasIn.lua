--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.hasIn
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:55
-- Luau version 6, Types version 3
-- Time taken: 0.000563 seconds

local getIn_upvr = require(script.Parent.Parent.utils.getIn)
local None_upvr = require(script.Parent.Parent.None)
return function(arg1, arg2) -- Line 16, Named "hasIn"
	--[[ Upvalues[2]:
		[1]: getIn_upvr (readonly)
		[2]: None_upvr (readonly)
	]]
	local var3
	if getIn_upvr(arg1, arg2, None_upvr) == None_upvr then
		var3 = false
	else
		var3 = true
	end
	return var3
end