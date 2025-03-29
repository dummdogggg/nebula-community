--[[
    Script: ReplicatedStorage.Packages.Freeze.List.insert
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:19
-- Luau version 6, Types version 3
-- Time taken: 0.001086 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, arg2, ...) -- Line 16, Named "insert"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local len = #arg1
	local var11
	if var11 < 1 then
		var11 = len + var11
	end
	var11 = math.clamp(var11, 1, len + 1)
	local module = {}
	local var13
	for i = 1, len + 1 do
		if i == var11 then
			for i_2 = 1, select('#', ...) do
				module[var13] = select(i_2, ...)
				var13 += 1
			end
		end
		module[var13] = arg1[i]
	end
	return maybeFreeze_upvr(module)
end