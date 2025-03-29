--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.onSteppedFrame
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:07
-- Luau version 6, Types version 3
-- Time taken: 0.000624 seconds

local RunService_upvr = game:GetService("RunService")
return function(arg1) -- Line 15
	--[[ Upvalues[1]:
		[1]: RunService_upvr (readonly)
	]]
	local var3
	if type(arg1) ~= "function" then
		var3 = false
	else
		var3 = true
	end
	assert(var3, "Bad func")
	var3 = RunService_upvr.Stepped
	local var5_upvw
	var3 = var3:Connect(function() -- Line 19
		--[[ Upvalues[2]:
			[1]: var5_upvw (read and write)
			[2]: arg1 (readonly)
		]]
		var5_upvw:Disconnect()
		arg1()
	end)
	var5_upvw = var3
	return var5_upvw
end