--[[
    Script: ReplicatedStorage.Client.Controllers.MouseController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:50
-- Luau version 6, Types version 3
-- Time taken: 0.001131 seconds

local UserInputService_upvr = game:GetService("UserInputService")
local module_upvr = {
	_canSetMouseBehavior = true;
	_currentMouseBehavior = Enum.MouseBehavior.LockCenter;
}
function module_upvr.getCurrentMouseBehavior() -- Line 10
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr._currentMouseBehavior
end
function module_upvr.toggleMouseBehavior() -- Line 14
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if not module_upvr._canSetMouseBehavior then
	else
		local _currentMouseBehavior = module_upvr._currentMouseBehavior
		if _currentMouseBehavior == Enum.MouseBehavior.Default then
			module_upvr.setMouseBehavior(Enum.MouseBehavior.LockCenter)
		elseif _currentMouseBehavior == Enum.MouseBehavior.LockCenter then
			module_upvr.setMouseBehavior(Enum.MouseBehavior.Default)
		end
		module_upvr._updateMouseBehavior()
	end
end
function module_upvr.setMouseBehavior(arg1, arg2) -- Line 30
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr._canSetMouseBehavior or arg2 then
		module_upvr._currentMouseBehavior = arg1
	end
	module_upvr._updateMouseBehavior()
end
function module_upvr.setMouseBehaviorLocked(arg1) -- Line 38
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr._canSetMouseBehavior = arg1
end
function module_upvr.setMouseIconVisible(arg1) -- Line 42
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.MouseIconEnabled = arg1
end
function module_upvr._updateMouseBehavior() -- Line 46
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	UserInputService_upvr.MouseBehavior = module_upvr._currentMouseBehavior
end
return module_upvr