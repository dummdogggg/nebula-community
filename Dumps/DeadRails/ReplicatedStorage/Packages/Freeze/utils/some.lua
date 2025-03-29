--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.some
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:57
-- Luau version 6, Types version 3
-- Time taken: 0.000382 seconds

return function(arg1, arg2) -- Line 3
	for i, v in arg1 do
		if arg2(v, i) == true then
			return true
		end
	end
	return false
end