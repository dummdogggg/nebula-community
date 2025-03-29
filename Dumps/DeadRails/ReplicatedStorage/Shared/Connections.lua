--[[
    Script: ReplicatedStorage.Shared.Connections
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:39
-- Luau version 6, Types version 3
-- Time taken: 0.000989 seconds

local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.new() -- Line 25
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local module = {
		_connections = {};
	}
	setmetatable(module, module_2_upvr)
	return module
end
function module_2_upvr.add(arg1, ...) -- Line 34
	for _, v in {...} do
		assert(not table.find(arg1._connections, v), "This connection has already been added")
		table.insert(arg1._connections, v)
	end
end
function module_2_upvr.remove(arg1, arg2) -- Line 41
	local table_find_result1 = table.find(arg1._connections, arg2)
	if table_find_result1 then
		table.remove(arg1._connections, table_find_result1)
	end
end
function module_2_upvr.disconnect(arg1) -- Line 48
	for _, v_2 in arg1._connections do
		v_2:Disconnect()
	end
	arg1._connections = {}
end
return module_2_upvr