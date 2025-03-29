--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.is
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:40
-- Luau version 6, Types version 3
-- Time taken: 0.001497 seconds

local isValueObject_upvr = require(script.Parent.isValueObject)
return function(arg1, arg2) -- Line 4
	--[[ Upvalues[1]:
		[1]: isValueObject_upvr (readonly)
	]]
	if arg1 == arg2 or arg1 ~= arg1 and arg2 ~= arg2 then
		return true
	end
	if not arg1 or not arg2 then
		return false
	end
	if typeof(arg1) == "function" and typeof(arg2) == "function" then
		local arg1_result1_2 = arg1()
		local arg2_result1_2 = arg2()
		if arg1_result1_2 == arg2_result1_2 or arg1_result1_2 ~= arg1_result1_2 and arg2_result1_2 ~= arg2_result1_2 then
			return true
		end
		if not arg1_result1_2 or not arg2_result1_2 then
			return false
		end
	end
	local var2_result1 = isValueObject_upvr(arg1_result1_2)
	if var2_result1 then
		var2_result1 = isValueObject_upvr(arg2_result1_2)
		if var2_result1 then
			var2_result1 = arg1_result1_2.equals(arg2_result1_2)
		end
	end
	return not not var2_result1
end