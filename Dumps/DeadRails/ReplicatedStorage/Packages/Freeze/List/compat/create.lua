--[[
    Script: ReplicatedStorage.Packages.Freeze.List.compat.create
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:36
-- Luau version 6, Types version 3
-- Time taken: 0.000380 seconds

local deprecationWarning_upvr = require(script.Parent.Parent.Parent.utils.deprecationWarning)
return function(arg1, arg2) -- Line 9, Named "create"
	--[[ Upvalues[1]:
		[1]: deprecationWarning_upvr (readonly)
	]]
	deprecationWarning_upvr("List."..script.Name, "table.create")
	return table.create(arg1, arg2)
end