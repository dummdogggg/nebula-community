--[[
    Script: ReplicatedStorage.Packages.FastCastRedux.Table
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:24
-- Luau version 6, Types version 3
-- Time taken: 0.002015 seconds

local module_2_upvr = {}
function module_2_upvr.contains(arg1, arg2) -- Line 27
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local var3
	if module_2_upvr.indexOf(arg1, arg2) == nil then
		var3 = false
	else
		var3 = true
	end
	return var3
end
function module_2_upvr.indexOf(arg1, arg2) -- Line 32
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local table_find_result1 = table.find(arg1, arg2)
	if table_find_result1 then
		return table_find_result1
	end
	return module_2_upvr.keyOf(arg1, arg2)
end
function module_2_upvr.keyOf(arg1, arg2) -- Line 41
	for i, v in pairs(arg1) do
		if v == arg2 then
			return i
		end
	end
	return nil
end
function module_2_upvr.insertAndGetIndexOf(arg1, arg2) -- Line 51
	arg1[#arg1 + 1] = arg2
	return #arg1
end
function module_2_upvr.skip(arg1, arg2) -- Line 57
	return table.move(arg1, arg2 + 1, #arg1, 1, table.create(#arg1 - arg2))
end
function module_2_upvr.take(arg1, arg2) -- Line 62
	return table.move(arg1, 1, arg2, 1, table.create(arg2))
end
function module_2_upvr.range(arg1, arg2, arg3) -- Line 67
	return table.move(arg1, arg2, arg3, 1, table.create(arg3 - arg2 + 1))
end
function module_2_upvr.skipAndTake(arg1, arg2, arg3) -- Line 72
	return table.move(arg1, arg2 + 1, arg2 + arg3, 1, table.create(arg3))
end
local random_state_upvr = Random.new()
function module_2_upvr.random(arg1) -- Line 77
	--[[ Upvalues[1]:
		[1]: random_state_upvr (readonly)
	]]
	return arg1[random_state_upvr:NextInteger(1, #arg1)]
end
function module_2_upvr.join(arg1, arg2) -- Line 82
	return table.move(arg2, 1, #arg2, #arg1 + 1, table.create(#arg1 + #arg2))
end
function module_2_upvr.removeObject(arg1, arg2) -- Line 89
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local any_indexOf_result1 = module_2_upvr.indexOf(arg1, arg2)
	if any_indexOf_result1 then
		table.remove(arg1, any_indexOf_result1)
	end
end
local module = {}
local table_upvr = table
function module.__index(arg1, arg2) -- Line 97
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: table_upvr (readonly)
	]]
	if module_2_upvr[arg2] ~= nil then
		return module_2_upvr[arg2]
	end
	return table_upvr[arg2]
end
function module.__newindex(arg1, arg2, arg3) -- Line 105
	error("Add new table entries by editing the Module itself.")
end
return setmetatable({}, module)