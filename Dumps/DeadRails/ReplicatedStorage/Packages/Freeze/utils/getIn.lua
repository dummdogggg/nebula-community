--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.getIn
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:04
-- Luau version 6, Types version 3
-- Time taken: 0.000990 seconds

local get_upvr = require(script.Parent.get)
local None_upvr = require(script.Parent.Parent.None)
return function(arg1, arg2, arg3) -- Line 5
	--[[ Upvalues[2]:
		[1]: get_upvr (readonly)
		[2]: None_upvr (readonly)
	]]
	local const_number = 0
	local var5
	while const_number ~= #arg2 do
		var5 = get_upvr(var5, arg2[const_number + 1], None_upvr)
		if var5 == None_upvr then
			return arg3
		end
	end
	return var5
end