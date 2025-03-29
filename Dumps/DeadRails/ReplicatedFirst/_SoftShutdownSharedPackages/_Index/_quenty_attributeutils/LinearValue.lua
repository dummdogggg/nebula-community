--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.LinearValue
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:47
-- Luau version 6, Types version 3
-- Time taken: 0.008475 seconds

local module_upvr = {
	ClassName = "LinearValue";
}
module_upvr.__index = module_upvr
function module_upvr.new(arg1, arg2) -- Line 17
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local module = {}
	module._constructor = arg1
	module._values = arg2
	return setmetatable(module, module_upvr)
end
function module_upvr.isLinear(arg1) -- Line 30
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var3 = false
	if type(arg1) == "table" then
		if getmetatable(arg1) ~= module_upvr then
			var3 = false
		else
			var3 = true
		end
	end
	return var3
end
function module_upvr.ToBaseValue(arg1) -- Line 39
	return arg1._constructor(unpack(arg1._values))
end
local function _(arg1) -- Line 43, Named "operation"
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return function(arg1_2, arg2) -- Line 44
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if module_upvr.isLinear(arg1_2) then
			local var24 = arg2
			if module_upvr.isLinear(var24) then
				if arg1_2._constructor ~= arg2._constructor then
					var24 = false
				else
					var24 = true
				end
				assert(var24, "a is not the same type of linearValue as b")
				var24 = #arg1_2._values
				for i = 1, var24 do
					({})[i] = arg1(arg1_2._values[i], arg2._values[i])
					local var26
				end
				var24 = module_upvr.new(arg1_2._constructor, var26)
				return var24
			end
		end
		if module_upvr.isLinear(arg1_2) then
			if type(arg2) == "number" then
				for i_2 = 1, #arg1_2._values do
					({})[i_2] = arg1(arg1_2._values[i_2], arg2)
					local var28
				end
				return module_upvr.new(arg1_2._constructor, var28)
			end
			error("Bad type (b)")
		else
			if module_upvr.isLinear(arg2) then
				if type(arg1_2) == "number" then
					for i_13 = 1, #arg2._values do
						({})[i_13] = arg1(arg1_2, arg2._values[i_13])
						local var30
					end
					return module_upvr.new(arg2._constructor, var30)
				end
				error("Bad type (a)")
				return
			end
			error("Neither value is a linearValue")
		end
	end
end
function module_upvr.GetMagnitude(arg1) -- Line 84
	local var33 = 0
	for i_3 = 1, #arg1._values do
		local var34 = arg1._values[i_3]
		var33 += var34 * var34
	end
	return math.sqrt(var33)
end
function module_upvr.__index(arg1, arg2) -- Line 100
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr[arg2] then
		return module_upvr[arg2]
	end
	if arg2 == "magnitude" then
		return arg1:GetMagnitude()
	end
	return nil
end
local function var80_upvr(arg1, arg2) -- Line 110
	return arg1 + arg2
end
function module_upvr.__add(arg1, arg2) -- Line 44
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: var80_upvr (readonly)
	]]
	if module_upvr.isLinear(arg1) then
		local var43 = arg2
		if module_upvr.isLinear(var43) then
			if arg1._constructor ~= arg2._constructor then
				var43 = false
			else
				var43 = true
			end
			assert(var43, "a is not the same type of linearValue as b")
			var43 = #arg1._values
			for i_4 = 1, var43 do
				({})[i_4] = var80_upvr(arg1._values[i_4], arg2._values[i_4])
				local var45
			end
			var43 = module_upvr.new(arg1._constructor, var45)
			return var43
		end
	end
	if module_upvr.isLinear(arg1) then
		if type(arg2) == "number" then
			for i_5 = 1, #arg1._values do
				({})[i_5] = var80_upvr(arg1._values[i_5], arg2)
				local var47
			end
			return module_upvr.new(arg1._constructor, var47)
		end
		error("Bad type (b)")
	else
		if module_upvr.isLinear(arg2) then
			if type(arg1) == "number" then
				for i_14 = 1, #arg2._values do
					({})[i_14] = var80_upvr(arg1, arg2._values[i_14])
					local var49
				end
				return module_upvr.new(arg2._constructor, var49)
			end
			error("Bad type (a)")
			return
		end
		error("Neither value is a linearValue")
	end
end
function var80_upvr(arg1, arg2) -- Line 114
	return arg1 - arg2
end
function module_upvr.__sub(arg1, arg2) -- Line 44
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: var80_upvr (readonly)
	]]
	if module_upvr.isLinear(arg1) then
		local var58 = arg2
		if module_upvr.isLinear(var58) then
			if arg1._constructor ~= arg2._constructor then
				var58 = false
			else
				var58 = true
			end
			assert(var58, "a is not the same type of linearValue as b")
			var58 = #arg1._values
			for i_6 = 1, var58 do
				({})[i_6] = var80_upvr(arg1._values[i_6], arg2._values[i_6])
				local var60
			end
			var58 = module_upvr.new(arg1._constructor, var60)
			return var58
		end
	end
	if module_upvr.isLinear(arg1) then
		if type(arg2) == "number" then
			for i_7 = 1, #arg1._values do
				({})[i_7] = var80_upvr(arg1._values[i_7], arg2)
				local var62
			end
			return module_upvr.new(arg1._constructor, var62)
		end
		error("Bad type (b)")
	else
		if module_upvr.isLinear(arg2) then
			if type(arg1) == "number" then
				for i_15 = 1, #arg2._values do
					({})[i_15] = var80_upvr(arg1, arg2._values[i_15])
					local var64
				end
				return module_upvr.new(arg2._constructor, var64)
			end
			error("Bad type (a)")
			return
		end
		error("Neither value is a linearValue")
	end
end
function var80_upvr(arg1, arg2) -- Line 118
	return arg1 * arg2
end
function module_upvr.__mul(arg1, arg2) -- Line 44
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: var80_upvr (readonly)
	]]
	if module_upvr.isLinear(arg1) then
		local var73 = arg2
		if module_upvr.isLinear(var73) then
			if arg1._constructor ~= arg2._constructor then
				var73 = false
			else
				var73 = true
			end
			assert(var73, "a is not the same type of linearValue as b")
			var73 = #arg1._values
			for i_8 = 1, var73 do
				({})[i_8] = var80_upvr(arg1._values[i_8], arg2._values[i_8])
				local var75
			end
			var73 = module_upvr.new(arg1._constructor, var75)
			return var73
		end
	end
	if module_upvr.isLinear(arg1) then
		if type(arg2) == "number" then
			for i_9 = 1, #arg1._values do
				({})[i_9] = var80_upvr(arg1._values[i_9], arg2)
				local var77
			end
			return module_upvr.new(arg1._constructor, var77)
		end
		error("Bad type (b)")
	else
		if module_upvr.isLinear(arg2) then
			if type(arg1) == "number" then
				for i_16 = 1, #arg2._values do
					({})[i_16] = var80_upvr(arg1, arg2._values[i_16])
					local var79
				end
				return module_upvr.new(arg2._constructor, var79)
			end
			error("Bad type (a)")
			return
		end
		error("Neither value is a linearValue")
	end
end
function var80_upvr(arg1, arg2) -- Line 122
	return arg1 / arg2
end
function module_upvr.__div(arg1, arg2) -- Line 44
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: var80_upvr (readonly)
	]]
	if module_upvr.isLinear(arg1) then
		local var88 = arg2
		if module_upvr.isLinear(var88) then
			if arg1._constructor ~= arg2._constructor then
				var88 = false
			else
				var88 = true
			end
			assert(var88, "a is not the same type of linearValue as b")
			var88 = #arg1._values
			for i_10 = 1, var88 do
				({})[i_10] = var80_upvr(arg1._values[i_10], arg2._values[i_10])
				local var90
			end
			var88 = module_upvr.new(arg1._constructor, var90)
			return var88
		end
	end
	if module_upvr.isLinear(arg1) then
		if type(arg2) == "number" then
			for i_11 = 1, #arg1._values do
				({})[i_11] = var80_upvr(arg1._values[i_11], arg2)
				local var92
			end
			return module_upvr.new(arg1._constructor, var92)
		end
		error("Bad type (b)")
	else
		if module_upvr.isLinear(arg2) then
			if type(arg1) == "number" then
				for i_17 = 1, #arg2._values do
					({})[i_17] = var80_upvr(arg1, arg2._values[i_17])
					local var94
				end
				return module_upvr.new(arg2._constructor, var94)
			end
			error("Bad type (a)")
			return
		end
		error("Neither value is a linearValue")
	end
end
function module_upvr.__eq(arg1, arg2, arg3) -- Line 126
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr.isLinear(arg2) then
		if module_upvr.isLinear(arg3) then
			if #arg2._values ~= #arg3._values then
				return false
			end
			for i_12 = 1, #arg2._values do
				if arg2._values[i_12] ~= arg3._values[i_12] then
					return false
				end
			end
			return true
		end
	end
	return false
end
return module_upvr