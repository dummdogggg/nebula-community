--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.maybeFreeze
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:10
-- Luau version 6, Types version 3
-- Time taken: 0.000327 seconds

return function(arg1) -- Line 5
	if table.isfrozen(arg1) then
		return arg1
	end
	return table.freeze(arg1)
end