--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.promiseChild
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:29
-- Luau version 6, Types version 3
-- Time taken: 0.001531 seconds

local var2_upvr = require(script.Parent.loader).load(script)("Promise")
return function(arg1, arg2, arg3) -- Line 20
	--[[ Upvalues[1]:
		[1]: var2_upvr (readonly)
	]]
	local SOME = arg1:FindFirstChild(arg2)
	if SOME then
		return var2_upvr.resolved(SOME)
	end
	return var2_upvr.spawn(function(arg1_2, arg2_2) -- Line 26
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
			[3]: arg3 (readonly)
		]]
		local SOME_2 = arg1:WaitForChild(arg2, arg3)
		if SOME_2 then
			arg1_2(SOME_2)
		else
			arg2_2("Timed out")
		end
	end)
end