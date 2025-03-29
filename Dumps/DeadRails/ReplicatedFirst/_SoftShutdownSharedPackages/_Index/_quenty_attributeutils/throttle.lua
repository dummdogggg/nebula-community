--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.throttle
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:57
-- Luau version 6, Types version 3
-- Time taken: 0.000836 seconds

local var1_upvr = require(script.Parent.loader).load(script)("ThrottledFunction")
return function(arg1, arg2, arg3) -- Line 21, Named "throttle"
	--[[ Upvalues[1]:
		[1]: var1_upvr (readonly)
	]]
	local var3
	if type(arg1) ~= "number" then
		var3 = false
	else
		var3 = true
	end
	assert(var3, "timeoutInSeconds is not a number")
	if type(arg2) ~= "function" then
		var3 = false
	else
		var3 = true
	end
	assert(var3, "func is not a function")
	var3 = var1_upvr
	var3 = arg1
	local any_new_result1_upvr = var3.new(var3, arg2, arg3)
	function var3(...) -- Line 27
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:Call(...)
	end
	return var3
end