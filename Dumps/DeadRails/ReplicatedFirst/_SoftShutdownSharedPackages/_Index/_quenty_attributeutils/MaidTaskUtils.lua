--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.MaidTaskUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:34
-- Luau version 6, Types version 3
-- Time taken: 0.001594 seconds

local module_upvr = {
	isValidTask = function(arg1) -- Line 25, Named "isValidTask"
		local var2
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var2 = true
			return typeof(arg1) ~= "RBXScriptConnection"
		end
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			var2 = true
			return type(arg1.Destroy) ~= "function"
		end
		if type(arg1) ~= "function" and INLINED() and (type(arg1) ~= "table" or INLINED_2()) then
			if typeof(arg1) ~= "Instance" then
				var2 = false
			else
				var2 = true
			end
		end
		return var2
	end;
	doTask = function(arg1) -- Line 37, Named "doTask"
		if type(arg1) == "function" then
			arg1()
		else
			if typeof(arg1) == "RBXScriptConnection" then
				arg1:Disconnect()
				return
			end
			if type(arg1) == "table" and type(arg1.Destroy) == "function" then
				arg1:Destroy()
				return
			end
			if typeof(arg1) == "Instance" then
				arg1:Destroy()
				return
			end
			error("Bad job")
		end
	end;
}
function module_upvr.delayed(arg1, arg2) -- Line 64
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var3
	if type(arg1) ~= "number" then
		var3 = false
	else
		var3 = true
	end
	assert(var3, "Bad time")
	var3 = module_upvr.isValidTask(arg2)
	assert(var3, "Bad job")
	return function() -- Line 68
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: module_upvr (copied, readonly)
			[3]: arg2 (readonly)
		]]
		task.delay(arg1, function() -- Line 69
			--[[ Upvalues[2]:
				[1]: module_upvr (copied, readonly)
				[2]: arg2 (copied, readonly)
			]]
			module_upvr.doTask(arg2)
		end)
	end
end
return module_upvr