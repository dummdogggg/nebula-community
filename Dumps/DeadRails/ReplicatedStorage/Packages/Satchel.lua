--[[
    Script: ReplicatedStorage.Packages.Satchel
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:47
-- Luau version 6, Types version 3
-- Time taken: 0.076242 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local ContextActionService_upvr = game:GetService("ContextActionService")
local UserInputService_upvr = game:GetService("UserInputService")
local StarterGui_upvr = game:GetService("StarterGui")
local GuiService_upvr = game:GetService("GuiService")
local VRService_upvr = game:GetService("VRService")
local Players = game:GetService("Players")
local module_upvr = {
	OpenClose = nil;
	IsOpen = false;
	StateChanged = Instance.new("BindableEvent");
	ModuleName = "Backpack";
	KeepVRTopbarOpen = true;
	VRIsExclusive = true;
	VRClosesNonExclusive = true;
	BackpackEmpty = Instance.new("BindableEvent");
}
module_upvr.BackpackEmpty.Name = "BackpackEmpty"
module_upvr.BackpackItemAdded = Instance.new("BindableEvent")
module_upvr.BackpackItemAdded.Name = "BackpackAdded"
module_upvr.BackpackItemRemoved = Instance.new("BindableEvent")
module_upvr.BackpackItemRemoved.Name = "BackpackRemoved"
local script = script
local var13 = GuiService_upvr.PreferredTransparency or 1
local var14_upvr = script:GetAttribute("BackgroundTransparency") or 0.3
local var15_upvw = var14_upvr * var13
local var16_upvw
if not script:GetAttribute("CornerRadius") then
	local udim = UDim.new(0, 8)
end
local BackgroundColor3_upvr_2 = script:GetAttribute("BackgroundColor3")
if not BackgroundColor3_upvr_2 then
	BackgroundColor3_upvr_2 = Color3.new(0.09803921568627451, 0.10588235294117647, 0.11372549019607843)
end
local EquipBorderColor3_upvr = script:GetAttribute("EquipBorderColor3")
if not EquipBorderColor3_upvr then
	EquipBorderColor3_upvr = Color3.new(0, 0.6352941176470588, 1)
end
local var20_upvr = script:GetAttribute("BackgroundTransparency") or 0.3
local var21_upvw = var20_upvr * var13
local CornerRadius_upvr = script:GetAttribute("CornerRadius")
if not CornerRadius_upvr then
	CornerRadius_upvr = UDim.new(0, 8)
end
local var23_upvr = CornerRadius_upvr - UDim.new(0, 5)
if not var23_upvr then
	var23_upvr = UDim.new(0, 3)
end
local BackgroundColor3_upvr = script:GetAttribute("BackgroundColor3")
if not BackgroundColor3_upvr then
	BackgroundColor3_upvr = Color3.new(0.09803921568627451, 0.10588235294117647, 0.11372549019607843)
end
local TextColor3_upvr = script:GetAttribute("TextColor3")
if not TextColor3_upvr then
	TextColor3_upvr = Color3.new(1, 1, 1)
end
local var26_upvr = script:GetAttribute("TextStrokeTransparency") or 0.5
local TextStrokeColor3_upvr = script:GetAttribute("TextStrokeColor3")
if not TextStrokeColor3_upvr then
	TextStrokeColor3_upvr = Color3.new(0, 0, 0)
end
local var28_upvw = var13 * 0.2
local var29 = CornerRadius_upvr - UDim.new(0, 5)
if not var29 then
	var29 = UDim.new(0, 3)
end
local FontFace_upvr = script:GetAttribute("FontFace")
if not FontFace_upvr then
	FontFace_upvr = Font.new("rbxasset://fonts/families/BuilderSans.json")
end
local var31_upvw = script:GetAttribute("TextSize") or 16
local Value_upvr = Enum.KeyCode.Backspace.Value
local var33_upvw = 60
local tbl_4_upvr = {
	[Enum.UserInputType.MouseButton1] = true;
	[Enum.UserInputType.MouseButton2] = true;
	[Enum.UserInputType.MouseButton3] = true;
	[Enum.UserInputType.MouseMovement] = true;
	[Enum.UserInputType.MouseWheel] = true;
}
local tbl_3_upvr = {
	[Enum.UserInputType.Gamepad1] = true;
	[Enum.UserInputType.Gamepad2] = true;
	[Enum.UserInputType.Gamepad3] = true;
	[Enum.UserInputType.Gamepad4] = true;
	[Enum.UserInputType.Gamepad5] = true;
	[Enum.UserInputType.Gamepad6] = true;
	[Enum.UserInputType.Gamepad7] = true;
	[Enum.UserInputType.Gamepad8] = true;
}
local var36_upvw = true
local any_setOrder_result1_upvr = require(script.Packages:WaitForChild("topbarplus")).new():setName("Inventory"):setImage("rbxasset://textures/ui/TopBar/inventoryOn.png", "Selected"):setImage("rbxasset://textures/ui/TopBar/inventoryOff.png", "Deselected"):setImageScale(1):setCaption("Inventory"):bindToggleKey(Enum.KeyCode.Backquote):autoDeselect(false):setOrder(-1)
any_setOrder_result1_upvr.toggled:Connect(function() -- Line 170
	--[[ Upvalues[2]:
		[1]: GuiService_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	if not GuiService_upvr.MenuIsOpen then
		module_upvr.OpenClose()
	end
end)
local ScreenGui_upvr = Instance.new("ScreenGui")
ScreenGui_upvr.DisplayOrder = 120
ScreenGui_upvr.IgnoreGuiInset = true
ScreenGui_upvr.ResetOnSpawn = false
ScreenGui_upvr.Name = "BackpackGui"
ScreenGui_upvr.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
local any_IsTenFootInterface_result1_upvr = GuiService_upvr:IsTenFootInterface()
if any_IsTenFootInterface_result1_upvr then
	var33_upvw = 100
	var31_upvw = 24
end
local var41_upvw = false
local TouchEnabled = UserInputService_upvr.TouchEnabled
if TouchEnabled then
	if workspace.CurrentCamera.ViewportSize.X >= 1024 then
		TouchEnabled = false
	else
		TouchEnabled = true
	end
end
local LocalPlayer_upvw = Players.LocalPlayer
local var44_upvw
local var45_upvw
local var46_upvw
local var47_upvw
local var48_upvw
local var49_upvw
var16_upvw = LocalPlayer_upvw.Character
if not var16_upvw then
	var16_upvw = LocalPlayer_upvw.CharacterAdded:Wait()
end
local Humanoid_upvw = var16_upvw:WaitForChild("Humanoid")
local Backpack_upvw = LocalPlayer_upvw:WaitForChild("Backpack")
local tbl_5_upvr = {}
local var53_upvw
local tbl_2_upvr = {}
local tbl_10_upvr = {}
local tbl_9_upvr = {}
local var57_upvw = 0
local var58_upvw
local var59_upvw = false
local var60_upvw = false
local var61_upvw = false
local var62_upvw = false
local VREnabled_upvr = VRService_upvr.VREnabled
if VREnabled_upvr then
	-- KONSTANTWARNING: GOTO [502] #372
end
if TouchEnabled then
	local _ = 6
else
end
if VREnabled_upvr then
elseif TouchEnabled then
else
end
local var65_upvw
local function _(arg1) -- Line 233, Named "EvaluateBackpackPanelVisibility"
	--[[ Upvalues[3]:
		[1]: any_setOrder_result1_upvr (readonly)
		[2]: var36_upvw (read and write)
		[3]: VRService_upvr (readonly)
	]]
	local var68 = arg1
	if var68 then
		var68 = any_setOrder_result1_upvr.enabled
		if var68 then
			var68 = var36_upvw
			if var68 then
				var68 = VRService_upvr.VREnabled
			end
		end
	end
	return var68
end
local function _() -- Line 237, Named "ShowVRBackpackPopup"
end
local var69_upvr = 10
local function _() -- Line 243, Named "FindLowestEmpty"
	--[[ Upvalues[2]:
		[1]: var69_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
	]]
	for i = 1, var69_upvr do
		local var71 = tbl_5_upvr[i]
		if not var71.Tool then
			return var71
		end
	end
	return nil
end
function module_upvr.IsInventoryEmpty() -- Line 253, Named "isInventoryEmpty"
	--[[ Upvalues[2]:
		[1]: var69_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
	]]
	for i_2 = var69_upvr + 1, #tbl_5_upvr do
		local var73 = tbl_5_upvr[i_2]
		if var73 and var73.Tool then
			return false
		end
	end
	return true
end
local function _() -- Line 265, Named "UseGazeSelection"
	return false
end
local function AdjustHotbarFrames_upvr() -- Line 269, Named "AdjustHotbarFrames"
	--[[ Upvalues[4]:
		[1]: var46_upvw (read and write)
		[2]: var69_upvr (readonly)
		[3]: var57_upvw (read and write)
		[4]: tbl_5_upvr (readonly)
	]]
	local Visible = var46_upvw.Visible
	local var77
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var77 = var69_upvr
		return var77
	end
	if not Visible or not INLINED() then
		var77 = var57_upvw
	end
	for i_3 = 1, var69_upvr do
		local var78 = tbl_5_upvr[i_3]
		if var78.Tool or Visible then
			var78:Readjust(0 + 1, var77)
			var78.Frame.Visible = true
		else
			var78.Frame.Visible = false
		end
	end
end
local function UpdateScrollingFrameCanvasSize_upvr() -- Line 286, Named "UpdateScrollingFrameCanvasSize"
	--[[ Upvalues[3]:
		[1]: var48_upvw (read and write)
		[2]: var33_upvw (read and write)
		[3]: var49_upvw (read and write)
	]]
	var48_upvw.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#var49_upvw:GetChildren() - 1) / math.floor(var48_upvw.AbsoluteSize.X / (var33_upvw + 5))) * (var33_upvw + 5) + 5)
end
local function AdjustInventoryFrames_upvr() -- Line 293, Named "AdjustInventoryFrames"
	--[[ Upvalues[3]:
		[1]: var69_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
		[3]: UpdateScrollingFrameCanvasSize_upvr (readonly)
	]]
	for i_4 = var69_upvr + 1, #tbl_5_upvr do
		local var81 = tbl_5_upvr[i_4]
		local Index = var81.Index
		var81.Frame.LayoutOrder = Index
		if var81.Tool == nil then
			Index = false
		else
			Index = true
		end
		var81.Frame.Visible = Index
	end
	UpdateScrollingFrameCanvasSize_upvr()
end
local const_number_upvr = 4
local function _(arg1, arg2, arg3) -- Line 336, Named "Clamp"
	return math.min(arg2, math.max(arg1, arg3))
end
local function _(arg1, arg2, arg3) -- Line 340, Named "CheckBounds"
	local AbsolutePosition = arg1.AbsolutePosition
	local AbsoluteSize_4 = arg1.AbsoluteSize
	local var90 = false
	if AbsolutePosition.X < arg2 then
		var90 = false
		if arg2 <= AbsolutePosition.X + AbsoluteSize_4.X then
			var90 = false
			if AbsolutePosition.Y < arg3 then
				if arg3 > AbsolutePosition.Y + AbsoluteSize_4.Y then
					var90 = false
				else
					var90 = true
				end
			end
		end
	end
	return var90
end
local function _(arg1, arg2) -- Line 346, Named "GetOffset"
	return (arg1.AbsolutePosition + arg1.AbsoluteSize / 2 - arg2).Magnitude
end
local function _() -- Line 351, Named "DisableActiveHopper"
	--[[ Upvalues[2]:
		[1]: var58_upvw (read and write)
		[2]: tbl_2_upvr (readonly)
	]]
	var58_upvw:ToggleSelect()
	tbl_2_upvr[var58_upvw]:UpdateEquipView()
	var58_upvw = nil
end
local function _() -- Line 357, Named "UnequipAllTools"
	--[[ Upvalues[3]:
		[1]: Humanoid_upvw (read and write)
		[2]: var58_upvw (read and write)
		[3]: tbl_2_upvr (readonly)
	]]
	if Humanoid_upvw then
		Humanoid_upvw:UnequipTools()
		if var58_upvw then
			var58_upvw:ToggleSelect()
			tbl_2_upvr[var58_upvw]:UpdateEquipView()
			var58_upvw = nil
		end
	end
end
local function _(arg1) -- Line 366, Named "EquipNewTool"
	--[[ Upvalues[3]:
		[1]: Humanoid_upvw (read and write)
		[2]: var58_upvw (read and write)
		[3]: tbl_2_upvr (readonly)
	]]
	if Humanoid_upvw then
		Humanoid_upvw:UnequipTools()
		if var58_upvw then
			var58_upvw:ToggleSelect()
			tbl_2_upvr[var58_upvw]:UpdateEquipView()
			var58_upvw = nil
		end
	end
	Humanoid_upvw:EquipTool(arg1)
end
local function IsEquipped(arg1) -- Line 372
	--[[ Upvalues[1]:
		[1]: var16_upvw (read and write)
	]]
	local var91 = arg1
	if var91 then
		if arg1.Parent ~= var16_upvw then
			var91 = false
		else
			var91 = true
		end
	end
	return var91
end
local var335_upvw
local var93_upvr = script:GetAttribute("EquipBorderSizePixel") or 5
local var94_upvr = not script:GetAttribute("OutlineEquipBorder") or false
local Color3_new_result1_upvr = Color3.new(1, 1, 1)
local InsetIconPadding_upvr = script:GetAttribute("InsetIconPadding")
local Value_upvr_2 = Enum.KeyCode.Zero.Value
local function MakeSlot_upvr(arg1, arg2) -- Line 377, Named "MakeSlot"
	--[[ Upvalues[42]:
		[1]: tbl_5_upvr (readonly)
		[2]: var21_upvw (read and write)
		[3]: var45_upvw (read and write)
		[4]: var33_upvw (read and write)
		[5]: var69_upvr (readonly)
		[6]: var46_upvw (read and write)
		[7]: UserInputService_upvr (readonly)
		[8]: var57_upvw (read and write)
		[9]: var59_upvw (read and write)
		[10]: var41_upvw (read and write)
		[11]: ContextActionService_upvr (readonly)
		[12]: var335_upvw (read and write)
		[13]: tbl_2_upvr (readonly)
		[14]: var53_upvw (read and write)
		[15]: var16_upvw (read and write)
		[16]: var65_upvw (read and write)
		[17]: var93_upvr (readonly)
		[18]: EquipBorderColor3_upvr (readonly)
		[19]: var94_upvr (readonly)
		[20]: UpdateScrollingFrameCanvasSize_upvr (readonly)
		[21]: Humanoid_upvw (read and write)
		[22]: var58_upvw (read and write)
		[23]: Backpack_upvw (read and write)
		[24]: BackgroundColor3_upvr_2 (readonly)
		[25]: Color3_new_result1_upvr (readonly)
		[26]: CornerRadius_upvr (readonly)
		[27]: InsetIconPadding_upvr (readonly)
		[28]: TextColor3_upvr (readonly)
		[29]: var26_upvr (readonly)
		[30]: TextStrokeColor3_upvr (readonly)
		[31]: FontFace_upvr (readonly)
		[32]: var31_upvw (read and write)
		[33]: BackgroundColor3_upvr (readonly)
		[34]: var23_upvr (readonly)
		[35]: MakeSlot_upvr (readonly)
		[36]: var49_upvw (read and write)
		[37]: var61_upvw (read and write)
		[38]: tbl_10_upvr (readonly)
		[39]: Value_upvr_2 (readonly)
		[40]: tbl_9_upvr (readonly)
		[41]: any_setOrder_result1_upvr (readonly)
		[42]: var48_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var193 = arg2
	if not var193 then
		var193 = #tbl_5_upvr + 1
	end
	local module_upvr_3 = {
		Tool = nil;
		Index = var193;
		Frame = nil;
	}
	local var195_upvw
	local var196_upvw
	local var197_upvw
	local var198_upvw
	local var199_upvw
	local var200_upvw
	local function _() -- Line 402, Named "UpdateSlotFading"
		--[[ Upvalues[2]:
			[1]: var195_upvw (read and write)
			[2]: var21_upvw (copied, read and write)
		]]
		local var201
		var195_upvw.SelectionImageObject = var201
		if var195_upvw.Draggable then
			var201 = 0
		else
			var201 = var21_upvw
		end
		var195_upvw.BackgroundTransparency = var201
	end
	function module_upvr_3.Readjust(arg1_20, arg2_11, arg3) -- Line 408
		--[[ Upvalues[3]:
			[1]: var45_upvw (copied, read and write)
			[2]: var33_upvw (copied, read and write)
			[3]: var195_upvw (read and write)
		]]
		var195_upvw.Position = UDim2.new(0, var45_upvw.Size.X.Offset / 2 - var33_upvw / 2 + (var33_upvw + 5) * ((arg2_11) - (arg3 / 2 + 0.5)), 0, 5)
	end
	function module_upvr_3.Fill(arg1_21, arg2_12) -- Line 418
		--[[ Upvalues[16]:
			[1]: var197_upvw (read and write)
			[2]: var198_upvw (read and write)
			[3]: var200_upvw (read and write)
			[4]: var199_upvw (read and write)
			[5]: var69_upvr (copied, readonly)
			[6]: var46_upvw (copied, read and write)
			[7]: UserInputService_upvr (copied, readonly)
			[8]: var195_upvw (read and write)
			[9]: var57_upvw (copied, read and write)
			[10]: var59_upvw (copied, read and write)
			[11]: var41_upvw (copied, read and write)
			[12]: ContextActionService_upvr (copied, readonly)
			[13]: var335_upvw (copied, read and write)
			[14]: tbl_2_upvr (copied, readonly)
			[15]: var53_upvw (copied, read and write)
			[16]: tbl_5_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 37 start (CF ANALYSIS FAILED)
		if not arg2_12 then
			return arg1_21:Clear()
		end
		arg1_21.Tool = arg2_12
		local function assignToolData_upvr() -- Line 427, Named "assignToolData"
			--[[ Upvalues[4]:
				[1]: arg2_12 (readonly)
				[2]: var197_upvw (copied, read and write)
				[3]: var198_upvw (copied, read and write)
				[4]: var200_upvw (copied, read and write)
			]]
			local TextureId = arg2_12.TextureId
			var197_upvw.Image = TextureId
			if TextureId ~= "" then
				var198_upvw.Visible = false
			else
				var198_upvw.Visible = true
			end
			var198_upvw.Text = arg2_12.Name
			if var200_upvw and arg2_12:IsA("Tool") then
				var200_upvw.Text = arg2_12.ToolTip
				var200_upvw.Size = UDim2.new(0, 0, 0, 16)
				var200_upvw.Position = UDim2.new(0.5, 0, 0, -5)
			end
		end
		assignToolData_upvr()
		if var199_upvw then
			var199_upvw:Disconnect()
			var199_upvw = nil
		end
		local any_Connect_result1_3 = arg2_12.Changed:Connect(function(arg1_22) -- Line 456
			--[[ Upvalues[1]:
				[1]: assignToolData_upvr (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [2] 2. Error Block 2 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [2] 2. Error Block 2 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [6] 4. Error Block 7 start (CF ANALYSIS FAILED)
			assignToolData_upvr()
			-- KONSTANTERROR: [6] 4. Error Block 7 end (CF ANALYSIS FAILED)
		end)
		var199_upvw = any_Connect_result1_3
		if arg1_21.Index > var69_upvr then
			any_Connect_result1_3 = false
		else
			any_Connect_result1_3 = true
		end
		if not any_Connect_result1_3 or var46_upvw.Visible then
			if not UserInputService_upvr.VREnabled then
				var195_upvw.Draggable = true
			end
		end
		arg1_21:UpdateEquipView()
		if any_Connect_result1_3 then
			var57_upvw += 1
			if var59_upvw and 1 <= var57_upvw and not var41_upvw then
				var41_upvw = true
				ContextActionService_upvr:BindAction("BackpackHotbarEquip", var335_upvw, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		tbl_2_upvr[arg2_12] = arg1_21
		local _ = 1
		-- KONSTANTERROR: [0] 1. Error Block 37 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [91] 76. Error Block 22 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [91] 76. Error Block 22 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [84] 70. Error Block 33 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not Enum.KeyCode.ButtonL1 then
			-- KONSTANTWARNING: GOTO [93] #78
		end
		-- KONSTANTERROR: [84] 70. Error Block 33 end (CF ANALYSIS FAILED)
	end
	function module_upvr_3.Clear(arg1_23) -- Line 492
		--[[ Upvalues[12]:
			[1]: var199_upvw (read and write)
			[2]: var197_upvw (read and write)
			[3]: var198_upvw (read and write)
			[4]: var200_upvw (read and write)
			[5]: var195_upvw (read and write)
			[6]: var69_upvr (copied, readonly)
			[7]: var57_upvw (copied, read and write)
			[8]: var41_upvw (copied, read and write)
			[9]: ContextActionService_upvr (copied, readonly)
			[10]: tbl_2_upvr (copied, readonly)
			[11]: var53_upvw (copied, read and write)
			[12]: tbl_5_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 21 start (CF ANALYSIS FAILED)
		if not arg1_23.Tool then return end
		if var199_upvw then
			var199_upvw:Disconnect()
			var199_upvw = nil
		end
		var197_upvw.Image = ""
		var198_upvw.Text = ""
		if var200_upvw then
			var200_upvw.Text = ""
			var200_upvw.Visible = false
		end
		var195_upvw.Draggable = false
		arg1_23:UpdateEquipView(true)
		if arg1_23.Index <= var69_upvr then
			var57_upvw -= 1
			if var57_upvw < 1 then
				var41_upvw = false
				ContextActionService_upvr:UnbindAction("BackpackHotbarEquip")
			end
		end
		tbl_2_upvr[arg1_23.Tool] = nil
		arg1_23.Tool = nil
		local _ = 1
		-- KONSTANTERROR: [0] 1. Error Block 21 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [76] 62. Error Block 13 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [76] 62. Error Block 13 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [69] 56. Error Block 23 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [76.6]
		if not nil then
			-- KONSTANTWARNING: GOTO [78] #64
		end
		-- KONSTANTERROR: [69] 56. Error Block 23 end (CF ANALYSIS FAILED)
	end
	local var207_upvw
	function module_upvr_3.UpdateEquipView(arg1_24, arg2_13) -- Line 527
		--[[ Upvalues[10]:
			[1]: var16_upvw (copied, read and write)
			[2]: var65_upvw (copied, read and write)
			[3]: module_upvr_3 (readonly)
			[4]: var207_upvw (read and write)
			[5]: var93_upvr (copied, readonly)
			[6]: EquipBorderColor3_upvr (copied, readonly)
			[7]: var94_upvr (copied, readonly)
			[8]: var197_upvw (read and write)
			[9]: var195_upvw (read and write)
			[10]: var21_upvw (copied, read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [2] 3. Error Block 33 start (CF ANALYSIS FAILED)
		local Tool_13 = arg1_24.Tool
		local var209 = Tool_13
		if var209 then
			if Tool_13.Parent ~= var16_upvw then
				var209 = false
			else
				var209 = true
			end
		end
		if var209 then
			var65_upvw = module_upvr_3
			if not var207_upvw then
				var207_upvw = Instance.new("UIStroke")
				var207_upvw.Name = "Border"
				var207_upvw.Thickness = var93_upvr
				var207_upvw.Color = EquipBorderColor3_upvr
				var207_upvw.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			end
			if var94_upvr == true then
				var207_upvw.Parent = var197_upvw
			else
				var207_upvw.Parent = var195_upvw
			end
		else
			-- KONSTANTERROR: [53] 42. Error Block 30 start (CF ANALYSIS FAILED)
			if var207_upvw then
				var207_upvw.Parent = nil
			end
			-- KONSTANTERROR: [53] 42. Error Block 30 end (CF ANALYSIS FAILED)
		end
		local var210
		var195_upvw.SelectionImageObject = var210
		if var195_upvw.Draggable then
			var210 = 0
		else
			var210 = var21_upvw
		end
		var195_upvw.BackgroundTransparency = var210
		-- KONSTANTERROR: [2] 3. Error Block 33 end (CF ANALYSIS FAILED)
	end
	function module_upvr_3.IsEquipped(arg1_25) -- Line 551
		--[[ Upvalues[1]:
			[1]: var16_upvw (copied, read and write)
		]]
		local Tool = arg1_25.Tool
		local var212 = Tool
		if var212 then
			if Tool.Parent ~= var16_upvw then
				var212 = false
			else
				var212 = true
			end
		end
		return var212
	end
	function module_upvr_3.Delete(arg1_26) -- Line 555
		--[[ Upvalues[3]:
			[1]: var195_upvw (read and write)
			[2]: tbl_5_upvr (copied, readonly)
			[3]: UpdateScrollingFrameCanvasSize_upvr (copied, readonly)
		]]
		var195_upvw:Destroy()
		table.remove(tbl_5_upvr, arg1_26.Index)
		for i_5 = arg1_26.Index, #tbl_5_upvr do
			tbl_5_upvr[i_5]:SlideBack()
		end
		UpdateScrollingFrameCanvasSize_upvr()
	end
	function module_upvr_3.Swap(arg1_27, arg2_14) -- Line 568
		local Tool_6 = arg1_27.Tool
		local Tool_3 = arg2_14.Tool
		arg1_27:Clear()
		if Tool_3 then
			arg2_14:Clear()
			arg1_27:Fill(Tool_3)
		end
		if Tool_6 then
			arg2_14:Fill(Tool_6)
		else
			arg2_14:Clear()
		end
	end
	function module_upvr_3.SlideBack(arg1_28) -- Line 582
		--[[ Upvalues[1]:
			[1]: var195_upvw (read and write)
		]]
		arg1_28.Index -= 1
		var195_upvw.Name = arg1_28.Index
		var195_upvw.LayoutOrder = arg1_28.Index
	end
	local var216_upvw
	function module_upvr_3.TurnNumber(arg1_29, arg2_15) -- Line 588
		--[[ Upvalues[1]:
			[1]: var216_upvw (read and write)
		]]
		if var216_upvw then
			var216_upvw.Visible = arg2_15
		end
	end
	function module_upvr_3.SetClickability(arg1_30, arg2_16) -- Line 594
		--[[ Upvalues[3]:
			[1]: UserInputService_upvr (copied, readonly)
			[2]: var195_upvw (read and write)
			[3]: var21_upvw (copied, read and write)
		]]
		if arg1_30.Tool then
			if UserInputService_upvr.VREnabled then
				var195_upvw.Draggable = false
			else
				var195_upvw.Draggable = not arg2_16
			end
			local var217
			var195_upvw.SelectionImageObject = var217
			if var195_upvw.Draggable then
				var217 = 0
			else
				var217 = var21_upvw
			end
			var195_upvw.BackgroundTransparency = var217
		end
	end
	function module_upvr_3.CheckTerms(arg1_31, arg2_17) -- Line 605
		--[[ Upvalues[2]:
			[1]: var198_upvw (read and write)
			[2]: var200_upvw (read and write)
		]]
		local var220_upvw = 0
		local function _(arg1_32, arg2_18) -- Line 607, Named "checkEm"
			--[[ Upvalues[1]:
				[1]: var220_upvw (read and write)
			]]
			local _, any_gsub_result2_4 = arg1_32:lower():gsub(arg2_18, "")
			var220_upvw += any_gsub_result2_4
		end
		if arg1_31.Tool then
			for i_6 in pairs(arg2_17) do
				local _, any_gsub_result2_2 = var198_upvw.Text:lower():gsub(i_6, "")
				var220_upvw += any_gsub_result2_2
				local var229
				if var229 then
					local function INLINED_4() -- Internal function, doesn't exist in bytecode
						var229 = var200_upvw.Text
						return var229
					end
					if not var200_upvw or not INLINED_4() then
						var229 = ""
					end
					local _, any_gsub_result2_3 = var229:lower():gsub(i_6, "")
					var220_upvw += any_gsub_result2_3
				end
			end
		end
		return var220_upvw
	end
	function module_upvr_3.Select(arg1_33) -- Line 625
		--[[ Upvalues[6]:
			[1]: module_upvr_3 (readonly)
			[2]: var16_upvw (copied, read and write)
			[3]: Humanoid_upvw (copied, read and write)
			[4]: var58_upvw (copied, read and write)
			[5]: tbl_2_upvr (copied, readonly)
			[6]: Backpack_upvw (copied, read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local Tool_8 = module_upvr_3.Tool
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 12. Error Block 7 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 12. Error Block 7 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [16] 14. Error Block 8 start (CF ANALYSIS FAILED)
		Humanoid_upvw:UnequipTools()
		-- KONSTANTERROR: [16] 14. Error Block 8 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [35] 30. Error Block 19 start (CF ANALYSIS FAILED)
		if Tool_8.Parent == Backpack_upvw then
			if Humanoid_upvw then
				Humanoid_upvw:UnequipTools()
				if var58_upvw then
					var58_upvw:ToggleSelect()
					tbl_2_upvr[var58_upvw]:UpdateEquipView()
					var58_upvw = nil
				end
			end
			Humanoid_upvw:EquipTool(Tool_8)
		end
		-- KONSTANTERROR: [35] 30. Error Block 19 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [65] 54. Error Block 15 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [65] 54. Error Block 15 end (CF ANALYSIS FAILED)
	end
	var195_upvw = Instance.new("TextButton")
	local var233_upvw = var195_upvw
	var233_upvw.Name = tostring(var193)
	var233_upvw.BackgroundColor3 = BackgroundColor3_upvr_2
	var233_upvw.BorderColor3 = Color3_new_result1_upvr
	var233_upvw.Text = ""
	var233_upvw.BorderSizePixel = 0
	var233_upvw.Size = UDim2.new(0, var33_upvw, 0, var33_upvw)
	var233_upvw.Active = true
	var233_upvw.Draggable = false
	var233_upvw.BackgroundTransparency = var21_upvw
	var233_upvw.MouseButton1Click:Connect(function() -- Line 648
		--[[ Upvalues[1]:
			[1]: module_upvr_3 (readonly)
		]]
		changeSlot(module_upvr_3)
	end)
	local UICorner_5 = Instance.new("UICorner")
	UICorner_5.Name = "Corner"
	UICorner_5.CornerRadius = CornerRadius_upvr
	UICorner_5.Parent = var233_upvw
	module_upvr_3.Frame = var233_upvw
	local Frame_5 = Instance.new("Frame")
	Frame_5.Name = "SelectionObjectClipper"
	Frame_5.BackgroundTransparency = 1
	Frame_5.Visible = false
	Frame_5.Parent = var233_upvw
	local ImageLabel_3 = Instance.new("ImageLabel")
	ImageLabel_3.Name = "Selector"
	ImageLabel_3.BackgroundTransparency = 1
	ImageLabel_3.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel_3.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	ImageLabel_3.ScaleType = Enum.ScaleType.Slice
	ImageLabel_3.SliceCenter = Rect.new(12, 12, 52, 52)
	ImageLabel_3.Parent = Frame_5
	var197_upvw = Instance.new("ImageLabel")
	local var238_upvw = var197_upvw
	var238_upvw.BackgroundTransparency = 1
	var238_upvw.Name = "Icon"
	var238_upvw.Size = UDim2.new(1, 0, 1, 0)
	var238_upvw.Position = UDim2.new(0.5, 0, 0.5, 0)
	var238_upvw.AnchorPoint = Vector2.new(0.5, 0.5)
	if InsetIconPadding_upvr == true then
		var238_upvw.Size = UDim2.new(1, -var93_upvr * 2, 1, -var93_upvr * 2)
	else
		var238_upvw.Size = UDim2.new(1, 0, 1, 0)
	end
	var238_upvw.Parent = var233_upvw
	local UICorner = Instance.new("UICorner")
	UICorner.Name = "Corner"
	if InsetIconPadding_upvr == true then
		UICorner.CornerRadius = CornerRadius_upvr - UDim.new(0, var93_upvr)
	else
		UICorner.CornerRadius = CornerRadius_upvr
	end
	UICorner.Parent = var238_upvw
	var198_upvw = Instance.new("TextLabel")
	local var240_upvw = var198_upvw
	var240_upvw.BackgroundTransparency = 1
	var240_upvw.Name = "ToolName"
	var240_upvw.Text = ""
	var240_upvw.TextColor3 = TextColor3_upvr
	var240_upvw.TextStrokeTransparency = var26_upvr
	var240_upvw.TextStrokeColor3 = TextStrokeColor3_upvr
	var240_upvw.FontFace = Font.new(FontFace_upvr.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	var240_upvw.TextSize = var31_upvw
	var240_upvw.Size = UDim2.new(1, -var93_upvr * 2, 1, -var93_upvr * 2)
	var240_upvw.Position = UDim2.new(0.5, 0, 0.5, 0)
	var240_upvw.AnchorPoint = Vector2.new(0.5, 0.5)
	var240_upvw.TextWrapped = true
	var240_upvw.TextTruncate = Enum.TextTruncate.None
	var240_upvw.Parent = var233_upvw
	module_upvr_3.Frame.LayoutOrder = module_upvr_3.Index
	local var241
	local function INLINED_5() -- Internal function, doesn't exist in bytecode
		function module_upvr_3.MoveToInventory(arg1_34) -- Line 756
			--[[ Upvalues[10]:
				[1]: module_upvr_3 (readonly)
				[2]: var69_upvr (copied, readonly)
				[3]: MakeSlot_upvr (copied, readonly)
				[4]: var49_upvw (copied, read and write)
				[5]: var16_upvw (copied, read and write)
				[6]: Humanoid_upvw (copied, read and write)
				[7]: var58_upvw (copied, read and write)
				[8]: tbl_2_upvr (copied, readonly)
				[9]: var61_upvw (copied, read and write)
				[10]: var46_upvw (copied, read and write)
			]]
			if module_upvr_3.Index <= var69_upvr then
				local Tool_10 = module_upvr_3.Tool
				arg1_34:Clear()
				local MakeSlot_upvr_result1_5 = MakeSlot_upvr(var49_upvw)
				MakeSlot_upvr_result1_5:Fill(Tool_10)
				local var249 = Tool_10
				if var249 then
					if Tool_10.Parent ~= var16_upvw then
						var249 = false
					else
						var249 = true
					end
				end
				if var249 then
					if Humanoid_upvw then
						Humanoid_upvw:UnequipTools()
						if var58_upvw then
							var58_upvw:ToggleSelect()
							tbl_2_upvr[var58_upvw]:UpdateEquipView()
							var58_upvw = nil
						end
					end
				end
				if var61_upvw then
					MakeSlot_upvr_result1_5.Frame.Visible = false
					MakeSlot_upvr_result1_5.Parent = var46_upvw
				end
			end
		end
		var233_upvw.MouseLeave:Connect(function() -- Line 752
			--[[ Upvalues[1]:
				[1]: var242_upvw (read and write)
			]]
			var242_upvw.Visible = false
		end)
		var233_upvw.MouseEnter:Connect(function() -- Line 747
			--[[ Upvalues[1]:
				[1]: var242_upvw (read and write)
			]]
			if var242_upvw.Text ~= "" then
				var242_upvw.Visible = true
			end
		end)
		UIPadding.Parent = var242_upvw
		UIPadding.PaddingBottom = UDim.new(0, 4)
		UIPadding.PaddingTop = UDim.new(0, 4)
		UIPadding.PaddingRight = UDim.new(0, 4)
		UIPadding.PaddingLeft = UDim.new(0, 4)
		local UIPadding = Instance.new("UIPadding")
		UICorner_9.Parent = var242_upvw
		UICorner_9.CornerRadius = var23_upvr
		UICorner_9.Name = "Corner"
		local UICorner_9 = Instance.new("UICorner")
		var242_upvw.Parent = var233_upvw
		var242_upvw.AutomaticSize = Enum.AutomaticSize.X
		var242_upvw.Visible = false
		var242_upvw.BorderSizePixel = 0
		var242_upvw.AnchorPoint = Vector2.new(0.5, 1)
		var242_upvw.BackgroundTransparency = var21_upvw
		var242_upvw.BackgroundColor3 = BackgroundColor3_upvr
		var242_upvw.TextYAlignment = Enum.TextYAlignment.Center
		var242_upvw.TextWrapped = false
		var242_upvw.ZIndex = 2
		var242_upvw.TextSize = var31_upvw
		var242_upvw.FontFace = Font.new(FontFace_upvr.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
		var242_upvw.TextStrokeColor3 = TextStrokeColor3_upvr
		var242_upvw.TextStrokeTransparency = var26_upvr
		var242_upvw.TextColor3 = TextColor3_upvr
		var242_upvw.Size = UDim2.new(1, 0, 1, 0)
		var242_upvw.Text = ""
		var242_upvw.Name = "ToolTip"
		local var242_upvw = var200_upvw
		var200_upvw = Instance.new("TextLabel")
		return var193 < 10
	end
	if var193 <= var69_upvr and (INLINED_5() or var193 == var69_upvr) then
		if var193 >= 10 or not var193 then
			local var250 = 0
		end
		var216_upvw = Instance.new("TextLabel")
		local var251_upvw = var216_upvw
		var251_upvw.BackgroundTransparency = 1
		var251_upvw.Name = "Number"
		var251_upvw.TextColor3 = TextColor3_upvr
		var251_upvw.TextStrokeTransparency = var26_upvr
		var251_upvw.TextStrokeColor3 = TextStrokeColor3_upvr
		var251_upvw.TextSize = var31_upvw
		var251_upvw.Text = tostring(var250)
		var251_upvw.FontFace = Font.new(FontFace_upvr.Family, Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
		var251_upvw.Size = UDim2.new(0.4, 0, 0.4, 0)
		var251_upvw.Visible = false
		var251_upvw.Parent = var233_upvw
		tbl_10_upvr[Value_upvr_2 + var250] = module_upvr_3.Select
	end
	local Position_upvw = var233_upvw.Position
	local var253_upvw
	var233_upvw.DragBegin:Connect(function(arg1_35) -- Line 797
		--[[ Upvalues[11]:
			[1]: tbl_9_upvr (copied, readonly)
			[2]: var233_upvw (read and write)
			[3]: Position_upvw (read and write)
			[4]: any_setOrder_result1_upvr (copied, readonly)
			[5]: var238_upvw (read and write)
			[6]: var240_upvw (read and write)
			[7]: var251_upvw (read and write)
			[8]: var253_upvw (read and write)
			[9]: var49_upvw (copied, read and write)
			[10]: var46_upvw (copied, read and write)
			[11]: var196_upvw (read and write)
		]]
		tbl_9_upvr[var233_upvw] = true
		Position_upvw = arg1_35
		var233_upvw.BorderSizePixel = 2
		any_setOrder_result1_upvr:lock()
		var233_upvw.ZIndex = 2
		var238_upvw.ZIndex = 2
		var240_upvw.ZIndex = 2
		var233_upvw.Parent.ZIndex = 2
		if var251_upvw then
			var251_upvw.ZIndex = 2
		end
		var253_upvw = var233_upvw.Parent
		if var253_upvw == var49_upvw then
			var233_upvw.Parent = var46_upvw
			var233_upvw.Position = UDim2.new(0, var233_upvw.AbsolutePosition.X - var46_upvw.AbsolutePosition.X, 0, var233_upvw.AbsolutePosition.Y - var46_upvw.AbsolutePosition.Y)
			var196_upvw = Instance.new("Frame")
			var196_upvw.Name = "FakeSlot"
			var196_upvw.LayoutOrder = var233_upvw.LayoutOrder
			var196_upvw.Size = var233_upvw.Size
			var196_upvw.BackgroundTransparency = 1
			var196_upvw.Parent = var49_upvw
		end
	end)
	local const_number_upvw = 0
	var233_upvw.DragStopped:Connect(function(arg1_36, arg2_19) -- Line 840
		--[[ Upvalues[21]:
			[1]: var196_upvw (read and write)
			[2]: var233_upvw (read and write)
			[3]: Position_upvw (read and write)
			[4]: var253_upvw (read and write)
			[5]: any_setOrder_result1_upvr (copied, readonly)
			[6]: var238_upvw (read and write)
			[7]: var240_upvw (read and write)
			[8]: var251_upvw (read and write)
			[9]: tbl_9_upvr (copied, readonly)
			[10]: module_upvr_3 (readonly)
			[11]: var46_upvw (copied, read and write)
			[12]: var69_upvr (copied, readonly)
			[13]: const_number_upvw (read and write)
			[14]: var53_upvw (copied, read and write)
			[15]: var45_upvw (copied, read and write)
			[16]: tbl_5_upvr (copied, readonly)
			[17]: var16_upvw (copied, read and write)
			[18]: Humanoid_upvw (copied, read and write)
			[19]: var58_upvw (copied, read and write)
			[20]: tbl_2_upvr (copied, readonly)
			[21]: var61_upvw (copied, read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
		var196_upvw:Destroy()
		-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 6. Error Block 3 start (CF ANALYSIS FAILED)
		var233_upvw.Position = Position_upvw
		var233_upvw.Parent = var253_upvw
		var233_upvw.BorderSizePixel = 0
		any_setOrder_result1_upvr:unlock()
		var233_upvw.ZIndex = 1
		var238_upvw.ZIndex = 1
		var240_upvw.ZIndex = 1
		var253_upvw.ZIndex = 1
		-- KONSTANTERROR: [6] 6. Error Block 3 end (CF ANALYSIS FAILED)
	end)
	var233_upvw.Parent = arg1
	tbl_5_upvr[var193] = module_upvr_3
	if var69_upvr < var193 then
		UpdateScrollingFrameCanvasSize_upvr()
		if var46_upvw.Visible and not var61_upvw then
			var48_upvw.CanvasPosition = Vector2.new(0, math.max(0, var48_upvw.CanvasSize.Y.Offset - var48_upvw.AbsoluteSize.Y))
		end
	end
	return module_upvr_3
end
local var257_upvw = false
local function OnChildAdded_upvr(arg1) -- Line 950, Named "OnChildAdded"
	--[[ Upvalues[15]:
		[1]: var16_upvw (read and write)
		[2]: Humanoid_upvw (read and write)
		[3]: var58_upvw (read and write)
		[4]: tbl_2_upvr (readonly)
		[5]: var257_upvw (read and write)
		[6]: LocalPlayer_upvw (read and write)
		[7]: var53_upvw (read and write)
		[8]: MakeSlot_upvr (readonly)
		[9]: var49_upvw (read and write)
		[10]: tbl_5_upvr (readonly)
		[11]: Backpack_upvw (read and write)
		[12]: AdjustHotbarFrames_upvr (readonly)
		[13]: var69_upvr (readonly)
		[14]: var46_upvw (read and write)
		[15]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if not arg1:IsA("Tool") and not arg1:IsA("HopperBin") then
		if arg1:IsA("Humanoid") and arg1.Parent == var16_upvw then
			Humanoid_upvw = arg1
		end
	else
		if arg1.Parent ~= var16_upvw then
		end
		if var58_upvw and arg1.Parent == var16_upvw then
			var58_upvw:ToggleSelect()
			tbl_2_upvr[var58_upvw]:UpdateEquipView()
			var58_upvw = nil
		end
		if not var257_upvw and arg1.Parent == var16_upvw and not tbl_2_upvr[arg1] then
			local StarterGear = LocalPlayer_upvw:FindFirstChild("StarterGear")
			if StarterGear and StarterGear:FindFirstChild(arg1.Name) then
				var257_upvw = true
				local var285 = var53_upvw
				if not var285 then
					var285 = MakeSlot_upvr(var49_upvw)
				end
				for i_23 = var285.Index, 1, -1 do
					local var286 = i_23 - 1
					if 0 < var286 then
						tbl_5_upvr[var286]:Swap(tbl_5_upvr[i_23])
					else
						tbl_5_upvr[i_23]:Fill(arg1)
					end
				end
				for _, v_7 in pairs(var16_upvw:GetChildren()) do
					if v_7:IsA("Tool") and v_7 ~= arg1 then
						v_7.Parent = Backpack_upvw
					end
				end
				AdjustHotbarFrames_upvr()
				return
			end
		end
		if tbl_2_upvr[arg1] then
			tbl_2_upvr[arg1]:UpdateEquipView()
		else
			local var290 = var53_upvw
			if not var290 then
			end
			local MakeSlot_upvr_result1 = MakeSlot_upvr(var49_upvw)
			MakeSlot_upvr_result1:Fill(arg1)
			if MakeSlot_upvr_result1.Index <= var69_upvr then
				if not var46_upvw.Visible then
					AdjustHotbarFrames_upvr()
				end
			end
			if arg1:IsA("HopperBin") then
				if arg1.Active then
					if Humanoid_upvw then
						Humanoid_upvw:UnequipTools()
						if var58_upvw then
							var58_upvw:ToggleSelect()
							tbl_2_upvr[var58_upvw]:UpdateEquipView()
							var58_upvw = nil
						end
					end
					var58_upvw = arg1
				end
			end
		end
		module_upvr.BackpackItemAdded:Fire()
	end
end
local function OnChildRemoved_upvr(arg1) -- Line 1017, Named "OnChildRemoved"
	--[[ Upvalues[9]:
		[1]: var16_upvw (read and write)
		[2]: Backpack_upvw (read and write)
		[3]: tbl_2_upvr (readonly)
		[4]: var69_upvr (readonly)
		[5]: var46_upvw (read and write)
		[6]: AdjustHotbarFrames_upvr (readonly)
		[7]: var58_upvw (read and write)
		[8]: module_upvr (readonly)
		[9]: tbl_5_upvr (readonly)
	]]
	if not arg1:IsA("Tool") and not arg1:IsA("HopperBin") then
	else
		local Parent = arg1.Parent
		if Parent == var16_upvw or Parent == Backpack_upvw then return end
		local var297 = tbl_2_upvr[arg1]
		if var297 then
			var297:Clear()
			if var69_upvr < var297.Index then
				var297:Delete()
			elseif not var46_upvw.Visible then
				AdjustHotbarFrames_upvr()
			end
		end
		if arg1 == var58_upvw then
			var58_upvw = nil
		end
		module_upvr.BackpackItemRemoved:Fire()
		for i_25 = var69_upvr + 1, #tbl_5_upvr do
			local var298 = tbl_5_upvr[i_25]
			if var298 then
				if var298.Tool then
					-- KONSTANTWARNING: GOTO [68] #55
				end
			end
		end
		if true then
			module_upvr.BackpackEmpty:Fire()
		end
	end
end
local tbl_6_upvw = {}
local function OnCharacterAdded(arg1) -- Line 1051
	--[[ Upvalues[10]:
		[1]: tbl_5_upvr (readonly)
		[2]: var69_upvr (readonly)
		[3]: var58_upvw (read and write)
		[4]: tbl_6_upvw (read and write)
		[5]: var16_upvw (read and write)
		[6]: OnChildRemoved_upvr (readonly)
		[7]: OnChildAdded_upvr (readonly)
		[8]: Backpack_upvw (read and write)
		[9]: LocalPlayer_upvw (read and write)
		[10]: AdjustHotbarFrames_upvr (readonly)
	]]
	for i_7 = #tbl_5_upvr, 1, -1 do
		local var307 = tbl_5_upvr[i_7]
		if var307.Tool then
			var307:Clear()
		end
		if var69_upvr < i_7 then
			var307:Delete()
		end
	end
	var58_upvw = nil
	for _, v in pairs(tbl_6_upvw) do
		v:Disconnect()
	end
	tbl_6_upvw = {}
	var16_upvw = arg1
	table.insert(tbl_6_upvw, arg1.ChildRemoved:Connect(OnChildRemoved_upvr))
	table.insert(tbl_6_upvw, arg1.ChildAdded:Connect(OnChildAdded_upvr))
	for _, v_2 in pairs(arg1:GetChildren()) do
		OnChildAdded_upvr(v_2)
	end
	Backpack_upvw = LocalPlayer_upvw:WaitForChild("Backpack")
	table.insert(tbl_6_upvw, Backpack_upvw.ChildRemoved:Connect(OnChildRemoved_upvr))
	table.insert(tbl_6_upvw, Backpack_upvw.ChildAdded:Connect(OnChildAdded_upvr))
	for _, v_3 in pairs(Backpack_upvw:GetChildren()) do
		OnChildAdded_upvr(v_3)
	end
	AdjustHotbarFrames_upvr()
end
local TextChatService_upvr = game:GetService("TextChatService")
local function OnUISChanged() -- Line 1116
	--[[ Upvalues[5]:
		[1]: UserInputService_upvr (readonly)
		[2]: var69_upvr (readonly)
		[3]: tbl_5_upvr (readonly)
		[4]: tbl_4_upvr (readonly)
		[5]: tbl_3_upvr (readonly)
	]]
	if UserInputService_upvr:GetLastInputType() == Enum.UserInputType.Touch then
		for i_11 = 1, var69_upvr do
			tbl_5_upvr[i_11]:TurnNumber(false)
		end
	else
		if UserInputService_upvr:GetLastInputType() == Enum.UserInputType.Keyboard then
			for i_26 = 1, var69_upvr do
				tbl_5_upvr[i_26]:TurnNumber(true)
			end
			return
		end
		for _, v_8 in pairs(tbl_4_upvr) do
			if UserInputService_upvr:GetLastInputType() == v_8 then
				for i_28 = 1, var69_upvr do
					tbl_5_upvr[i_28]:TurnNumber(true)
				end
				return
			end
		end
		for _, v_9 in pairs(tbl_3_upvr) do
			if UserInputService_upvr:GetLastInputType() == v_9 then
				for i_30 = 1, var69_upvr do
					tbl_5_upvr[i_30]:TurnNumber(false)
				end
				return
			end
		end
	end
end
local function var334_upvr() -- Line 1157
end
function unbindAllGamepadEquipActions() -- Line 1160
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	ContextActionService_upvr:UnbindAction("BackpackHasGamepadFocus")
	ContextActionService_upvr:UnbindAction("BackpackCloseInventory")
end
function var335_upvw(arg1, arg2, arg3) -- Line 1236
	--[[ Upvalues[8]:
		[1]: var337_upvw (read and write)
		[2]: var338_upvw (read and write)
		[3]: Humanoid_upvw (read and write)
		[4]: var58_upvw (read and write)
		[5]: tbl_2_upvr (readonly)
		[6]: var69_upvr (readonly)
		[7]: tbl_5_upvr (readonly)
		[8]: var65_upvw (read and write)
	]]
	if arg2 ~= Enum.UserInputState.Begin then
	else
		if var337_upvw then
			if var337_upvw.KeyCode == Enum.KeyCode.ButtonR1 and arg3.KeyCode == Enum.KeyCode.ButtonL1 or var337_upvw.KeyCode == Enum.KeyCode.ButtonL1 and arg3.KeyCode == Enum.KeyCode.ButtonR1 or os.clock() - var338_upvw <= 0.06 then
				if Humanoid_upvw then
					Humanoid_upvw:UnequipTools()
					if var58_upvw then
						var58_upvw:ToggleSelect()
						tbl_2_upvr[var58_upvw]:UpdateEquipView()
						var58_upvw = nil
					end
				end
				var337_upvw = arg3
				var338_upvw = os.clock()
				return
			end
		end
		var337_upvw = arg3
		var338_upvw = os.clock()
		task.delay(0.06, function() -- Line 1264
			--[[ Upvalues[8]:
				[1]: var337_upvw (copied, read and write)
				[2]: arg3 (readonly)
				[3]: var69_upvr (copied, readonly)
				[4]: tbl_5_upvr (copied, readonly)
				[5]: Humanoid_upvw (copied, read and write)
				[6]: var58_upvw (copied, read and write)
				[7]: tbl_2_upvr (copied, readonly)
				[8]: var65_upvw (copied, read and write)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 68 start (CF ANALYSIS FAILED)
			if var337_upvw ~= arg3 then return end
			if arg3.KeyCode == Enum.KeyCode.ButtonL1 then
			else
			end
			local _ = 1
			-- KONSTANTERROR: [0] 1. Error Block 68 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [91] 77. Error Block 30 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [91] 77. Error Block 30 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [20] 17. Error Block 8 start (CF ANALYSIS FAILED)
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [91.5]
			-- KONSTANTERROR: [20] 17. Error Block 8 end (CF ANALYSIS FAILED)
		end)
	end
end
local var337_upvw
local var338_upvw
local var336_upvw = var335_upvw
function getGamepadSwapSlot() -- Line 1331
	--[[ Upvalues[1]:
		[1]: tbl_5_upvr (readonly)
	]]
	for i_12 = 1, #tbl_5_upvr do
		if 0 < tbl_5_upvr[i_12].Frame.BorderSizePixel then
			return tbl_5_upvr[i_12]
		end
	end
end
function changeSlot(arg1) -- Line 1341
	--[[ Upvalues[5]:
		[1]: VRService_upvr (readonly)
		[2]: var46_upvw (read and write)
		[3]: GuiService_upvr (readonly)
		[4]: var47_upvw (read and write)
		[5]: var69_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 end (CF ANALYSIS FAILED)
end
function vrMoveSlotToInventory() -- Line 1397
	--[[ Upvalues[2]:
		[1]: VRService_upvr (readonly)
		[2]: var47_upvw (read and write)
	]]
	if not VRService_upvr.VREnabled then
	else
		local getGamepadSwapSlot_result1 = getGamepadSwapSlot()
		if getGamepadSwapSlot_result1 and getGamepadSwapSlot_result1.Tool then
			getGamepadSwapSlot_result1.Frame.BorderSizePixel = 0
			getGamepadSwapSlot_result1:MoveToInventory()
			var47_upvw.SelectionImageObject.Visible = false
		end
	end
end
function enableGamepadInventoryControl() -- Line 1410
	--[[ Upvalues[6]:
		[1]: var46_upvw (read and write)
		[2]: any_setOrder_result1_upvr (readonly)
		[3]: ContextActionService_upvr (readonly)
		[4]: var334_upvr (readonly)
		[5]: GuiService_upvr (readonly)
		[6]: var45_upvw (read and write)
	]]
	ContextActionService_upvr:BindAction("BackpackHasGamepadFocus", var334_upvr, false, Enum.UserInputType.Gamepad1)
	ContextActionService_upvr:BindAction("BackpackCloseInventory", function() -- Line 1411
		--[[ Upvalues[2]:
			[1]: var46_upvw (copied, read and write)
			[2]: any_setOrder_result1_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [8] 7. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [8.1]
		nil.Frame.BorderSizePixel = 0
		do
			return
		end
		do
			return
		end
		-- KONSTANTERROR: [8] 7. Error Block 3 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [15] 12. Error Block 7 start (CF ANALYSIS FAILED)
		if var46_upvw.Visible then
			any_setOrder_result1_upvr:deselect()
		end
		-- KONSTANTERROR: [15] 12. Error Block 7 end (CF ANALYSIS FAILED)
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	if not false then
		GuiService_upvr.SelectedObject = var45_upvw:FindFirstChild('1')
	end
end
function disableGamepadInventoryControl() -- Line 1444
	--[[ Upvalues[4]:
		[1]: var69_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
		[3]: GuiService_upvr (readonly)
		[4]: var44_upvw (read and write)
	]]
	unbindAllGamepadEquipActions()
	for i_13 = 1, var69_upvr do
		local var349 = tbl_5_upvr[i_13]
		if var349 and var349.Frame then
			var349.Frame.BorderSizePixel = 0
		end
	end
	if GuiService_upvr.SelectedObject then
		i_13 = var44_upvw
		if GuiService_upvr.SelectedObject:IsDescendantOf(i_13) then
			GuiService_upvr.SelectedObject = nil
		end
	end
end
local function _() -- Line 1459, Named "bindBackpackHotbarAction"
	--[[ Upvalues[4]:
		[1]: var59_upvw (read and write)
		[2]: var41_upvw (read and write)
		[3]: ContextActionService_upvr (readonly)
		[4]: var336_upvw (read and write)
	]]
	if var59_upvw then
		if not var41_upvw then
			var41_upvw = true
			ContextActionService_upvr:BindAction("BackpackHotbarEquip", var336_upvw, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
	end
end
local function _() -- Line 1472, Named "unbindBackpackHotbarAction"
	--[[ Upvalues[2]:
		[1]: var41_upvw (read and write)
		[2]: ContextActionService_upvr (readonly)
	]]
	disableGamepadInventoryControl()
	var41_upvw = false
	ContextActionService_upvr:UnbindAction("BackpackHotbarEquip")
end
function gamepadDisconnected() -- Line 1478
	--[[ Upvalues[1]:
		[1]: var62_upvw (read and write)
	]]
	var62_upvw = false
	disableGamepadInventoryControl()
end
function gamepadConnected() -- Line 1483
	--[[ Upvalues[9]:
		[1]: var62_upvw (read and write)
		[2]: GuiService_upvr (readonly)
		[3]: var44_upvw (read and write)
		[4]: var57_upvw (read and write)
		[5]: var59_upvw (read and write)
		[6]: var41_upvw (read and write)
		[7]: ContextActionService_upvr (readonly)
		[8]: var336_upvw (read and write)
		[9]: var46_upvw (read and write)
	]]
	var62_upvw = true
	GuiService_upvr:AddSelectionParent("BackpackSelection", var44_upvw)
	if 1 <= var57_upvw then
		if var59_upvw and not var41_upvw then
			var41_upvw = true
			ContextActionService_upvr:BindAction("BackpackHotbarEquip", var336_upvw, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
	end
	if var46_upvw.Visible then
		enableGamepadInventoryControl()
	end
end
local function _(arg1) -- Line 1496, Named "OnIconChanged"
	--[[ Upvalues[7]:
		[1]: StarterGui_upvr (readonly)
		[2]: var59_upvw (read and write)
		[3]: var44_upvw (read and write)
		[4]: var57_upvw (read and write)
		[5]: var41_upvw (read and write)
		[6]: ContextActionService_upvr (readonly)
		[7]: var336_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 7. Error Block 3 start (CF ANALYSIS FAILED)
	local any_GetCore_result1_2 = StarterGui_upvr:GetCore("TopbarEnabled")
	var59_upvw = any_GetCore_result1_2
	var44_upvw.Visible = any_GetCore_result1_2
	-- KONSTANTERROR: [7] 7. Error Block 3 end (CF ANALYSIS FAILED)
end
local function MakeVRRoundButton(arg1, arg2) -- Line 1520
	local ImageButton_2 = Instance.new("ImageButton")
	ImageButton_2.BackgroundTransparency = 1
	ImageButton_2.Name = arg1
	ImageButton_2.Size = UDim2.new(0, 40, 0, 40)
	ImageButton_2.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local ImageLabel_4 = Instance.new("ImageLabel")
	ImageLabel_4.Name = "Icon"
	ImageLabel_4.BackgroundTransparency = 1
	ImageLabel_4.Size = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel_4.Position = UDim2.new(0.25, 0, 0.25, 0)
	ImageLabel_4.Image = arg2
	ImageLabel_4.Parent = ImageButton_2
	local ImageLabel_7 = Instance.new("ImageLabel")
	ImageLabel_7.BackgroundTransparency = 1
	ImageLabel_7.Name = "Selection"
	ImageLabel_7.Size = UDim2.new(0.9, 0, 0.9, 0)
	ImageLabel_7.Position = UDim2.new(0.05, 0, 0.05, 0)
	ImageLabel_7.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	ImageButton_2.SelectionImageObject = ImageLabel_7
	return ImageButton_2, ImageLabel_4, ImageLabel_7
end
var44_upvw = Instance.new("Frame")
local var354_upvw = var44_upvw
var354_upvw.BackgroundTransparency = 1
var354_upvw.Name = "Backpack"
var354_upvw.Size = UDim2.new(1, 0, 1, 0)
var354_upvw.Visible = false
var354_upvw.Parent = ScreenGui_upvr
var45_upvw = Instance.new("Frame")
local var355_upvw = var45_upvw
var355_upvw.BackgroundTransparency = 1
var355_upvw.Name = "Hotbar"
var355_upvw.Size = UDim2.new(1, 0, 1, 0)
var355_upvw.Parent = var354_upvw
for i_14 = 1, var69_upvr do
	local MakeSlot_upvr_result1_3 = MakeSlot_upvr(var355_upvw, i_14)
	MakeSlot_upvr_result1_3.Frame.Visible = false
	if not var53_upvw then
		var53_upvw = MakeSlot_upvr_result1_3
	end
end
local ImageLabel_5 = Instance.new("ImageLabel")
ImageLabel_5.BackgroundTransparency = 1
ImageLabel_5.Name = "LeftBumper"
ImageLabel_5.Size = UDim2.new(0, 40, 0, 40)
ImageLabel_5.Position = UDim2.new(0, -ImageLabel_5.Size.X.Offset, 0.5, -ImageLabel_5.Size.Y.Offset / 2)
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.BackgroundTransparency = 1
ImageLabel.Name = "RightBumper"
ImageLabel.Size = UDim2.new(0, 40, 0, 40)
ImageLabel.Position = UDim2.new(1, 0, 0.5, -ImageLabel.Size.Y.Offset / 2)
var46_upvw = Instance.new("Frame")
local var359_upvw = var46_upvw
var359_upvw.Name = "Inventory"
var359_upvw.Size = UDim2.new(1, 0, 1, 0)
var359_upvw.BackgroundTransparency = var15_upvw
var359_upvw.BackgroundColor3 = BackgroundColor3_upvr_2
var359_upvw.Active = true
var359_upvw.Visible = false
var359_upvw.Parent = var354_upvw
local UICorner_2 = Instance.new("UICorner")
UICorner_2.Name = "Corner"
UICorner_2.CornerRadius = udim
UICorner_2.Parent = var359_upvw
var47_upvw = Instance.new("TextButton")
local var361 = var47_upvw
var361.Name = "VRInventorySelector"
var361.Position = UDim2.new(0, 0, 0, 0)
var361.Size = UDim2.new(1, 0, 1, 0)
var361.BackgroundTransparency = 1
var361.Text = ""
var361.Parent = var359_upvw
local ImageLabel_6 = Instance.new("ImageLabel")
ImageLabel_6.BackgroundTransparency = 1
ImageLabel_6.Name = "Selector"
ImageLabel_6.Size = UDim2.new(1, 0, 1, 0)
ImageLabel_6.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
ImageLabel_6.ScaleType = Enum.ScaleType.Slice
ImageLabel_6.SliceCenter = Rect.new(12, 12, 52, 52)
ImageLabel_6.Visible = false
var361.SelectionImageObject = ImageLabel_6
var361.MouseButton1Click:Connect(function() -- Line 1617
	vrMoveSlotToInventory()
end)
var48_upvw = Instance.new("ScrollingFrame")
local var364_upvw = var48_upvw
var364_upvw.BackgroundTransparency = 1
var364_upvw.Name = "ScrollingFrame"
var364_upvw.Size = UDim2.new(1, 0, 1, 0)
var364_upvw.Selectable = false
var364_upvw.ScrollingDirection = Enum.ScrollingDirection.Y
var364_upvw.BorderSizePixel = 0
var364_upvw.ScrollBarThickness = 8
var364_upvw.ScrollBarImageColor3 = Color3.new(1, 1, 1)
var364_upvw.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
var364_upvw.CanvasSize = UDim2.new(0, 0, 0, 0)
var364_upvw.Parent = var359_upvw
var49_upvw = Instance.new("Frame")
local var365_upvw = var49_upvw
var365_upvw.BackgroundTransparency = 1
var365_upvw.Name = "UIGridFrame"
var365_upvw.Selectable = false
var365_upvw.Size = UDim2.new(1, -10, 1, 0)
var365_upvw.Position = UDim2.new(0, 5, 0, 0)
var365_upvw.Parent = var364_upvw
local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, var33_upvw, 0, var33_upvw)
UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
UIGridLayout.Parent = var365_upvw
local MakeVRRoundButton_result1_upvw = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
MakeVRRoundButton_result1_upvw.Size = UDim2.new(0, 34, 0, 34)
MakeVRRoundButton_result1_upvw.Position = UDim2.new(0.5, -MakeVRRoundButton_result1_upvw.Size.X.Offset / 2, 0, 43)
MakeVRRoundButton_result1_upvw.Icon.Position = MakeVRRoundButton_result1_upvw.Icon.Position - UDim2.new(0, 0, 0, 2)
MakeVRRoundButton_result1_upvw.MouseButton1Click:Connect(function() -- Line 1654
	--[[ Upvalues[2]:
		[1]: var364_upvw (read and write)
		[2]: var33_upvw (read and write)
	]]
	var364_upvw.CanvasPosition = Vector2.new(var364_upvw.CanvasPosition.X, math.min(var364_upvw.CanvasSize.Y.Offset - var364_upvw.AbsoluteWindowSize.Y, math.max(0, (var364_upvw.CanvasPosition.Y) - (var33_upvw + 5))))
end)
local MakeVRRoundButton_result1_upvw_2 = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
MakeVRRoundButton_result1_upvw_2.Rotation = 180
MakeVRRoundButton_result1_upvw_2.Icon.Position = MakeVRRoundButton_result1_upvw_2.Icon.Position - UDim2.new(0, 0, 0, 2)
MakeVRRoundButton_result1_upvw_2.Size = UDim2.new(0, 34, 0, 34)
MakeVRRoundButton_result1_upvw_2.Position = UDim2.new(0.5, -MakeVRRoundButton_result1_upvw_2.Size.X.Offset / 2, 1, -MakeVRRoundButton_result1_upvw_2.Size.Y.Offset - 3)
MakeVRRoundButton_result1_upvw_2.MouseButton1Click:Connect(function() -- Line 1671
	--[[ Upvalues[2]:
		[1]: var364_upvw (read and write)
		[2]: var33_upvw (read and write)
	]]
	var364_upvw.CanvasPosition = Vector2.new(var364_upvw.CanvasPosition.X, math.min(var364_upvw.CanvasSize.Y.Offset - var364_upvw.AbsoluteWindowSize.Y, math.max(0, (var364_upvw.CanvasPosition.Y) + (var33_upvw + 5))))
end)
var364_upvw.Changed:Connect(function(arg1) -- Line 1682
	--[[ Upvalues[3]:
		[1]: var364_upvw (read and write)
		[2]: MakeVRRoundButton_result1_upvw (read and write)
		[3]: MakeVRRoundButton_result1_upvw_2 (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 2. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 2. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 3. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 3. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 4. Error Block 18 start (CF ANALYSIS FAILED)
	if var364_upvw.CanvasPosition.Y == 0 then
		-- KONSTANTWARNING: GOTO [15] #10
	end
	-- KONSTANTERROR: [6] 4. Error Block 18 end (CF ANALYSIS FAILED)
end)
;(function() -- Line 302, Named "UpdateBackpackLayout"
	--[[ Upvalues[9]:
		[1]: var45_upvw (read and write)
		[2]: var69_upvr (readonly)
		[3]: var33_upvw (read and write)
		[4]: var46_upvw (read and write)
		[5]: const_number_upvr (readonly)
		[6]: VREnabled_upvr (readonly)
		[7]: var48_upvw (read and write)
		[8]: AdjustHotbarFrames_upvr (readonly)
		[9]: AdjustInventoryFrames_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 20 start (CF ANALYSIS FAILED)
	var45_upvw.Size = UDim2.new(0, var69_upvr * (var33_upvw + 5) + 5, 0, var33_upvw + 5 + 5)
	var45_upvw.Position = UDim2.new(0.5, -var45_upvw.Size.X.Offset / 2, 1, -var45_upvw.Size.Y.Offset)
	local var84 = var45_upvw.Size.Y.Offset * const_number_upvr
	if VREnabled_upvr then
		var84 = 80
	else
		var84 = 0
	end
	var46_upvw.Size = UDim2.new(0, var45_upvw.Size.X.Offset, 0, var84 + 40 + var84)
	var84 = var46_upvw.Size
	var84 = var45_upvw.Position.Y
	var84 = var46_upvw.Size.Y.Offset
	var46_upvw.Position = UDim2.new(0.5, -var84.X.Offset / 2, 1, var84.Offset - var84)
	var84 = VREnabled_upvr
	if var84 then
		-- KONSTANTWARNING: GOTO [118] #88
	end
	-- KONSTANTERROR: [0] 1. Error Block 20 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [117] 87. Error Block 22 start (CF ANALYSIS FAILED)
	var48_upvw.Size = UDim2.new(1, var48_upvw.ScrollBarThickness + 1, 1, -40 - 0)
	if VREnabled_upvr then
		var84 = 40
	else
		var84 = 0
	end
	var48_upvw.Position = UDim2.new(0, 0, 0, 40 + var84)
	AdjustHotbarFrames_upvr()
	AdjustInventoryFrames_upvr()
	-- KONSTANTERROR: [117] 87. Error Block 22 end (CF ANALYSIS FAILED)
end)()
local Frame_4_upvr = Instance.new("Frame")
Frame_4_upvr.Name = "GamepadHintsFrame"
if any_IsTenFootInterface_result1_upvr then
else
end
Frame_4_upvr.Size = UDim2.new(0, var355_upvw.Size.X.Offset, 0, 60)
Frame_4_upvr.BackgroundTransparency = var15_upvw
Frame_4_upvr.BackgroundColor3 = BackgroundColor3_upvr_2
Frame_4_upvr.Visible = false
Frame_4_upvr.Parent = var354_upvw
local UIListLayout_2 = Instance.new("UIListLayout")
UIListLayout_2.Name = "Layout"
UIListLayout_2.Padding = UDim.new(0, 25)
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Parent = Frame_4_upvr
local UICorner_6 = Instance.new("UICorner")
UICorner_6.Name = "Corner"
UICorner_6.CornerRadius = udim
UICorner_6.Parent = Frame_4_upvr
local function addGamepadHint(arg1, arg2) -- Line 1718
	--[[ Upvalues[3]:
		[1]: Frame_4_upvr (readonly)
		[2]: any_IsTenFootInterface_result1_upvr (readonly)
		[3]: FontFace_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local Frame_3 = Instance.new("Frame")
	Frame_3.Name = "HintFrame"
	Frame_3.AutomaticSize = Enum.AutomaticSize.XY
	Frame_3.BackgroundTransparency = 1
	Frame_3.Parent = Frame_4_upvr
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Name = "Layout"
	local var377
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [26] 19. Error Block 20 start (CF ANALYSIS FAILED)
	var377 = 0
	local udim_2 = UDim.new(var377, 20)
	if not udim_2 then
		-- KONSTANTERROR: [32] 24. Error Block 16 start (CF ANALYSIS FAILED)
		udim_2 = UDim.new
		var377 = 0
		udim_2 = udim_2(var377, 12)
		-- KONSTANTERROR: [32] 24. Error Block 16 end (CF ANALYSIS FAILED)
	end
	UIListLayout.Padding = udim_2
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Parent = Frame_3
	var377 = "ImageLabel"
	local any = Instance.new(var377)
	var377 = "HintImage"
	any.Name = var377
	local function INLINED_7() -- Internal function, doesn't exist in bytecode
		var377 = UDim2.new(0, 60, 0, 60)
		return var377
	end
	if not any_IsTenFootInterface_result1_upvr or not INLINED_7() then
		var377 = UDim2.new(0, 30, 0, 30)
	end
	any.Size = var377
	var377 = 1
	any.BackgroundTransparency = var377
	any.Image = arg1
	any.Parent = Frame_3
	var377 = Instance.new("TextLabel")
	var377.Name = "HintText"
	var377.AutomaticSize = Enum.AutomaticSize.XY
	local Font_new_result1 = Font.new(FontFace_upvr.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	var377.FontFace = Font_new_result1
	if any_IsTenFootInterface_result1_upvr then
		Font_new_result1 = 32
	else
		Font_new_result1 = 19
	end
	var377.TextSize = Font_new_result1
	var377.BackgroundTransparency = 1
	var377.Text = arg2
	var377.TextColor3 = Color3.new(1, 1, 1)
	var377.TextXAlignment = Enum.TextXAlignment.Left
	var377.TextYAlignment = Enum.TextYAlignment.Center
	var377.TextWrapped = true
	var377.Parent = Frame_3
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	UITextSizeConstraint.MaxTextSize = var377.TextSize
	UITextSizeConstraint.Parent = var377
	-- KONSTANTERROR: [26] 19. Error Block 20 end (CF ANALYSIS FAILED)
end
addGamepadHint(UserInputService_upvr:GetImageForKeyCode(Enum.KeyCode.ButtonX), "Remove From Hotbar")
addGamepadHint(UserInputService_upvr:GetImageForKeyCode(Enum.KeyCode.ButtonA), "Select/Swap")
addGamepadHint(UserInputService_upvr:GetImageForKeyCode(Enum.KeyCode.ButtonB), "Close Backpack")
local function resizeGamepadHintsFrame_upvr() -- Line 1762, Named "resizeGamepadHintsFrame"
	--[[ Upvalues[4]:
		[1]: Frame_4_upvr (readonly)
		[2]: var355_upvw (read and write)
		[3]: any_IsTenFootInterface_result1_upvr (readonly)
		[4]: var359_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 34 start (CF ANALYSIS FAILED)
	local Size = var355_upvw.Size
	local var389
	if any_IsTenFootInterface_result1_upvr then
		Size = 95
	else
		Size = 60
	end
	var389.Size = UDim2.new(var355_upvw.Size.X.Scale, Size.X.Offset, 0, Size)
	var389 = Frame_4_upvr
	var389.Position = UDim2.new(var355_upvw.Position.X.Scale, var355_upvw.Position.X.Offset, var359_upvw.Position.Y.Scale, var359_upvw.Position.Y.Offset - Frame_4_upvr.Size.Y.Offset - 5)
	var389 = 0
	local tbl = {}
	for i_15, v_4 in pairs(Frame_4_upvr:GetChildren()) do
		if v_4:IsA("GuiObject") then
			table.insert(tbl, v_4)
		end
	end
	for i_16 = 1, #tbl do
		i_15 = tbl[i_16]:IsA("GuiObject")
		if i_15 then
			i_15 = tbl[i_16]
			v_4 = UDim2.new(1, 0, 1, -5)
			i_15.Size = v_4
			i_15 = tbl[i_16]
			v_4 = UDim2.new(0, 0, 0, 0)
			i_15.Position = v_4
			v_4 = tbl[i_16].HintText.Position.X.Offset
			i_15 = v_4 + tbl[i_16].HintText.TextBounds.X
			var389 += i_15
		end
	end
	local var394 = 1
	if var394 == 1 then
		local udim2 = UDim2.new(0, 0, 0, 0)
		if not udim2 then
			-- KONSTANTERROR: [168] 121. Error Block 24 start (CF ANALYSIS FAILED)
			udim2 = UDim2.new
			local var396 = udim2
			var396 = var396(0, tbl[var394 - 1].Position.X.Offset + tbl[var394 - 1].Size.X.Offset + (Frame_4_upvr.AbsoluteSize.X - var389) / (#tbl - 1), 0, 0)
			-- KONSTANTERROR: [168] 121. Error Block 24 end (CF ANALYSIS FAILED)
		end
		tbl[var394].Position = var396
		tbl[var394].Size = UDim2.new(0, tbl[var394].HintText.Position.X.Offset + tbl[var394].HintText.TextBounds.X, 1, -5)
		-- KONSTANTWARNING: GOTO [157] #112
	end
	-- KONSTANTERROR: [0] 1. Error Block 34 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [168] 121. Error Block 24 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [168] 121. Error Block 24 end (CF ANALYSIS FAILED)
end
local Frame_6_upvr = Instance.new("Frame")
Frame_6_upvr.Name = "Search"
Frame_6_upvr.BackgroundColor3 = Color3.new(0.09803921568627451, 0.10588235294117647, 0.11372549019607843)
Frame_6_upvr.BackgroundTransparency = var28_upvw
Frame_6_upvr.Size = UDim2.new(0, 190, 0, 30)
Frame_6_upvr.Position = UDim2.new(1, -Frame_6_upvr.Size.X.Offset - 5, 0, 5)
Frame_6_upvr.Parent = var359_upvw
local UICorner_3 = Instance.new("UICorner")
UICorner_3.Name = "Corner"
UICorner_3.CornerRadius = var29
UICorner_3.Parent = Frame_6_upvr
local UIStroke = Instance.new("UIStroke")
UIStroke.Name = "Border"
UIStroke.Color = Color3.new(1, 1, 1)
UIStroke.Thickness = 1
UIStroke.Transparency = 0.8
UIStroke.Parent = Frame_6_upvr
local TextBox_upvr = Instance.new("TextBox")
TextBox_upvr.BackgroundTransparency = 1
TextBox_upvr.Name = "TextBox"
TextBox_upvr.Text = ""
TextBox_upvr.TextColor3 = TextColor3_upvr
TextBox_upvr.TextStrokeTransparency = var26_upvr
TextBox_upvr.TextStrokeColor3 = TextStrokeColor3_upvr
TextBox_upvr.FontFace = Font.new(FontFace_upvr.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
TextBox_upvr.PlaceholderText = "Search"
TextBox_upvr.TextColor3 = TextColor3_upvr
TextBox_upvr.TextTransparency = var26_upvr
TextBox_upvr.TextStrokeColor3 = TextStrokeColor3_upvr
TextBox_upvr.ClearTextOnFocus = false
TextBox_upvr.TextTruncate = Enum.TextTruncate.AtEnd
TextBox_upvr.TextSize = var31_upvw
TextBox_upvr.TextXAlignment = Enum.TextXAlignment.Left
TextBox_upvr.TextYAlignment = Enum.TextYAlignment.Center
TextBox_upvr.Size = UDim2.new(0, 154, 0, 14)
TextBox_upvr.AnchorPoint = Vector2.new(0, 0.5)
TextBox_upvr.Position = UDim2.new(0, 8, 0.5, 0)
TextBox_upvr.ZIndex = 2
TextBox_upvr.Parent = Frame_6_upvr
local TextButton_upvr = Instance.new("TextButton")
TextButton_upvr.Name = 'X'
TextButton_upvr.Text = ""
TextButton_upvr.Size = UDim2.new(0, 30, 0, 30)
TextButton_upvr.Position = UDim2.new(1, -TextButton_upvr.Size.X.Offset, 0.5, -TextButton_upvr.Size.Y.Offset / 2)
TextButton_upvr.ZIndex = 4
TextButton_upvr.Visible = false
TextButton_upvr.BackgroundTransparency = 1
TextButton_upvr.Parent = Frame_6_upvr
local ImageButton = Instance.new("ImageButton")
ImageButton.Name = 'X'
ImageButton.Image = "rbxasset://textures/ui/InspectMenu/x.png"
ImageButton.BackgroundTransparency = 1
ImageButton.Size = UDim2.new(0, Frame_6_upvr.Size.Y.Offset - 20, 0, Frame_6_upvr.Size.Y.Offset - 20)
ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
ImageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageButton.ZIndex = 1
ImageButton.BorderSizePixel = 0
ImageButton.Parent = TextButton_upvr
local function search_upvr() -- Line 1899, Named "search"
	--[[ Upvalues[9]:
		[1]: TextBox_upvr (readonly)
		[2]: var69_upvr (readonly)
		[3]: tbl_5_upvr (readonly)
		[4]: var359_upvw (read and write)
		[5]: var61_upvw (read and write)
		[6]: var365_upvw (read and write)
		[7]: var364_upvw (read and write)
		[8]: UpdateScrollingFrameCanvasSize_upvr (readonly)
		[9]: TextButton_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local tbl_8 = {}
	for i_17 in TextBox_upvr.Text:gmatch("%S+") do
		tbl_8[i_17:lower()] = true
	end
	for i_18 = var69_upvr + 1, #tbl_5_upvr do
		local var431 = tbl_5_upvr[i_18]
		table.insert({}, {var431, var431:CheckTerms(tbl_8)})
		var431.Frame.Visible = false
		var431.Frame.Parent = var359_upvw
		local var433
	end
	table.sort(var433, function(arg1, arg2) -- Line 1914
		local var435
		if arg2[2] >= arg1[2] then
			var435 = false
		else
			var435 = true
		end
		return var435
	end)
	var61_upvw = true
	for _, v_5 in ipairs(var433) do
		local _1 = v_5[1]
		if 0 < v_5[2] then
			_1.Frame.Visible = true
			_1.Frame.Parent = var365_upvw
			_1.Frame.LayoutOrder = var69_upvr + 0
		end
	end
	var364_upvw.CanvasPosition = Vector2.new(0, 0)
	UpdateScrollingFrameCanvasSize_upvr()
	TextButton_upvr.ZIndex = 3
end
local function clearResults_upvr() -- Line 1936, Named "clearResults"
	--[[ Upvalues[6]:
		[1]: TextButton_upvr (readonly)
		[2]: var61_upvw (read and write)
		[3]: var69_upvr (readonly)
		[4]: tbl_5_upvr (readonly)
		[5]: var365_upvw (read and write)
		[6]: UpdateScrollingFrameCanvasSize_upvr (readonly)
	]]
	if 0 < TextButton_upvr.ZIndex then
		var61_upvw = false
		for i_20 = var69_upvr + 1, #tbl_5_upvr do
			local var442 = tbl_5_upvr[i_20]
			var442.Frame.LayoutOrder = var442.Index
			var442.Frame.Parent = var365_upvw
			var442.Frame.Visible = true
		end
		TextButton_upvr.ZIndex = 0
	end
	UpdateScrollingFrameCanvasSize_upvr()
end
TextButton_upvr.MouseButton1Click:Connect(function() -- Line 1950, Named "reset"
	--[[ Upvalues[2]:
		[1]: clearResults_upvr (readonly)
		[2]: TextBox_upvr (readonly)
	]]
	clearResults_upvr()
	TextBox_upvr.Text = ""
end)
TextBox_upvr.Changed:Connect(function(arg1) -- Line 1955, Named "onChanged"
	--[[ Upvalues[5]:
		[1]: TextBox_upvr (readonly)
		[2]: var26_upvr (readonly)
		[3]: clearResults_upvr (readonly)
		[4]: search_upvr (readonly)
		[5]: TextButton_upvr (readonly)
	]]
	if arg1 == "Text" then
		local Text = TextBox_upvr.Text
		if Text == "" then
			TextBox_upvr.TextTransparency = var26_upvr
			clearResults_upvr()
		elseif Text ~= "" then
			TextBox_upvr.TextTransparency = 0
			search_upvr()
		end
		local var444 = false
		if Text ~= "" then
			if Text == "" then
				var444 = false
			else
				var444 = true
			end
		end
		TextButton_upvr.Visible = var444
	end
end)
TextBox_upvr.FocusLost:Connect(function(arg1) -- Line 1969, Named "focusLost"
	--[[ Upvalues[1]:
		[1]: search_upvr (readonly)
	]]
	if arg1 then
		search_upvr()
	end
end)
module_upvr.StateChanged.Event:Connect(function(arg1) -- Line 1980
	--[[ Upvalues[2]:
		[1]: clearResults_upvr (readonly)
		[2]: TextBox_upvr (readonly)
	]]
	if not arg1 then
		clearResults_upvr()
		TextBox_upvr.Text = ""
	end
end)
tbl_10_upvr[Enum.KeyCode.Escape.Value] = function(arg1) -- Line 1988
	--[[ Upvalues[2]:
		[1]: clearResults_upvr (readonly)
		[2]: TextBox_upvr (readonly)
	]]
	if arg1 then
		clearResults_upvr()
		TextBox_upvr.Text = ""
	end
end
UserInputService_upvr.LastInputTypeChanged:Connect(function(arg1) -- Line 1993, Named "detectGamepad"
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: Frame_6_upvr (readonly)
	]]
	if arg1 == Enum.UserInputType.Gamepad1 then
		if not UserInputService_upvr.VREnabled then
			Frame_6_upvr.Visible = false
			return
		end
	end
	Frame_6_upvr.Visible = true
end)
function TextBox_upvr() -- Line 2004
	--[[ Upvalues[2]:
		[1]: ScreenGui_upvr (readonly)
		[2]: any_setOrder_result1_upvr (readonly)
	]]
	ScreenGui_upvr.Enabled = false
	any_setOrder_result1_upvr:setEnabled(false)
end
GuiService_upvr.MenuOpened:Connect(TextBox_upvr)
function TextBox_upvr() -- Line 2010
	--[[ Upvalues[2]:
		[1]: ScreenGui_upvr (readonly)
		[2]: any_setOrder_result1_upvr (readonly)
	]]
	ScreenGui_upvr.Enabled = true
	any_setOrder_result1_upvr:setEnabled(true)
end
GuiService_upvr.MenuClosed:Connect(TextBox_upvr)
local function OnPreferredTransparencyChanged_upvr(arg1, arg2, arg3) -- Line 2017
	--[[ Upvalues[3]:
		[1]: GuiService_upvr (readonly)
		[2]: var69_upvr (readonly)
		[3]: tbl_5_upvr (readonly)
	]]
	if arg2 ~= Enum.UserInputState.Begin then
	else
		if not GuiService_upvr.SelectedObject then return end
		for i_31 = 1, var69_upvr do
			if tbl_5_upvr[i_31].Frame == GuiService_upvr.SelectedObject and tbl_5_upvr[i_31].Tool then
				tbl_5_upvr[i_31]:MoveToInventory()
				return
			end
		end
	end
end
search_upvr = false
TextBox_upvr = StarterGui_upvr:SetCoreGuiEnabled
TextBox_upvr(Enum.CoreGuiType.Backpack, search_upvr)
function module_upvr.OpenClose() -- Line 2033, Named "openClose"
	--[[ Upvalues[14]:
		[1]: tbl_9_upvr (readonly)
		[2]: var359_upvw (read and write)
		[3]: AdjustHotbarFrames_upvr (readonly)
		[4]: var355_upvw (read and write)
		[5]: var69_upvr (readonly)
		[6]: tbl_5_upvr (readonly)
		[7]: var62_upvw (read and write)
		[8]: tbl_3_upvr (readonly)
		[9]: UserInputService_upvr (readonly)
		[10]: resizeGamepadHintsFrame_upvr (readonly)
		[11]: Frame_4_upvr (readonly)
		[12]: ContextActionService_upvr (readonly)
		[13]: OnPreferredTransparencyChanged_upvr (readonly)
		[14]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if not next(tbl_9_upvr) then
		var359_upvw.Visible = not var359_upvw.Visible
		AdjustHotbarFrames_upvr()
		var355_upvw.Active = not var355_upvw.Active
		for i_21 = 1, var69_upvr do
			tbl_5_upvr[i_21]:SetClickability(not var359_upvw.Visible)
			local _
		end
	end
	if var359_upvw.Visible then
		if var62_upvw then
			if tbl_3_upvr[UserInputService_upvr:GetLastInputType()] then
				resizeGamepadHintsFrame_upvr()
				i_21 = UserInputService_upvr
				Frame_4_upvr.Visible = not i_21.VREnabled
			end
			enableGamepadInventoryControl()
			-- KONSTANTWARNING: GOTO [70] #57
		end
	else
		if var62_upvw then
			Frame_4_upvr.Visible = false
		end
		disableGamepadInventoryControl()
	end
	if var359_upvw.Visible then
		ContextActionService_upvr:BindAction("BackpackRemoveSlot", OnPreferredTransparencyChanged_upvr, false, Enum.KeyCode.ButtonX)
	else
		ContextActionService_upvr:UnbindAction("BackpackRemoveSlot")
	end
	module_upvr.IsOpen = var359_upvw.Visible
	module_upvr.StateChanged:Fire(var359_upvw.Visible)
end
while not LocalPlayer_upvw do
	OnPreferredTransparencyChanged_upvr = task.wait
	OnPreferredTransparencyChanged_upvr()
	LocalPlayer_upvw = Players.LocalPlayer
end
OnPreferredTransparencyChanged_upvr = LocalPlayer_upvw.CharacterAdded
TextBox_upvr = OnCharacterAdded
OnPreferredTransparencyChanged_upvr = OnPreferredTransparencyChanged_upvr:Connect
OnPreferredTransparencyChanged_upvr(TextBox_upvr)
OnPreferredTransparencyChanged_upvr = LocalPlayer_upvw.Character
if OnPreferredTransparencyChanged_upvr then
	OnPreferredTransparencyChanged_upvr = OnCharacterAdded
	OnPreferredTransparencyChanged_upvr(LocalPlayer_upvw.Character)
end
OnPreferredTransparencyChanged_upvr = UserInputService_upvr.InputBegan
function TextBox_upvr(arg1, arg2) -- Line 1090, Named "OnInputBegan"
	--[[ Upvalues[7]:
		[1]: TextChatService_upvr (readonly)
		[2]: var60_upvw (read and write)
		[3]: var59_upvw (read and write)
		[4]: Value_upvr (readonly)
		[5]: tbl_10_upvr (readonly)
		[6]: var46_upvw (read and write)
		[7]: any_setOrder_result1_upvr (readonly)
	]]
	local function INLINED_6() -- Internal function, doesn't exist in bytecode
		local var318 = tbl_10_upvr[arg1.KeyCode.Value]
		return var318
	end
	if arg1.UserInputType == Enum.UserInputType.Keyboard and not var60_upvw and not TextChatService_upvr:FindFirstChildOfClass("ChatInputBarConfiguration").IsFocused and (var59_upvw or arg1.KeyCode.Value == Value_upvr) or INLINED_6() then
		var318(arg2)
	end
	local UserInputType = arg1.UserInputType
	if not arg2 and (UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch) then
		if var46_upvw.Visible then
			any_setOrder_result1_upvr:deselect()
		end
	end
end
OnPreferredTransparencyChanged_upvr = OnPreferredTransparencyChanged_upvr:Connect
OnPreferredTransparencyChanged_upvr(TextBox_upvr)
OnPreferredTransparencyChanged_upvr = UserInputService_upvr.TextBoxFocused
function TextBox_upvr() -- Line 2096
	--[[ Upvalues[1]:
		[1]: var60_upvw (read and write)
	]]
	var60_upvw = true
end
OnPreferredTransparencyChanged_upvr = OnPreferredTransparencyChanged_upvr:Connect
OnPreferredTransparencyChanged_upvr(TextBox_upvr)
OnPreferredTransparencyChanged_upvr = UserInputService_upvr.TextBoxFocusReleased
function TextBox_upvr() -- Line 2099
	--[[ Upvalues[1]:
		[1]: var60_upvw (read and write)
	]]
	var60_upvw = false
end
OnPreferredTransparencyChanged_upvr = OnPreferredTransparencyChanged_upvr:Connect
OnPreferredTransparencyChanged_upvr(TextBox_upvr)
function OnPreferredTransparencyChanged_upvr() -- Line 2104
	--[[ Upvalues[3]:
		[1]: var58_upvw (read and write)
		[2]: Humanoid_upvw (read and write)
		[3]: tbl_2_upvr (readonly)
	]]
	if var58_upvw then
		if Humanoid_upvw then
			Humanoid_upvw:UnequipTools()
			if var58_upvw then
				var58_upvw:ToggleSelect()
				tbl_2_upvr[var58_upvw]:UpdateEquipView()
				var58_upvw = nil
			end
		end
	end
end
tbl_10_upvr[Value_upvr] = OnPreferredTransparencyChanged_upvr
OnPreferredTransparencyChanged_upvr = UserInputService_upvr.LastInputTypeChanged
TextBox_upvr = OnUISChanged
OnPreferredTransparencyChanged_upvr = OnPreferredTransparencyChanged_upvr:Connect
OnPreferredTransparencyChanged_upvr(TextBox_upvr)
OnPreferredTransparencyChanged_upvr = OnUISChanged
OnPreferredTransparencyChanged_upvr()
TextBox_upvr = Enum.UserInputType.Gamepad1
OnPreferredTransparencyChanged_upvr = UserInputService_upvr:GetGamepadConnected(TextBox_upvr)
if OnPreferredTransparencyChanged_upvr then
	OnPreferredTransparencyChanged_upvr = gamepadConnected
	OnPreferredTransparencyChanged_upvr()
end
OnPreferredTransparencyChanged_upvr = UserInputService_upvr.GamepadConnected
function TextBox_upvr(arg1) -- Line 2118
	if arg1 == Enum.UserInputType.Gamepad1 then
		gamepadConnected()
	end
end
OnPreferredTransparencyChanged_upvr = OnPreferredTransparencyChanged_upvr:Connect
OnPreferredTransparencyChanged_upvr(TextBox_upvr)
OnPreferredTransparencyChanged_upvr = UserInputService_upvr.GamepadDisconnected
function TextBox_upvr(arg1) -- Line 2123
	if arg1 == Enum.UserInputType.Gamepad1 then
		gamepadDisconnected()
	end
end
OnPreferredTransparencyChanged_upvr = OnPreferredTransparencyChanged_upvr:Connect
OnPreferredTransparencyChanged_upvr(TextBox_upvr)
function OnPreferredTransparencyChanged_upvr(arg1, arg2) -- Line 2131, Named "SetBackpackEnabled"
	--[[ Upvalues[1]:
		[1]: var36_upvw (read and write)
	]]
	var36_upvw = arg2
end
module_upvr.SetBackpackEnabled = OnPreferredTransparencyChanged_upvr
function OnPreferredTransparencyChanged_upvr(arg1) -- Line 2136, Named "IsOpened"
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.IsOpen
end
module_upvr.IsOpened = OnPreferredTransparencyChanged_upvr
function OnPreferredTransparencyChanged_upvr(arg1) -- Line 2141, Named "GetBackpackEnabled"
	--[[ Upvalues[1]:
		[1]: var36_upvw (read and write)
	]]
	return var36_upvw
end
module_upvr.GetBackpackEnabled = OnPreferredTransparencyChanged_upvr
function OnPreferredTransparencyChanged_upvr(arg1) -- Line 2146, Named "GetStateChangedEvent"
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.StateChanged
end
module_upvr.GetStateChangedEvent = OnPreferredTransparencyChanged_upvr
OnPreferredTransparencyChanged_upvr = game:GetService("RunService").Heartbeat
function TextBox_upvr() -- Line 2151
	--[[ Upvalues[8]:
		[1]: var36_upvw (read and write)
		[2]: StarterGui_upvr (readonly)
		[3]: var59_upvw (read and write)
		[4]: var354_upvw (read and write)
		[5]: var57_upvw (read and write)
		[6]: var41_upvw (read and write)
		[7]: ContextActionService_upvr (readonly)
		[8]: var336_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 4. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 8. Error Block 3 start (CF ANALYSIS FAILED)
	local any_GetCore_result1 = StarterGui_upvr:GetCore("TopbarEnabled")
	var59_upvw = any_GetCore_result1
	var354_upvw.Visible = any_GetCore_result1
	-- KONSTANTERROR: [8] 8. Error Block 3 end (CF ANALYSIS FAILED)
end
OnPreferredTransparencyChanged_upvr = OnPreferredTransparencyChanged_upvr:Connect
OnPreferredTransparencyChanged_upvr(TextBox_upvr)
function OnPreferredTransparencyChanged_upvr() -- Line 2156, Named "OnPreferredTransparencyChanged"
	--[[ Upvalues[9]:
		[1]: GuiService_upvr (readonly)
		[2]: var15_upvw (read and write)
		[3]: var14_upvr (readonly)
		[4]: var359_upvw (read and write)
		[5]: var21_upvw (read and write)
		[6]: var20_upvr (readonly)
		[7]: tbl_5_upvr (readonly)
		[8]: var28_upvw (read and write)
		[9]: Frame_6_upvr (readonly)
	]]
	local PreferredTransparency = GuiService_upvr.PreferredTransparency
	var15_upvw = var14_upvr * PreferredTransparency
	var359_upvw.BackgroundTransparency = var15_upvw
	var21_upvw = var20_upvr * PreferredTransparency
	for _, v_6 in ipairs(tbl_5_upvr) do
		v_6.Frame.BackgroundTransparency = var21_upvw
	end
	var28_upvw = PreferredTransparency * 0.2
	Frame_6_upvr.BackgroundTransparency = var28_upvw
end
TextButton_upvr = "PreferredTransparency"
TextButton_upvr = OnPreferredTransparencyChanged_upvr
GuiService_upvr:GetPropertyChangedSignal(TextButton_upvr):Connect(TextButton_upvr)
return module_upvr