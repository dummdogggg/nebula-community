--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.Blend
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:09
-- Luau version 6, Types version 3
-- Time taken: 0.015717 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local any_load_result1_result1_upvr_2 = any_load_result1("Brio")
local any_load_result1_result1_upvr_6 = any_load_result1("Maid")
local any_load_result1_result1_upvr_5 = any_load_result1("MaidTaskUtils")
local any_load_result1_result1_upvr_10 = any_load_result1("Observable")
local any_load_result1_result1_upvr_12 = any_load_result1("Promise")
local any_load_result1_result1_upvr_4 = any_load_result1("Rx")
local any_load_result1_result1_upvr_3 = any_load_result1("Signal")
local any_load_result1_result1_upvr = any_load_result1("StepUtils")
local var1_result1_upvr = any_load_result1("ValueBaseUtils")
local var1_result1_upvr_5 = any_load_result1("ValueObject")
local module_2_upvr = {}
local any_load_result1_result1_upvr_9 = any_load_result1("BlendDefaultProps")
function module_2_upvr.New(arg1) -- Line 49
	--[[ Upvalues[4]:
		[1]: any_load_result1_result1_upvr_9 (readonly)
		[2]: any_load_result1_result1_upvr_10 (readonly)
		[3]: any_load_result1_result1_upvr_6 (readonly)
		[4]: module_2_upvr (readonly)
	]]
	local var15
	if type(arg1) ~= "string" then
		var15 = false
	else
		var15 = true
	end
	assert(var15, "Bad className")
	var15 = any_load_result1_result1_upvr_9
	local var16_upvr = var15[arg1]
	function var15(arg1_2) -- Line 54
		--[[ Upvalues[5]:
			[1]: any_load_result1_result1_upvr_10 (copied, readonly)
			[2]: any_load_result1_result1_upvr_6 (copied, readonly)
			[3]: arg1 (readonly)
			[4]: var16_upvr (readonly)
			[5]: module_2_upvr (copied, readonly)
		]]
		return any_load_result1_result1_upvr_10.new(function(arg1_3) -- Line 55
			--[[ Upvalues[5]:
				[1]: any_load_result1_result1_upvr_6 (copied, readonly)
				[2]: arg1 (copied, readonly)
				[3]: var16_upvr (copied, readonly)
				[4]: module_2_upvr (copied, readonly)
				[5]: arg1_2 (readonly)
			]]
			local any_new_result1_2 = any_load_result1_result1_upvr_6.new()
			local any = Instance.new(arg1)
			any_new_result1_2:GiveTask(any)
			if var16_upvr then
				for i, v in pairs(var16_upvr) do
					any[i] = v
				end
			end
			any_new_result1_2:GiveTask(module_2_upvr.mount(any, arg1_2))
			arg1_3:Fire(any)
			return any_new_result1_2
		end)
	end
	return var15
end
function module_2_upvr.State(arg1) -- Line 82
	--[[ Upvalues[1]:
		[1]: var1_result1_upvr_5 (readonly)
	]]
	return var1_result1_upvr_5.new(arg1)
end
function module_2_upvr.Dynamic(...) -- Line 86
	--[[ Upvalues[4]:
		[1]: module_2_upvr (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
		[3]: any_load_result1_result1_upvr_12 (readonly)
		[4]: any_load_result1_result1_upvr_10 (readonly)
	]]
	return module_2_upvr.Computed(...):Pipe({any_load_result1_result1_upvr_4.switchMap(function(arg1, ...) -- Line 91
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_12 (copied, readonly)
			[2]: any_load_result1_result1_upvr_4 (copied, readonly)
			[3]: any_load_result1_result1_upvr_10 (copied, readonly)
		]]
		if any_load_result1_result1_upvr_12.isPromise(arg1) then
			return any_load_result1_result1_upvr_4.fromPromise(arg1)
		end
		if any_load_result1_result1_upvr_10.isObservable(arg1) then
			return arg1
		end
		return any_load_result1_result1_upvr_4.of(arg1, ...)
	end)})
end
function module_2_upvr.Computed(...) -- Line 129
	--[[ Upvalues[3]:
		[1]: module_2_upvr (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
		[3]: any_load_result1_result1_upvr_10 (readonly)
	]]
	local args_list = {...}
	local arg_count_upvr = select('#', ...)
	local var33_upvr = args_list[arg_count_upvr]
	local var34
	if type(var33_upvr) ~= "function" then
		var34 = false
	else
		var34 = true
	end
	assert(var34, "Bad compute")
	local tbl = {}
	var34 = arg_count_upvr - 1
	for i_2 = 1, var34 do
		local any_toPropertyObservable_result1 = module_2_upvr.toPropertyObservable(args_list[i_2])
		if any_toPropertyObservable_result1 then
			tbl[i_2] = any_toPropertyObservable_result1
		else
			tbl[i_2] = any_load_result1_result1_upvr_4.of(args_list[i_2])
		end
	end
	var34 = #tbl
	if var34 == 0 then
		var34 = any_load_result1_result1_upvr_10.new
		var34 = var34(function(arg1) -- Line 148
			--[[ Upvalues[1]:
				[1]: var33_upvr (readonly)
			]]
			arg1:Fire(var33_upvr())
		end)
		return var34
	end
	var34 = #tbl
	if var34 == 1 then
		var34 = any_load_result1_result1_upvr_4.map(var33_upvr)(tbl[1])
		return var34
	end
	var34 = any_load_result1_result1_upvr_4.combineLatest(tbl)
	var34 = var34:Pipe({any_load_result1_result1_upvr_4.map(function(arg1) -- Line 156
		--[[ Upvalues[2]:
			[1]: var33_upvr (readonly)
			[2]: arg_count_upvr (readonly)
		]]
		return var33_upvr(unpack(arg1, 1, arg_count_upvr - 1))
	end)})
	return var34
end
local any_load_result1_result1_upvr_11 = any_load_result1("RxInstanceUtils")
function module_2_upvr.OnChange(arg1) -- Line 179
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_11 (readonly)
	]]
	local var41
	if type(arg1) ~= "string" then
		var41 = false
	else
		var41 = true
	end
	assert(var41, "Bad propertyName")
	return function(arg1_4) -- Line 182
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_11 (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return any_load_result1_result1_upvr_11.observeProperty(arg1_4, arg1)
	end
end
function module_2_upvr.OnEvent(arg1) -- Line 205
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local var43
	if type(arg1) ~= "string" then
		var43 = false
	else
		var43 = true
	end
	assert(var43, "Bad eventName")
	return function(arg1_5) -- Line 208
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return any_load_result1_result1_upvr_4.fromSignal(arg1_5[arg1])
	end
end
function module_2_upvr.Attached(arg1) -- Line 219
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_10 (readonly)
		[2]: any_load_result1_result1_upvr_6 (readonly)
		[3]: any_load_result1_result1_upvr_5 (readonly)
	]]
	return function(arg1_6) -- Line 220
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_10 (copied, readonly)
			[2]: any_load_result1_result1_upvr_6 (copied, readonly)
			[3]: arg1 (readonly)
			[4]: any_load_result1_result1_upvr_5 (copied, readonly)
		]]
		return any_load_result1_result1_upvr_10.new(function(arg1_7) -- Line 221
			--[[ Upvalues[4]:
				[1]: any_load_result1_result1_upvr_6 (copied, readonly)
				[2]: arg1 (copied, readonly)
				[3]: arg1_6 (readonly)
				[4]: any_load_result1_result1_upvr_5 (copied, readonly)
			]]
			local any_new_result1_6 = any_load_result1_result1_upvr_6.new()
			local arg1_result1 = arg1(arg1_6)
			if any_load_result1_result1_upvr_5.isValidTask(arg1_result1) then
				any_new_result1_6:GiveTask(arg1_result1)
			end
			arg1_7:Fire(arg1_result1)
			return any_new_result1_6
		end)
	end
end
function module_2_upvr.ComputedPairs(arg1, arg2) -- Line 243
	--[[ Upvalues[5]:
		[1]: module_2_upvr (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
		[3]: any_load_result1_result1_upvr_10 (readonly)
		[4]: any_load_result1_result1_upvr_6 (readonly)
		[5]: any_load_result1_result1_upvr_2 (readonly)
	]]
	local any_toPropertyObservable_result1_upvr = module_2_upvr.toPropertyObservable(arg1)
	if not any_toPropertyObservable_result1_upvr then
		any_toPropertyObservable_result1_upvr = any_load_result1_result1_upvr_4.of(arg1)
	end
	return any_load_result1_result1_upvr_10.new(function(arg1_8) -- Line 246
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_6 (copied, readonly)
			[2]: any_toPropertyObservable_result1_upvr (readonly)
			[3]: arg2 (readonly)
			[4]: any_load_result1_result1_upvr_2 (copied, readonly)
		]]
		local any_new_result1 = any_load_result1_result1_upvr_6.new()
		local any_new_result1_13_upvr = any_load_result1_result1_upvr_6.new()
		any_new_result1:GiveTask(any_new_result1_13_upvr)
		local tbl_upvr = {}
		any_new_result1:GiveTask(any_toPropertyObservable_result1_upvr:Subscribe(function(arg1_9) -- Line 253
			--[[ Upvalues[6]:
				[1]: tbl_upvr (readonly)
				[2]: any_load_result1_result1_upvr_6 (copied, readonly)
				[3]: arg2 (copied, readonly)
				[4]: any_load_result1_result1_upvr_2 (copied, readonly)
				[5]: arg1_8 (readonly)
				[6]: any_new_result1_13_upvr (readonly)
			]]
			local var67
			if type(arg1_9) ~= "table" then
				var67 = false
			else
				var67 = true
			end
			assert(var67, "Bad value emitted from source")
			var67 = pairs(tbl_upvr)
			local pairs_result1_3, pairs_result2, pairs_result3_4 = pairs(tbl_upvr)
			for i_3, _ in pairs_result1_3, pairs_result2, pairs_result3_4 do
				({})[i_3] = true
				local var72
			end
			pairs_result1_3 = pairs(arg1_9)
			local pairs_result1, pairs_result2_7, pairs_result3_5 = pairs(arg1_9)
			for i_4, v_3 in pairs_result1, pairs_result2_7, pairs_result3_5 do
				var72[i_4] = nil
				if tbl_upvr[i_4] ~= v_3 then
					local any_new_result1_3 = any_load_result1_result1_upvr_6.new()
					local any_new_result1_7 = any_load_result1_result1_upvr_2.new(arg2(i_4, v_3, any_new_result1_3))
					any_new_result1_3:GiveTask(any_new_result1_7)
					arg1_8:Fire(any_new_result1_7)
					any_new_result1_13_upvr[i_4] = any_new_result1_3
					tbl_upvr[i_4] = v_3
				end
			end
			pairs_result1 = pairs(var72)
			for i_5, _ in pairs(var72) do
				any_new_result1_13_upvr[i_5] = nil
				tbl_upvr[i_5] = nil
			end
		end), arg1_8:GetFailComplete())
		return any_new_result1
	end)
end
local any_load_result1_result1_upvr_7 = any_load_result1("AccelTween")
function module_2_upvr.AccelTween(arg1, arg2) -- Line 296
	--[[ Upvalues[6]:
		[1]: module_2_upvr (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
		[3]: any_load_result1_result1_upvr_7 (readonly)
		[4]: any_load_result1_result1_upvr_10 (readonly)
		[5]: any_load_result1_result1_upvr_6 (readonly)
		[6]: any_load_result1_result1_upvr (readonly)
	]]
	local any_toPropertyObservable_result1_upvr_2 = module_2_upvr.toPropertyObservable(arg1)
	if not any_toPropertyObservable_result1_upvr_2 then
		any_toPropertyObservable_result1_upvr_2 = any_load_result1_result1_upvr_4.of(arg1)
	end
	local any_toNumberObservable_result1_upvr_3 = module_2_upvr.toNumberObservable(arg2)
	local function _(arg1_10, arg2_2) -- Line 300, Named "createAccelTween"
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_7 (copied, readonly)
			[2]: any_toNumberObservable_result1_upvr_3 (readonly)
		]]
		local any_new_result1_4_upvr = any_load_result1_result1_upvr_7.new(arg2_2)
		if any_toNumberObservable_result1_upvr_3 then
			arg1_10:GiveTask(any_toNumberObservable_result1_upvr_3:Subscribe(function(arg1_11) -- Line 304
				--[[ Upvalues[1]:
					[1]: any_new_result1_4_upvr (readonly)
				]]
				local var86
				if type(arg1_11) ~= "number" then
					var86 = false
				else
					var86 = true
				end
				assert(var86, "Bad value")
				any_new_result1_4_upvr.a = arg1_11
			end))
		end
		return any_new_result1_4_upvr
	end
	return any_load_result1_result1_upvr_10.new(function(arg1_12) -- Line 314
		--[[ Upvalues[5]:
			[1]: any_load_result1_result1_upvr_6 (copied, readonly)
			[2]: any_load_result1_result1_upvr (copied, readonly)
			[3]: any_toPropertyObservable_result1_upvr_2 (readonly)
			[4]: any_load_result1_result1_upvr_7 (copied, readonly)
			[5]: any_toNumberObservable_result1_upvr_3 (readonly)
		]]
		local var88_upvw
		local any_new_result1_10_upvr = any_load_result1_result1_upvr_6.new()
		local any_bindToRenderStep_result1_upvr, any_bindToRenderStep_result2_2 = any_load_result1_result1_upvr.bindToRenderStep(function() -- Line 318
			--[[ Upvalues[2]:
				[1]: arg1_12 (readonly)
				[2]: var88_upvw (read and write)
			]]
			arg1_12:Fire(var88_upvw.p)
			local var91
			if 0 >= var88_upvw.rtime then
				var91 = false
			else
				var91 = true
			end
			return var91
		end)
		any_new_result1_10_upvr:GiveTask(any_bindToRenderStep_result2_2)
		any_new_result1_10_upvr:GiveTask(any_toPropertyObservable_result1_upvr_2:Subscribe(function(arg1_13) -- Line 324
			--[[ Upvalues[5]:
				[1]: var88_upvw (read and write)
				[2]: any_new_result1_10_upvr (readonly)
				[3]: any_load_result1_result1_upvr_7 (copied, readonly)
				[4]: any_toNumberObservable_result1_upvr_3 (copied, readonly)
				[5]: any_bindToRenderStep_result1_upvr (readonly)
			]]
			local var95 = var88_upvw
			if not var95 then
				local any_new_result1_14_upvr = any_load_result1_result1_upvr_7.new(arg1_13)
				if any_toNumberObservable_result1_upvr_3 then
					any_new_result1_10_upvr:GiveTask(any_toNumberObservable_result1_upvr_3:Subscribe(function(arg1_14) -- Line 304
						--[[ Upvalues[1]:
							[1]: any_new_result1_14_upvr (readonly)
						]]
						local var98
						if type(arg1_14) ~= "number" then
							var98 = false
						else
							var98 = true
						end
						assert(var98, "Bad value")
						any_new_result1_14_upvr.a = arg1_14
					end))
				end
				var95 = any_new_result1_14_upvr
			end
			var88_upvw = var95
			var88_upvw.t = arg1_13
			any_bindToRenderStep_result1_upvr()
		end))
		return any_new_result1_10_upvr
	end)
end
local any_load_result1_result1_upvr_13 = any_load_result1("Spring")
local var1_result1_upvr_2 = any_load_result1("SpringUtils")
function module_2_upvr.Spring(arg1, arg2, arg3) -- Line 355
	--[[ Upvalues[7]:
		[1]: module_2_upvr (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
		[3]: any_load_result1_result1_upvr_13 (readonly)
		[4]: any_load_result1_result1_upvr_10 (readonly)
		[5]: any_load_result1_result1_upvr_6 (readonly)
		[6]: any_load_result1_result1_upvr (readonly)
		[7]: var1_result1_upvr_2 (readonly)
	]]
	local any_toPropertyObservable_result1_3_upvr = module_2_upvr.toPropertyObservable(arg1)
	if not any_toPropertyObservable_result1_3_upvr then
		any_toPropertyObservable_result1_3_upvr = any_load_result1_result1_upvr_4.of(arg1)
	end
	local any_toNumberObservable_result1_upvr = module_2_upvr.toNumberObservable(arg2)
	local any_toNumberObservable_result1_upvr_2 = module_2_upvr.toNumberObservable(arg3)
	local function createSpring_upvr(arg1_15, arg2_3) -- Line 360, Named "createSpring"
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_13 (copied, readonly)
			[2]: any_toNumberObservable_result1_upvr (readonly)
			[3]: any_toNumberObservable_result1_upvr_2 (readonly)
		]]
		local any_new_result1_12_upvr = any_load_result1_result1_upvr_13.new(arg2_3)
		if any_toNumberObservable_result1_upvr then
			arg1_15:GiveTask(any_toNumberObservable_result1_upvr:Subscribe(function(arg1_16) -- Line 364
				--[[ Upvalues[1]:
					[1]: any_new_result1_12_upvr (readonly)
				]]
				local var106
				if type(arg1_16) ~= "number" then
					var106 = false
				else
					var106 = true
				end
				assert(var106, "Bad value")
				any_new_result1_12_upvr.Speed = arg1_16
			end))
		end
		if any_toNumberObservable_result1_upvr_2 then
			arg1_15:GiveTask(any_toNumberObservable_result1_upvr_2:Subscribe(function(arg1_17) -- Line 371
				--[[ Upvalues[1]:
					[1]: any_new_result1_12_upvr (readonly)
				]]
				local var108
				if type(arg1_17) ~= "number" then
					var108 = false
				else
					var108 = true
				end
				assert(var108, "Bad value")
				any_new_result1_12_upvr.Damper = arg1_17
			end))
		end
		return any_new_result1_12_upvr
	end
	return any_load_result1_result1_upvr_10.new(function(arg1_18) -- Line 382
		--[[ Upvalues[5]:
			[1]: any_load_result1_result1_upvr_6 (copied, readonly)
			[2]: any_load_result1_result1_upvr (copied, readonly)
			[3]: var1_result1_upvr_2 (copied, readonly)
			[4]: any_toPropertyObservable_result1_3_upvr (readonly)
			[5]: createSpring_upvr (readonly)
		]]
		local var110_upvw
		local any_new_result1_17_upvr = any_load_result1_result1_upvr_6.new()
		local any_bindToRenderStep_result1_upvr_2, any_bindToRenderStep_result2 = any_load_result1_result1_upvr.bindToRenderStep(function() -- Line 386
			--[[ Upvalues[3]:
				[1]: var1_result1_upvr_2 (copied, readonly)
				[2]: var110_upvw (read and write)
				[3]: arg1_18 (readonly)
			]]
			local any_animating_result1, any_animating_result2 = var1_result1_upvr_2.animating(var110_upvw)
			arg1_18:Fire(var1_result1_upvr_2.fromLinearIfNeeded(any_animating_result2))
			return any_animating_result1
		end)
		any_new_result1_17_upvr:GiveTask(any_bindToRenderStep_result2)
		any_new_result1_17_upvr:GiveTask(any_toPropertyObservable_result1_3_upvr:Subscribe(function(arg1_19) -- Line 393
			--[[ Upvalues[5]:
				[1]: var1_result1_upvr_2 (copied, readonly)
				[2]: var110_upvw (read and write)
				[3]: createSpring_upvr (copied, readonly)
				[4]: any_new_result1_17_upvr (readonly)
				[5]: any_bindToRenderStep_result1_upvr_2 (readonly)
			]]
			if arg1_19 then
				local var118 = var110_upvw
				if not var118 then
					var118 = createSpring_upvr(any_new_result1_17_upvr, var1_result1_upvr_2.toLinearIfNeeded(arg1_19))
				end
				var110_upvw = var118
				var110_upvw.t = var1_result1_upvr_2.toLinearIfNeeded(arg1_19)
				any_bindToRenderStep_result1_upvr_2()
			else
				warn("Got nil value from emitted source")
			end
		end))
		return any_new_result1_17_upvr
	end)
end
local any_load_result1_result1_upvr_8 = any_load_result1("RxValueBaseUtils")
local var1_result1_upvr_4 = any_load_result1("ValueObjectUtils")
function module_2_upvr.toPropertyObservable(arg1) -- Line 414
	--[[ Upvalues[7]:
		[1]: any_load_result1_result1_upvr_10 (readonly)
		[2]: var1_result1_upvr (readonly)
		[3]: any_load_result1_result1_upvr_8 (readonly)
		[4]: var1_result1_upvr_5 (readonly)
		[5]: var1_result1_upvr_4 (readonly)
		[6]: any_load_result1_result1_upvr_12 (readonly)
		[7]: any_load_result1_result1_upvr_4 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 21 start (CF ANALYSIS FAILED)
	if any_load_result1_result1_upvr_10.isObservable(arg1) then
		return arg1
	end
	if typeof(arg1) == "Instance" then
		if var1_result1_upvr.isValueBase(arg1) then
			do
				return any_load_result1_result1_upvr_8.observeValue(arg1)
			end
			-- KONSTANTWARNING: GOTO [58] #48
		end
	elseif type(arg1) == "table" then
		if var1_result1_upvr_5.isValueObject(arg1) then
			return var1_result1_upvr_4.observeValue(arg1)
		end
		if any_load_result1_result1_upvr_12.isPromise(arg1) then
			return any_load_result1_result1_upvr_4.fromPromise(arg1)
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 21 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [58] 48. Error Block 12 start (CF ANALYSIS FAILED)
	do
		return nil
	end
	-- KONSTANTERROR: [58] 48. Error Block 12 end (CF ANALYSIS FAILED)
end
function module_2_upvr.toNumberObservable(arg1) -- Line 439
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: module_2_upvr (readonly)
	]]
	if type(arg1) == "number" then
		return any_load_result1_result1_upvr_4.of(arg1)
	end
	return module_2_upvr.toPropertyObservable(arg1)
end
function module_2_upvr.toEventObservable(arg1) -- Line 453
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_10 (readonly)
		[2]: any_load_result1_result1_upvr_3 (readonly)
		[3]: any_load_result1_result1_upvr_4 (readonly)
	]]
	if any_load_result1_result1_upvr_10.isObservable(arg1) then
		return arg1
	end
	if typeof(arg1) == "RBXScriptSignal" or any_load_result1_result1_upvr_3.isSignal(arg1) then
		return any_load_result1_result1_upvr_4.fromSignal(arg1)
	end
	return nil
end
function module_2_upvr.toEventHandler(arg1) -- Line 469
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr_3 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 21 start (CF ANALYSIS FAILED)
	if type(arg1) == "function" then
		return arg1
	end
	if typeof(arg1) == "Instance" then
		if var1_result1_upvr.isValueBase(arg1) then
			do
				return function(arg1_20) -- Line 475
					--[[ Upvalues[1]:
						[1]: arg1 (readonly)
					]]
					arg1.Value = arg1_20
				end
			end
			-- KONSTANTWARNING: GOTO [48] #39
		end
	elseif type(arg1) == "table" then
		if any_load_result1_result1_upvr_3.isSignal(arg1) then
			return function(...) -- Line 481
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				arg1:Fire(...)
			end
		end
		if arg1.ClassName == "ValueObject" then
			return function(arg1_21) -- Line 485
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				arg1.Value = arg1_21
			end
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 21 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [48] 39. Error Block 12 start (CF ANALYSIS FAILED)
	do
		return nil
	end
	-- KONSTANTERROR: [48] 39. Error Block 12 end (CF ANALYSIS FAILED)
end
function module_2_upvr.Children(arg1, arg2) -- Line 538
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local var124
	if typeof(arg1) ~= "Instance" then
		var124 = false
	else
		var124 = true
	end
	assert(var124, "Bad parent")
	var124 = module_2_upvr
	var124 = arg2
	if var124._observeChildren(var124) then
		var124 = var124._observeChildren(var124):Pipe({any_load_result1_result1_upvr_4.tap(function(arg1_22) -- Line 544
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1_22.Parent = arg1
		end)})
		return var124
	end
	var124 = any_load_result1_result1_upvr_4.EMPTY
	return var124
end
function module_2_upvr.Instance(arg1) -- Line 589
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_10 (readonly)
	]]
	return any_load_result1_result1_upvr_10.new(function(arg1_23) -- Line 590
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1_23:Fire(arg1)
	end)
end
local var1_result1_upvr_3 = any_load_result1("BrioUtils")
function module_2_upvr.Single(arg1) -- Line 625
	--[[ Upvalues[4]:
		[1]: any_load_result1_result1_upvr_10 (readonly)
		[2]: any_load_result1_result1_upvr_6 (readonly)
		[3]: any_load_result1_result1_upvr_2 (readonly)
		[4]: var1_result1_upvr_3 (readonly)
	]]
	return any_load_result1_result1_upvr_10.new(function(arg1_24) -- Line 626
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_6 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: any_load_result1_result1_upvr_2 (copied, readonly)
			[4]: var1_result1_upvr_3 (copied, readonly)
		]]
		local any_new_result1_11_upvr = any_load_result1_result1_upvr_6.new()
		any_new_result1_11_upvr:GiveTask(arg1:Subscribe(function(arg1_25) -- Line 629
			--[[ Upvalues[4]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: var1_result1_upvr_3 (copied, readonly)
				[3]: any_new_result1_11_upvr (readonly)
				[4]: arg1_24 (readonly)
			]]
			if any_load_result1_result1_upvr_2.isBrio(arg1_25) then
				local clone = var1_result1_upvr_3.clone(arg1_25)
				any_new_result1_11_upvr._current = clone
				arg1_24:Fire(clone)
				return clone
			end
			local any_new_result1_5 = any_load_result1_result1_upvr_2.new(arg1_25)
			any_new_result1_11_upvr._current = any_new_result1_5
			arg1_24:Fire(any_new_result1_5)
			return any_new_result1_5
		end))
		return any_new_result1_11_upvr
	end)
end
function module_2_upvr._observeChildren(arg1) -- Line 654
	--[[ Upvalues[9]:
		[1]: any_load_result1_result1_upvr_10 (readonly)
		[2]: var1_result1_upvr_5 (readonly)
		[3]: any_load_result1_result1_upvr_6 (readonly)
		[4]: module_2_upvr (readonly)
		[5]: any_load_result1_result1_upvr_5 (readonly)
		[6]: any_load_result1_result1_upvr_2 (readonly)
		[7]: any_load_result1_result1_upvr_12 (readonly)
		[8]: any_load_result1_result1_upvr_4 (readonly)
		[9]: any_load_result1_result1_upvr_3 (readonly)
	]]
	local var139_upvw
	if typeof(arg1) == "Instance" then
		return any_load_result1_result1_upvr_10.new(function(arg1_26) -- Line 657
			--[[ Upvalues[1]:
				[1]: var139_upvw (read and write)
			]]
			arg1_26:Fire(var139_upvw)
			return var139_upvw
		end)
	end
	if var1_result1_upvr_5.isValueObject(var139_upvw) then
		return any_load_result1_result1_upvr_10.new(function(arg1_27) -- Line 665
			--[[ Upvalues[4]:
				[1]: any_load_result1_result1_upvr_6 (copied, readonly)
				[2]: var139_upvw (read and write)
				[3]: module_2_upvr (copied, readonly)
				[4]: any_load_result1_result1_upvr_5 (copied, readonly)
			]]
			local any_new_result1_15_upvr = any_load_result1_result1_upvr_6.new()
			local function update() -- Line 669
				--[[ Upvalues[5]:
					[1]: var139_upvw (copied, read and write)
					[2]: any_new_result1_15_upvr (readonly)
					[3]: arg1_27 (readonly)
					[4]: module_2_upvr (copied, readonly)
					[5]: any_load_result1_result1_upvr_5 (copied, readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
				local Value = var139_upvw.Value
				-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [10] 8. Error Block 2 start (CF ANALYSIS FAILED)
				any_new_result1_15_upvr._current = Value
				arg1_27:Fire(Value)
				do
					return
				end
				-- KONSTANTERROR: [10] 8. Error Block 2 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [19] 15. Error Block 3 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [19] 15. Error Block 3 end (CF ANALYSIS FAILED)
			end
			any_new_result1_15_upvr:GiveTask(var139_upvw.Changed:Connect(update))
			update()
			return any_new_result1_15_upvr
		end)
	end
	if any_load_result1_result1_upvr_2.isBrio(var139_upvw) then
		return any_load_result1_result1_upvr_10.new(function(arg1_28) -- Line 720
			--[[ Upvalues[2]:
				[1]: var139_upvw (read and write)
				[2]: module_2_upvr (copied, readonly)
			]]
			if var139_upvw:IsDead() then
				return nil
			end
			local any_GetValue_result1 = var139_upvw:GetValue()
			if typeof(any_GetValue_result1) == "Instance" then
				local any_ToMaid_result1 = var139_upvw:ToMaid()
				any_ToMaid_result1:GiveTask(any_GetValue_result1)
				arg1_28:Fire(any_GetValue_result1)
				return any_ToMaid_result1
			end
			local any__observeChildren_result1 = module_2_upvr._observeChildren(any_GetValue_result1)
			if any__observeChildren_result1 then
				local any_ToMaid_result1_2_upvr = var139_upvw:ToMaid()
				any_ToMaid_result1_2_upvr:GiveTask(any__observeChildren_result1:Subscribe(function(arg1_29) -- Line 741
					--[[ Upvalues[1]:
						[1]: arg1_28 (readonly)
					]]
					arg1_28:Fire(arg1_29)
				end, function(...) -- Line 743
					--[[ Upvalues[1]:
						[1]: arg1_28 (readonly)
					]]
					arg1_28:Fail(...)
				end, function() -- Line 745
					--[[ Upvalues[1]:
						[1]: any_ToMaid_result1_2_upvr (readonly)
					]]
					any_ToMaid_result1_2_upvr:DoCleaning()
				end))
				return any_ToMaid_result1_2_upvr
			end
			any_ToMaid_result1_2_upvr = warn
			any_ToMaid_result1_2_upvr("Unknown type in brio %q":format(typeof(any_GetValue_result1)))
			any_ToMaid_result1_2_upvr = nil
			return any_ToMaid_result1_2_upvr
		end)
	end
	if any_load_result1_result1_upvr_12.isPromise(var139_upvw) then
	end
	local function INLINED() -- Internal function, doesn't exist in bytecode
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return typeof(any_load_result1_result1_upvr_4.fromPromise(var139_upvw)) == "RBXScriptSignal"
	end
	if any_load_result1_result1_upvr_3.isSignal(any_load_result1_result1_upvr_4.fromPromise(var139_upvw)) or INLINED() then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	end
	if any_load_result1_result1_upvr_10.isObservable(any_load_result1_result1_upvr_4.fromSignal(any_load_result1_result1_upvr_4.fromPromise(var139_upvw))) then
		local any_fromSignal_result1_upvw = any_load_result1_result1_upvr_4.fromSignal(any_load_result1_result1_upvr_4.fromPromise(var139_upvw))
		return any_load_result1_result1_upvr_10.new(function(arg1_30) -- Line 769
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_6 (copied, readonly)
				[2]: any_fromSignal_result1_upvw (read and write)
				[3]: module_2_upvr (copied, readonly)
			]]
			local any_new_result1_9_upvr = any_load_result1_result1_upvr_6.new()
			any_new_result1_9_upvr:GiveTask(any_fromSignal_result1_upvw:Subscribe(function(arg1_31) -- Line 772
				--[[ Upvalues[4]:
					[1]: any_new_result1_9_upvr (readonly)
					[2]: arg1_30 (readonly)
					[3]: module_2_upvr (copied, readonly)
					[4]: any_load_result1_result1_upvr_6 (copied, readonly)
				]]
				if typeof(arg1_31) == "Instance" then
					any_new_result1_9_upvr:GiveTask(arg1_31)
					arg1_30:Fire(arg1_31)
				else
					local any__observeChildren_result1_3 = module_2_upvr._observeChildren(arg1_31)
					if any__observeChildren_result1_3 then
						local any_new_result1_8_upvr = any_load_result1_result1_upvr_6.new()
						any_new_result1_8_upvr:GiveTask(any__observeChildren_result1_3:Subscribe(function(arg1_32) -- Line 786
							--[[ Upvalues[1]:
								[1]: arg1_30 (copied, readonly)
							]]
							arg1_30:Fire(arg1_32)
						end, function(...) -- Line 788
							--[[ Upvalues[2]:
								[1]: any_new_result1_8_upvr (readonly)
								[2]: arg1_30 (copied, readonly)
							]]
							any_new_result1_8_upvr:DoCleaning()
							arg1_30:Fail(...)
						end, function() -- Line 791
							--[[ Upvalues[1]:
								[1]: any_new_result1_8_upvr (readonly)
							]]
							any_new_result1_8_upvr:DoCleaning()
						end))
						any_new_result1_8_upvr:GiveTask(function() -- Line 795
							--[[ Upvalues[2]:
								[1]: any_new_result1_9_upvr (copied, readonly)
								[2]: any_new_result1_8_upvr (readonly)
							]]
							any_new_result1_9_upvr[any_new_result1_8_upvr] = nil
						end)
						any_new_result1_9_upvr[any_new_result1_8_upvr] = any_new_result1_8_upvr
						return
					end
					any_new_result1_8_upvr = warn
					any_new_result1_8_upvr("Failed to convert %q into children":format(tostring(arg1_31)))
				end
			end, function(...) -- Line 802
				--[[ Upvalues[1]:
					[1]: arg1_30 (readonly)
				]]
				arg1_30:Fire(...)
			end, function() -- Line 804
			end))
			return any_new_result1_9_upvr
		end)
	end
	if type(any_fromSignal_result1_upvw) == "table" and not getmetatable(any_fromSignal_result1_upvw) then
		local module = {}
		for i_6, v_5 in pairs(any_fromSignal_result1_upvw) do
			local any__observeChildren_result1_2 = module_2_upvr._observeChildren(v_5)
			if any__observeChildren_result1_2 then
				table.insert(module, any__observeChildren_result1_2)
			else
				warn("Failed to convert [%s] %q into children":format(tostring(i_6), tostring(v_5)))
			end
		end
		if next(module) then
			return any_load_result1_result1_upvr_4.merge(module)
		end
		return nil
	end
	return nil
end
function module_2_upvr.mount(arg1, arg2) -- Line 850
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_6 (readonly)
		[2]: module_2_upvr (readonly)
		[3]: any_load_result1_result1_upvr_10 (readonly)
	]]
	local any_new_result1_16 = any_load_result1_result1_upvr_6.new()
	local var181
	for i_7_upvr, v_6_upvr in pairs(arg2) do
		if type(i_7_upvr) == "string" then
			if i_7_upvr == "Parent" then
				var181 = v_6_upvr
			else
				local any_toPropertyObservable_result1_2 = module_2_upvr.toPropertyObservable(v_6_upvr)
				if any_toPropertyObservable_result1_2 then
					any_new_result1_16:GiveTask(any_toPropertyObservable_result1_2:Subscribe(function(arg1_33) -- Line 863
						--[[ Upvalues[2]:
							[1]: arg1 (readonly)
							[2]: i_7_upvr (readonly)
						]]
						task.spawn(function() -- Line 864
							--[[ Upvalues[3]:
								[1]: arg1 (copied, readonly)
								[2]: i_7_upvr (copied, readonly)
								[3]: arg1_33 (readonly)
							]]
							arg1[i_7_upvr] = arg1_33
						end)
					end))
				else
					task.spawn(function() -- Line 869
						--[[ Upvalues[3]:
							[1]: arg1 (readonly)
							[2]: i_7_upvr (readonly)
							[3]: v_6_upvr (readonly)
						]]
						arg1[i_7_upvr] = v_6_upvr
					end)
				end
			end
		elseif type(i_7_upvr) == "function" then
			local any_toEventObservable_result1 = module_2_upvr.toEventObservable(i_7_upvr(arg1, v_6_upvr))
			if any_load_result1_result1_upvr_10.isObservable(any_toEventObservable_result1) then
				table.insert({}, {any_toEventObservable_result1, v_6_upvr})
			else
				warn("Unable to apply event listener %q":format(tostring(i_7_upvr)))
			end
		else
			warn("Unable to apply property %q":format(tostring(i_7_upvr)))
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	for i_8, v_7 in pairs({}) do
		any_new_result1_16:GiveTask(v_7[1]:Subscribe(module_2_upvr.toEventHandler(v_7[2])))
	end
	if var181 then
		if module_2_upvr.toPropertyObservable(var181) then
			i_8 = module_2_upvr.toPropertyObservable(var181):Subscribe(function(arg1_34) -- Line 895
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				arg1.Parent = arg1_34
			end)
			any_new_result1_16:GiveTask(i_8)
			return any_new_result1_16
		end
		arg1.Parent = var181
	end
	return any_new_result1_16
end
return module_2_upvr