--[[
    Script: ReplicatedStorage.Packages.t
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:05
-- Luau version 6, Types version 3
-- Time taken: 0.014782 seconds

local module_2_upvr = {
	type = function(arg1) -- Line 5, Named "type"
		return function(arg1_2) -- Line 6
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			local type_result1 = type(arg1_2)
			if type_result1 == arg1 then
				return true
			end
			return false, string.format("%s expected, got %s", arg1, type_result1)
		end
	end;
	typeof = function(arg1) -- Line 16, Named "typeof"
		return function(arg1_3) -- Line 17
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			local typeof_result1_2 = typeof(arg1_3)
			if typeof_result1_2 == arg1 then
				return true
			end
			return false, string.format("%s expected, got %s", arg1, typeof_result1_2)
		end
	end;
	any = function(arg1) -- Line 34, Named "any"
		if arg1 ~= nil then
			return true
		end
		return false, "any expected, got nil"
	end;
	boolean = module_2_upvr.typeof("boolean");
	thread = module_2_upvr.typeof("thread");
	callback = module_2_upvr.typeof("function");
	["function"] = module_2_upvr.callback;
	none = module_2_upvr.typeof("nil");
	["nil"] = module_2_upvr.none;
	string = module_2_upvr.typeof("string");
	table = module_2_upvr.typeof("table");
	userdata = module_2_upvr.type("userdata");
	number = function(arg1) -- Line 116, Named "number"
		local typeof_result1_3 = typeof(arg1)
		if typeof_result1_3 == "number" then
			if arg1 == arg1 then
				return true
			end
			return false, "unexpected NaN value"
		end
		return false, string.format("number expected, got %s", typeof_result1_3)
	end;
	nan = function(arg1) -- Line 136, Named "nan"
		local typeof_result1 = typeof(arg1)
		if typeof_result1 == "number" then
			if arg1 ~= arg1 then
				return true
			end
			return false, "unexpected non-NaN value"
		end
		return false, string.format("number expected, got %s", typeof_result1)
	end;
	Axes = module_2_upvr.typeof("Axes");
	BrickColor = module_2_upvr.typeof("BrickColor");
	CatalogSearchParams = module_2_upvr.typeof("CatalogSearchParams");
	CFrame = module_2_upvr.typeof("CFrame");
	Color3 = module_2_upvr.typeof("Color3");
	ColorSequence = module_2_upvr.typeof("ColorSequence");
	ColorSequenceKeypoint = module_2_upvr.typeof("ColorSequenceKeypoint");
	DateTime = module_2_upvr.typeof("DateTime");
	DockWidgetPluginGuiInfo = module_2_upvr.typeof("DockWidgetPluginGuiInfo");
	Enum = module_2_upvr.typeof("Enum");
	EnumItem = module_2_upvr.typeof("EnumItem");
	Enums = module_2_upvr.typeof("Enums");
	Faces = module_2_upvr.typeof("Faces");
	FloatCurveKey = module_2_upvr.typeof("FloatCurveKey");
	Font = module_2_upvr.typeof("Font");
	Instance = module_2_upvr.typeof("Instance");
	NumberRange = module_2_upvr.typeof("NumberRange");
	NumberSequence = module_2_upvr.typeof("NumberSequence");
	NumberSequenceKeypoint = module_2_upvr.typeof("NumberSequenceKeypoint");
	OverlapParams = module_2_upvr.typeof("OverlapParams");
	PathWaypoint = module_2_upvr.typeof("PathWaypoint");
	PhysicalProperties = module_2_upvr.typeof("PhysicalProperties");
	Random = module_2_upvr.typeof("Random");
	Ray = module_2_upvr.typeof("Ray");
	RaycastParams = module_2_upvr.typeof("RaycastParams");
	RaycastResult = module_2_upvr.typeof("RaycastResult");
	RBXScriptConnection = module_2_upvr.typeof("RBXScriptConnection");
	RBXScriptSignal = module_2_upvr.typeof("RBXScriptSignal");
	Rect = module_2_upvr.typeof("Rect");
	Region3 = module_2_upvr.typeof("Region3");
	Region3int16 = module_2_upvr.typeof("Region3int16");
	TweenInfo = module_2_upvr.typeof("TweenInfo");
	UDim = module_2_upvr.typeof("UDim");
	UDim2 = module_2_upvr.typeof("UDim2");
	Vector2 = module_2_upvr.typeof("Vector2");
	Vector2int16 = module_2_upvr.typeof("Vector2int16");
	Vector3 = module_2_upvr.typeof("Vector3");
	Vector3int16 = module_2_upvr.typeof("Vector3int16");
}
function module_2_upvr.literal(...) -- Line 500
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local arg_count = select('#', ...)
	if arg_count == 1 then
		local var12_upvr = ...
		return function(arg1) -- Line 504
			--[[ Upvalues[1]:
				[1]: var12_upvr (readonly)
			]]
			if arg1 ~= var12_upvr then
				return false, string.format("expected %s, got %s", tostring(var12_upvr), tostring(arg1))
			end
			return true
		end
	end
	var12_upvr = {}
	for i = 1, arg_count do
		var12_upvr[i] = module_2_upvr.literal(select(i, ...))
		local var14
	end
	return module_2_upvr.union(table.unpack(var14, 1, arg_count))
end
module_2_upvr.exactly = module_2_upvr.literal
function module_2_upvr.keyOf(arg1) -- Line 535
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local module_3 = {}
	local var18 = 0
	for i_2 in pairs(arg1) do
		var18 += 1
		module_3[var18] = i_2
	end
	return module_2_upvr.literal(table.unpack(module_3, 1, var18))
end
function module_2_upvr.valueOf(arg1) -- Line 553
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local module = {}
	local var27 = 0
	for _, v in pairs(arg1) do
		var27 += 1
		module[var27] = v
	end
	return module_2_upvr.literal(table.unpack(module, 1, var27))
end
function module_2_upvr.integer(arg1) -- Line 571
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local any_number_result1_3, any_number_result2_5 = module_2_upvr.number(arg1)
	if not any_number_result1_3 then
		return false, any_number_result2_5 or ""
	end
	if arg1 % 1 == 0 then
		return true
	end
	return false, string.format("integer expected, got %s", arg1)
end
function module_2_upvr.numberMin(arg1) -- Line 591
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	return function(arg1_4) -- Line 592
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_number_result1_2, any_number_result2 = module_2_upvr.number(arg1_4)
		if not any_number_result1_2 then
			return false, any_number_result2 or ""
		end
		if arg1 <= arg1_4 then
			return true
		end
		return false, string.format("number >= %s expected, got %s", arg1, arg1_4)
	end
end
function module_2_upvr.numberMax(arg1) -- Line 613
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	return function(arg1_5) -- Line 614
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_number_result1, any_number_result2_4 = module_2_upvr.number(arg1_5)
		if not any_number_result1 then
			return false, any_number_result2_4
		end
		if arg1_5 <= arg1 then
			return true
		end
		return false, string.format("number <= %s expected, got %s", arg1, arg1_5)
	end
end
function module_2_upvr.numberMinExclusive(arg1) -- Line 635
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	return function(arg1_6) -- Line 636
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_number_result1_4, any_number_result2_2 = module_2_upvr.number(arg1_6)
		if not any_number_result1_4 then
			return false, any_number_result2_2 or ""
		end
		if arg1 < arg1_6 then
			return true
		end
		return false, string.format("number > %s expected, got %s", arg1, arg1_6)
	end
end
function module_2_upvr.numberMaxExclusive(arg1) -- Line 657
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	return function(arg1_7) -- Line 658
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_number_result1_5, any_number_result2_3 = module_2_upvr.number(arg1_7)
		if not any_number_result1_5 then
			return false, any_number_result2_3 or ""
		end
		if arg1_7 < arg1 then
			return true
		end
		return false, string.format("number < %s expected, got %s", arg1, arg1_7)
	end
end
module_2_upvr.numberPositive = module_2_upvr.numberMinExclusive(0)
module_2_upvr.numberNegative = module_2_upvr.numberMaxExclusive(0)
function module_2_upvr.numberConstrained(arg1, arg2) -- Line 694
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	assert(module_2_upvr.number(arg1))
	assert(module_2_upvr.number(arg2))
	local any_numberMin_result1_upvr = module_2_upvr.numberMin(arg1)
	local any_numberMax_result1_upvr = module_2_upvr.numberMax(arg2)
	return function(arg1_8) -- Line 700
		--[[ Upvalues[2]:
			[1]: any_numberMin_result1_upvr (readonly)
			[2]: any_numberMax_result1_upvr (readonly)
		]]
		local var46_result1, var46_result2 = any_numberMin_result1_upvr(arg1_8)
		if not var46_result1 then
			return false, var46_result2 or ""
		end
		local any_numberMax_result1_upvr_result1, any_numberMax_result1_upvr_result2 = any_numberMax_result1_upvr(arg1_8)
		if not any_numberMax_result1_upvr_result1 then
			return false, any_numberMax_result1_upvr_result2 or ""
		end
		return true
	end
end
function module_2_upvr.numberConstrainedExclusive(arg1, arg2) -- Line 723
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	assert(module_2_upvr.number(arg1))
	assert(module_2_upvr.number(arg2))
	local any_numberMinExclusive_result1_upvr = module_2_upvr.numberMinExclusive(arg1)
	local any_numberMaxExclusive_result1_upvr = module_2_upvr.numberMaxExclusive(arg2)
	return function(arg1_9) -- Line 729
		--[[ Upvalues[2]:
			[1]: any_numberMinExclusive_result1_upvr (readonly)
			[2]: any_numberMaxExclusive_result1_upvr (readonly)
		]]
		local any_numberMinExclusive_result1_upvr_result1, any_numberMinExclusive_result1_upvr_result2 = any_numberMinExclusive_result1_upvr(arg1_9)
		if not any_numberMinExclusive_result1_upvr_result1 then
			return false, any_numberMinExclusive_result1_upvr_result2 or ""
		end
		local any_numberMaxExclusive_result1_upvr_result1, any_numberMaxExclusive_result1_upvr_result2 = any_numberMaxExclusive_result1_upvr(arg1_9)
		if not any_numberMaxExclusive_result1_upvr_result1 then
			return false, any_numberMaxExclusive_result1_upvr_result2 or ""
		end
		return true
	end
end
function module_2_upvr.match(arg1) -- Line 751
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	assert(module_2_upvr.string(arg1))
	return function(arg1_10) -- Line 753
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_string_result1, any_string_result2 = module_2_upvr.string(arg1_10)
		if not any_string_result1 then
			return false, any_string_result2
		end
		if string.match(arg1_10, arg1) == nil then
			return false, string.format("%q failed to match pattern %q", arg1_10, arg1)
		end
		return true
	end
end
function module_2_upvr.optional(arg1) -- Line 774
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	assert(module_2_upvr.callback(arg1))
	return function(arg1_11) -- Line 776
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_11 == nil then
			return true
		end
		local arg1_result1_3, arg1_result2 = arg1(arg1_11)
		if arg1_result1_3 then
			return true
		end
		return false, string.format("(optional) %s", arg1_result2 or "")
	end
end
function module_2_upvr.tuple(...) -- Line 797
	local args_list_upvr_2 = {...}
	return function(...) -- Line 799
		--[[ Upvalues[1]:
			[1]: args_list_upvr_2 (readonly)
		]]
		for i_4, v_2 in ipairs(args_list_upvr_2) do
			local v_2_result1, v_2_result2 = v_2(({...})[i_4])
			if v_2_result1 == false then
				return false, string.format("Bad tuple index #%s:\n\t%s", i_4, v_2_result2 or "")
			end
		end
		return true
	end
end
function module_2_upvr.keys(arg1) -- Line 819
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	assert(module_2_upvr.callback(arg1))
	return function(arg1_12) -- Line 821
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_table_result1_4, any_table_result2_4 = module_2_upvr.table(arg1_12)
		if any_table_result1_4 == false then
			return false, any_table_result2_4 or ""
		end
		for i_5 in pairs(arg1_12) do
			local arg1_result1, arg1_result2_3 = arg1(i_5)
			if arg1_result1 == false then
				return false, string.format("bad key %s:\n\t%s", tostring(i_5), arg1_result2_3 or "")
			end
		end
		return true
	end
end
function module_2_upvr.values(arg1) -- Line 845
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	assert(module_2_upvr.callback(arg1))
	return function(arg1_13) -- Line 847
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_table_result1_3, any_table_result2_2 = module_2_upvr.table(arg1_13)
		if any_table_result1_3 == false then
			return false, any_table_result2_2 or ""
		end
		for i_6, v_3 in pairs(arg1_13) do
			local arg1_result1_2, arg1_result2_2 = arg1(v_3)
			if arg1_result1_2 == false then
				return false, string.format("bad value for key %s:\n\t%s", tostring(i_6), arg1_result2_2 or "")
			end
		end
		return true
	end
end
function module_2_upvr.map(arg1, arg2) -- Line 872
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	assert(module_2_upvr.callback(arg1))
	assert(module_2_upvr.callback(arg2))
	local any_keys_result1_upvr_2 = module_2_upvr.keys(arg1)
	local any_values_result1_upvr_2 = module_2_upvr.values(arg2)
	return function(arg1_14) -- Line 878
		--[[ Upvalues[2]:
			[1]: any_keys_result1_upvr_2 (readonly)
			[2]: any_values_result1_upvr_2 (readonly)
		]]
		local any_keys_result1_upvr_2_result1, var95_result2 = any_keys_result1_upvr_2(arg1_14)
		if not any_keys_result1_upvr_2_result1 then
			return false, var95_result2 or ""
		end
		local var96_result1, var96_result2 = any_values_result1_upvr_2(arg1_14)
		if not var96_result1 then
			return false, var96_result2 or ""
		end
		return true
	end
end
function module_2_upvr.set(arg1) -- Line 900
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	return module_2_upvr.map(arg1, module_2_upvr.literal(true))
end
local any_keys_result1_upvr = module_2_upvr.keys(module_2_upvr.integer)
function module_2_upvr.array(arg1) -- Line 913
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: any_keys_result1_upvr (readonly)
	]]
	assert(module_2_upvr.callback(arg1))
	local any_values_result1_upvr = module_2_upvr.values(arg1)
	return function(arg1_15) -- Line 917
		--[[ Upvalues[2]:
			[1]: any_keys_result1_upvr (copied, readonly)
			[2]: any_values_result1_upvr (readonly)
		]]
		local var101_result1, any_keys_result1_upvr_result2 = any_keys_result1_upvr(arg1_15)
		local var110
		if var101_result1 == false then
			var110 = false
			return var110, string.format("[array] %s", any_keys_result1_upvr_result2 or "")
		end
		var110 = 0
		for _ in ipairs(arg1_15) do
			var110 += 1
		end
		for i_8 in pairs(arg1_15) do
			if i_8 < 1 or var110 < i_8 then
				return false, string.format("[array] key %s must be sequential", tostring(i_8))
			end
		end
		local any_values_result1_upvr_result1, any_values_result1_upvr_result2 = any_values_result1_upvr(arg1_15)
		if not any_values_result1_upvr_result1 then
			i_8 = string.format("[array] %s", any_values_result1_upvr_result2 or "")
			return false, i_8
		end
		return true
	end
end
function module_2_upvr.strictArray(...) -- Line 953
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: any_keys_result1_upvr (readonly)
	]]
	local args_list_upvr_3 = {...}
	assert(module_2_upvr.array(module_2_upvr.callback)(args_list_upvr_3))
	return function(arg1) -- Line 957
		--[[ Upvalues[2]:
			[1]: any_keys_result1_upvr (copied, readonly)
			[2]: args_list_upvr_3 (readonly)
		]]
		local any_keys_result1_upvr_result1, var101_result2 = any_keys_result1_upvr(arg1)
		if any_keys_result1_upvr_result1 == false then
			return false, string.format("[strictArray] %s", var101_result2 or "")
		end
		if #args_list_upvr_3 < #arg1 then
			return false, string.format("[strictArray] Array size exceeds limit of %d", #args_list_upvr_3)
		end
		for i_9, v_4 in pairs(args_list_upvr_3) do
			local v_4_result1, v_4_result2 = v_4(arg1[i_9])
			if not v_4_result1 then
				return false, string.format("[strictArray] Array index #%d - %s", i_9, v_4_result2)
			end
		end
		return true
	end
end
any_keys_result1_upvr = module_2_upvr.array(module_2_upvr.callback)
local var130_upvr = any_keys_result1_upvr
function module_2_upvr.union(...) -- Line 989
	--[[ Upvalues[1]:
		[1]: var130_upvr (readonly)
	]]
	local args_list_upvr_4 = {...}
	assert(var130_upvr(args_list_upvr_4))
	return function(arg1) -- Line 993
		--[[ Upvalues[1]:
			[1]: args_list_upvr_4 (readonly)
		]]
		for _, v_5 in ipairs(args_list_upvr_4) do
			if v_5(arg1) then
				return true
			end
		end
		return false, "bad type for union"
	end
end
module_2_upvr.some = module_2_upvr.union
function module_2_upvr.intersection(...) -- Line 1016
	--[[ Upvalues[1]:
		[1]: var130_upvr (readonly)
	]]
	local args_list_upvr = {...}
	assert(var130_upvr(args_list_upvr))
	return function(arg1) -- Line 1020
		--[[ Upvalues[1]:
			[1]: args_list_upvr (readonly)
		]]
		for _, v_6 in ipairs(args_list_upvr) do
			local v_6_result1, v_6_result2 = v_6(arg1)
			if not v_6_result1 then
				return false, v_6_result2 or ""
			end
		end
		return true
	end
end
module_2_upvr.every = module_2_upvr.intersection
var130_upvr = module_2_upvr.map(module_2_upvr.any, module_2_upvr.callback)
local strict_upvr = var130_upvr
function module_2_upvr.interface(arg1) -- Line 1047
	--[[ Upvalues[2]:
		[1]: strict_upvr (readonly)
		[2]: module_2_upvr (readonly)
	]]
	assert(strict_upvr(arg1))
	return function(arg1_16) -- Line 1049
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_table_result1, any_table_result2 = module_2_upvr.table(arg1_16)
		if any_table_result1 == false then
			return false, any_table_result2 or ""
		end
		for i_12, v_7 in pairs(arg1) do
			local v_7_result1, v_7_result2 = v_7(arg1_16[i_12])
			if v_7_result1 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i_12), v_7_result2 or "")
			end
		end
		return true
	end
end
function module_2_upvr.strictInterface(arg1) -- Line 1073
	--[[ Upvalues[2]:
		[1]: strict_upvr (readonly)
		[2]: module_2_upvr (readonly)
	]]
	assert(strict_upvr(arg1))
	return function(arg1_17) -- Line 1075
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_table_result1_2, any_table_result2_3 = module_2_upvr.table(arg1_17)
		if any_table_result1_2 == false then
			return false, any_table_result2_3 or ""
		end
		for i_13, v_8 in pairs(arg1) do
			local v_8_result1, v_8_result2 = v_8(arg1_17[i_13])
			if v_8_result1 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i_13), v_8_result2 or "")
			end
		end
		for i_14 in pairs(arg1_17) do
			if not arg1[i_14] then
				return false, string.format("[interface] unexpected field %q", tostring(i_14))
			end
		end
		return true
	end
end
function strict_upvr(arg1, arg2) -- Line 1106, Named "instanceOf"
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	assert(module_2_upvr.string(arg1))
	local var172_upvw
	if arg2 ~= nil then
		var172_upvw = module_2_upvr.children(arg2)
	end
	return function(arg1_18) -- Line 1114
		--[[ Upvalues[3]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: var172_upvw (read and write)
		]]
		local any_Instance_result1_4, any_Instance_result2_4 = module_2_upvr.Instance(arg1_18)
		if not any_Instance_result1_4 then
			return false, any_Instance_result2_4 or ""
		end
		if arg1_18.ClassName ~= arg1 then
			return false, string.format("%s expected, got %s", arg1, arg1_18.ClassName)
		end
		if var172_upvw then
			local var172_upvw_result1_2, var172_result2 = var172_upvw(arg1_18)
			if not var172_upvw_result1_2 then
				return false, var172_result2
			end
		end
		return true
	end
end
module_2_upvr.instanceOf = strict_upvr
strict_upvr = module_2_upvr.instanceOf
module_2_upvr.instance = strict_upvr
function strict_upvr(arg1, arg2) -- Line 1144, Named "instanceIsA"
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	assert(module_2_upvr.string(arg1))
	local var182_upvw
	if arg2 ~= nil then
		var182_upvw = module_2_upvr.children(arg2)
	end
	return function(arg1_19) -- Line 1152
		--[[ Upvalues[3]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: var182_upvw (read and write)
		]]
		local any_Instance_result1_5, any_Instance_result2 = module_2_upvr.Instance(arg1_19)
		if not any_Instance_result1_5 then
			return false, any_Instance_result2 or ""
		end
		if not arg1_19:IsA(arg1) then
			return false, string.format("%s expected, got %s", arg1, arg1_19.ClassName)
		end
		if var182_upvw then
			local var182_result1, var182_result2_2 = var182_upvw(arg1_19)
			if not var182_result1 then
				return false, var182_result2_2
			end
		end
		return true
	end
end
module_2_upvr.instanceIsA = strict_upvr
function strict_upvr(arg1) -- Line 1180, Named "enum"
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	assert(module_2_upvr.Enum(arg1))
	return function(arg1_20) -- Line 1182
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_EnumItem_result1, any_EnumItem_result2 = module_2_upvr.EnumItem(arg1_20)
		if not any_EnumItem_result1 then
			return false, any_EnumItem_result2
		end
		if arg1_20.EnumType == arg1 then
			return true
		end
		return false, string.format("enum of %s expected, got enum of %s", tostring(arg1), tostring(arg1_20.EnumType))
	end
end
module_2_upvr.enum = strict_upvr
strict_upvr = module_2_upvr.tuple(module_2_upvr.callback, module_2_upvr.callback)
function module_2_upvr.wrap(arg1, arg2) -- Line 1207
	--[[ Upvalues[1]:
		[1]: strict_upvr (readonly)
	]]
	assert(strict_upvr(arg1, arg2))
	return function(...) -- Line 1209
		--[[ Upvalues[2]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
		]]
		assert(arg2(...))
		return arg1(...)
	end
end
function strict_upvr(arg1) -- Line 1223, Named "strict"
	return function(...) -- Line 1224
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		assert(arg1(...))
	end
end
module_2_upvr.strict = strict_upvr
strict_upvr = module_2_upvr.map(module_2_upvr.string, module_2_upvr.callback)
function module_2_upvr.children(arg1) -- Line 1243
	--[[ Upvalues[2]:
		[1]: strict_upvr (readonly)
		[2]: module_2_upvr (readonly)
	]]
	assert(strict_upvr(arg1))
	return function(arg1_21) -- Line 1246
		--[[ Upvalues[2]:
			[1]: module_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_Instance_result1, any_Instance_result2_2 = module_2_upvr.Instance(arg1_21)
		if not any_Instance_result1 then
			return false, any_Instance_result2_2 or ""
		end
		local tbl = {}
		for _, v_9 in ipairs(arg1_21:GetChildren()) do
			local Name = v_9.Name
			if arg1[Name] then
				if tbl[Name] then
					return false, string.format("Cannot process multiple children with the same name %q", Name)
				end
				tbl[Name] = v_9
			end
		end
		for i_16, v_10 in pairs(arg1) do
			local v_10_result1, v_10_result2 = v_10(tbl[i_16])
			if not v_10_result1 then
				return false, string.format("[%s.%s] %s", arg1_21:GetFullName(), i_16, v_10_result2 or "")
			end
		end
		return true
	end
end
return module_2_upvr