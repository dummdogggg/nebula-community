--[[
    Script: ReplicatedStorage.Packages.Freeze.List.pop
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:09
-- Luau version 6, Types version 3
-- Time taken: 0.000576 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, arg2) -- Line 20, Named "pop"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	local len = #arg1
	local table_create_result1 = table.create(len)
	for i = 1, len - math.max(1, arg2 or 1) do
		table_create_result1[i] = arg1[i]
	end
	return maybeFreeze_upvr(table_create_result1)
end