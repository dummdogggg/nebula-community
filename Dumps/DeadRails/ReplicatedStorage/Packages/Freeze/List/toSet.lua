--[[
    Script: ReplicatedStorage.Packages.Freeze.List.toSet
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:43
-- Luau version 6, Types version 3
-- Time taken: 0.000368 seconds

return function(arg1) -- Line 10
	local module = {}
	for _, v in arg1 do
		module[v] = true
	end
	return module
end