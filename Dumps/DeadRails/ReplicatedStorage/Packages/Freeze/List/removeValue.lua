--[[
    Script: ReplicatedStorage.Packages.Freeze.List.removeValue
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:45
-- Luau version 6, Types version 3
-- Time taken: 0.001369 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
local toSet_upvr = require(script.Parent.toSet)
local function removeValues_upvr(arg1, ...) -- Line 5, Named "removeValues"
	--[[ Upvalues[2]:
		[1]: toSet_upvr (readonly)
		[2]: maybeFreeze_upvr (readonly)
	]]
	local var12
	for _, v in ipairs(arg1) do
		if not toSet_upvr({...})[v] then
			({})[1] = v
		end
	end
	if nil then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return maybeFreeze_upvr({})
	end
	return arg1
end
return function(arg1, ...) -- Line 35, Named "removeValue"
	--[[ Upvalues[2]:
		[1]: maybeFreeze_upvr (readonly)
		[2]: removeValues_upvr (readonly)
	]]
	local args_list = {...}
	local var18
	if #args_list == 1 then
		var18 = #arg1
		var18 = false
		for _, v_2 in arg1 do
			if v_2 == args_list[1] then
				var18 = true
			else
				table.insert(table.create(var18), v_2)
			end
		end
		if var18 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			return maybeFreeze_upvr(table.create(var18))
		end
		return arg1
	end
	return removeValues_upvr(arg1, ...)
end