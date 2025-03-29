--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateSimpleTable
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:09
-- Luau version 6, Types version 3
-- Time taken: 0.000511 seconds

return function(arg1, arg2, arg3) -- Line 1, Named "validateSimpleTable"
	if typeof(arg1) ~= "table" then
		return false
	end
	for i, v in arg1 do
		if typeof(i) ~= arg2 then
			return false
		end
		if not arg3(v) then
			return false
		end
	end
	return true
end