--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.updateIn
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:29
-- Luau version 6, Types version 3
-- Time taken: 0.003326 seconds

local None_upvr = require(script.Parent.Parent.None)
local function _(arg1) -- Line 12, Named "toString"
	return table.concat(arg1, ", ")
end
local isDataStructure_upvr = require(script.Parent.Parent.utils.isDataStructure)
local slice_upvr = require(script.Parent.slice)
local get_upvr = require(script.Parent.get)
local module_upvr = require(script.Parent:FindFirstChild("remove"))
local set_upvr = require(script.Parent.set)
local function updateInDeeply_upvr(arg1, arg2, arg3, arg4, arg5) -- Line 16, Named "updateInDeeply"
	--[[ Upvalues[7]:
		[1]: None_upvr (readonly)
		[2]: isDataStructure_upvr (readonly)
		[3]: slice_upvr (readonly)
		[4]: get_upvr (readonly)
		[5]: updateInDeeply_upvr (readonly)
		[6]: module_upvr (readonly)
		[7]: set_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var12
	if arg1 ~= None_upvr then
		var12 = false
	else
		var12 = true
	end
	if arg3 == #arg2 + 1 then
		if var12 then
			local _ = arg5
		else
		end
		local arg4_result1 = arg4(arg1)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if arg4_result1 == arg1 then
			return arg1
		end
		return arg4_result1
	end
	if not var12 then
		if not isDataStructure_upvr(arg1) then
			error("Cannot update within non-data-structure value in path ["..table.concat(slice_upvr(arg2, 1, arg3 - 1), ", ").."]: "..tostring(arg1))
		end
	end
	if var12 then
		local _ = None_upvr
	else
	end
	local updateInDeeply_upvr_result1_2 = updateInDeeply_upvr(get_upvr(arg1, arg2[arg3], None_upvr), arg2, arg3 + 1, arg4, arg5)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if updateInDeeply_upvr_result1_2 == get_upvr(arg1, arg2[arg3], None_upvr) then
		return arg1
	end
	if updateInDeeply_upvr_result1_2 == None_upvr then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return module_upvr(arg1, arg2[arg3])
	end
	if var12 then
	else
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return set_upvr(arg1, arg2[arg3], updateInDeeply_upvr_result1_2)
end
return function(arg1, arg2, arg3, arg4) -- Line 49
	--[[ Upvalues[2]:
		[1]: updateInDeeply_upvr (readonly)
		[2]: None_upvr (readonly)
	]]
	local updateInDeeply_upvr_result1_3 = updateInDeeply_upvr(arg1, arg2, 1, arg3, arg4)
	if updateInDeeply_upvr_result1_3 == None_upvr then
		return arg4
	end
	return updateInDeeply_upvr_result1_3
end