--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.TouchJump
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:39
-- Luau version 6, Types version 3
-- Time taken: 0.008907 seconds

local Players_upvr = game:GetService("Players")
local GuiService_upvr = game:GetService("GuiService")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local module = require(CommonUtils:WaitForChild("FlagUtil"))
local any_getUserFlag_result1_upvr_2 = module.getUserFlag("UserUpdateTouchJump3")
local var6_upvw
local var7_upvw
if any_getUserFlag_result1_upvr_2 then
	var6_upvw = require(CommonUtils:WaitForChild("ConnectionUtil"))
	var7_upvw = require(CommonUtils:WaitForChild("CharacterUtil"))
end
local tbl_upvr = {
	HUMANOID_STATE_ENABLED_CHANGED = "HUMANOID_STATE_ENABLED_CHANGED";
	HUMANOID_JUMP_POWER = "HUMANOID_JUMP_POWER";
	HUMANOID = "HUMANOID";
	JUMP_INPUT_ENDED = "JUMP_INPUT_ENDED";
	MENU_OPENED = "MENU_OPENED";
}
local module_2_upvr = require(script.Parent:WaitForChild("BaseCharacterController"))
local setmetatable_result1_upvr = setmetatable({}, module_2_upvr)
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
function setmetatable_result1_upvr.new() -- Line 57
	--[[ Upvalues[4]:
		[1]: module_2_upvr (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: any_getUserFlag_result1_upvr_2 (readonly)
		[4]: var6_upvw (read and write)
	]]
	local setmetatable_result1 = setmetatable(module_2_upvr.new(), setmetatable_result1_upvr)
	setmetatable_result1.parentUIFrame = nil
	setmetatable_result1.jumpButton = nil
	if not any_getUserFlag_result1_upvr_2 then
		setmetatable_result1.characterAddedConn = nil
		setmetatable_result1.humanoidStateEnabledChangedConn = nil
		setmetatable_result1.humanoidJumpPowerConn = nil
		setmetatable_result1.humanoidParentConn = nil
		setmetatable_result1.jumpPower = 0
		setmetatable_result1.jumpStateEnabled = true
		setmetatable_result1.humanoid = nil
	end
	setmetatable_result1.externallyEnabled = false
	setmetatable_result1.isJumping = false
	if any_getUserFlag_result1_upvr_2 then
		setmetatable_result1._active = false
		setmetatable_result1._connectionUtil = var6_upvw.new()
	end
	return setmetatable_result1
end
if any_getUserFlag_result1_upvr_2 then
	function setmetatable_result1_upvr._reset(arg1) -- Line 84
		arg1.isJumping = false
		arg1.touchObject = nil
		if arg1.jumpButton then
			arg1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
		end
	end
end
function setmetatable_result1_upvr.EnableButton(arg1, arg2) -- Line 95
	--[[ Upvalues[4]:
		[1]: any_getUserFlag_result1_upvr_2 (readonly)
		[2]: tbl_upvr (readonly)
		[3]: GuiService_upvr (readonly)
		[4]: Players_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 32 start (CF ANALYSIS FAILED)
	if arg2 == arg1._active then
		arg1:_reset()
		return
	end
	if arg2 then
		if not arg1.jumpButton then
			arg1:Create()
		end
		arg1.jumpButton.Visible = true
		arg1._connectionUtil:trackConnection(tbl_upvr.JUMP_INPUT_ENDED, arg1.jumpButton.InputEnded:Connect(function(arg1_2) -- Line 112
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if arg1_2 == arg1.touchObject then
				arg1:_reset()
			end
		end))
		arg1._connectionUtil:trackConnection(tbl_upvr.MENU_OPENED, GuiService_upvr.MenuOpened:Connect(function() -- Line 122
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if arg1.touchObject then
				arg1:_reset()
			end
		end))
	else
		if arg1.jumpButton then
			arg1.jumpButton.Visible = false
		end
		arg1._connectionUtil:disconnect(tbl_upvr.JUMP_INPUT_ENDED)
		arg1._connectionUtil:disconnect(tbl_upvr.MENU_OPENED)
	end
	arg1:_reset()
	arg1._active = arg2
	do
		return
	end
	-- KONSTANTERROR: [2] 3. Error Block 32 end (CF ANALYSIS FAILED)
end
function setmetatable_result1_upvr.UpdateEnabled(arg1) -- Line 159
	--[[ Upvalues[2]:
		[1]: any_getUserFlag_result1_upvr_2 (readonly)
		[2]: var7_upvw (read and write)
	]]
	if any_getUserFlag_result1_upvr_2 then
		local any_getChild_result1 = var7_upvw.getChild("Humanoid", "Humanoid")
		if any_getChild_result1 and arg1.externallyEnabled and 0 < any_getChild_result1.JumpPower and any_getChild_result1:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
			arg1:EnableButton(true)
		else
			arg1:EnableButton(false)
		end
	end
	if 0 < arg1.jumpPower and arg1.jumpStateEnabled then
		arg1:EnableButton(true)
	else
		arg1:EnableButton(false)
	end
end
if any_getUserFlag_result1_upvr_2 then
	function setmetatable_result1_upvr._setupConfigurations(arg1) -- Line 177
		--[[ Upvalues[2]:
			[1]: var7_upvw (read and write)
			[2]: tbl_upvr (readonly)
		]]
		local function update_upvr() -- Line 178, Named "update"
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:UpdateEnabled()
		end
		arg1._connectionUtil:trackConnection(tbl_upvr.HUMANOID, var7_upvw.onChild("Humanoid", "Humanoid", function(arg1_3) -- Line 183
			--[[ Upvalues[3]:
				[1]: arg1 (readonly)
				[2]: tbl_upvr (copied, readonly)
				[3]: update_upvr (readonly)
			]]
			arg1:UpdateEnabled()
			arg1._connectionUtil:trackConnection(tbl_upvr.HUMANOID_JUMP_POWER, arg1_3:GetPropertyChangedSignal("JumpPower"):Connect(update_upvr))
			arg1._connectionUtil:trackConnection(tbl_upvr.HUMANOID_STATE_ENABLED_CHANGED, arg1_3.StateEnabledChanged:Connect(function(arg1_4, arg2) -- Line 191
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				if arg1_4 == Enum.HumanoidStateType.Jumping and arg2 ~= arg1._active then
					arg1:UpdateEnabled()
				end
			end))
		end))
	end
end
if not any_getUserFlag_result1_upvr_2 then
	function setmetatable_result1_upvr.HumanoidChanged(arg1, arg2) -- Line 205
		--[[ Upvalues[1]:
			[1]: Players_upvr (readonly)
		]]
		local Character = Players_upvr.LocalPlayer.Character
		if Character then
			Character = Players_upvr.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		end
		if Character then
			if arg2 == "JumpPower" then
				arg1.jumpPower = Character.JumpPower
				arg1:UpdateEnabled()
				return
			end
			if arg2 == "Parent" and not Character.Parent then
				arg1.humanoidChangeConn:Disconnect()
			end
		end
	end
	function setmetatable_result1_upvr.HumanoidStateEnabledChanged(arg1, arg2, arg3) -- Line 220
		if arg2 == Enum.HumanoidStateType.Jumping then
			arg1.jumpStateEnabled = arg3
			arg1:UpdateEnabled()
		end
	end
	function setmetatable_result1_upvr.CharacterAdded(arg1, arg2) -- Line 227
		if arg1.humanoidChangeConn then
			arg1.humanoidChangeConn:Disconnect()
			arg1.humanoidChangeConn = nil
		end
		arg1.humanoid = arg2:FindFirstChildOfClass("Humanoid")
		while not arg1.humanoid do
			arg2.ChildAdded:wait()
			arg1.humanoid = arg2:FindFirstChildOfClass("Humanoid")
		end
		arg1.humanoidJumpPowerConn = arg1.humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function() -- Line 239
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1.jumpPower = arg1.humanoid.JumpPower
			arg1:UpdateEnabled()
		end)
		arg1.humanoidParentConn = arg1.humanoid:GetPropertyChangedSignal("Parent"):Connect(function() -- Line 244
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if not arg1.humanoid.Parent then
				arg1.humanoidJumpPowerConn:Disconnect()
				arg1.humanoidJumpPowerConn = nil
				arg1.humanoidParentConn:Disconnect()
				arg1.humanoidParentConn = nil
			end
		end)
		arg1.humanoidStateEnabledChangedConn = arg1.humanoid.StateEnabledChanged:Connect(function(arg1_5, arg2_2) -- Line 253
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:HumanoidStateEnabledChanged(arg1_5, arg2_2)
		end)
		arg1.jumpPower = arg1.humanoid.JumpPower
		arg1.jumpStateEnabled = arg1.humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping)
		arg1:UpdateEnabled()
	end
	function setmetatable_result1_upvr.SetupCharacterAddedFunction(arg1) -- Line 262
		--[[ Upvalues[1]:
			[1]: Players_upvr (readonly)
		]]
		arg1.characterAddedConn = Players_upvr.LocalPlayer.CharacterAdded:Connect(function(arg1_6) -- Line 263
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:CharacterAdded(arg1_6)
		end)
		if Players_upvr.LocalPlayer.Character then
			arg1:CharacterAdded(Players_upvr.LocalPlayer.Character)
		end
	end
end
local any_getUserFlag_result1_upvr = module.getUserFlag("UserControlModuleEnableIdempotent")
function setmetatable_result1_upvr.Enable(arg1, arg2, arg3) -- Line 272
	--[[ Upvalues[2]:
		[1]: any_getUserFlag_result1_upvr (readonly)
		[2]: any_getUserFlag_result1_upvr_2 (readonly)
	]]
	if arg3 then
		arg1.parentUIFrame = arg3
	end
	if any_getUserFlag_result1_upvr and arg1.externallyEnabled == arg2 then
	else
		arg1.externallyEnabled = arg2
		if any_getUserFlag_result1_upvr_2 then
			arg1:UpdateEnabled()
			if arg2 then
				arg1:_setupConfigurations()
			else
				arg1._connectionUtil:disconnectAll()
			end
		end
		arg1:EnableButton(arg2)
	end
end
function setmetatable_result1_upvr.Create(arg1) -- Line 293
	--[[ Upvalues[2]:
		[1]: any_getUserFlag_result1_upvr_2 (readonly)
		[2]: GuiService_upvr (readonly)
	]]
	if not arg1.parentUIFrame then
	else
		if arg1.jumpButton then
			arg1.jumpButton:Destroy()
			arg1.jumpButton = nil
		end
		if arg1.absoluteSizeChangedConn then
			arg1.absoluteSizeChangedConn:Disconnect()
			arg1.absoluteSizeChangedConn = nil
		end
		arg1.jumpButton = Instance.new("ImageButton")
		arg1.jumpButton.Name = "JumpButton"
		arg1.jumpButton.Visible = false
		arg1.jumpButton.BackgroundTransparency = 1
		arg1.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
		arg1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
		arg1.jumpButton.ImageRectSize = Vector2.new(144, 144)
		local function ResizeJumpButton() -- Line 316
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local x = arg1.parentUIFrame.AbsoluteSize.x
			local var30
			if math.min(x, arg1.parentUIFrame.AbsoluteSize.y) > var30 then
				x = false
			else
				x = true
			end
			if x then
				var30 = 70
			else
				var30 = 120
			end
			arg1.jumpButton.Size = UDim2.new(0, var30, 0, var30)
			if not x or not UDim2.new(1, -(var30 * 1.5 - 10), 1, -var30 - 20) then
			end
			arg1.jumpButton.Position = UDim2.new(1, -(var30 * 1.5 - 10), 1, -var30 * 1.75)
		end
		ResizeJumpButton()
		arg1.absoluteSizeChangedConn = arg1.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(ResizeJumpButton)
		arg1.touchObject = nil
		arg1.jumpButton.InputBegan:connect(function(arg1_9) -- Line 330
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if arg1.touchObject or arg1_9.UserInputType ~= Enum.UserInputType.Touch or arg1_9.UserInputState ~= Enum.UserInputState.Begin then
			else
				arg1.touchObject = arg1_9
				arg1.jumpButton.ImageRectOffset = Vector2.new(146, 146)
				arg1.isJumping = true
			end
		end)
		if not any_getUserFlag_result1_upvr_2 then
			local function _() -- Line 344
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				arg1.touchObject = nil
				arg1.isJumping = false
				arg1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
			end
			arg1.jumpButton.InputEnded:connect(function(arg1_10) -- Line 350
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				if arg1_10 == arg1.touchObject then
					arg1.touchObject = nil
					arg1.isJumping = false
					arg1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
				end
			end)
			GuiService_upvr.MenuOpened:connect(function() -- Line 356
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				if arg1.touchObject then
					arg1.touchObject = nil
					arg1.isJumping = false
					arg1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
				end
			end)
			if not arg1.characterAddedConn then
				arg1:SetupCharacterAddedFunction()
			end
		end
		arg1.jumpButton.Parent = arg1.parentUIFrame
	end
end
return setmetatable_result1_upvr