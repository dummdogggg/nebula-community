--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.1foreverhd_topbarplus@3.0.2.topbarplus.Elements.Container
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:05
-- Luau version 6, Types version 3
-- Time taken: 0.003841 seconds

return function(arg1) -- Line 1
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local GuiService = game:GetService("GuiService")
	local isOldTopbar = arg1.isOldTopbar
	local module = {}
	local any_IsTenFootInterface_result1 = GuiService:IsTenFootInterface()
	local var6
	if isOldTopbar then
		var6 = 12
	else
		var6 = GuiService:GetGuiInset().Y - 46
	end
	if any_IsTenFootInterface_result1 then
		var6 = 10
	end
	local ScreenGui_upvr = Instance.new("ScreenGui")
	ScreenGui_upvr:SetAttribute("StartInset", var6)
	ScreenGui_upvr.Name = "TopbarStandard"
	ScreenGui_upvr.Enabled = true
	ScreenGui_upvr.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui_upvr.IgnoreGuiInset = true
	ScreenGui_upvr.ResetOnSpawn = false
	ScreenGui_upvr.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets
	module[ScreenGui_upvr.Name] = ScreenGui_upvr
	ScreenGui_upvr.DisplayOrder = arg1.baseDisplayOrder
	arg1.baseDisplayOrderChanged:Connect(function() -- Line 22
		--[[ Upvalues[2]:
			[1]: ScreenGui_upvr (readonly)
			[2]: arg1 (readonly)
		]]
		ScreenGui_upvr.DisplayOrder = arg1.baseDisplayOrder
	end)
	local Frame = Instance.new("Frame")
	if isOldTopbar then
	else
	end
	if any_IsTenFootInterface_result1 then
		local var10_upvw = 50
	end
	Frame.Name = "Holders"
	Frame.BackgroundTransparency = 1
	Frame.Position = UDim2.new(0, 0, 0, 0 + 13)
	Frame.Size = UDim2.new(1, 0, 1, var10_upvw)
	Frame.Visible = true
	Frame.ZIndex = 1
	Frame.Parent = ScreenGui_upvr
	local clone_5_upvr = ScreenGui_upvr:Clone()
	local Holders_upvr = clone_5_upvr.Holders
	local GuiService_2_upvr = game:GetService("GuiService")
	clone_5_upvr.Name = "TopbarCentered"
	clone_5_upvr.ScreenInsets = Enum.ScreenInsets.None
	arg1.baseDisplayOrderChanged:Connect(function() -- Line 49
		--[[ Upvalues[2]:
			[1]: clone_5_upvr (readonly)
			[2]: arg1 (readonly)
		]]
		clone_5_upvr.DisplayOrder = arg1.baseDisplayOrder
	end)
	module[clone_5_upvr.Name] = clone_5_upvr
	GuiService_2_upvr:GetPropertyChangedSignal("TopbarInset"):Connect(function() -- Line 44, Named "updateCenteredHoldersHeight"
		--[[ Upvalues[3]:
			[1]: Holders_upvr (readonly)
			[2]: GuiService_2_upvr (readonly)
			[3]: var10_upvw (read and write)
		]]
		Holders_upvr.Size = UDim2.new(1, 0, 0, GuiService_2_upvr.TopbarInset.Height + var10_upvw)
	end)
	Holders_upvr.Size = UDim2.new(1, 0, 0, GuiService_2_upvr.TopbarInset.Height + var10_upvw)
	local clone_3_upvr = ScreenGui_upvr:Clone()
	clone_3_upvr.Name ..= "Clipped"
	clone_3_upvr.DisplayOrder += 1
	arg1.baseDisplayOrderChanged:Connect(function() -- Line 59
		--[[ Upvalues[2]:
			[1]: clone_3_upvr (readonly)
			[2]: arg1 (readonly)
		]]
		clone_3_upvr.DisplayOrder = arg1.baseDisplayOrder + 1
	end)
	module[clone_3_upvr.Name] = clone_3_upvr
	local clone_4_upvr = clone_5_upvr:Clone()
	clone_4_upvr.Name ..= "Clipped"
	clone_4_upvr.DisplayOrder += 1
	arg1.baseDisplayOrderChanged:Connect(function() -- Line 67
		--[[ Upvalues[2]:
			[1]: clone_4_upvr (readonly)
			[2]: arg1 (readonly)
		]]
		clone_4_upvr.DisplayOrder = arg1.baseDisplayOrder + 1
	end)
	module[clone_4_upvr.Name] = clone_4_upvr
	if isOldTopbar then
		task.defer(function() -- Line 73
			--[[ Upvalues[2]:
				[1]: GuiService_2_upvr (readonly)
				[2]: arg1 (readonly)
			]]
			GuiService_2_upvr:GetPropertyChangedSignal("MenuIsOpen"):Connect(function() -- Line 74, Named "decideToHideTopbar"
				--[[ Upvalues[2]:
					[1]: GuiService_2_upvr (copied, readonly)
					[2]: arg1 (copied, readonly)
				]]
				if GuiService_2_upvr.MenuIsOpen then
					arg1.setTopbarEnabled(false, true)
				else
					arg1.setTopbarEnabled()
				end
			end)
			if GuiService_2_upvr.MenuIsOpen then
				arg1.setTopbarEnabled(false, true)
			else
				arg1.setTopbarEnabled()
			end
		end)
	end
	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame:SetAttribute("IsAHolder", true)
	ScrollingFrame.Name = "Left"
	ScrollingFrame.Position = UDim2.fromOffset(var6, 0)
	ScrollingFrame.Size = UDim2.new(1, -24, 1, 0)
	ScrollingFrame.BackgroundTransparency = 1
	ScrollingFrame.Visible = true
	ScrollingFrame.ZIndex = 1
	ScrollingFrame.Active = false
	ScrollingFrame.ClipsDescendants = true
	ScrollingFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, -1)
	ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.X
	ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
	ScrollingFrame.ScrollBarThickness = 0
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Selectable = false
	ScrollingFrame.ScrollingEnabled = false
	ScrollingFrame.ElasticBehavior = Enum.ElasticBehavior.Never
	ScrollingFrame.Parent = Frame
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Padding = UDim.new(0, var6)
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	UIListLayout.Parent = ScrollingFrame
	local clone = ScrollingFrame:Clone()
	clone.ScrollingEnabled = false
	clone.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	clone.Name = "Center"
	clone.Parent = Holders_upvr
	local clone_2 = ScrollingFrame:Clone()
	clone_2.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	clone_2.Name = "Right"
	clone_2.AnchorPoint = Vector2.new(1, 0)
	clone_2.Position = UDim2.new(1, -12, 0, 0)
	clone_2.Parent = Frame
	return module
end