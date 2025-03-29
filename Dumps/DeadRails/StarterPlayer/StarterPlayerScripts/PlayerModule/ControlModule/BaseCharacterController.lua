--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.BaseCharacterController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:29
-- Luau version 6, Types version 3
-- Time taken: 0.000942 seconds

local module_upvr_2 = {}
module_upvr_2.__index = module_upvr_2
local zero_vector3_upvr = Vector3.new()
local module_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("ConnectionUtil"))
function module_upvr_2.new() -- Line 33
	--[[ Upvalues[3]:
		[1]: module_upvr_2 (readonly)
		[2]: zero_vector3_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr_2)
	setmetatable_result1.enabled = false
	setmetatable_result1.moveVector = zero_vector3_upvr
	setmetatable_result1.moveVectorIsCameraRelative = true
	setmetatable_result1.isJumping = false
	setmetatable_result1._connectionUtil = module_upvr.new()
	return setmetatable_result1
end
function module_upvr_2.GetMoveVector(arg1) -- Line 45
	return arg1.moveVector
end
function module_upvr_2.IsMoveVectorCameraRelative(arg1) -- Line 49
	return arg1.moveVectorIsCameraRelative
end
function module_upvr_2.GetIsJumping(arg1) -- Line 53
	return arg1.isJumping
end
function module_upvr_2.Enable(arg1, arg2) -- Line 59
	error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.")
	return false
end
return module_upvr_2