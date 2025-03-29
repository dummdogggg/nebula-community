--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.roblox_testez@0.4.1.testez.LifecycleHooks
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:20
-- Luau version 6, Types version 3
-- Time taken: 0.002329 seconds

local TestEnum_upvr = require(script.Parent.TestEnum)
local module_3_upvr = {}
module_3_upvr.__index = module_3_upvr
function module_3_upvr.new() -- Line 6
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	return setmetatable({
		_stack = {};
	}, module_3_upvr)
end
function module_3_upvr.getBeforeEachHooks(arg1) -- Line 16
	--[[ Upvalues[1]:
		[1]: TestEnum_upvr (readonly)
	]]
	local module_2 = {}
	for _, v in ipairs(arg1._stack) do
		for _, v_2 in ipairs(v[TestEnum_upvr.NodeType.BeforeEach]) do
			table.insert(module_2, v_2)
		end
	end
	return module_2
end
function module_3_upvr.getAfterEachHooks(arg1) -- Line 32
	--[[ Upvalues[1]:
		[1]: TestEnum_upvr (readonly)
	]]
	local module = {}
	for _, v_3 in ipairs(arg1._stack) do
		for _, v_4 in ipairs(v_3[TestEnum_upvr.NodeType.AfterEach]) do
			table.insert(module, 1, v_4)
		end
	end
	return module
end
function module_3_upvr.popHooks(arg1) -- Line 48
	table.remove(arg1._stack, #arg1._stack)
end
function module_3_upvr.pushHooksFrom(arg1, arg2) -- Line 52
	--[[ Upvalues[1]:
		[1]: TestEnum_upvr (readonly)
	]]
	if arg2 == nil then
	else
	end
	assert(true)
	table.insert(arg1._stack, {
		[TestEnum_upvr.NodeType.BeforeAll] = arg1:_getHooksOfType(arg2.children, TestEnum_upvr.NodeType.BeforeAll);
		[TestEnum_upvr.NodeType.AfterAll] = arg1:_getHooksOfType(arg2.children, TestEnum_upvr.NodeType.AfterAll);
		[TestEnum_upvr.NodeType.BeforeEach] = arg1:_getHooksOfType(arg2.children, TestEnum_upvr.NodeType.BeforeEach);
		[TestEnum_upvr.NodeType.AfterEach] = arg1:_getHooksOfType(arg2.children, TestEnum_upvr.NodeType.AfterEach);
	})
end
function module_3_upvr.getBeforeAllHooks(arg1) -- Line 66
	--[[ Upvalues[1]:
		[1]: TestEnum_upvr (readonly)
	]]
	return arg1._stack[#arg1._stack][TestEnum_upvr.NodeType.BeforeAll]
end
function module_3_upvr.getAfterAllHooks(arg1) -- Line 73
	--[[ Upvalues[1]:
		[1]: TestEnum_upvr (readonly)
	]]
	return arg1._stack[#arg1._stack][TestEnum_upvr.NodeType.AfterAll]
end
function module_3_upvr._getHooksOfType(arg1, arg2, arg3) -- Line 77
	for _, v_5 in ipairs(arg2) do
		if v_5.type == arg3 then
			table.insert({}, v_5.callback)
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
return module_3_upvr