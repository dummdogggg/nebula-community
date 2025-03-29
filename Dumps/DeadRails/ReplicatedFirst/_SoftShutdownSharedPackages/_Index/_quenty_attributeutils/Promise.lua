--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.Promise
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:37
-- Luau version 6, Types version 3
-- Time taken: 0.010723 seconds

local var1_upvw
local module_upvr = {
	ClassName = "Promise";
}
module_upvr.__index = module_upvr
function module_upvr.isPromise(arg1) -- Line 26
	local var3 = false
	if type(arg1) == "table" then
		if arg1.ClassName ~= "Promise" then
			var3 = false
		else
			var3 = true
		end
	end
	return var3
end
function module_upvr.new(arg1) -- Line 41
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({
		_pendingExecuteList = {};
		_unconsumedException = true;
		_source = "";
	}, module_upvr)
	if type(arg1) == "function" then
		arg1(setmetatable_result1:_getResolveReject())
	end
	return setmetatable_result1
end
function module_upvr.spawn(arg1) -- Line 61
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_new_result1_6 = module_upvr.new()
	task.spawn(arg1, any_new_result1_6:_getResolveReject())
	return any_new_result1_6
end
function module_upvr.defer(arg1) -- Line 75
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_new_result1_7 = module_upvr.new()
	task.defer(arg1, any_new_result1_7:_getResolveReject())
	return any_new_result1_7
end
function module_upvr.resolved(...) -- Line 90
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: module_upvr (readonly)
	]]
	local arg_count_3 = select('#', ...)
	if arg_count_3 == 0 then
		return var1_upvw
	end
	if arg_count_3 == 1 then
		if module_upvr.isPromise(...) then
			local var12 = ...
			if not var12._pendingExecuteList then
				return var12
			end
		end
	end
	local any_new_result1 = module_upvr.new()
	any_new_result1:Resolve(...)
	return any_new_result1
end
local var14_upvw
function module_upvr.rejected(...) -- Line 115
	--[[ Upvalues[2]:
		[1]: var14_upvw (read and write)
		[2]: module_upvr (readonly)
	]]
	local arg_count_2 = select('#', ...)
	if arg_count_2 == 0 then
		return var14_upvw
	end
	local any_new_result1_3 = module_upvr.new()
	any_new_result1_3:_reject({...}, arg_count_2)
	return any_new_result1_3
end
function module_upvr.IsPending(arg1) -- Line 132
	local var18
	if arg1._pendingExecuteList == nil then
		var18 = false
	else
		var18 = true
	end
	return var18
end
function module_upvr.IsFulfilled(arg1) -- Line 141
	local var19
	if arg1._fulfilled == nil then
		var19 = false
	else
		var19 = true
	end
	return var19
end
function module_upvr.IsRejected(arg1) -- Line 150
	local var20
	if arg1._rejected == nil then
		var20 = false
	else
		var20 = true
	end
	return var20
end
function module_upvr.Wait(arg1) -- Line 161
	if arg1._fulfilled then
		return unpack(arg1._fulfilled, 1, arg1._valuesLength)
	end
	if arg1._rejected then
		return error(tostring(arg1._rejected[1]), 2)
	end
	local BindableEvent_upvr = Instance.new("BindableEvent")
	arg1:Then(function() -- Line 169
		--[[ Upvalues[1]:
			[1]: BindableEvent_upvr (readonly)
		]]
		BindableEvent_upvr:Fire()
	end, function() -- Line 171
		--[[ Upvalues[1]:
			[1]: BindableEvent_upvr (readonly)
		]]
		BindableEvent_upvr:Fire()
	end)
	BindableEvent_upvr.Event:Wait()
	BindableEvent_upvr:Destroy()
	if arg1._rejected then
		return error(tostring(arg1._rejected[1]), 2)
	end
	return unpack(arg1._fulfilled, 1, arg1._valuesLength)
end
function module_upvr.Yield(arg1) -- Line 194
	if arg1._fulfilled then
		return true, unpack(arg1._fulfilled, 1, arg1._valuesLength)
	end
	if arg1._rejected then
		return false, unpack(arg1._rejected, 1, arg1._valuesLength)
	end
	local BindableEvent_upvr_2 = Instance.new("BindableEvent")
	arg1:Then(function() -- Line 202
		--[[ Upvalues[1]:
			[1]: BindableEvent_upvr_2 (readonly)
		]]
		BindableEvent_upvr_2:Fire()
	end, function() -- Line 204
		--[[ Upvalues[1]:
			[1]: BindableEvent_upvr_2 (readonly)
		]]
		BindableEvent_upvr_2:Fire()
	end)
	BindableEvent_upvr_2.Event:Wait()
	BindableEvent_upvr_2:Destroy()
	if arg1._fulfilled then
		return true, unpack(arg1._fulfilled, 1, arg1._valuesLength)
	end
	if arg1._rejected then
		return false, unpack(arg1._rejected, 1, arg1._valuesLength)
	end
end
function module_upvr.Resolve(arg1, ...) -- Line 225
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if not arg1._pendingExecuteList then
	else
		local arg_count = select('#', ...)
		if arg_count == 0 then
			arg1:_fulfill({}, 0)
			return
		end
		if arg1 == ... then
			arg1:Reject("TypeError: Resolved to self")
			return
		end
		if module_upvr.isPromise(...) then
			if 1 < arg_count then
				warn("When resolving a promise, extra arguments are discarded! See:\n\n%s":format(arg1._source))
			end
			local var28 = ...
			if var28._pendingExecuteList then
				var28._unconsumedException = false
				var28._pendingExecuteList[#var28._pendingExecuteList + 1] = {function(...) -- Line 246
					--[[ Upvalues[1]:
						[1]: arg1 (readonly)
					]]
					arg1:Resolve(...)
				end, function(...) -- Line 249
					--[[ Upvalues[1]:
						[1]: arg1 (readonly)
					]]
					if arg1._pendingExecuteList then
						arg1:_reject({...}, select('#', ...))
					end
				end, nil}
			else
				if var28._rejected then
					var28._unconsumedException = false
					arg1:_reject(var28._rejected, var28._valuesLength)
					return
				end
				if var28._fulfilled then
					arg1:_fulfill(var28._fulfilled, var28._valuesLength)
					return
				end
				error("[Promise.Resolve] - Bad promise2 state")
			end
		end
		if type(...) == "function" then
			if 1 < arg_count then
				warn("When resolving a function, extra arguments are discarded! See:\n\n%s":format(arg1._source))
			end
			{...}(arg1:_getResolveReject())
			return
		end
		arg1:_fulfill({...}, arg_count)
	end
end
function module_upvr._fulfill(arg1, arg2, arg3) -- Line 288
	if not arg1._pendingExecuteList then
	else
		arg1._fulfilled = arg2
		arg1._valuesLength = arg3
		arg1._pendingExecuteList = nil
		for _, v in pairs(arg1._pendingExecuteList) do
			arg1:_executeThen(unpack(v))
		end
	end
end
function module_upvr.Reject(arg1, ...) -- Line 307
	arg1:_reject({...}, select('#', ...))
end
local RunService_upvr = game:GetService("RunService")
function module_upvr._reject(arg1, arg2, arg3) -- Line 311
	--[[ Upvalues[1]:
		[1]: RunService_upvr (readonly)
	]]
	if not arg1._pendingExecuteList then
	else
		arg1._rejected = arg2
		arg1._valuesLength = arg3
		arg1._pendingExecuteList = nil
		for _, v_2 in pairs(arg1._pendingExecuteList) do
			arg1:_executeThen(unpack(v_2))
		end
		if arg1._unconsumedException and 0 < arg1._valuesLength then
			coroutine.resume(coroutine.create(function() -- Line 327
				--[[ Upvalues[2]:
					[1]: RunService_upvr (copied, readonly)
					[2]: arg1 (readonly)
				]]
				RunService_upvr.Heartbeat:Wait()
				if arg1._unconsumedException then
					warn("[Promise] - Uncaught exception in promise: %q":format(tostring(arg1._rejected[1])))
				end
			end))
		end
	end
end
function module_upvr.Then(arg1, arg2, arg3) -- Line 365
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if type(arg3) == "function" then
		arg1._unconsumedException = false
	end
	if arg1._pendingExecuteList then
		local any_new_result1_2 = module_upvr.new()
		local tbl = {}
		tbl[1] = arg2
		tbl[2] = arg3
		tbl[3] = any_new_result1_2
		arg1._pendingExecuteList[#arg1._pendingExecuteList + 1] = tbl
		return any_new_result1_2
	end
	return arg1:_executeThen(arg2, arg3, nil)
end
function module_upvr.Tap(arg1, arg2, arg3) -- Line 389
	local any_Then_result1 = arg1:Then(arg2, arg3)
	if any_Then_result1 == arg1 then
		return any_Then_result1
	end
	if any_Then_result1._fulfilled then
		return arg1
	end
	if any_Then_result1._rejected then
		return arg1
	end
	if any_Then_result1._pendingExecuteList then
		local function returnSelf() -- Line 405
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			return arg1
		end
		return any_Then_result1:Then(returnSelf, returnSelf)
	end
	error("Bad result state")
end
function module_upvr.Finally(arg1, arg2) -- Line 421
	return arg1:Then(arg2, arg2)
end
function module_upvr.Catch(arg1, arg2) -- Line 431
	return arg1:Then(nil, arg2)
end
function module_upvr.Destroy(arg1) -- Line 438
	arg1:_reject({}, 0)
end
function module_upvr.GetResults(arg1) -- Line 452
	if arg1._rejected then
		return false, unpack(arg1._rejected, 1, arg1._valuesLength)
	end
	if arg1._fulfilled then
		return true, unpack(arg1._fulfilled, 1, arg1._valuesLength)
	end
	error("Still pending")
end
function module_upvr._getResolveReject(arg1) -- Line 462
	return function(...) -- Line 463
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:Resolve(...)
	end, function(...) -- Line 465
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:_reject({...}, select('#', ...))
	end
end
function module_upvr._executeThen(arg1, arg2, arg3, arg4) -- Line 478
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: module_upvr (readonly)
	]]
	if arg1._fulfilled then
		if type(arg2) == "function" then
			if arg4 then
				arg4:Resolve(arg2(unpack(arg1._fulfilled, 1, arg1._valuesLength)))
				return arg4
			end
			local packed_2 = table.pack(arg2(unpack(arg1._fulfilled, 1, arg1._valuesLength)))
			if packed_2.n == 0 then
				return var1_upvw
			end
			if packed_2.n == 1 and module_upvr.isPromise(packed_2[1]) then
				return packed_2[1]
			end
			local any_new_result1_4 = module_upvr.new()
			any_new_result1_4:Resolve(table.unpack(packed_2, 1, packed_2.n))
			return any_new_result1_4
		end
		if arg4 then
			arg4:_fulfill(arg1._fulfilled, arg1._valuesLength)
			return arg4
		end
		return arg1
	end
	if arg1._rejected then
		if type(arg3) == "function" then
			if arg4 then
				arg4:Resolve(arg3(unpack(arg1._rejected, 1, arg1._valuesLength)))
				return arg4
			end
			local packed = table.pack(arg3(unpack(arg1._rejected, 1, arg1._valuesLength)))
			if packed.n == 0 then
				return var1_upvw
			end
			if packed.n == 1 and module_upvr.isPromise(packed[1]) then
				return packed[1]
			end
			local any_new_result1_5 = module_upvr.new()
			any_new_result1_5:Resolve(table.unpack(packed, 1, packed.n))
			return any_new_result1_5
		end
		if arg4 then
			arg4:_reject(arg1._rejected, arg1._valuesLength)
			return arg4
		end
		return arg1
	end
	error("Internal error: still pending")
end
var1_upvw = module_upvr.new()
var1_upvw:_fulfill({}, 0)
var14_upvw = module_upvr.new()
var14_upvw:_reject({}, 0)
return module_upvr