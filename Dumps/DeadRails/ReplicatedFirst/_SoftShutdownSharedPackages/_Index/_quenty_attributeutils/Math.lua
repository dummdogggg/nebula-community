--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.Math
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:35
-- Luau version 6, Types version 3
-- Time taken: 0.001206 seconds

return {
	map = function(arg1, arg2, arg3, arg4, arg5) -- Line 27, Named "map"
		if arg3 == arg2 then
			error("Range of zero")
		end
		return (arg1 - arg2) * (arg5 - arg4) / (arg3 - arg2) + arg4
	end;
	lerp = function(arg1, arg2, arg3) -- Line 49, Named "lerp"
		return arg1 + (arg2 - arg1) * arg3
	end;
	lawOfCosines = function(arg1, arg2, arg3) -- Line 61, Named "lawOfCosines"
		local arccosine = math.acos((arg1 * arg1 + arg2 * arg2 - arg3 * arg3) / (arg1 * 2 * arg2))
		if arccosine ~= arccosine then
			return nil
		end
		return arccosine
	end;
	round = function(arg1, arg2) -- Line 81, Named "round"
		if arg2 then
			return math.floor(arg1 / arg2 + 0.5) * arg2
		end
		return math.floor(arg1 + 0.5)
	end;
	roundUp = function(arg1, arg2) -- Line 96, Named "roundUp"
		return math.ceil(arg1 / arg2) * arg2
	end;
	roundDown = function(arg1, arg2) -- Line 107, Named "roundDown"
		return math.floor(arg1 / arg2) * arg2
	end;
}