--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.1foreverhd_topbarplus@3.0.2.topbarplus.Elements.Notice
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:23
-- Luau version 6, Types version 3
-- Time taken: 0.002736 seconds

return function(arg1, arg2) -- Line 1
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "Notice"
	Frame_upvr.ZIndex = 25
	Frame_upvr.AutomaticSize = Enum.AutomaticSize.X
	Frame_upvr.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr.BorderSizePixel = 0
	Frame_upvr.BackgroundTransparency = 0.1
	Frame_upvr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_upvr.Visible = false
	Frame_upvr.Parent = arg1.widget
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Frame_upvr
	Instance.new("UIStroke").Parent = Frame_upvr
	local TextLabel_upvr = Instance.new("TextLabel")
	TextLabel_upvr.Name = "NoticeLabel"
	TextLabel_upvr.ZIndex = 26
	TextLabel_upvr.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel_upvr.AutomaticSize = Enum.AutomaticSize.X
	TextLabel_upvr.Size = UDim2.new(1, 0, 1, 0)
	TextLabel_upvr.BackgroundTransparency = 1
	TextLabel_upvr.Position = UDim2.new(0.5, 0, 0.515, 0)
	TextLabel_upvr.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_upvr.FontSize = Enum.FontSize.Size14
	TextLabel_upvr.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_upvr.Text = '1'
	TextLabel_upvr.TextWrapped = true
	TextLabel_upvr.TextWrap = true
	TextLabel_upvr.Font = Enum.Font.Arial
	TextLabel_upvr.Parent = Frame_upvr
	local Parent = script.Parent.Parent
	local Packages = Parent.Packages
	local Utility_upvr = require(Parent.Utility)
	arg1.noticeChanged:Connect(function(arg1_2) -- Line 43
		--[[ Upvalues[5]:
			[1]: TextLabel_upvr (readonly)
			[2]: arg2 (readonly)
			[3]: arg1 (readonly)
			[4]: Utility_upvr (readonly)
			[5]: Frame_upvr (readonly)
		]]
		if not arg1_2 then
		else
			if 99 >= arg1_2 then
				local _ = false
				-- KONSTANTWARNING: Skipped task `defvar` above
			else
			end
			if true then
			else
			end
			TextLabel_upvr.Text = arg1_2
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if true then
				TextLabel_upvr.TextSize = 11
			end
			if arg1_2 < 1 then
			end
			local any_getIconByUID_result1 = arg2.getIconByUID(arg1.parentIconUID)
			local var11 = true
			if 0 >= #arg1.dropdownIcons then
				if 0 >= #arg1.menuIcons then
					var11 = false
				else
					var11 = true
				end
			end
			local var12
			if arg1.isSelected and var11 then
				var12 = false
			elseif any_getIconByUID_result1 and not any_getIconByUID_result1.isSelected then
				var12 = false
			end
			Utility_upvr.setVisible(Frame_upvr, var12, "NoticeHandler")
		end
	end)
	local Janitor_upvr = require(Packages.Janitor)
	local GoodSignal_upvr = require(Packages.GoodSignal)
	arg1.noticeStarted:Connect(function(arg1_3, arg2_2) -- Line 71
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
			[3]: Janitor_upvr (readonly)
			[4]: GoodSignal_upvr (readonly)
			[5]: Utility_upvr (readonly)
		]]
		if not arg1_3 then
			local deselected = arg1.deselected
		end
		local any_getIconByUID_result1_2 = arg2.getIconByUID(arg1.parentIconUID)
		if any_getIconByUID_result1_2 then
			any_getIconByUID_result1_2:notify(deselected)
		end
		local any_add_result1_upvr = arg1.janitor:add(Janitor_upvr.new())
		local any_add_result1_upvr_2 = any_add_result1_upvr:add(GoodSignal_upvr.new())
		any_add_result1_upvr:add(arg1.endNotices:Connect(function() -- Line 83
			--[[ Upvalues[1]:
				[1]: any_add_result1_upvr_2 (readonly)
			]]
			any_add_result1_upvr_2:Fire()
		end))
		any_add_result1_upvr:add(deselected:Connect(function() -- Line 86
			--[[ Upvalues[1]:
				[1]: any_add_result1_upvr_2 (readonly)
			]]
			any_add_result1_upvr_2:Fire()
		end))
		local var22 = arg2_2
		if not var22 then
			var22 = Utility_upvr.generateUID()
		end
		local var23_upvw = var22
		arg1.notices[var23_upvw] = {
			completeSignal = any_add_result1_upvr_2;
			clearNoticeEvent = deselected;
		}
		local function _() -- Line 95, Named "updateNotice"
			--[[ Upvalues[1]:
				[1]: arg1 (copied, readonly)
			]]
			arg1.noticeChanged:Fire(arg1.totalNotices)
		end
		arg1.notified:Fire(var23_upvw)
		local var25 = arg1
		var25.totalNotices += 1
		arg1.noticeChanged:Fire(arg1.totalNotices)
		any_add_result1_upvr_2:Once(function() -- Line 101
			--[[ Upvalues[3]:
				[1]: any_add_result1_upvr (readonly)
				[2]: arg1 (copied, readonly)
				[3]: var23_upvw (read and write)
			]]
			any_add_result1_upvr:destroy()
			local var27 = arg1
			var27.totalNotices -= 1
			arg1.notices[var23_upvw] = nil
			arg1.noticeChanged:Fire(arg1.totalNotices)
		end)
	end)
	Frame_upvr:SetAttribute("ClipToJoinedParent", true)
	arg1:clipOutside(Frame_upvr)
	return Frame_upvr
end