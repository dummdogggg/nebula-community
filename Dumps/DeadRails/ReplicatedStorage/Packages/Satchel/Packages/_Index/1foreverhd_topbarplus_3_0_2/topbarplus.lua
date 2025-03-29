--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.1foreverhd_topbarplus@3.0.2.topbarplus
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:50
-- Luau version 6, Types version 3
-- Time taken: 0.025165 seconds

local GuiService = game:GetService("GuiService")
local script_upvr = script
local Reference = require(script_upvr.Reference)
local any_getObject_result1 = Reference.getObject()
local var9
if var9 then
	var9 = any_getObject_result1.Value
end
if var9 and var9 ~= script_upvr then
	return require(var9)
end
if not any_getObject_result1 then
	Reference.addToReplicatedStorage()
end
local GoodSignal_upvr = require(script_upvr.Packages.GoodSignal)
local Utility_upvr = require(script_upvr.Utility)
local Themes_2_upvr = require(script_upvr.Features.Themes)
local module_upvr = {}
module_upvr.__index = module_upvr
local Themes = script_upvr.Features.Themes
local tbl_7_upvr = {}
local any_new_result1_2_upvr = GoodSignal_upvr.new()
local Elements_upvr = script_upvr.Elements
if GuiService.TopbarInset.Height == 0 then
	GuiService:GetPropertyChangedSignal("TopbarInset"):Wait()
end
module_upvr.baseDisplayOrderChanged = GoodSignal_upvr.new()
module_upvr.baseDisplayOrder = 10
local Default = require(Themes.Default)
module_upvr.baseTheme = Default
if GuiService.TopbarInset.Height ~= 36 then
	Default = false
else
	Default = true
end
module_upvr.isOldTopbar = Default
module_upvr.iconsDictionary = tbl_7_upvr
module_upvr.container = require(Elements_upvr.Container)(module_upvr)
module_upvr.topbarEnabled = true
module_upvr.iconAdded = GoodSignal_upvr.new()
module_upvr.iconRemoved = GoodSignal_upvr.new()
module_upvr.iconChanged = GoodSignal_upvr.new()
function module_upvr.getIcons() -- Line 112
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.iconsDictionary
end
function module_upvr.getIconByUID(arg1) -- Line 116
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var19 = module_upvr.iconsDictionary[arg1]
	if var19 then
		return var19
	end
end
function module_upvr.getIcon(arg1) -- Line 123
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: tbl_7_upvr (readonly)
	]]
	local any_getIconByUID_result1_3 = module_upvr.getIconByUID(arg1)
	if any_getIconByUID_result1_3 then
		return any_getIconByUID_result1_3
	end
	for _, v in pairs(tbl_7_upvr) do
		if v.name == arg1 then
			return v
		end
	end
end
function module_upvr.setTopbarEnabled(arg1, arg2) -- Line 135
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var30
	if typeof(arg1) ~= "boolean" then
		var30 = module_upvr.topbarEnabled
	end
	if not arg2 then
		module_upvr.topbarEnabled = var30
	end
	for _, v_2 in pairs(module_upvr.container) do
		v_2.Enabled = var30
	end
end
function module_upvr.modifyBaseTheme(arg1) -- Line 147
	--[[ Upvalues[3]:
		[1]: Themes_2_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: tbl_7_upvr (readonly)
	]]
	for _, v_3 in pairs(Themes_2_upvr.getModifications(arg1)) do
		for _, v_4 in pairs(module_upvr.baseTheme) do
			Themes_2_upvr.merge(v_4, v_3)
		end
	end
	for _, v_5 in pairs(tbl_7_upvr) do
		v_5:setTheme(module_upvr.baseTheme)
	end
end
function module_upvr.setDisplayOrder(arg1) -- Line 159
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.baseDisplayOrder = arg1
	module_upvr.baseDisplayOrderChanged:Fire(arg1)
end
task.defer(require(script_upvr.Features.Gamepad).start, module_upvr)
task.defer(require(script_upvr.Features.Overflow).start, module_upvr)
for _, v_6 in pairs(module_upvr.container) do
	v_6.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	local _
end
if module_upvr.isOldTopbar then
	module_upvr.modifyBaseTheme(require(Themes.Classic))
end
local Janitor_upvr = require(script_upvr.Packages.Janitor)
local var54_upvw = 0
local UserInputService_upvr = game:GetService("UserInputService")
local StarterGui_upvr = game:GetService("StarterGui")
function module_upvr.new() -- Line 179
	--[[ Upvalues[11]:
		[1]: module_upvr (readonly)
		[2]: Janitor_upvr (readonly)
		[3]: Utility_upvr (readonly)
		[4]: tbl_7_upvr (readonly)
		[5]: GoodSignal_upvr (readonly)
		[6]: script_upvr (readonly)
		[7]: Elements_upvr (readonly)
		[8]: var54_upvw (read and write)
		[9]: UserInputService_upvr (readonly)
		[10]: any_new_result1_2_upvr (readonly)
		[11]: StarterGui_upvr (readonly)
	]]
	local module_2_upvr = {}
	setmetatable(module_2_upvr, module_upvr)
	local any_new_result1 = Janitor_upvr.new()
	module_2_upvr.janitor = any_new_result1
	module_2_upvr.themesJanitor = any_new_result1:add(Janitor_upvr.new())
	module_2_upvr.singleClickJanitor = any_new_result1:add(Janitor_upvr.new())
	module_2_upvr.captionJanitor = any_new_result1:add(Janitor_upvr.new())
	module_2_upvr.joinJanitor = any_new_result1:add(Janitor_upvr.new())
	module_2_upvr.menuJanitor = any_new_result1:add(Janitor_upvr.new())
	module_2_upvr.dropdownJanitor = any_new_result1:add(Janitor_upvr.new())
	local any_generateUID_result1_upvr = Utility_upvr.generateUID()
	tbl_7_upvr[any_generateUID_result1_upvr] = module_2_upvr
	any_new_result1:add(function() -- Line 196
		--[[ Upvalues[2]:
			[1]: tbl_7_upvr (copied, readonly)
			[2]: any_generateUID_result1_upvr (readonly)
		]]
		tbl_7_upvr[any_generateUID_result1_upvr] = nil
	end)
	module_2_upvr.selected = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.deselected = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.toggled = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.viewingStarted = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.viewingEnded = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.stateChanged = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.notified = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.noticeStarted = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.noticeChanged = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.endNotices = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.toggleKeyAdded = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.fakeToggleKeyChanged = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.alignmentChanged = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.updateSize = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.resizingComplete = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.joinedParent = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.menuSet = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.dropdownSet = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.updateMenu = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.startMenuUpdate = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.childThemeModified = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.indicatorSet = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.dropdownChildAdded = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.menuChildAdded = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.iconModule = script_upvr
	module_2_upvr.UID = any_generateUID_result1_upvr
	module_2_upvr.isEnabled = true
	module_2_upvr.isSelected = false
	module_2_upvr.isViewing = false
	module_2_upvr.joinedFrame = false
	module_2_upvr.parentIconUID = false
	module_2_upvr.deselectWhenOtherIconSelected = true
	module_2_upvr.totalNotices = 0
	module_2_upvr.activeState = "Deselected"
	module_2_upvr.alignment = ""
	module_2_upvr.originalAlignment = ""
	module_2_upvr.appliedTheme = {}
	module_2_upvr.appearance = {}
	module_2_upvr.cachedInstances = {}
	module_2_upvr.cachedNamesToInstances = {}
	module_2_upvr.cachedCollectives = {}
	module_2_upvr.bindedToggleKeys = {}
	module_2_upvr.customBehaviours = {}
	module_2_upvr.toggleItems = {}
	module_2_upvr.bindedEvents = {}
	module_2_upvr.notices = {}
	module_2_upvr.menuIcons = {}
	module_2_upvr.dropdownIcons = {}
	module_2_upvr.childIconsDict = {}
	module_2_upvr.isOldTopbar = module_upvr.isOldTopbar
	module_2_upvr.creationTime = os.clock()
	module_2_upvr.widget = any_new_result1:add(require(Elements_upvr.Widget)(module_2_upvr, module_upvr))
	module_2_upvr:setAlignment()
	var54_upvw += 1
	module_2_upvr:setOrder(var54_upvw)
	module_2_upvr:setTheme(module_upvr.baseTheme)
	local any_getInstance_result1_3 = module_2_upvr:getInstance("ClickRegion")
	local function _() -- Line 271, Named "handleToggle"
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if module_2_upvr.locked then
		else
			if module_2_upvr.isSelected then
				module_2_upvr:deselect("User", module_2_upvr)
				return
			end
			module_2_upvr:select("User", module_2_upvr)
		end
	end
	local var66_upvw = false
	local var67_upvw = false
	any_getInstance_result1_3.MouseButton1Click:Connect(function() -- Line 283
		--[[ Upvalues[3]:
			[1]: var66_upvw (read and write)
			[2]: var67_upvw (read and write)
			[3]: module_2_upvr (readonly)
		]]
		if var66_upvw then
		else
			var67_upvw = true
			task.delay(0.01, function() -- Line 288
				--[[ Upvalues[1]:
					[1]: var67_upvw (copied, read and write)
				]]
				var67_upvw = false
			end)
			if module_2_upvr.locked then return end
			if module_2_upvr.isSelected then
				module_2_upvr:deselect("User", module_2_upvr)
				return
			end
			module_2_upvr:select("User", module_2_upvr)
		end
	end)
	any_getInstance_result1_3.TouchTap:Connect(function() -- Line 293
		--[[ Upvalues[3]:
			[1]: var67_upvw (read and write)
			[2]: var66_upvw (read and write)
			[3]: module_2_upvr (readonly)
		]]
		if var67_upvw then
		else
			var66_upvw = true
			task.delay(0.01, function() -- Line 300
				--[[ Upvalues[1]:
					[1]: var66_upvw (copied, read and write)
				]]
				var66_upvw = false
			end)
			if module_2_upvr.locked then return end
			if module_2_upvr.isSelected then
				module_2_upvr:deselect("User", module_2_upvr)
				return
			end
			module_2_upvr:select("User", module_2_upvr)
		end
	end)
	any_new_result1:add(UserInputService_upvr.InputBegan:Connect(function(arg1, arg2) -- Line 307
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if module_2_upvr.locked then
		elseif module_2_upvr.bindedToggleKeys[arg1.KeyCode] and not arg2 then
			if module_2_upvr.locked then return end
			if module_2_upvr.isSelected then
				module_2_upvr:deselect("User", module_2_upvr)
				return
			end
			module_2_upvr:select("User", module_2_upvr)
		end
	end))
	local function viewingEnded() -- Line 329
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if module_2_upvr.locked then
		else
			module_2_upvr.isViewing = false
			module_2_upvr.viewingEnded:Fire(true)
			module_2_upvr:setState(nil, "User", module_2_upvr)
		end
	end
	module_2_upvr.joinedParent:Connect(function() -- Line 337
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if module_2_upvr.isViewing then
			if module_2_upvr.locked then return end
			module_2_upvr.isViewing = false
			module_2_upvr.viewingEnded:Fire(true)
			module_2_upvr:setState(nil, "User", module_2_upvr)
		end
	end)
	any_getInstance_result1_3.MouseEnter:Connect(function() -- Line 342
		--[[ Upvalues[2]:
			[1]: UserInputService_upvr (copied, readonly)
			[2]: module_2_upvr (readonly)
		]]
		if module_2_upvr.locked then
		else
			module_2_upvr.isViewing = true
			module_2_upvr.viewingStarted:Fire(true)
			if not not UserInputService_upvr.KeyboardEnabled then
				module_2_upvr:setState("Viewing", "User", module_2_upvr)
			end
		end
	end)
	local var75_upvw = 0
	any_new_result1:add(UserInputService_upvr.TouchEnded:Connect(viewingEnded))
	any_getInstance_result1_3.MouseLeave:Connect(viewingEnded)
	any_getInstance_result1_3.SelectionGained:Connect(function(arg1) -- Line 319, Named "viewingStarted"
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if module_2_upvr.locked then
		else
			module_2_upvr.isViewing = true
			module_2_upvr.viewingStarted:Fire(true)
			if not arg1 then
				module_2_upvr:setState("Viewing", "User", module_2_upvr)
			end
		end
	end)
	any_getInstance_result1_3.SelectionLost:Connect(viewingEnded)
	any_getInstance_result1_3.MouseButton1Down:Connect(function() -- Line 351
		--[[ Upvalues[3]:
			[1]: module_2_upvr (readonly)
			[2]: UserInputService_upvr (copied, readonly)
			[3]: var75_upvw (read and write)
		]]
		if not module_2_upvr.locked and UserInputService_upvr.TouchEnabled then
			var75_upvw += 1
			task.delay(0.2, function() -- Line 355
				--[[ Upvalues[3]:
					[1]: var75_upvw (readonly)
					[2]: var75_upvw (copied, read and write)
					[3]: module_2_upvr (copied, readonly)
				]]
				if var75_upvw == var75_upvw then
					if module_2_upvr.locked then return end
					module_2_upvr.isViewing = true
					module_2_upvr.viewingStarted:Fire(true)
					module_2_upvr:setState("Viewing", "User", module_2_upvr)
				end
			end)
		end
	end)
	any_getInstance_result1_3.MouseButton1Up:Connect(function() -- Line 362
		--[[ Upvalues[1]:
			[1]: var75_upvw (read and write)
		]]
		var75_upvw += 1
	end)
	local any_getInstance_result1_2_upvr = module_2_upvr:getInstance("IconOverlay")
	module_2_upvr.viewingStarted:Connect(function() -- Line 368
		--[[ Upvalues[2]:
			[1]: any_getInstance_result1_2_upvr (readonly)
			[2]: module_2_upvr (readonly)
		]]
		any_getInstance_result1_2_upvr.Visible = not module_2_upvr.overlayDisabled
	end)
	module_2_upvr.viewingEnded:Connect(function() -- Line 371
		--[[ Upvalues[1]:
			[1]: any_getInstance_result1_2_upvr (readonly)
		]]
		any_getInstance_result1_2_upvr.Visible = false
	end)
	any_new_result1:add(any_new_result1_2_upvr:Connect(function(arg1) -- Line 376
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if arg1 ~= module_2_upvr and module_2_upvr.deselectWhenOtherIconSelected and arg1.deselectWhenOtherIconSelected then
			module_2_upvr:deselect("AutoDeselect", arg1)
		end
	end))
	local var86
	for var116, v_7 in pairs(string.split(debug.info(2, 's'), '.')) do
		local SOME = game:FindFirstChild(v_7)
		if not SOME then break end
		if SOME:IsA("ScreenGui") then
			var86 = SOME
		end
	end
	if SOME and var86 and var86.ResetOnSpawn == true then
		Utility_upvr.localPlayerRespawned(function() -- Line 401
			--[[ Upvalues[1]:
				[1]: module_2_upvr (readonly)
			]]
			module_2_upvr:destroy()
		end)
	end
	function var116(arg1) -- Line 408
		--[[ Upvalues[2]:
			[1]: module_2_upvr (readonly)
			[2]: module_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		module_2_upvr.noticeChanged:Fire(module_2_upvr.totalNotices)
		for i_8, _ in pairs(module_2_upvr.childIconsDict) do
			local any_getIconByUID_result1 = module_upvr.getIconByUID(i_8)
			any_getIconByUID_result1.noticeChanged:Fire(any_getIconByUID_result1.totalNotices)
			if not arg1 and any_getIconByUID_result1.isSelected then
				for _, _ in pairs(any_getIconByUID_result1.childIconsDict) do
					any_getIconByUID_result1:deselect("HideParentFeature", module_2_upvr)
				end
			end
		end
	end
	module_2_upvr.toggled:Connect(var116)
	function var116() -- Line 431
		--[[ Upvalues[2]:
			[1]: module_2_upvr (readonly)
			[2]: StarterGui_upvr (copied, readonly)
		]]
		local var114
		if 0 >= #module_2_upvr.dropdownIcons then
			var114 = false
		else
			var114 = true
		end
		if var114 then
			if StarterGui_upvr:GetCore("ChatActive") and module_2_upvr.alignment ~= "Right" then
				module_2_upvr.chatWasPreviouslyActive = true
				StarterGui_upvr:SetCore("ChatActive", false)
			end
			if StarterGui_upvr:GetCoreGuiEnabled("PlayerList") and module_2_upvr.alignment ~= "Left" then
				module_2_upvr.playerlistWasPreviouslyActive = true
				StarterGui_upvr:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
			end
		end
	end
	module_2_upvr.selected:Connect(var116)
	function var116() -- Line 444
		--[[ Upvalues[2]:
			[1]: module_2_upvr (readonly)
			[2]: StarterGui_upvr (copied, readonly)
		]]
		if module_2_upvr.chatWasPreviouslyActive then
			module_2_upvr.chatWasPreviouslyActive = nil
			StarterGui_upvr:SetCore("ChatActive", true)
		end
		if module_2_upvr.playerlistWasPreviouslyActive then
			module_2_upvr.playerlistWasPreviouslyActive = nil
			StarterGui_upvr:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
		end
	end
	module_2_upvr.deselected:Connect(var116)
	function var116() -- Line 459
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if module_2_upvr.activeState == "Deselected" then
			module_2_upvr.stateChanged:Fire("Deselected")
			module_2_upvr:refresh()
		end
	end
	task.delay(0.1, var116)
	var116 = module_2_upvr
	module_upvr.iconAdded:Fire(var116)
	return module_2_upvr
end
function module_upvr.setName(arg1, arg2) -- Line 475
	arg1.widget.Name = arg2
	arg1.name = arg2
	return arg1
end
function module_upvr.setState(arg1, arg2, arg3, arg4) -- Line 481
	--[[ Upvalues[2]:
		[1]: Utility_upvr (readonly)
		[2]: any_new_result1_2_upvr (readonly)
	]]
	if not arg2 then
		if arg1.isSelected then
		else
		end
	end
	local any_formatStateName_result1 = Utility_upvr.formatStateName("Deselected")
	if arg1.activeState == any_formatStateName_result1 then
	else
		arg1.activeState = any_formatStateName_result1
		if any_formatStateName_result1 == "Deselected" then
			arg1.isSelected = false
			if arg1.isSelected then
				arg1.toggled:Fire(false, arg3, arg4)
				arg1.deselected:Fire(arg3, arg4)
			end
			arg1:_setToggleItemsVisible(false, arg3, arg4)
		elseif any_formatStateName_result1 == "Selected" then
			arg1.isSelected = true
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if not arg1.isSelected then
				arg1.toggled:Fire(true, arg3, arg4)
				arg1.selected:Fire(arg3, arg4)
				any_new_result1_2_upvr:Fire(arg1, arg3, arg4)
			end
			arg1:_setToggleItemsVisible(true, arg3, arg4)
		end
		arg1.stateChanged:Fire(any_formatStateName_result1, arg3, arg4)
	end
end
function module_upvr.getInstance(arg1, arg2) -- Line 514
	--[[ Upvalues[1]:
		[1]: Themes_2_upvr (readonly)
	]]
	local var118 = arg1.cachedNamesToInstances[arg2]
	if var118 then
		return var118
	end
	local function cacheInstance_upvr(arg1_2, arg2_2) -- Line 522, Named "cacheInstance"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var119
		if not arg1.cachedInstances[arg2_2] then
			local Collective = arg2_2:GetAttribute("Collective")
			var119 = Collective
			if var119 then
				var119 = arg1.cachedCollectives[Collective]
			end
			if var119 then
				table.insert(var119, arg2_2)
			end
			arg1.cachedNamesToInstances[arg1_2] = arg2_2
			arg1.cachedInstances[arg2_2] = true
			arg2_2.Destroying:Once(function() -- Line 532
				--[[ Upvalues[3]:
					[1]: arg1 (copied, readonly)
					[2]: arg1_2 (readonly)
					[3]: arg2_2 (readonly)
				]]
				arg1.cachedNamesToInstances[arg1_2] = nil
				arg1.cachedInstances[arg2_2] = nil
			end)
		end
	end
	local widget = arg1.widget
	cacheInstance_upvr("Widget", widget)
	if arg2 == "Widget" then
		return widget
	end
	local var123_upvw
	local function scanChildren_upvr(arg1_3) -- Line 545, Named "scanChildren"
		--[[ Upvalues[6]:
			[1]: arg1 (readonly)
			[2]: Themes_2_upvr (copied, readonly)
			[3]: scanChildren_upvr (readonly)
			[4]: cacheInstance_upvr (readonly)
			[5]: arg2 (readonly)
			[6]: var123_upvw (read and write)
		]]
		for _, v_10 in pairs(arg1_3:GetChildren()) do
			local WidgetUID = v_10:GetAttribute("WidgetUID")
			if not WidgetUID or WidgetUID == arg1.UID then
				local any_getRealInstance_result1 = Themes_2_upvr.getRealInstance(v_10)
				if any_getRealInstance_result1 then
					v_10 = any_getRealInstance_result1
				end
				scanChildren_upvr(v_10)
				if v_10:IsA("GuiBase") or v_10:IsA("UIBase") or v_10:IsA("ValueBase") then
					local Name = v_10.Name
					cacheInstance_upvr(Name, v_10)
					if Name == arg2 then
						var123_upvw = v_10
					end
				end
			end
		end
	end
	scanChildren_upvr(widget)
	return var123_upvw
end
function module_upvr.getCollective(arg1, arg2) -- Line 575
	local var134 = arg1.cachedCollectives[arg2]
	if var134 then
		return var134
	end
	local module = {}
	for i_11, _ in pairs(arg1.cachedInstances) do
		if i_11:GetAttribute("Collective") == arg2 then
			table.insert(module, i_11)
		end
	end
	arg1.cachedCollectives[arg2] = module
	return module
end
function module_upvr.getInstanceOrCollective(arg1, arg2) -- Line 596
	local any_getInstance_result1 = arg1:getInstance(arg2)
	local var140
	if any_getInstance_result1 then
		table.insert(var140, any_getInstance_result1)
	end
	if #var140 == 0 then
		var140 = arg1:getCollective(arg2)
	end
	return var140
end
function module_upvr.getStateGroup(arg1, arg2) -- Line 610
	local var141 = arg2
	if not var141 then
		var141 = arg1.activeState
	end
	local var142 = arg1.appearance[var141]
	if not var142 then
		var142 = {}
		arg1.appearance[var141] = var142
	end
	return var142
end
function module_upvr.refreshAppearance(arg1, arg2, arg3) -- Line 620
	--[[ Upvalues[1]:
		[1]: Themes_2_upvr (readonly)
	]]
	Themes_2_upvr.refresh(arg1, arg2, arg3)
	return arg1
end
function module_upvr.refresh(arg1) -- Line 625
	arg1:refreshAppearance(arg1.widget)
	arg1.updateSize:Fire()
	return arg1
end
function module_upvr.updateParent(arg1) -- Line 631
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_getIconByUID_result1_2 = module_upvr.getIconByUID(arg1.parentIconUID)
	if any_getIconByUID_result1_2 then
		any_getIconByUID_result1_2.updateSize:Fire()
	end
end
function module_upvr.setBehaviour(arg1, arg2, arg3, arg4, arg5) -- Line 638
	arg1.customBehaviours[arg2..'-'..arg3] = arg4
	if arg5 then
		for _, v_12 in pairs(arg1:getInstanceOrCollective(arg2)) do
			arg1:refreshAppearance(v_12, arg3)
		end
	end
end
function module_upvr.modifyTheme(arg1, arg2, arg3) -- Line 651
	--[[ Upvalues[1]:
		[1]: Themes_2_upvr (readonly)
	]]
	return arg1, Themes_2_upvr.modify(arg1, arg2, arg3)
end
function module_upvr.modifyChildTheme(arg1, arg2, arg3) -- Line 656
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	arg1.childModifications = arg2
	arg1.childModificationsUID = arg3
	for i_13, _ in pairs(arg1.childIconsDict) do
		module_upvr.getIconByUID(i_13):modifyTheme(arg2, arg3)
	end
	arg1.childThemeModified:Fire()
	return arg1
end
function module_upvr.removeModification(arg1, arg2) -- Line 669
	--[[ Upvalues[1]:
		[1]: Themes_2_upvr (readonly)
	]]
	Themes_2_upvr.remove(arg1, arg2)
	return arg1
end
function module_upvr.removeModificationWith(arg1, arg2, arg3, arg4) -- Line 674
	--[[ Upvalues[1]:
		[1]: Themes_2_upvr (readonly)
	]]
	Themes_2_upvr.removeWith(arg1, arg2, arg3, arg4)
	return arg1
end
function module_upvr.setTheme(arg1, arg2) -- Line 679
	--[[ Upvalues[1]:
		[1]: Themes_2_upvr (readonly)
	]]
	Themes_2_upvr.set(arg1, arg2)
	return arg1
end
function module_upvr.setEnabled(arg1, arg2) -- Line 684
	arg1.isEnabled = arg2
	arg1.widget.Visible = arg2
	arg1:updateParent()
	return arg1
end
function module_upvr.select(arg1, arg2, arg3) -- Line 691
	arg1:setState("Selected", arg2, arg3)
	return arg1
end
function module_upvr.deselect(arg1, arg2, arg3) -- Line 696
	arg1:setState("Deselected", arg2, arg3)
	return arg1
end
function module_upvr.notify(arg1, arg2, arg3) -- Line 701
	--[[ Upvalues[2]:
		[1]: Elements_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	if not arg1.notice then
		arg1.notice = require(Elements_upvr.Notice)(arg1, module_upvr)
	end
	arg1.noticeStarted:Fire(arg2, arg3)
	return arg1
end
function module_upvr.clearNotices(arg1) -- Line 715
	arg1.endNotices:Fire()
	return arg1
end
function module_upvr.disableOverlay(arg1, arg2) -- Line 720
	arg1.overlayDisabled = arg2
	return arg1
end
module_upvr.disableStateOverlay = module_upvr.disableOverlay
function module_upvr.setImage(arg1, arg2, arg3) -- Line 726
	local tbl_10 = {"IconImage", "Image"}
	tbl_10[3] = arg2
	tbl_10[4] = arg3
	arg1:modifyTheme(tbl_10)
	return arg1
end
function module_upvr.setLabel(arg1, arg2, arg3) -- Line 731
	local tbl_2 = {"IconLabel", "Text"}
	tbl_2[3] = arg2
	tbl_2[4] = arg3
	arg1:modifyTheme(tbl_2)
	return arg1
end
function module_upvr.setOrder(arg1, arg2, arg3) -- Line 736
	local tbl_9 = {"Widget", "LayoutOrder"}
	tbl_9[3] = arg2
	tbl_9[4] = arg3
	arg1:modifyTheme(tbl_9)
	return arg1
end
function module_upvr.setCornerRadius(arg1, arg2, arg3) -- Line 741
	local tbl_11 = {"IconCorners", "CornerRadius"}
	tbl_11[3] = arg2
	tbl_11[4] = arg3
	arg1:modifyTheme(tbl_11)
	return arg1
end
function module_upvr.align(arg1, arg2, arg3) -- Line 746
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local any_lower_result1 = tostring(arg2):lower()
	if any_lower_result1 == "mid" or any_lower_result1 == "centre" then
	end
	if "center" ~= "left" then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
		if "center" ~= "center" and "center" ~= "right" then
		end
	end
	if "left" ~= "center" or not module_upvr.container.TopbarCentered then
		local TopbarStandard_2 = module_upvr.container.TopbarStandard
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
	local var164 = string.upper(string.sub("left", 1, 1))..string.sub("left", 2)
	if not arg3 then
		arg1.originalAlignment = var164
	end
	local var165 = TopbarStandard_2.Holders[var164]
	arg1.screenGui = TopbarStandard_2
	arg1.alignmentHolder = var165
	if not arg1.isDestroyed then
		arg1.widget.Parent = arg1.joinedFrame or var165
	end
	arg1.alignment = var164
	arg1.alignmentChanged:Fire(var164)
	module_upvr.iconChanged:Fire(arg1)
	return arg1
end
module_upvr.setAlignment = module_upvr.align
function module_upvr.setLeft(arg1) -- Line 775
	arg1:setAlignment("Left")
	return arg1
end
function module_upvr.setMid(arg1) -- Line 780
	arg1:setAlignment("Center")
	return arg1
end
function module_upvr.setRight(arg1) -- Line 785
	arg1:setAlignment("Right")
	return arg1
end
function module_upvr.setWidth(arg1, arg2, arg3) -- Line 790
	local tbl_8 = {"Widget", "Size", UDim2.fromOffset(arg2, arg1.widget.Size.Y.Offset)}
	tbl_8[4] = arg3
	arg1:modifyTheme(tbl_8)
	local tbl_5 = {"Widget", "DesiredWidth"}
	tbl_5[3] = arg2
	tbl_5[4] = arg3
	arg1:modifyTheme(tbl_5)
	return arg1
end
function module_upvr.setImageScale(arg1, arg2, arg3) -- Line 800
	local tbl_4 = {"IconImageScale", "Value"}
	tbl_4[3] = arg2
	tbl_4[4] = arg3
	arg1:modifyTheme(tbl_4)
	return arg1
end
function module_upvr.setImageRatio(arg1, arg2, arg3) -- Line 805
	local tbl_3 = {"IconImageRatio", "AspectRatio"}
	tbl_3[3] = arg2
	tbl_3[4] = arg3
	arg1:modifyTheme(tbl_3)
	return arg1
end
function module_upvr.setTextSize(arg1, arg2, arg3) -- Line 810
	local tbl = {"IconLabel", "TextSize"}
	tbl[3] = arg2
	tbl[4] = arg3
	arg1:modifyTheme(tbl)
	return arg1
end
function module_upvr.setTextFont(arg1, arg2, arg3, arg4, arg5) -- Line 815
	-- KONSTANTERROR: [0] 1. Error Block 22 start (CF ANALYSIS FAILED)
	local var171
	if not var171 then
		var171 = Enum.FontWeight.Regular
	end
	var171 = arg4
	if not var171 then
		var171 = Enum.FontStyle.Normal
	end
	var171 = nil
	local typeof_result1 = typeof(arg2)
	if typeof_result1 == "number" then
		var171 = Font.fromId(arg2, var171, var171)
		-- KONSTANTWARNING: GOTO [48] #39
	end
	-- KONSTANTERROR: [0] 1. Error Block 22 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [26] 22. Error Block 23 start (CF ANALYSIS FAILED)
	if typeof_result1 == "EnumItem" then
		var171 = Font.fromEnum(arg2)
	elseif typeof_result1 == "string" and not arg2:match("rbxasset") then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
		var171 = Font.fromName(arg2, var171, var171)
	end
	if not var171 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
		var171 = Font.new(arg2, var171, var171)
	end
	local tbl_6 = {"IconLabel", "FontFace", var171}
	tbl_6[4] = arg5
	arg1:modifyTheme(tbl_6)
	do
		return arg1
	end
	-- KONSTANTERROR: [26] 22. Error Block 23 end (CF ANALYSIS FAILED)
end
function module_upvr.bindToggleItem(arg1, arg2) -- Line 836
	if not arg2:IsA("GuiObject") and not arg2:IsA("LayerCollector") then
		error("Toggle item must be a GuiObject or LayerCollector!")
	end
	arg1.toggleItems[arg2] = true
	arg1:_updateSelectionInstances()
	return arg1
end
function module_upvr.unbindToggleItem(arg1, arg2) -- Line 845
	arg1.toggleItems[arg2] = nil
	arg1:_updateSelectionInstances()
	return arg1
end
function module_upvr._updateSelectionInstances(arg1) -- Line 851
	for i_14, _ in pairs(arg1.toggleItems) do
		for _, v_15 in pairs(i_14:GetDescendants()) do
			if v_15:IsA("TextButton") or v_15:IsA("ImageButton") then
				if v_15.Active then
					table.insert({}, v_15)
				end
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		arg1.toggleItems[i_14] = {}
	end
end
function module_upvr._setToggleItemsVisible(arg1, arg2, arg3, arg4) -- Line 865
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local _
	for i_16, _ in pairs(arg1.toggleItems) do
		if not arg4 or arg4 == arg1 or arg4.toggleItems[i_16] == nil then
			if i_16:IsA("LayerCollector") then
			end
			i_16.Enabled = arg2
		end
	end
end
function module_upvr.bindEvent(arg1, arg2, arg3) -- Line 877
	local var199 = arg1[arg2]
	local var200
	if var200 then
		var200 = false
		if typeof(var199) == "table" then
			var200 = var199.Connect
		end
	end
	assert(var200, "argument[1] must be a valid topbarplus icon event name!")
	if typeof(arg3) ~= "function" then
		var200 = false
	else
		var200 = true
	end
	assert(var200, "argument[2] must be a function!")
	var200 = var199:Connect(function(...) -- Line 881
		--[[ Upvalues[2]:
			[1]: arg3 (readonly)
			[2]: arg1 (readonly)
		]]
		arg3(arg1, ...)
	end)
	arg1.bindedEvents[arg2] = var200
	return arg1
end
function module_upvr.unbindEvent(arg1, arg2) -- Line 887
	local var202 = arg1.bindedEvents[arg2]
	if var202 then
		var202:Disconnect()
		arg1.bindedEvents[arg2] = nil
	end
	return arg1
end
function module_upvr.bindToggleKey(arg1, arg2) -- Line 896
	local var203
	if typeof(arg2) ~= "EnumItem" then
		var203 = false
	else
		var203 = true
	end
	assert(var203, "argument[1] must be a KeyCode EnumItem!")
	var203 = true
	arg1.bindedToggleKeys[arg2] = var203
	arg1.toggleKeyAdded:Fire(arg2)
	arg1:setCaption("_hotkey_")
	return arg1
end
function module_upvr.unbindToggleKey(arg1, arg2) -- Line 904
	local var204
	if typeof(arg2) ~= "EnumItem" then
		var204 = false
	else
		var204 = true
	end
	assert(var204, "argument[1] must be a KeyCode EnumItem!")
	var204 = nil
	arg1.bindedToggleKeys[arg2] = var204
	return arg1
end
function module_upvr.call(arg1, arg2, ...) -- Line 910
	local packed_upvr = table.pack(...)
	task.spawn(function() -- Line 912
		--[[ Upvalues[3]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
			[3]: packed_upvr (readonly)
		]]
		arg2(arg1, table.unpack(packed_upvr))
	end)
	return arg1
end
function module_upvr.addToJanitor(arg1, arg2) -- Line 918
	arg1.janitor:add(arg2)
	return arg1
end
function module_upvr.lock(arg1) -- Line 923
	arg1:getInstance("ClickRegion").Visible = false
	arg1.locked = true
	return arg1
end
function module_upvr.unlock(arg1) -- Line 931
	arg1:getInstance("ClickRegion").Visible = true
	arg1.locked = false
	return arg1
end
function module_upvr.debounce(arg1, arg2) -- Line 938
	arg1:lock()
	task.wait(arg2)
	arg1:unlock()
	return arg1
end
function module_upvr.autoDeselect(arg1, arg2) -- Line 945
	if arg2 == nil then
	end
	arg1.deselectWhenOtherIconSelected = true
	return arg1
end
function module_upvr.oneClick(arg1, arg2) -- Line 955
	local singleClickJanitor = arg1.singleClickJanitor
	singleClickJanitor:clean()
	if arg2 or arg2 == nil then
		singleClickJanitor:add(arg1.selected:Connect(function() -- Line 961
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:deselect("OneClick", arg1)
		end))
	end
	arg1.oneClickEnabled = true
	return arg1
end
function module_upvr.setCaption(arg1, arg2) -- Line 969
	--[[ Upvalues[1]:
		[1]: Elements_upvr (readonly)
	]]
	if arg2 == "_hotkey_" and arg1.captionText then
		return arg1
	end
	arg1.captionJanitor:clean()
	if not arg2 or arg2 == "" then
		arg1.caption = nil
		arg1.captionText = nil
		return arg1
	end
	local any_add_result1 = arg1.captionJanitor:add(require(Elements_upvr.Caption)(arg1))
	any_add_result1:SetAttribute("CaptionText", arg2)
	arg1.caption = any_add_result1
	arg1.captionText = arg2
	return arg1
end
function module_upvr.setCaptionHint(arg1, arg2) -- Line 987
	local var210
	if typeof(arg2) ~= "EnumItem" then
		var210 = false
	else
		var210 = true
	end
	assert(var210, "argument[1] must be a KeyCode EnumItem!")
	arg1.fakeToggleKey = arg2
	arg1.fakeToggleKeyChanged:Fire(arg2)
	arg1:setCaption("_hotkey_")
	return arg1
end
function module_upvr.leave(arg1) -- Line 995
	arg1.joinJanitor:clean()
	return arg1
end
function module_upvr.joinMenu(arg1, arg2) -- Line 1001
	--[[ Upvalues[1]:
		[1]: Utility_upvr (readonly)
	]]
	Utility_upvr.joinFeature(arg1, arg2, arg2.menuIcons, arg2:getInstance("Menu"))
	arg2.menuChildAdded:Fire(arg1)
	return arg1
end
function module_upvr.setMenu(arg1, arg2) -- Line 1007
	arg1.menuSet:Fire(arg2)
	return arg1
end
function module_upvr.setFrozenMenu(arg1, arg2) -- Line 1012
	arg1:freezeMenu(arg2)
	arg1:setMenu(arg2)
end
function module_upvr.freezeMenu(arg1) -- Line 1017
	arg1:select("FrozenMenu", arg1)
	arg1:bindEvent("deselected", function(arg1_4) -- Line 1021
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1_4:select("FrozenMenu", arg1)
	end)
	arg1:modifyTheme({"IconSpot", "Visible", false})
end
function module_upvr.joinDropdown(arg1, arg2) -- Line 1027
	--[[ Upvalues[1]:
		[1]: Utility_upvr (readonly)
	]]
	arg2:getDropdown()
	Utility_upvr.joinFeature(arg1, arg2, arg2.dropdownIcons, arg2:getInstance("DropdownScroller"))
	arg2.dropdownChildAdded:Fire(arg1)
	return arg1
end
function module_upvr.getDropdown(arg1) -- Line 1034
	--[[ Upvalues[1]:
		[1]: Elements_upvr (readonly)
	]]
	if not arg1.dropdown then
		local var213 = require(Elements_upvr.Dropdown)(arg1)
		arg1.dropdown = var213
		arg1:clipOutside(var213)
	end
	return var213
end
function module_upvr.setDropdown(arg1, arg2) -- Line 1044
	arg1:getDropdown()
	arg1.dropdownSet:Fire(arg2)
	return arg1
end
function module_upvr.clipOutside(arg1, arg2) -- Line 1050
	--[[ Upvalues[1]:
		[1]: Utility_upvr (readonly)
	]]
	arg1:refreshAppearance(arg2)
	return arg1, Utility_upvr.clipOutside(arg1, arg2)
end
function module_upvr.setIndicator(arg1, arg2) -- Line 1061
	--[[ Upvalues[2]:
		[1]: Elements_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	if not arg1.indicator then
		arg1.indicator = arg1.janitor:add(require(Elements_upvr.Indicator)(arg1, module_upvr))
	end
	arg1.indicatorSet:Fire(arg2)
end
function module_upvr.destroy(arg1) -- Line 1076
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if arg1.isDestroyed then
	else
		arg1:clearNotices()
		if arg1.parentIconUID then
			arg1:leave()
		end
		arg1.isDestroyed = true
		arg1.janitor:clean()
		module_upvr.iconRemoved:Fire(arg1)
	end
end
module_upvr.Destroy = module_upvr.destroy
return module_upvr