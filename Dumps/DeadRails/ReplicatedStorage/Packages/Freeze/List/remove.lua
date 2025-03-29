--[[
    Script: ReplicatedStorage.Packages.Freeze.List.remove
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:57
-- Luau version 6, Types version 3
-- Time taken: 0.001478 seconds

local function removeSingle_upvr(arg1, arg2) -- Line 4, Named "removeSingle"
	local len = #arg1
	local var6
	if var6 < 1 then
		var6 += len + 1
	end
	if var6 <= 0 or len < var6 then
		return arg1
	end
	for i, v in arg1 do
		if i ~= var6 then
			table.create(len - 1)[1] = v
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return table.create(len - 1)
end
local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, ...) -- Line 44, Named "remove"
	--[[ Upvalues[2]:
		[1]: removeSingle_upvr (readonly)
		[2]: maybeFreeze_upvr (readonly)
	]]
	local args_list = {...}
	local var18
	if var18 == 1 then
		var18 = removeSingle_upvr(arg1, args_list[1])
		return var18
	end
	var18 = 0
	local len_2 = #arg1
	for _, v_2 in args_list do
		if v_2 < 1 then
			v_2 += len_2 + 1
		end
		if v_2 > 0 and len_2 >= v_2 then
			({})[v_2] = true
			var18 += 1
		end
	end
	if var18 == 0 then
		return arg1
	end
	for i_3, v_3 in arg1 do
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not ({})[i_3] then
			table.create(math.max(1, len_2 - var18))[1] = v_3
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return maybeFreeze_upvr(table.create(math.max(1, len_2 - var18)))
end