--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.map
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:20
-- Luau version 6, Types version 3
-- Time taken: 0.000604 seconds

return function(arg1, arg2) -- Line 3
	for i, v in arg1 do
		local arg2_result1, arg2_result2 = arg2(v, i)
		local var8
		if arg2_result2 == nil then
			var8 = i
		else
			var8 = arg2_result2
		end
		if arg2_result1 ~= nil then
			({})[var8] = arg2_result1
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end