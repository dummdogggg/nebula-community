--[[
    Script: ReplicatedStorage.Packages.Freeze.List.flatten
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:00
-- Luau version 6, Types version 3
-- Time taken: 0.001175 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
local function flatten_upvr(arg1, arg2) -- Line 27, Named "flatten"
	--[[ Upvalues[2]:
		[1]: flatten_upvr (readonly)
		[2]: maybeFreeze_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local module = {}
	local var15 = 1
	for _, v in arg1 do
		if type(v) == "table" and (not arg2 or 0 < arg2) then
			local var16 = arg2
			if var16 then
				var16 = arg2 - 1
			end
			local flatten_upvr_result1 = flatten_upvr(v, var16)
			for i_2 = 1, #flatten_upvr_result1 do
				module[var15] = flatten_upvr_result1[i_2]
				local var18
			end
		else
			module[var15 + 1] = v
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		end
	end
	return maybeFreeze_upvr(module)
end
return flatten_upvr