--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.Rx
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:10
-- Luau version 6, Types version 3
-- Time taken: 0.024663 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local any_load_result1_result1_upvr_2 = any_load_result1("Maid")
local any_load_result1_result1_upvr_4 = any_load_result1("Observable")
local any_load_result1_result1_upvr_3 = any_load_result1("Promise")
local any_named_result1_upvw = any_load_result1("Symbol").named("unsetValue")
local module_upvr = {
	EMPTY = any_load_result1_result1_upvr_4.new(function(arg1) -- Line 40
		arg1:Complete()
	end);
	NEVER = any_load_result1_result1_upvr_4.new(function(arg1) -- Line 43
	end);
	pipe = function(arg1) -- Line 55, Named "pipe"
		local var13
		if type(arg1) ~= "table" then
			var13 = false
		else
			var13 = true
		end
		assert(var13, "Bad transformers")
		var13 = arg1
		for i, v in pairs(var13) do
			if type(v) ~= "function" then
				error("[Rx.pipe] Bad pipe value of type %q at index %q, expected function":format(type(v), tostring(i)))
			end
		end
		return function(arg1_2) -- Line 64
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			assert(arg1_2, "Bad source")
			for i_2, v_2 in pairs(arg1) do
				local v_2_result1 = v_2(arg1_2)
				local var26
				if type(v_2_result1) ~= "table" or v_2_result1.ClassName ~= "Observable" then
					local function INLINED() -- Internal function, doesn't exist in bytecode
						var26 = v_2_result1.ClassName
						return var26
					end
					if type(v_2_result1) ~= "table" or not INLINED() then
						var26 = ""
					end
					error("[Rx.pipe] - Failed to transform %q in pipe, made %q (%s)":format(tostring(i_2), tostring(v_2_result1), tostring(var26)))
				end
			end
			return v_2_result1
		end
	end;
	of = function(...) -- Line 93, Named "of"
		--[[ Upvalues[1]:
			[1]: any_load_result1_result1_upvr_4 (readonly)
		]]
		local packed_5_upvr = table.pack(...)
		return any_load_result1_result1_upvr_4.new(function(arg1) -- Line 96
			--[[ Upvalues[1]:
				[1]: packed_5_upvr (readonly)
			]]
			for i_3 = 1, packed_5_upvr.n do
				arg1:Fire(packed_5_upvr[i_3])
			end
			arg1:Complete()
		end)
	end;
}
function module_upvr.from(arg1) -- Line 112
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_3 (readonly)
		[2]: module_upvr (readonly)
	]]
	if any_load_result1_result1_upvr_3.isPromise(arg1) then
		return module_upvr.fromPromise(arg1)
	end
	if type(arg1) == "table" then
		return module_upvr.of(unpack(arg1))
	end
	error("[Rx.from] - cannot convert")
end
local any_load_result1_result1_upvr_5 = any_load_result1("CancelToken")
function module_upvr.toPromise(arg1, arg2) -- Line 129
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_2 (readonly)
		[2]: any_load_result1_result1_upvr_5 (readonly)
		[3]: any_load_result1_result1_upvr_3 (readonly)
	]]
	local any_new_result1_3_upvr = any_load_result1_result1_upvr_2.new()
	local any_new_result1_2_upvr = any_load_result1_result1_upvr_5.new(function(arg1_3) -- Line 132
		--[[ Upvalues[2]:
			[1]: any_new_result1_3_upvr (readonly)
			[2]: arg2 (readonly)
		]]
		any_new_result1_3_upvr:GiveTask(arg1_3)
		if arg2 then
			if arg2:IsCancelled() then
				arg1_3()
				return
			end
			any_new_result1_3_upvr:GiveTask(arg2.Cancelled:Connect(arg1_3))
		end
	end)
	local any_new_result1 = any_load_result1_result1_upvr_3.new(function(arg1_4, arg2_2) -- Line 143
		--[[ Upvalues[3]:
			[1]: any_new_result1_2_upvr (readonly)
			[2]: any_new_result1_3_upvr (readonly)
			[3]: arg1 (readonly)
		]]
		if any_new_result1_2_upvr:IsCancelled() then
			arg2_2()
		else
			any_new_result1_3_upvr:GiveTask(any_new_result1_2_upvr.Cancelled:Connect(function() -- Line 149
				--[[ Upvalues[1]:
					[1]: arg2_2 (readonly)
				]]
				arg2_2()
			end))
			any_new_result1_3_upvr:GiveTask(arg1:Subscribe(arg1_4, arg2_2, arg2_2))
		end
	end)
	any_new_result1:Finally(function() -- Line 156
		--[[ Upvalues[1]:
			[1]: any_new_result1_3_upvr (readonly)
		]]
		any_new_result1_3_upvr:DoCleaning()
	end)
	return any_new_result1
end
function module_upvr.merge(arg1) -- Line 169
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	local var42
	if type(arg1) ~= "table" then
		var42 = false
	else
		var42 = true
	end
	assert(var42, "Bad observables")
	var42 = arg1
	local pairs_result1_4, pairs_result2_5, pairs_result3_7 = pairs(var42)
	for _, v_3 in pairs_result1_4, pairs_result2_5, pairs_result3_7 do
		assert(any_load_result1_result1_upvr_4.isObservable(v_3), "Not an observable")
	end
	pairs_result2_5 = any_load_result1_result1_upvr_4
	function pairs_result2_5(arg1_5) -- Line 176
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_new_result1_5 = any_load_result1_result1_upvr_2.new()
		for _, v_4 in pairs(arg1) do
			any_new_result1_5:GiveTask(v_4:Subscribe(arg1_5:GetFireFailComplete()))
		end
		return any_new_result1_5
	end
	return pairs_result2_5.new(pairs_result2_5)
end
function module_upvr.fromSignal(arg1) -- Line 194
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	return any_load_result1_result1_upvr_4.new(function(arg1_6) -- Line 195
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return arg1:Connect(function(...) -- Line 197
			--[[ Upvalues[1]:
				[1]: arg1_6 (readonly)
			]]
			arg1_6:Fire(...)
		end)
	end)
end
function module_upvr.fromPromise(arg1) -- Line 210
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_3 (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
		[3]: any_load_result1_result1_upvr_2 (readonly)
	]]
	assert(any_load_result1_result1_upvr_3.isPromise(arg1))
	return any_load_result1_result1_upvr_4.new(function(arg1_7) -- Line 213
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
		]]
		if arg1:IsFulfilled() then
			arg1_7:Fire(arg1:Wait())
			arg1_7:Complete()
			return nil
		end
		local any_new_result1_15 = any_load_result1_result1_upvr_2.new()
		local var59_upvw = true
		any_new_result1_15:GiveTask(function() -- Line 223
			--[[ Upvalues[1]:
				[1]: var59_upvw (read and write)
			]]
			var59_upvw = false
		end)
		arg1:Then(function(...) -- Line 228
			--[[ Upvalues[2]:
				[1]: var59_upvw (read and write)
				[2]: arg1_7 (readonly)
			]]
			if var59_upvw then
				arg1_7:Fire(...)
				arg1_7:Complete()
			end
		end, function(...) -- Line 234
			--[[ Upvalues[2]:
				[1]: var59_upvw (read and write)
				[2]: arg1_7 (readonly)
			]]
			if var59_upvw then
				arg1_7:Fail(...)
				arg1_7:Complete()
			end
		end)
		return any_new_result1_15
	end)
end
function module_upvr.tap(arg1, arg2, arg3) -- Line 256
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local var63 = true
	if type(arg1) ~= "function" then
		if arg1 ~= nil then
			var63 = false
		else
			var63 = true
		end
	end
	assert(var63, "Bad onFire")
	var63 = true
	if type(arg2) ~= "function" then
		if arg2 ~= nil then
			var63 = false
		else
			var63 = true
		end
	end
	assert(var63, "Bad onError")
	var63 = true
	if type(arg3) ~= "function" then
		if arg3 ~= nil then
			var63 = false
		else
			var63 = true
		end
	end
	assert(var63, "Bad onComplete")
	return function(arg1_8) -- Line 261
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
			[4]: arg3 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_8), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_9) -- Line 264
			--[[ Upvalues[4]:
				[1]: arg1_8 (readonly)
				[2]: arg1 (copied, readonly)
				[3]: arg2 (copied, readonly)
				[4]: arg3 (copied, readonly)
			]]
			return arg1_8:Subscribe(function(...) -- Line 266
				--[[ Upvalues[2]:
					[1]: arg1 (copied, readonly)
					[2]: arg1_9 (readonly)
				]]
				if arg1 then
					arg1(...)
				end
				if arg1_9:IsPending() then
					arg1_9:Fire(...)
				end
			end, function(...) -- Line 274
				--[[ Upvalues[2]:
					[1]: arg2 (copied, readonly)
					[2]: arg1_9 (readonly)
				]]
				if arg2 then
					arg2(...)
				end
				arg1_9:Error(...)
			end, function(...) -- Line 280
				--[[ Upvalues[2]:
					[1]: arg3 (copied, readonly)
					[2]: arg1_9 (readonly)
				]]
				if arg3 then
					arg3(...)
				end
				arg1_9:Complete(...)
			end)
		end)
	end
end
function module_upvr.start(arg1) -- Line 298
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	return function(arg1_10) -- Line 299
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_10), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_11) -- Line 302
			--[[ Upvalues[2]:
				[1]: arg1 (copied, readonly)
				[2]: arg1_10 (readonly)
			]]
			arg1_11:Fire(arg1())
			return arg1_10:Subscribe(arg1_11:GetFireFailComplete())
		end)
	end
end
function module_upvr.startFrom(arg1) -- Line 316
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local var71
	if type(arg1) ~= "function" then
		var71 = false
	else
		var71 = true
	end
	assert(var71, "Bad callback")
	return function(arg1_12) -- Line 318
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_12), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_13) -- Line 321
			--[[ Upvalues[2]:
				[1]: arg1 (copied, readonly)
				[2]: arg1_12 (readonly)
			]]
			for _, v_5 in pairs(arg1()) do
				arg1_13:Fire(v_5)
			end
			return arg1_12:Subscribe(arg1_13:GetFireFailComplete())
		end)
	end
end
function module_upvr.startWith(arg1) -- Line 338
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local var79
	if type(arg1) ~= "table" then
		var79 = false
	else
		var79 = true
	end
	assert(var79, "Bad values")
	return function(arg1_14) -- Line 341
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_14), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_15) -- Line 344
			--[[ Upvalues[2]:
				[1]: arg1 (copied, readonly)
				[2]: arg1_14 (readonly)
			]]
			for _, v_6 in pairs(arg1) do
				arg1_15:Fire(v_6)
			end
			return arg1_14:Subscribe(arg1_15:GetFireFailComplete())
		end)
	end
end
function module_upvr.defaultsTo(arg1) -- Line 366
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	return function(arg1_16) -- Line 367
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_16), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_17) -- Line 370
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1_16 (readonly)
				[3]: arg1 (copied, readonly)
			]]
			local any_new_result1_20 = any_load_result1_result1_upvr_2.new()
			local var90_upvw = false
			any_new_result1_20:GiveTask(arg1_16:Subscribe(function(...) -- Line 376
				--[[ Upvalues[2]:
					[1]: var90_upvw (read and write)
					[2]: arg1_17 (readonly)
				]]
				var90_upvw = true
				arg1_17:Fire(...)
			end, arg1_17:GetFailComplete()))
			if not var90_upvw then
				arg1_17:Fire(arg1)
			end
			return any_new_result1_20
		end)
	end
end
module_upvr.defaultsToNil = module_upvr.defaultsTo(nil)
function module_upvr.endWith(arg1) -- Line 416
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	return function(arg1_18) -- Line 417
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_18), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_19) -- Line 420
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1_18 (readonly)
				[3]: arg1 (copied, readonly)
			]]
			local any_new_result1_14 = any_load_result1_result1_upvr_2.new()
			any_new_result1_14:GiveTask(arg1_18:Subscribe(function(...) -- Line 424
				--[[ Upvalues[1]:
					[1]: arg1_19 (readonly)
				]]
				arg1_19:Fire(...)
			end, function(...) -- Line 427
				--[[ Upvalues[2]:
					[1]: arg1 (copied, readonly)
					[2]: arg1_19 (readonly)
				]]
				for _, v_7 in pairs(arg1) do
					arg1_19:Fire(v_7)
				end
				arg1_19:Fail(...)
			end), function() -- Line 433
				--[[ Upvalues[2]:
					[1]: arg1 (copied, readonly)
					[2]: arg1_19 (readonly)
				]]
				for _, v_8 in pairs(arg1) do
					arg1_19:Fire(v_8)
				end
				arg1_19:Complete()
			end)
			return any_new_result1_14
		end)
	end
end
function module_upvr.where(arg1) -- Line 460
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local var108
	if type(arg1) ~= "function" then
		var108 = false
	else
		var108 = true
	end
	assert(var108, "Bad predicate callback")
	return function(arg1_20) -- Line 463
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_20), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_21) -- Line 466
			--[[ Upvalues[2]:
				[1]: arg1_20 (readonly)
				[2]: arg1 (copied, readonly)
			]]
			return arg1_20:Subscribe(function(...) -- Line 468
				--[[ Upvalues[2]:
					[1]: arg1 (copied, readonly)
					[2]: arg1_21 (readonly)
				]]
				if arg1(...) then
					arg1_21:Fire(...)
				end
			end, arg1_21:GetFailComplete())
		end)
	end
end
function module_upvr.distinct() -- Line 491
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_named_result1_upvw (readonly)
	]]
	return function(arg1) -- Line 492
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_named_result1_upvw (copied, readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_22) -- Line 495
			--[[ Upvalues[2]:
				[1]: any_named_result1_upvw (copied, readonly)
				[2]: arg1 (readonly)
			]]
			return arg1:Subscribe(function(arg1_23) -- Line 499
				--[[ Upvalues[2]:
					[1]: any_named_result1_upvw (read and write)
					[2]: arg1_22 (readonly)
				]]
				if any_named_result1_upvw == arg1_23 then
				else
					any_named_result1_upvw = arg1_23
					arg1_22:Fire(any_named_result1_upvw)
				end
			end, arg1_22:GetFailComplete())
		end)
	end
end
function module_upvr.mapTo(...) -- Line 519
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local packed_3_upvr = table.pack(...)
	return function(arg1) -- Line 521
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: packed_3_upvr (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_24) -- Line 524
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: packed_3_upvr (copied, readonly)
			]]
			return arg1:Subscribe(function() -- Line 525
				--[[ Upvalues[2]:
					[1]: arg1_24 (readonly)
					[2]: packed_3_upvr (copied, readonly)
				]]
				arg1_24:Fire(table.unpack(packed_3_upvr, 1, packed_3_upvr.n))
			end, arg1_24:GetFailComplete())
		end)
	end
end
function module_upvr.map(arg1) -- Line 548
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local var119
	if type(arg1) ~= "function" then
		var119 = false
	else
		var119 = true
	end
	assert(var119, "Bad project callback")
	return function(arg1_25) -- Line 551
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_25), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_26) -- Line 554
			--[[ Upvalues[2]:
				[1]: arg1_25 (readonly)
				[2]: arg1 (copied, readonly)
			]]
			return arg1_25:Subscribe(function(...) -- Line 555
				--[[ Upvalues[2]:
					[1]: arg1_26 (readonly)
					[2]: arg1 (copied, readonly)
				]]
				arg1_26:Fire(arg1(...))
			end, arg1_26:GetFailComplete())
		end)
	end
end
function module_upvr.mergeAll() -- Line 579
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	return function(arg1) -- Line 580
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_27) -- Line 583
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1 (readonly)
				[3]: any_load_result1_result1_upvr_4 (copied, readonly)
			]]
			local any_new_result1_10_upvr = any_load_result1_result1_upvr_2.new()
			local var126_upvw = 0
			local var127_upvw = false
			any_new_result1_10_upvr:GiveTask(arg1:Subscribe(function(arg1_28) -- Line 590
				--[[ Upvalues[6]:
					[1]: any_load_result1_result1_upvr_4 (copied, readonly)
					[2]: var126_upvw (read and write)
					[3]: any_load_result1_result1_upvr_2 (copied, readonly)
					[4]: arg1_27 (readonly)
					[5]: var127_upvw (read and write)
					[6]: any_new_result1_10_upvr (readonly)
				]]
				assert(any_load_result1_result1_upvr_4.isObservable(arg1_28), "Not an observable")
				var126_upvw += 1
				local any_new_result1_upvr_2 = any_load_result1_result1_upvr_2.new()
				any_new_result1_upvr_2:GiveTask(arg1_28:Subscribe(function(...) -- Line 598
					--[[ Upvalues[1]:
						[1]: arg1_27 (copied, readonly)
					]]
					arg1_27:Fire(...)
				end, function(...) -- Line 602
					--[[ Upvalues[1]:
						[1]: arg1_27 (copied, readonly)
					]]
					arg1_27:Fail(...)
				end, function() -- Line 606
					--[[ Upvalues[5]:
						[1]: any_new_result1_upvr_2 (readonly)
						[2]: var126_upvw (copied, read and write)
						[3]: var127_upvw (copied, read and write)
						[4]: arg1_27 (copied, readonly)
						[5]: any_new_result1_10_upvr (copied, readonly)
					]]
					any_new_result1_upvr_2:DoCleaning()
					var126_upvw -= 1
					if var126_upvw == 0 and var127_upvw then
						arg1_27:Complete()
						any_new_result1_10_upvr:DoCleaning()
					end
				end))
				local any_GiveTask_result1_upvr = any_new_result1_10_upvr:GiveTask(any_new_result1_upvr_2)
				any_new_result1_upvr_2:GiveTask(function() -- Line 618
					--[[ Upvalues[2]:
						[1]: any_new_result1_10_upvr (copied, readonly)
						[2]: any_GiveTask_result1_upvr (readonly)
					]]
					any_new_result1_10_upvr[any_GiveTask_result1_upvr] = nil
				end)
			end, function(...) -- Line 622
				--[[ Upvalues[2]:
					[1]: arg1_27 (readonly)
					[2]: any_new_result1_10_upvr (readonly)
				]]
				arg1_27:Fail(...)
				any_new_result1_10_upvr:DoCleaning()
			end, function() -- Line 626
				--[[ Upvalues[4]:
					[1]: var127_upvw (read and write)
					[2]: var126_upvw (read and write)
					[3]: arg1_27 (readonly)
					[4]: any_new_result1_10_upvr (readonly)
				]]
				var127_upvw = true
				if var126_upvw == 0 then
					arg1_27:Complete()
					any_new_result1_10_upvr:DoCleaning()
				end
			end))
			return any_new_result1_10_upvr
		end)
	end
end
function module_upvr.switchAll() -- Line 650
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	return function(arg1) -- Line 651
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_29) -- Line 654
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1 (readonly)
				[3]: any_load_result1_result1_upvr_4 (copied, readonly)
			]]
			local any_new_result1_4_upvr = any_load_result1_result1_upvr_2.new()
			local var140_upvw = false
			local var141_upvw = false
			any_new_result1_4_upvr:GiveTask(function() -- Line 660
				--[[ Upvalues[1]:
					[1]: any_new_result1_4_upvr (readonly)
				]]
				any_new_result1_4_upvr._innerSub = nil
				any_new_result1_4_upvr._outerSuber = nil
			end)
			local var144_upvw
			any_new_result1_4_upvr._outerSuber = arg1:Subscribe(function(arg1_30) -- Line 669
				--[[ Upvalues[6]:
					[1]: any_load_result1_result1_upvr_4 (copied, readonly)
					[2]: var141_upvw (read and write)
					[3]: var144_upvw (read and write)
					[4]: any_new_result1_4_upvr (readonly)
					[5]: arg1_29 (readonly)
					[6]: var140_upvw (read and write)
				]]
				assert(any_load_result1_result1_upvr_4.isObservable(arg1_30), "Bad observable")
				var141_upvw = false
				var144_upvw = arg1_30
				any_new_result1_4_upvr._innerSub = nil
				any_new_result1_4_upvr._innerSub = arg1_30:Subscribe(function(...) -- Line 677
					--[[ Upvalues[1]:
						[1]: arg1_29 (copied, readonly)
					]]
					arg1_29:Fire(...)
				end, function(...) -- Line 680
					--[[ Upvalues[3]:
						[1]: var144_upvw (copied, read and write)
						[2]: arg1_30 (readonly)
						[3]: arg1_29 (copied, readonly)
					]]
					if var144_upvw == arg1_30 then
						arg1_29:Fail(...)
					end
				end, function() -- Line 685
					--[[ Upvalues[6]:
						[1]: var144_upvw (copied, read and write)
						[2]: arg1_30 (readonly)
						[3]: var141_upvw (copied, read and write)
						[4]: var140_upvw (copied, read and write)
						[5]: arg1_29 (copied, readonly)
						[6]: any_new_result1_4_upvr (copied, readonly)
					]]
					if var144_upvw == arg1_30 then
						var141_upvw = true
						if var141_upvw and var140_upvw then
							arg1_29:Complete()
							any_new_result1_4_upvr:DoCleaning()
						end
					end
				end)
			end, function(...) -- Line 695
				--[[ Upvalues[2]:
					[1]: arg1_29 (readonly)
					[2]: any_new_result1_4_upvr (readonly)
				]]
				arg1_29:Fail(...)
				any_new_result1_4_upvr:DoCleaning()
			end, function() -- Line 699
				--[[ Upvalues[4]:
					[1]: var140_upvw (read and write)
					[2]: var141_upvw (read and write)
					[3]: arg1_29 (readonly)
					[4]: any_new_result1_4_upvr (readonly)
				]]
				var140_upvw = true
				if var141_upvw and var140_upvw then
					arg1_29:Complete()
					any_new_result1_4_upvr:DoCleaning()
				end
			end)
			return any_new_result1_4_upvr
		end)
	end
end
function module_upvr.flatMap(arg1, arg2) -- Line 721
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	local var150
	if type(arg1) ~= "function" then
		var150 = false
	else
		var150 = true
	end
	assert(var150, "Bad project")
	return function(arg1_31) -- Line 724
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: arg1 (readonly)
			[4]: arg2 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_31), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_32) -- Line 727
			--[[ Upvalues[5]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1_31 (readonly)
				[3]: arg1 (copied, readonly)
				[4]: any_load_result1_result1_upvr_4 (copied, readonly)
				[5]: arg2 (copied, readonly)
			]]
			local any_new_result1_upvr_3 = any_load_result1_result1_upvr_2.new()
			local var154_upvw = 0
			local var155_upvw = false
			any_new_result1_upvr_3:GiveTask(arg1_31:Subscribe(function(...) -- Line 734
				--[[ Upvalues[8]:
					[1]: arg1 (copied, readonly)
					[2]: any_load_result1_result1_upvr_4 (copied, readonly)
					[3]: var154_upvw (read and write)
					[4]: any_load_result1_result1_upvr_2 (copied, readonly)
					[5]: arg2 (copied, readonly)
					[6]: arg1_32 (readonly)
					[7]: var155_upvw (read and write)
					[8]: any_new_result1_upvr_3 (readonly)
				]]
				local arg1_result1_3 = arg1(...)
				assert(any_load_result1_result1_upvr_4.isObservable(arg1_result1_3), "Bad observable from project")
				var154_upvw += 1
				local any_new_result1_13_upvr = any_load_result1_result1_upvr_2.new()
				local var160_upvr = ...
				any_new_result1_13_upvr:GiveTask(arg1_result1_3:Subscribe(function(...) -- Line 745
					--[[ Upvalues[3]:
						[1]: arg2 (copied, readonly)
						[2]: arg1_32 (copied, readonly)
						[3]: var160_upvr (readonly)
					]]
					if arg2 then
						arg1_32:Fire(arg2(var160_upvr, ...))
					else
						arg1_32:Fire(...)
					end
				end, function(...) -- Line 753
					--[[ Upvalues[1]:
						[1]: arg1_32 (copied, readonly)
					]]
					arg1_32:Fail(...)
				end, function() -- Line 756
					--[[ Upvalues[5]:
						[1]: any_new_result1_13_upvr (readonly)
						[2]: var154_upvw (copied, read and write)
						[3]: var155_upvw (copied, read and write)
						[4]: arg1_32 (copied, readonly)
						[5]: any_new_result1_upvr_3 (copied, readonly)
					]]
					any_new_result1_13_upvr:DoCleaning()
					var154_upvw -= 1
					if var154_upvw == 0 and var155_upvw then
						arg1_32:Complete()
						any_new_result1_upvr_3:DoCleaning()
					end
				end))
				local any_GiveTask_result1_upvr_2 = any_new_result1_upvr_3:GiveTask(any_new_result1_13_upvr)
				any_new_result1_13_upvr:GiveTask(function() -- Line 768
					--[[ Upvalues[2]:
						[1]: any_new_result1_upvr_3 (copied, readonly)
						[2]: any_GiveTask_result1_upvr_2 (readonly)
					]]
					any_new_result1_upvr_3[any_GiveTask_result1_upvr_2] = nil
				end)
			end, function(...) -- Line 772
				--[[ Upvalues[2]:
					[1]: arg1_32 (readonly)
					[2]: any_new_result1_upvr_3 (readonly)
				]]
				arg1_32:Fail(...)
				any_new_result1_upvr_3:DoCleaning()
			end, function() -- Line 776
				--[[ Upvalues[4]:
					[1]: var155_upvw (read and write)
					[2]: var154_upvw (read and write)
					[3]: arg1_32 (readonly)
					[4]: any_new_result1_upvr_3 (readonly)
				]]
				var155_upvw = true
				if var154_upvw == 0 then
					arg1_32:Complete()
					any_new_result1_upvr_3:DoCleaning()
				end
			end))
			return any_new_result1_upvr_3
		end)
	end
end
function module_upvr.switchMap(arg1) -- Line 789
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.pipe({module_upvr.map(arg1), module_upvr.switchAll()})
end
function module_upvr.takeUntil(arg1) -- Line 796
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	assert(any_load_result1_result1_upvr_4.isObservable(arg1))
	return function(arg1_33) -- Line 799
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_33), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_34) -- Line 802
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1 (copied, readonly)
				[3]: arg1_33 (readonly)
			]]
			local any_new_result1_upvr = any_load_result1_result1_upvr_2.new()
			local var171_upvw = false
			local function cancel() -- Line 806
				--[[ Upvalues[2]:
					[1]: any_new_result1_upvr (readonly)
					[2]: var171_upvw (read and write)
				]]
				any_new_result1_upvr:DoCleaning()
				var171_upvw = true
			end
			any_new_result1_upvr:GiveTask(arg1:Subscribe(cancel, cancel, nil))
			if var171_upvw then
				any_new_result1_upvr:DoCleaning()
				return nil
			end
			any_new_result1_upvr:GiveTask(arg1_33:Subscribe(arg1_34:GetFireFailComplete()))
			return any_new_result1_upvr
		end)
	end
end
function module_upvr.packed(...) -- Line 842
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local packed_2_upvr = table.pack(...)
	return any_load_result1_result1_upvr_4.new(function(arg1) -- Line 845
		--[[ Upvalues[1]:
			[1]: packed_2_upvr (readonly)
		]]
		arg1:Fire(unpack(packed_2_upvr, 1, packed_2_upvr.n))
		arg1:Complete()
	end)
end
function module_upvr.unpacked(arg1) -- Line 856
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	assert(any_load_result1_result1_upvr_4.isObservable(arg1), "Bad observable")
	return any_load_result1_result1_upvr_4.new(function(arg1_35) -- Line 859
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return arg1:Subscribe(function(arg1_36) -- Line 860
			--[[ Upvalues[1]:
				[1]: arg1_35 (readonly)
			]]
			if type(arg1_36) == "table" then
				arg1_35:Fire(unpack(arg1_36))
			else
				warn("[Rx.unpacked] - Observable didn't return a table got type %q":format(type(arg1_36)))
			end
		end, arg1_35:GetFailComplete())
	end)
end
function module_upvr.finalize(arg1) -- Line 889
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	local var176
	if type(arg1) ~= "function" then
		var176 = false
	else
		var176 = true
	end
	assert(var176, "Bad finalizerCallback")
	return function(arg1_37) -- Line 892
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_37), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_38) -- Line 895
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1_37 (readonly)
				[3]: arg1 (copied, readonly)
			]]
			local any_new_result1_19 = any_load_result1_result1_upvr_2.new()
			any_new_result1_19:GiveTask(arg1_37:Subscribe(arg1_38:GetFireFailComplete()))
			any_new_result1_19:GiveTask(arg1)
			return any_new_result1_19
		end)
	end
end
function module_upvr.combineLatestAll() -- Line 916
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
		[3]: module_upvr (readonly)
	]]
	return function(arg1) -- Line 917
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: module_upvr (copied, readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_39) -- Line 920
			--[[ Upvalues[4]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1 (readonly)
				[3]: any_load_result1_result1_upvr_4 (copied, readonly)
				[4]: module_upvr (copied, readonly)
			]]
			local tbl_4_upvr = {}
			local any_new_result1_18_upvr = any_load_result1_result1_upvr_2.new()
			local var184_upvw = true
			any_new_result1_18_upvr:GiveTask(function() -- Line 925
				--[[ Upvalues[1]:
					[1]: var184_upvw (read and write)
				]]
				var184_upvw = false
			end)
			any_new_result1_18_upvr:GiveTask(arg1:Subscribe(function(arg1_40) -- Line 930
				--[[ Upvalues[2]:
					[1]: any_load_result1_result1_upvr_4 (copied, readonly)
					[2]: tbl_4_upvr (readonly)
				]]
				assert(any_load_result1_result1_upvr_4.isObservable(arg1_40))
				table.insert(tbl_4_upvr, arg1_40)
			end, function(...) -- Line 935
				--[[ Upvalues[1]:
					[1]: arg1_39 (readonly)
				]]
				arg1_39:Fail(...)
			end), function() -- Line 938
				--[[ Upvalues[5]:
					[1]: var184_upvw (read and write)
					[2]: any_new_result1_18_upvr (readonly)
					[3]: module_upvr (copied, readonly)
					[4]: tbl_4_upvr (readonly)
					[5]: arg1_39 (readonly)
				]]
				if not var184_upvw then
				else
					any_new_result1_18_upvr:GiveTask(module_upvr.combineLatest(tbl_4_upvr)):Subscribe(arg1_39:GetFireFailComplete())
				end
			end)
			return any_new_result1_18_upvr
		end)
	end
end
module_upvr.combineAll = module_upvr.combineLatestAll
function module_upvr.catchError(arg1) -- Line 975
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	local var189
	if type(arg1) ~= "function" then
		var189 = false
	else
		var189 = true
	end
	assert(var189, "Bad callback")
	return function(arg1_41) -- Line 978
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_41), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_42) -- Line 981
			--[[ Upvalues[4]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1_41 (readonly)
				[3]: arg1 (copied, readonly)
				[4]: any_load_result1_result1_upvr_4 (copied, readonly)
			]]
			local any_new_result1_7_upvr = any_load_result1_result1_upvr_2.new()
			local var193_upvw = true
			any_new_result1_7_upvr:GiveTask(function() -- Line 986
				--[[ Upvalues[1]:
					[1]: var193_upvw (read and write)
				]]
				var193_upvw = false
			end)
			any_new_result1_7_upvr:GiveTask(arg1_41:Subscribe(function(...) -- Line 991
				--[[ Upvalues[1]:
					[1]: arg1_42 (readonly)
				]]
				arg1_42:Fire(...)
			end, function(...) -- Line 994
				--[[ Upvalues[5]:
					[1]: var193_upvw (read and write)
					[2]: arg1 (copied, readonly)
					[3]: any_load_result1_result1_upvr_4 (copied, readonly)
					[4]: any_new_result1_7_upvr (readonly)
					[5]: arg1_42 (readonly)
				]]
				if not var193_upvw then
				else
					local arg1_result1_2 = arg1(...)
					assert(any_load_result1_result1_upvr_4.isObservable(arg1_result1_2), "Bad observable")
					any_new_result1_7_upvr:GiveTask(arg1_result1_2:Subscribe(arg1_42:GetFireFailComplete()))
				end
			end, function() -- Line 1008
				--[[ Upvalues[1]:
					[1]: arg1_42 (readonly)
				]]
				arg1_42:Complete()
			end))
			return any_new_result1_7_upvr
		end)
	end
end
local var1_result1_upvr = any_load_result1("Table")
function module_upvr.combineLatest(arg1) -- Line 1043
	--[[ Upvalues[4]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_named_result1_upvw (readonly)
		[3]: any_load_result1_result1_upvr_2 (readonly)
		[4]: var1_result1_upvr (readonly)
	]]
	local var201
	if type(arg1) ~= "table" then
		var201 = false
	else
		var201 = true
	end
	assert(var201, "Bad observables")
	var201 = any_load_result1_result1_upvr_4
	function var201(arg1_43) -- Line 1046
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: any_load_result1_result1_upvr_4 (copied, readonly)
			[3]: any_named_result1_upvw (copied, readonly)
			[4]: any_load_result1_result1_upvr_2 (copied, readonly)
			[5]: var1_result1_upvr (copied, readonly)
		]]
		local tbl_3_upvr = {}
		local var214_upvw
		for i_10, v_9 in pairs(arg1) do
			if any_load_result1_result1_upvr_4.isObservable(v_9) then
				var214_upvw += 1
				tbl_3_upvr[i_10] = any_named_result1_upvw
			else
				tbl_3_upvr[i_10] = v_9
			end
		end
		if var214_upvw == 0 then
			arg1_43:Fire(tbl_3_upvr)
			arg1_43:Complete()
			return
		end
		local function _() -- Line 1067, Named "fireIfAllSet"
			--[[ Upvalues[4]:
				[1]: tbl_3_upvr (readonly)
				[2]: any_named_result1_upvw (copied, readonly)
				[3]: arg1_43 (readonly)
				[4]: var1_result1_upvr (copied, readonly)
			]]
			for _, v_10 in pairs(tbl_3_upvr) do
				if v_10 == any_named_result1_upvw then return end
			end
			arg1_43:Fire(var1_result1_upvr.copy(tbl_3_upvr))
		end
		for i_12_upvr, v_11 in pairs(arg1) do
			if any_load_result1_result1_upvr_4.isObservable(v_11) then
				any_load_result1_result1_upvr_2.new():GiveTask(v_11:Subscribe(function(arg1_44) -- Line 1080
					--[[ Upvalues[5]:
						[1]: tbl_3_upvr (readonly)
						[2]: i_12_upvr (readonly)
						[3]: any_named_result1_upvw (copied, readonly)
						[4]: arg1_43 (readonly)
						[5]: var1_result1_upvr (copied, readonly)
					]]
					tbl_3_upvr[i_12_upvr] = arg1_44
					for _, v_12 in pairs(tbl_3_upvr) do
						if v_12 == any_named_result1_upvw then return end
					end
					arg1_43:Fire(var1_result1_upvr.copy(tbl_3_upvr))
				end, function(...) -- Line 1084
					--[[ Upvalues[2]:
						[1]: var214_upvw (read and write)
						[2]: arg1_43 (readonly)
					]]
					var214_upvw -= 1
					arg1_43:Fail(...)
				end, function() -- Line 1088
					--[[ Upvalues[2]:
						[1]: var214_upvw (read and write)
						[2]: arg1_43 (readonly)
					]]
					var214_upvw -= 1
					if var214_upvw == 0 then
						arg1_43:Complete()
					end
				end))
			end
		end
		return any_load_result1_result1_upvr_2.new()
	end
	return var201.new(var201)
end
function module_upvr.using(arg1, arg2) -- Line 1116
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	return any_load_result1_result1_upvr_4.new(function(arg1_45) -- Line 1117
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
			[4]: any_load_result1_result1_upvr_4 (copied, readonly)
		]]
		local any_new_result1_17 = any_load_result1_result1_upvr_2.new()
		local arg1_result1 = arg1()
		any_new_result1_17:GiveTask(arg1_result1)
		local arg2_result1 = arg2(arg1_result1)
		assert(any_load_result1_result1_upvr_4.isObservable(arg2_result1), "Bad observable")
		any_new_result1_17:GiveTask(arg2_result1:Subscribe(arg1_45:GetFireFailComplete()))
		return any_new_result1_17
	end)
end
function module_upvr.first() -- Line 1142
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.take(1)
end
function module_upvr.take(arg1) -- Line 1153
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	local var235
	if type(arg1) ~= "number" then
		var235 = false
	else
		var235 = true
	end
	assert(var235, "Bad number")
	if 0 >= arg1 then
		var235 = false
	else
		var235 = true
	end
	assert(var235, "Bad number")
	return function(arg1_46) -- Line 1157
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_46), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_47) -- Line 1160
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1_46 (readonly)
				[3]: arg1 (copied, readonly)
			]]
			local any_new_result1_16 = any_load_result1_result1_upvr_2.new()
			local var240_upvw = 0
			any_new_result1_16:GiveTask(arg1_46:Subscribe(function(...) -- Line 1164
				--[[ Upvalues[3]:
					[1]: var240_upvw (read and write)
					[2]: arg1 (copied, readonly)
					[3]: arg1_47 (readonly)
				]]
				if arg1 <= var240_upvw then
					warn("[Rx.take] - Still getting values past subscription")
				else
					var240_upvw += 1
					arg1_47:Fire(...)
					if arg1 <= var240_upvw then
						arg1_47:Complete()
					end
				end
			end, arg1_47:GetFailComplete()))
			return any_new_result1_16
		end)
	end
end
function module_upvr.skip(arg1) -- Line 1190
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	local var241
	if type(arg1) ~= "number" then
		var241 = false
	else
		var241 = true
	end
	assert(var241, "Bad toSkip")
	if 0 >= arg1 then
		var241 = false
	else
		var241 = true
	end
	assert(var241, "Bad toSkip")
	return function(arg1_48) -- Line 1194
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_48), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_49) -- Line 1197
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1_48 (readonly)
				[3]: arg1 (copied, readonly)
			]]
			local any_new_result1_8 = any_load_result1_result1_upvr_2.new()
			local var246_upvw = 0
			any_new_result1_8:GiveTask(arg1_48:Subscribe(function(...) -- Line 1201
				--[[ Upvalues[3]:
					[1]: var246_upvw (read and write)
					[2]: arg1 (copied, readonly)
					[3]: arg1_49 (readonly)
				]]
				if var246_upvw <= arg1 then
					var246_upvw += 1
				else
					arg1_49:Fire(...)
				end
			end, arg1_49:GetFailComplete()))
			return any_new_result1_8
		end)
	end
end
function module_upvr.defer(arg1) -- Line 1225
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	return any_load_result1_result1_upvr_4.new(function(arg1_50) -- Line 1226
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: any_load_result1_result1_upvr_4 (copied, readonly)
		]]
		local var248_upvw
		local pcall_result1, pcall_result2 = pcall(function() -- Line 1228
			--[[ Upvalues[2]:
				[1]: var248_upvw (read and write)
				[2]: arg1 (copied, readonly)
			]]
			var248_upvw = arg1()
		end)
		if not pcall_result1 then
			arg1_50:Fail(pcall_result2)
			return
		end
		if not any_load_result1_result1_upvr_4.isObservable(var248_upvw) then
			arg1_50:Fail("Not an observable")
			return
		end
		return var248_upvw:Subscribe(arg1_50:GetFireFailComplete())
	end)
end
local var1_result1_upvr_2 = any_load_result1("cancellableDelay")
function module_upvr.delay(arg1) -- Line 1252
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
		[3]: var1_result1_upvr_2 (readonly)
	]]
	local var253
	if type(arg1) ~= "number" then
		var253 = false
	else
		var253 = true
	end
	assert(var253, "Bad seconds")
	return function(arg1_51) -- Line 1255
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: var1_result1_upvr_2 (copied, readonly)
			[4]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_51), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_52) -- Line 1258
			--[[ Upvalues[4]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1_51 (readonly)
				[3]: var1_result1_upvr_2 (copied, readonly)
				[4]: arg1 (copied, readonly)
			]]
			local any_new_result1_upvr_4 = any_load_result1_result1_upvr_2.new()
			any_new_result1_upvr_4:GiveTask(arg1_51:Subscribe(function(...) -- Line 1261
				--[[ Upvalues[4]:
					[1]: any_new_result1_upvr_4 (readonly)
					[2]: var1_result1_upvr_2 (copied, readonly)
					[3]: arg1 (copied, readonly)
					[4]: arg1_52 (readonly)
				]]
				local packed_4_upvr = table.pack(...)
				any_new_result1_upvr_4[packed_4_upvr] = var1_result1_upvr_2(arg1, function() -- Line 1264
					--[[ Upvalues[3]:
						[1]: any_new_result1_upvr_4 (copied, readonly)
						[2]: packed_4_upvr (readonly)
						[3]: arg1_52 (copied, readonly)
					]]
					any_new_result1_upvr_4[packed_4_upvr] = nil
					arg1_52:Fire(table.unpack(packed_4_upvr, 1, packed_4_upvr.n))
				end)
			end, arg1_52:GetFailComplete()))
			return any_new_result1_upvr_4
		end)
	end
end
function module_upvr.withLatestFrom(arg1) -- Line 1284
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
		[3]: any_named_result1_upvw (readonly)
	]]
	assert(arg1, "Bad inputObservables")
	for _, v_13 in pairs(arg1) do
		assert(any_load_result1_result1_upvr_4.isObservable(v_13), "Bad observable")
	end
	return function(arg1_53) -- Line 1291
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: arg1 (readonly)
			[4]: any_named_result1_upvw (copied, readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_53), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_54) -- Line 1294
			--[[ Upvalues[4]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1 (copied, readonly)
				[3]: any_named_result1_upvw (copied, readonly)
				[4]: arg1_53 (readonly)
			]]
			local any_new_result1_9 = any_load_result1_result1_upvr_2.new()
			local tbl_2_upvr = {}
			for i_15_upvr, v_14 in pairs(arg1) do
				tbl_2_upvr[i_15_upvr] = any_named_result1_upvw
				any_new_result1_9:GiveTask(v_14:Subscribe(function(arg1_55) -- Line 1302
					--[[ Upvalues[2]:
						[1]: tbl_2_upvr (readonly)
						[2]: i_15_upvr (readonly)
					]]
					tbl_2_upvr[i_15_upvr] = arg1_55
				end, nil, nil))
			end
			any_new_result1_9:GiveTask(arg1_53:Subscribe(function(arg1_56) -- Line 1307
				--[[ Upvalues[3]:
					[1]: tbl_2_upvr (readonly)
					[2]: any_named_result1_upvw (copied, readonly)
					[3]: arg1_54 (readonly)
				]]
				for _, v_15 in pairs(tbl_2_upvr) do
					if v_15 == any_named_result1_upvw then return end
				end
				local tbl = {}
				tbl[1] = arg1_56
				tbl[2] = unpack(tbl_2_upvr)
				arg1_54:Fire(tbl)
			end, arg1_54:GetFailComplete()))
			return any_new_result1_9
		end)
	end
end
function module_upvr.scan(arg1, arg2) -- Line 1329
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local var284
	if type(arg1) ~= "function" then
		var284 = false
	else
		var284 = true
	end
	assert(var284, "Bad accumulator")
	return function(arg1_57) -- Line 1332
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: arg2 (readonly)
			[3]: arg1 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_57), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_58) -- Line 1335
			--[[ Upvalues[3]:
				[1]: arg2 (copied, readonly)
				[2]: arg1_57 (readonly)
				[3]: arg1 (copied, readonly)
			]]
			return arg1_57:Subscribe(function(...) -- Line 1338
				--[[ Upvalues[3]:
					[1]: arg2 (read and write)
					[2]: arg1 (copied, readonly)
					[3]: arg1_58 (readonly)
				]]
				arg2 = arg1(arg2, ...)
				arg1_58:Fire(arg2)
			end, arg1_58:GetFailComplete())
		end)
	end
end
local any_load_result1_result1_upvr = any_load_result1("ThrottledFunction")
function module_upvr.throttleTime(arg1, arg2) -- Line 1359
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
		[3]: any_load_result1_result1_upvr (readonly)
	]]
	local var289
	if type(arg1) ~= "number" then
		var289 = false
	else
		var289 = true
	end
	assert(var289, "Bad duration")
	var289 = true
	if type(arg2) ~= "table" then
		if arg2 ~= nil then
			var289 = false
		else
			var289 = true
		end
	end
	assert(var289, "Bad throttleConfig")
	return function(arg1_59) -- Line 1363
		--[[ Upvalues[5]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: any_load_result1_result1_upvr (copied, readonly)
			[4]: arg1 (readonly)
			[5]: arg2 (readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1_59), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_60) -- Line 1366
			--[[ Upvalues[5]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: any_load_result1_result1_upvr (copied, readonly)
				[3]: arg1 (copied, readonly)
				[4]: arg2 (copied, readonly)
				[5]: arg1_59 (readonly)
			]]
			local any_new_result1_12 = any_load_result1_result1_upvr_2.new()
			local any_new_result1_11_upvr = any_load_result1_result1_upvr.new(arg1, function(...) -- Line 1369
				--[[ Upvalues[1]:
					[1]: arg1_60 (readonly)
				]]
				arg1_60:Fire(...)
			end, arg2)
			any_new_result1_12:GiveTask(any_new_result1_11_upvr)
			any_new_result1_12:GiveTask(arg1_59:Subscribe(function(...) -- Line 1374
				--[[ Upvalues[1]:
					[1]: any_new_result1_11_upvr (readonly)
				]]
				any_new_result1_11_upvr:Call(...)
			end, arg1_60:GetFailComplete()))
			return any_new_result1_12
		end)
	end
end
function module_upvr.throttleDefer() -- Line 1387
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
	]]
	return function(arg1) -- Line 1388
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
		]]
		assert(any_load_result1_result1_upvr_4.isObservable(arg1), "Bad observable")
		return any_load_result1_result1_upvr_4.new(function(arg1_61) -- Line 1391
			--[[ Upvalues[2]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1 (readonly)
			]]
			local any_new_result1_6 = any_load_result1_result1_upvr_2.new()
			local var300_upvw
			any_new_result1_6:GiveTask(arg1:Subscribe(function(...) -- Line 1396
				--[[ Upvalues[2]:
					[1]: var300_upvw (read and write)
					[2]: arg1_61 (readonly)
				]]
				if not var300_upvw then
					var300_upvw = table.pack(...)
					task.defer(function() -- Line 1401
						--[[ Upvalues[2]:
							[1]: var300_upvw (copied, read and write)
							[2]: arg1_61 (copied, readonly)
						]]
						local var302 = var300_upvw
						var300_upvw = nil
						if arg1_61:IsPending() then
							arg1_61:Fire(table.unpack(var302, 1, var302.n))
						end
					end)
				else
					var300_upvw = table.pack(...)
				end
			end, arg1_61:GetFailComplete()))
			return any_new_result1_6
		end)
	end
end
return module_upvr