--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.reduce
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:05
-- Luau version 6, Types version 3
-- Time taken: 0.000573 seconds

return function(arg1, arg2, arg3, arg4) -- Line 3, Named "reduce"
	local var5
	for i, v in arg1 do
		if arg4 then
			v = arg1[#arg1 + 1 - i]
		end
		var5 = arg2(var5, v, i)
	end
	return var5
end