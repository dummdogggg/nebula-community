--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.get
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:19
-- Luau version 6, Types version 3
-- Time taken: 0.000310 seconds

return function(arg1, arg2, arg3) -- Line 5
	if arg1[arg2] == nil then
		return arg3
	end
	return arg1[arg2]
end