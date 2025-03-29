--[[
    Script: ReplicatedStorage.Packages.LemonSignal
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:26
-- Luau version 6, Types version 3
-- Time taken: 0.006910 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local tbl_5_upvr = {}
local function runCallback_upvr(arg1, arg2, ...) -- Line 25, Named "runCallback"
	--[[ Upvalues[1]:
		[1]: tbl_5_upvr (readonly)
	]]
	arg1(...)
	table.insert(tbl_5_upvr, arg2)
end
local function yielder_upvr() -- Line 30, Named "yielder"
	--[[ Upvalues[1]:
		[1]: runCallback_upvr (readonly)
	]]
	while true do
		runCallback_upvr(coroutine.yield())
	end
end
local tbl_3_upvr = {}
tbl_3_upvr.__index = tbl_3_upvr
function tbl_3_upvr.Disconnect(arg1) -- Line 39, Named "disconnect"
	if not arg1.Connected then
	else
		arg1.Connected = false
		local _next = arg1._next
		local _prev = arg1._prev
		if _next then
			_next._prev = _prev
		end
		if _prev then
			_prev._next = _next
		end
		local _signal_3 = arg1._signal
		if _signal_3._head == arg1 then
			_signal_3._head = _next
		end
	end
end
function tbl_3_upvr.Reconnect(arg1) -- Line 61, Named "reconnect"
	if arg1.Connected then
	else
		arg1.Connected = true
		local _signal_7 = arg1._signal
		local _head_5 = _signal_7._head
		if _head_5 then
			_head_5._prev = arg1
		end
		_signal_7._head = arg1
		arg1._next = _head_5
		arg1._prev = false
	end
end
local tbl_4_upvr = {}
tbl_4_upvr.__index = tbl_4_upvr
local var9_upvw
local var10_upvw
local var42_upvr
if task then
	local BindableEvent = Instance.new("BindableEvent")
	var9_upvw = BindableEvent.Event.Connect
	function var42_upvr() -- Line 90
	end
	var10_upvw = BindableEvent.Event:Connect(var42_upvr).Disconnect
	BindableEvent:Destroy()
end
local function connect_upvr(arg1, arg2, ...) -- Line 95, Named "connect"
	--[[ Upvalues[1]:
		[1]: tbl_3_upvr (readonly)
	]]
	local _head_3 = arg1._head
	local tbl_2 = {}
	local var16 = true
	tbl_2.Connected = var16
	tbl_2._signal = arg1
	tbl_2._fn = arg2
	if not ... then
		var16 = false
	else
		var16 = {}
		var16[1] = ...
	end
	tbl_2._varargs = var16
	tbl_2._next = _head_3
	tbl_2._prev = false
	local setmetatable_result1 = setmetatable(tbl_2, tbl_3_upvr)
	if _head_3 then
		_head_3._prev = setmetatable_result1
	end
	arg1._head = setmetatable_result1
	return setmetatable_result1
end
var42_upvr = task
if var42_upvr then
	local function _(arg1) -- Line 124
		--[[ Upvalues[1]:
			[1]: connect_upvr (readonly)
		]]
		local var26_upvw
		local current_thread_upvr_2 = coroutine.running()
		var26_upvw = connect_upvr(arg1, function(...) -- Line 127
			--[[ Upvalues[2]:
				[1]: var26_upvw (read and write)
				[2]: current_thread_upvr_2 (readonly)
			]]
			local var28 = var26_upvw
			if not var28.Connected then
			else
				var28.Connected = false
				local _next_6 = var28._next
				local _prev_6 = var28._prev
				if _next_6 then
					_next_6._prev = _prev_6
				end
				if _prev_6 then
					_prev_6._next = _next_6
				end
				local _signal = var28._signal
				if _signal._head == var28 then
					_signal._head = _next_6
				end
			end
			task.spawn(current_thread_upvr_2, ...)
		end)
		return coroutine.yield()
	end
else
end
if task then
	function var42_upvr(arg1, ...) -- Line 147
		--[[ Upvalues[2]:
			[1]: tbl_5_upvr (readonly)
			[2]: yielder_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local _head_4 = arg1._head
		local var56
		while _head_4 do
			var56 = nil
			if 0 < #tbl_5_upvr then
				var56 = tbl_5_upvr[#tbl_5_upvr]
				tbl_5_upvr[#tbl_5_upvr] = nil
			else
				var56 = coroutine.create(yielder_upvr)
				coroutine.resume(var56)
			end
			local var57
			if not _head_4._varargs then
				var57 = _head_4._fn
				task.spawn(var56, var57, var56, ...)
			else
				local _varargs = _head_4._varargs
				local len = #_varargs
				var57 = len
				for _, v in {...} do
					var57 += 1
					_varargs[var57] = v
				end
				task.spawn(var56, _head_4._fn, var56, table.unpack(_varargs))
				for i_2 = var57, len + 1, -1 do
					_varargs[i_2] = nil
					local _
				end
			end
		end
	end
else
	var42_upvr = function(arg1, ...) -- Line 180
		--[[ Upvalues[2]:
			[1]: tbl_5_upvr (readonly)
			[2]: yielder_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local _head_6 = arg1._head
		local var76
		while true do
			if not _head_6 then break end
			var76 = nil
			if 0 < #tbl_5_upvr then
				var76 = tbl_5_upvr[#tbl_5_upvr]
				tbl_5_upvr[#tbl_5_upvr] = nil
			else
				var76 = coroutine.create(yielder_upvr)
				coroutine.resume(var76)
			end
			local var77
			if not _head_6._varargs then
				var77 = _head_6._fn
				local coroutine_resume_result1_3, coroutine_resume_result2 = coroutine.resume(var76, var77, var76, ...)
				if not coroutine_resume_result1_3 then
					var77 = print
					var77(string.format("%s\nstacktrace:\n%s", coroutine_resume_result2, debug.traceback()))
					-- KONSTANTWARNING: GOTO [100] #81
				end
			else
				local _varargs_2 = _head_6._varargs
				local len_2 = #_varargs_2
				var77 = len_2
				local tbl = {}
				tbl[1] = ...
				for _, var73 in tbl do
					var77 += 1
					_varargs_2[var77] = var73
				end
				local coroutine_resume_result1_2, coroutine_resume_result2_2 = coroutine.resume(var76, _head_6._fn, var76, table.unpack(_varargs_2))
				if not coroutine_resume_result1_2 then
					print(string.format("%s\nstacktrace:\n%s", coroutine_resume_result2_2, debug.traceback()))
				end
				for var74 = var77, len_2 + 1, -1 do
					_varargs_2[var74] = nil
					local _
				end
			end
		end
	end
end
function tbl_4_upvr.new() -- Line 238
	--[[ Upvalues[1]:
		[1]: tbl_4_upvr (readonly)
	]]
	return setmetatable({
		_head = false;
	}, tbl_4_upvr)
end
function tbl_4_upvr.wrap(arg1) -- Line 242
	--[[ Upvalues[3]:
		[1]: tbl_4_upvr (readonly)
		[2]: var9_upvw (read and write)
		[3]: var42_upvr (readonly)
	]]
	local setmetatable_result1_upvr = setmetatable({
		_head = false;
	}, tbl_4_upvr)
	setmetatable_result1_upvr.RBXScriptConnection = var9_upvw(arg1, function(...) -- Line 244
		--[[ Upvalues[2]:
			[1]: var42_upvr (copied, readonly)
			[2]: setmetatable_result1_upvr (readonly)
		]]
		var42_upvr(setmetatable_result1_upvr, ...)
	end)
	return setmetatable_result1_upvr
end
tbl_4_upvr.Connect = connect_upvr
function tbl_4_upvr.Once(arg1, arg2, ...) -- Line 114, Named "once"
	--[[ Upvalues[1]:
		[1]: connect_upvr (readonly)
	]]
	local var19_upvw
	var19_upvw = connect_upvr(arg1, function(...) -- Line 116
		--[[ Upvalues[2]:
			[1]: var19_upvw (read and write)
			[2]: arg2 (readonly)
		]]
		local var20 = var19_upvw
		if not var20.Connected then
		else
			var20.Connected = false
			local _next_2 = var20._next
			local _prev_2 = var20._prev
			if _next_2 then
				_next_2._prev = _prev_2
			end
			if _prev_2 then
				_prev_2._next = _next_2
			end
			local _signal_2 = var20._signal
			if _signal_2._head == var20 then
				_signal_2._head = _next_2
			end
		end
		arg2(...)
	end, ...)
	return var19_upvw
end
function tbl_4_upvr.Wait(arg1) -- Line 133
	--[[ Upvalues[1]:
		[1]: connect_upvr (readonly)
	]]
	local var34_upvw
	local current_thread_upvr = coroutine.running()
	var34_upvw = connect_upvr(arg1, function(...) -- Line 136
		--[[ Upvalues[2]:
			[1]: var34_upvw (read and write)
			[2]: current_thread_upvr (readonly)
		]]
		local var36 = var34_upvw
		if not var36.Connected then
		else
			var36.Connected = false
			local _next_5 = var36._next
			local _prev_5 = var36._prev
			if _next_5 then
				_next_5._prev = _prev_5
			end
			if _prev_5 then
				_prev_5._next = _next_5
			end
			local _signal_6 = var36._signal
			if _signal_6._head == var36 then
				_signal_6._head = _next_5
			end
		end
		local coroutine_resume_result1, coroutine_resume_result2_3 = coroutine.resume(current_thread_upvr, ...)
		if not coroutine_resume_result1 then
			error(coroutine_resume_result2_3, 0)
		end
	end)
	return coroutine.yield()
end
tbl_4_upvr.Fire = var42_upvr
function tbl_4_upvr.DisconnectAll(arg1) -- Line 220, Named "disconnectAll"
	local _head = arg1._head
	while _head do
		local var87 = _head
		if not var87.Connected then
		else
			var87.Connected = false
			local _next_4 = var87._next
			local _prev_3 = var87._prev
			if _next_4 then
				_next_4._prev = _prev_3
			end
			if _prev_3 then
				_prev_3._next = _next_4
			end
			local _signal_4 = var87._signal
			if _signal_4._head == var87 then
				_signal_4._head = _next_4
			end
		end
	end
end
function tbl_4_upvr.Destroy(arg1) -- Line 228, Named "destroy"
	--[[ Upvalues[1]:
		[1]: var10_upvw (read and write)
	]]
	local _head_2 = arg1._head
	while _head_2 do
		local var92 = _head_2
		if not var92.Connected then
		else
			var92.Connected = false
			local _next_3 = var92._next
			local _prev_4 = var92._prev
			if _next_3 then
				_next_3._prev = _prev_4
			end
			if _prev_4 then
				_prev_4._next = _next_3
			end
			local _signal_5 = var92._signal
			if _signal_5._head == var92 then
				_signal_5._head = _next_3
			end
		end
	end
	local RBXScriptConnection = arg1.RBXScriptConnection
	if RBXScriptConnection then
		var10_upvw(RBXScriptConnection)
		arg1.RBXScriptConnection = nil
	end
end
return {
	new = tbl_4_upvr.new;
	wrap = tbl_4_upvr.wrap;
}