--[[
    Script: ReplicatedStorage.Packages.Freeze.List.zip
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:50
-- Luau version 6, Types version 3
-- Time taken: 0.001123 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(...) -- Line 19, Named "zip"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	local module = {}
	local arg_count = select('#', ...)
	local var10
	if arg_count <= var10 then
		return module
	end
	var10 = #select(1, ...)
	for i = 2, arg_count do
		local len = #select(i, ...)
		if len < var10 then
			var10 = len
		end
	end
	for i_2 = 1, var10 do
		module[i_2] = {}
		for i_3 = 1, arg_count do
			module[i_2][i_3] = select(i_3, ...)[i_2]
		end
	end
	return maybeFreeze_upvr(module)
end