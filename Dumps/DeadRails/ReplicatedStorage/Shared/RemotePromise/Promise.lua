--[[
    Script: ReplicatedStorage.Shared.RemotePromise.Promise
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:45
-- Luau version 6, Types version 3
-- Time taken: 0.039438 seconds

local tbl_9_upvr = {
	__mode = 'k';
}
local function _(arg1) -- Line 10, Named "isCallable"
	if type(arg1) == "function" then
		return true
	end
	if type(arg1) == "table" then
		local getmetatable_result1_12 = getmetatable(arg1)
		if getmetatable_result1_12 and type(rawget(getmetatable_result1_12, "__call")) == "function" then
			return true
		end
	end
	return false
end
local function makeEnum(arg1, arg2) -- Line 28
	local module_8 = {}
	for _, v in ipairs(arg2) do
		module_8[v] = v
	end
	return setmetatable(module_8, {
		__index = function(arg1_2, arg2_2) -- Line 36, Named "__index"
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			error(string.format("%s is not in %s!", arg2_2, arg1), 2)
		end;
		__newindex = function() -- Line 39, Named "__newindex"
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			error(string.format("Creating new members in %s is not allowed!", arg1), 2)
		end;
	})
end
local var15_upvw = {
	Kind = makeEnum("Promise.Error.Kind", {"ExecutionError", "AlreadyCancelled", "NotResolvedInTime", "TimedOut"});
}
var15_upvw.__index = var15_upvw
local function new(arg1, arg2) -- Line 64
	--[[ Upvalues[1]:
		[1]: var15_upvw (read and write)
	]]
	local var16 = arg1
	if not var16 then
		var16 = {}
	end
	local var17 = var16
	local module = {
		error = tostring(var17.error) or "[This error has no error text.]";
		trace = var17.trace;
		context = var17.context;
		kind = var17.kind;
	}
	module.parent = arg2
	module.createdTick = os.clock()
	module.createdTrace = debug.traceback()
	return setmetatable(module, var15_upvw)
end
var15_upvw.new = new
local function is(arg1) -- Line 77
	if type(arg1) == "table" then
		local getmetatable_result1_4 = getmetatable(arg1)
		if type(getmetatable_result1_4) == "table" then
			local var22 = false
			if rawget(arg1, "error") ~= nil then
				if type(rawget(getmetatable_result1_4, "extend")) ~= "function" then
					var22 = false
				else
					var22 = true
				end
			end
			return var22
		end
	end
	return false
end
var15_upvw.is = is
function var15_upvw.isKind(arg1, arg2) -- Line 89
	--[[ Upvalues[1]:
		[1]: var15_upvw (read and write)
	]]
	if arg2 == nil then
	else
	end
	assert(true, "Argument #2 to Promise.Error.isKind must not be nil")
	if var15_upvw.is(arg1) then
		if arg1.kind ~= arg2 then
		else
		end
	end
	return true
end
function var15_upvw.extend(arg1, arg2) -- Line 95
	--[[ Upvalues[1]:
		[1]: var15_upvw (read and write)
	]]
	local var23 = arg2
	if not var23 then
		var23 = {}
	end
	local var24 = var23
	var23 = var24.kind
	local var25 = var23
	if not var25 then
		var25 = arg1.kind
	end
	var24.kind = var25
	return var15_upvw.new(var24, arg1)
end
function var15_upvw.getErrorChain(arg1) -- Line 103
	local module_2 = {}
	module_2[1] = arg1
	while module_2[#module_2].parent do
		table.insert(module_2, module_2[#module_2].parent)
	end
	return module_2
end
local function __tostring(arg1) -- Line 113
	local module_3 = {string.format("-- Promise.Error(%s) --", arg1.kind or '?')}
	for _, v_2 in ipairs(arg1:getErrorChain()) do
		local tbl_2 = {}
		local trace = v_2.trace
		if not trace then
			trace = v_2.error
		end
		tbl_2[1] = trace
		tbl_2[2] = v_2.context
		table.insert(module_3, table.concat(tbl_2, '\n'))
	end
	return table.concat(module_3, '\n')
end
var15_upvw.__tostring = __tostring
local function pack_upvr(...) -- Line 137, Named "pack"
	return select('#', ...), {...}
end
local function packResult_upvr(arg1, ...) -- Line 144, Named "packResult"
	return arg1, select('#', ...), {...}
end
local function _(arg1) -- Line 148, Named "makeErrorHandler"
	--[[ Upvalues[1]:
		[1]: var15_upvw (read and write)
	]]
	if arg1 == nil then
	else
	end
	assert(true, "traceback is nil")
	return function(arg1_3) -- Line 151
		--[[ Upvalues[2]:
			[1]: var15_upvw (copied, read and write)
			[2]: arg1 (readonly)
		]]
		if type(arg1_3) == "table" then
			return arg1_3
		end
		local module_10 = {}
		module_10.error = arg1_3
		module_10.kind = var15_upvw.Kind.ExecutionError
		module_10.trace = debug.traceback(tostring(arg1_3), 2)
		module_10.context = "Promise created at:\n\n"..arg1
		return var15_upvw.new(module_10)
	end
end
local function runExecutor_upvr(arg1, arg2, ...) -- Line 171, Named "runExecutor"
	--[[ Upvalues[2]:
		[1]: packResult_upvr (readonly)
		[2]: var15_upvw (read and write)
	]]
	local var41
	if arg1 == nil then
		var41 = false
	else
		var41 = true
	end
	assert(var41, "traceback is nil")
	return packResult_upvr(xpcall(arg2, function(arg1_4) -- Line 151
		--[[ Upvalues[2]:
			[1]: var15_upvw (copied, read and write)
			[2]: arg1 (readonly)
		]]
		if type(arg1_4) == "table" then
			return arg1_4
		end
		local module_5 = {}
		module_5.error = arg1_4
		module_5.kind = var15_upvw.Kind.ExecutionError
		module_5.trace = debug.traceback(tostring(arg1_4), 2)
		module_5.context = "Promise created at:\n\n"..arg1
		return var15_upvw.new(module_5)
	end, ...))
end
local function _(arg1, arg2, arg3, arg4) -- Line 179, Named "createAdvancer"
	--[[ Upvalues[1]:
		[1]: runExecutor_upvr (readonly)
	]]
	return function(...) -- Line 180
		--[[ Upvalues[5]:
			[1]: runExecutor_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
			[4]: arg3 (readonly)
			[5]: arg4 (readonly)
		]]
		local runExecutor_upvr_result1_2, runExecutor_upvr_result2_2, runExecutor_upvr_result3 = runExecutor_upvr(arg1, arg2, ...)
		if runExecutor_upvr_result1_2 then
			arg3(unpack(runExecutor_upvr_result3, 1, runExecutor_upvr_result2_2))
		else
			arg4(runExecutor_upvr_result3[1])
		end
	end
end
local function _(arg1) -- Line 191, Named "isEmpty"
	local var48
	if next(arg1) ~= nil then
		var48 = false
	else
		var48 = true
	end
	return var48
end
local module_7_upvr = {
	Error = var15_upvw;
	Status = makeEnum("Promise.Status", {"Started", "Resolved", "Rejected", "Cancelled"});
	_getTime = os.clock;
	_timeEvent = game:GetService("RunService").Heartbeat;
	_unhandledRejectionCallbacks = {};
	prototype = {};
	__index = module_7_upvr.prototype;
}
function module_7_upvr._new(arg1, arg2, arg3) -- Line 230
	--[[ Upvalues[3]:
		[1]: module_7_upvr (readonly)
		[2]: tbl_9_upvr (readonly)
		[3]: runExecutor_upvr (readonly)
	]]
	if arg3 ~= nil and not module_7_upvr.is(arg3) then
		error("Argument #2 to Promise.new must be a promise or nil", 2)
	end
	local module_9_upvr = {
		_thread = nil;
	}
	module_9_upvr._source = arg1
	module_9_upvr._status = module_7_upvr.Status.Started
	module_9_upvr._values = nil
	module_9_upvr._valuesLength = -1
	module_9_upvr._unhandledRejection = true
	module_9_upvr._queuedResolve = {}
	module_9_upvr._queuedReject = {}
	module_9_upvr._queuedFinally = {}
	module_9_upvr._cancellationHook = nil
	module_9_upvr._parent = arg3
	module_9_upvr._consumers = setmetatable({}, tbl_9_upvr)
	if arg3 and arg3._status == module_7_upvr.Status.Started then
		arg3._consumers[module_9_upvr] = true
	end
	setmetatable(module_9_upvr, module_7_upvr)
	local function resolve(...) -- Line 278
		--[[ Upvalues[1]:
			[1]: module_9_upvr (readonly)
		]]
		module_9_upvr:_resolve(...)
	end
	local function reject(...) -- Line 282
		--[[ Upvalues[1]:
			[1]: module_9_upvr (readonly)
		]]
		module_9_upvr:_reject(...)
	end
	local function onCancel_upvr(arg1_5) -- Line 286, Named "onCancel"
		--[[ Upvalues[2]:
			[1]: module_9_upvr (readonly)
			[2]: module_7_upvr (copied, readonly)
		]]
		if arg1_5 then
			if module_9_upvr._status == module_7_upvr.Status.Cancelled then
				arg1_5()
			else
				module_9_upvr._cancellationHook = arg1_5
			end
		end
		if module_9_upvr._status ~= module_7_upvr.Status.Cancelled then
		else
		end
		return true
	end
	module_9_upvr._thread = coroutine.create(function() -- Line 298
		--[[ Upvalues[6]:
			[1]: runExecutor_upvr (copied, readonly)
			[2]: module_9_upvr (readonly)
			[3]: arg2 (readonly)
			[4]: resolve (readonly)
			[5]: reject (readonly)
			[6]: onCancel_upvr (readonly)
		]]
		local runExecutor_result1_2, _, runExecutor_upvr_result3_5 = runExecutor_upvr(module_9_upvr._source, arg2, resolve, reject, onCancel_upvr)
		if not runExecutor_result1_2 then
			reject(runExecutor_upvr_result3_5[1])
		end
	end)
	task.spawn(module_9_upvr._thread)
	return module_9_upvr
end
function module_7_upvr.new(arg1) -- Line 349
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	return module_7_upvr._new(debug.traceback(nil, 2), arg1)
end
function module_7_upvr.__tostring(arg1) -- Line 353
	return string.format("Promise(%s)", arg1._status)
end
function module_7_upvr.defer(arg1) -- Line 375
	--[[ Upvalues[2]:
		[1]: module_7_upvr (readonly)
		[2]: runExecutor_upvr (readonly)
	]]
	local call_stack_3_upvr = debug.traceback(nil, 2)
	return module_7_upvr._new(call_stack_3_upvr, function(arg1_6, arg2, arg3) -- Line 378
		--[[ Upvalues[3]:
			[1]: runExecutor_upvr (copied, readonly)
			[2]: call_stack_3_upvr (readonly)
			[3]: arg1 (readonly)
		]]
		task.defer(function() -- Line 379
			--[[ Upvalues[6]:
				[1]: runExecutor_upvr (copied, readonly)
				[2]: call_stack_3_upvr (copied, readonly)
				[3]: arg1 (copied, readonly)
				[4]: arg1_6 (readonly)
				[5]: arg2 (readonly)
				[6]: arg3 (readonly)
			]]
			local runExecutor_result1_3, _, runExecutor_upvr_result3_4 = runExecutor_upvr(call_stack_3_upvr, arg1, arg1_6, arg2, arg3)
			if not runExecutor_result1_3 then
				arg2(runExecutor_upvr_result3_4[1])
			end
		end)
	end)
end
module_7_upvr.async = module_7_upvr.defer
function module_7_upvr.resolve(...) -- Line 416
	--[[ Upvalues[2]:
		[1]: pack_upvr (readonly)
		[2]: module_7_upvr (readonly)
	]]
	local pack_result1_4_upvr, pack_result2_2_upvr = pack_upvr(...)
	return module_7_upvr._new(debug.traceback(nil, 2), function(arg1) -- Line 418
		--[[ Upvalues[2]:
			[1]: pack_result2_2_upvr (readonly)
			[2]: pack_result1_4_upvr (readonly)
		]]
		arg1(unpack(pack_result2_2_upvr, 1, pack_result1_4_upvr))
	end)
end
function module_7_upvr.reject(...) -- Line 433
	--[[ Upvalues[2]:
		[1]: pack_upvr (readonly)
		[2]: module_7_upvr (readonly)
	]]
	local pack_result1_5_upvr, pack_upvr_result2_upvr = pack_upvr(...)
	return module_7_upvr._new(debug.traceback(nil, 2), function(arg1, arg2) -- Line 435
		--[[ Upvalues[2]:
			[1]: pack_upvr_result2_upvr (readonly)
			[2]: pack_result1_5_upvr (readonly)
		]]
		arg2(unpack(pack_upvr_result2_upvr, 1, pack_result1_5_upvr))
	end)
end
function module_7_upvr._try(arg1, arg2, ...) -- Line 444
	--[[ Upvalues[2]:
		[1]: pack_upvr (readonly)
		[2]: module_7_upvr (readonly)
	]]
	local pack_upvr_result1_upvr, pack_result2_6_upvr = pack_upvr(...)
	return module_7_upvr._new(arg1, function(arg1_7) -- Line 447
		--[[ Upvalues[3]:
			[1]: arg2 (readonly)
			[2]: pack_result2_6_upvr (readonly)
			[3]: pack_upvr_result1_upvr (readonly)
		]]
		arg1_7(arg2(unpack(pack_result2_6_upvr, 1, pack_upvr_result1_upvr)))
	end)
end
function module_7_upvr.try(arg1, ...) -- Line 475
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	return module_7_upvr._try(debug.traceback(nil, 2), arg1, ...)
end
function module_7_upvr._all(arg1, arg2, arg3) -- Line 484
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	if type(arg2) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.all"), 3)
	end
	for i_3, v_3 in pairs(arg2) do
		if not module_7_upvr.is(v_3) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.all", tostring(i_3)), 3)
		end
	end
	if #arg2 == 0 or arg3 == 0 then
		return module_7_upvr.resolve({})
	end
	return module_7_upvr._new(arg1, function(arg1_8, arg2_3, arg3_2) -- Line 502
		--[[ Upvalues[2]:
			[1]: arg3 (readonly)
			[2]: arg2 (readonly)
		]]
		local tbl_8_upvr = {}
		local var86_upvw = 0
		local var87_upvw = false
		local function cancel() -- Line 513
			--[[ Upvalues[1]:
				[1]: tbl_8_upvr (readonly)
			]]
			for _, v_4 in ipairs(tbl_8_upvr) do
				v_4:cancel()
			end
		end
		local var93_upvw = 0
		local tbl_5_upvr = {}
		local function resolveOne(arg1_9, ...) -- Line 520
			--[[ Upvalues[7]:
				[1]: var87_upvw (read and write)
				[2]: var93_upvw (read and write)
				[3]: arg3 (copied, readonly)
				[4]: tbl_5_upvr (readonly)
				[5]: arg2 (copied, readonly)
				[6]: arg1_8 (readonly)
				[7]: tbl_8_upvr (readonly)
			]]
			if var87_upvw then
			else
				var93_upvw += 1
				if arg3 == nil then
					tbl_5_upvr[arg1_9] = ...
				else
					tbl_5_upvr[var93_upvw] = ...
				end
				local var99 = arg3
				if not var99 then
					var99 = #arg2
				end
				if var99 <= var93_upvw then
					var87_upvw = true
					arg1_8(tbl_5_upvr)
					for _, v_16 in ipairs(tbl_8_upvr) do
						v_16:cancel()
					end
				end
			end
		end
		arg3_2(cancel)
		for i_5_upvr, v_5 in ipairs(arg2) do
			tbl_8_upvr[i_5_upvr] = v_5:andThen(function(...) -- Line 545
				--[[ Upvalues[2]:
					[1]: resolveOne (readonly)
					[2]: i_5_upvr (readonly)
				]]
				resolveOne(i_5_upvr, ...)
			end, function(...) -- Line 547
				--[[ Upvalues[6]:
					[1]: var86_upvw (read and write)
					[2]: arg3 (copied, readonly)
					[3]: arg2 (copied, readonly)
					[4]: tbl_8_upvr (readonly)
					[5]: var87_upvw (read and write)
					[6]: arg2_3 (readonly)
				]]
				var86_upvw += 1
				if arg3 == nil or #arg2 - var86_upvw < arg3 then
					for _, v_6 in ipairs(tbl_8_upvr) do
						v_6:cancel()
					end
					var87_upvw = true
					arg2_3(...)
				end
			end)
		end
		if var87_upvw then
			for _, v_7 in ipairs(tbl_8_upvr) do
				v_7:cancel()
			end
		end
	end)
end
function module_7_upvr.all(arg1) -- Line 589
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	return module_7_upvr._all(debug.traceback(nil, 2), arg1)
end
function module_7_upvr.fold(arg1, arg2, arg3) -- Line 618
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 20 start (CF ANALYSIS FAILED)
	local var122
	if type(arg1) ~= "table" then
		var122 = false
	else
		var122 = true
	end
	assert(var122, "Bad argument #1 to Promise.fold: must be a table")
	-- KONSTANTERROR: [0] 1. Error Block 20 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 19. Error Block 16 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 19. Error Block 16 end (CF ANALYSIS FAILED)
end
function module_7_upvr.some(arg1, arg2) -- Line 651
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	local var123
	if type(arg2) ~= "number" then
		var123 = false
	else
		var123 = true
	end
	assert(var123, "Bad argument #2 to Promise.some: must be a number")
	var123 = module_7_upvr
	var123 = debug.traceback(nil, 2)
	return var123._all(var123, arg1, arg2)
end
function module_7_upvr.any(arg1) -- Line 675
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	return module_7_upvr._all(debug.traceback(nil, 2), arg1, 1):andThen(function(arg1_12) -- Line 676
		return arg1_12[1]
	end)
end
function module_7_upvr.allSettled(arg1) -- Line 697
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	if type(arg1) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2)
	end
	for i_8, v_8 in pairs(arg1) do
		if not module_7_upvr.is(v_8) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", tostring(i_8)), 2)
		end
	end
	if #arg1 == 0 then
		return module_7_upvr.resolve({})
	end
	return module_7_upvr._new(debug.traceback(nil, 2), function(arg1_13, arg2, arg3) -- Line 715
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local tbl_3_upvr = {}
		local var136_upvw = 0
		local tbl_upvr = {}
		local function resolveOne_upvr(arg1_14, ...) -- Line 725, Named "resolveOne"
			--[[ Upvalues[4]:
				[1]: var136_upvw (read and write)
				[2]: tbl_upvr (readonly)
				[3]: arg1 (copied, readonly)
				[4]: arg1_13 (readonly)
			]]
			var136_upvw += 1
			tbl_upvr[arg1_14] = ...
			if #arg1 <= var136_upvw then
				arg1_13(tbl_upvr)
			end
		end
		arg3(function() -- Line 735
			--[[ Upvalues[1]:
				[1]: tbl_3_upvr (readonly)
			]]
			for _, v_9 in ipairs(tbl_3_upvr) do
				v_9:cancel()
			end
		end)
		for i_10_upvr, v_10 in ipairs(arg1) do
			tbl_3_upvr[i_10_upvr] = v_10:finally(function(...) -- Line 744
				--[[ Upvalues[2]:
					[1]: resolveOne_upvr (readonly)
					[2]: i_10_upvr (readonly)
				]]
				resolveOne_upvr(i_10_upvr, ...)
			end)
		end
	end)
end
function module_7_upvr.race(arg1) -- Line 775
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	local var152
	if type(arg1) ~= "table" then
		var152 = false
	else
		var152 = true
	end
	assert(var152, string.format("Please pass a list of promises to %s", "Promise.race"))
	var152 = arg1
	local pairs_result1, pairs_result2, pairs_result3 = pairs(var152)
	for i_11, v_11 in pairs_result1, pairs_result2, pairs_result3 do
		assert(module_7_upvr.is(v_11), string.format("Non-promise value passed into %s at index %s", "Promise.race", tostring(i_11)))
	end
	pairs_result2 = module_7_upvr
	pairs_result2 = debug.traceback(nil, 2)
	return pairs_result2._new(pairs_result2, function(arg1_15, arg2, arg3) -- Line 782
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local tbl_10_upvr = {}
		local var166_upvw = false
		local function cancel() -- Line 786
			--[[ Upvalues[1]:
				[1]: tbl_10_upvr (readonly)
			]]
			for _, v_12 in ipairs(tbl_10_upvr) do
				v_12:cancel()
			end
		end
		local function _(arg1_16) -- Line 792, Named "finalize"
			--[[ Upvalues[2]:
				[1]: tbl_10_upvr (readonly)
				[2]: var166_upvw (read and write)
			]]
			return function(...) -- Line 793
				--[[ Upvalues[3]:
					[1]: tbl_10_upvr (copied, readonly)
					[2]: var166_upvw (copied, read and write)
					[3]: arg1_16 (readonly)
				]]
				for _, v_13 in ipairs(tbl_10_upvr) do
					v_13:cancel()
				end
				var166_upvw = true
				return arg1_16(...)
			end
		end
		if arg3(function(...) -- Line 793
			--[[ Upvalues[3]:
				[1]: tbl_10_upvr (readonly)
				[2]: var166_upvw (read and write)
				[3]: arg2 (readonly)
			]]
			for _, v_14 in ipairs(tbl_10_upvr) do
				v_14:cancel()
			end
			var166_upvw = true
			return arg2(...)
		end) then
		else
			for i_17, v_17 in ipairs(arg1) do
				tbl_10_upvr[i_17] = v_17:andThen(function(...) -- Line 793
					--[[ Upvalues[3]:
						[1]: tbl_10_upvr (readonly)
						[2]: var166_upvw (read and write)
						[3]: arg1_15 (readonly)
					]]
					for _, v_18 in ipairs(tbl_10_upvr) do
						v_18:cancel()
					end
					var166_upvw = true
					return arg1_15(...)
				end, function(...) -- Line 793
					--[[ Upvalues[3]:
						[1]: tbl_10_upvr (readonly)
						[2]: var166_upvw (read and write)
						[3]: arg2 (readonly)
					]]
					for _, v_19 in ipairs(tbl_10_upvr) do
						v_19:cancel()
					end
					var166_upvw = true
					return arg2(...)
				end)
			end
			if var166_upvw then
				for _, v_20 in ipairs(tbl_10_upvr) do
					v_20:cancel()
				end
			end
		end
	end)
end
function module_7_upvr.each(arg1, arg2) -- Line 870
	--[[ Upvalues[2]:
		[1]: module_7_upvr (readonly)
		[2]: var15_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 20 start (CF ANALYSIS FAILED)
	local var309
	if type(arg1) ~= "table" then
		var309 = false
	else
		var309 = true
	end
	assert(var309, string.format("Please pass a list of promises to %s", "Promise.each"))
	-- KONSTANTERROR: [0] 1. Error Block 20 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [27] 22. Error Block 16 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [27] 22. Error Block 16 end (CF ANALYSIS FAILED)
end
function module_7_upvr.is(arg1) -- Line 969
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 6. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return false
	end
	-- KONSTANTERROR: [7] 6. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 8. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 8. Error Block 3 end (CF ANALYSIS FAILED)
end
function module_7_upvr.promisify(arg1) -- Line 1018
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	return function(...) -- Line 1019
		--[[ Upvalues[2]:
			[1]: module_7_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return module_7_upvr._try(debug.traceback(nil, 2), arg1, ...)
	end
end
function module_7_upvr.delay(arg1) -- Line 1042
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	local var311
	if type(arg1) ~= "number" then
		var311 = false
	else
		var311 = true
	end
	assert(var311, "Bad argument #1 to Promise.delay, must be a number.")
	var311 = module_7_upvr
	var311 = module_7_upvr._new
	local any__getTime_result1_upvr = var311._getTime()
	var311 = var311(debug.traceback(nil, 2), function(arg1_18) -- Line 1045
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: module_7_upvr (copied, readonly)
			[3]: any__getTime_result1_upvr (readonly)
		]]
		task.delay(arg1, function() -- Line 1046
			--[[ Upvalues[3]:
				[1]: arg1_18 (readonly)
				[2]: module_7_upvr (copied, readonly)
				[3]: any__getTime_result1_upvr (copied, readonly)
			]]
			arg1_18(module_7_upvr._getTime() - any__getTime_result1_upvr)
		end)
	end)
	return var311
end
module_7_upvr.prototype.timeout = function(arg1, arg2, arg3) -- Line 1090, Named "timeout"
	--[[ Upvalues[2]:
		[1]: module_7_upvr (readonly)
		[2]: var15_upvw (read and write)
	]]
	local module_4 = {}
	local call_stack_2_upvr = debug.traceback(nil, 2)
	module_4[1] = module_7_upvr.delay(arg2):andThen(function() -- Line 1094
		--[[ Upvalues[5]:
			[1]: module_7_upvr (copied, readonly)
			[2]: arg3 (readonly)
			[3]: var15_upvw (copied, read and write)
			[4]: arg2 (readonly)
			[5]: call_stack_2_upvr (readonly)
		]]
		local var318
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var318 = var318(tbl_11)
			tbl_11.context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", arg2, call_stack_2_upvr)
			tbl_11.error = "Timed out"
			tbl_11.kind = var15_upvw.Kind.TimedOut
			local tbl_11 = {}
			var318 = var15_upvw.new
			return var318
		end
		if arg3 ~= nil or not INLINED() then
			var318 = arg3
		end
		return module_7_upvr.reject(var318)
	end)
	module_4[2] = arg1
	return module_7_upvr.race(module_4)
end
module_7_upvr.prototype.getStatus = function(arg1) -- Line 1114, Named "getStatus"
	return arg1._status
end
module_7_upvr.prototype._andThen = function(arg1, arg2, arg3, arg4) -- Line 1123, Named "_andThen"
	--[[ Upvalues[2]:
		[1]: module_7_upvr (readonly)
		[2]: runExecutor_upvr (readonly)
	]]
	arg1._unhandledRejection = false
	if arg1._status == module_7_upvr.Status.Cancelled then
		local any_new_result1 = module_7_upvr.new(function() -- Line 1128
		end)
		any_new_result1:cancel()
		return any_new_result1
	end
	return module_7_upvr._new(arg2, function(arg1_19, arg2_6, arg3_3) -- Line 1135
		--[[ Upvalues[6]:
			[1]: arg3 (readonly)
			[2]: arg2 (readonly)
			[3]: runExecutor_upvr (copied, readonly)
			[4]: arg4 (readonly)
			[5]: arg1 (readonly)
			[6]: module_7_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var328_upvw
		if var328_upvw then
			var328_upvw = arg2
			local function var324_upvw(...) -- Line 180
				--[[ Upvalues[5]:
					[1]: runExecutor_upvr (copied, readonly)
					[2]: var328_upvw (readonly)
					[3]: arg3 (readonly)
					[4]: arg1_19 (readonly)
					[5]: arg2_6 (readonly)
				]]
				local runExecutor_result1, runExecutor_result2, runExecutor_upvr_result3_6 = runExecutor_upvr(var328_upvw, arg3, ...)
				if runExecutor_result1 then
					arg1_19(unpack(runExecutor_upvr_result3_6, 1, runExecutor_result2))
				else
					arg2_6(runExecutor_upvr_result3_6[1])
				end
			end
		end
		var328_upvw = arg2_6
		if arg4 then
			function var328_upvw(...) -- Line 180
				--[[ Upvalues[5]:
					[1]: runExecutor_upvr (copied, readonly)
					[2]: arg2 (readonly)
					[3]: arg4 (readonly)
					[4]: arg1_19 (readonly)
					[5]: arg2_6 (readonly)
				]]
				local runExecutor_upvr_result1_3, runExecutor_upvr_result2, runExecutor_upvr_result3_3 = runExecutor_upvr(arg2, arg4, ...)
				if runExecutor_upvr_result1_3 then
					arg1_19(unpack(runExecutor_upvr_result3_3, 1, runExecutor_upvr_result2))
				else
					arg2_6(runExecutor_upvr_result3_3[1])
				end
			end
		end
		if arg1._status == module_7_upvr.Status.Started then
			table.insert(arg1._queuedResolve, var324_upvw)
			table.insert(arg1._queuedReject, var328_upvw)
			local function var332() -- Line 1154
				--[[ Upvalues[4]:
					[1]: arg1 (copied, readonly)
					[2]: module_7_upvr (copied, readonly)
					[3]: var324_upvw (read and write)
					[4]: var328_upvw (read and write)
				]]
				if arg1._status == module_7_upvr.Status.Started then
					table.remove(arg1._queuedResolve, table.find(arg1._queuedResolve, var324_upvw))
					table.remove(arg1._queuedReject, table.find(arg1._queuedReject, var328_upvw))
				end
			end
			arg3_3(var332)
		else
			var332 = arg1
			var332 = module_7_upvr.Status.Resolved
			if var332._status == var332 then
				var332 = unpack(arg1._values, 1, arg1._valuesLength)
				var324_upvw(var332)
			else
				var332 = arg1
				var332 = module_7_upvr.Status.Rejected
				if var332._status == var332 then
					var332 = unpack(arg1._values, 1, arg1._valuesLength)
					var328_upvw(var332)
				end
			end
		end
	end, arg1)
end
module_7_upvr.prototype.andThen = function(arg1, arg2, arg3) -- Line 1193, Named "andThen"
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 15. Error Block 27 start (CF ANALYSIS FAILED)
	local getmetatable_result1_11 = getmetatable(arg2)
	local var337
	if getmetatable_result1_11 and type(rawget(getmetatable_result1_11, "__call")) == "function" then
		var337 = true
	else
		-- KONSTANTERROR: [40] 31. Error Block 9 start (CF ANALYSIS FAILED)
		var337 = false
		-- KONSTANTERROR: [40] 31. Error Block 9 end (CF ANALYSIS FAILED)
	end
	-- KONSTANTERROR: [19] 15. Error Block 27 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [41] 32. Error Block 24 start (CF ANALYSIS FAILED)
	assert(var337, string.format("Please pass a handler function to %s!", "Promise:andThen"))
	var337 = true
	-- KONSTANTERROR: [41] 32. Error Block 24 end (CF ANALYSIS FAILED)
end
module_7_upvr.prototype.catch = function(arg1, arg2) -- Line 1220, Named "catch"
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 15. Error Block 14 start (CF ANALYSIS FAILED)
	local getmetatable_result1_3 = getmetatable(arg2)
	local var339
	if getmetatable_result1_3 and type(rawget(getmetatable_result1_3, "__call")) == "function" then
		var339 = true
	else
		-- KONSTANTERROR: [40] 31. Error Block 9 start (CF ANALYSIS FAILED)
		var339 = false
		-- KONSTANTERROR: [40] 31. Error Block 9 end (CF ANALYSIS FAILED)
	end
	-- KONSTANTERROR: [19] 15. Error Block 14 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [41] 32. Error Block 12 start (CF ANALYSIS FAILED)
	assert(var339, string.format("Please pass a handler function to %s!", "Promise:catch"))
	do
		return arg1:_andThen(debug.traceback(nil, 2), nil, arg2)
	end
	-- KONSTANTERROR: [41] 32. Error Block 12 end (CF ANALYSIS FAILED)
end
module_7_upvr.prototype.tap = function(arg1, arg2) -- Line 1241, Named "tap"
	--[[ Upvalues[2]:
		[1]: module_7_upvr (readonly)
		[2]: pack_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 8. Error Block 12 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 8. Error Block 12 end (CF ANALYSIS FAILED)
end
module_7_upvr.prototype.andThenCall = function(arg1, arg2, ...) -- Line 1276, Named "andThenCall"
	--[[ Upvalues[1]:
		[1]: pack_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 12 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 12 end (CF ANALYSIS FAILED)
end
module_7_upvr.prototype.andThenReturn = function(arg1, ...) -- Line 1306, Named "andThenReturn"
	--[[ Upvalues[1]:
		[1]: pack_upvr (readonly)
	]]
	local pack_result1_upvr, pack_result2_4_upvr = pack_upvr(...)
	return arg1:_andThen(debug.traceback(nil, 2), function() -- Line 1308
		--[[ Upvalues[2]:
			[1]: pack_result2_4_upvr (readonly)
			[2]: pack_result1_upvr (readonly)
		]]
		return unpack(pack_result2_4_upvr, 1, pack_result1_upvr)
	end)
end
module_7_upvr.prototype.cancel = function(arg1) -- Line 1324, Named "cancel"
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	if arg1._status ~= module_7_upvr.Status.Started then
	else
		arg1._status = module_7_upvr.Status.Cancelled
		if arg1._cancellationHook then
			arg1._cancellationHook()
		end
		coroutine.close(arg1._thread)
		if arg1._parent then
			arg1._parent:_consumerCancelled(arg1)
		end
		for i_21 in pairs(arg1._consumers) do
			i_21:cancel()
		end
		arg1:_finalize()
	end
end
module_7_upvr.prototype._consumerCancelled = function(arg1, arg2) -- Line 1352, Named "_consumerCancelled"
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	if arg1._status ~= module_7_upvr.Status.Started then
	else
		arg1._consumers[arg2] = nil
		if next(arg1._consumers) == nil then
			arg1:cancel()
		end
	end
end
module_7_upvr.prototype._finally = function(arg1, arg2, arg3) -- Line 1368, Named "_finally"
	--[[ Upvalues[2]:
		[1]: module_7_upvr (readonly)
		[2]: runExecutor_upvr (readonly)
	]]
	arg1._unhandledRejection = false
	return module_7_upvr._new(arg2, function(arg1_20, arg2_7, arg3_4) -- Line 1371
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: arg3 (readonly)
			[3]: runExecutor_upvr (copied, readonly)
			[4]: arg2 (readonly)
			[5]: module_7_upvr (copied, readonly)
		]]
		local var353_upvw
		arg3_4(function() -- Line 1374
			--[[ Upvalues[2]:
				[1]: arg1 (copied, readonly)
				[2]: var353_upvw (read and write)
			]]
			arg1:_consumerCancelled(arg1)
			if var353_upvw then
				var353_upvw:cancel()
			end
		end)
		local var356
		if arg3 then
			function var356(...) -- Line 1387
				--[[ Upvalues[8]:
					[1]: runExecutor_upvr (copied, readonly)
					[2]: arg2 (copied, readonly)
					[3]: arg3 (copied, readonly)
					[4]: arg2_7 (readonly)
					[5]: module_7_upvr (copied, readonly)
					[6]: var353_upvw (read and write)
					[7]: arg1_20 (readonly)
					[8]: arg1 (copied, readonly)
				]]
				local runExecutor_upvr_result1, _, runExecutor_upvr_result3_2 = runExecutor_upvr(arg2, arg3, ...)
				local _1_2 = runExecutor_upvr_result3_2[1]
				if not runExecutor_upvr_result1 then
					return arg2_7(_1_2)
				end
				if module_7_upvr.is(_1_2) then
					var353_upvw = _1_2
					_1_2:finally(function(arg1_21) -- Line 1398
						--[[ Upvalues[3]:
							[1]: module_7_upvr (copied, readonly)
							[2]: arg1_20 (copied, readonly)
							[3]: arg1 (copied, readonly)
						]]
						if arg1_21 ~= module_7_upvr.Status.Rejected then
							arg1_20(arg1)
						end
					end):catch(function(...) -- Line 1403
						--[[ Upvalues[1]:
							[1]: arg2_7 (copied, readonly)
						]]
						arg2_7(...)
					end)
				else
					arg1_20(arg1)
				end
			end
		end
		if arg1._status == module_7_upvr.Status.Started then
			table.insert(arg1._queuedFinally, var356)
		else
			var356(arg1._status)
		end
	end)
end
module_7_upvr.prototype.finally = function(arg1, arg2) -- Line 1473, Named "finally"
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 15. Error Block 14 start (CF ANALYSIS FAILED)
	local getmetatable_result1_7 = getmetatable(arg2)
	local var364
	if getmetatable_result1_7 and type(rawget(getmetatable_result1_7, "__call")) == "function" then
		var364 = true
	else
		-- KONSTANTERROR: [40] 31. Error Block 9 start (CF ANALYSIS FAILED)
		var364 = false
		-- KONSTANTERROR: [40] 31. Error Block 9 end (CF ANALYSIS FAILED)
	end
	-- KONSTANTERROR: [19] 15. Error Block 14 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [41] 32. Error Block 12 start (CF ANALYSIS FAILED)
	assert(var364, string.format("Please pass a handler function to %s!", "Promise:finally"))
	do
		return arg1:_finally(debug.traceback(nil, 2), arg2)
	end
	-- KONSTANTERROR: [41] 32. Error Block 12 end (CF ANALYSIS FAILED)
end
module_7_upvr.prototype.finallyCall = function(arg1, arg2, ...) -- Line 1487, Named "finallyCall"
	--[[ Upvalues[1]:
		[1]: pack_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 12 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 12 end (CF ANALYSIS FAILED)
end
module_7_upvr.prototype.finallyReturn = function(arg1, ...) -- Line 1513, Named "finallyReturn"
	--[[ Upvalues[1]:
		[1]: pack_upvr (readonly)
	]]
	local pack_result1_2_upvr, pack_result2_5_upvr = pack_upvr(...)
	return arg1:_finally(debug.traceback(nil, 2), function() -- Line 1515
		--[[ Upvalues[2]:
			[1]: pack_result2_5_upvr (readonly)
			[2]: pack_result1_2_upvr (readonly)
		]]
		return unpack(pack_result2_5_upvr, 1, pack_result1_2_upvr)
	end)
end
module_7_upvr.prototype.awaitStatus = function(arg1) -- Line 1527, Named "awaitStatus"
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	arg1._unhandledRejection = false
	if arg1._status == module_7_upvr.Status.Started then
		local current_thread_upvr = coroutine.running()
		arg1:finally(function() -- Line 1534
			--[[ Upvalues[1]:
				[1]: current_thread_upvr (readonly)
			]]
			task.spawn(current_thread_upvr)
		end):catch(function() -- Line 1540
		end)
		coroutine.yield()
	end
	current_thread_upvr = arg1._status
	if current_thread_upvr == module_7_upvr.Status.Resolved then
		current_thread_upvr = arg1._status
		return current_thread_upvr, unpack(arg1._values, 1, arg1._valuesLength)
	end
	current_thread_upvr = arg1._status
	if current_thread_upvr == module_7_upvr.Status.Rejected then
		current_thread_upvr = arg1._status
		return current_thread_upvr, unpack(arg1._values, 1, arg1._valuesLength)
	end
	current_thread_upvr = arg1._status
	return current_thread_upvr
end
local function awaitHelper_upvr(arg1, ...) -- Line 1555, Named "awaitHelper"
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	local var371
	if arg1 ~= module_7_upvr.Status.Resolved then
		var371 = false
	else
		var371 = true
	end
	return var371, ...
end
module_7_upvr.prototype.await = function(arg1) -- Line 1580, Named "await"
	--[[ Upvalues[1]:
		[1]: awaitHelper_upvr (readonly)
	]]
	return awaitHelper_upvr(arg1:awaitStatus())
end
local function expectHelper_upvr(arg1, ...) -- Line 1584, Named "expectHelper"
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	local Status = module_7_upvr.Status
	if arg1 ~= Status.Resolved then
		if ... == nil then
			Status = "Expected Promise rejected with no value."
		else
			Status = ...
		end
		error(Status, 3)
	end
	return ...
end
module_7_upvr.prototype.expect = function(arg1) -- Line 1617, Named "expect"
	--[[ Upvalues[1]:
		[1]: expectHelper_upvr (readonly)
	]]
	return expectHelper_upvr(arg1:awaitStatus())
end
module_7_upvr.prototype.awaitValue = module_7_upvr.prototype.expect
module_7_upvr.prototype._unwrap = function(arg1) -- Line 1631, Named "_unwrap"
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	local var373
	if var373 == module_7_upvr.Status.Started then
		var373 = error
		var373("Promise has not resolved or rejected.", 2)
	end
	if arg1._status ~= module_7_upvr.Status.Resolved then
		var373 = false
	else
		var373 = true
	end
	return var373, unpack(arg1._values, 1, arg1._valuesLength)
end
module_7_upvr.prototype._resolve = function(arg1, ...) -- Line 1641, Named "_resolve"
	--[[ Upvalues[3]:
		[1]: module_7_upvr (readonly)
		[2]: var15_upvw (read and write)
		[3]: pack_upvr (readonly)
	]]
	if arg1._status ~= module_7_upvr.Status.Started then
		if module_7_upvr.is(...) then
			...:_consumerCancelled(arg1)
		end
	else
		if module_7_upvr.is(...) then
			if 1 < select('#', ...) then
				warn(string.format("When returning a Promise from andThen, extra arguments are ".."discarded! See:\n\n%s", arg1._source))
			end
			local var376_upvr = ...
			local any_andThen_result1 = var376_upvr:andThen(function(...) -- Line 1662
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				arg1:_resolve(...)
			end, function(...) -- Line 1664
				--[[ Upvalues[3]:
					[1]: var376_upvr (readonly)
					[2]: var15_upvw (copied, read and write)
					[3]: arg1 (readonly)
				]]
				local _1 = var376_upvr._values[1]
				if var376_upvr._error then
					_1 = var15_upvw.new({
						error = var376_upvr._error;
						kind = var15_upvw.Kind.ExecutionError;
						context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]";
					})
				end
				if var15_upvw.isKind(_1, var15_upvw.Kind.ExecutionError) then
					return arg1:_reject(_1:extend({
						error = "This Promise was chained to a Promise that errored.";
						trace = "";
						context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", arg1._source);
					}))
				end
				arg1:_reject(...)
			end)
			if any_andThen_result1._status == module_7_upvr.Status.Cancelled then
				arg1:cancel()
			elseif any_andThen_result1._status == module_7_upvr.Status.Started then
				arg1._parent = any_andThen_result1
				any_andThen_result1._consumers[arg1] = true
			end
		end
		var376_upvr = module_7_upvr.Status.Resolved
		arg1._status = var376_upvr
		var376_upvr = pack_upvr(...)
		local pack_result1, pack_result2 = pack_upvr(...)
		arg1._valuesLength = pack_result1
		arg1._values = pack_result2
		pack_result1 = ipairs(arg1._queuedResolve)
		local ipairs_result1_23, ipairs_result2_13, ipairs_result3_8 = ipairs(arg1._queuedResolve)
		for _, v_21 in ipairs_result1_23, ipairs_result2_13, ipairs_result3_8 do
			coroutine.wrap(v_21)(...)
		end
		ipairs_result1_23 = arg1:_finalize
		ipairs_result1_23()
	end
end
module_7_upvr.prototype._reject = function(arg1, ...) -- Line 1712, Named "_reject"
	--[[ Upvalues[2]:
		[1]: module_7_upvr (readonly)
		[2]: pack_upvr (readonly)
	]]
	if arg1._status ~= module_7_upvr.Status.Started then
	else
		arg1._status = module_7_upvr.Status.Rejected
		local pack_result1_6, pack_result2_3 = pack_upvr(...)
		arg1._valuesLength = pack_result1_6
		arg1._values = pack_result2_3
		if next(arg1._queuedReject) ~= nil then
			pack_result1_6 = false
		else
			pack_result1_6 = true
		end
		if not pack_result1_6 then
			for _, v_22 in ipairs(arg1._queuedReject) do
				coroutine.wrap(v_22)(...)
			end
		else
			local tostring_result1_upvr = tostring(...)
			coroutine.wrap(function() -- Line 1734
				--[[ Upvalues[3]:
					[1]: module_7_upvr (copied, readonly)
					[2]: arg1 (readonly)
					[3]: tostring_result1_upvr (readonly)
				]]
				module_7_upvr._timeEvent:Wait()
				if not arg1._unhandledRejection then
				else
					for _, v_23 in ipairs(module_7_upvr._unhandledRejectionCallbacks) do
						task.spawn(v_23, arg1, unpack(arg1._values, 1, arg1._valuesLength))
					end
					if module_7_upvr.TEST then return end
					warn(string.format("Unhandled Promise rejection:\n\n%s\n\n%s", tostring_result1_upvr, arg1._source))
				end
			end)()
		end
		tostring_result1_upvr = arg1:_finalize
		tostring_result1_upvr()
	end
end
module_7_upvr.prototype._finalize = function(arg1) -- Line 1766, Named "_finalize"
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	for _, v_15 in ipairs(arg1._queuedFinally) do
		coroutine.wrap(v_15)(arg1._status)
	end
	arg1._queuedFinally = nil
	arg1._queuedReject = nil
	arg1._queuedResolve = nil
	if not module_7_upvr.TEST then
		arg1._parent = nil
		arg1._consumers = nil
	end
	task.defer(coroutine.close, arg1._thread)
end
module_7_upvr.prototype.now = function(arg1, arg2) -- Line 1803, Named "now"
	--[[ Upvalues[2]:
		[1]: module_7_upvr (readonly)
		[2]: var15_upvw (read and write)
	]]
	local call_stack = debug.traceback(nil, 2)
	local var410
	if arg1._status == var410 then
		return arg1:_andThen(call_stack, function(...) -- Line 1806
			return ...
		end)
	end
	var410 = module_7_upvr
	local function INLINED_2() -- Internal function, doesn't exist in bytecode
		var410 = var410(tbl_7)
		tbl_7.context = ":now() was called at:\n\n"..call_stack
		tbl_7.error = "This Promise was not resolved in time for :now()"
		tbl_7.kind = var15_upvw.Kind.NotResolvedInTime
		local tbl_7 = {}
		var410 = var15_upvw.new
		return var410
	end
	if arg2 ~= nil or not INLINED_2() then
		var410 = arg2
	end
	return var410.reject(var410)
end
function module_7_upvr.retry(arg1, arg2, ...) -- Line 1848
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 17 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 17 end (CF ANALYSIS FAILED)
end
function module_7_upvr.retryWithDelay(arg1, arg2, arg3, ...) -- Line 1876
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 22 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 22 end (CF ANALYSIS FAILED)
end
function module_7_upvr.fromEvent(arg1, arg2) -- Line 1918
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	local var414_upvw = arg2
	if not var414_upvw then
		function var414_upvw() -- Line 1919
			return true
		end
	end
	return module_7_upvr._new(debug.traceback(nil, 2), function(arg1_22, arg2_8, arg3) -- Line 1923
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var414_upvw (read and write)
		]]
		local var416_upvw
		local var417_upvw = false
		local function disconnect() -- Line 1927
			--[[ Upvalues[1]:
				[1]: var416_upvw (read and write)
			]]
			var416_upvw:Disconnect()
			var416_upvw = nil
		end
		var416_upvw = arg1:Connect(function(...) -- Line 1936
			--[[ Upvalues[4]:
				[1]: var414_upvw (copied, read and write)
				[2]: arg1_22 (readonly)
				[3]: var416_upvw (read and write)
				[4]: var417_upvw (read and write)
			]]
			local var414_upvw_result1 = var414_upvw(...)
			if var414_upvw_result1 == true then
				arg1_22(...)
				if var416_upvw then
					var416_upvw:Disconnect()
					var416_upvw = nil
				else
					var417_upvw = true
				end
			end
			if type(var414_upvw_result1) ~= "boolean" then
				error("Promise.fromEvent predicate should always return a boolean")
			end
		end)
		if var417_upvw then
			if var416_upvw then
				return disconnect()
			end
		end
		arg3(disconnect)
	end)
end
function module_7_upvr.onUnhandledRejection(arg1) -- Line 1970
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	table.insert(module_7_upvr._unhandledRejectionCallbacks, arg1)
	return function() -- Line 1973
		--[[ Upvalues[2]:
			[1]: module_7_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local table_find_result1 = table.find(module_7_upvr._unhandledRejectionCallbacks, arg1)
		if table_find_result1 then
			table.remove(module_7_upvr._unhandledRejectionCallbacks, table_find_result1)
		end
	end
end
return module_7_upvr