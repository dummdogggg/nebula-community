--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.compat.removeKeys
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:14
-- Luau version 6, Types version 3
-- Time taken: 0.000435 seconds

local deprecationWarning_upvr = require(script.Parent.Parent.Parent.utils.deprecationWarning)
local module_upvr = require(script.Parent.Parent:FindFirstChild("remove"))
return function(arg1, ...) -- Line 10, Named "removeKeys"
	--[[ Upvalues[2]:
		[1]: deprecationWarning_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	deprecationWarning_upvr("Dictionary."..script.Name, "Dictionary.remove")
	return module_upvr(arg1, ...)
end