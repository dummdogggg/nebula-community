--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.ServiceBag
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:56
-- Luau version 6, Types version 3
-- Time taken: 0.004564 seconds

local any_load_result1_upvr = require(script.Parent.loader).load(script)
local var1_result1_upvr_2 = any_load_result1_upvr("BaseObject")
local setmetatable_result1_upvr = setmetatable({}, var1_result1_upvr_2)
setmetatable_result1_upvr.ClassName = "ServiceBag"
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
local var1_result1_upvr = any_load_result1_upvr("Signal")
function setmetatable_result1_upvr.new(arg1) -- Line 53
	--[[ Upvalues[3]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: var1_result1_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(var1_result1_upvr_2.new(), setmetatable_result1_upvr)
	setmetatable_result1._services = {}
	setmetatable_result1._parentProvider = arg1
	setmetatable_result1._serviceTypesToInitializeSet = {}
	setmetatable_result1._initializedServiceTypeSet = {}
	setmetatable_result1._initializing = false
	setmetatable_result1._serviceTypesToStart = {}
	setmetatable_result1._destroying = var1_result1_upvr.new()
	setmetatable_result1._maid:GiveTask(setmetatable_result1._destroying)
	return setmetatable_result1
end
function setmetatable_result1_upvr.isServiceBag(arg1) -- Line 77
	local var6 = false
	if type(arg1) == "table" then
		if arg1.ClassName ~= "ServiceBag" then
			var6 = false
		else
			var6 = true
		end
	end
	return var6
end
function setmetatable_result1_upvr.GetService(arg1, arg2) -- Line 89
	--[[ Upvalues[1]:
		[1]: any_load_result1_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var7
	if typeof(arg2) == "Instance" then
		var7 = any_load_result1_upvr(var7)
	end
	if type(var7) ~= "table" then
	else
	end
	assert(true, "Bad serviceType definition")
	if arg1._services[var7] then
		arg1:_ensureInitialization(var7)
		return arg1._services[var7]
	end
	if arg1._parentProvider then
		return arg1._parentProvider:GetService(var7)
	end
	arg1:_addServiceType(var7)
	arg1:_ensureInitialization(var7)
	return arg1._services[var7]
end
function setmetatable_result1_upvr.HasService(arg1, arg2) -- Line 117
	--[[ Upvalues[1]:
		[1]: any_load_result1_upvr (readonly)
	]]
	local var8
	if typeof(arg2) == "Instance" then
		var8 = any_load_result1_upvr(var8)
	end
	if arg1._services[var8] then
		return true
	end
	return false
end
function setmetatable_result1_upvr.Init(arg1) -- Line 133
	assert(not arg1._initializing, "Already initializing")
	assert(arg1._serviceTypesToInitializeSet, "Already initialized")
	arg1._initializing = true
	while next(arg1._serviceTypesToInitializeSet) do
		local next_result1 = next(arg1._serviceTypesToInitializeSet)
		arg1._serviceTypesToInitializeSet[next_result1] = nil
		arg1:_ensureInitialization(next_result1)
	end
	arg1._serviceTypesToInitializeSet = nil
	arg1._initializing = false
end
function setmetatable_result1_upvr.Start(arg1) -- Line 152
	assert(arg1._serviceTypesToStart, "Already started")
	assert(not arg1._initializing, "Still initializing")
	while next(arg1._serviceTypesToStart) do
		local assert_result1_upvr_2 = assert(arg1._services[table.remove(arg1._serviceTypesToStart)], "No service")
		if assert_result1_upvr_2.Start then
			local var11_upvw
			local function var12() -- Line 162
				--[[ Upvalues[2]:
					[1]: var11_upvw (read and write)
					[2]: assert_result1_upvr_2 (readonly)
				]]
				var11_upvw = coroutine.running()
				assert_result1_upvr_2:Start()
			end
			task.spawn(var12)
			if coroutine.status(var11_upvw) ~= "dead" then
				var12 = false
			else
				var12 = true
			end
			assert(var12, "Starting service yielded")
		end
	end
	arg1._serviceTypesToStart = nil
end
function setmetatable_result1_upvr.IsStarted(arg1) -- Line 178
	local var13
	if arg1._serviceTypesToStart ~= nil then
		var13 = false
	else
		var13 = true
	end
	return var13
end
function setmetatable_result1_upvr.CreateScope(arg1) -- Line 188
	--[[ Upvalues[1]:
		[1]: setmetatable_result1_upvr (readonly)
	]]
	local any_new_result1_upvr = setmetatable_result1_upvr.new(arg1)
	arg1:_addServiceType(any_new_result1_upvr)
	arg1._maid[any_new_result1_upvr] = any_new_result1_upvr._destroying:Connect(function() -- Line 194
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: any_new_result1_upvr (readonly)
		]]
		arg1._maid[any_new_result1_upvr] = nil
		arg1._services[any_new_result1_upvr] = nil
	end)
	return any_new_result1_upvr
end
function setmetatable_result1_upvr._addServiceType(arg1, arg2) -- Line 203
	if not arg1._serviceTypesToInitializeSet then
		error("Already finished initializing, cannot add %q":format(tostring(arg2)))
	else
		if arg1._services[arg2] then return end
		local tbl = {}
		tbl.__index = arg2
		arg1._services[arg2] = setmetatable({}, tbl)
		arg1:_ensureInitialization(arg2)
	end
end
function setmetatable_result1_upvr._ensureInitialization(arg1, arg2) -- Line 221
	if arg1._initializedServiceTypeSet[arg2] then
	else
		if arg1._initializing then
			arg1._serviceTypesToInitializeSet[arg2] = nil
			arg1._initializedServiceTypeSet[arg2] = true
			arg1:_initService(arg2)
			return
		end
		if arg1._serviceTypesToInitializeSet then
			arg1._serviceTypesToInitializeSet[arg2] = true
			return
		end
		error("[ServiceBag._ensureInitialization] - Cannot initialize past initializing phase ")
	end
end
function setmetatable_result1_upvr._initService(arg1, arg2) -- Line 237
	local assert_result1_upvr = assert(arg1._services[arg2], "No service")
	if assert_result1_upvr.Init then
		local var18_upvw
		local function var19() -- Line 242
			--[[ Upvalues[3]:
				[1]: var18_upvw (read and write)
				[2]: assert_result1_upvr (readonly)
				[3]: arg1 (readonly)
			]]
			var18_upvw = coroutine.running()
			assert_result1_upvr:Init(arg1)
		end
		task.spawn(var19)
		if coroutine.status(var18_upvw) ~= "dead" then
			var19 = false
		else
			var19 = true
		end
		assert(var19, "Initializing service yielded")
	end
	table.insert(arg1._serviceTypesToStart, arg2)
end
function setmetatable_result1_upvr.Destroy(arg1) -- Line 257
	--[[ Upvalues[1]:
		[1]: setmetatable_result1_upvr (readonly)
	]]
	arg1._destroying:Fire()
	local _services = arg1._services
	local next_result1_2, next_result2 = next(_services)
	while next_result2 ~= nil do
		_services[next_result1_2] = nil
		if next_result2.Destroy then
			next_result2:Destroy()
		end
		local _, next_result2_2 = next(_services)
	end
	getmetatable(setmetatable_result1_upvr).Destroy(arg1)
end
return setmetatable_result1_upvr