--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.compat.toArray
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:55
-- Luau version 6, Types version 3
-- Time taken: 0.000436 seconds

local deprecationWarning_upvr = require(script.Parent.Parent.Parent.utils.deprecationWarning)
local values_upvr = require(script.Parent.Parent.values)
return function(arg1) -- Line 10, Named "toArray"
	--[[ Upvalues[2]:
		[1]: deprecationWarning_upvr (readonly)
		[2]: values_upvr (readonly)
	]]
	deprecationWarning_upvr("Dictionary."..script.Name, "Dictionary.values")
	return values_upvr(arg1)
end