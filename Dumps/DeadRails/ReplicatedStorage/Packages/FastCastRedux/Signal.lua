--[[
    Script: ReplicatedStorage.Packages.FastCastRedux.Signal
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:26
-- Luau version 6, Types version 3
-- Time taken: 0.004449 seconds

local Table_upvr = require(script.Parent.Table)
local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
module_2_upvr.__type = "Signal"
local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
tbl_upvr.__type = "SignalConnection"
function module_2_upvr.new(arg1) -- Line 44
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local module = {}
	module.Name = arg1
	module.Connections = {}
	module.YieldingThreads = {}
	return setmetatable(module, module_2_upvr)
end
local function _(arg1, arg2) -- Line 53, Named "NewConnection"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local module_3 = {}
	module_3.Signal = arg1
	module_3.Delegate = arg2
	module_3.Index = -1
	return setmetatable(module_3, tbl_upvr)
end
local TestService_upvr = game:GetService("TestService")
local function ThreadAndReportError_upvr(arg1, arg2, arg3) -- Line 62, Named "ThreadAndReportError"
	--[[ Upvalues[1]:
		[1]: TestService_upvr (readonly)
	]]
	local coroutine_create_result1 = coroutine.create(function() -- Line 63
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		arg1(unpack(arg2))
	end)
	local coroutine_resume_result1, coroutine_resume_result2 = coroutine.resume(coroutine_create_result1)
	if not coroutine_resume_result1 then
		TestService_upvr:Error(string.format("Exception thrown in your %s event handler: %s", arg3, coroutine_resume_result2))
		TestService_upvr:Checkpoint(debug.traceback(coroutine_create_result1))
	end
end
function module_2_upvr.Connect(arg1, arg2) -- Line 75
	--[[ Upvalues[3]:
		[1]: module_2_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: Table_upvr (readonly)
	]]
	local var11
	if getmetatable(arg1) ~= module_2_upvr then
		var11 = false
	else
		var11 = true
	end
	assert(var11, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("Connect", "Signal.new()"))
	var11 = {}
	var11.Signal = arg1
	var11.Delegate = arg2
	var11.Index = -1
	local setmetatable_result1 = setmetatable(var11, tbl_upvr)
	var11 = #arg1.Connections + 1
	setmetatable_result1.Index = var11
	var11 = Table_upvr.insert
	var11(arg1.Connections, setmetatable_result1.Index, setmetatable_result1)
	return setmetatable_result1
end
function module_2_upvr.Fire(arg1, ...) -- Line 83
	--[[ Upvalues[3]:
		[1]: module_2_upvr (readonly)
		[2]: Table_upvr (readonly)
		[3]: ThreadAndReportError_upvr (readonly)
	]]
	local var17
	if getmetatable(arg1) ~= module_2_upvr then
		var17 = false
	else
		var17 = true
	end
	assert(var17, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("Fire", "Signal.new()"))
	var17 = Table_upvr
	var17 = ...
	var17 = arg1.Connections
	local YieldingThreads_2 = arg1.YieldingThreads
	for i = 1, #var17 do
		local var19 = var17[i]
		if var19.Delegate ~= nil then
			ThreadAndReportError_upvr(var19.Delegate, var17.pack(var17), var19.Signal.Name)
		end
	end
	for i_2 = 1, #YieldingThreads_2 do
		local var20 = YieldingThreads_2[i_2]
		if var20 ~= nil then
			coroutine.resume(var20, ...)
		end
	end
end
function module_2_upvr.FireSync(arg1, ...) -- Line 103
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: Table_upvr (readonly)
	]]
	local var25
	if getmetatable(arg1) ~= module_2_upvr then
		var25 = false
	else
		var25 = true
	end
	assert(var25, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("FireSync", "Signal.new()"))
	var25 = Table_upvr
	var25 = ...
	var25 = arg1.Connections
	local YieldingThreads = arg1.YieldingThreads
	for i_3 = 1, #var25 do
		local var27 = var25[i_3]
		if var27.Delegate ~= nil then
			var27.Delegate(unpack(var25.pack(var25)))
		end
	end
	for i_4 = 1, #YieldingThreads do
		local var28 = YieldingThreads[i_4]
		if var28 ~= nil then
			coroutine.resume(var28, ...)
		end
	end
end
function module_2_upvr.Wait(arg1) -- Line 123
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: Table_upvr (readonly)
	]]
	local var29
	if getmetatable(arg1) ~= module_2_upvr then
		var29 = false
	else
		var29 = true
	end
	assert(var29, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("Wait", "Signal.new()"))
	var29 = coroutine.running()
	Table_upvr.insert(arg1.YieldingThreads, var29)
	Table_upvr.removeObject(arg1.YieldingThreads, var29)
	return unpack({coroutine.yield()})
end
function module_2_upvr.Dispose(arg1) -- Line 133
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var35
	if getmetatable(arg1) ~= module_2_upvr then
		var35 = false
	else
		var35 = true
	end
	assert(var35, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("Dispose", "Signal.new()"))
	local Connections = arg1.Connections
	var35 = #Connections
	for i_5 = 1, var35 do
		Connections[i_5]:Disconnect()
		local _
	end
	var35 = {}
	arg1.Connections = var35
	var35 = setmetatable
	var35(arg1, nil)
end
function tbl_upvr.Disconnect(arg1) -- Line 143
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: Table_upvr (readonly)
	]]
	local var38
	if getmetatable(arg1) ~= tbl_upvr then
		var38 = false
	else
		var38 = true
	end
	assert(var38, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("Disconnect", "private function NewConnection()"))
	var38 = Table_upvr
	var38 = arg1.Signal.Connections
	var38.remove(var38, arg1.Index)
	arg1.SignalStatic = nil
	arg1.Delegate = nil
	arg1.YieldingThreads = {}
	arg1.Index = -1
	var38 = arg1
	setmetatable(var38, nil)
end
return module_2_upvr