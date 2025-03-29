--[[
    Script: ReplicatedStorage.Packages.Freeze.List.compat.removeIndices
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:23
-- Luau version 6, Types version 3
-- Time taken: 0.000517 seconds

local deprecationWarning_upvr = require(script.Parent.Parent.Parent.utils.deprecationWarning)
local module_upvr = require(script.Parent.Parent:FindFirstChild("remove"))
return function(arg1, ...) -- Line 10, Named "removeIndices"
	--[[ Upvalues[2]:
		[1]: deprecationWarning_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	deprecationWarning_upvr("List."..script.Name, "List.remove")
	return module_upvr(arg1, ...)
end