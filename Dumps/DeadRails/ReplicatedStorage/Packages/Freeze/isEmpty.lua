--[[
    Script: ReplicatedStorage.Packages.Freeze.isEmpty
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:15
-- Luau version 6, Types version 3
-- Time taken: 0.000392 seconds

return function(arg1) -- Line 15
	local var2
	if next(arg1) ~= nil then
		var2 = false
	else
		var2 = true
	end
	return var2
end