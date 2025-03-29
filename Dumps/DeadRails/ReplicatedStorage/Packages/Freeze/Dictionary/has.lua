--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.has
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:40
-- Luau version 6, Types version 3
-- Time taken: 0.000330 seconds

return function(arg1, arg2) -- Line 13, Named "has"
	local var1
	if arg1[arg2] == nil then
		var1 = false
	else
		var1 = true
	end
	return var1
end