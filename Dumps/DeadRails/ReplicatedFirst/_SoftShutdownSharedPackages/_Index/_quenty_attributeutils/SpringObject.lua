--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.SpringObject
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:26
-- Luau version 6, Types version 3
-- Time taken: 0.005837 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local RunService_upvr = game:GetService("RunService")
local any_load_result1_result1_upvr_2 = any_load_result1("Maid")
local var1_result1_upvr = any_load_result1("StepUtils")
local any_load_result1_result1_upvr_5 = any_load_result1("Observable")
local any_load_result1_result1_upvr_3 = any_load_result1("SpringUtils")
local module_upvr = {
	ClassName = "SpringObject";
}
module_upvr.__index = module_upvr
local any_load_result1_result1_upvr_7 = any_load_result1("Signal")
function module_upvr.new(arg1, arg2, arg3) -- Line 29
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_2 (readonly)
		[2]: any_load_result1_result1_upvr_7 (readonly)
		[3]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({
		_maid = any_load_result1_result1_upvr_2.new();
		Changed = any_load_result1_result1_upvr_7.new();
	}, module_upvr)
	setmetatable_result1._maid:GiveTask(setmetatable_result1.Changed)
	if arg1 then
		setmetatable_result1.Target = arg1
	else
		setmetatable_result1:_getSpringForType(0)
	end
	if arg2 then
		setmetatable_result1.Speed = arg2
	end
	if arg3 then
		setmetatable_result1.Damper = arg3
	end
	return setmetatable_result1
end
function module_upvr.isSpringObject(arg1) -- Line 64
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var11 = false
	if type(arg1) == "table" then
		if getmetatable(arg1) ~= module_upvr then
			var11 = false
		else
			var11 = true
		end
	end
	return var11
end
function module_upvr.ObserveRenderStepped(arg1) -- Line 72
	--[[ Upvalues[1]:
		[1]: RunService_upvr (readonly)
	]]
	return arg1:ObserveOnSignal(RunService_upvr.RenderStepped)
end
function module_upvr.ObserveVelocityOnRenderStepped(arg1) -- Line 76
	--[[ Upvalues[1]:
		[1]: RunService_upvr (readonly)
	]]
	return arg1:ObserveVelocityOnSignal(RunService_upvr.RenderStepped)
end
function module_upvr.ObserveVelocityOnSignal(arg1, arg2) -- Line 80
	--[[ Upvalues[4]:
		[1]: any_load_result1_result1_upvr_5 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
		[3]: var1_result1_upvr (readonly)
		[4]: any_load_result1_result1_upvr_3 (readonly)
	]]
	return any_load_result1_result1_upvr_5.new(function(arg1_2) -- Line 81
		--[[ Upvalues[5]:
			[1]: any_load_result1_result1_upvr_2 (copied, readonly)
			[2]: var1_result1_upvr (copied, readonly)
			[3]: arg2 (readonly)
			[4]: any_load_result1_result1_upvr_3 (copied, readonly)
			[5]: arg1 (readonly)
		]]
		local any_new_result1 = any_load_result1_result1_upvr_2.new()
		local any_bindToSignal_result1, any_bindToSignal_result2 = var1_result1_upvr.bindToSignal(arg2, function() -- Line 84
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_3 (copied, readonly)
				[2]: arg1 (copied, readonly)
				[3]: arg1_2 (readonly)
			]]
			local any_animating_result1 = any_load_result1_result1_upvr_3.animating(arg1._currentSpring)
			if any_animating_result1 then
				arg1_2:Fire(any_load_result1_result1_upvr_3.fromLinearIfNeeded(arg1._currentSpring.Velocity))
				return any_animating_result1
			end
			arg1_2:Fire(any_load_result1_result1_upvr_3.fromLinearIfNeeded(0 * arg1._currentSpring.Velocity))
			return any_animating_result1
		end)
		any_new_result1:GiveTask(any_bindToSignal_result2)
		any_new_result1:GiveTask(arg1.Changed:Connect(any_bindToSignal_result1))
		any_bindToSignal_result1()
		return any_new_result1
	end)
end
function module_upvr.ObserveOnSignal(arg1, arg2) -- Line 107
	--[[ Upvalues[4]:
		[1]: any_load_result1_result1_upvr_5 (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
		[3]: var1_result1_upvr (readonly)
		[4]: any_load_result1_result1_upvr_3 (readonly)
	]]
	return any_load_result1_result1_upvr_5.new(function(arg1_3) -- Line 108
		--[[ Upvalues[5]:
			[1]: any_load_result1_result1_upvr_2 (copied, readonly)
			[2]: var1_result1_upvr (copied, readonly)
			[3]: arg2 (readonly)
			[4]: any_load_result1_result1_upvr_3 (copied, readonly)
			[5]: arg1 (readonly)
		]]
		local any_new_result1_2 = any_load_result1_result1_upvr_2.new()
		local any_bindToSignal_result1_2, any_bindToSignal_result2_2 = var1_result1_upvr.bindToSignal(arg2, function() -- Line 111
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr_3 (copied, readonly)
				[2]: arg1 (copied, readonly)
				[3]: arg1_3 (readonly)
			]]
			local any_animating_result1_2, any_animating_result2 = any_load_result1_result1_upvr_3.animating(arg1._currentSpring)
			arg1_3:Fire(any_load_result1_result1_upvr_3.fromLinearIfNeeded(any_animating_result2))
			return any_animating_result1_2
		end)
		any_new_result1_2:GiveTask(any_bindToSignal_result2_2)
		any_new_result1_2:GiveTask(arg1.Changed:Connect(any_bindToSignal_result1_2))
		any_bindToSignal_result1_2()
		return any_new_result1_2
	end)
end
function module_upvr.IsAnimating(arg1) -- Line 129
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_3 (readonly)
	]]
	return any_load_result1_result1_upvr_3.animating(arg1._currentSpring)
end
function module_upvr.Impulse(arg1, arg2) -- Line 140
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr_3 (readonly)
	]]
	arg1._currentSpring:Impulse(any_load_result1_result1_upvr_3.toLinearIfNeeded(arg2))
	arg1.Changed:Fire()
end
function module_upvr.TimeSkip(arg1, arg2) -- Line 150
	local var25
	if type(arg2) ~= "number" then
		var25 = false
	else
		var25 = true
	end
	assert(var25, "Bad delta")
	arg1._currentSpring:TimeSkip(arg2)
	arg1.Changed:Fire()
end
function module_upvr.__index(arg1, arg2) -- Line 157
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr_3 (readonly)
		[2]: module_upvr (readonly)
	]]
	if arg2 == "Value" or arg2 == "Position" or arg2 == 'p' then
		return any_load_result1_result1_upvr_3.fromLinearIfNeeded(arg1._currentSpring.Value)
	end
	if arg2 == "Velocity" or arg2 == 'v' then
		return any_load_result1_result1_upvr_3.fromLinearIfNeeded(arg1._currentSpring.Velocity)
	end
	if arg2 == "Target" or arg2 == 't' then
		return any_load_result1_result1_upvr_3.fromLinearIfNeeded(arg1._currentSpring.Target)
	end
	if arg2 == "Damper" or arg2 == 'd' then
		return arg1._currentSpring.Damper
	end
	if arg2 == "Speed" or arg2 == 's' then
		return arg1._currentSpring.Speed
	end
	if arg2 == "Clock" then
		return arg1._currentSpring.Clock
	end
	if module_upvr[arg2] then
		return module_upvr[arg2]
	end
	error("%q is not a member of SpringObject":format(tostring(arg2)))
end
local any_load_result1_result1_upvr_6 = any_load_result1("Blend")
local any_load_result1_result1_upvr_4 = any_load_result1("Rx")
function module_upvr.__newindex(arg1, arg2, arg3) -- Line 177
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr_6 (readonly)
		[2]: any_load_result1_result1_upvr_4 (readonly)
		[3]: any_load_result1_result1_upvr_3 (readonly)
	]]
	if arg2 == "Value" or arg2 == "Position" or arg2 == 'p' then
		local any_toPropertyObservable_result1_3 = any_load_result1_result1_upvr_6.toPropertyObservable(arg3)
		if not any_toPropertyObservable_result1_3 then
			any_toPropertyObservable_result1_3 = any_load_result1_result1_upvr_4.of(arg3)
		end
		arg1._maid._valueSub = any_toPropertyObservable_result1_3:Subscribe(function(arg1_4) -- Line 181
			--[[ Upvalues[2]:
				[1]: any_load_result1_result1_upvr_3 (copied, readonly)
				[2]: arg1 (readonly)
			]]
			local any_toLinearIfNeeded_result1_3 = any_load_result1_result1_upvr_3.toLinearIfNeeded(arg1_4)
			arg1:_getSpringForType(any_toLinearIfNeeded_result1_3).Value = any_toLinearIfNeeded_result1_3
			arg1.Changed:Fire()
		end)
	else
		if arg2 == "Velocity" or arg2 == 'v' then
			local any_toPropertyObservable_result1_2 = any_load_result1_result1_upvr_6.toPropertyObservable(arg3)
			if not any_toPropertyObservable_result1_2 then
				any_toPropertyObservable_result1_2 = any_load_result1_result1_upvr_4.of(arg3)
			end
			arg1._maid._velocitySub = any_toPropertyObservable_result1_2:Subscribe(function(arg1_5) -- Line 189
				--[[ Upvalues[2]:
					[1]: any_load_result1_result1_upvr_3 (copied, readonly)
					[2]: arg1 (readonly)
				]]
				local any_toLinearIfNeeded_result1 = any_load_result1_result1_upvr_3.toLinearIfNeeded(arg1_5)
				arg1:_getSpringForType(0 * any_toLinearIfNeeded_result1).Velocity = any_toLinearIfNeeded_result1
				arg1.Changed:Fire()
			end)
			return
		end
		if arg2 == "Target" or arg2 == 't' then
			local any_toPropertyObservable_result1 = any_load_result1_result1_upvr_6.toPropertyObservable(arg3)
			if not any_toPropertyObservable_result1 then
				any_toPropertyObservable_result1 = any_load_result1_result1_upvr_4.of(arg3)
			end
			arg1._maid._targetSub = any_toPropertyObservable_result1:Subscribe(function(arg1_6) -- Line 198
				--[[ Upvalues[2]:
					[1]: any_load_result1_result1_upvr_3 (copied, readonly)
					[2]: arg1 (readonly)
				]]
				local any_toLinearIfNeeded_result1_2 = any_load_result1_result1_upvr_3.toLinearIfNeeded(arg1_6)
				arg1:_getSpringForType(any_toLinearIfNeeded_result1_2).Target = any_toLinearIfNeeded_result1_2
				arg1.Changed:Fire()
			end)
			return
		end
		if arg2 == "Damper" or arg2 == 'd' then
			arg1._maid._damperSub = assert(any_load_result1_result1_upvr_6.toNumberObservable(arg3), "Invalid damper"):Subscribe(function(arg1_7) -- Line 207
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				local var38
				if type(arg1_7) ~= "number" then
					var38 = false
				else
					var38 = true
				end
				assert(var38, "Bad damper")
				var38 = arg1
				var38._currentSpring.Damper = arg1_7
				var38 = arg1
				var38.Changed:Fire()
			end)
			return
		end
		if arg2 == "Speed" or arg2 == 's' then
			arg1._maid._speedSub = assert(any_load_result1_result1_upvr_6.toNumberObservable(arg3), "Invalid speed"):Subscribe(function(arg1_8) -- Line 216
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				local var40
				if type(arg1_8) ~= "number" then
					var40 = false
				else
					var40 = true
				end
				assert(var40, "Bad damper")
				var40 = arg1
				var40._currentSpring.Speed = arg1_8
				var40 = arg1
				var40.Changed:Fire()
			end)
			do
				return
			end
			local var41
		end
		if arg2 == "Clock" then
			if type(arg3) ~= "function" then
				var41 = false
			else
				var41 = true
			end
			assert(var41, "Bad clock value")
			arg1._currentSpring.Clock = arg3
			arg1.Changed:Fire()
			return
		end
		error("%q is not a member of SpringObject":format(tostring(arg2)))
	end
end
local any_load_result1_result1_upvr = any_load_result1("Spring")
function module_upvr._getSpringForType(arg1, arg2) -- Line 231
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr_3 (readonly)
	]]
	if rawget(arg1, "_currentSpring") == nil then
		rawset(arg1, "_currentSpring", any_load_result1_result1_upvr.new(arg2))
		return arg1._currentSpring
	end
	if typeof(any_load_result1_result1_upvr_3.fromLinearIfNeeded(arg1._currentSpring.Value)) == typeof(arg2) then
		return arg1._currentSpring
	end
	arg1._currentSpring = any_load_result1_result1_upvr.new(arg2)
	arg1._currentSpring.Speed = arg1._currentSpring.s
	arg1._currentSpring.Damper = arg1._currentSpring.d
	return arg1._currentSpring
end
function module_upvr.Destroy(arg1) -- Line 255
	arg1._maid:DoCleaning()
	setmetatable(arg1, nil)
end
return module_upvr