--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.ValueBaseUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:46
-- Luau version 6, Types version 3
-- Time taken: 0.003721 seconds

local module_upvr = {
	isValueBase = function(arg1) -- Line 8, Named "isValueBase"
		local var2 = false
		if typeof(arg1) == "Instance" then
			if arg1.ClassName:sub(-5) ~= "Value" then
				var2 = false
			else
				var2 = true
			end
		end
		return var2
	end;
	getOrCreateValue = function(arg1, arg2, arg3, arg4) -- Line 12, Named "getOrCreateValue"
		-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
		local var3
		if typeof(arg1) ~= "Instance" then
			var3 = false
		else
			var3 = true
		end
		assert(var3, "Bad argument 'parent'")
		if type(arg2) ~= "string" then
			var3 = false
			-- KONSTANTWARNING: GOTO [24] #19
		end
		-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [23] 18. Error Block 30 start (CF ANALYSIS FAILED)
		var3 = true
		assert(var3, "Bad argument 'instanceType'")
		if type(arg3) ~= "string" then
			var3 = false
		else
			var3 = true
		end
		assert(var3, "Bad argument 'name'")
		local SOME = arg1:FindFirstChild(arg3)
		if SOME then
			var3 = SOME:IsA(arg2)
			if not var3 then
				var3 = warn
				var3("[ValueBaseUtils.getOrCreateValue] - Value of type %q of name %q is of type %q in %s instead":format(arg2, arg3, SOME.ClassName, SOME:GetFullName()))
			end
			return SOME
		end
		var3 = Instance.new(arg2)
		var3.Name = arg3
		var3.Value = arg4
		var3.Parent = arg1
		do
			return var3
		end
		-- KONSTANTERROR: [23] 18. Error Block 30 end (CF ANALYSIS FAILED)
	end;
	setValue = function(arg1, arg2, arg3, arg4) -- Line 35, Named "setValue"
		-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
		local var5
		if typeof(arg1) ~= "Instance" then
			var5 = false
		else
			var5 = true
		end
		assert(var5, "Bad argument 'parent'")
		if type(arg2) ~= "string" then
			var5 = false
			-- KONSTANTWARNING: GOTO [24] #19
		end
		-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [23] 18. Error Block 30 start (CF ANALYSIS FAILED)
		var5 = true
		assert(var5, "Bad argument 'instanceType'")
		if type(arg3) ~= "string" then
			var5 = false
		else
			var5 = true
		end
		assert(var5, "Bad argument 'name'")
		local SOME_2 = arg1:FindFirstChild(arg3)
		if SOME_2 then
			var5 = SOME_2:IsA(arg2)
			if not var5 then
				var5 = warn
				var5("[ValueBaseUtils.setValue] - Value of type %q of name %q is of type %q in %s instead":format(arg2, arg3, SOME_2.ClassName, SOME_2:GetFullName()))
			end
			SOME_2.Value = arg4
		else
			var5 = Instance.new(arg2)
			var5.Name = arg3
			var5.Value = arg4
			var5.Parent = arg1
			-- KONSTANTERROR: [23] 18. Error Block 30 end (CF ANALYSIS FAILED)
		end
	end;
	getValue = function(arg1, arg2, arg3, arg4) -- Line 56, Named "getValue"
		-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
		local var7
		if typeof(arg1) ~= "Instance" then
			var7 = false
		else
			var7 = true
		end
		assert(var7, "Bad argument 'parent'")
		if type(arg2) ~= "string" then
			var7 = false
			-- KONSTANTWARNING: GOTO [24] #19
		end
		-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [23] 18. Error Block 30 start (CF ANALYSIS FAILED)
		var7 = true
		assert(var7, "Bad argument 'instanceType'")
		if type(arg3) ~= "string" then
			var7 = false
		else
			var7 = true
		end
		assert(var7, "Bad argument 'name'")
		local SOME_3 = arg1:FindFirstChild(arg3)
		if SOME_3 then
			var7 = SOME_3:IsA(arg2)
			if var7 then
				var7 = SOME_3.Value
				return var7
			end
			var7 = warn
			var7("[ValueBaseUtils.getValue] - Value of type %q of name %q is of type %q in %s instead":format(arg2, arg3, SOME_3.ClassName, SOME_3:GetFullName()))
			var7 = nil
			return var7
		end
		do
			return arg4
		end
		-- KONSTANTERROR: [23] 18. Error Block 30 end (CF ANALYSIS FAILED)
	end;
}
function module_upvr.createGetSet(arg1, arg2) -- Line 75
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var12
	if type(arg1) ~= "string" then
		var12 = false
	else
		var12 = true
	end
	assert(var12, "Bad argument 'instanceType'")
	if type(arg2) ~= "string" then
		var12 = false
	else
		var12 = true
	end
	assert(var12, "Bad argument 'name'")
	function var12(arg1_3, arg2_3) -- Line 83
		--[[ Upvalues[3]:
			[1]: module_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
		]]
		local var13
		if typeof(arg1_3) ~= "Instance" then
			var13 = false
		else
			var13 = true
		end
		assert(var13, "Bad argument 'parent'")
		var13 = module_upvr
		var13 = arg1_3
		return var13.setValue(var13, arg1, arg2, arg2_3)
	end
	return function(arg1_2, arg2_2) -- Line 79
		--[[ Upvalues[3]:
			[1]: module_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
		]]
		local var11
		if typeof(arg1_2) ~= "Instance" then
			var11 = false
		else
			var11 = true
		end
		assert(var11, "Bad argument 'parent'")
		var11 = module_upvr
		var11 = arg1_2
		return var11.getValue(var11, arg1, arg2, arg2_2)
	end, var12, function(arg1_4, arg2_4) -- Line 87
		--[[ Upvalues[3]:
			[1]: module_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
		]]
		return module_upvr.getOrCreateValue(arg1_4, arg1, arg2, arg2_4)
	end
end
return module_upvr