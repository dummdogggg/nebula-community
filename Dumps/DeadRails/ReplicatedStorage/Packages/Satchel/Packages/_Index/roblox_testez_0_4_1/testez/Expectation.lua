--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.roblox_testez@0.4.1.testez.Expectation
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:11
-- Luau version 6, Types version 3
-- Time taken: 0.009263 seconds

local module_upvr = {}
local tbl_upvr_2 = {
	to = true;
	be = true;
	been = true;
	have = true;
	was = true;
	at = true;
}
local tbl_upvr = {
	never = true;
}
local function _(arg1, arg2, arg3) -- Line 42, Named "assertLevel"
	if not arg1 then
		error(arg2 or "Assertion failed!", (arg3 or 1) + 1)
	end
end
local function _(arg1, arg2) -- Line 54, Named "bindSelf"
	return function(arg1_2, ...) -- Line 55
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		if arg1_2 == arg1 then
			return arg2(arg1, ...)
		end
		return arg2(arg1, arg1_2, ...)
	end
end
local function _(arg1, arg2, arg3) -- Line 64, Named "formatMessage"
	if arg1 then
		return arg2
	end
	return arg3
end
function module_upvr.new(arg1) -- Line 75
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local module_upvr_2 = {}
	module_upvr_2.value = arg1
	module_upvr_2.successCondition = true
	module_upvr_2.condition = false
	module_upvr_2.matchers = {}
	module_upvr_2._boundMatchers = {}
	setmetatable(module_upvr_2, module_upvr)
	local a_2_upvr = module_upvr_2.a
	function module_upvr_2.a(arg1_3, ...) -- Line 55
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (readonly)
			[2]: a_2_upvr (readonly)
		]]
		if arg1_3 == module_upvr_2 then
			return a_2_upvr(module_upvr_2, ...)
		end
		return a_2_upvr(module_upvr_2, arg1_3, ...)
	end
	module_upvr_2.an = module_upvr_2.a
	a_2_upvr = module_upvr_2.ok
	function module_upvr_2.ok(arg1_4, ...) -- Line 55
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (readonly)
			[2]: a_2_upvr (readonly)
		]]
		if arg1_4 == module_upvr_2 then
			return a_2_upvr(module_upvr_2, ...)
		end
		return a_2_upvr(module_upvr_2, arg1_4, ...)
	end
	a_2_upvr = module_upvr_2.equal
	function module_upvr_2.equal(arg1_5, ...) -- Line 55
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (readonly)
			[2]: a_2_upvr (readonly)
		]]
		if arg1_5 == module_upvr_2 then
			return a_2_upvr(module_upvr_2, ...)
		end
		return a_2_upvr(module_upvr_2, arg1_5, ...)
	end
	a_2_upvr = module_upvr_2.throw
	function module_upvr_2.throw(arg1_6, ...) -- Line 55
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (readonly)
			[2]: a_2_upvr (readonly)
		]]
		if arg1_6 == module_upvr_2 then
			return a_2_upvr(module_upvr_2, ...)
		end
		return a_2_upvr(module_upvr_2, arg1_6, ...)
	end
	a_2_upvr = module_upvr_2.near
	function module_upvr_2.near(arg1_7, ...) -- Line 55
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (readonly)
			[2]: a_2_upvr (readonly)
		]]
		if arg1_7 == module_upvr_2 then
			return a_2_upvr(module_upvr_2, ...)
		end
		return a_2_upvr(module_upvr_2, arg1_7, ...)
	end
	return module_upvr_2
end
function module_upvr.checkMatcherNameCollisions(arg1) -- Line 96
	--[[ Upvalues[3]:
		[1]: tbl_upvr_2 (readonly)
		[2]: tbl_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	if tbl_upvr_2[arg1] or tbl_upvr[arg1] or module_upvr[arg1] then
		return false
	end
	return true
end
function module_upvr.extend(arg1, arg2) -- Line 104
	local var16 = arg2
	if not var16 then
		var16 = {}
	end
	arg1.matchers = var16
	local pairs_result1, pairs_result2, pairs_result3 = pairs(arg1.matchers)
	for i, v_upvr in pairs_result1, pairs_result2, pairs_result3 do
		local function var20_upvr(arg1_8, ...) -- Line 108
			--[[ Upvalues[2]:
				[1]: v_upvr (readonly)
				[2]: arg1 (readonly)
			]]
			local value = arg1.value
			local v_result1 = v_upvr(value, ...)
			if v_result1.pass ~= arg1.successCondition then
				value = false
			else
				value = true
			end
			if not value then
				error(v_result1.message or "Assertion failed!", (3 or 1) + 1)
			end
			arg1:_resetModifiers()
			return arg1
		end
		arg1._boundMatchers[i] = function(arg1_9, ...) -- Line 55
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: var20_upvr (readonly)
			]]
			if arg1_9 == arg1 then
				return var20_upvr(arg1, ...)
			end
			return var20_upvr(arg1, arg1_9, ...)
		end
	end
	return arg1
end
function module_upvr.__index(arg1, arg2) -- Line 121
	--[[ Upvalues[3]:
		[1]: tbl_upvr_2 (readonly)
		[2]: tbl_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	if tbl_upvr_2[arg2] then
		return arg1
	end
	if tbl_upvr[arg2] then
		local any_extend_result1 = module_upvr.new(arg1.value):extend(arg1.matchers)
		any_extend_result1.successCondition = not arg1.successCondition
		return any_extend_result1
	end
	if arg1._boundMatchers[arg2] then
		return arg1._boundMatchers[arg2]
	end
	return module_upvr[arg2]
end
function module_upvr._resetModifiers(arg1) -- Line 154
	arg1.successCondition = true
end
function module_upvr.a(arg1, arg2) -- Line 163
	-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
	local var25
	if type(arg1.value) ~= arg2 then
		var25 = false
	else
		var25 = true
	end
	if var25 ~= arg1.successCondition then
		-- KONSTANTWARNING: GOTO [16] #12
	end
	-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 11. Error Block 28 start (CF ANALYSIS FAILED)
	if arg1.successCondition then
		var25 = "Expected value of type %q, got value %q of type %s":format(arg2, tostring(arg1.value), type(arg1.value))
	else
		var25 = "Expected value not of type %q, got value %q of type %s":format(arg2, tostring(arg1.value), type(arg1.value))
	end
	if not true then
		error(var25 or "Assertion failed!", (3 or 1) + 1)
	end
	arg1:_resetModifiers()
	do
		return arg1
	end
	-- KONSTANTERROR: [15] 11. Error Block 28 end (CF ANALYSIS FAILED)
end
module_upvr.an = module_upvr.a
function module_upvr.ok(arg1) -- Line 191
	-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
	local var26
	if arg1.value == nil then
		var26 = false
	else
		var26 = true
	end
	if var26 ~= arg1.successCondition then
		-- KONSTANTWARNING: GOTO [12] #9
	end
	-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 8. Error Block 28 start (CF ANALYSIS FAILED)
	if arg1.successCondition then
		var26 = "Expected value %q to be non-nil":format(tostring(arg1.value))
	else
		var26 = "Expected value %q to be nil":format(tostring(arg1.value))
	end
	if not true then
		error(var26 or "Assertion failed!", (3 or 1) + 1)
	end
	arg1:_resetModifiers()
	do
		return arg1
	end
	-- KONSTANTERROR: [11] 8. Error Block 28 end (CF ANALYSIS FAILED)
end
function module_upvr.equal(arg1, arg2) -- Line 212
	-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
	local var27
	if arg1.value ~= arg2 then
		var27 = false
	else
		var27 = true
	end
	if var27 ~= arg1.successCondition then
		-- KONSTANTWARNING: GOTO [12] #9
	end
	-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 8. Error Block 28 start (CF ANALYSIS FAILED)
	if arg1.successCondition then
		var27 = "Expected value %q (%s), got %q (%s) instead":format(tostring(arg2), type(arg2), tostring(arg1.value), type(arg1.value))
	else
		var27 = "Expected anything but value %q (%s)":format(tostring(arg2), type(arg2))
	end
	if not true then
		error(var27 or "Assertion failed!", (3 or 1) + 1)
	end
	arg1:_resetModifiers()
	do
		return arg1
	end
	-- KONSTANTERROR: [11] 8. Error Block 28 end (CF ANALYSIS FAILED)
end
function module_upvr.near(arg1, arg2, arg3) -- Line 238
	-- KONSTANTERROR: [0] 1. Error Block 50 start (CF ANALYSIS FAILED)
	local var28
	if type(arg1.value) ~= "number" then
		var28 = false
	else
		var28 = true
	end
	assert(var28, "Expectation value must be a number to use 'near'")
	if type(arg2) ~= "number" then
		var28 = false
	else
		var28 = true
	end
	assert(var28, "otherValue must be a number")
	var28 = true
	if type(arg3) ~= "number" then
		if arg3 ~= nil then
			var28 = false
		else
			var28 = true
		end
	end
	assert(var28, "limit must be a number or nil")
	if math.abs(arg1.value - arg2) > (arg3 or 1e-07) then
		var28 = false
		-- KONSTANTWARNING: GOTO [61] #45
	end
	-- KONSTANTERROR: [0] 1. Error Block 50 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [60] 44. Error Block 48 start (CF ANALYSIS FAILED)
	var28 = true
	if var28 ~= arg1.successCondition then
		-- KONSTANTWARNING: GOTO [67] #49
	end
	-- KONSTANTERROR: [60] 44. Error Block 48 end (CF ANALYSIS FAILED)
end
function module_upvr.throw(arg1, arg2) -- Line 271
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [69] 56. Error Block 25 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [69] 56. Error Block 25 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 56 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [69.2]
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [69.4110419533]
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [69.5]
	if nil == nil then
	else
	end
	if arg2 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not nil then
			if nil then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if nil == nil then
				else
				end
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if nil ~= nil then
				else
				end
			end
		end
	end
	if arg2 then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [69.3]
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [69.10]
			return nil
		end
		if not nil or not INLINED_2() then
		end
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [69.6]
		if nil then
		else
		end
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if arg1.successCondition then
		else
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 56 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [86] 70. Error Block 39 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [86.4]
	if not nil then
		error("Expected function to succeed, but it threw an error: %s":format(tostring(nil)) or "Assertion failed!", (3 or 1) + 1)
	end
	arg1:_resetModifiers()
	do
		return arg1
	end
	-- KONSTANTERROR: [86] 70. Error Block 39 end (CF ANALYSIS FAILED)
end
return module_upvr