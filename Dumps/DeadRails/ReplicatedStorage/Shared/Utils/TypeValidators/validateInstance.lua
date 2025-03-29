--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateInstance
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:07
-- Luau version 6, Types version 3
-- Time taken: 0.000360 seconds

return function(arg1, arg2) -- Line 18, Named "validateInstance"
	if typeof(arg1) ~= "Instance" then
		return false
	end
	return arg1:IsA(arg2)
end