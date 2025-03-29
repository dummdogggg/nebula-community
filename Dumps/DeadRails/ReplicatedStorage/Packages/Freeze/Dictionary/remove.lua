--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.remove
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:41
-- Luau version 6, Types version 3
-- Time taken: 0.000665 seconds

local set_upvr = require(script.Parent.Parent.utils.set)
local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, ...) -- Line 18, Named "remove"
	--[[ Upvalues[2]:
		[1]: set_upvr (readonly)
		[2]: maybeFreeze_upvr (readonly)
	]]
	local clone = table.clone(arg1)
	for _, v in {...} do
		clone = set_upvr(clone, v, nil)
	end
	return maybeFreeze_upvr(clone)
end