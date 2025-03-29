--[[
    Script: ReplicatedStorage.Packages.Freeze.List.compat.findWhere
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:54
-- Luau version 6, Types version 3
-- Time taken: 0.000553 seconds

local deprecationWarning_upvr = require(script.Parent.Parent.Parent.utils.deprecationWarning)
local find_upvr = require(script.Parent.Parent.find)
return function(arg1, arg2, arg3) -- Line 10, Named "findWhere"
	--[[ Upvalues[2]:
		[1]: deprecationWarning_upvr (readonly)
		[2]: find_upvr (readonly)
	]]
	if arg3 ~= nil then
	else
	end
	assert(true, "[Freeze] findWhere's `from` argument is not supported.")
	deprecationWarning_upvr("List."..script.Name, "List.find")
	return find_upvr(arg1, arg2)
end