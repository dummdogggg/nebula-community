--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.MouseLockController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:48
-- Luau version 6, Types version 3
-- Time taken: 0.005068 seconds

local Players_upvr = game:GetService("Players")
local ContextActionService_upvr = game:GetService("ContextActionService")
local GameSettings_upvr = UserSettings().GameSettings
local module_upvr = require(script.Parent:WaitForChild("CameraUtils"))
local module_upvr_2 = {}
module_upvr_2.__index = module_upvr_2
function module_upvr_2.new() -- Line 31
	--[[ Upvalues[3]:
		[1]: module_upvr_2 (readonly)
		[2]: GameSettings_upvr (readonly)
		[3]: Players_upvr (readonly)
	]]
	local setmetatable_result1_upvr = setmetatable({}, module_upvr_2)
	setmetatable_result1_upvr.isMouseLocked = false
	setmetatable_result1_upvr.savedMouseCursor = nil
	setmetatable_result1_upvr.boundKeys = {Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift}
	setmetatable_result1_upvr.mouseLockToggledEvent = Instance.new("BindableEvent")
	local BoundKeys = script:FindFirstChild("BoundKeys")
	if not BoundKeys or not BoundKeys:IsA("StringValue") then
		if BoundKeys then
			BoundKeys:Destroy()
		end
		local StringValue_2 = Instance.new("StringValue")
		assert(StringValue_2, "")
		StringValue_2.Name = "BoundKeys"
		StringValue_2.Value = "LeftShift,RightShift"
		StringValue_2.Parent = script
	end
	if StringValue_2 then
		StringValue_2.Changed:Connect(function(arg1) -- Line 56
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:OnBoundKeysObjectChanged(arg1)
		end)
		setmetatable_result1_upvr:OnBoundKeysObjectChanged(StringValue_2.Value)
	end
	GameSettings_upvr.Changed:Connect(function(arg1) -- Line 63
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		if arg1 == "ControlMode" or arg1 == "ComputerMovementMode" then
			setmetatable_result1_upvr:UpdateMouseLockAvailability()
		end
	end)
	Players_upvr.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function() -- Line 70
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMouseLockAvailability()
	end)
	Players_upvr.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() -- Line 75
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMouseLockAvailability()
	end)
	setmetatable_result1_upvr:UpdateMouseLockAvailability()
	return setmetatable_result1_upvr
end
function module_upvr_2.GetIsMouseLocked(arg1) -- Line 84
	return arg1.isMouseLocked
end
function module_upvr_2.GetBindableToggleEvent(arg1) -- Line 88
	return arg1.mouseLockToggledEvent.Event
end
function module_upvr_2.GetMouseLockOffset(arg1) -- Line 92
	return Vector3.new(1.75, 0, 0)
end
function module_upvr_2.UpdateMouseLockAvailability(arg1) -- Line 96
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: GameSettings_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 31 start (CF ANALYSIS FAILED)
	local var18
	if Players_upvr.LocalPlayer.DevComputerMovementMode ~= var18 then
	else
	end
	var18 = GameSettings_upvr.ControlMode
	if var18 ~= Enum.ControlMode.MouseLockSwitch then
		-- KONSTANTWARNING: GOTO [25] #17
	end
	-- KONSTANTERROR: [0] 1. Error Block 31 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 16. Error Block 33 start (CF ANALYSIS FAILED)
	if GameSettings_upvr.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove then
		var18 = false
	else
		var18 = true
	end
	if Players_upvr.LocalPlayer.DevEnableMouseLock then
		if true then
			if not var18 then
				local var19 = not true
			end
		end
	end
	if var19 ~= arg1.enabled then
		arg1:EnableMouseLock(var19)
	end
	-- KONSTANTERROR: [24] 16. Error Block 33 end (CF ANALYSIS FAILED)
end
function module_upvr_2.OnBoundKeysObjectChanged(arg1, arg2) -- Line 108
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	arg1.boundKeys = {}
	local _, _, _ = string.gmatch(arg2, "[^%s,]+")
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 2 start (CF ANALYSIS FAILED)
	local _, _, pairs_result3 = pairs(Enum.KeyCode:GetEnumItems())
	-- KONSTANTERROR: [10] 8. Error Block 2 end (CF ANALYSIS FAILED)
end
function module_upvr_2.OnMouseLockToggled(arg1) -- Line 123
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	arg1.isMouseLocked = not arg1.isMouseLocked
	if arg1.isMouseLocked then
		local CursorImage = script:FindFirstChild("CursorImage")
		if CursorImage and CursorImage:IsA("StringValue") and CursorImage.Value then
			module_upvr.setMouseIconOverride(CursorImage.Value)
		else
			if CursorImage then
				CursorImage:Destroy()
			end
			local StringValue = Instance.new("StringValue")
			assert(StringValue, "")
			StringValue.Name = "CursorImage"
			StringValue.Value = "rbxasset://textures/MouseLockedCursor.png"
			StringValue.Parent = script
			module_upvr.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png")
		end
	else
		module_upvr.restoreMouseIcon()
	end
	arg1.mouseLockToggledEvent:Fire()
end
function module_upvr_2.DoMouseLockSwitch(arg1, arg2, arg3, arg4) -- Line 148
	if arg3 == Enum.UserInputState.Begin then
		arg1:OnMouseLockToggled()
		return Enum.ContextActionResult.Sink
	end
	return Enum.ContextActionResult.Pass
end
local Value_upvr = Enum.ContextActionPriority.Medium.Value
function module_upvr_2.BindContextActions(arg1) -- Line 156
	--[[ Upvalues[2]:
		[1]: ContextActionService_upvr (readonly)
		[2]: Value_upvr (readonly)
	]]
	ContextActionService_upvr:BindActionAtPriority("MouseLockSwitchAction", function(arg1_2, arg2, arg3) -- Line 157
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return arg1:DoMouseLockSwitch(arg1_2, arg2, arg3)
	end, false, Value_upvr, unpack(arg1.boundKeys))
end
function module_upvr_2.UnbindContextActions(arg1) -- Line 162
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	ContextActionService_upvr:UnbindAction("MouseLockSwitchAction")
end
function module_upvr_2.IsMouseLocked(arg1) -- Line 166
	local enabled = arg1.enabled
	if enabled then
		enabled = arg1.isMouseLocked
	end
	return enabled
end
function module_upvr_2.EnableMouseLock(arg1, arg2) -- Line 170
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if arg2 ~= arg1.enabled then
		arg1.enabled = arg2
		if arg1.enabled then
			arg1:BindContextActions()
			return
		end
		module_upvr.restoreMouseIcon()
		arg1:UnbindContextActions()
		if arg1.isMouseLocked then
			arg1.mouseLockToggledEvent:Fire()
		end
		arg1.isMouseLocked = false
	end
end
return module_upvr_2