--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.DynamicThumbstick
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:34
-- Luau version 6, Types version 3
-- Time taken: 0.021150 seconds

local tbl_upvr = {0.10999999999999999, 0.30000000000000004, 0.4, 0.5, 0.6, 0.7, 0.75}
local len_upvr = #tbl_upvr
local Players = game:GetService("Players")
local UserInputService_upvr = game:GetService("UserInputService")
local ContextActionService_upvr = game:GetService("ContextActionService")
local TweenService_upvr = game:GetService("TweenService")
local pcall_result1_2, pcall_result2_2 = pcall(function() -- Line 37
	return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickMoveOverButtons2")
end)
local var10_upvw = pcall_result1_2 and pcall_result2_2
local pcall_result1, pcall_result2 = pcall(function() -- Line 44
	return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate")
end)
pcall_result1 = Players.LocalPlayer
local var14_upvw = pcall_result1
if not var14_upvw then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	var14_upvw = Players.LocalPlayer
end
local module_upvr = require(script.Parent:WaitForChild("BaseCharacterController"))
local setmetatable_result1_upvr = setmetatable({}, module_upvr)
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
function setmetatable_result1_upvr.new() -- Line 61
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_upvr)
	setmetatable_result1.moveTouchObject = nil
	setmetatable_result1.moveTouchLockedIn = false
	setmetatable_result1.moveTouchFirstChanged = false
	setmetatable_result1.moveTouchStartPosition = nil
	setmetatable_result1.startImage = nil
	setmetatable_result1.endImage = nil
	setmetatable_result1.middleImages = {}
	setmetatable_result1.startImageFadeTween = nil
	setmetatable_result1.endImageFadeTween = nil
	setmetatable_result1.middleImageFadeTweens = {}
	setmetatable_result1.isFirstTouch = true
	setmetatable_result1.thumbstickFrame = nil
	setmetatable_result1.onRenderSteppedConn = nil
	setmetatable_result1.fadeInAndOutBalance = 0.5
	setmetatable_result1.fadeInAndOutHalfDuration = 0.3
	setmetatable_result1.hasFadedBackgroundInPortrait = false
	setmetatable_result1.hasFadedBackgroundInLandscape = false
	setmetatable_result1.tweenInAlphaStart = nil
	setmetatable_result1.tweenOutAlphaStart = nil
	return setmetatable_result1
end
function setmetatable_result1_upvr.GetIsJumping(arg1) -- Line 96
	arg1.isJumping = false
	return arg1.isJumping
end
function setmetatable_result1_upvr.Enable(arg1, arg2, arg3) -- Line 102
	--[[ Upvalues[2]:
		[1]: var10_upvw (read and write)
		[2]: ContextActionService_upvr (readonly)
	]]
	if arg2 == nil then
		return false
	end
	if arg2 then
	else
	end
	local var18 = false
	if arg1.enabled == var18 then
		return true
	end
	if var18 then
		if not arg1.thumbstickFrame then
			arg1:Create(arg3)
		end
		arg1:BindContextActions()
	else
		if var10_upvw then
			arg1:UnbindContextActions()
		else
			ContextActionService_upvr:UnbindAction("DynamicThumbstickAction")
		end
		arg1:OnInputEnded()
	end
	arg1.enabled = var18
	arg1.thumbstickFrame.Visible = var18
	return nil
end
function setmetatable_result1_upvr.OnInputEnded(arg1) -- Line 131
	arg1.moveTouchObject = nil
	arg1.moveVector = Vector3.new(0, 0, 0)
	arg1:FadeThumbstick(false)
end
local TweenInfo_new_result1_2_upvr = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
function setmetatable_result1_upvr.FadeThumbstick(arg1, arg2) -- Line 137
	--[[ Upvalues[3]:
		[1]: TweenService_upvr (readonly)
		[2]: TweenInfo_new_result1_2_upvr (readonly)
		[3]: tbl_upvr (readonly)
	]]
	if not arg2 and arg1.moveTouchObject then
	else
		if arg1.isFirstTouch then return end
		if arg1.startImageFadeTween then
			arg1.startImageFadeTween:Cancel()
		end
		if arg1.endImageFadeTween then
			arg1.endImageFadeTween:Cancel()
		end
		for i_3 = 1, #arg1.middleImages do
			if arg1.middleImageFadeTweens[i_3] then
				arg1.middleImageFadeTweens[i_3]:Cancel()
			end
		end
		if arg2 then
			i_3 = arg1.startImage
			arg1.startImageFadeTween = TweenService_upvr:Create(i_3, TweenInfo_new_result1_2_upvr, {
				ImageTransparency = 0;
			})
			arg1.startImageFadeTween:Play()
			i_3 = arg1.endImage
			arg1.endImageFadeTween = TweenService_upvr:Create(i_3, TweenInfo_new_result1_2_upvr, {
				ImageTransparency = 0.2;
			})
			arg1.endImageFadeTween:Play()
			i_3 = 1
			for i_4 = i_3, #arg1.middleImages do
				arg1.middleImageFadeTweens[i_4] = TweenService_upvr:Create(arg1.middleImages[i_4], TweenInfo_new_result1_2_upvr, {
					ImageTransparency = tbl_upvr[i_4];
				})
				arg1.middleImageFadeTweens[i_4]:Play()
			end
			return
		end
		arg1.startImageFadeTween = TweenService_upvr:Create(arg1.startImage, TweenInfo_new_result1_2_upvr, {
			ImageTransparency = 1;
		})
		arg1.startImageFadeTween:Play()
		arg1.endImageFadeTween = TweenService_upvr:Create(arg1.endImage, TweenInfo_new_result1_2_upvr, {
			ImageTransparency = 1;
		})
		arg1.endImageFadeTween:Play()
		for i_5 = 1, #arg1.middleImages do
			arg1.middleImageFadeTweens[i_5] = TweenService_upvr:Create(arg1.middleImages[i_5], TweenInfo_new_result1_2_upvr, {
				ImageTransparency = 1;
			})
			arg1.middleImageFadeTweens[i_5]:Play()
		end
	end
end
function setmetatable_result1_upvr.FadeThumbstickFrame(arg1, arg2, arg3) -- Line 180
	arg1.fadeInAndOutHalfDuration = arg2 * 0.5
	arg1.fadeInAndOutBalance = arg3
	arg1.tweenInAlphaStart = tick()
end
function setmetatable_result1_upvr.InputInFrame(arg1, arg2) -- Line 186
	local AbsolutePosition = arg1.thumbstickFrame.AbsolutePosition
	local var30 = AbsolutePosition + arg1.thumbstickFrame.AbsoluteSize
	local Position = arg2.Position
	if AbsolutePosition.X <= Position.X and AbsolutePosition.Y <= Position.Y and Position.X <= var30.X and Position.Y <= var30.Y then
		return true
	end
	return false
end
function setmetatable_result1_upvr.DoFadeInBackground(arg1) -- Line 198
	--[[ Upvalues[1]:
		[1]: var14_upvw (read and write)
	]]
	local class_PlayerGui = var14_upvw:FindFirstChildOfClass("PlayerGui")
	local var33 = false
	if class_PlayerGui then
		if class_PlayerGui.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeLeft or class_PlayerGui.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeRight then
			var33 = arg1.hasFadedBackgroundInLandscape
			arg1.hasFadedBackgroundInLandscape = true
		elseif class_PlayerGui.CurrentScreenOrientation == Enum.ScreenOrientation.Portrait then
			var33 = arg1.hasFadedBackgroundInPortrait
			arg1.hasFadedBackgroundInPortrait = true
		end
	end
	if not var33 then
		arg1.fadeInAndOutHalfDuration = 0.3
		arg1.fadeInAndOutBalance = 0.5
		arg1.tweenInAlphaStart = tick()
	end
end
function setmetatable_result1_upvr.DoMove(arg1, arg2) -- Line 221
	local var34 = arg2
	if var34.Magnitude < arg1.radiusOfDeadZone then
		var34 = Vector3.new(0, 0, 0)
	else
		var34 = var34.Unit * (1 - math.max(0, (arg1.radiusOfMaxSpeed - var34.Magnitude) / arg1.radiusOfMaxSpeed))
		var34 = Vector3.new(var34.X, 0, var34.Y)
	end
	arg1.moveVector = var34
end
function setmetatable_result1_upvr.LayoutMiddleImages(arg1, arg2, arg3) -- Line 239
	--[[ Upvalues[1]:
		[1]: len_upvr (readonly)
	]]
	local var37 = arg1.thumbstickSize / 2 + arg1.middleSize
	local var38 = arg3 - arg2
	local var39 = var38.Magnitude - arg1.thumbstickRingSize / 2 - arg1.middleSize
	local var40
	if arg1.middleSpacing * len_upvr < var39 then
		var40 = var39 / len_upvr
	end
	for i = 1, len_upvr do
		local var41 = arg1.middleImages[i]
		local var42 = var37 + var40 * (i - 1)
		if var37 + var40 * (i - 2) < var39 then
			local var43 = arg3 - var38.Unit * var42
			local clamped = math.clamp(1 - (var42 - var39) / var40, 0, 1)
			var41.Visible = true
			var41.Position = UDim2.new(0, var43.X, 0, var43.Y)
			var41.Size = UDim2.new(0, arg1.middleSize * clamped, 0, arg1.middleSize * clamped)
		else
			var41.Visible = false
		end
	end
end
function setmetatable_result1_upvr.MoveStick(arg1, arg2) -- Line 270
	local var45 = Vector2.new(arg2.X, arg2.Y) - arg1.thumbstickFrame.AbsolutePosition
	arg1.endImage.Position = UDim2.new(0, var45.X, 0, var45.Y)
	arg1:LayoutMiddleImages(Vector2.new(arg1.moveTouchStartPosition.X, arg1.moveTouchStartPosition.Y) - arg1.thumbstickFrame.AbsolutePosition, var45)
end
local Value_upvr = Enum.ContextActionPriority.High.Value
function setmetatable_result1_upvr.BindContextActions(arg1) -- Line 278
	--[[ Upvalues[5]:
		[1]: TweenService_upvr (readonly)
		[2]: var10_upvw (read and write)
		[3]: ContextActionService_upvr (readonly)
		[4]: Value_upvr (readonly)
		[5]: UserInputService_upvr (readonly)
	]]
	local function inputBegan_upvr(arg1_2) -- Line 279, Named "inputBegan"
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: TweenService_upvr (copied, readonly)
		]]
		if arg1.moveTouchObject then
			return Enum.ContextActionResult.Pass
		end
		if not arg1:InputInFrame(arg1_2) then
			return Enum.ContextActionResult.Pass
		end
		if arg1.isFirstTouch then
			arg1.isFirstTouch = false
			local TweenInfo_new_result1 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
			TweenService_upvr:Create(arg1.startImage, TweenInfo_new_result1, {
				Size = UDim2.new(0, 0, 0, 0);
			}):Play()
			TweenService_upvr:Create(arg1.endImage, TweenInfo_new_result1, {
				Size = UDim2.new(0, arg1.thumbstickSize, 0, arg1.thumbstickSize);
				ImageColor3 = Color3.new(0, 0, 0);
			}):Play()
		end
		arg1.moveTouchLockedIn = false
		arg1.moveTouchObject = arg1_2
		arg1.moveTouchStartPosition = arg1_2.Position
		arg1.moveTouchFirstChanged = true
		arg1:DoFadeInBackground()
		return Enum.ContextActionResult.Pass
	end
	local function inputChanged_upvr(arg1_3) -- Line 311, Named "inputChanged"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_3 == arg1.moveTouchObject then
			if arg1.moveTouchFirstChanged then
				arg1.moveTouchFirstChanged = false
				local vector2_2 = Vector2.new(arg1_3.Position.X - arg1.thumbstickFrame.AbsolutePosition.X, arg1_3.Position.Y - arg1.thumbstickFrame.AbsolutePosition.Y)
				arg1.startImage.Visible = true
				arg1.startImage.Position = UDim2.new(0, vector2_2.X, 0, vector2_2.Y)
				arg1.endImage.Visible = true
				arg1.endImage.Position = arg1.startImage.Position
				arg1:FadeThumbstick(true)
				arg1:MoveStick(arg1_3.Position)
			end
			arg1.moveTouchLockedIn = true
			local vector2 = Vector2.new(arg1_3.Position.X - arg1.moveTouchStartPosition.X, arg1_3.Position.Y - arg1.moveTouchStartPosition.Y)
			if 0 < math.abs(vector2.X) or 0 < math.abs(vector2.Y) then
				arg1:DoMove(vector2)
				arg1:MoveStick(arg1_3.Position)
			end
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end
	local function _(arg1_4) -- Line 344, Named "inputEnded"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_4 == arg1.moveTouchObject then
			arg1:OnInputEnded()
			if arg1.moveTouchLockedIn then
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end
	ContextActionService_upvr:BindActionAtPriority("DynamicThumbstickAction", function(arg1_5, arg2, arg3) -- Line 354, Named "handleInput"
		--[[ Upvalues[4]:
			[1]: inputBegan_upvr (readonly)
			[2]: var10_upvw (copied, read and write)
			[3]: arg1 (readonly)
			[4]: inputChanged_upvr (readonly)
		]]
		if arg2 == Enum.UserInputState.Begin then
			return inputBegan_upvr(arg3)
		end
		if arg2 == Enum.UserInputState.Change then
			if var10_upvw then
				if arg3 == arg1.moveTouchObject then
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end
			return inputChanged_upvr(arg3)
		end
		if arg2 == Enum.UserInputState.End then
			if arg3 == arg1.moveTouchObject then
				arg1:OnInputEnded()
				if arg1.moveTouchLockedIn then
					return Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end
		if arg2 == Enum.UserInputState.Cancel then
			arg1:OnInputEnded()
		end
	end, false, Value_upvr, Enum.UserInputType.Touch)
	if var10_upvw then
		arg1.TouchMovedCon = UserInputService_upvr.TouchMoved:Connect(function(arg1_6, arg2) -- Line 382
			--[[ Upvalues[1]:
				[1]: inputChanged_upvr (readonly)
			]]
			inputChanged_upvr(arg1_6)
		end)
	end
end
function setmetatable_result1_upvr.UnbindContextActions(arg1) -- Line 388
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	ContextActionService_upvr:UnbindAction("DynamicThumbstickAction")
	if arg1.TouchMovedCon then
		arg1.TouchMovedCon:Disconnect()
	end
end
local var53_upvw = pcall_result1 and pcall_result2
local RunService_upvr = game:GetService("RunService")
local GuiService_upvr = game:GetService("GuiService")
function setmetatable_result1_upvr.Create(arg1, arg2) -- Line 396
	--[[ Upvalues[7]:
		[1]: var53_upvw (read and write)
		[2]: len_upvr (readonly)
		[3]: tbl_upvr (readonly)
		[4]: RunService_upvr (readonly)
		[5]: UserInputService_upvr (readonly)
		[6]: GuiService_upvr (readonly)
		[7]: var14_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var60_upvr
	if var60_upvr then
		var60_upvr = arg1.thumbstickFrame:Destroy
		var60_upvr()
		var60_upvr = nil
		arg1.thumbstickFrame = var60_upvr
		var60_upvr = arg1.onRenderSteppedConn
		if var60_upvr then
			var60_upvr = arg1.onRenderSteppedConn:Disconnect
			var60_upvr()
			var60_upvr = nil
			arg1.onRenderSteppedConn = var60_upvr
		end
		var60_upvr = arg1.absoluteSizeChangedConn
		if var60_upvr then
			var60_upvr = arg1.absoluteSizeChangedConn:Disconnect
			var60_upvr()
			var60_upvr = nil
			arg1.absoluteSizeChangedConn = var60_upvr
		end
	end
	if var53_upvw then
		var60_upvr = 100
	else
		var60_upvr = 0
	end
	local function layoutThumbstickFrame_upvr(arg1_7) -- Line 411, Named "layoutThumbstickFrame"
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var60_upvr (readonly)
		]]
		if arg1_7 then
			arg1.thumbstickFrame.Size = UDim2.new(1, var60_upvr, 0.4, var60_upvr)
			arg1.thumbstickFrame.Position = UDim2.new(0, -var60_upvr, 0.6, 0)
		else
			arg1.thumbstickFrame.Size = UDim2.new(0.4, var60_upvr, 0.6666666666666666, var60_upvr)
			arg1.thumbstickFrame.Position = UDim2.new(0, -var60_upvr, 0.3333333333333333, 0)
		end
	end
	arg1.thumbstickFrame = Instance.new("Frame")
	arg1.thumbstickFrame.BorderSizePixel = 0
	arg1.thumbstickFrame.Name = "DynamicThumbstickFrame"
	arg1.thumbstickFrame.Visible = false
	arg1.thumbstickFrame.BackgroundTransparency = 1
	arg1.thumbstickFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	arg1.thumbstickFrame.Active = false
	layoutThumbstickFrame_upvr(false)
	arg1.startImage = Instance.new("ImageLabel")
	arg1.startImage.Name = "ThumbstickStart"
	arg1.startImage.Visible = true
	arg1.startImage.BackgroundTransparency = 1
	arg1.startImage.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
	arg1.startImage.ImageRectOffset = Vector2.new(1, 1)
	arg1.startImage.ImageRectSize = Vector2.new(144, 144)
	arg1.startImage.ImageColor3 = Color3.new(0, 0, 0)
	arg1.startImage.AnchorPoint = Vector2.new(0.5, 0.5)
	arg1.startImage.ZIndex = 10
	arg1.startImage.Parent = arg1.thumbstickFrame
	arg1.endImage = Instance.new("ImageLabel")
	arg1.endImage.Name = "ThumbstickEnd"
	arg1.endImage.Visible = true
	arg1.endImage.BackgroundTransparency = 1
	arg1.endImage.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
	arg1.endImage.ImageRectOffset = Vector2.new(1, 1)
	arg1.endImage.ImageRectSize = Vector2.new(144, 144)
	arg1.endImage.AnchorPoint = Vector2.new(0.5, 0.5)
	arg1.endImage.ZIndex = 10
	arg1.endImage.Parent = arg1.thumbstickFrame
	for i_2 = 1, len_upvr do
		arg1.middleImages[i_2] = Instance.new("ImageLabel")
		arg1.middleImages[i_2].Name = "ThumbstickMiddle"
		arg1.middleImages[i_2].Visible = false
		arg1.middleImages[i_2].BackgroundTransparency = 1
		arg1.middleImages[i_2].Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
		arg1.middleImages[i_2].ImageRectOffset = Vector2.new(1, 1)
		arg1.middleImages[i_2].ImageRectSize = Vector2.new(144, 144)
		arg1.middleImages[i_2].ImageTransparency = tbl_upvr[i_2]
		arg1.middleImages[i_2].AnchorPoint = Vector2.new(0.5, 0.5)
		arg1.middleImages[i_2].ZIndex = 9
		arg1.middleImages[i_2].Parent = arg1.thumbstickFrame
	end
	local function ResizeThumbstick() -- Line 467
		--[[ Upvalues[3]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
			[3]: var60_upvr (readonly)
		]]
		local var61 = arg2
		local AbsoluteSize = var61.AbsoluteSize
		if 500 >= math.min(AbsoluteSize.X, AbsoluteSize.Y) then
			var61 = false
		else
			var61 = true
		end
		if var61 then
			arg1.thumbstickSize = 90
			arg1.thumbstickRingSize = 40
			arg1.middleSize = 20
			arg1.middleSpacing = 28
			arg1.radiusOfDeadZone = 4
			arg1.radiusOfMaxSpeed = 40
		else
			arg1.thumbstickSize = 45
			arg1.thumbstickRingSize = 20
			arg1.middleSize = 10
			arg1.middleSpacing = 14
			arg1.radiusOfDeadZone = 2
			arg1.radiusOfMaxSpeed = 20
		end
		arg1.startImage.Position = UDim2.new(0, arg1.thumbstickRingSize * 3.3 + var60_upvr, 1, -arg1.thumbstickRingSize * 2.8 - var60_upvr)
		arg1.startImage.Size = UDim2.new(0, arg1.thumbstickRingSize * 3.7, 0, arg1.thumbstickRingSize * 3.7)
		arg1.endImage.Position = arg1.startImage.Position
		arg1.endImage.Size = UDim2.new(0, arg1.thumbstickSize * 0.8, 0, arg1.thumbstickSize * 0.8)
	end
	ResizeThumbstick()
	arg1.absoluteSizeChangedConn = arg2:GetPropertyChangedSignal("AbsoluteSize"):Connect(ResizeThumbstick)
	local var63_upvw
	local function onCurrentCameraChanged() -- Line 505
		--[[ Upvalues[2]:
			[1]: var63_upvw (read and write)
			[2]: layoutThumbstickFrame_upvr (readonly)
		]]
		if var63_upvw then
			var63_upvw:Disconnect()
			var63_upvw = nil
		end
		local CurrentCamera_upvr = workspace.CurrentCamera
		local var65
		if CurrentCamera_upvr then
			var63_upvw = CurrentCamera_upvr:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line 512, Named "onViewportSizeChanged"
				--[[ Upvalues[2]:
					[1]: CurrentCamera_upvr (readonly)
					[2]: layoutThumbstickFrame_upvr (copied, readonly)
				]]
				local var66 = CurrentCamera_upvr
				local ViewportSize = var66.ViewportSize
				if ViewportSize.X >= ViewportSize.Y then
					var66 = false
				else
					var66 = true
				end
				layoutThumbstickFrame_upvr(var66)
			end)
			local ViewportSize_2 = CurrentCamera_upvr.ViewportSize
			if ViewportSize_2.X >= ViewportSize_2.Y then
				var65 = false
			else
				var65 = true
			end
			layoutThumbstickFrame_upvr(var65)
		end
	end
	workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(onCurrentCameraChanged)
	if workspace.CurrentCamera then
		onCurrentCameraChanged()
	end
	arg1.moveTouchStartPosition = nil
	arg1.startImageFadeTween = nil
	arg1.endImageFadeTween = nil
	arg1.middleImageFadeTweens = {}
	arg1.onRenderSteppedConn = RunService_upvr.RenderStepped:Connect(function() -- Line 532
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [36] 26. Error Block 3 start (CF ANALYSIS FAILED)
		arg1.tweenOutAlphaStart = tick()
		arg1.tweenInAlphaStart = nil
		do
			return
		end
		-- KONSTANTERROR: [36] 26. Error Block 3 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [47] 34. Error Block 9 start (CF ANALYSIS FAILED)
		if arg1.tweenOutAlphaStart ~= nil then
			local var72 = tick() - arg1.tweenOutAlphaStart
			local var73 = arg1.fadeInAndOutHalfDuration * 2 - arg1.fadeInAndOutHalfDuration * 2 * arg1.fadeInAndOutBalance
			arg1.thumbstickFrame.BackgroundTransparency = math.min(var72 / var73, 1) * 0.35 + 0.65
			if var73 < var72 then
				arg1.tweenOutAlphaStart = nil
			end
		end
		-- KONSTANTERROR: [47] 34. Error Block 9 end (CF ANALYSIS FAILED)
	end)
	arg1.onTouchEndedConn = UserInputService_upvr.TouchEnded:connect(function(arg1_8) -- Line 551
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_8 == arg1.moveTouchObject then
			arg1:OnInputEnded()
		end
	end)
	GuiService_upvr.MenuOpened:connect(function() -- Line 557
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1.moveTouchObject then
			arg1:OnInputEnded()
		end
	end)
	while not var14_upvw:FindFirstChildOfClass("PlayerGui") do
		var14_upvw.ChildAdded:wait()
		local class_PlayerGui_upvw = var14_upvw:FindFirstChildOfClass("PlayerGui")
	end
	if class_PlayerGui_upvw.CurrentScreenOrientation ~= Enum.ScreenOrientation.LandscapeLeft then
		if class_PlayerGui_upvw.CurrentScreenOrientation ~= Enum.ScreenOrientation.LandscapeRight then
		else
		end
	end
	local function _() -- Line 573, Named "longShowBackground"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1.fadeInAndOutHalfDuration = 2.5
		arg1.fadeInAndOutBalance = 0.05
		arg1.tweenInAlphaStart = tick()
	end
	local var78_upvr = true
	local var79_upvw
	var79_upvw = class_PlayerGui_upvw:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function() -- Line 579
		--[[ Upvalues[4]:
			[1]: var78_upvr (readonly)
			[2]: class_PlayerGui_upvw (read and write)
			[3]: var79_upvw (read and write)
			[4]: arg1 (readonly)
		]]
		if var78_upvr and class_PlayerGui_upvw.CurrentScreenOrientation == Enum.ScreenOrientation.Portrait or not var78_upvr and class_PlayerGui_upvw.CurrentScreenOrientation ~= Enum.ScreenOrientation.Portrait then
			var79_upvw:disconnect()
			arg1.fadeInAndOutHalfDuration = 2.5
			arg1.fadeInAndOutBalance = 0.05
			arg1.tweenInAlphaStart = tick()
			if var78_upvr then
				arg1.hasFadedBackgroundInPortrait = true
				return
			end
			arg1.hasFadedBackgroundInLandscape = true
		end
	end)
	arg1.thumbstickFrame.Parent = arg2
	if game:IsLoaded() then
		arg1.fadeInAndOutHalfDuration = 2.5
		arg1.fadeInAndOutBalance = 0.05
		arg1.tweenInAlphaStart = tick()
	else
		coroutine.wrap(function() -- Line 599
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			game.Loaded:Wait()
			arg1.fadeInAndOutHalfDuration = 2.5
			arg1.fadeInAndOutBalance = 0.05
			arg1.tweenInAlphaStart = tick()
		end)()
	end
end
return setmetatable_result1_upvr