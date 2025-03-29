--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.flatten
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:03
-- Luau version 6, Types version 3
-- Time taken: 0.001155 seconds

local function flattenImpl_upvr(arg1, arg2) -- Line 4, Named "flattenImpl"
	--[[ Upvalues[1]:
		[1]: flattenImpl_upvr (readonly)
	]]
	local var9
	for i, v in arg1 do
		if type(v) == "table" and (not arg2 or 0 < arg2) then
			local var10 = arg2
			if var10 then
				var10 = arg2 - 1
			end
			for i_2, v_2 in pairs(var9) do
				flattenImpl_upvr(v, var10)[i_2] = v_2
				local var15
			end
			var9 = var15
		else
			var9[i] = v
		end
	end
	return var9
end
local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, arg2) -- Line 45, Named "flatten"
	--[[ Upvalues[2]:
		[1]: maybeFreeze_upvr (readonly)
		[2]: flattenImpl_upvr (readonly)
	]]
	return maybeFreeze_upvr(flattenImpl_upvr(arg1, arg2))
end