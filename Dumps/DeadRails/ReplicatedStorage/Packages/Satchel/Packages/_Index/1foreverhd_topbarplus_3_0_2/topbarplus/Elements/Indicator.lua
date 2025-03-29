--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.1foreverhd_topbarplus@3.0.2.topbarplus.Elements.Indicator
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:18
-- Luau version 6, Types version 3
-- Time taken: 0.002235 seconds

return function(arg1, arg2) -- Line 1
	local widget_upvr = arg1.widget
	local Frame_upvr_2 = Instance.new("Frame")
	Frame_upvr_2.Name = "Indicator"
	Frame_upvr_2.LayoutOrder = 9999999
	Frame_upvr_2.ZIndex = 6
	Frame_upvr_2.Size = UDim2.new(0, 42, 0, 42)
	Frame_upvr_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr_2.BackgroundTransparency = 1
	Frame_upvr_2.Position = UDim2.new(1, 0, 0.5, 0)
	Frame_upvr_2.BorderSizePixel = 0
	Frame_upvr_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr_2.Parent = arg1:getInstance("Contents")
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "IndicatorButton"
	Frame_upvr.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame_upvr.BorderSizePixel = 0
	Frame_upvr.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr.Parent = Frame_upvr_2
	local GuiService_upvr = game:GetService("GuiService")
	local GamepadService_upvr = game:GetService("GamepadService")
	local any_getInstance_result1_upvr = arg1:getInstance("ClickRegion")
	local function selectionChanged() -- Line 28
		--[[ Upvalues[3]:
			[1]: GuiService_upvr (readonly)
			[2]: any_getInstance_result1_upvr (readonly)
			[3]: Frame_upvr (readonly)
		]]
		if GuiService_upvr.SelectedObject == any_getInstance_result1_upvr then
			Frame_upvr.BackgroundTransparency = 1
			Frame_upvr.Position = UDim2.new(0.5, -2, 0.5, 0)
			Frame_upvr.Size = UDim2.fromScale(1.2, 1.2)
		else
			Frame_upvr.BackgroundTransparency = 0.75
			Frame_upvr.Position = UDim2.new(0.5, 2, 0.5, 0)
			Frame_upvr.Size = UDim2.fromScale(1, 1)
		end
	end
	arg1.janitor:add(GuiService_upvr:GetPropertyChangedSignal("SelectedObject"):Connect(selectionChanged))
	selectionChanged()
	local ImageLabel_upvr = Instance.new("ImageLabel")
	ImageLabel_upvr.LayoutOrder = 2
	ImageLabel_upvr.ZIndex = 15
	ImageLabel_upvr.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel_upvr.Size = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel_upvr.BackgroundTransparency = 1
	ImageLabel_upvr.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel_upvr.Image = "rbxasset://textures/ui/Controls/XboxController/DPadUp@2x.png"
	ImageLabel_upvr.Parent = Frame_upvr
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Frame_upvr
	local function setIndicatorVisible_upvr(arg1_2) -- Line 58, Named "setIndicatorVisible"
		--[[ Upvalues[3]:
			[1]: Frame_upvr_2 (readonly)
			[2]: GamepadService_upvr (readonly)
			[3]: arg1 (readonly)
		]]
		if arg1_2 == nil then
		end
		if GamepadService_upvr.GamepadCursorEnabled then
			local var10 = false
		end
		if var10 then
			arg1:modifyTheme({"PaddingRight", "Size", UDim2.new(0, 0, 1, 0)}, "IndicatorPadding")
		elseif Frame_upvr_2.Visible then
			arg1:removeModification("IndicatorPadding")
		end
		arg1:modifyTheme({"Indicator", "Visible", var10})
		arg1.updateSize:Fire()
	end
	arg1.janitor:add(GamepadService_upvr:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(setIndicatorVisible_upvr))
	local UserInputService_upvr = game:GetService("UserInputService")
	arg1.indicatorSet:Connect(function(arg1_3) -- Line 74
		--[[ Upvalues[3]:
			[1]: ImageLabel_upvr (readonly)
			[2]: UserInputService_upvr (readonly)
			[3]: setIndicatorVisible_upvr (readonly)
		]]
		local var15 = false
		if arg1_3 then
			ImageLabel_upvr.Image = UserInputService_upvr:GetImageForKeyCode(arg1_3)
			var15 = true
		end
		setIndicatorVisible_upvr(var15)
	end)
	widget_upvr:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line 83, Named "updateSize"
		--[[ Upvalues[2]:
			[1]: widget_upvr (readonly)
			[2]: Frame_upvr_2 (readonly)
		]]
		local var16 = widget_upvr.AbsoluteSize.Y * 0.96
		Frame_upvr_2.Size = UDim2.new(0, var16, 0, var16)
	end)
	local var17 = widget_upvr.AbsoluteSize.Y * 0.96
	Frame_upvr_2.Size = UDim2.new(0, var17, 0, var17)
	return Frame_upvr_2
end