--[[
    Script: ReplicatedStorage.Packages.Freeze.List.shift
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:04
-- Luau version 6, Types version 3
-- Time taken: 0.000598 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, arg2) -- Line 17, Named "shift"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	local len = #arg1
	local minimum = math.min(len, arg2 or 1)
	local table_create_result1 = table.create(len - minimum)
	for i = minimum + 1, len do
		table_create_result1[i - minimum] = arg1[i]
	end
	return maybeFreeze_upvr(table_create_result1)
end