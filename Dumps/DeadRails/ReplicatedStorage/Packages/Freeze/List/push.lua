--[[
    Script: ReplicatedStorage.Packages.Freeze.List.push
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:08
-- Luau version 6, Types version 3
-- Time taken: 0.000737 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, ...) -- Line 14, Named "push"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if #{...} == 0 then
		return arg1
	end
	for _, v in {...} do
		table.insert(table.clone(arg1), v)
		local var13
	end
	return maybeFreeze_upvr(var13)
end