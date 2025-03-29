--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.loader.Queue
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:48
-- Luau version 6, Types version 3
-- Time taken: 0.001205 seconds

local module_upvr = {
	ClassName = "Queue";
}
module_upvr.__index = module_upvr
function module_upvr.new() -- Line 16
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return setmetatable({
		_first = 0;
		_last = -1;
	}, module_upvr)
end
function module_upvr.PushLeft(arg1, arg2) -- Line 27
	arg1._first -= 1
	arg1[arg1._first] = arg2
end
function module_upvr.PushRight(arg1, arg2) -- Line 36
	arg1._last += 1
	arg1[arg1._last] = arg2
end
function module_upvr.PopLeft(arg1) -- Line 45
	if arg1._last < arg1._first then
		error("Queue is empty")
	end
	arg1[arg1._first] = nil
	arg1._first += 1
	return arg1[arg1._first]
end
function module_upvr.PopRight(arg1) -- Line 61
	if arg1._last < arg1._first then
		error("Queue is empty")
	end
	arg1[arg1._last] = nil
	arg1._last -= 1
	return arg1[arg1._last]
end
function module_upvr.IsEmpty(arg1) -- Line 77
	local var3
	if arg1._last >= arg1._first then
		var3 = false
	else
		var3 = true
	end
	return var3
end
return module_upvr