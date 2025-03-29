--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.TouchThumbstick
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:44
-- Luau version 6, Types version 3
-- Time taken: 0.005662 seconds

local module_upvr = require(script.Parent:WaitForChild("BaseCharacterController"))
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new() -- Line 20
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_2_upvr)
	setmetatable_result1.isFollowStick = false
	setmetatable_result1.thumbstickFrame = nil
	setmetatable_result1.moveTouchObject = nil
	setmetatable_result1.onTouchMovedConn = nil
	setmetatable_result1.onTouchEndedConn = nil
	setmetatable_result1.screenPos = nil
	setmetatable_result1.stickImage = nil
	setmetatable_result1.thumbstickSize = nil
	return setmetatable_result1
end
function setmetatable_result1_2_upvr.Enable(arg1, arg2, arg3) -- Line 35
	if arg2 == nil then
		return false
	end
	if arg2 then
	else
	end
	local var4 = false
	if arg1.enabled == var4 then
		return true
	end
	arg1.moveVector = Vector3.new(0, 0, 0)
	arg1.isJumping = false
	if var4 then
		if not arg1.thumbstickFrame then
			arg1:Create(arg3)
		end
		arg1.thumbstickFrame.Visible = true
	else
		arg1.thumbstickFrame.Visible = false
		arg1:OnInputEnded()
	end
	arg1.enabled = var4
end
function setmetatable_result1_2_upvr.OnInputEnded(arg1) -- Line 56
	arg1.thumbstickFrame.Position = arg1.screenPos
	arg1.stickImage.Position = UDim2.new(0, arg1.thumbstickFrame.Size.X.Offset / 2 - arg1.thumbstickSize / 4, 0, arg1.thumbstickFrame.Size.Y.Offset / 2 - arg1.thumbstickSize / 4)
	arg1.moveVector = Vector3.new(0, 0, 0)
	arg1.isJumping = false
	arg1.thumbstickFrame.Position = arg1.screenPos
	arg1.moveTouchObject = nil
end
local UserInputService_upvr = game:GetService("UserInputService")
local GuiService_upvr = game:GetService("GuiService")
function setmetatable_result1_2_upvr.Create(arg1, arg2) -- Line 65
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: GuiService_upvr (readonly)
	]]
	if arg1.thumbstickFrame then
		arg1.thumbstickFrame:Destroy()
		arg1.thumbstickFrame = nil
		if arg1.onTouchMovedConn then
			arg1.onTouchMovedConn:Disconnect()
			arg1.onTouchMovedConn = nil
		end
		if arg1.onTouchEndedConn then
			arg1.onTouchEndedConn:Disconnect()
			arg1.onTouchEndedConn = nil
		end
		if arg1.absoluteSizeChangedConn then
			arg1.absoluteSizeChangedConn:Disconnect()
			arg1.absoluteSizeChangedConn = nil
		end
	end
	arg1.thumbstickFrame = Instance.new("Frame")
	arg1.thumbstickFrame.Name = "ThumbstickFrame"
	arg1.thumbstickFrame.Active = true
	arg1.thumbstickFrame.Visible = false
	arg1.thumbstickFrame.BackgroundTransparency = 1
	local ImageLabel_upvr = Instance.new("ImageLabel")
	ImageLabel_upvr.Name = "OuterImage"
	ImageLabel_upvr.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
	ImageLabel_upvr.ImageRectOffset = Vector2.new()
	ImageLabel_upvr.ImageRectSize = Vector2.new(220, 220)
	ImageLabel_upvr.BackgroundTransparency = 1
	ImageLabel_upvr.Position = UDim2.new(0, 0, 0, 0)
	arg1.stickImage = Instance.new("ImageLabel")
	arg1.stickImage.Name = "StickImage"
	arg1.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
	arg1.stickImage.ImageRectOffset = Vector2.new(220, 0)
	arg1.stickImage.ImageRectSize = Vector2.new(111, 111)
	arg1.stickImage.BackgroundTransparency = 1
	arg1.stickImage.ZIndex = 2
	local function ResizeThumbstick() -- Line 105
		--[[ Upvalues[3]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
			[3]: ImageLabel_upvr (readonly)
		]]
		local X = arg2.AbsoluteSize.X
		local var9
		if math.min(X, arg2.AbsoluteSize.Y) > 500 then
			X = false
		else
			X = true
		end
		if X then
			var9 = 70
		else
			var9 = 120
		end
		arg1.thumbstickSize = var9
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var9 = UDim2.new(0, arg1.thumbstickSize / 2 - 10, 1, -arg1.thumbstickSize - 20)
			return var9
		end
		if not X or not INLINED() then
			var9 = UDim2.new(0, arg1.thumbstickSize / 2, 1, -arg1.thumbstickSize * 1.75)
		end
		arg1.screenPos = var9
		var9 = arg1
		var9 = UDim2.new(0, arg1.thumbstickSize, 0, arg1.thumbstickSize)
		var9.thumbstickFrame.Size = var9
		var9 = arg1
		var9 = arg1.screenPos
		var9.thumbstickFrame.Position = var9
		var9 = UDim2.new(0, arg1.thumbstickSize, 0, arg1.thumbstickSize)
		ImageLabel_upvr.Size = var9
		var9 = arg1
		var9 = UDim2.new(0, arg1.thumbstickSize / 2, 0, arg1.thumbstickSize / 2)
		var9.stickImage.Size = var9
		var9 = arg1
		var9 = UDim2.new(0, arg1.thumbstickSize / 2 - arg1.thumbstickSize / 4, 0, arg1.thumbstickSize / 2 - arg1.thumbstickSize / 4)
		var9.stickImage.Position = var9
	end
	ResizeThumbstick()
	arg1.absoluteSizeChangedConn = arg2:GetPropertyChangedSignal("AbsoluteSize"):Connect(ResizeThumbstick)
	ImageLabel_upvr.Parent = arg1.thumbstickFrame
	arg1.stickImage.Parent = arg1.thumbstickFrame
	local var10_upvw
	local function _(arg1_2) -- Line 127, Named "DoMove"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var11 = (arg1_2) / (arg1.thumbstickSize / 2)
		if var11.magnitude < 0.05 then
			var11 = Vector3.new()
		else
			var11 = var11.unit * math.min(1, (var11.magnitude - 0.05) / 0.95)
			var11 = Vector3.new(var11.X, 0, var11.Y)
		end
		arg1.moveVector = var11
	end
	local function MoveStick_upvr(arg1_3) -- Line 145, Named "MoveStick"
		--[[ Upvalues[2]:
			[1]: var10_upvw (read and write)
			[2]: arg1 (readonly)
		]]
		local magnitude = Vector2.new(arg1_3.X - var10_upvw.X, arg1_3.Y - var10_upvw.Y).magnitude
		local var14 = arg1.thumbstickFrame.AbsoluteSize.X / 2
		local var15
		if arg1.isFollowStick and var14 < magnitude then
			local var16 = var15.unit * var14
			arg1.thumbstickFrame.Position = UDim2.new(0, arg1_3.X - arg1.thumbstickFrame.AbsoluteSize.X / 2 - var16.X, 0, arg1_3.Y - arg1.thumbstickFrame.AbsoluteSize.Y / 2 - var16.Y)
		else
			var15 = var15.unit * math.min(magnitude, var14)
		end
		arg1.stickImage.Position = UDim2.new(0, var15.X + arg1.stickImage.AbsoluteSize.X / 2, 0, var15.Y + arg1.stickImage.AbsoluteSize.Y / 2)
	end
	arg1.thumbstickFrame.InputBegan:Connect(function(arg1_4) -- Line 162
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var10_upvw (read and write)
		]]
		if arg1.moveTouchObject or arg1_4.UserInputType ~= Enum.UserInputType.Touch or arg1_4.UserInputState ~= Enum.UserInputState.Begin then
		else
			arg1.moveTouchObject = arg1_4
			arg1.thumbstickFrame.Position = UDim2.new(0, arg1_4.Position.X - arg1.thumbstickFrame.Size.X.Offset / 2, 0, arg1_4.Position.Y - arg1.thumbstickFrame.Size.Y.Offset / 2)
			var10_upvw = Vector2.new(arg1.thumbstickFrame.AbsolutePosition.X + arg1.thumbstickFrame.AbsoluteSize.X / 2, arg1.thumbstickFrame.AbsolutePosition.Y + arg1.thumbstickFrame.AbsoluteSize.Y / 2)
		end
	end)
	arg1.onTouchMovedConn = UserInputService_upvr.TouchMoved:Connect(function(arg1_5, arg2_2) -- Line 177
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: var10_upvw (read and write)
			[3]: MoveStick_upvr (readonly)
		]]
		if arg1_5 == arg1.moveTouchObject then
			var10_upvw = Vector2.new(arg1.thumbstickFrame.AbsolutePosition.X + arg1.thumbstickFrame.AbsoluteSize.X / 2, arg1.thumbstickFrame.AbsolutePosition.Y + arg1.thumbstickFrame.AbsoluteSize.Y / 2)
			local var19 = (Vector2.new(arg1_5.Position.X - var10_upvw.X, arg1_5.Position.Y - var10_upvw.Y)) / (arg1.thumbstickSize / 2)
			if var19.magnitude < 0.05 then
				var19 = Vector3.new()
			else
				var19 = var19.unit * math.min(1, (var19.magnitude - 0.05) / 0.95)
				var19 = Vector3.new(var19.X, 0, var19.Y)
			end
			arg1.moveVector = var19
			MoveStick_upvr(arg1_5.Position)
		end
	end)
	arg1.onTouchEndedConn = UserInputService_upvr.TouchEnded:Connect(function(arg1_6, arg2_3) -- Line 187
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_6 == arg1.moveTouchObject then
			arg1:OnInputEnded()
		end
	end)
	GuiService_upvr.MenuOpened:Connect(function() -- Line 193
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1.moveTouchObject then
			arg1:OnInputEnded()
		end
	end)
	arg1.thumbstickFrame.Parent = arg2
end
return setmetatable_result1_2_upvr