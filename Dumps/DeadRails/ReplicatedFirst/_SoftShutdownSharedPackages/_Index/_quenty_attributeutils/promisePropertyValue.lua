--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.promisePropertyValue
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:07
-- Luau version 6, Types version 3
-- Time taken: 0.001101 seconds

local var2_upvr = require(script.Parent.loader).load(script)("Promise")
return function(arg1, arg2) -- Line 12
	--[[ Upvalues[1]:
		[1]: var2_upvr (readonly)
	]]
	local var3_upvr
	if typeof(arg1) ~= "Instance" then
		var3_upvr = false
	else
		var3_upvr = true
	end
	assert(var3_upvr, "Bad instance")
	if type(arg2) ~= "string" then
		var3_upvr = false
	else
		var3_upvr = true
	end
	assert(var3_upvr, "Bad propertyName")
	local var4 = arg1[arg2]
	if var4 then
		var3_upvr = var2_upvr.resolved(var4)
		return var3_upvr
	end
	var3_upvr = var2_upvr.new()
	local var6_upvw
	var3_upvr:Finally(function() -- Line 24
		--[[ Upvalues[1]:
			[1]: var6_upvw (read and write)
		]]
		if var6_upvw then
			var6_upvw:Disconnect()
		end
	end)
	var6_upvw = arg1:GetPropertyChangedSignal(arg2):Connect(function() -- Line 30
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
			[3]: var3_upvr (readonly)
		]]
		if arg1[arg2] then
			var3_upvr:Resolve(arg1[arg2])
		end
	end)
	return var3_upvr
end