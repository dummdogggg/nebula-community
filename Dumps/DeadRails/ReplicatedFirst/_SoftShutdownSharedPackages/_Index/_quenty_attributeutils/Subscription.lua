--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.Subscription
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:22
-- Luau version 6, Types version 3
-- Time taken: 0.002769 seconds

local var1_upvr = require(script.Parent.loader).load(script)("MaidTaskUtils")
local module_upvr = {
	ClassName = "Subscription";
}
module_upvr.__index = module_upvr
local tbl_upvr = {
	PENDING = "pending";
	FAILED = "failed";
	COMPLETE = "complete";
	CANCELLED = "cancelled";
}
function module_upvr.new(arg1, arg2, arg3, arg4) -- Line 43
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local var4 = true
	if type(arg1) ~= "function" then
		if arg1 ~= nil then
			var4 = false
		else
			var4 = true
		end
	end
	assert(var4, "Bad fireCallback")
	var4 = true
	if type(arg2) ~= "function" then
		if arg2 ~= nil then
			var4 = false
		else
			var4 = true
		end
	end
	assert(var4, "Bad failCallback")
	var4 = true
	if type(arg3) ~= "function" then
		if arg3 ~= nil then
			var4 = false
		else
			var4 = true
		end
	end
	assert(var4, "Bad completeCallback")
	var4 = {}
	var4._state = tbl_upvr.PENDING
	var4._source = ""
	var4._fireCallback = arg1
	var4._failCallback = arg2
	var4._completeCallback = arg3
	var4._onSubscribe = arg4
	return setmetatable(var4, module_upvr)
end
function module_upvr.Fire(arg1, ...) -- Line 63
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 8. Error Block 3 start (CF ANALYSIS FAILED)
	arg1._fireCallback(...)
	do
		return
	end
	-- KONSTANTERROR: [11] 8. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [16] 12. Error Block 7 start (CF ANALYSIS FAILED)
	if arg1._state == tbl_upvr.CANCELLED then
		warn("[Subscription.Fire] - We are cancelled, but events are still being pushed")
	end
	-- KONSTANTERROR: [16] 12. Error Block 7 end (CF ANALYSIS FAILED)
end
function module_upvr.Fail(arg1) -- Line 81
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	if arg1._state ~= tbl_upvr.PENDING then
	else
		arg1._state = tbl_upvr.FAILED
		if arg1._failCallback then
			arg1._failCallback()
		end
		arg1:_doCleanup()
	end
end
function module_upvr.GetFireFailComplete(arg1) -- Line 114
	return function(...) -- Line 115
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:Fire(...)
	end, function(...) -- Line 117
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:Fail(...)
	end, function(...) -- Line 119
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:Complete(...)
	end
end
function module_upvr.GetFailComplete(arg1) -- Line 141
	return function(...) -- Line 142
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:Fail(...)
	end, function(...) -- Line 144
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:Complete(...)
	end
end
function module_upvr.Complete(arg1) -- Line 153
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	if arg1._state ~= tbl_upvr.PENDING then
	else
		arg1._state = tbl_upvr.COMPLETE
		if arg1._completeCallback then
			arg1._completeCallback()
		end
		arg1:_doCleanup()
	end
end
function module_upvr.IsPending(arg1) -- Line 170
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local var10
	if arg1._state ~= tbl_upvr.PENDING then
		var10 = false
	else
		var10 = true
	end
	return var10
end
function module_upvr._giveCleanup(arg1, arg2) -- Line 174
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: var1_upvr (readonly)
	]]
	assert(arg2, "Bad task")
	assert(not arg1._cleanupTask, "Already have _cleanupTask")
	if arg1._state ~= tbl_upvr.PENDING then
		var1_upvr.doTask(arg2)
	else
		arg1._cleanupTask = arg2
	end
end
function module_upvr._doCleanup(arg1) -- Line 186
	--[[ Upvalues[1]:
		[1]: var1_upvr (readonly)
	]]
	if arg1._cleanupTask then
		arg1._cleanupTask = nil
		var1_upvr.doTask(arg1._cleanupTask)
	end
end
function module_upvr.Destroy(arg1) -- Line 202
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	if arg1._state == tbl_upvr.PENDING then
		arg1._state = tbl_upvr.CANCELLED
	end
	arg1:_doCleanup()
end
function module_upvr.Disconnect(arg1) -- Line 213
	arg1:Destroy()
end
return module_upvr