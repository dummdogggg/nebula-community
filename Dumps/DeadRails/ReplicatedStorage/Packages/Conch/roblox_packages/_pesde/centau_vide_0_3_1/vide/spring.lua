--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.spring
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:31
-- Luau version 6, Types version 3
-- Time taken: 0.004604 seconds

local var1_upvr
if not var1_upvr then
	var1_upvr = require("test/relative-string")
	script = var1_upvr -- Setting global
end
local function INLINED() -- Internal function, doesn't exist in bytecode
	var1_upvr = Vector3
	return var1_upvr
end
if not game or not INLINED() then
	var1_upvr = require("test/mock").Vector3
end
local throw_upvr = require(script.Parent.throw)
local graph = require(script.Parent.graph)
local function Vec3_upvr(arg1, arg2, arg3) -- Line 40, Named "Vec3"
	--[[ Upvalues[1]:
		[1]: var1_upvr (readonly)
	]]
	return var1_upvr.new(arg1, arg2, arg3)
end
local any_new_result1_upvr = var1_upvr.new(0, 0, 0)
local tbl_2_upvr = {
	number = function(arg1) -- Line 69
		--[[ Upvalues[2]:
			[1]: var1_upvr (readonly)
			[2]: any_new_result1_upvr (readonly)
		]]
		return var1_upvr.new(arg1, 0, 0), any_new_result1_upvr
	end;
	CFrame = function(arg1) -- Line 73
		--[[ Upvalues[1]:
			[1]: Vec3_upvr (readonly)
		]]
		return arg1.Position, Vec3_upvr(arg1:ToEulerAnglesXYZ())
	end;
	Color3 = function(arg1) -- Line 77
		--[[ Upvalues[2]:
			[1]: var1_upvr (readonly)
			[2]: any_new_result1_upvr (readonly)
		]]
		return var1_upvr.new(arg1.R, arg1.G, arg1.B), any_new_result1_upvr
	end;
	UDim = function(arg1) -- Line 82
		--[[ Upvalues[2]:
			[1]: var1_upvr (readonly)
			[2]: any_new_result1_upvr (readonly)
		]]
		return var1_upvr.new(arg1.Scale, arg1.Offset, 0), any_new_result1_upvr
	end;
	UDim2 = function(arg1) -- Line 86
		--[[ Upvalues[2]:
			[1]: var1_upvr (readonly)
			[2]: Vec3_upvr (readonly)
		]]
		return var1_upvr.new(arg1.X.Scale, arg1.X.Offset, arg1.Y.Scale), Vec3_upvr(arg1.Y.Offset, 0, 0)
	end;
	Vector2 = function(arg1) -- Line 90
		--[[ Upvalues[2]:
			[1]: var1_upvr (readonly)
			[2]: any_new_result1_upvr (readonly)
		]]
		return var1_upvr.new(arg1.X, arg1.Y, 0), any_new_result1_upvr
	end;
	Vector3 = function(arg1) -- Line 94
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		return arg1, any_new_result1_upvr
	end;
	Rect = function(arg1) -- Line 98
		--[[ Upvalues[2]:
			[1]: var1_upvr (readonly)
			[2]: Vec3_upvr (readonly)
		]]
		return var1_upvr.new(arg1.Min.X, arg1.Min.Y, arg1.Max.X), Vec3_upvr(arg1.Max.Y, 0, 0)
	end;
}
local tbl_4_upvr = {
	number = function(arg1, arg2) -- Line 104
		return arg1.X
	end;
	CFrame = function(arg1, arg2) -- Line 108
		return CFrame.new(arg1) * CFrame.fromEulerAnglesXYZ(arg2.X, arg2.Y, arg2.Z)
	end;
	Color3 = function(arg1) -- Line 112
		return Color3.new(math.clamp(arg1.X, 0, 1), math.clamp(arg1.Y, 0, 1), math.clamp(arg1.Z, 0, 1))
	end;
	UDim = function(arg1) -- Line 116
		return UDim.new(arg1.X, math.round(arg1.Y))
	end;
	UDim2 = function(arg1, arg2) -- Line 120
		return UDim2.new(arg1.X, math.round(arg1.Y), arg1.Z, math.round(arg2.X))
	end;
	Vector2 = function(arg1) -- Line 124
		return Vector2.new(arg1.X, arg1.Y)
	end;
	Vector3 = function(arg1) -- Line 128
		return arg1
	end;
	Rect = function(arg1, arg2) -- Line 132
		return Rect.new(arg1.X, arg1.Y, arg1.Z, arg2.X)
	end;
}
local tbl = {
	__index = function(arg1, arg2) -- Line 138, Named "__index"
		--[[ Upvalues[1]:
			[1]: throw_upvr (readonly)
		]]
		throw_upvr(`cannot spring type {arg2}`)
	end;
}
setmetatable(tbl_2_upvr, tbl)
setmetatable(tbl_4_upvr, tbl)
local tbl_5_upvr = {}
setmetatable(tbl_5_upvr, {
	__mode = 'v';
})
local assert_stable_scope_upvr = graph.assert_stable_scope
local create_source_node_upvr = graph.create_source_node
local create_node_upvr = graph.create_node
local evaluate_node_upvr = graph.evaluate_node
local push_child_to_scope_upvr = graph.push_child_to_scope
local function spring_upvr(arg1, arg2, arg3) -- Line 151, Named "spring"
	--[[ Upvalues[9]:
		[1]: assert_stable_scope_upvr (readonly)
		[2]: throw_upvr (readonly)
		[3]: any_new_result1_upvr (readonly)
		[4]: create_source_node_upvr (readonly)
		[5]: tbl_2_upvr (readonly)
		[6]: tbl_5_upvr (readonly)
		[7]: create_node_upvr (readonly)
		[8]: evaluate_node_upvr (readonly)
		[9]: push_child_to_scope_upvr (readonly)
	]]
	local var31 = (-math.pi*2) / (arg2 or 1)
	local var32 = (arg3 or 1) * (2 * var31)
	if 240 < var32 then
		throw_upvr("spring damping too high, consider reducing damping or increasing period")
	end
	local tbl_3_upvr = {
		k = var31 ^ 2;
		c = var32;
		x0_123 = any_new_result1_upvr;
		x1_123 = any_new_result1_upvr;
		v_123 = any_new_result1_upvr;
		x0_456 = any_new_result1_upvr;
		x1_456 = any_new_result1_upvr;
		v_456 = any_new_result1_upvr;
		source_value = false;
	}
	local var27_result1_upvr = create_source_node_upvr(false)
	evaluate_node_upvr(create_node_upvr(assert_stable_scope_upvr(), function() -- Line 186, Named "updater_effect"
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: tbl_3_upvr (readonly)
			[3]: tbl_2_upvr (copied, readonly)
			[4]: tbl_5_upvr (copied, readonly)
			[5]: var27_result1_upvr (readonly)
		]]
		local arg1_result1 = arg1()
		local any_any_result1_2, any_any_result2 = tbl_2_upvr[typeof(arg1_result1)](arg1_result1)
		tbl_3_upvr.x1_123 = any_any_result1_2
		tbl_3_upvr.x1_456 = any_any_result2
		tbl_3_upvr.source_value = arg1_result1
		tbl_5_upvr[tbl_3_upvr] = var27_result1_upvr
		return arg1_result1
	end, false))
	tbl_3_upvr.x0_123 = tbl_3_upvr.x1_123
	tbl_3_upvr.x0_456 = tbl_3_upvr.x1_456
	var27_result1_upvr.cache = tbl_3_upvr.source_value
	return function(...) -- Line 204
		--[[ Upvalues[6]:
			[1]: push_child_to_scope_upvr (copied, readonly)
			[2]: var27_result1_upvr (readonly)
			[3]: tbl_3_upvr (readonly)
			[4]: tbl_2_upvr (copied, readonly)
			[5]: any_new_result1_upvr (copied, readonly)
			[6]: tbl_5_upvr (copied, readonly)
		]]
		if select('#', ...) == 0 then
			push_child_to_scope_upvr(var27_result1_upvr)
			return var27_result1_upvr.cache
		end
		local var39 = ...
		local any_any_result1, any_any_result2_2 = tbl_2_upvr[typeof(var39)](var39)
		tbl_3_upvr.x0_123 = any_any_result1
		tbl_3_upvr.x0_456 = any_any_result2_2
		tbl_3_upvr.v_123 = any_new_result1_upvr
		tbl_3_upvr.v_456 = any_new_result1_upvr
		tbl_5_upvr[tbl_3_upvr] = var27_result1_upvr
		var27_result1_upvr.cache = var39
		return var39
	end
end
local function step_springs_upvr(arg1) -- Line 228, Named "step_springs"
	--[[ Upvalues[1]:
		[1]: tbl_5_upvr (readonly)
	]]
	for i in next, tbl_5_upvr do
		local k = i.k
		local c = i.c
		local x0_123 = i.x0_123
		local v_123 = i.v_123
		local x0_456_2 = i.x0_456
		local v_456 = i.v_456
		local var49 = v_123 + ((x0_123 - i.x1_123) * -k + v_123 * -c) * arg1
		local var50 = v_456 + ((x0_456_2 - i.x1_456) * -k + v_456 * -c) * arg1
		i.x0_123 = x0_123 + var49 * arg1
		i.x0_456 = x0_456_2 + var50 * arg1
		i.v_123 = var49
		i.v_456 = var50
	end
end
local tbl_upvr = {}
local update_descendants_upvr = graph.update_descendants
local function update_spring_sources_upvr() -- Line 268, Named "update_spring_sources"
	--[[ Upvalues[4]:
		[1]: tbl_5_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: tbl_4_upvr (readonly)
		[4]: update_descendants_upvr (readonly)
	]]
	for i_2, v in next, tbl_5_upvr do
		local x0_123_2 = i_2.x0_123
		local x0_456 = i_2.x0_456
		if (((i_2.v_123 + i_2.v_456) + (x0_123_2 - i_2.x1_123)) + (x0_456 - i_2.x1_456)).Magnitude < 0.0001 then
			table.insert(tbl_upvr, i_2)
			v.cache = i_2.source_value
		else
			v.cache = tbl_4_upvr[typeof(i_2.source_value)](x0_123_2, x0_456)
		end
		update_descendants_upvr(v)
	end
	for _, v_2 in next, tbl_upvr do
		tbl_5_upvr[v_2] = nil
	end
	table.clear(tbl_upvr)
end
return function() -- Line 298
	--[[ Upvalues[3]:
		[1]: spring_upvr (readonly)
		[2]: step_springs_upvr (readonly)
		[3]: update_spring_sources_upvr (readonly)
	]]
	local var61_upvw = 0
	return spring_upvr, function(arg1) -- Line 301
		--[[ Upvalues[3]:
			[1]: var61_upvw (read and write)
			[2]: step_springs_upvr (copied, readonly)
			[3]: update_spring_sources_upvr (copied, readonly)
		]]
		var61_upvw += arg1
		while 0.008333333333333333 < var61_upvw do
			var61_upvw -= 0.008333333333333333
			step_springs_upvr(0.008333333333333333)
		end
		update_spring_sources_upvr()
	end
end