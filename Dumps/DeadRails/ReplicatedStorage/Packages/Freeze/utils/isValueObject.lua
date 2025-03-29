--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.isValueObject
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:59
-- Luau version 6, Types version 3
-- Time taken: 0.000372 seconds

return function(arg1) -- Line 2
	if arg1 and typeof(arg1) == "table" and typeof(arg1.equals) == "function" then
		return true
	end
	return false
end