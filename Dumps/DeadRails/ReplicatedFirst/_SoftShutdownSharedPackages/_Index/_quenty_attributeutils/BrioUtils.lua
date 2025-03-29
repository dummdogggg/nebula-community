--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.BrioUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:52
-- Luau version 6, Types version 3
-- Time taken: 0.005867 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local any_load_result1_result1_upvr = any_load_result1("Maid")
local var1_result1_upvr = any_load_result1("Brio")
local module_upvr = {
	clone = function(arg1) -- Line 20, Named "clone"
		--[[ Upvalues[1]:
			[1]: var1_result1_upvr (readonly)
		]]
		assert(arg1, "Bad brio")
		if arg1:IsDead() then
			return var1_result1_upvr.DEAD
		end
		local any_new_result1_upvr_3 = var1_result1_upvr.new(arg1:GetValue())
		any_new_result1_upvr_3:ToMaid():GiveTask(arg1:GetDiedSignal():Connect(function() -- Line 29
			--[[ Upvalues[1]:
				[1]: any_new_result1_upvr_3 (readonly)
			]]
			any_new_result1_upvr_3:Kill()
		end))
		return any_new_result1_upvr_3
	end;
	aliveOnly = function(arg1) -- Line 42, Named "aliveOnly"
		for _, v in pairs(arg1) do
			if not v:IsDead() then
				table.insert({}, v)
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return {}
	end;
	firstAlive = function(arg1) -- Line 58, Named "firstAlive"
		for _, v_2 in pairs(arg1) do
			if not v_2:IsDead() then
				return v_2
			end
		end
		return nil
	end;
}
function module_upvr.flatten(arg1) -- Line 74
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	for i_3, v_3 in pairs(arg1) do
		if var1_result1_upvr.isBrio(v_3) then
			if v_3:IsDead() then
				return var1_result1_upvr.DEAD
			end
			table.insert({}, v_3)
			;({})[i_3] = v_3:GetValue()
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			;({})[i_3] = v_3
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
	return module_upvr.first({}, {})
end
function module_upvr.first(arg1, ...) -- Line 102
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr (readonly)
	]]
	for _, v_4 in pairs(arg1) do
		if var1_result1_upvr.isBrio(v_4) and v_4:IsDead() then
			return var1_result1_upvr.DEAD
		end
	end
	local any_new_result1_upvr_9 = any_load_result1_result1_upvr.new()
	local any_new_result1_upvr_10 = var1_result1_upvr.new(...)
	for _, v_5 in pairs(arg1) do
		if var1_result1_upvr.isBrio(v_5) then
			any_new_result1_upvr_9:GiveTask(v_5:GetDiedSignal():Connect(function() -- Line 116
				--[[ Upvalues[1]:
					[1]: any_new_result1_upvr_10 (readonly)
				]]
				any_new_result1_upvr_10:Kill()
			end))
		end
	end
	any_new_result1_upvr_9:GiveTask(any_new_result1_upvr_10:GetDiedSignal():Connect(function() -- Line 122
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr_9 (readonly)
		]]
		any_new_result1_upvr_9:DoCleaning()
	end))
	return any_new_result1_upvr_10
end
function module_upvr.withOtherValues(arg1, ...) -- Line 138
	--[[ Upvalues[1]:
		[1]: var1_result1_upvr (readonly)
	]]
	assert(arg1, "Bad brio")
	if arg1:IsDead() then
		return var1_result1_upvr.DEAD
	end
	local any_new_result1_upvr_7 = var1_result1_upvr.new(...)
	any_new_result1_upvr_7:ToMaid():GiveTask(arg1:GetDiedSignal():Connect(function() -- Line 147
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr_7 (readonly)
		]]
		any_new_result1_upvr_7:Kill()
	end))
	return any_new_result1_upvr_7
end
function module_upvr.extend(arg1, ...) -- Line 162
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if arg1:IsDead() then
		return var1_result1_upvr.DEAD
	end
	local _values_2 = arg1._values
	local tbl_3 = {}
	for i_6 = 1, _values_2.n do
		tbl_3[i_6] = _values_2[i_6]
		local var48
	end
	local packed = table.pack(...)
	for i_7 = 1, packed.n do
		tbl_3[var48.n + i_7] = packed[i_7]
		local var50
	end
	local any_new_result1_upvr_2 = any_load_result1_result1_upvr.new()
	local any_new_result1_upvr_6 = var1_result1_upvr.new(unpack(tbl_3, 1, var50.n + packed.n))
	any_new_result1_upvr_2:GiveTask(arg1:GetDiedSignal():Connect(function() -- Line 180
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr_6 (readonly)
		]]
		any_new_result1_upvr_6:Kill()
	end))
	any_new_result1_upvr_2:GiveTask(any_new_result1_upvr_6:GetDiedSignal():Connect(function() -- Line 184
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr_2 (readonly)
		]]
		any_new_result1_upvr_2:DoCleaning()
	end))
	return any_new_result1_upvr_6
end
function module_upvr.prepend(arg1, ...) -- Line 200
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if arg1:IsDead() then
		return var1_result1_upvr.DEAD
	end
	local _values = arg1._values
	local tbl_2 = {}
	local packed_2 = table.pack(...)
	for i_8 = 1, packed_2.n do
		tbl_2[i_8] = packed_2[i_8]
		local var66
	end
	for i_9 = 1, _values.n do
		tbl_2[var66.n + i_9] = _values[i_9]
		local var67
	end
	local any_new_result1_upvr_4 = any_load_result1_result1_upvr.new()
	local any_new_result1_upvr_8 = var1_result1_upvr.new(unpack(tbl_2, 1, _values.n + var67.n))
	any_new_result1_upvr_4:GiveTask(arg1:GetDiedSignal():Connect(function() -- Line 218
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr_8 (readonly)
		]]
		any_new_result1_upvr_8:Kill()
	end))
	any_new_result1_upvr_4:GiveTask(any_new_result1_upvr_8:GetDiedSignal():Connect(function() -- Line 222
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr_4 (readonly)
		]]
		any_new_result1_upvr_4:DoCleaning()
	end))
	return any_new_result1_upvr_8
end
function module_upvr.merge(arg1, arg2) -- Line 236
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	assert(var1_result1_upvr.isBrio(arg1), "Not a brio")
	assert(var1_result1_upvr.isBrio(arg2), "Not a brio")
	if arg1:IsDead() or arg2:IsDead() then
		return var1_result1_upvr.DEAD
	end
	local _values_4 = arg1._values
	local tbl = {}
	for i_10 = 1, _values_4.n do
		tbl[i_10] = _values_4[i_10]
		local var82
	end
	local _values_3 = arg2._values
	for i_11 = 1, _values_3.n do
		tbl[var82.n + i_11] = _values_3[i_11]
		local var84
	end
	local any_new_result1_upvr_5 = any_load_result1_result1_upvr.new()
	local any_new_result1_upvr = var1_result1_upvr.new(unpack(tbl, 1, var84.n + _values_3.n))
	any_new_result1_upvr_5:GiveTask(arg1:GetDiedSignal():Connect(function() -- Line 258
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:Kill()
	end))
	any_new_result1_upvr_5:GiveTask(arg2:GetDiedSignal():Connect(function() -- Line 261
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:Kill()
	end))
	any_new_result1_upvr_5:GiveTask(any_new_result1_upvr:GetDiedSignal():Connect(function() -- Line 265
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr_5 (readonly)
		]]
		any_new_result1_upvr_5:DoCleaning()
	end))
	return any_new_result1_upvr
end
return module_upvr