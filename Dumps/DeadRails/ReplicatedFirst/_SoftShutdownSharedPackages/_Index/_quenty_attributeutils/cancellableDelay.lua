--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.cancellableDelay
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:45
-- Luau version 6, Types version 3
-- Time taken: 0.000963 seconds

return function(arg1, arg2, ...) -- Line 14, Named "cancellableDelay"
	local var1_upvw
	if type(arg1) ~= "number" then
		var1_upvw = false
	else
		var1_upvw = true
	end
	assert(var1_upvw, "Bad timeoutInSeconds")
	if type(arg2) ~= "function" then
		var1_upvw = false
	else
		var1_upvw = true
	end
	assert(var1_upvw, "Bad func")
	var1_upvw = ...
	local packed_upvw = table.pack(var1_upvw)
	var1_upvw = nil
	task.spawn(function() -- Line 21
		--[[ Upvalues[4]:
			[1]: var1_upvw (read and write)
			[2]: arg1 (readonly)
			[3]: packed_upvw (read and write)
			[4]: arg2 (readonly)
		]]
		var1_upvw = coroutine.running()
		task.wait(arg1)
		local var4 = packed_upvw
		var1_upvw = nil
		packed_upvw = nil
		arg2(table.unpack(var4, 1, var4.n))
	end)
	return function() -- Line 30
		--[[ Upvalues[2]:
			[1]: var1_upvw (read and write)
			[2]: packed_upvw (read and write)
		]]
		if var1_upvw then
			coroutine.close(var1_upvw)
			var1_upvw = nil
			packed_upvw = nil
		end
	end
end