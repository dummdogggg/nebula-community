--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.forEach
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:22
-- Luau version 6, Types version 3
-- Time taken: 0.000457 seconds

return function(arg1, arg2) -- Line 3
	local var6
	for i, v in arg1 do
		var6 += 1
		if arg2(v, i) == false then break end
	end
	return var6
end