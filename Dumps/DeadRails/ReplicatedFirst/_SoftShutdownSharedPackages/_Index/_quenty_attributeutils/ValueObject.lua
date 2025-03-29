--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.ValueObject
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:24
-- Luau version 6, Types version 3
-- Time taken: 0.002321 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local var1_result1_upvr_2 = any_load_result1("Maid")
local module_2_upvr = {
	ClassName = "ValueObject";
}
local var1_result1_upvr = any_load_result1("Signal")
function module_2_upvr.new(arg1) -- Line 21
	--[[ Upvalues[3]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
		[3]: module_2_upvr (readonly)
	]]
	local module = {}
	rawset(module, "_value", arg1)
	module._maid = var1_result1_upvr_2.new()
	module.Changed = var1_result1_upvr.new()
	module._maid:GiveTask(module.Changed)
	return setmetatable(module, module_2_upvr)
end
function module_2_upvr.fromObservable(arg1) -- Line 44
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local any_new_result1_3_upvr = module_2_upvr.new()
	any_new_result1_3_upvr._maid:GiveTask(arg1:Subscribe(function(arg1_2) -- Line 47
		--[[ Upvalues[1]:
			[1]: any_new_result1_3_upvr (readonly)
		]]
		any_new_result1_3_upvr.Value = arg1_2
	end))
	return any_new_result1_3_upvr
end
function module_2_upvr.isValueObject(arg1) -- Line 59
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local var8 = false
	if type(arg1) == "table" then
		if getmetatable(arg1) ~= module_2_upvr then
			var8 = false
		else
			var8 = true
		end
	end
	return var8
end
local var1_result1_upvr_3 = any_load_result1("Observable")
function module_2_upvr.Observe(arg1) -- Line 67
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr_3 (readonly)
		[2]: var1_result1_upvr_2 (readonly)
	]]
	return var1_result1_upvr_3.new(function(arg1_3) -- Line 68
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var1_result1_upvr_2 (copied, readonly)
		]]
		if not arg1.Destroy then
			warn("[ValueObject.observeValue] - Connecting to dead ValueObject")
			arg1_3:Complete()
			return
		end
		local any_new_result1 = var1_result1_upvr_2.new()
		any_new_result1:GiveTask(arg1.Changed:Connect(function() -- Line 78
			--[[ Upvalues[2]:
				[1]: arg1_3 (readonly)
				[2]: arg1 (copied, readonly)
			]]
			arg1_3:Fire(arg1.Value)
		end))
		arg1_3:Fire(arg1.Value)
		return any_new_result1
	end)
end
function module_2_upvr.__index(arg1, arg2) -- Line 94
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	if arg2 == "Value" then
		return arg1._value
	end
	if module_2_upvr[arg2] then
		return module_2_upvr[arg2]
	end
	if arg2 == "_value" then
		return nil
	end
	error("%q is not a member of ValueObject":format(tostring(arg2)))
end
function module_2_upvr.__newindex(arg1, arg2, arg3) -- Line 106
	--[[ Upvalues[1]:
		[1]: var1_result1_upvr_2 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 8. Error Block 3 start (CF ANALYSIS FAILED)
	rawset(arg1, "_value", arg3)
	local any_new_result1_2 = var1_result1_upvr_2.new()
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [26.3]
	arg1.Changed:Fire(arg3, nil, any_new_result1_2)
	arg1._maid._valueMaid = any_new_result1_2
	do
		return
	end
	-- KONSTANTERROR: [11] 8. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [36] 26. Error Block 4 start (CF ANALYSIS FAILED)
	error("%q is not a member of ValueObject":format(tostring(arg2)))
	-- KONSTANTERROR: [36] 26. Error Block 4 end (CF ANALYSIS FAILED)
end
function module_2_upvr.Destroy(arg1) -- Line 128
	rawset(arg1, "_value", nil)
	arg1._maid:DoCleaning()
	setmetatable(arg1, nil)
end
return module_2_upvr