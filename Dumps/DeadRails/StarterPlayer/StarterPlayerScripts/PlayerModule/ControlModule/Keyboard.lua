--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.Keyboard
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:42
-- Luau version 6, Types version 3
-- Time taken: 0.003254 seconds

local zero_vector3_upvr = Vector3.new()
local module_upvr = require(script.Parent:WaitForChild("BaseCharacterController"))
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new(arg1) -- Line 22
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_2_upvr)
	setmetatable_result1.CONTROL_ACTION_PRIORITY = arg1
	setmetatable_result1.forwardValue = 0
	setmetatable_result1.backwardValue = 0
	setmetatable_result1.leftValue = 0
	setmetatable_result1.rightValue = 0
	setmetatable_result1.jumpEnabled = true
	return setmetatable_result1
end
function setmetatable_result1_2_upvr.Enable(arg1, arg2) -- Line 37
	--[[ Upvalues[1]:
		[1]: zero_vector3_upvr (readonly)
	]]
	if arg2 == arg1.enabled then
		return true
	end
	arg1.forwardValue = 0
	arg1.backwardValue = 0
	arg1.leftValue = 0
	arg1.rightValue = 0
	arg1.moveVector = zero_vector3_upvr
	arg1.jumpRequested = false
	arg1:UpdateJump()
	if arg2 then
		arg1:BindContextActions()
		arg1:ConnectFocusEventListeners()
	else
		arg1._connectionUtil:disconnectAll()
	end
	arg1.enabled = arg2
	return true
end
function setmetatable_result1_2_upvr.UpdateMovement(arg1, arg2) -- Line 64
	--[[ Upvalues[1]:
		[1]: zero_vector3_upvr (readonly)
	]]
	if arg2 == Enum.UserInputState.Cancel then
		arg1.moveVector = zero_vector3_upvr
	else
		arg1.moveVector = Vector3.new(arg1.leftValue + arg1.rightValue, 0, arg1.forwardValue + arg1.backwardValue)
	end
end
function setmetatable_result1_2_upvr.UpdateJump(arg1) -- Line 72
	arg1.isJumping = arg1.jumpRequested
end
local ContextActionService_upvr = game:GetService("ContextActionService")
function setmetatable_result1_2_upvr.BindContextActions(arg1) -- Line 76
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	ContextActionService_upvr:BindActionAtPriority("moveForwardAction", function(arg1_2, arg2, arg3) -- Line 82
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var7
		if arg2 == Enum.UserInputState.Begin then
			var7 = -1
		else
			var7 = 0
		end
		arg1.forwardValue = var7
		arg1:UpdateMovement(arg2)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterForward)
	ContextActionService_upvr:BindActionAtPriority("moveBackwardAction", function(arg1_3, arg2, arg3) -- Line 88
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var9
		if arg2 == Enum.UserInputState.Begin then
			var9 = 1
		else
			var9 = 0
		end
		arg1.backwardValue = var9
		arg1:UpdateMovement(arg2)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterBackward)
	ContextActionService_upvr:BindActionAtPriority("moveLeftAction", function(arg1_4, arg2, arg3) -- Line 94
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var11
		if arg2 == Enum.UserInputState.Begin then
			var11 = -1
		else
			var11 = 0
		end
		arg1.leftValue = var11
		arg1:UpdateMovement(arg2)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterLeft)
	ContextActionService_upvr:BindActionAtPriority("moveRightAction", function(arg1_5, arg2, arg3) -- Line 100
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var13
		if arg2 == Enum.UserInputState.Begin then
			var13 = 1
		else
			var13 = 0
		end
		arg1.rightValue = var13
		arg1:UpdateMovement(arg2)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterRight)
	ContextActionService_upvr:BindActionAtPriority("jumpAction", function(arg1_6, arg2, arg3) -- Line 106
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local jumpEnabled = arg1.jumpEnabled
		if jumpEnabled then
			if arg2 ~= Enum.UserInputState.Begin then
				jumpEnabled = false
			else
				jumpEnabled = true
			end
		end
		arg1.jumpRequested = jumpEnabled
		arg1:UpdateJump()
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterJump)
	arg1._connectionUtil:trackBoundFunction("moveForwardAction", function() -- Line 125
		--[[ Upvalues[1]:
			[1]: ContextActionService_upvr (copied, readonly)
		]]
		ContextActionService_upvr:UnbindAction("moveForwardAction")
	end)
	arg1._connectionUtil:trackBoundFunction("moveBackwardAction", function() -- Line 126
		--[[ Upvalues[1]:
			[1]: ContextActionService_upvr (copied, readonly)
		]]
		ContextActionService_upvr:UnbindAction("moveBackwardAction")
	end)
	arg1._connectionUtil:trackBoundFunction("moveLeftAction", function() -- Line 127
		--[[ Upvalues[1]:
			[1]: ContextActionService_upvr (copied, readonly)
		]]
		ContextActionService_upvr:UnbindAction("moveLeftAction")
	end)
	arg1._connectionUtil:trackBoundFunction("moveRightAction", function() -- Line 128
		--[[ Upvalues[1]:
			[1]: ContextActionService_upvr (copied, readonly)
		]]
		ContextActionService_upvr:UnbindAction("moveRightAction")
	end)
	arg1._connectionUtil:trackBoundFunction("jumpAction", function() -- Line 129
		--[[ Upvalues[1]:
			[1]: ContextActionService_upvr (copied, readonly)
		]]
		ContextActionService_upvr:UnbindAction("jumpAction")
	end)
end
local UserInputService_upvr = game:GetService("UserInputService")
function setmetatable_result1_2_upvr.ConnectFocusEventListeners(arg1) -- Line 132
	--[[ Upvalues[2]:
		[1]: zero_vector3_upvr (readonly)
		[2]: UserInputService_upvr (readonly)
	]]
	local function onFocusReleased() -- Line 133
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: zero_vector3_upvr (copied, readonly)
		]]
		arg1.moveVector = zero_vector3_upvr
		arg1.forwardValue = 0
		arg1.backwardValue = 0
		arg1.leftValue = 0
		arg1.rightValue = 0
		arg1.jumpRequested = false
		arg1:UpdateJump()
	end
	arg1._connectionUtil:trackConnection("textBoxFocusReleased", UserInputService_upvr.TextBoxFocusReleased:Connect(onFocusReleased))
	arg1._connectionUtil:trackConnection("textBoxFocused", UserInputService_upvr.TextBoxFocused:Connect(function(arg1_7) -- Line 143, Named "onTextFocusGained"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1.jumpRequested = false
		arg1:UpdateJump()
	end))
	arg1._connectionUtil:trackConnection("windowFocusReleased", UserInputService_upvr.WindowFocused:Connect(onFocusReleased))
end
return setmetatable_result1_2_upvr