--[[
    Script: StarterPlayer.StarterPlayerScripts.RealismClient.Util
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:32
-- Luau version 6, Types version 3
-- Time taken: 0.001461 seconds

local module_upvr = {
	Round = function(arg1, arg2, arg3) -- Line 9, Named "Round"
		local var2 = 10 ^ (arg3 or 0)
		return math.floor(arg2 * var2 + 0.5) / var2
	end;
}
function module_upvr.RoundNearestInterval(arg1, arg2, arg3) -- Line 14
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr:Round(arg2 / arg3) * arg3
end
function module_upvr.StepTowards(arg1, arg2, arg3, arg4) -- Line 18
	if math.abs(arg2 - arg3) < arg4 then
		return arg3
	end
	if arg3 < arg2 then
		return arg2 - arg4
	end
	if arg2 < arg3 then
		return arg2 + arg4
	end
end
function module_upvr.PromiseChild(arg1, arg2, arg3, arg4, ...) -- Line 28
	coroutine.wrap(function(...) -- Line 29
		--[[ Upvalues[3]:
			[1]: arg2 (readonly)
			[2]: arg3 (readonly)
			[3]: arg4 (readonly)
		]]
		local SOME = arg2:WaitForChild(arg3, 10)
		if SOME then
			arg4(SOME, ...)
		end
	end)(...)
end
local RunService_upvr = game:GetService("RunService")
function module_upvr.PromiseValue(arg1, arg2, arg3, arg4, ...) -- Line 40
	--[[ Upvalues[1]:
		[1]: RunService_upvr (readonly)
	]]
	({})[1] = ...
	coroutine.wrap(function(...) -- Line 43
		--[[ Upvalues[4]:
			[1]: arg2 (readonly)
			[2]: arg3 (readonly)
			[3]: RunService_upvr (copied, readonly)
			[4]: arg4 (readonly)
		]]
		while not arg2[arg3] do
			if tick() + 10 - tick() < 0 then return end
			RunService_upvr.Heartbeat:Wait()
		end
		arg4(arg2[arg3], ...)
	end)(...)
end
return module_upvr