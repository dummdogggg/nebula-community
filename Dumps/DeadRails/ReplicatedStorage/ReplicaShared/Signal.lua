--[[
    Script: ReplicatedStorage.ReplicaShared.Signal
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:18
-- Luau version 6, Types version 3
-- Time taken: 0.002866 seconds

local var1_upvw
local function AcquireRunnerThreadAndCallEventHandler_upvr(arg1, ...) -- Line 44, Named "AcquireRunnerThreadAndCallEventHandler"
	--[[ Upvalues[1]:
		[1]: var1_upvw (read and write)
	]]
	var1_upvw = nil
	arg1(...)
	var1_upvw = var1_upvw
end
local function RunEventHandlerInFreeThread_upvr(...) -- Line 52, Named "RunEventHandlerInFreeThread"
	--[[ Upvalues[1]:
		[1]: AcquireRunnerThreadAndCallEventHandler_upvr (readonly)
	]]
	AcquireRunnerThreadAndCallEventHandler_upvr(...)
	while true do
		AcquireRunnerThreadAndCallEventHandler_upvr(coroutine.yield())
	end
end
local tbl_upvr_2 = {}
tbl_upvr_2.__index = tbl_upvr_2
local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
function tbl_upvr_2.Disconnect(arg1) -- Line 80
	local var4
	if arg1.is_connected == false then
	else
		local signal = arg1.signal
		var4 = false
		arg1.is_connected = var4
		var4 = signal.listener_count
		var4 -= 1
		signal.listener_count = var4
		var4 = signal.head
		if var4 == arg1 then
			var4 = arg1.next
			signal.head = var4
			return
		end
		var4 = signal.head
		while var4 ~= nil and var4.next ~= arg1 do
			var4 = var4.next
		end
		if var4 ~= nil then
			var4.next = arg1.next
		end
	end
end
function tbl_upvr.New() -- Line 104
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local module = {
		head = nil;
		listener_count = 0;
	}
	setmetatable(module, tbl_upvr)
	return module
end
function tbl_upvr.Connect(arg1, arg2) -- Line 116
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	if type(arg2) ~= "function" then
		error(`[{script.Name}]: "listener" must be a function; Received {typeof(arg2)}`)
	end
	local module_2 = {}
	module_2.listener = arg2
	module_2.signal = arg1
	module_2.next = arg1.head
	module_2.is_connected = true
	setmetatable(module_2, tbl_upvr_2)
	arg1.head = module_2
	arg1.listener_count += 1
	return module_2
end
function tbl_upvr.GetListenerCount(arg1) -- Line 137
	return arg1.listener_count
end
function tbl_upvr.Fire(arg1, ...) -- Line 141
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: RunEventHandlerInFreeThread_upvr (readonly)
	]]
	local head_2 = arg1.head
	while head_2 ~= nil do
		if head_2.is_connected == true then
			if not var1_upvw then
				var1_upvw = coroutine.create(RunEventHandlerInFreeThread_upvr)
			end
			task.spawn(var1_upvw, head_2.listener, ...)
		end
	end
end
function tbl_upvr.Wait(arg1) -- Line 154
	local var10_upvw
	local current_thread_upvr = coroutine.running()
	var10_upvw = arg1:Connect(function(...) -- Line 157
		--[[ Upvalues[2]:
			[1]: var10_upvw (read and write)
			[2]: current_thread_upvr (readonly)
		]]
		var10_upvw:Disconnect()
		task.spawn(current_thread_upvr, ...)
	end)
	return coroutine.yield()
end
function tbl_upvr.FireUntil(arg1, arg2, ...) -- Line 164
	if type(arg2) ~= "function" then
		error(`[{script.Name}]: "continue_callback" must be a function; Received {typeof(arg2)}`)
	end
	local tbl_upvr_3 = {}
	local head = arg1.head
	while head ~= nil do
		table.insert(tbl_upvr_3, head)
	end
	local packed_upvr = table.pack(...)
	task.spawn(function() -- Line 179
		--[[ Upvalues[3]:
			[1]: tbl_upvr_3 (readonly)
			[2]: packed_upvr (readonly)
			[3]: arg2 (readonly)
		]]
		for _, v in ipairs(tbl_upvr_3) do
			if v.is_connected == true then
				v.listener(table.unpack(packed_upvr))
				if arg2() ~= true then return end
			end
		end
	end)
end
return table.freeze({
	New = tbl_upvr.New;
})