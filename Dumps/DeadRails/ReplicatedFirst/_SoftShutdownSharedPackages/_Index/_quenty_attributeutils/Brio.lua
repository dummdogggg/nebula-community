--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.Brio
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:46
-- Luau version 6, Types version 3
-- Time taken: 0.002083 seconds

local module_upvr = {
	ClassName = "Brio";
}
module_upvr.__index = module_upvr
function module_upvr.isBrio(arg1) -- Line 76
	local var2 = false
	if type(arg1) == "table" then
		if arg1.ClassName ~= "Brio" then
			var2 = false
		else
			var2 = true
		end
	end
	return var2
end
function module_upvr.new(...) -- Line 91
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return setmetatable({
		_values = table.pack(...);
	}, module_upvr)
end
function module_upvr.delayed(arg1, ...) -- Line 105
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_new_result1_upvr = module_upvr.new(...)
	task.delay(arg1, function() -- Line 107
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:Kill()
	end)
	return any_new_result1_upvr
end
function module_upvr.GetDiedSignal(arg1) -- Line 133
	if arg1:IsDead() then
		error("Brio is dead")
	end
	if arg1._diedEvent then
		return arg1._diedEvent.Event
	end
	arg1._diedEvent = Instance.new("BindableEvent")
	return arg1._diedEvent.Event
end
function module_upvr.IsDead(arg1) -- Line 160
	local var6
	if arg1._values ~= nil then
		var6 = false
	else
		var6 = true
	end
	return var6
end
function module_upvr.ErrorIfDead(arg1) -- Line 171
	if not arg1._values then
		error("[Brio.ErrorIfDead] - Brio is dead")
	end
end
local var7_upvr = require(script.Parent.loader).load(script)("Maid")
function module_upvr.ToMaid(arg1) -- Line 196
	--[[ Upvalues[1]:
		[1]: var7_upvr (readonly)
	]]
	local var8
	if arg1._values == nil then
		var8 = false
	else
		var8 = true
	end
	assert(var8, "Brio is dead")
	var8 = var7_upvr
	local any_new_result1_upvr_2 = var8.new()
	var8 = any_new_result1_upvr_2:GiveTask
	var8(arg1:GetDiedSignal():Connect(function() -- Line 201
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr_2 (readonly)
		]]
		any_new_result1_upvr_2:DoCleaning()
	end))
	return any_new_result1_upvr_2
end
function module_upvr.GetValue(arg1) -- Line 226
	assert(arg1._values, "Brio is dead")
	return unpack(arg1._values, 1, arg1._values.n)
end
function module_upvr.GetPackedValues(arg1) -- Line 238
	assert(arg1._values, "Brio is dead")
	return arg1._values
end
function module_upvr.Destroy(arg1) -- Line 259
	if not arg1._values then
	else
		arg1._values = nil
		if arg1._diedEvent then
			arg1._diedEvent:Fire()
			arg1._diedEvent:Destroy()
			arg1._diedEvent = nil
		end
	end
end
module_upvr.Kill = module_upvr.Destroy
module_upvr.DEAD = module_upvr.new()
module_upvr.DEAD:Kill()
return module_upvr