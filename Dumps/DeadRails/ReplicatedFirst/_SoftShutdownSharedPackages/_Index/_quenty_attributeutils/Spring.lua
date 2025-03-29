--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.Spring
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:06
-- Luau version 6, Types version 3
-- Time taken: 0.004286 seconds

local module_upvr = {}
function module_upvr.new(arg1, arg2) -- Line 49
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var2 = arg1 or 0
	local var3 = arg2
	if not var3 then
		var3 = os.clock
	end
	local var4 = var3
	return setmetatable({
		_clock = var4;
		_time0 = var4();
		_position0 = var2;
		_velocity0 = 0 * var2;
		_target = var2;
		_damper = 1;
		_speed = 1;
	}, module_upvr)
end
function module_upvr.Impulse(arg1, arg2) -- Line 70
	arg1.Velocity += arg2
end
function module_upvr.TimeSkip(arg1, arg2) -- Line 79
	local any__clock_result1 = arg1._clock()
	local any__positionVelocity_result1_5, any__positionVelocity_result2_3 = arg1:_positionVelocity(any__clock_result1 + arg2)
	arg1._position0 = any__positionVelocity_result1_5
	arg1._velocity0 = any__positionVelocity_result2_3
	arg1._time0 = any__clock_result1
end
function module_upvr.__index(arg1, arg2) -- Line 168
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr[arg2] then
		return module_upvr[arg2]
	end
	if arg2 == "Value" or arg2 == "Position" or arg2 == 'p' then
		local any__positionVelocity_result1_2, _ = arg1:_positionVelocity(arg1._clock())
		return any__positionVelocity_result1_2
	end
	if arg2 == "Velocity" or arg2 == 'v' then
		local _, any__positionVelocity_result2 = arg1:_positionVelocity(arg1._clock())
		return any__positionVelocity_result2
	end
	if arg2 == "Target" or arg2 == 't' then
		return arg1._target
	end
	if arg2 == "Damper" or arg2 == 'd' then
		return arg1._damper
	end
	if arg2 == "Speed" or arg2 == 's' then
		return arg1._speed
	end
	if arg2 == "Clock" then
		return arg1._clock
	end
	error("%q is not a valid member of Spring":format(tostring(arg2)), 2)
end
function module_upvr.__newindex(arg1, arg2, arg3) -- Line 190
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local any__clock_result1_2 = arg1._clock()
	if arg2 == "Value" or arg2 == "Position" or arg2 == 'p' then
		local _, any__positionVelocity_result2_2 = arg1:_positionVelocity(any__clock_result1_2)
		arg1._position0 = arg3
		arg1._velocity0 = any__positionVelocity_result2_2
		arg1._time0 = any__clock_result1_2
	else
		if arg2 == "Velocity" or arg2 == 'v' then
			local any__positionVelocity_result1, any__positionVelocity_result2_8 = arg1:_positionVelocity(any__clock_result1_2)
			arg1._position0 = any__positionVelocity_result1
			arg1._velocity0 = arg3
			arg1._time0 = any__clock_result1_2
			return
		end
		if arg2 == "Target" or arg2 == 't' then
			local any__positionVelocity_result1_7, any__positionVelocity_result2_4 = arg1:_positionVelocity(any__clock_result1_2)
			arg1._position0 = any__positionVelocity_result1_7
			arg1._velocity0 = any__positionVelocity_result2_4
			arg1._target = arg3
			arg1._time0 = any__clock_result1_2
			return
		end
		if arg2 == "Damper" or arg2 == 'd' then
			local any__positionVelocity_result1_4, any__positionVelocity_result2_7 = arg1:_positionVelocity(any__clock_result1_2)
			arg1._position0 = any__positionVelocity_result1_4
			arg1._velocity0 = any__positionVelocity_result2_7
			arg1._damper = arg3
			arg1._time0 = any__clock_result1_2
			return
		end
		if arg2 == "Speed" or arg2 == 's' then
			local var22 = any__clock_result1_2
			local any__positionVelocity_result1_3, any__positionVelocity_result2_5 = arg1:_positionVelocity(var22)
			arg1._position0 = any__positionVelocity_result1_3
			arg1._velocity0 = any__positionVelocity_result2_5
			if arg3 < 0 then
			else
			end
			arg1._speed = arg3
			arg1._time0 = any__clock_result1_2
			return
		end
		if arg2 == "Clock" then
			local any__positionVelocity_result1_6, any__positionVelocity_result2_6 = arg1:_positionVelocity(any__clock_result1_2)
			arg1._position0 = any__positionVelocity_result1_6
			arg1._velocity0 = any__positionVelocity_result2_6
			arg1._clock = arg3
			arg1._time0 = arg3()
			return
		end
		error("%q is not a valid member of Spring":format(tostring(arg2)), 2)
	end
end
function module_upvr._positionVelocity(arg1, arg2) -- Line 232
	local _position0 = arg1._position0
	local _velocity0 = arg1._velocity0
	local _target = arg1._target
	local _damper = arg1._damper
	local _speed = arg1._speed
	local var32 = _speed * (arg2 - arg1._time0)
	local var33 = _damper * _damper
	local var34
	local var35
	if var33 < 1 then
		local squareroot_2 = math.sqrt(1 - var33)
		local var37 = math.exp(-_damper * var32) / squareroot_2
		var35 = var37 * math.cos(squareroot_2 * var32)
		var34 = var37 * math.sin(squareroot_2 * var32)
	elseif var33 == 1 then
		local var38 = math.exp(-_damper * var32) / 1
		var35 = var38
		var34 = var38 * var32
	else
		local squareroot = math.sqrt(var33 - 1)
		local var40 = (math.exp((-_damper + squareroot) * var32)) / (2 * squareroot)
		local var41 = (math.exp((-_damper - squareroot) * var32)) / (2 * squareroot)
		var35 = var40 + var41
		var34 = var40 - var41
	end
	return (squareroot * var35 + _damper * var34) * _position0 + ((1) - (squareroot * var35 + _damper * var34)) * _target + var34 / _speed * _velocity0, -_speed * var34 * _position0 + _speed * var34 * _target + (squareroot * var35 - _damper * var34) * _velocity0
end
return module_upvr