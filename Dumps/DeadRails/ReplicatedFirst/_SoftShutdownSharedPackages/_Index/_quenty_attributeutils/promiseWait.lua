--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.promiseWait
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:07
-- Luau version 6, Types version 3
-- Time taken: 0.000513 seconds

local var2_upvr = require(script.Parent.loader).load(script)("Promise")
return function(arg1) -- Line 11
	--[[ Upvalues[1]:
		[1]: var2_upvr (readonly)
	]]
	return var2_upvr.new(function(arg1_2, arg2) -- Line 12
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		task.delay(arg1, function() -- Line 13
			--[[ Upvalues[1]:
				[1]: arg1_2 (readonly)
			]]
			arg1_2()
		end)
	end)
end