--[[
    Script: ReplicatedStorage.Packages.Signal
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:17
-- Luau version 6, Types version 3
-- Time taken: 0.002200 seconds

local var1_upvw
local function acquireRunnerThreadAndCallEventHandler_upvr(arg1, ...) -- Line 39, Named "acquireRunnerThreadAndCallEventHandler"
	--[[ Upvalues[1]:
		[1]: var1_upvw (read and write)
	]]
	var1_upvw = nil
	arg1(...)
	var1_upvw = var1_upvw
end
local function runEventHandlerInFreeThread_upvr(...) -- Line 50, Named "runEventHandlerInFreeThread"
	--[[ Upvalues[1]:
		[1]: acquireRunnerThreadAndCallEventHandler_upvr (readonly)
	]]
	acquireRunnerThreadAndCallEventHandler_upvr(...)
	while true do
		acquireRunnerThreadAndCallEventHandler_upvr(coroutine.yield())
	end
end
local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
local function new(arg1, arg2) -- Line 71
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local module = {
		_connected = true;
	}
	module._signal = arg1
	module._fn = arg2
	module._next = nil
	setmetatable(module, tbl_upvr)
	return module
end
tbl_upvr.new = new
function tbl_upvr.Disconnect(arg1) -- Line 84
	assert(arg1._connected, "Can't disconnect a connection twice.")
	arg1._connected = false
	local var5
	if var5 then
		var5 = arg1._signal._handlerListHead
		if var5 == arg1 then
			var5 = arg1._signal
			var5._handlerListHead = arg1._next
			return
		end
	end
	var5 = arg1._signal._handlerListHead
	while var5 and var5._next ~= arg1 do
		var5 = var5._next
	end
	if var5 then
		var5._next = arg1._next
	end
end
local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.new() -- Line 116
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	return setmetatable({
		_handlerListHead = nil;
	}, module_2_upvr)
end
function module_2_upvr.Connect(arg1, arg2) -- Line 122
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local any_new_result1 = tbl_upvr.new(arg1, arg2)
	if arg1._handlerListHead then
		any_new_result1._next = arg1._handlerListHead
		arg1._handlerListHead = any_new_result1
		return any_new_result1
	end
	arg1._handlerListHead = any_new_result1
	return any_new_result1
end
function module_2_upvr.DisconnectAll(arg1) -- Line 136
	arg1._handlerListHead = nil
end
function module_2_upvr.Fire(arg1, ...) -- Line 144
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: runEventHandlerInFreeThread_upvr (readonly)
	]]
	local _handlerListHead = arg1._handlerListHead
	while _handlerListHead do
		if _handlerListHead._connected then
			if not var1_upvw then
				var1_upvw = coroutine.create(runEventHandlerInFreeThread_upvr)
			end
			task.spawn(var1_upvw, _handlerListHead._fn, ...)
		end
	end
end
function module_2_upvr.Wait(arg1) -- Line 159
	local var11_upvw
	local current_thread_upvr = coroutine.running()
	var11_upvw = arg1:Connect(function(...) -- Line 162
		--[[ Upvalues[2]:
			[1]: var11_upvw (read and write)
			[2]: current_thread_upvr (readonly)
		]]
		var11_upvw:Disconnect()
		task.spawn(current_thread_upvr, ...)
	end)
	return coroutine.yield()
end
return module_2_upvr