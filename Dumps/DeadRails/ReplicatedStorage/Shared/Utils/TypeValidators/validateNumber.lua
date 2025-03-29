--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateNumber
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:08
-- Luau version 6, Types version 3
-- Time taken: 0.000386 seconds

return function(arg1) -- Line 1, Named "validateNumber"
	if typeof(arg1) ~= "number" then
		return false
	end
	if arg1 ~= arg1 then
		return false
	end
	return true
end