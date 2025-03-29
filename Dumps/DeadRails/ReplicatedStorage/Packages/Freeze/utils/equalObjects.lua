--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.equalObjects
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:56
-- Luau version 6, Types version 3
-- Time taken: 0.000408 seconds

return function(...) -- Line 2, Named "equalObjects"
	for i = 2, select('#', ...) do
		if select(1, ...) ~= select(i, ...) then
			return false
		end
	end
	return true
end