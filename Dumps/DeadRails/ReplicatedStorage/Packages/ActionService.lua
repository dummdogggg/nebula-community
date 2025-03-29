--[[
    Script: ReplicatedStorage.Packages.ActionService
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:18
-- Luau version 6, Types version 3
-- Time taken: 0.007934 seconds

local ContextActionService_upvr = game:GetService("ContextActionService")
local UserInputService_upvr = game:GetService("UserInputService")
local InputCategorizer_upvr = require(script.InputCategorizer)
local PlayerGui_upvr = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local Instances_upvr = script.Instances
local ActionGui_upvr = Instances_upvr.ActionGui
local tbl_upvr = {
	KeyboardAndMouse = "KeyboardAndMouse";
	Gamepad = "Gamepad";
	Touch = "Touch";
	Unknown = "Unknown";
}
local module_upvr = {
	InputCategory = tbl_upvr;
	_initialized = false;
	_bindings = {};
}
function module_upvr.bindAction(arg1, arg2, arg3, arg4, arg5) -- Line 34
	--[[ Upvalues[5]:
		[1]: module_upvr (readonly)
		[2]: Instances_upvr (readonly)
		[3]: ActionGui_upvr (readonly)
		[4]: InputCategorizer_upvr (readonly)
		[5]: ContextActionService_upvr (readonly)
	]]
	if module_upvr._bindings[arg1] then
		warn(string.format("'%s' is already bound!", arg1))
	else
		local tbl = {
			connections = {};
		}
		tbl.keyboardAndMouseInput = arg3
		tbl.gamepadInput = arg4
		local clone_2_upvr = Instances_upvr.ActionFrame:Clone()
		clone_2_upvr.ContentFrame.ActionLabel.Text = arg1
		clone_2_upvr.LayoutOrder = arg5 or 0
		clone_2_upvr.Parent = ActionGui_upvr.ListFrame
		tbl.frame = clone_2_upvr
		module_upvr._updateInputDisplay(tbl, InputCategorizer_upvr.getLastInputCategory())
		local function var11_upvr(...) -- Line 63
			--[[ Upvalues[3]:
				[1]: arg1 (readonly)
				[2]: clone_2_upvr (readonly)
				[3]: arg2 (readonly)
			]]
			local var12, var13 = ...
			if var12 == arg1 then
				if var13 == Enum.UserInputState.Begin then
					clone_2_upvr.ContentFrame.ActionLabel.BackgroundColor3 = Color3.new(1, 1, 1)
					clone_2_upvr.ContentFrame.ActionLabel.TextColor3 = Color3.new(0, 0, 0)
				elseif var13 == Enum.UserInputState.End then
					clone_2_upvr.ContentFrame.ActionLabel.BackgroundColor3 = Color3.new(0, 0, 0)
					clone_2_upvr.ContentFrame.ActionLabel.TextColor3 = Color3.new(1, 1, 1)
				end
			end
			arg2(...)
		end
		table.insert(tbl.connections, clone_2_upvr.TouchButton.InputBegan:Connect(function(arg1_2) -- Line 82
			--[[ Upvalues[2]:
				[1]: var11_upvr (readonly)
				[2]: arg1 (readonly)
			]]
			if arg1_2.UserInputType == Enum.UserInputType.Touch then
				var11_upvr(arg1, Enum.UserInputState.Begin, arg1_2)
			end
		end))
		table.insert(tbl.connections, clone_2_upvr.TouchButton.InputEnded:Connect(function(arg1_3) -- Line 91
			--[[ Upvalues[2]:
				[1]: var11_upvr (readonly)
				[2]: arg1 (readonly)
			]]
			if arg1_3.UserInputType == Enum.UserInputType.Touch then
				var11_upvr(arg1, Enum.UserInputState.End, arg1_3)
			end
		end))
		ContextActionService_upvr:BindAction(arg1, var11_upvr, false, arg3, arg4)
		module_upvr._bindings[arg1] = tbl
	end
end
function module_upvr.unbindAction(arg1) -- Line 104
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: ContextActionService_upvr (readonly)
	]]
	local var18 = module_upvr._bindings[arg1]
	if var18 then
		for _, v in var18.connections do
			v:Disconnect()
		end
		var18.frame:Destroy()
		module_upvr._bindings[arg1] = nil
	end
	ContextActionService_upvr:UnbindAction(arg1)
end
function module_upvr._updateInputDisplay(arg1, arg2) -- Line 120
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 25 start (CF ANALYSIS FAILED)
	local ButtonDisplayFrame = arg1.frame.ContentFrame.InputFrame:FindFirstChild("ButtonDisplayFrame")
	local var20
	if ButtonDisplayFrame then
		var20 = ButtonDisplayFrame:Destroy
		var20()
	end
	var20 = nil
	if arg2 == tbl_upvr.KeyboardAndMouse then
		var20 = module_upvr._getButtonDisplayForInput(arg1.keyboardAndMouseInput)
		-- KONSTANTWARNING: GOTO [53] #37
	end
	-- KONSTANTERROR: [0] 1. Error Block 25 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [28] 20. Error Block 26 start (CF ANALYSIS FAILED)
	if arg2 == tbl_upvr.Gamepad then
		var20 = module_upvr._getButtonDisplayForInput(arg1.gamepadInput)
	elseif arg2 == tbl_upvr.Touch then
		var20 = module_upvr._getButtonDisplayForInput(Enum.UserInputType.Touch)
	end
	var20.Parent = arg1.frame.ContentFrame.InputFrame
	local frame = arg1.frame
	if arg2 ~= tbl_upvr.Touch then
		frame = false
	else
		frame = true
	end
	frame.TouchButton.Visible = frame
	-- KONSTANTERROR: [28] 20. Error Block 26 end (CF ANALYSIS FAILED)
end
local InputMetadata_upvr = require(script.InputMetadata)
function module_upvr._getButtonDisplayForInput(arg1) -- Line 143
	--[[ Upvalues[3]:
		[1]: Instances_upvr (readonly)
		[2]: UserInputService_upvr (readonly)
		[3]: InputMetadata_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local clone = Instances_upvr.ButtonDisplayFrame:Clone()
	local var34
	if arg1.EnumType == Enum.KeyCode then
		var34 = UserInputService_upvr:GetImageForKeyCode(arg1)
	end
	if arg1 == Enum.UserInputType.Touch then
		Instances_upvr.TouchImageLabel:Clone().Parent = clone
		do
			return clone
		end
		local var35
	end
	if var34 and var34 ~= "" then
		local clone_7 = Instances_upvr.GamepadImageLabel:Clone()
		clone_7.Image = var34
		clone_7.Parent = clone
		return clone
	end
	var35 = InputMetadata_upvr
	if var35.MouseButtonImage[arg1] then
		local clone_6 = Instances_upvr.MouseImageLabel:Clone()
		var35 = InputMetadata_upvr.MouseButtonImage
		clone_6.Image = var35[arg1]
		clone_6.Parent = clone
		return clone
	end
	Instances_upvr.KeyboardBorderImage:Clone().Parent = clone
	var35 = InputMetadata_upvr.KeyboardButtonImage[arg1]
	if not var35 then
		var35 = InputMetadata_upvr.KeyboardButtonIconMapping[UserInputService_upvr:GetStringForKeyCode(arg1)]
	end
	if not var35 then
		local var38 = InputMetadata_upvr.KeyCodeToTextMapping[arg1]
		if var38 then
			local var39 = var38
		end
	end
	if var35 then
		local clone_4 = Instances_upvr.KeyboardImageLabel:Clone()
		clone_4.Image = var35
		clone_4.Parent = clone
		return clone
	end
	if var39 and var39 ~= "" then
		local clone_11 = Instances_upvr.KeyboardTextLabel:Clone()
		clone_11.Text = var39
		local var42 = InputMetadata_upvr.KeyCodeToFontSize[arg1]
		if not var42 then
			var42 = InputMetadata_upvr.DefaultFontSize
		end
		clone_11.TextSize = var42
		clone_11.Parent = clone
	end
	return clone
end
function module_upvr._getCategoryOfInputType(arg1) -- Line 199
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	if string.find(arg1.Name, "Gamepad") then
		return tbl_upvr.Gamepad
	end
	if arg1 == Enum.UserInputType.Keyboard or string.find(arg1.Name, "Mouse") then
		return tbl_upvr.KeyboardAndMouse
	end
	if arg1 == Enum.UserInputType.Touch then
		return tbl_upvr.Touch
	end
	return tbl_upvr.Unknown
end
function module_upvr._getDefaultInputCategory() -- Line 212
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: tbl_upvr (readonly)
	]]
	if UserInputService_upvr.KeyboardEnabled and UserInputService_upvr.MouseEnabled then
		return tbl_upvr.KeyboardAndMouse
	end
	if UserInputService_upvr.TouchEnabled then
		return tbl_upvr.Touch
	end
	if UserInputService_upvr.GamepadEnabled then
		return tbl_upvr.Gamepad
	end
	return tbl_upvr.Unknown
end
function module_upvr._updatePositionAndScale() -- Line 225
	--[[ Upvalues[4]:
		[1]: PlayerGui_upvr (readonly)
		[2]: ActionGui_upvr (readonly)
		[3]: InputCategorizer_upvr (readonly)
		[4]: tbl_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var46
	if PlayerGui_upvr:FindFirstChild("TouchGui") == nil then
		var46 = false
	else
		var46 = true
	end
	if math.min(ActionGui_upvr.AbsoluteSize.X, ActionGui_upvr.AbsoluteSize.Y) >= 500 then
	else
	end
	if var46 then
		local any_getLastInputCategory_result1 = InputCategorizer_upvr.getLastInputCategory()
		if any_getLastInputCategory_result1 == tbl_upvr.Touch then
			if true then
				any_getLastInputCategory_result1 = 70
			else
				any_getLastInputCategory_result1 = 210
			end
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if true then
	else
	end
	ActionGui_upvr.ListFrame.UIScale.Scale = 1
	ActionGui_upvr.ListFrame.Position = UDim2.new(1, -40, 1, -(40 + any_getLastInputCategory_result1))
end
local RunService_upvr = game:GetService("RunService")
function module_upvr._initialize() -- Line 243
	--[[ Upvalues[5]:
		[1]: module_upvr (readonly)
		[2]: RunService_upvr (readonly)
		[3]: PlayerGui_upvr (readonly)
		[4]: InputCategorizer_upvr (readonly)
		[5]: ActionGui_upvr (readonly)
	]]
	assert(not module_upvr._initialized, "ActionManager already initialized!")
	assert(RunService_upvr:IsClient(), "ActionManager can only be used on the client!")
	PlayerGui_upvr.ChildAdded:Connect(function(arg1) -- Line 248
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		if arg1.Name == "TouchGui" then
			module_upvr._updatePositionAndScale()
		end
	end)
	PlayerGui_upvr.ChildRemoved:Connect(function(arg1) -- Line 254
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		if arg1.Name == "TouchGui" then
			module_upvr._updatePositionAndScale()
		end
	end)
	InputCategorizer_upvr.lastInputCategoryChanged:Connect(function(arg1) -- Line 261
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		for _, v_2 in module_upvr._bindings do
			module_upvr._updateInputDisplay(v_2, arg1)
		end
	end)
	ActionGui_upvr:GetPropertyChangedSignal("AbsoluteSize"):Connect(module_upvr._updatePositionAndScale)
	InputCategorizer_upvr.lastInputCategoryChanged:Connect(module_upvr._updatePositionAndScale)
	ActionGui_upvr.Parent = PlayerGui_upvr
	module_upvr._updatePositionAndScale()
	module_upvr._initialized = true
end
module_upvr._initialize()
return module_upvr