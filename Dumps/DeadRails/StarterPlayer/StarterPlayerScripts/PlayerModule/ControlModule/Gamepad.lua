--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.Gamepad
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:51
-- Luau version 6, Types version 3
-- Time taken: 0.003347 seconds

local UserInputService_upvr = game:GetService("UserInputService")
local ContextActionService_upvr = game:GetService("ContextActionService")
local None_upvr = Enum.UserInputType.None
local module_upvr = require(script.Parent:WaitForChild("BaseCharacterController"))
local setmetatable_result1_upvr = setmetatable({}, module_upvr)
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
function setmetatable_result1_upvr.new(arg1) -- Line 23
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: None_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_upvr)
	setmetatable_result1.CONTROL_ACTION_PRIORITY = arg1
	setmetatable_result1.forwardValue = 0
	setmetatable_result1.backwardValue = 0
	setmetatable_result1.leftValue = 0
	setmetatable_result1.rightValue = 0
	setmetatable_result1.activeGamepad = None_upvr
	setmetatable_result1.gamepadConnectedConn = nil
	setmetatable_result1.gamepadDisconnectedConn = nil
	return setmetatable_result1
end
function setmetatable_result1_upvr.Enable(arg1, arg2) -- Line 39
	--[[ Upvalues[1]:
		[1]: None_upvr (readonly)
	]]
	if arg2 == arg1.enabled then
		return true
	end
	arg1.forwardValue = 0
	arg1.backwardValue = 0
	arg1.leftValue = 0
	arg1.rightValue = 0
	arg1.moveVector = Vector3.new(0, 0, 0)
	arg1.isJumping = false
	if arg2 then
		arg1.activeGamepad = arg1:GetHighestPriorityGamepad()
		if arg1.activeGamepad ~= None_upvr then
			arg1:BindContextActions()
			arg1:ConnectGamepadConnectionListeners()
		else
			return false
		end
	else
		arg1:UnbindContextActions()
		arg1:DisconnectGamepadConnectionListeners()
		arg1.activeGamepad = None_upvr
	end
	arg1.enabled = arg2
	return true
end
function setmetatable_result1_upvr.GetHighestPriorityGamepad(arg1) -- Line 75
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: None_upvr (readonly)
	]]
	local var14
	for _, v in pairs(UserInputService_upvr:GetConnectedGamepads()) do
		if v.Value < var14.Value then
			var14 = v
		end
	end
	return var14
end
function setmetatable_result1_upvr.BindContextActions(arg1) -- Line 86
	--[[ Upvalues[2]:
		[1]: None_upvr (readonly)
		[2]: ContextActionService_upvr (readonly)
	]]
	if arg1.activeGamepad == None_upvr then
		return false
	end
	ContextActionService_upvr:BindActivate(arg1.activeGamepad, Enum.KeyCode.ButtonR2)
	ContextActionService_upvr:BindActionAtPriority("jumpAction", function(arg1_2, arg2, arg3) -- Line 93
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var16
		if arg2 ~= Enum.UserInputState.Begin then
			var16 = false
		else
			var16 = true
		end
		arg1.isJumping = var16
		return Enum.ContextActionResult.Sink
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA)
	ContextActionService_upvr:BindActionAtPriority("moveThumbstick", function(arg1_3, arg2, arg3) -- Line 98
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 == Enum.UserInputState.Cancel then
			arg1.moveVector = Vector3.new(0, 0, 0)
			return Enum.ContextActionResult.Sink
		end
		if arg1.activeGamepad ~= arg3.UserInputType then
			return Enum.ContextActionResult.Pass
		end
		if arg3.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		if 0.2 < arg3.Position.magnitude then
			arg1.moveVector = Vector3.new(arg3.Position.X, 0, -arg3.Position.Y)
		else
			arg1.moveVector = Vector3.new(0, 0, 0)
		end
		return Enum.ContextActionResult.Sink
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1)
	return true
end
function setmetatable_result1_upvr.UnbindContextActions(arg1) -- Line 127
	--[[ Upvalues[2]:
		[1]: None_upvr (readonly)
		[2]: ContextActionService_upvr (readonly)
	]]
	if arg1.activeGamepad ~= None_upvr then
		ContextActionService_upvr:UnbindActivate(arg1.activeGamepad, Enum.KeyCode.ButtonR2)
	end
	ContextActionService_upvr:UnbindAction("moveThumbstick")
	ContextActionService_upvr:UnbindAction("jumpAction")
end
function setmetatable_result1_upvr.OnNewGamepadConnected(arg1) -- Line 135
	--[[ Upvalues[1]:
		[1]: None_upvr (readonly)
	]]
	local any_GetHighestPriorityGamepad_result1_2 = arg1:GetHighestPriorityGamepad()
	if any_GetHighestPriorityGamepad_result1_2 == arg1.activeGamepad then
	else
		if any_GetHighestPriorityGamepad_result1_2 == None_upvr then
			warn("Gamepad:OnNewGamepadConnected found no connected gamepads")
			arg1:UnbindContextActions()
			return
		end
		if arg1.activeGamepad ~= None_upvr then
			arg1:UnbindContextActions()
		end
		arg1.activeGamepad = any_GetHighestPriorityGamepad_result1_2
		arg1:BindContextActions()
	end
end
function setmetatable_result1_upvr.OnCurrentGamepadDisconnected(arg1) -- Line 162
	--[[ Upvalues[2]:
		[1]: None_upvr (readonly)
		[2]: ContextActionService_upvr (readonly)
	]]
	if arg1.activeGamepad ~= None_upvr then
		ContextActionService_upvr:UnbindActivate(arg1.activeGamepad, Enum.KeyCode.ButtonR2)
	end
	local any_GetHighestPriorityGamepad_result1 = arg1:GetHighestPriorityGamepad()
	if arg1.activeGamepad ~= None_upvr and any_GetHighestPriorityGamepad_result1 == arg1.activeGamepad then
		warn("Gamepad:OnCurrentGamepadDisconnected found the supposedly disconnected gamepad in connectedGamepads.")
		arg1:UnbindContextActions()
		arg1.activeGamepad = None_upvr
	else
		if any_GetHighestPriorityGamepad_result1 == None_upvr then
			arg1:UnbindContextActions()
			arg1.activeGamepad = None_upvr
			return
		end
		arg1.activeGamepad = any_GetHighestPriorityGamepad_result1
		ContextActionService_upvr:BindActivate(arg1.activeGamepad, Enum.KeyCode.ButtonR2)
	end
end
function setmetatable_result1_upvr.ConnectGamepadConnectionListeners(arg1) -- Line 187
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	arg1.gamepadConnectedConn = UserInputService_upvr.GamepadConnected:Connect(function(arg1_4) -- Line 188
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnNewGamepadConnected()
	end)
	arg1.gamepadDisconnectedConn = UserInputService_upvr.GamepadDisconnected:Connect(function(arg1_5) -- Line 192
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1.activeGamepad == arg1_5 then
			arg1:OnCurrentGamepadDisconnected()
		end
	end)
end
function setmetatable_result1_upvr.DisconnectGamepadConnectionListeners(arg1) -- Line 200
	if arg1.gamepadConnectedConn then
		arg1.gamepadConnectedConn:Disconnect()
		arg1.gamepadConnectedConn = nil
	end
	if arg1.gamepadDisconnectedConn then
		arg1.gamepadDisconnectedConn:Disconnect()
		arg1.gamepadDisconnectedConn = nil
	end
end
return setmetatable_result1_upvr