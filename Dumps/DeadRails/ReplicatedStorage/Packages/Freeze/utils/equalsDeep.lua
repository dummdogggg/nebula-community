--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.equalsDeep
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:27
-- Luau version 6, Types version 3
-- Time taken: 0.001534 seconds

local function compareDeep_upvr(arg1, arg2) -- Line 4, Named "compareDeep"
	--[[ Upvalues[1]:
		[1]: compareDeep_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var17
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var17 = type(arg2)
		return var17 ~= "table"
	end
	if var17 ~= "table" or INLINED() then
		if arg1 ~= arg2 then
			var17 = false
		else
			var17 = true
		end
		return var17
	end
	var17 = pairs(arg1)
	local pairs_result1_2, pairs_result2_2, pairs_result3 = pairs(arg1)
	for i, v in pairs_result1_2, pairs_result2_2, pairs_result3 do
		if not compareDeep_upvr(arg2[i], v) then
			return false
		end
	end
	pairs_result1_2 = pairs(arg2)
	local pairs_result1, pairs_result2, pairs_result3_2 = pairs(arg2)
	for i_2, v_2 in pairs_result1, pairs_result2, pairs_result3_2 do
		if not compareDeep_upvr(arg1[i_2], v_2) then
			return false
		end
	end
	pairs_result1 = true
	return pairs_result1
end
local equalObjects_upvr = require(script.Parent.equalObjects)
return function(...) -- Line 24, Named "equalsDeep"
	--[[ Upvalues[2]:
		[1]: equalObjects_upvr (readonly)
		[2]: compareDeep_upvr (readonly)
	]]
	if equalObjects_upvr(...) then
		return true
	end
	for i_3 = 2, select('#', ...) do
		if not compareDeep_upvr(select(1, ...), select(i_3, ...)) then
			return false
		end
	end
	return true
end