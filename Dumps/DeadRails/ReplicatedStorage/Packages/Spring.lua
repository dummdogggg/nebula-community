--[[
    Script: ReplicatedStorage.Packages.Spring
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:25
-- Luau version 6, Types version 3
-- Time taken: 0.003646 seconds

local module_2_upvr = {
	_type = "Spring";
}
function module_2_upvr.new(arg1, arg2, arg3, arg4) -- Line 108
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local var2 = arg4
	if not var2 then
		var2 = os.clock
	end
	local module = {
		_clock = var2;
		_time = var2();
	}
	module._position = arg1
	module._velocity = arg1 * 0
	module._target = arg1
	module._damping = arg2 or 1
	module._speed = arg3 or 1
	module._initial = arg1
	return setmetatable(module, module_2_upvr)
end
function module_2_upvr.Reset(arg1, arg2) -- Line 132
	local var4 = arg2
	if not var4 then
		var4 = arg1._initial
	end
	arg1._position = var4
	arg1._target = var4
	arg1._velocity = 0 * var4
	arg1._time = arg1._clock()
end
function module_2_upvr.Impulse(arg1, arg2) -- Line 148
	arg1.Velocity += arg2
end
local function _positionVelocity_upvr(arg1, arg2) -- Line 152, Named "_positionVelocity"
	local _position = arg1._position
	local _velocity = arg1._velocity
	local _damping = arg1._damping
	local _speed = arg1._speed
	local var9 = _speed * (arg2 - arg1._time)
	local var10 = _damping * _damping
	local var11
	local var12
	if var10 < 1 then
		local squareroot_2 = math.sqrt(1 - var10)
		local var14 = math.exp(-_damping * var9) / squareroot_2
		var12 = var14 * math.cos(squareroot_2 * var9)
		var11 = var14 * math.sin(squareroot_2 * var9)
	elseif var10 == 1 then
		local var15 = math.exp(-_damping * var9) / 1
		var12 = var15
		var11 = var15 * var9
	else
		local squareroot = math.sqrt(var10 - 1)
		local var17 = 2 * squareroot
		local var18 = math.exp((-_damping + squareroot) * var9) / var17
		local var19 = math.exp((-_damping - squareroot) * var9) / var17
		var12 = var18 + var19
		var11 = var18 - var19
	end
	local var20 = arg1._target - _position
	return _position + var20 * ((1) - (squareroot * var12 + _damping * var11)) + (_velocity) * (var11 / _speed), (var20) * (_speed * var11) + _velocity * (squareroot * var12 - _damping * var11)
end
function module_2_upvr.TimeSkip(arg1, arg2) -- Line 196
	--[[ Upvalues[1]:
		[1]: _positionVelocity_upvr (readonly)
	]]
	local any__clock_result1_2 = arg1._clock()
	local _positionVelocity_result1_3, _positionVelocity_result2_6 = _positionVelocity_upvr(arg1, any__clock_result1_2 + arg2)
	arg1._position = _positionVelocity_result1_3
	arg1._velocity = _positionVelocity_result2_6
	arg1._time = any__clock_result1_2
end
function module_2_upvr.__index(arg1, arg2) -- Line 204
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: _positionVelocity_upvr (readonly)
	]]
	if module_2_upvr[arg2] then
		return module_2_upvr[arg2]
	end
	if arg2 == "Position" or arg2 == 'p' then
		local _positionVelocity_result1_7, _positionVelocity_upvr_result2 = _positionVelocity_upvr(arg1, arg1._clock())
		return _positionVelocity_result1_7
	end
	if arg2 == "Velocity" or arg2 == 'v' then
		local _, _positionVelocity_result2_2 = _positionVelocity_upvr(arg1, arg1._clock())
		return _positionVelocity_result2_2
	end
	if arg2 == "Target" or arg2 == 't' then
		return arg1._target
	end
	if arg2 == "Damping" or arg2 == 'd' then
		return arg1._damping
	end
	if arg2 == "Speed" or arg2 == 's' then
		return arg1._speed
	end
	if arg2 == "Clock" then
		return arg1._clock
	end
	error(string.format("%q is not a valid member of Spring.", tostring(arg2)), 2)
end
function module_2_upvr.__newindex(arg1, arg2, arg3) -- Line 224
	--[[ Upvalues[1]:
		[1]: _positionVelocity_upvr (readonly)
	]]
	local any__clock_result1 = arg1._clock()
	if arg2 == "Position" or arg2 == 'p' then
		local _, _positionVelocity_result2_7 = _positionVelocity_upvr(arg1, any__clock_result1)
		arg1._position = arg3
		arg1._velocity = _positionVelocity_result2_7
		arg1._time = any__clock_result1
	else
		if arg2 == "Velocity" or arg2 == 'v' then
			local _positionVelocity_result1_6, _ = _positionVelocity_upvr(arg1, any__clock_result1)
			arg1._position = _positionVelocity_result1_6
			arg1._velocity = arg3
			arg1._time = any__clock_result1
			return
		end
		if arg2 == "Target" or arg2 == 't' then
			local _positionVelocity_result1, _positionVelocity_result2 = _positionVelocity_upvr(arg1, any__clock_result1)
			arg1._position = _positionVelocity_result1
			arg1._velocity = _positionVelocity_result2
			arg1._target = arg3
			arg1._time = any__clock_result1
			return
		end
		if arg2 == "Damping" or arg2 == 'd' then
			local _positionVelocity_result1_5, _positionVelocity_result2_5 = _positionVelocity_upvr(arg1, any__clock_result1)
			arg1._position = _positionVelocity_result1_5
			arg1._velocity = _positionVelocity_result2_5
			arg1._damping = arg3
			arg1._time = any__clock_result1
			do
				return
			end
			local var37
		end
		if arg2 == "Speed" or arg2 == 's' then
			var37 = any__clock_result1
			local _positionVelocity_result1_4, _positionVelocity_result2_4 = _positionVelocity_upvr(arg1, var37)
			arg1._position = _positionVelocity_result1_4
			arg1._velocity = _positionVelocity_result2_4
			if arg3 < 0 then
				var37 = 0
			else
				var37 = arg3
			end
			arg1._speed = var37
			arg1._time = any__clock_result1
			return
		end
		if arg2 == "Clock" then
			var37 = any__clock_result1
			local _positionVelocity_result1_2, _positionVelocity_result2_3 = _positionVelocity_upvr(arg1, var37)
			arg1._position = _positionVelocity_result1_2
			arg1._velocity = _positionVelocity_result2_3
			arg1._clock = arg3
			var37 = arg3()
			arg1._time = var37
			return
		end
		error(string.format("%q is not a valid member of Spring.", tostring(arg2)), 2)
	end
end
return module_2_upvr