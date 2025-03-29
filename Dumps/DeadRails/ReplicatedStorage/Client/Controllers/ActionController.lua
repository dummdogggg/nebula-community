--[[
    Script: ReplicatedStorage.Client.Controllers.ActionController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:52
-- Luau version 6, Types version 3
-- Time taken: 0.010691 seconds

local ContextActionService_upvr = game:GetService("ContextActionService")
local ._ActionController_InputCategorizer_upvr = require("./ActionController/InputCategorizer")
local PlayerGui_upvr = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local Instances_upvr = script:FindFirstChild("Instances")
local ActionGui_upvr = Instances_upvr.ActionGui
local module_upvr = {
	_registeredActions = {};
	_initialized = false;
}
local function _(arg1) -- Line 58, Named "validateAction"
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if not module_upvr._registeredActions[arg1] then
		warn(debug.traceback(`Action {arg1} is not a registered action!`, 1))
		return false
	end
	return true
end
function module_upvr._updateButtonVisibility() -- Line 68
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: ._ActionController_InputCategorizer_upvr (readonly)
	]]
	local tbl = {}
	for _, v in pairs(module_upvr._registeredActions) do
		local tostring_result1 = tostring(v.actionContext.buttonPosition)
		if not tbl[tostring_result1] then
			tbl[tostring_result1] = {}
		end
		table.insert(tbl[tostring_result1], v)
	end
	for _, v_2 in pairs(tbl) do
		local var28
		if 1 < #v_2 then
			function var28(arg1, arg2) -- Line 86
				local var29
				if arg1.priority >= arg2.priority then
					var29 = false
				else
					var29 = true
				end
				return var29
			end
			table.sort(v_2, var28)
			local ipairs_result1, ipairs_result2, ipairs_result3 = ipairs(v_2)
			for i_3, v_3 in ipairs_result1, ipairs_result2, ipairs_result3 do
				if i_3 == 1 then
					local showAction = v_3.actionContext.showAction
					if showAction then
						if ._ActionController_InputCategorizer_upvr.getLastInputCategory() ~= ._ActionController_InputCategorizer_upvr.InputCategory.Touch then
							showAction = false
						else
							showAction = true
						end
					end
					v_3.button.Visible = showAction
				else
					v_3.button.Visible = false
				end
			end
		else
			local _1 = v_2[1]
			i_3 = _1.actionContext
			ipairs_result3 = i_3.showAction
			if ipairs_result3 then
				v_3 = ._ActionController_InputCategorizer_upvr
				i_3 = v_3.getLastInputCategory()
				v_3 = ._ActionController_InputCategorizer_upvr.InputCategory.Touch
				if i_3 ~= v_3 then
					ipairs_result3 = false
				else
					ipairs_result3 = true
				end
			end
			_1.button.Visible = ipairs_result3
		end
	end
end
function module_upvr.setButtonVisibility(arg1, arg2) -- Line 111
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var35
	if not module_upvr._registeredActions[arg1] then
		warn(debug.traceback(`Action {arg1} is not a registered action!`, 1))
		var35 = false
	else
		var35 = true
	end
	if not var35 then
	else
		var35 = module_upvr._registeredActions[arg1]
		var35.actionContext.showAction = arg2
		module_upvr._updateButtonVisibility()
	end
end
function module_upvr.isBound(arg1) -- Line 123
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var36
	if typeof(arg1) ~= "string" then
		var36 = false
	else
		var36 = true
	end
	assert(var36, "First argument must be a string!")
	var36 = module_upvr._registeredActions[arg1]
	if var36 == nil then
	else
	end
	return true
end
function module_upvr.bindAction(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 128
	--[[ Upvalues[5]:
		[1]: module_upvr (readonly)
		[2]: Instances_upvr (readonly)
		[3]: ActionGui_upvr (readonly)
		[4]: ._ActionController_InputCategorizer_upvr (readonly)
		[5]: ContextActionService_upvr (readonly)
	]]
	if module_upvr._registeredActions[arg1] then
		warn(`Action {arg1} is already registered!`)
	else
		local tbl_2_upvr = {}
		tbl_2_upvr.actionName = arg1
		tbl_2_upvr.actionContext = arg3
		tbl_2_upvr.keyboardAndMouseInput = arg4
		tbl_2_upvr.gamepadInput = arg5
		tbl_2_upvr.priority = arg6 or 0
		tbl_2_upvr.connections = {}
		tbl_2_upvr.pressed = false
		local function _() -- Line 152, Named "createActionFrame"
			--[[ Upvalues[4]:
				[1]: Instances_upvr (copied, readonly)
				[2]: arg3 (readonly)
				[3]: tbl_2_upvr (readonly)
				[4]: ActionGui_upvr (copied, readonly)
			]]
			local clone_8 = Instances_upvr.ActionFrame:Clone()
			clone_8.ContentFrame.ActionLabel.Text = arg3.buttonText
			clone_8.LayoutOrder = tbl_2_upvr.priority
			clone_8.Parent = ActionGui_upvr.RightListFrame
			return clone_8
		end
		local clone_10 = Instances_upvr.ActionFrame:Clone()
		clone_10.ContentFrame.ActionLabel.Text = arg3.buttonText
		clone_10.LayoutOrder = tbl_2_upvr.priority
		clone_10.Parent = ActionGui_upvr.RightListFrame
		tbl_2_upvr.frame = clone_10
		local clone_9_upvr = Instances_upvr.TouchButton:Clone()
		clone_9_upvr.ActionText.Text = arg3.buttonText or ""
		clone_9_upvr.ActionIcon.Image = arg3.buttonImage or ""
		clone_9_upvr.Size = arg3.buttonSize
		clone_9_upvr.Position = arg3.buttonPosition
		clone_9_upvr.Parent = ActionGui_upvr.TouchButtons
		local showAction_2 = arg3.showAction
		if showAction_2 then
			if ._ActionController_InputCategorizer_upvr.getLastInputCategory() ~= ._ActionController_InputCategorizer_upvr.InputCategory.Touch then
				showAction_2 = false
			else
				showAction_2 = true
			end
		end
		clone_9_upvr.Visible = showAction_2
		tbl_2_upvr.button = clone_9_upvr
		local function var42_upvr(...) -- Line 178
			--[[ Upvalues[7]:
				[1]: arg1 (readonly)
				[2]: tbl_2_upvr (readonly)
				[3]: Instances_upvr (copied, readonly)
				[4]: arg3 (readonly)
				[5]: ActionGui_upvr (copied, readonly)
				[6]: clone_9_upvr (readonly)
				[7]: arg2 (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			local var43, var44 = ...
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [131] 87. Error Block 11 start (CF ANALYSIS FAILED)
			tbl_2_upvr.frame.ContentFrame.ActionLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			tbl_2_upvr.frame.ContentFrame.ActionLabel.TextColor3 = Color3.new(0, 0, 0)
			clone_9_upvr.BackgroundColor3 = Color3.new(1, 1, 1)
			-- KONSTANTERROR: [131] 87. Error Block 11 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [171] 115. Error Block 26 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [171] 115. Error Block 26 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [297] 197. Error Block 22 start (CF ANALYSIS FAILED)
			tbl_2_upvr.frame.ContentFrame.ActionLabel.BackgroundColor3 = Color3.new(0, 0, 0)
			tbl_2_upvr.frame.ContentFrame.ActionLabel.TextColor3 = Color3.new(1, 1, 1)
			clone_9_upvr.BackgroundColor3 = Color3.new(0, 0, 0)
			-- KONSTANTERROR: [297] 197. Error Block 22 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [336] 224. Error Block 23 start (CF ANALYSIS FAILED)
			do
				return arg2(...)
			end
			-- KONSTANTERROR: [336] 224. Error Block 23 end (CF ANALYSIS FAILED)
		end
		module_upvr._updateInputDisplay(tbl_2_upvr, ._ActionController_InputCategorizer_upvr.getLastInputCategory())
		table.insert(tbl_2_upvr.connections, clone_9_upvr.InputBegan:Connect(function(arg1_2) -- Line 243
			--[[ Upvalues[2]:
				[1]: var42_upvr (readonly)
				[2]: arg1 (readonly)
			]]
			if arg1_2.UserInputType == Enum.UserInputType.Touch and arg1_2.UserInputState ~= Enum.UserInputState.Change then
				var42_upvr(arg1, Enum.UserInputState.Begin, arg1_2)
			end
		end))
		table.insert(tbl_2_upvr.connections, clone_9_upvr.InputEnded:Connect(function(arg1_3) -- Line 252
			--[[ Upvalues[2]:
				[1]: var42_upvr (readonly)
				[2]: arg1 (readonly)
			]]
			if arg1_3.UserInputType == Enum.UserInputType.Touch then
				var42_upvr(arg1, Enum.UserInputState.End, arg1_3)
			end
		end))
		ContextActionService_upvr:BindActionAtPriority(tbl_2_upvr.actionName, var42_upvr, false, tbl_2_upvr.priority, tbl_2_upvr.keyboardAndMouseInput, tbl_2_upvr.gamepadInput)
		module_upvr._registeredActions[arg1] = tbl_2_upvr
		module_upvr._updateButtonVisibility()
	end
end
function module_upvr.unbindAction(arg1) -- Line 274
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: ContextActionService_upvr (readonly)
	]]
	local var49 = module_upvr._registeredActions[arg1]
	if var49 then
		for _, v_4 in var49.connections do
			v_4:Disconnect()
		end
		var49.frame:Destroy()
		var49.button:Destroy()
		module_upvr._registeredActions[arg1] = nil
		module_upvr._updateButtonVisibility()
	end
	ContextActionService_upvr:UnbindAction(arg1)
end
function module_upvr.isPressed(arg1) -- Line 296
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var50
	if not module_upvr._registeredActions[arg1] then
		warn(debug.traceback(`Action {arg1} is not a registered action!`, 1))
		var50 = false
	else
		var50 = true
	end
	if not var50 then
		var50 = false
		return var50
	end
	var50 = module_upvr._registeredActions[arg1]
	return var50.pressed
end
function module_upvr.setButtonText(arg1, arg2) -- Line 305
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var51
	if not module_upvr._registeredActions[arg1] then
		warn(debug.traceback(`Action {arg1} is not a registered action!`, 1))
		var51 = false
	else
		var51 = true
	end
	if not var51 then
	else
		var51 = module_upvr._registeredActions[arg1]
		var51.actionContext.buttonText = arg2 or ""
		var51.frame.ContentFrame.ActionLabel.Text = var51.actionContext.buttonText
		var51.button.ActionText.Text = var51.actionContext.buttonText
	end
end
function module_upvr._updateInputDisplay(arg1, arg2) -- Line 321
	--[[ Upvalues[2]:
		[1]: ._ActionController_InputCategorizer_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local ButtonDisplayFrame = arg1.frame.ContentFrame.InputFrame:FindFirstChild("ButtonDisplayFrame")
	if ButtonDisplayFrame then
		ButtonDisplayFrame:Destroy()
	end
	local var53
	if arg2 == ._ActionController_InputCategorizer_upvr.InputCategory.KeyboardAndMouse then
		var53 = module_upvr._getButtonDisplayForInput(arg1.keyboardAndMouseInput)
	elseif arg2 == ._ActionController_InputCategorizer_upvr.InputCategory.Gamepad then
		var53 = module_upvr._getButtonDisplayForInput(arg1.gamepadInput)
	elseif arg2 == ._ActionController_InputCategorizer_upvr.InputCategory.Touch then
		var53 = module_upvr._getButtonDisplayForInput(Enum.UserInputType.Touch)
	end
	var53.Parent = arg1.frame.ContentFrame.InputFrame
	if arg2 == ._ActionController_InputCategorizer_upvr.InputCategory.Touch then
		module_upvr._updateButtonVisibility()
	else
		arg1.button.Visible = false
	end
end
local UserInputService_upvr = game:GetService("UserInputService")
local ._ActionController_InputMetadata_upvr = require("./ActionController/InputMetadata")
function module_upvr._getButtonDisplayForInput(arg1) -- Line 349
	--[[ Upvalues[3]:
		[1]: Instances_upvr (readonly)
		[2]: UserInputService_upvr (readonly)
		[3]: ._ActionController_InputMetadata_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local clone_7 = Instances_upvr.ButtonDisplayFrame:Clone()
	local var67
	if arg1.EnumType == Enum.KeyCode then
		var67 = UserInputService_upvr:GetImageForKeyCode(arg1)
	end
	if arg1 == Enum.UserInputType.Touch then
		Instances_upvr.TouchImageLabel:Clone().Parent = clone_7
		do
			return clone_7
		end
		local var68
	end
	if var67 and var67 ~= "" then
		local clone_12 = Instances_upvr.GamepadImageLabel:Clone()
		clone_12.Image = var67
		clone_12.Parent = clone_7
		return clone_7
	end
	var68 = ._ActionController_InputMetadata_upvr
	if var68.MouseButtonImage[arg1] then
		local clone_5 = Instances_upvr.MouseImageLabel:Clone()
		var68 = ._ActionController_InputMetadata_upvr.MouseButtonImage
		clone_5.Image = var68[arg1]
		clone_5.Parent = clone_7
		return clone_7
	end
	Instances_upvr.KeyboardBorderImage:Clone().Parent = clone_7
	var68 = ._ActionController_InputMetadata_upvr.KeyboardButtonImage[arg1]
	if not var68 then
		var68 = ._ActionController_InputMetadata_upvr.KeyboardButtonIconMapping[UserInputService_upvr:GetStringForKeyCode(arg1)]
	end
	if not var68 then
		local var71 = ._ActionController_InputMetadata_upvr.KeyCodeToTextMapping[arg1]
		if var71 then
			local var72 = var71
		end
	end
	if var68 then
		local clone_4 = Instances_upvr.KeyboardImageLabel:Clone()
		clone_4.Image = var68
		clone_4.Parent = clone_7
		return clone_7
	end
	if var72 and var72 ~= "" then
		local clone_6 = Instances_upvr.KeyboardTextLabel:Clone()
		clone_6.Text = var72
		local var75 = ._ActionController_InputMetadata_upvr.KeyCodeToFontSize[arg1]
		if not var75 then
			var75 = ._ActionController_InputMetadata_upvr.DefaultFontSize
		end
		clone_6.TextSize = var75
		clone_6.Parent = clone_7
	end
	return clone_7
end
function module_upvr._updateUIPositionAndScale() -- Line 405
	--[[ Upvalues[3]:
		[1]: PlayerGui_upvr (readonly)
		[2]: ActionGui_upvr (readonly)
		[3]: ._ActionController_InputCategorizer_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 25 start (CF ANALYSIS FAILED)
	local var76
	if PlayerGui_upvr:FindFirstChild("TouchGui") == nil then
		var76 = false
	else
		var76 = true
	end
	if math.min(ActionGui_upvr.AbsoluteSize.X, ActionGui_upvr.AbsoluteSize.Y) >= 500 then
		-- KONSTANTWARNING: GOTO [29] #21
	end
	-- KONSTANTERROR: [0] 1. Error Block 25 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [28] 20. Error Block 27 start (CF ANALYSIS FAILED)
	if var76 and ._ActionController_InputCategorizer_upvr.getLastInputCategory() == ._ActionController_InputCategorizer_upvr.InputCategory.Touch then
		ActionGui_upvr.RightListFrame.Visible = false
	else
		ActionGui_upvr.RightListFrame.Visible = true
	end
	local RightListFrame = ActionGui_upvr.RightListFrame
	if true then
		RightListFrame = 0.85
	else
		RightListFrame = 1
	end
	RightListFrame.UIScale.Scale = RightListFrame
	ActionGui_upvr.RightListFrame.Position = UDim2.new(1, -40, 1, -40)
	-- KONSTANTERROR: [28] 20. Error Block 27 end (CF ANALYSIS FAILED)
end
local RunService_upvr = game:GetService("RunService")
function module_upvr._start() -- Line 424
	--[[ Upvalues[5]:
		[1]: module_upvr (readonly)
		[2]: RunService_upvr (readonly)
		[3]: PlayerGui_upvr (readonly)
		[4]: ._ActionController_InputCategorizer_upvr (readonly)
		[5]: ActionGui_upvr (readonly)
	]]
	assert(not module_upvr._initialized, "ActionController already initialized!")
	assert(RunService_upvr:IsClient(), "ActionController can only be used on the client!")
	PlayerGui_upvr.ChildAdded:Connect(function(arg1) -- Line 429
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		if arg1.Name == "TouchGui" then
			module_upvr._updateUIPositionAndScale()
		end
	end)
	PlayerGui_upvr.ChildRemoved:Connect(function(arg1) -- Line 435
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		if arg1.Name == "TouchGui" then
			module_upvr._updateUIPositionAndScale()
		end
	end)
	._ActionController_InputCategorizer_upvr.lastInputCategoryChanged:Connect(function(arg1) -- Line 442
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		for _, v_5 in module_upvr._registeredActions do
			module_upvr._updateInputDisplay(v_5, arg1)
		end
		module_upvr._updateButtonVisibility()
	end)
	ActionGui_upvr:GetPropertyChangedSignal("AbsoluteSize"):Connect(module_upvr._updateUIPositionAndScale)
	._ActionController_InputCategorizer_upvr.lastInputCategoryChanged:Connect(module_upvr._updateUIPositionAndScale)
	ActionGui_upvr.Parent = PlayerGui_upvr
	module_upvr._initialized = true
end
module_upvr._start()
return module_upvr