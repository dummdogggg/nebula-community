--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.PromiseRemoteEventMixin
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:36
-- Luau version 6, Types version 3
-- Time taken: 0.000913 seconds

local module = {
	Add = function(arg1, arg2, arg3) -- Line 40, Named "Add"
		local var2
		if type(arg2) ~= "table" then
			var2 = false
		else
			var2 = true
		end
		assert(var2, "Bad class")
		if type(arg3) ~= "string" then
			var2 = false
		else
			var2 = true
		end
		assert(var2, "Bad remoteEventName")
		var2 = not arg2.PromiseRemoteEventMixin
		assert(var2, "Class already has PromiseRemoteEventMixin defined")
		var2 = not arg2._remoteEventName
		assert(var2, "Class already has _remoteEventName defined")
		arg2.PromiseRemoteEvent = arg1.PromiseRemoteEvent
		arg2._remoteEventName = arg3
	end;
}
local var3_upvr = require(script.Parent.loader).load(script)("promiseChild")
function module.PromiseRemoteEvent(arg1) -- Line 54
	--[[ Upvalues[1]:
		[1]: var3_upvr (readonly)
	]]
	return arg1._maid:GivePromise(var3_upvr(arg1._obj, arg1._remoteEventName))
end
return module