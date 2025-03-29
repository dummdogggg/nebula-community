--[[
    Script: ReplicatedStorage.Packages.Freeze.List.unshift
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:05
-- Luau version 6, Types version 3
-- Time taken: 0.000565 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, ...) -- Line 14, Named "unshift"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	local clone = table.clone(arg1)
	for i = select('#', ...), 1, -1 do
		table.insert(clone, 1, select(i, ...))
	end
	return maybeFreeze_upvr(clone)
end