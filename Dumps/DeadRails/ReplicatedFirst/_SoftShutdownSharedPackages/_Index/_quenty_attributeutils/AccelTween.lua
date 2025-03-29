--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.AccelTween
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:13
-- Luau version 6, Types version 3
-- Time taken: 0.004756 seconds

local module_upvr = {}
function module_upvr.new(arg1) -- Line 30
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return setmetatable({
		_accel = arg1 or 1;
		_t0 = 0;
		_y0 = 0;
		_a0 = 0;
		_t1 = 0;
		_y1 = 0;
		_a1 = 0;
	}, module_upvr)
end
function module_upvr.__index(arg1, arg2) -- Line 81
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr[arg2] then
		return module_upvr[arg2]
	end
	if arg2 == 'p' then
		local any__getstate_result1, _ = arg1:_getstate(tick())
		return any__getstate_result1
	end
	if arg2 == 'v' then
		local _, any__getstate_result2_2 = arg1:_getstate(tick())
		return any__getstate_result2_2
	end
	if arg2 == 'a' then
		return arg1._accel
	end
	if arg2 == 't' then
		do
			return arg1._y1
		end
		local var7
	end
	if arg2 == "rtime" then
		local tick_result1_2 = tick()
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var7 = arg1._t1 - tick_result1_2
			return var7
		end
		if tick_result1_2 >= arg1._t1 or not INLINED() then
			var7 = 0
		end
		return var7
	end
	error("Bad index %q":format(tostring(arg2)))
end
function module_upvr.__newindex(arg1, arg2, arg3) -- Line 102
	if arg2 == 'p' then
		arg1:_setstate(arg3, nil, nil, nil)
	else
		if arg2 == 'v' then
			arg1:_setstate(nil, arg3, nil, nil)
			return
		end
		if arg2 == 'a' then
			arg1:_setstate(nil, nil, arg3, nil)
			return
		end
		if arg2 == 't' then
			arg1:_setstate(nil, nil, nil, arg3)
			return
		end
		if arg2 == "pt" then
			arg1:_setstate(arg3, 0, nil, arg3)
			return
		end
		error("Bad index %q":format(tostring(arg2)))
	end
end
function module_upvr._getstate(arg1, arg2) -- Line 118
	if arg2 < (arg1._t0 + arg1._t1) / 2 then
		local var9 = arg2 - arg1._t0
		return arg1._y0 + var9 * var9 / 2 * arg1._a0, var9 * arg1._a0
	end
	if arg2 < arg1._t1 then
		local var10 = arg2 - arg1._t1
		return arg1._y1 + var10 * var10 / 2 * arg1._a1, var10 * arg1._a1
	end
	return arg1._y1, 0
end
function module_upvr._setstate(arg1, arg2, arg3, arg4, arg5) -- Line 130
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local tick_result1 = tick()
	local any__getstate_result1_2, any__getstate_result2 = arg1:_getstate(tick_result1)
	local var14 = arg2 or any__getstate_result1_2
	local var15 = arg3 or any__getstate_result2
	local var16 = arg4
	if not var16 then
		var16 = arg1._accel
	end
	arg1._accel = var16
	var16 = arg5
	local var17 = var16
	if not var17 then
		var17 = arg1._y1
	end
	if arg1._accel * arg1._accel < 1e-08 then
		arg1._t0 = 0
		arg1._y0 = var14
		arg1._a0 = 0
		arg1._t1 = math.huge
		arg1._y1 = var17
		arg1._a1 = 0
	else
		if var17 >= var14 then
			local _ = false
			-- KONSTANTWARNING: Skipped task `defvar` above
		else
		end
		if var15 >= 0 then
			-- KONSTANTWARNING: GOTO [53] #38
		end
		local var19 = true
		if var14 - (var15 * var15) / (2 * arg1._accel) >= var17 then
			-- KONSTANTWARNING: GOTO [64] #47
		end
		if var14 + (var15 * var15) / (2 * arg1._accel) >= var17 then
			-- KONSTANTWARNING: GOTO [75] #56
		end
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			return true
		end
		if true and var19 and true or not INLINED_2() and (var19 or not var19 and true) then
			arg1._a0 = arg1._accel
			arg1._t1 = tick_result1 + ((2 * var15 * var15 + 4 * arg1._accel * (var17 - var14)) ^ 0.5 - var15) / arg1._accel
		else
			arg1._a0 = -arg1._accel
			arg1._t1 = tick_result1 + ((2 * var15 * var15 - 4 * arg1._accel * (var17 - var14)) ^ 0.5 + var15) / arg1._accel
		end
		arg1._t0 = tick_result1 - var15 / arg1._a0
		arg1._y0 = var14 - (var15 * var15) / (2 * arg1._a0)
		arg1._y1 = var17
		arg1._a1 = -arg1._a0
	end
end
return module_upvr