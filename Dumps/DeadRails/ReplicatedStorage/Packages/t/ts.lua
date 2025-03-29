--[[
    Script: ReplicatedStorage.Packages.t.ts
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:57
-- Luau version 6, Types version 3
-- Time taken: 0.011619 seconds

local tbl_upvr = {
	type = function(arg1) -- Line 5, Named "type"
		return function(arg1_2) -- Line 6
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if type(arg1_2) == arg1 then
				return true
			end
			return false
		end
	end;
	typeof = function(arg1) -- Line 16, Named "typeof"
		return function(arg1_3) -- Line 17
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if typeof(arg1_3) == arg1 then
				return true
			end
			return false
		end
	end;
	any = function(arg1) -- Line 34, Named "any"
		if arg1 ~= nil then
			return true
		end
		return false
	end;
	boolean = tbl_upvr.typeof("boolean");
	thread = tbl_upvr.typeof("thread");
	callback = tbl_upvr.typeof("function");
	["function"] = tbl_upvr.callback;
	none = tbl_upvr.typeof("nil");
	["nil"] = tbl_upvr.none;
	string = tbl_upvr.typeof("string");
	table = tbl_upvr.typeof("table");
	userdata = tbl_upvr.type("userdata");
	number = function(arg1) -- Line 116, Named "number"
		if typeof(arg1) == "number" then
			if arg1 == arg1 then
				return true
			end
			return false
		end
		return false
	end;
	nan = function(arg1) -- Line 136, Named "nan"
		if typeof(arg1) == "number" then
			if arg1 ~= arg1 then
				return true
			end
			return false
		end
		return false
	end;
	Axes = tbl_upvr.typeof("Axes");
	BrickColor = tbl_upvr.typeof("BrickColor");
	CatalogSearchParams = tbl_upvr.typeof("CatalogSearchParams");
	CFrame = tbl_upvr.typeof("CFrame");
	Color3 = tbl_upvr.typeof("Color3");
	ColorSequence = tbl_upvr.typeof("ColorSequence");
	ColorSequenceKeypoint = tbl_upvr.typeof("ColorSequenceKeypoint");
	DateTime = tbl_upvr.typeof("DateTime");
	DockWidgetPluginGuiInfo = tbl_upvr.typeof("DockWidgetPluginGuiInfo");
	Enum = tbl_upvr.typeof("Enum");
	EnumItem = tbl_upvr.typeof("EnumItem");
	Enums = tbl_upvr.typeof("Enums");
	Faces = tbl_upvr.typeof("Faces");
	FloatCurveKey = tbl_upvr.typeof("FloatCurveKey");
	Font = tbl_upvr.typeof("Font");
	Instance = tbl_upvr.typeof("Instance");
	NumberRange = tbl_upvr.typeof("NumberRange");
	NumberSequence = tbl_upvr.typeof("NumberSequence");
	NumberSequenceKeypoint = tbl_upvr.typeof("NumberSequenceKeypoint");
	OverlapParams = tbl_upvr.typeof("OverlapParams");
	PathWaypoint = tbl_upvr.typeof("PathWaypoint");
	PhysicalProperties = tbl_upvr.typeof("PhysicalProperties");
	Random = tbl_upvr.typeof("Random");
	Ray = tbl_upvr.typeof("Ray");
	RaycastParams = tbl_upvr.typeof("RaycastParams");
	RaycastResult = tbl_upvr.typeof("RaycastResult");
	RBXScriptConnection = tbl_upvr.typeof("RBXScriptConnection");
	RBXScriptSignal = tbl_upvr.typeof("RBXScriptSignal");
	Rect = tbl_upvr.typeof("Rect");
	Region3 = tbl_upvr.typeof("Region3");
	Region3int16 = tbl_upvr.typeof("Region3int16");
	TweenInfo = tbl_upvr.typeof("TweenInfo");
	UDim = tbl_upvr.typeof("UDim");
	UDim2 = tbl_upvr.typeof("UDim2");
	Vector2 = tbl_upvr.typeof("Vector2");
	Vector2int16 = tbl_upvr.typeof("Vector2int16");
	Vector3 = tbl_upvr.typeof("Vector3");
	Vector3int16 = tbl_upvr.typeof("Vector3int16");
}
function tbl_upvr.literal(...) -- Line 500
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local arg_count = select('#', ...)
	if arg_count == 1 then
		local var8_upvr = ...
		return function(arg1) -- Line 504
			--[[ Upvalues[1]:
				[1]: var8_upvr (readonly)
			]]
			if arg1 ~= var8_upvr then
				return false
			end
			return true
		end
	end
	var8_upvr = {}
	for i = 1, arg_count do
		var8_upvr[i] = tbl_upvr.literal(select(i, ...))
		local var10
	end
	return tbl_upvr.union(table.unpack(var10, 1, arg_count))
end
tbl_upvr.exactly = tbl_upvr.literal
function tbl_upvr.keyOf(arg1) -- Line 535
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local module_2 = {}
	local var14 = 0
	for i_2 in pairs(arg1) do
		var14 += 1
		module_2[var14] = i_2
	end
	return tbl_upvr.literal(table.unpack(module_2, 1, var14))
end
function tbl_upvr.valueOf(arg1) -- Line 553
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local module = {}
	local var23 = 0
	for _, v in pairs(arg1) do
		var23 += 1
		module[var23] = v
	end
	return tbl_upvr.literal(table.unpack(module, 1, var23))
end
function tbl_upvr.integer(arg1) -- Line 571
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	if not tbl_upvr.number(arg1) then
		return false
	end
	if arg1 % 1 == 0 then
		return true
	end
	return false
end
function tbl_upvr.numberMin(arg1) -- Line 591
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	return function(arg1_4) -- Line 592
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if not tbl_upvr.number(arg1_4) then
			return false
		end
		if arg1 <= arg1_4 then
			return true
		end
		return false
	end
end
function tbl_upvr.numberMax(arg1) -- Line 613
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	return function(arg1_5) -- Line 614
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if not tbl_upvr.number(arg1_5) then
			return false
		end
		if arg1_5 <= arg1 then
			return true
		end
		return false
	end
end
function tbl_upvr.numberMinExclusive(arg1) -- Line 635
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	return function(arg1_6) -- Line 636
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if not tbl_upvr.number(arg1_6) then
			return false
		end
		if arg1 < arg1_6 then
			return true
		end
		return false
	end
end
function tbl_upvr.numberMaxExclusive(arg1) -- Line 657
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	return function(arg1_7) -- Line 658
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if not tbl_upvr.number(arg1_7) then
			return false
		end
		if arg1_7 < arg1 then
			return true
		end
		return false
	end
end
tbl_upvr.numberPositive = tbl_upvr.numberMinExclusive(0)
tbl_upvr.numberNegative = tbl_upvr.numberMaxExclusive(0)
function tbl_upvr.numberConstrained(arg1, arg2) -- Line 694
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	assert(tbl_upvr.number(arg1))
	assert(tbl_upvr.number(arg2))
	local any_numberMin_result1_upvr = tbl_upvr.numberMin(arg1)
	local any_numberMax_result1_upvr = tbl_upvr.numberMax(arg2)
	return function(arg1_8) -- Line 700
		--[[ Upvalues[2]:
			[1]: any_numberMin_result1_upvr (readonly)
			[2]: any_numberMax_result1_upvr (readonly)
		]]
		if not any_numberMin_result1_upvr(arg1_8) then
			return false
		end
		if not any_numberMax_result1_upvr(arg1_8) then
			return false
		end
		return true
	end
end
function tbl_upvr.numberConstrainedExclusive(arg1, arg2) -- Line 723
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	assert(tbl_upvr.number(arg1))
	assert(tbl_upvr.number(arg2))
	local any_numberMinExclusive_result1_upvr = tbl_upvr.numberMinExclusive(arg1)
	local any_numberMaxExclusive_result1_upvr = tbl_upvr.numberMaxExclusive(arg2)
	return function(arg1_9) -- Line 729
		--[[ Upvalues[2]:
			[1]: any_numberMinExclusive_result1_upvr (readonly)
			[2]: any_numberMaxExclusive_result1_upvr (readonly)
		]]
		if not any_numberMinExclusive_result1_upvr(arg1_9) then
			return false
		end
		if not any_numberMaxExclusive_result1_upvr(arg1_9) then
			return false
		end
		return true
	end
end
function tbl_upvr.match(arg1) -- Line 751
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	assert(tbl_upvr.string(arg1))
	return function(arg1_10) -- Line 753
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if not tbl_upvr.string(arg1_10) then
			return false
		end
		if string.match(arg1_10, arg1) == nil then
			return false
		end
		return true
	end
end
function tbl_upvr.optional(arg1) -- Line 774
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	assert(tbl_upvr.callback(arg1))
	return function(arg1_11) -- Line 776
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_11 == nil then
			return true
		end
		if arg1(arg1_11) then
			return true
		end
		return false
	end
end
function tbl_upvr.tuple(...) -- Line 797
	local args_list_upvr_3 = {...}
	return function(...) -- Line 799
		--[[ Upvalues[1]:
			[1]: args_list_upvr_3 (readonly)
		]]
		for i_4, v_2 in ipairs(args_list_upvr_3) do
			if v_2(({...})[i_4]) == false then
				return false
			end
		end
		return true
	end
end
function tbl_upvr.keys(arg1) -- Line 819
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	assert(tbl_upvr.callback(arg1))
	return function(arg1_12) -- Line 821
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if tbl_upvr.table(arg1_12) == false then
			return false
		end
		for i_5 in pairs(arg1_12) do
			if arg1(i_5) == false then
				return false
			end
		end
		return true
	end
end
function tbl_upvr.values(arg1) -- Line 845
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	assert(tbl_upvr.callback(arg1))
	return function(arg1_13) -- Line 847
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if tbl_upvr.table(arg1_13) == false then
			return false
		end
		for _, v_3 in pairs(arg1_13) do
			if arg1(v_3) == false then
				return false
			end
		end
		return true
	end
end
function tbl_upvr.map(arg1, arg2) -- Line 872
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	assert(tbl_upvr.callback(arg1))
	assert(tbl_upvr.callback(arg2))
	local any_keys_result1_upvr = tbl_upvr.keys(arg1)
	local any_values_result1_upvr_2 = tbl_upvr.values(arg2)
	return function(arg1_14) -- Line 878
		--[[ Upvalues[2]:
			[1]: any_keys_result1_upvr (readonly)
			[2]: any_values_result1_upvr_2 (readonly)
		]]
		if not any_keys_result1_upvr(arg1_14) then
			return false
		end
		if not any_values_result1_upvr_2(arg1_14) then
			return false
		end
		return true
	end
end
function tbl_upvr.set(arg1) -- Line 900
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	return tbl_upvr.map(arg1, tbl_upvr.literal(true))
end
local any_keys_result1_upvr_2 = tbl_upvr.keys(tbl_upvr.integer)
function tbl_upvr.array(arg1) -- Line 913
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: any_keys_result1_upvr_2 (readonly)
	]]
	assert(tbl_upvr.callback(arg1))
	local any_values_result1_upvr = tbl_upvr.values(arg1)
	return function(arg1_15) -- Line 917
		--[[ Upvalues[2]:
			[1]: any_keys_result1_upvr_2 (copied, readonly)
			[2]: any_values_result1_upvr (readonly)
		]]
		local var68
		if any_keys_result1_upvr_2(arg1_15) == false then
			var68 = false
			return var68
		end
		var68 = 0
		for _ in ipairs(arg1_15) do
			var68 += 1
		end
		for i_8 in pairs(arg1_15) do
			if i_8 < 1 or var68 < i_8 then
				return false
			end
		end
		if not any_values_result1_upvr(arg1_15) then
			return false
		end
		return true
	end
end
function tbl_upvr.strictArray(...) -- Line 953
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: any_keys_result1_upvr_2 (readonly)
	]]
	local args_list_upvr_4 = {...}
	assert(tbl_upvr.array(tbl_upvr.callback)(args_list_upvr_4))
	return function(arg1) -- Line 957
		--[[ Upvalues[2]:
			[1]: any_keys_result1_upvr_2 (copied, readonly)
			[2]: args_list_upvr_4 (readonly)
		]]
		if any_keys_result1_upvr_2(arg1) == false then
			return false
		end
		if #args_list_upvr_4 < #arg1 then
			return false
		end
		for i_9, v_4 in pairs(args_list_upvr_4) do
			if not v_4(arg1[i_9]) then
				return false
			end
		end
		return true
	end
end
any_keys_result1_upvr_2 = tbl_upvr.array(tbl_upvr.callback)
local var82_upvr = any_keys_result1_upvr_2
function tbl_upvr.union(...) -- Line 989
	--[[ Upvalues[1]:
		[1]: var82_upvr (readonly)
	]]
	local args_list_upvr_2 = {...}
	assert(var82_upvr(args_list_upvr_2))
	return function(arg1) -- Line 993
		--[[ Upvalues[1]:
			[1]: args_list_upvr_2 (readonly)
		]]
		for _, v_5 in ipairs(args_list_upvr_2) do
			if v_5(arg1) then
				return true
			end
		end
		return false
	end
end
tbl_upvr.some = tbl_upvr.union
function tbl_upvr.intersection(...) -- Line 1016
	--[[ Upvalues[1]:
		[1]: var82_upvr (readonly)
	]]
	local args_list_upvr = {...}
	assert(var82_upvr(args_list_upvr))
	return function(arg1) -- Line 1020
		--[[ Upvalues[1]:
			[1]: args_list_upvr (readonly)
		]]
		for _, v_6 in ipairs(args_list_upvr) do
			if not v_6(arg1) then
				return false
			end
		end
		return true
	end
end
tbl_upvr.every = tbl_upvr.intersection
var82_upvr = tbl_upvr.map(tbl_upvr.any, tbl_upvr.callback)
local strict_upvr = var82_upvr
function tbl_upvr.interface(arg1) -- Line 1047
	--[[ Upvalues[2]:
		[1]: strict_upvr (readonly)
		[2]: tbl_upvr (readonly)
	]]
	assert(strict_upvr(arg1))
	return function(arg1_16) -- Line 1049
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if tbl_upvr.table(arg1_16) == false then
			return false
		end
		for i_12, v_7 in pairs(arg1) do
			if v_7(arg1_16[i_12]) == false then
				return false
			end
		end
		return true
	end
end
function tbl_upvr.strictInterface(arg1) -- Line 1073
	--[[ Upvalues[2]:
		[1]: strict_upvr (readonly)
		[2]: tbl_upvr (readonly)
	]]
	assert(strict_upvr(arg1))
	return function(arg1_17) -- Line 1075
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if tbl_upvr.table(arg1_17) == false then
			return false
		end
		for i_13, v_8 in pairs(arg1) do
			if v_8(arg1_17[i_13]) == false then
				return false
			end
		end
		for i_14 in pairs(arg1_17) do
			if not arg1[i_14] then
				return false
			end
		end
		return true
	end
end
function strict_upvr(arg1, arg2) -- Line 1106, Named "instanceOf"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	assert(tbl_upvr.string(arg1))
	local var114_upvw
	if arg2 ~= nil then
		var114_upvw = tbl_upvr.children(arg2)
	end
	return function(arg1_18) -- Line 1114
		--[[ Upvalues[3]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: var114_upvw (read and write)
		]]
		if not tbl_upvr.Instance(arg1_18) then
			return false
		end
		if arg1_18.ClassName ~= arg1 then
			return false
		end
		if var114_upvw and not var114_upvw(arg1_18) then
			return false
		end
		return true
	end
end
tbl_upvr.instanceOf = strict_upvr
strict_upvr = tbl_upvr.instanceOf
tbl_upvr.instance = strict_upvr
function strict_upvr(arg1, arg2) -- Line 1144, Named "instanceIsA"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	assert(tbl_upvr.string(arg1))
	local var116_upvw
	if arg2 ~= nil then
		var116_upvw = tbl_upvr.children(arg2)
	end
	return function(arg1_19) -- Line 1152
		--[[ Upvalues[3]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: var116_upvw (read and write)
		]]
		if not tbl_upvr.Instance(arg1_19) then
			return false
		end
		if not arg1_19:IsA(arg1) then
			return false
		end
		if var116_upvw and not var116_upvw(arg1_19) then
			return false
		end
		return true
	end
end
tbl_upvr.instanceIsA = strict_upvr
function strict_upvr(arg1) -- Line 1180, Named "enum"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	assert(tbl_upvr.Enum(arg1))
	return function(arg1_20) -- Line 1182
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if not tbl_upvr.EnumItem(arg1_20) then
			return false
		end
		if arg1_20.EnumType == arg1 then
			return true
		end
		return false
	end
end
tbl_upvr.enum = strict_upvr
strict_upvr = tbl_upvr.tuple(tbl_upvr.callback, tbl_upvr.callback)
function tbl_upvr.wrap(arg1, arg2) -- Line 1207
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
tbl_upvr.strict = strict_upvr
strict_upvr = tbl_upvr.map(tbl_upvr.string, tbl_upvr.callback)
function tbl_upvr.children(arg1) -- Line 1243
	--[[ Upvalues[2]:
		[1]: strict_upvr (readonly)
		[2]: tbl_upvr (readonly)
	]]
	assert(strict_upvr(arg1))
	return function(arg1_21) -- Line 1246
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if not tbl_upvr.Instance(arg1_21) then
			return false
		end
		local tbl = {}
		for _, v_9 in ipairs(arg1_21:GetChildren()) do
			local Name = v_9.Name
			if arg1[Name] then
				if tbl[Name] then
					return false
				end
				tbl[Name] = v_9
			end
		end
		for i_16, v_10 in pairs(arg1) do
			if not v_10(tbl[i_16]) then
				return false
			end
		end
		return true
	end
end
strict_upvr = {}
local var134 = strict_upvr
var134.t = tbl_upvr
return var134