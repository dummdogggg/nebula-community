--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.1foreverhd_topbarplus@3.0.2.topbarplus.Elements.Widget
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:22
-- Luau version 6, Types version 3
-- Time taken: 0.013212 seconds

return function(arg1, arg2) -- Line 6
	local Frame_upvr_7 = Instance.new("Frame")
	Frame_upvr_7:SetAttribute("WidgetUID", arg1.UID)
	Frame_upvr_7.Name = "Widget"
	Frame_upvr_7.BackgroundTransparency = 1
	Frame_upvr_7.Visible = true
	Frame_upvr_7.ZIndex = 20
	Frame_upvr_7.Active = false
	Frame_upvr_7.ClipsDescendants = true
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "IconButton"
	Frame_upvr.Visible = true
	Frame_upvr.ZIndex = 2
	Frame_upvr.BorderSizePixel = 0
	Frame_upvr.Parent = Frame_upvr_7
	Frame_upvr.ClipsDescendants = true
	Frame_upvr.Active = false
	arg1.deselected:Connect(function() -- Line 25
		--[[ Upvalues[1]:
			[1]: Frame_upvr (readonly)
		]]
		Frame_upvr.ClipsDescendants = true
	end)
	arg1.selected:Connect(function() -- Line 28
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: Frame_upvr (readonly)
		]]
		task.defer(function() -- Line 29
			--[[ Upvalues[2]:
				[1]: arg1 (copied, readonly)
				[2]: Frame_upvr (copied, readonly)
			]]
			arg1.resizingComplete:Once(function() -- Line 30
				--[[ Upvalues[2]:
					[1]: arg1 (copied, readonly)
					[2]: Frame_upvr (copied, readonly)
				]]
				if arg1.isSelected then
					Frame_upvr.ClipsDescendants = false
				end
			end)
		end)
	end)
	local UICorner = Instance.new("UICorner")
	UICorner:SetAttribute("Collective", "IconCorners")
	UICorner.Parent = Frame_upvr
	local var9_upvr = require(script.Parent.Menu)(arg1)
	local MenuUIListLayout_upvr = var9_upvr.MenuUIListLayout
	local MenuGap_upvr = var9_upvr.MenuGap
	var9_upvr.Parent = Frame_upvr
	local Frame_upvr_5 = Instance.new("Frame")
	Frame_upvr_5.Name = "IconSpot"
	Frame_upvr_5.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
	Frame_upvr_5.BackgroundTransparency = 0.9
	Frame_upvr_5.Visible = true
	Frame_upvr_5.AnchorPoint = Vector2.new(0, 0.5)
	Frame_upvr_5.ZIndex = 5
	Frame_upvr_5.Parent = var9_upvr
	UICorner:Clone().Parent = Frame_upvr_5
	local clone = Frame_upvr_5:Clone()
	clone.Name = "IconOverlay"
	clone.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	clone.ZIndex = Frame_upvr_5.ZIndex + 1
	clone.Size = UDim2.new(1, 0, 1, 0)
	clone.Position = UDim2.new(0, 0, 0, 0)
	clone.AnchorPoint = Vector2.new(0, 0)
	clone.Visible = false
	clone.Parent = Frame_upvr_5
	local TextButton_upvr = Instance.new("TextButton")
	TextButton_upvr:SetAttribute("CorrespondingIconUID", arg1.UID)
	TextButton_upvr.Name = "ClickRegion"
	TextButton_upvr.BackgroundTransparency = 1
	TextButton_upvr.Visible = true
	TextButton_upvr.Text = ""
	TextButton_upvr.ZIndex = 20
	TextButton_upvr.Selectable = true
	TextButton_upvr.SelectionGroup = true
	TextButton_upvr.Parent = Frame_upvr_5
	require(script.Parent.Parent.Features.Gamepad).registerButton(TextButton_upvr)
	UICorner:Clone().Parent = TextButton_upvr
	local Frame_upvr_6 = Instance.new("Frame")
	Frame_upvr_6.Name = "Contents"
	Frame_upvr_6.BackgroundTransparency = 1
	Frame_upvr_6.Size = UDim2.fromScale(1, 1)
	Frame_upvr_6.Parent = Frame_upvr_5
	local UIListLayout_upvr = Instance.new("UIListLayout")
	UIListLayout_upvr.Name = "ContentsList"
	UIListLayout_upvr.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout_upvr.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout_upvr.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_upvr.VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly
	UIListLayout_upvr.Padding = UDim.new(0, 3)
	UIListLayout_upvr.Parent = Frame_upvr_6
	local Frame_upvr_4 = Instance.new("Frame")
	Frame_upvr_4.Name = "PaddingLeft"
	Frame_upvr_4.LayoutOrder = 1
	Frame_upvr_4.ZIndex = 5
	Frame_upvr_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr_4.BackgroundTransparency = 1
	Frame_upvr_4.BorderSizePixel = 0
	Frame_upvr_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_upvr_4.Parent = Frame_upvr_6
	local Frame_upvr_2 = Instance.new("Frame")
	Frame_upvr_2.Name = "PaddingCenter"
	Frame_upvr_2.LayoutOrder = 3
	Frame_upvr_2.ZIndex = 5
	Frame_upvr_2.Size = UDim2.new(0, 0, 1, 0)
	Frame_upvr_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr_2.BackgroundTransparency = 1
	Frame_upvr_2.BorderSizePixel = 0
	Frame_upvr_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_upvr_2.Parent = Frame_upvr_6
	local Frame_upvr_3 = Instance.new("Frame")
	Frame_upvr_3.Name = "PaddingRight"
	Frame_upvr_3.LayoutOrder = 5
	Frame_upvr_3.ZIndex = 5
	Frame_upvr_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr_3.BackgroundTransparency = 1
	Frame_upvr_3.BorderSizePixel = 0
	Frame_upvr_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_upvr_3.Parent = Frame_upvr_6
	local Frame_upvr_8 = Instance.new("Frame")
	Frame_upvr_8.Name = "IconLabelContainer"
	Frame_upvr_8.LayoutOrder = 4
	Frame_upvr_8.ZIndex = 3
	Frame_upvr_8.AnchorPoint = Vector2.new(0, 0.5)
	Frame_upvr_8.Size = UDim2.new(0, 0, 0.5, 0)
	Frame_upvr_8.BackgroundTransparency = 1
	Frame_upvr_8.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame_upvr_8.Parent = Frame_upvr_6
	local TextLabel_upvr = Instance.new("TextLabel")
	local var22_upvr = workspace.CurrentCamera.ViewportSize.X + 200
	TextLabel_upvr.Name = "IconLabel"
	TextLabel_upvr.LayoutOrder = 4
	TextLabel_upvr.ZIndex = 15
	TextLabel_upvr.AnchorPoint = Vector2.new(0, 0)
	TextLabel_upvr.Size = UDim2.new(0, var22_upvr, 1, 0)
	TextLabel_upvr.ClipsDescendants = false
	TextLabel_upvr.BackgroundTransparency = 1
	TextLabel_upvr.Position = UDim2.fromScale(0, 0)
	TextLabel_upvr.RichText = true
	TextLabel_upvr.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_upvr.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel_upvr.Text = ""
	TextLabel_upvr.TextWrapped = true
	TextLabel_upvr.TextWrap = true
	TextLabel_upvr.TextScaled = false
	TextLabel_upvr.Active = false
	TextLabel_upvr.AutoLocalize = true
	TextLabel_upvr.Parent = Frame_upvr_8
	local ImageLabel_upvr = Instance.new("ImageLabel")
	ImageLabel_upvr.Name = "IconImage"
	ImageLabel_upvr.LayoutOrder = 2
	ImageLabel_upvr.ZIndex = 15
	ImageLabel_upvr.AnchorPoint = Vector2.new(0, 0.5)
	ImageLabel_upvr.Size = UDim2.new(0, 0, 0.5, 0)
	ImageLabel_upvr.BackgroundTransparency = 1
	ImageLabel_upvr.Position = UDim2.new(0, 11, 0.5, 0)
	ImageLabel_upvr.ScaleType = Enum.ScaleType.Stretch
	ImageLabel_upvr.Active = false
	ImageLabel_upvr.Parent = Frame_upvr_6
	local clone_2 = UICorner:Clone()
	clone_2:SetAttribute("Collective", nil)
	clone_2.CornerRadius = UDim.new(0, 0)
	clone_2.Name = "IconImageCorner"
	clone_2.Parent = ImageLabel_upvr
	local TweenService_upvr = game:GetService("TweenService")
	local var26_upvw = 0
	local any_createStagger_result1_upvr = require(script.Parent.Parent.Utility).createStagger(0.01, function(arg1_2) -- Line 184, Named "handleLabelAndImageChangesUnstaggered"
		--[[ Upvalues[20]:
			[1]: arg1 (readonly)
			[2]: TextLabel_upvr (readonly)
			[3]: ImageLabel_upvr (readonly)
			[4]: Frame_upvr_8 (readonly)
			[5]: Frame_upvr_4 (readonly)
			[6]: Frame_upvr_2 (readonly)
			[7]: Frame_upvr_3 (readonly)
			[8]: Frame_upvr (readonly)
			[9]: UIListLayout_upvr (readonly)
			[10]: Frame_upvr_6 (readonly)
			[11]: Frame_upvr_7 (readonly)
			[12]: var22_upvr (readonly)
			[13]: var9_upvr (readonly)
			[14]: Frame_upvr_5 (readonly)
			[15]: MenuUIListLayout_upvr (readonly)
			[16]: MenuGap_upvr (readonly)
			[17]: TweenService_upvr (readonly)
			[18]: TextButton_upvr (readonly)
			[19]: var26_upvw (read and write)
			[20]: arg2 (readonly)
		]]
		task.defer(function() -- Line 191
			--[[ Upvalues[20]:
				[1]: arg1 (copied, readonly)
				[2]: TextLabel_upvr (copied, readonly)
				[3]: ImageLabel_upvr (copied, readonly)
				[4]: Frame_upvr_8 (copied, readonly)
				[5]: Frame_upvr_4 (copied, readonly)
				[6]: Frame_upvr_2 (copied, readonly)
				[7]: Frame_upvr_3 (copied, readonly)
				[8]: Frame_upvr (copied, readonly)
				[9]: UIListLayout_upvr (copied, readonly)
				[10]: Frame_upvr_6 (copied, readonly)
				[11]: Frame_upvr_7 (copied, readonly)
				[12]: var22_upvr (copied, readonly)
				[13]: var9_upvr (copied, readonly)
				[14]: Frame_upvr_5 (copied, readonly)
				[15]: MenuUIListLayout_upvr (copied, readonly)
				[16]: MenuGap_upvr (copied, readonly)
				[17]: TweenService_upvr (copied, readonly)
				[18]: TextButton_upvr (copied, readonly)
				[19]: var26_upvw (copied, read and write)
				[20]: arg2 (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local indicator = arg1.indicator
			local var49 = indicator
			if var49 then
				var49 = indicator.Visible
			end
			local var50 = var49
			if not var50 then
				if TextLabel_upvr.Text == "" then
					var50 = false
				else
					var50 = true
				end
			end
			local var51 = false
			if ImageLabel_upvr.Image ~= "" then
				if ImageLabel_upvr.Image == nil then
					var51 = false
				else
					var51 = true
				end
			end
			if var51 and not var50 then
				Frame_upvr_8.Visible = false
				ImageLabel_upvr.Visible = true
				Frame_upvr_4.Visible = false
				Frame_upvr_2.Visible = false
				Frame_upvr_3.Visible = false
				local var52
				-- KONSTANTWARNING: GOTO [106] #81
			end
			if not var51 and var50 then
				Frame_upvr_8.Visible = true
				ImageLabel_upvr.Visible = false
				Frame_upvr_4.Visible = true
				Frame_upvr_2.Visible = false
				Frame_upvr_3.Visible = true
			elseif var51 and var50 then
				Frame_upvr_8.Visible = true
				ImageLabel_upvr.Visible = true
				Frame_upvr_4.Visible = true
				Frame_upvr_2.Visible = not var49
				Frame_upvr_3.Visible = not var49
			end
			Frame_upvr.Size = UDim2.fromScale(1, 1)
			local function _(arg1_3) -- Line 221, Named "getItemWidth"
				local TargetWidth_2 = arg1_3:GetAttribute("TargetWidth")
				if not TargetWidth_2 then
					TargetWidth_2 = arg1_3.AbsoluteSize.X
				end
				return TargetWidth_2
			end
			var52 = UIListLayout_upvr.Padding
			local Offset = var52.Offset
			var52 = Offset
			Frame_upvr_8.Size = UDim2.new(0, TextLabel_upvr.TextBounds.X, TextLabel_upvr.Size.Y.Scale, 0)
			for _, v in pairs(Frame_upvr_6:GetChildren()) do
				if v:IsA("GuiObject") and v.Visible == true then
					if not v:GetAttribute("TargetWidth") then
					end
					var52 += v.AbsoluteSize.X + Offset
				end
			end
			local MinimumWidth = Frame_upvr_7:GetAttribute("MinimumWidth")
			local MinimumHeight = Frame_upvr_7:GetAttribute("MinimumHeight")
			local BorderSize = Frame_upvr_7:GetAttribute("BorderSize")
			if 0 >= #arg1.menuIcons then
			else
			end
			if true then
				local isSelected = arg1.isSelected
				local var62
			end
			if isSelected then
				for i_2, v_2 in pairs(var9_upvr:GetChildren()) do
					if v_2 ~= Frame_upvr_5 and v_2:IsA("GuiObject") and v_2.Visible then
						local TargetWidth_3 = v_2:GetAttribute("TargetWidth")
						if not TargetWidth_3 then
							TargetWidth_3 = v_2.AbsoluteSize.X
						end
						var62 += TargetWidth_3 + MenuUIListLayout_upvr.Padding.Offset
					end
				end
				if not Frame_upvr_5.Visible then
					i_2 = Frame_upvr_5
					v_2 = i_2:GetAttribute("TargetWidth")
					if not v_2 then
						v_2 = i_2.AbsoluteSize.X
					end
					v_2 = MenuUIListLayout_upvr.Padding.Offset
					i_2 = v_2 * 2
				end
				var62 -= BorderSize * 0.5
			end
			if isSelected then
			end
			MenuGap_upvr.Visible = Frame_upvr_5.Visible
			local DesiredWidth = Frame_upvr_7:GetAttribute("DesiredWidth")
			if DesiredWidth and ((math.clamp(var52, MinimumWidth, var22_upvr)) - (v_2 + i_2 + BorderSize)) + (var62 - BorderSize * 0.75) < DesiredWidth then
				local var68 = DesiredWidth
			end
			arg1.updateMenu:Fire()
			local var69 = math.max(var68 - var62, MinimumWidth) - BorderSize * 2
			local MenuWidth = var9_upvr:GetAttribute("MenuWidth")
			local var71 = MenuWidth
			if var71 then
				var71 = MenuWidth + var69 + MenuUIListLayout_upvr.Padding.Offset + 10
			end
			if var71 then
				local MaxWidth = var9_upvr:GetAttribute("MaxWidth")
				if MaxWidth then
					var71 = math.max(MaxWidth, MinimumWidth)
				end
				var9_upvr:SetAttribute("MenuCanvasWidth", var68)
				if var71 < var68 then
					local var73 = var71
				end
			end
			local Quint = Enum.EasingStyle.Quint
			local Out = Enum.EasingDirection.Out
			local var76 = Frame_upvr_5
			local TargetWidth = var76:GetAttribute("TargetWidth")
			if not TargetWidth then
				TargetWidth = var76.AbsoluteSize.X
			end
			local var78 = Frame_upvr_7
			local TargetWidth_4 = var78:GetAttribute("TargetWidth")
			if not TargetWidth_4 then
				TargetWidth_4 = var78.AbsoluteSize.X
			end
			local TweenInfo_new_result1 = TweenInfo.new(math.max(var69, TargetWidth, Frame_upvr_5.AbsoluteSize.X) / 750, Quint, Out)
			local TweenInfo_new_result1_2 = TweenInfo.new(math.max(var73, TargetWidth_4, Frame_upvr_7.AbsoluteSize.X) / 750, Quint, Out)
			TweenService_upvr:Create(Frame_upvr_5, TweenInfo_new_result1, {
				Position = UDim2.new(0, BorderSize, 0.5, 0);
				Size = UDim2.new(0, var69, 1, -BorderSize * 2);
			}):Play()
			TweenService_upvr:Create(TextButton_upvr, TweenInfo_new_result1, {
				Size = UDim2.new(0, var69, 1, 0);
			}):Play()
			local var84 = var73
			local udim2 = UDim2.fromOffset(var84, MinimumHeight)
			if Frame_upvr_7.Size.Y.Offset == MinimumHeight then
				var84 = false
			else
				var84 = true
			end
			if var84 then
				Frame_upvr_7.Size = udim2
			end
			Frame_upvr_7:SetAttribute("TargetWidth", udim2.X.Offset)
			TweenService_upvr:Create(Frame_upvr_7, TweenInfo_new_result1_2, {
				Size = udim2;
			}):Play()
			var26_upvw += 1
			for i_3 = 1, TweenInfo_new_result1_2.Time * 100 do
				task.delay(i_3 / 100, function() -- Line 303
					--[[ Upvalues[2]:
						[1]: arg2 (copied, readonly)
						[2]: arg1 (copied, readonly)
					]]
					arg2.iconChanged:Fire(arg1)
				end)
			end
			task.delay(TweenInfo_new_result1_2.Time - 0.2, function() -- Line 307
				--[[ Upvalues[2]:
					[1]: var26_upvw (copied, read and write)
					[2]: arg1 (copied, readonly)
				]]
				var26_upvw -= 1
				task.defer(function() -- Line 309
					--[[ Upvalues[2]:
						[1]: var26_upvw (copied, read and write)
						[2]: arg1 (copied, readonly)
					]]
					if var26_upvw == 0 then
						arg1.resizingComplete:Fire()
					end
				end)
			end)
			arg1:updateParent()
		end)
	end)
	arg1:setBehaviour("IconLabel", "Text", any_createStagger_result1_upvr)
	local var92_upvw = true
	arg1:setBehaviour("IconLabel", "FontFace", function(arg1_4) -- Line 322
		--[[ Upvalues[3]:
			[1]: TextLabel_upvr (readonly)
			[2]: any_createStagger_result1_upvr (readonly)
			[3]: var92_upvw (read and write)
		]]
		if TextLabel_upvr.FontFace == arg1_4 then
		else
			task.spawn(function() -- Line 327
				--[[ Upvalues[2]:
					[1]: any_createStagger_result1_upvr (copied, readonly)
					[2]: var92_upvw (copied, read and write)
				]]
				any_createStagger_result1_upvr()
				if var92_upvw then
					var92_upvw = false
					for _ = 1, 10 do
						task.wait(1)
						any_createStagger_result1_upvr()
					end
				end
			end)
		end
	end)
	local function updateBorderSize() -- Line 350
		--[[ Upvalues[7]:
			[1]: Frame_upvr_7 (readonly)
			[2]: arg1 (readonly)
			[3]: Frame_upvr_5 (readonly)
			[4]: var9_upvr (readonly)
			[5]: MenuGap_upvr (readonly)
			[6]: MenuUIListLayout_upvr (readonly)
			[7]: any_createStagger_result1_upvr (readonly)
		]]
		task.defer(function() -- Line 351
			--[[ Upvalues[7]:
				[1]: Frame_upvr_7 (copied, readonly)
				[2]: arg1 (copied, readonly)
				[3]: Frame_upvr_5 (copied, readonly)
				[4]: var9_upvr (copied, readonly)
				[5]: MenuGap_upvr (copied, readonly)
				[6]: MenuUIListLayout_upvr (copied, readonly)
				[7]: any_createStagger_result1_upvr (copied, readonly)
			]]
			local BorderSize_3 = Frame_upvr_7:GetAttribute("BorderSize")
			local var97 = arg1
			if Frame_upvr_5.Visible == false then
				var97 = 0
			else
				local function INLINED() -- Internal function, doesn't exist in bytecode
					var97 = -BorderSize_3
					return var97
				end
				if var97.alignment ~= "Right" or not INLINED() then
					var97 = BorderSize_3
				end
			end
			var9_upvr.Position = UDim2.new(0, var97, 0, 0)
			MenuGap_upvr.Size = UDim2.fromOffset(BorderSize_3, 0)
			MenuUIListLayout_upvr.Padding = UDim.new(0, 0)
			any_createStagger_result1_upvr()
		end)
	end
	arg1:setBehaviour("Widget", "BorderSize", updateBorderSize)
	arg1:setBehaviour("IconSpot", "Visible", updateBorderSize)
	arg1.startMenuUpdate:Connect(any_createStagger_result1_upvr)
	arg1.updateSize:Connect(any_createStagger_result1_upvr)
	arg1:setBehaviour("ContentsList", "HorizontalAlignment", any_createStagger_result1_upvr)
	arg1:setBehaviour("Widget", "Visible", any_createStagger_result1_upvr)
	arg1:setBehaviour("Widget", "DesiredWidth", any_createStagger_result1_upvr)
	arg1:setBehaviour("Widget", "MinimumWidth", any_createStagger_result1_upvr)
	arg1:setBehaviour("Widget", "MinimumHeight", any_createStagger_result1_upvr)
	arg1:setBehaviour("Indicator", "Visible", any_createStagger_result1_upvr)
	arg1:setBehaviour("IconImageRatio", "AspectRatio", any_createStagger_result1_upvr)
	arg1:setBehaviour("IconImage", "Image", function(arg1_5) -- Line 372
		--[[ Upvalues[2]:
			[1]: ImageLabel_upvr (readonly)
			[2]: any_createStagger_result1_upvr (readonly)
		]]
		local var99
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			var99 = "http://www.roblox.com/asset/?id="..arg1_5
			return var99
		end
		if not tonumber(arg1_5) or not INLINED_2() then
			var99 = arg1_5
			if not var99 then
				var99 = ""
			end
		end
		if ImageLabel_upvr.Image ~= var99 then
			any_createStagger_result1_upvr()
		end
		return var99
	end)
	arg1.alignmentChanged:Connect(function(arg1_6) -- Line 379
		--[[ Upvalues[7]:
			[1]: MenuUIListLayout_upvr (readonly)
			[2]: Frame_upvr_7 (readonly)
			[3]: arg1 (readonly)
			[4]: Frame_upvr_5 (readonly)
			[5]: var9_upvr (readonly)
			[6]: MenuGap_upvr (readonly)
			[7]: any_createStagger_result1_upvr (readonly)
		]]
		if arg1_6 == "Center" then
		end
		MenuUIListLayout_upvr.HorizontalAlignment = Enum.HorizontalAlignment.Left
		task.defer(function() -- Line 351
			--[[ Upvalues[7]:
				[1]: Frame_upvr_7 (copied, readonly)
				[2]: arg1 (copied, readonly)
				[3]: Frame_upvr_5 (copied, readonly)
				[4]: var9_upvr (copied, readonly)
				[5]: MenuGap_upvr (copied, readonly)
				[6]: MenuUIListLayout_upvr (copied, readonly)
				[7]: any_createStagger_result1_upvr (copied, readonly)
			]]
			local BorderSize_2 = Frame_upvr_7:GetAttribute("BorderSize")
			local var103 = arg1
			if Frame_upvr_5.Visible == false then
				var103 = 0
			else
				local function INLINED_3() -- Internal function, doesn't exist in bytecode
					var103 = -BorderSize_2
					return var103
				end
				if var103.alignment ~= "Right" or not INLINED_3() then
					var103 = BorderSize_2
				end
			end
			var9_upvr.Position = UDim2.new(0, var103, 0, 0)
			MenuGap_upvr.Size = UDim2.fromOffset(BorderSize_2, 0)
			MenuUIListLayout_upvr.Padding = UDim.new(0, 0)
			any_createStagger_result1_upvr()
		end)
	end)
	local NumberValue_upvr = Instance.new("NumberValue")
	NumberValue_upvr.Name = "IconImageScale"
	NumberValue_upvr.Parent = ImageLabel_upvr
	NumberValue_upvr:GetPropertyChangedSignal("Value"):Connect(function() -- Line 390
		--[[ Upvalues[2]:
			[1]: ImageLabel_upvr (readonly)
			[2]: NumberValue_upvr (readonly)
		]]
		ImageLabel_upvr.Size = UDim2.new(NumberValue_upvr.Value, 0, NumberValue_upvr.Value, 0)
	end)
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.Name = "IconImageRatio"
	UIAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize
	UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
	UIAspectRatioConstraint.Parent = ImageLabel_upvr
	local UIGradient = Instance.new("UIGradient")
	UIGradient.Name = "IconGradient"
	UIGradient.Enabled = true
	UIGradient.Parent = Frame_upvr
	local UIGradient_2 = Instance.new("UIGradient")
	UIGradient_2.Name = "IconSpotGradient"
	UIGradient_2.Enabled = true
	UIGradient_2.Parent = Frame_upvr_5
	return Frame_upvr_7
end