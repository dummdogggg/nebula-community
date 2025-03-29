--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.1foreverhd_topbarplus@3.0.2.topbarplus.Features.Gamepad
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:31
-- Luau version 6, Types version 3
-- Time taken: 0.005454 seconds

local GamepadService_upvr = game:GetService("GamepadService")
local UserInputService_upvr = game:GetService("UserInputService")
local GuiService_upvr = game:GetService("GuiService")
local module_upvr = {}
local var5_upvw
function module_upvr.start(arg1) -- Line 24
	--[[ Upvalues[5]:
		[1]: var5_upvw (read and write)
		[2]: GuiService_upvr (readonly)
		[3]: UserInputService_upvr (readonly)
		[4]: module_upvr (readonly)
		[5]: GamepadService_upvr (readonly)
	]]
	var5_upvw = arg1
	var5_upvw.highlightKey = Enum.KeyCode.DPadUp
	var5_upvw.highlightIcon = false
	task.delay(1, function() -- Line 33
		--[[ Upvalues[5]:
			[1]: var5_upvw (copied, read and write)
			[2]: GuiService_upvr (copied, readonly)
			[3]: UserInputService_upvr (copied, readonly)
			[4]: module_upvr (copied, readonly)
			[5]: GamepadService_upvr (copied, readonly)
		]]
		local iconsDictionary_upvr = var5_upvw.iconsDictionary
		local function _() -- Line 36, Named "getIconFromSelectedObject"
			--[[ Upvalues[2]:
				[1]: GuiService_upvr (copied, readonly)
				[2]: iconsDictionary_upvr (readonly)
			]]
			local var9 = GuiService_upvr.SelectedObject
			if var9 then
				var9 = GuiService_upvr.SelectedObject:GetAttribute("CorrespondingIconUID")
			end
			local var10 = var9
			if var10 then
				var10 = iconsDictionary_upvr[var9]
			end
			return var10
		end
		local var11_upvw = false
		local var12_upvw = false
		local Selection_upvr = require(script.Parent.Parent.Elements.Selection)
		local var14_upvw
		local function updateSelectedObject_upvr() -- Line 50, Named "updateSelectedObject"
			--[[ Upvalues[9]:
				[1]: GuiService_upvr (copied, readonly)
				[2]: iconsDictionary_upvr (readonly)
				[3]: UserInputService_upvr (copied, readonly)
				[4]: Selection_upvr (readonly)
				[5]: var5_upvw (copied, read and write)
				[6]: var14_upvw (read and write)
				[7]: var12_upvw (read and write)
				[8]: var11_upvw (read and write)
				[9]: module_upvr (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var16 = GuiService_upvr.SelectedObject
			if var16 then
				var16 = GuiService_upvr.SelectedObject:GetAttribute("CorrespondingIconUID")
			end
			local var17 = var16
			if var17 then
				var17 = iconsDictionary_upvr[var16]
			end
			local var18 = var17
			local GamepadEnabled = UserInputService_upvr.GamepadEnabled
			if var18 then
				if GamepadEnabled then
					if not var18.selection then
						local any_add_result1 = var18.janitor:add(Selection_upvr(var5_upvw))
						any_add_result1:SetAttribute("IgnoreVisibilityUpdater", true)
						any_add_result1.Parent = var18.widget
						var18.selection = any_add_result1
						var18:refreshAppearance(any_add_result1)
					end
					var18:getInstance("ClickRegion").SelectionImageObject = any_add_result1.Selection
				end
				if var14_upvw and var14_upvw ~= var18 then
					var14_upvw:setIndicator()
					local var21
				end
				if GamepadEnabled and not var12_upvw and not var18.parentIconUID then
					var21 = Enum.KeyCode.ButtonB
				else
					var21 = nil
				end
				var14_upvw = var18
				var5_upvw.lastHighlightedIcon = var18
				var18:setIndicator(var21)
				do
					return
				end
				local var22
			end
			if GamepadEnabled and not var11_upvw then
				var22 = var5_upvw.highlightKey
			else
				var22 = nil
			end
			if not var14_upvw then
				var14_upvw = module_upvr.getIconToHighlight()
			end
			if var22 == var5_upvw.highlightKey then
				var11_upvw = true
			end
			if var14_upvw then
				var14_upvw:setIndicator(var22)
			end
		end
		GuiService_upvr:GetPropertyChangedSignal("SelectedObject"):Connect(updateSelectedObject_upvr)
		UserInputService_upvr:GetPropertyChangedSignal("GamepadEnabled"):Connect(function() -- Line 93, Named "checkGamepadEnabled"
			--[[ Upvalues[4]:
				[1]: UserInputService_upvr (copied, readonly)
				[2]: var11_upvw (read and write)
				[3]: var12_upvw (read and write)
				[4]: updateSelectedObject_upvr (readonly)
			]]
			if not UserInputService_upvr.GamepadEnabled then
				var11_upvw = false
				var12_upvw = false
			end
			updateSelectedObject_upvr()
		end)
		if not UserInputService_upvr.GamepadEnabled then
			var11_upvw = false
			var12_upvw = false
		end
		updateSelectedObject_upvr()
		UserInputService_upvr.InputBegan:Connect(function(arg1_2, arg2) -- Line 107
			--[[ Upvalues[5]:
				[1]: GuiService_upvr (copied, readonly)
				[2]: iconsDictionary_upvr (readonly)
				[3]: var5_upvw (copied, read and write)
				[4]: module_upvr (copied, readonly)
				[5]: GamepadService_upvr (copied, readonly)
			]]
			local var24
			if arg1_2.UserInputType == Enum.UserInputType.MouseButton1 then
				var24 = GuiService_upvr
				var24 = var24.SelectedObject
				if var24 then
					var24 = var24.SelectedObject:GetAttribute("CorrespondingIconUID")
				end
				local var26 = var24
				if var26 then
					var26 = iconsDictionary_upvr[var24]
				end
				if var26 then
					GuiService_upvr.SelectedObject = nil
				end
			else
				if arg1_2.KeyCode ~= var5_upvw.highlightKey then return end
				local any_getIconToHighlight_result1 = module_upvr.getIconToHighlight()
				if any_getIconToHighlight_result1 then
					if GamepadService_upvr.GamepadCursorEnabled then
						task.wait(0.2)
						GamepadService_upvr:DisableGamepadCursor()
					end
					GuiService_upvr.SelectedObject = any_getIconToHighlight_result1:getInstance("ClickRegion")
				end
			end
		end)
	end)
end
function module_upvr.getIconToHighlight() -- Line 134
	--[[ Upvalues[1]:
		[1]: var5_upvw (read and write)
	]]
	local var34
	if not var34 then
		var34 = var5_upvw.lastHighlightedIcon
	end
	if not var34 then
		local var35
		for _, v in pairs(var5_upvw.iconsDictionary) do
			if not v.parentIconUID and (not var35 or v.widget.AbsolutePosition.X < var35) then
				var34 = v
			end
		end
	end
	return var34
end
function module_upvr.registerButton(arg1) -- Line 156
	--[[ Upvalues[3]:
		[1]: UserInputService_upvr (readonly)
		[2]: GamepadService_upvr (readonly)
		[3]: GuiService_upvr (readonly)
	]]
	local var39_upvw = false
	arg1.InputBegan:Connect(function(arg1_3) -- Line 162
		--[[ Upvalues[1]:
			[1]: var39_upvw (read and write)
		]]
		var39_upvw = true
		task.wait()
		task.wait()
		var39_upvw = false
	end)
	local any_Connect_result1_upvr = UserInputService_upvr.InputBegan:Connect(function(arg1_4) -- Line 171
		--[[ Upvalues[4]:
			[1]: var39_upvw (read and write)
			[2]: GamepadService_upvr (copied, readonly)
			[3]: GuiService_upvr (copied, readonly)
			[4]: arg1 (readonly)
		]]
		task.wait()
		local var45
		if var45 == Enum.KeyCode.ButtonA then
			var45 = var39_upvw
			if var45 then
				var45 = task.wait
				var45(0.2)
				var45 = GamepadService_upvr:DisableGamepadCursor
				var45()
				var45 = GuiService_upvr
				var45.SelectedObject = arg1
				return
			end
		end
		if GuiService_upvr.SelectedObject ~= arg1 then
			var45 = false
		else
			var45 = true
		end
		local Name = arg1_4.KeyCode.Name
		if table.find({"ButtonB", "ButtonSelect"}, Name) and var45 and (Name ~= "ButtonSelect" or GamepadService_upvr.GamepadCursorEnabled) then
			GuiService_upvr.SelectedObject = nil
		end
	end)
	arg1.Destroying:Once(function() -- Line 192
		--[[ Upvalues[1]:
			[1]: any_Connect_result1_upvr (readonly)
		]]
		any_Connect_result1_upvr:Disconnect()
	end)
end
return module_upvr