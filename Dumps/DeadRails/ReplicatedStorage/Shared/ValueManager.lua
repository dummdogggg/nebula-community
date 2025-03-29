--[[
    Script: ReplicatedStorage.Shared.ValueManager
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:08
-- Luau version 6, Types version 3
-- Time taken: 0.002587 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local OperationOrder_upvr = require(ReplicatedStorage.Shared.SharedConstants.OperationOrder)
local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
local Signal_upvr = require(ReplicatedStorage.Packages.Signal)
function module_2_upvr.new(arg1, arg2) -- Line 33
	--[[ Upvalues[3]:
		[1]: OperationOrder_upvr (readonly)
		[2]: Signal_upvr (readonly)
		[3]: module_2_upvr (readonly)
	]]
	if arg2 then
		assert(OperationOrder_upvr[arg2], string.format("Invalid operation order: %s", arg2))
	end
	local module = {}
	module._originalBaseValue = arg1
	module._baseValue = arg1
	module._lastValue = arg1
	local var6 = arg2
	if not var6 then
		var6 = OperationOrder_upvr.OffsetThenMultiply
	end
	module._operationOrder = var6
	module._instance = nil
	module._property = nil
	module._multipliers = {}
	module._offsets = {}
	module.changed = Signal_upvr.new()
	setmetatable(module, module_2_upvr)
	return module
end
local Freeze_upvr = require(ReplicatedStorage.Packages.Freeze)
function module_2_upvr.getValue(arg1) -- Line 56
	--[[ Upvalues[2]:
		[1]: Freeze_upvr (readonly)
		[2]: OperationOrder_upvr (readonly)
	]]
	local any_reduce_result1_2 = Freeze_upvr.List.reduce(Freeze_upvr.Dictionary.values(arg1._multipliers), function(arg1_2, arg2) -- Line 60
		return arg1_2 * arg2
	end, 1)
	local any_reduce_result1 = Freeze_upvr.List.reduce(Freeze_upvr.Dictionary.values(arg1._offsets), function(arg1_3, arg2) -- Line 64
		return arg1_3 + arg2
	end, 0)
	local var12
	if arg1._operationOrder == OperationOrder_upvr.OffsetThenMultiply then
		var12 = (arg1._baseValue + any_reduce_result1) * any_reduce_result1_2
		return var12
	end
	if arg1._operationOrder == OperationOrder_upvr.MultiplyThenOffset then
		var12 = arg1._baseValue * any_reduce_result1_2 + any_reduce_result1
	end
	return var12
end
function module_2_upvr.reset(arg1) -- Line 79
	arg1._multipliers = {}
	arg1._offsets = {}
	arg1._baseValue = arg1._originalBaseValue
end
function module_2_upvr.setAttachedInstance(arg1, arg2, arg3) -- Line 85
	arg1._instance = arg2
	arg1._property = arg3
	arg1:_onChanged()
end
function module_2_upvr.detachFromInstance(arg1) -- Line 92
	arg1._instance = nil
	arg1._property = nil
end
function module_2_upvr.getMultiplier(arg1, arg2) -- Line 97
	return arg1._multipliers[arg2]
end
function module_2_upvr.setMultiplier(arg1, arg2, arg3) -- Line 101
	arg1._multipliers[arg2] = arg3
	arg1:_onChanged()
end
function module_2_upvr.removeMultiplier(arg1, arg2) -- Line 106
	arg1._multipliers[arg2] = nil
	arg1:_onChanged()
end
function module_2_upvr.setOffset(arg1, arg2, arg3) -- Line 111
	arg1._offsets[arg2] = arg3
	arg1:_onChanged()
end
function module_2_upvr.removeOffset(arg1, arg2) -- Line 116
	arg1._offsets[arg2] = nil
	arg1:_onChanged()
end
function module_2_upvr.setBaseValue(arg1, arg2) -- Line 121
	arg1._baseValue = arg2
	arg1:_onChanged()
end
function module_2_upvr.setOperationOrder(arg1, arg2) -- Line 126
	--[[ Upvalues[1]:
		[1]: OperationOrder_upvr (readonly)
	]]
	assert(OperationOrder_upvr[arg2], string.format("Invalid operation order: %s", arg2))
	arg1._operationOrder = arg2
	arg1:_onChanged()
end
function module_2_upvr._onChanged(arg1) -- Line 132
	local any_getValue_result1 = arg1:getValue()
	local _instance = arg1._instance
	if _instance then
		_instance[arg1._property] = any_getValue_result1
	end
	if any_getValue_result1 ~= arg1._lastValue then
		arg1._lastValue = any_getValue_result1
		arg1.changed:Fire(any_getValue_result1)
	end
end
function module_2_upvr.destroy(arg1) -- Line 146
	arg1.changed:DisconnectAll()
	arg1:detachFromInstance()
end
return module_2_upvr