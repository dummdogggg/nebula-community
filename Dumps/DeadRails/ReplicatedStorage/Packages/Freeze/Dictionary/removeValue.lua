--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.removeValue
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:33
-- Luau version 6, Types version 3
-- Time taken: 0.000629 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, arg2) -- Line 14, Named "removeValue"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	local var6
	for i, v in arg1 do
		if v == arg2 then
		else
			({})[i] = v
		end
	end
	if nil then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return maybeFreeze_upvr({})
	end
	return arg1
end