--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.RxBrioUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:05
-- Luau version 6, Types version 3
-- Time taken: 0.012243 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local any_load_result1_result1_upvr = any_load_result1("Brio")
local any_load_result1_result1_upvr_5 = any_load_result1("BrioUtils")
local any_load_result1_result1_upvr_2 = any_load_result1("Maid")
local any_load_result1_result1_upvr_3 = any_load_result1("Observable")
local any_load_result1_result1_upvr_4 = any_load_result1("Rx")
local module_upvr = {
	toBrio = function() -- Line 24, Named "toBrio"
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr_4 (readonly)
			[2]: any_load_result1_result1_upvr (readonly)
		]]
		return any_load_result1_result1_upvr_4.map(function(arg1) -- Line 25
			--[[ Upvalues[1]:
				[1]: any_load_result1_result1_upvr (copied, readonly)
			]]
			if any_load_result1_result1_upvr.isBrio(arg1) then
				return arg1
			end
			return any_load_result1_result1_upvr.new(arg1)
		end)
	end;
	completeOnDeath = function(arg1, arg2) -- Line 41, Named "completeOnDeath"
		--[[ Upvalues[2]:
			[1]: any_load_result1_result1_upvr (readonly)
			[2]: any_load_result1_result1_upvr_3 (readonly)
		]]
		assert(any_load_result1_result1_upvr.isBrio(arg1))
		assert(any_load_result1_result1_upvr_3.isObservable(arg2))
		return any_load_result1_result1_upvr_3.new(function(arg1_2) -- Line 45
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: arg2 (readonly)
			]]
			if arg1:IsDead() then
				arg1_2:Complete()
				return
			end
			local any_ToMaid_result1 = arg1:ToMaid()
			any_ToMaid_result1:GiveTask(function() -- Line 53
				--[[ Upvalues[1]:
					[1]: arg1_2 (readonly)
				]]
				arg1_2:Complete()
			end)
			any_ToMaid_result1:GiveTask(arg2:Subscribe(arg1_2:GetFireFailComplete()))
			return any_ToMaid_result1
		end)
	end;
	emitWhileAllDead = function(arg1) -- Line 69, Named "emitWhileAllDead"
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_3 (readonly)
			[2]: any_load_result1_result1_upvr_2 (readonly)
			[3]: any_load_result1_result1_upvr_5 (readonly)
			[4]: any_load_result1_result1_upvr (readonly)
		]]
		return function(arg1_3) -- Line 70
			--[[ Upvalues[5]:
				[1]: any_load_result1_result1_upvr_3 (copied, readonly)
				[2]: any_load_result1_result1_upvr_2 (copied, readonly)
				[3]: any_load_result1_result1_upvr_5 (copied, readonly)
				[4]: any_load_result1_result1_upvr (copied, readonly)
				[5]: arg1 (readonly)
			]]
			return any_load_result1_result1_upvr_3.new(function(arg1_4) -- Line 71
				--[[ Upvalues[5]:
					[1]: any_load_result1_result1_upvr_2 (copied, readonly)
					[2]: any_load_result1_result1_upvr_5 (copied, readonly)
					[3]: any_load_result1_result1_upvr (copied, readonly)
					[4]: arg1 (copied, readonly)
					[5]: arg1_3 (readonly)
				]]
				local any_new_result1_6_upvr = any_load_result1_result1_upvr_2.new()
				local var15_upvw = true
				any_new_result1_6_upvr:GiveTask(function() -- Line 75
					--[[ Upvalues[1]:
						[1]: var15_upvw (read and write)
					]]
					var15_upvw = false
				end)
				local tbl_upvw = {}
				local var18_upvw = false
				local function updateBrios() -- Line 81
					--[[ Upvalues[8]:
						[1]: var15_upvw (read and write)
						[2]: tbl_upvw (read and write)
						[3]: any_load_result1_result1_upvr_5 (copied, readonly)
						[4]: any_new_result1_6_upvr (readonly)
						[5]: any_load_result1_result1_upvr (copied, readonly)
						[6]: arg1 (copied, readonly)
						[7]: arg1_4 (readonly)
						[8]: var18_upvw (read and write)
					]]
					if not var15_upvw then
					else
						tbl_upvw = any_load_result1_result1_upvr_5.aliveOnly(tbl_upvw)
						if next(tbl_upvw) then
							any_new_result1_6_upvr._lastBrio = nil
						else
							local any_new_result1_7 = any_load_result1_result1_upvr.new(arg1)
							any_new_result1_6_upvr._lastBrio = any_new_result1_7
							arg1_4:Fire(any_new_result1_7)
						end
						var18_upvw = true
					end
				end
				local function handleNewBrio(arg1_5) -- Line 98
					--[[ Upvalues[9]:
						[1]: any_load_result1_result1_upvr_2 (copied, readonly)
						[2]: any_new_result1_6_upvr (readonly)
						[3]: var15_upvw (read and write)
						[4]: tbl_upvw (read and write)
						[5]: any_load_result1_result1_upvr_5 (copied, readonly)
						[6]: any_load_result1_result1_upvr (copied, readonly)
						[7]: arg1 (copied, readonly)
						[8]: arg1_4 (readonly)
						[9]: var18_upvw (read and write)
					]]
					if arg1_5:IsDead() then
					else
						local any_new_result1_4_upvr = any_load_result1_result1_upvr_2.new()
						any_new_result1_6_upvr[any_new_result1_4_upvr] = any_new_result1_4_upvr
						any_new_result1_4_upvr:GiveTask(function() -- Line 107
							--[[ Upvalues[9]:
								[1]: any_new_result1_6_upvr (copied, readonly)
								[2]: any_new_result1_4_upvr (readonly)
								[3]: var15_upvw (copied, read and write)
								[4]: tbl_upvw (copied, read and write)
								[5]: any_load_result1_result1_upvr_5 (copied, readonly)
								[6]: any_load_result1_result1_upvr (copied, readonly)
								[7]: arg1 (copied, readonly)
								[8]: arg1_4 (copied, readonly)
								[9]: var18_upvw (copied, read and write)
							]]
							any_new_result1_6_upvr[any_new_result1_4_upvr] = nil
							if not var15_upvw then
							else
								tbl_upvw = any_load_result1_result1_upvr_5.aliveOnly(tbl_upvw)
								if next(tbl_upvw) then
									any_new_result1_6_upvr._lastBrio = nil
								else
									local any_new_result1 = any_load_result1_result1_upvr.new(arg1)
									any_new_result1_6_upvr._lastBrio = any_new_result1
									arg1_4:Fire(any_new_result1)
								end
								var18_upvw = true
							end
						end)
						any_new_result1_4_upvr:GiveTask(arg1_5:GetDiedSignal():Connect(function() -- Line 111
							--[[ Upvalues[2]:
								[1]: any_new_result1_6_upvr (copied, readonly)
								[2]: any_new_result1_4_upvr (readonly)
							]]
							any_new_result1_6_upvr[any_new_result1_4_upvr] = nil
						end))
						table.insert(tbl_upvw, arg1_5)
						if not var15_upvw then return end
						tbl_upvw = any_load_result1_result1_upvr_5.aliveOnly(tbl_upvw)
						if next(tbl_upvw) then
							any_new_result1_6_upvr._lastBrio = nil
						else
							local any_new_result1_8 = any_load_result1_result1_upvr.new(arg1)
							any_new_result1_6_upvr._lastBrio = any_new_result1_8
							arg1_4:Fire(any_new_result1_8)
						end
						var18_upvw = true
					end
				end
				any_new_result1_6_upvr:GiveTask(arg1_3:Subscribe(function(arg1_6) -- Line 120
					--[[ Upvalues[4]:
						[1]: any_load_result1_result1_upvr (copied, readonly)
						[2]: any_new_result1_6_upvr (readonly)
						[3]: arg1_4 (readonly)
						[4]: handleNewBrio (readonly)
					]]
					if not any_load_result1_result1_upvr.isBrio(arg1_6) then
						warn("[RxBrioUtils.emitWhileAllDead] - Not a brio, %q":format(tostring(arg1_6)))
						any_new_result1_6_upvr._lastBrio = nil
						arg1_4:Fail("Not a brio")
					else
						handleNewBrio(arg1_6)
					end
				end, function(...) -- Line 130
					--[[ Upvalues[1]:
						[1]: arg1_4 (readonly)
					]]
					arg1_4:Fail(...)
				end, function(...) -- Line 133
					--[[ Upvalues[1]:
						[1]: arg1_4 (readonly)
					]]
					arg1_4:Complete(...)
				end))
				if not var18_upvw then
					if not var15_upvw then
					else
						tbl_upvw = any_load_result1_result1_upvr_5.aliveOnly(tbl_upvw)
						if next(tbl_upvw) then
							any_new_result1_6_upvr._lastBrio = nil
						else
							local any_new_result1_5 = any_load_result1_result1_upvr.new(arg1)
							any_new_result1_6_upvr._lastBrio = any_new_result1_5
							arg1_4:Fire(any_new_result1_5)
						end
						var18_upvw = true
					end
				end
				return any_new_result1_6_upvr
			end)
		end
	end;
	reduceToAliveList = function(arg1) -- Line 153, Named "reduceToAliveList"
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_3 (readonly)
			[2]: any_load_result1_result1_upvr_2 (readonly)
			[3]: any_load_result1_result1_upvr_5 (readonly)
			[4]: any_load_result1_result1_upvr (readonly)
		]]
		local var29 = true
		if type(arg1) ~= "function" then
			if arg1 ~= nil then
				var29 = false
			else
				var29 = true
			end
		end
		assert(var29, "Bad selectFromBrio")
		return function(arg1_7) -- Line 156
			--[[ Upvalues[5]:
				[1]: any_load_result1_result1_upvr_3 (copied, readonly)
				[2]: any_load_result1_result1_upvr_2 (copied, readonly)
				[3]: any_load_result1_result1_upvr_5 (copied, readonly)
				[4]: arg1 (readonly)
				[5]: any_load_result1_result1_upvr (copied, readonly)
			]]
			return any_load_result1_result1_upvr_3.new(function(arg1_8) -- Line 157
				--[[ Upvalues[5]:
					[1]: any_load_result1_result1_upvr_2 (copied, readonly)
					[2]: any_load_result1_result1_upvr_5 (copied, readonly)
					[3]: arg1 (copied, readonly)
					[4]: arg1_7 (readonly)
					[5]: any_load_result1_result1_upvr (copied, readonly)
				]]
				local any_new_result1_11_upvr = any_load_result1_result1_upvr_2.new()
				local var33_upvw = true
				any_new_result1_11_upvr:GiveTask(function() -- Line 161
					--[[ Upvalues[1]:
						[1]: var33_upvw (read and write)
					]]
					var33_upvw = false
				end)
				local tbl_upvw_2 = {}
				local var36_upvw = false
				local function updateBrios_upvr() -- Line 167, Named "updateBrios"
					--[[ Upvalues[7]:
						[1]: var33_upvw (read and write)
						[2]: tbl_upvw_2 (read and write)
						[3]: any_load_result1_result1_upvr_5 (copied, readonly)
						[4]: arg1 (copied, readonly)
						[5]: any_new_result1_11_upvr (readonly)
						[6]: var36_upvw (read and write)
						[7]: arg1_8 (readonly)
					]]
					-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
					do
						return
					end
					-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [3] 4. Error Block 3 start (CF ANALYSIS FAILED)
					tbl_upvw_2 = any_load_result1_result1_upvr_5.aliveOnly(tbl_upvw_2)
					-- KONSTANTERROR: [3] 4. Error Block 3 end (CF ANALYSIS FAILED)
				end
				local function handleNewBrio_upvr(arg1_9) -- Line 198, Named "handleNewBrio"
					--[[ Upvalues[4]:
						[1]: any_load_result1_result1_upvr_2 (copied, readonly)
						[2]: any_new_result1_11_upvr (readonly)
						[3]: updateBrios_upvr (readonly)
						[4]: tbl_upvw_2 (read and write)
					]]
					if arg1_9:IsDead() then
					else
						local any_new_result1_3_upvr = any_load_result1_result1_upvr_2.new()
						any_new_result1_11_upvr[any_new_result1_3_upvr] = any_new_result1_3_upvr
						any_new_result1_3_upvr:GiveTask(function() -- Line 207
							--[[ Upvalues[3]:
								[1]: any_new_result1_11_upvr (copied, readonly)
								[2]: any_new_result1_3_upvr (readonly)
								[3]: updateBrios_upvr (copied, readonly)
							]]
							any_new_result1_11_upvr[any_new_result1_3_upvr] = nil
							updateBrios_upvr()
						end)
						any_new_result1_3_upvr:GiveTask(arg1_9:GetDiedSignal():Connect(function() -- Line 211
							--[[ Upvalues[2]:
								[1]: any_new_result1_11_upvr (copied, readonly)
								[2]: any_new_result1_3_upvr (readonly)
							]]
							any_new_result1_11_upvr[any_new_result1_3_upvr] = nil
						end))
						table.insert(tbl_upvw_2, arg1_9)
						updateBrios_upvr()
					end
				end
				any_new_result1_11_upvr:GiveTask(arg1_7:Subscribe(function(arg1_10) -- Line 220
					--[[ Upvalues[4]:
						[1]: any_load_result1_result1_upvr (copied, readonly)
						[2]: any_new_result1_11_upvr (readonly)
						[3]: arg1_8 (readonly)
						[4]: handleNewBrio_upvr (readonly)
					]]
					if not any_load_result1_result1_upvr.isBrio(arg1_10) then
						warn("[RxBrioUtils.mergeToAliveList] - Not a brio, %q":format(tostring(arg1_10)))
						any_new_result1_11_upvr._lastBrio = nil
						arg1_8:Fail("Not a brio")
					else
						handleNewBrio_upvr(arg1_10)
					end
				end, function(...) -- Line 230
					--[[ Upvalues[1]:
						[1]: arg1_8 (readonly)
					]]
					arg1_8:Fail(...)
				end, function(...) -- Line 233
					--[[ Upvalues[1]:
						[1]: arg1_8 (readonly)
					]]
					arg1_8:Complete(...)
				end))
				if not var36_upvw then
					updateBrios_upvr()
				end
				return any_new_result1_11_upvr
			end)
		end
	end;
	reemitLastBrioOnDeath = function() -- Line 252, Named "reemitLastBrioOnDeath"
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_3 (readonly)
			[2]: any_load_result1_result1_upvr_2 (readonly)
			[3]: any_load_result1_result1_upvr (readonly)
		]]
		return function(arg1) -- Line 253
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_3 (copied, readonly)
				[2]: any_load_result1_result1_upvr_2 (copied, readonly)
				[3]: any_load_result1_result1_upvr (copied, readonly)
			]]
			return any_load_result1_result1_upvr_3.new(function(arg1_11) -- Line 254
				--[[ Upvalues[3]:
					[1]: any_load_result1_result1_upvr_2 (copied, readonly)
					[2]: arg1 (readonly)
					[3]: any_load_result1_result1_upvr (copied, readonly)
				]]
				local any_new_result1_9_upvr = any_load_result1_result1_upvr_2.new()
				any_new_result1_9_upvr:GiveTask(arg1:Subscribe(function(arg1_12) -- Line 258
					--[[ Upvalues[3]:
						[1]: any_new_result1_9_upvr (readonly)
						[2]: any_load_result1_result1_upvr (copied, readonly)
						[3]: arg1_11 (readonly)
					]]
					any_new_result1_9_upvr._conn = nil
					if not any_load_result1_result1_upvr.isBrio(arg1_12) then
						warn("[RxBrioUtils.reemitLastBrioOnDeath] - Not a brio, %q":format(tostring(arg1_12)))
						arg1_11:Fail("Not a brio")
					else
						if arg1_12:IsDead() then
							arg1_11:Fire(arg1_12)
							return
						end
						any_new_result1_9_upvr._conn = arg1_12:GetDiedSignal():Connect(function() -- Line 273
							--[[ Upvalues[2]:
								[1]: arg1_11 (copied, readonly)
								[2]: arg1_12 (readonly)
							]]
							arg1_11:Fire(arg1_12)
						end)
						arg1_11:Fire(arg1_12)
					end
				end, function(...) -- Line 279
					--[[ Upvalues[1]:
						[1]: arg1_11 (readonly)
					]]
					arg1_11:Fail(...)
				end, function(...) -- Line 282
					--[[ Upvalues[1]:
						[1]: arg1_11 (readonly)
					]]
					arg1_11:Complete(...)
				end))
				return any_new_result1_9_upvr
			end)
		end
	end;
	where = function(arg1) -- Line 299, Named "where"
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_3 (readonly)
			[2]: any_load_result1_result1_upvr_2 (readonly)
			[3]: any_load_result1_result1_upvr (readonly)
		]]
		local var50
		if type(arg1) ~= "function" then
			var50 = false
		else
			var50 = true
		end
		assert(var50, "Bad predicate")
		return function(arg1_13) -- Line 301
			--[[ Upvalues[4]:
				[1]: any_load_result1_result1_upvr_3 (copied, readonly)
				[2]: any_load_result1_result1_upvr_2 (copied, readonly)
				[3]: any_load_result1_result1_upvr (copied, readonly)
				[4]: arg1 (readonly)
			]]
			return any_load_result1_result1_upvr_3.new(function(arg1_14) -- Line 302
				--[[ Upvalues[4]:
					[1]: any_load_result1_result1_upvr_2 (copied, readonly)
					[2]: arg1_13 (readonly)
					[3]: any_load_result1_result1_upvr (copied, readonly)
					[4]: arg1 (copied, readonly)
				]]
				local any_new_result1_2 = any_load_result1_result1_upvr_2.new()
				any_new_result1_2:GiveTask(arg1_13:Subscribe(function(arg1_15) -- Line 305
					--[[ Upvalues[3]:
						[1]: any_load_result1_result1_upvr (copied, readonly)
						[2]: arg1 (copied, readonly)
						[3]: arg1_14 (readonly)
					]]
					assert(any_load_result1_result1_upvr.isBrio(arg1_15), "Not a brio")
					if arg1_15:IsDead() then
					elseif arg1(arg1_15:GetValue()) then
						arg1_14:Fire(arg1_15)
					end
				end, arg1_14:GetFailComplete()))
				return any_new_result1_2
			end)
		end
	end;
	filter = module_upvr.where;
}
function module_upvr.combineLatest(arg1) -- Line 340
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr_5 (readonly)
		[3]: module_upvr (readonly)
	]]
	local var55
	if type(arg1) ~= "table" then
		var55 = false
	else
		var55 = true
	end
	assert(var55, "Bad observables")
	var55 = "[RxBrioUtils.combineLatest] - Deprecated since 3.6.0. Use RxBrioUtils.flatCombineLatest"
	warn(var55)
	var55 = any_load_result1_result1_upvr_4
	var55 = arg1
	return var55.combineLatest(var55):Pipe({any_load_result1_result1_upvr_4.map(any_load_result1_result1_upvr_5.flatten), module_upvr.onlyLastBrioSurvives()})
end
function module_upvr.flatMap(arg1, arg2) -- Line 361
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: module_upvr (readonly)
	]]
	local var57
	if type(arg1) ~= "function" then
		var57 = false
	else
		var57 = true
	end
	assert(var57, "Bad project")
	var57 = "[RxBrioUtils.flatMap] - Deprecated since 3.6.0. Use RxBrioUtils.flatMapBrio"
	warn(var57)
	var57 = any_load_result1_result1_upvr_4
	var57 = module_upvr.mapBrio(arg1)
	return var57.flatMap(var57, arg2)
end
function module_upvr.flatMapBrio(arg1) -- Line 381
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: module_upvr (readonly)
	]]
	return any_load_result1_result1_upvr_4.flatMap(module_upvr.mapBrioBrio(arg1))
end
function module_upvr.switchMap(arg1) -- Line 393
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: module_upvr (readonly)
	]]
	local var58
	if type(arg1) ~= "function" then
		var58 = false
	else
		var58 = true
	end
	assert(var58, "Bad project")
	var58 = "[RxBrioUtils.switchMap] - Deprecated since 3.6.0. Use RxBrioUtils.switchMapBrio"
	warn(var58)
	var58 = any_load_result1_result1_upvr_4
	var58 = module_upvr.mapBrio(arg1)
	return var58.switchMap(var58)
end
function module_upvr.switchMapBrio(arg1) -- Line 413
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: module_upvr (readonly)
	]]
	local var59
	if type(arg1) ~= "function" then
		var59 = false
	else
		var59 = true
	end
	assert(var59, "Bad project")
	var59 = any_load_result1_result1_upvr_4
	var59 = module_upvr.mapBrioBrio(arg1)
	return var59.switchMap(var59)
end
function module_upvr.flatCombineLatest(arg1) -- Line 437
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_3 (readonly)
		[2]: module_upvr (readonly)
		[3]: any_load_result1_result1_upvr_4 (readonly)
	]]
	local var64
	if type(arg1) ~= "table" then
		var64 = false
	else
		var64 = true
	end
	assert(var64, "Bad observables")
	var64 = pairs(arg1)
	local pairs_result1, pairs_result2, pairs_result3 = pairs(arg1)
	for i, v in pairs_result1, pairs_result2, pairs_result3 do
		if any_load_result1_result1_upvr_3.isObservable(v) then
			({})[i] = module_upvr.flattenToValueAndNil(v)
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			;({})[i] = v
		end
	end
	pairs_result1 = any_load_result1_result1_upvr_4.combineLatest
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	pairs_result1 = pairs_result1({})
	return pairs_result1
end
function module_upvr.mapBrio(arg1) -- Line 460
	--[[ Upvalues[4]:
		[1]: any_load_result1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
		[3]: any_load_result1_result1_upvr_3 (readonly)
		[4]: module_upvr (readonly)
	]]
	local var68
	if type(arg1) ~= "function" then
		var68 = false
	else
		var68 = true
	end
	assert(var68, "Bad project")
	var68 = "[RxBrioUtils.mapBrio] - Deprecated since 3.6.0. Use RxBrioUtils.mapBrioBrio"
	warn(var68)
	return function(arg1_16) -- Line 465
		--[[ Upvalues[5]:
			[1]: any_load_result1_result1_upvr (copied, readonly)
			[2]: any_load_result1_result1_upvr_4 (copied, readonly)
			[3]: arg1 (readonly)
			[4]: any_load_result1_result1_upvr_3 (copied, readonly)
			[5]: module_upvr (copied, readonly)
		]]
		assert(any_load_result1_result1_upvr.isBrio(arg1_16), "Not a brio")
		if arg1_16:IsDead() then
			return any_load_result1_result1_upvr_4.EMPTY
		end
		local arg1_result1 = arg1(arg1_16:GetValue())
		assert(any_load_result1_result1_upvr_3.isObservable(arg1_result1), "Not an observable")
		return module_upvr.completeOnDeath(arg1_16, arg1_result1)
	end
end
function module_upvr.prepend(...) -- Line 485
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr (readonly)
		[3]: any_load_result1_result1_upvr_5 (readonly)
	]]
	local packed_3_upvr = table.pack(...)
	return any_load_result1_result1_upvr_4.map(function(arg1) -- Line 488
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr (copied, readonly)
			[2]: any_load_result1_result1_upvr_5 (copied, readonly)
			[3]: packed_3_upvr (readonly)
		]]
		assert(any_load_result1_result1_upvr.isBrio(arg1), "Bad brio")
		return any_load_result1_result1_upvr_5.prepend(arg1, table.unpack(packed_3_upvr, 1, packed_3_upvr.n))
	end)
end
function module_upvr.extend(...) -- Line 501
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr (readonly)
		[3]: any_load_result1_result1_upvr_5 (readonly)
	]]
	local packed_2_upvr = table.pack(...)
	return any_load_result1_result1_upvr_4.map(function(arg1) -- Line 504
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr (copied, readonly)
			[2]: any_load_result1_result1_upvr_5 (copied, readonly)
			[3]: packed_2_upvr (readonly)
		]]
		assert(any_load_result1_result1_upvr.isBrio(arg1), "Bad brio")
		return any_load_result1_result1_upvr_5.extend(arg1, table.unpack(packed_2_upvr, 1, packed_2_upvr.n))
	end)
end
function module_upvr.map(arg1) -- Line 517
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: any_load_result1_result1_upvr (readonly)
		[3]: any_load_result1_result1_upvr_5 (readonly)
	]]
	return any_load_result1_result1_upvr_4.map(function(...) -- Line 518
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: any_load_result1_result1_upvr_5 (copied, readonly)
		]]
		local arg_count_2 = select('#', ...)
		local var83
		if arg_count_2 == 1 then
			if any_load_result1_result1_upvr.isBrio(...) then
				table.insert({}, ...)
				var83 = ...:GetPackedValues()
			else
				var83 = {...}
			end
		else
			var83 = {}
			for i_2, v_2 in pairs({...}) do
				if any_load_result1_result1_upvr.isBrio(v_2) then
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					table.insert({}, v_2)
					var83[i_2] = v_2:GetValue()
				else
					var83[i_2] = v_2
				end
			end
			var83.n = arg_count_2
		end
		local packed = table.pack(arg1(table.unpack(var83, 1, var83.n)))
		local module = {}
		for i_3 = 1, packed.n do
			local var91 = packed[i_3]
			if any_load_result1_result1_upvr.isBrio(var91) then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				table.insert({}, var91)
				module[i_3] = var91:GetValue()
			else
				module[i_3] = var91
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return any_load_result1_result1_upvr_5.first({}, table.unpack(module, 1, module.n))
	end)
end
function module_upvr._mapResult(arg1) -- Line 559
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_5 (readonly)
		[2]: any_load_result1_result1_upvr (readonly)
	]]
	return function(...) -- Line 560
		--[[ Upvalues[3]:
			[1]: any_load_result1_result1_upvr_5 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: any_load_result1_result1_upvr (copied, readonly)
		]]
		local arg_count = select('#', ...)
		if arg_count == 0 then
			return any_load_result1_result1_upvr_5.withOtherValues(arg1)
		end
		if arg_count == 1 then
			if any_load_result1_result1_upvr.isBrio(...) then
				local module_2 = {}
				module_2[1] = arg1
				module_2[2] = ...
				return any_load_result1_result1_upvr_5.first(module_2, ...:GetValue())
			end
			return any_load_result1_result1_upvr_5.withOtherValues(arg1, ...)
		end
		local module_3 = {}
		module_3[1] = arg1
		for i_4, v_3 in pairs({...}) do
			if any_load_result1_result1_upvr.isBrio(v_3) then
				table.insert(module_3, v_3)
				;({})[i_4] = v_3:GetValue()
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				;({})[i_4] = v_3
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return any_load_result1_result1_upvr_5.first(module_3, unpack({}, 1, arg_count))
	end
end
function module_upvr.mapBrioBrio(arg1) -- Line 596
	--[[ Upvalues[4]:
		[1]: any_load_result1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
		[3]: any_load_result1_result1_upvr_3 (readonly)
		[4]: module_upvr (readonly)
	]]
	local var102
	if type(arg1) ~= "function" then
		var102 = false
	else
		var102 = true
	end
	assert(var102, "Bad project")
	return function(arg1_17) -- Line 599
		--[[ Upvalues[5]:
			[1]: any_load_result1_result1_upvr (copied, readonly)
			[2]: any_load_result1_result1_upvr_4 (copied, readonly)
			[3]: arg1 (readonly)
			[4]: any_load_result1_result1_upvr_3 (copied, readonly)
			[5]: module_upvr (copied, readonly)
		]]
		assert(any_load_result1_result1_upvr.isBrio(arg1_17), "Not a brio")
		if arg1_17:IsDead() then
			return any_load_result1_result1_upvr_4.EMPTY
		end
		local arg1_result1_2 = arg1(arg1_17:GetValue())
		assert(any_load_result1_result1_upvr_3.isObservable(arg1_result1_2), "Not an observable")
		return module_upvr.completeOnDeath(arg1_17, arg1_result1_2):Pipe({any_load_result1_result1_upvr_4.map(module_upvr._mapResult(arg1_17))})
	end
end
function module_upvr.toEmitOnDeathObservable(arg1, arg2) -- Line 621
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
		[3]: any_load_result1_result1_upvr_3 (readonly)
	]]
	if not any_load_result1_result1_upvr.isBrio(arg1) then
		return any_load_result1_result1_upvr_4.of(arg1)
	end
	return any_load_result1_result1_upvr_3.new(function(arg1_18) -- Line 625
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		if arg1:IsDead() then
			arg1_18:Fire(arg2)
			arg1_18:Complete()
		else
			arg1_18:Fire(arg1:GetValue())
			return arg1:GetDiedSignal():Connect(function() -- Line 631
				--[[ Upvalues[2]:
					[1]: arg1_18 (readonly)
					[2]: arg2 (copied, readonly)
				]]
				arg1_18:Fire(arg2)
				arg1_18:Complete()
			end)
		end
	end)
end
function module_upvr.mapBrioToEmitOnDeathObservable(arg1) -- Line 646
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return function(arg1_19) -- Line 647
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return module_upvr.toEmitOnDeathObservable(arg1_19, arg1)
	end
end
function module_upvr.emitOnDeath(arg1) -- Line 659
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_4 (readonly)
		[2]: module_upvr (readonly)
	]]
	return any_load_result1_result1_upvr_4.switchMap(module_upvr.mapBrioToEmitOnDeathObservable(arg1))
end
module_upvr.flattenToValueAndNil = module_upvr.emitOnDeath(nil)
function module_upvr.onlyLastBrioSurvives() -- Line 678
	--[[ Upvalues[4]:
		[1]: any_load_result1_result1_upvr_3 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
		[3]: any_load_result1_result1_upvr (readonly)
		[4]: any_load_result1_result1_upvr_5 (readonly)
	]]
	return function(arg1) -- Line 679
		--[[ Upvalues[4]:
			[1]: any_load_result1_result1_upvr_3 (copied, readonly)
			[2]: any_load_result1_result1_upvr_2 (copied, readonly)
			[3]: any_load_result1_result1_upvr (copied, readonly)
			[4]: any_load_result1_result1_upvr_5 (copied, readonly)
		]]
		return any_load_result1_result1_upvr_3.new(function(arg1_20) -- Line 680
			--[[ Upvalues[4]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				[2]: arg1 (readonly)
				[3]: any_load_result1_result1_upvr (copied, readonly)
				[4]: any_load_result1_result1_upvr_5 (copied, readonly)
			]]
			local any_new_result1_10_upvr = any_load_result1_result1_upvr_2.new()
			any_new_result1_10_upvr:GiveTask(arg1:Subscribe(function(arg1_21) -- Line 683
				--[[ Upvalues[4]:
					[1]: any_load_result1_result1_upvr (copied, readonly)
					[2]: any_new_result1_10_upvr (readonly)
					[3]: arg1_20 (readonly)
					[4]: any_load_result1_result1_upvr_5 (copied, readonly)
				]]
				if not any_load_result1_result1_upvr.isBrio(arg1_21) then
					warn("[RxBrioUtils.onlyLastBrioSurvives] - Not a brio, %q":format(tostring(arg1_21)))
					any_new_result1_10_upvr._lastBrio = nil
					arg1_20:Fail("Not a brio")
				else
					local clone = any_load_result1_result1_upvr_5.clone(arg1_21)
					any_new_result1_10_upvr._lastBrio = clone
					arg1_20:Fire(clone)
				end
			end, arg1_20:GetFailComplete()))
			return any_new_result1_10_upvr
		end)
	end
end
module_upvr.switchToBrio = any_load_result1_result1_upvr_4.pipe({module_upvr.toBrio(), module_upvr.onlyLastBrioSurvives()})
return module_upvr