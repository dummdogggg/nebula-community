--[[
    Script: ReplicatedStorage.Packages.Freeze.List.compat.findWhereLast
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:19
-- Luau version 6, Types version 3
-- Time taken: 0.000628 seconds

local deprecationWarning_upvr = require(script.Parent.Parent.Parent.utils.deprecationWarning)
local reverse_upvr = require(script.Parent.Parent.reverse)
local find_upvr = require(script.Parent.Parent.find)
return function(arg1, arg2, arg3) -- Line 11, Named "findWhereLast"
	--[[ Upvalues[3]:
		[1]: deprecationWarning_upvr (readonly)
		[2]: reverse_upvr (readonly)
		[3]: find_upvr (readonly)
	]]
	if arg3 ~= nil then
	else
	end
	assert(true, "[Freeze] findWhereLast's `from` argument is not supported.")
	deprecationWarning_upvr("List."..script.Name, "List.reverse and then List.find")
	return find_upvr(reverse_upvr(arg1), arg2)
end