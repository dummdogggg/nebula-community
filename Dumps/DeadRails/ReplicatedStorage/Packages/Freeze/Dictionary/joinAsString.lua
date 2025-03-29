--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.joinAsString
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:52
-- Luau version 6, Types version 3
-- Time taken: 0.000565 seconds

return function(arg1, arg2) -- Line 15, Named "joinAsString"
	local module = {}
	for i, v in arg1 do
		table.insert(module, string.format("%s=%s", tostring(i), tostring(v)))
	end
	return table.concat(module, arg2 or ',')
end