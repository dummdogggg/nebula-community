--[[
    Script: ReplicatedStorage.Packages.Freeze.List.filter
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:56
-- Luau version 6, Types version 3
-- Time taken: 0.000541 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, arg2) -- Line 16, Named "filter"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	for i, v in arg1 do
		if arg2(v, i) then
			table.insert(table.create(#arg1), v)
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return maybeFreeze_upvr(table.create(#arg1))
end