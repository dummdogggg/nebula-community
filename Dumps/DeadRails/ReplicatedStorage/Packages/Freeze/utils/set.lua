--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.set
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:30
-- Luau version 6, Types version 3
-- Time taken: 0.000347 seconds

return function(arg1, arg2, arg3) -- Line 2
	if arg1[arg2] == arg3 then
		return arg1
	end
	local clone = table.clone(arg1)
	clone[arg2] = arg3
	return clone
end