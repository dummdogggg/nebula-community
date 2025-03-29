--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.1foreverhd_topbarplus@3.0.2.topbarplus.Features.Overflow
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:25
-- Luau version 6, Types version 3
-- Time taken: 0.017676 seconds

local module_3_upvr = {}
local tbl_upvr_2 = {}
local tbl_upvr_3 = {}
local var4_upvw
local tbl_upvr_4 = {}
local Utility_upvr = require(script.Parent.Parent.Utility)
local var7_upvw
local CurrentCamera_upvr = workspace.CurrentCamera
function module_3_upvr.start(arg1) -- Line 23
	--[[ Upvalues[6]:
		[1]: var7_upvw (read and write)
		[2]: var4_upvw (read and write)
		[3]: tbl_upvr_2 (readonly)
		[4]: Utility_upvr (readonly)
		[5]: module_3_upvr (readonly)
		[6]: CurrentCamera_upvr (readonly)
	]]
	var7_upvw = arg1
	var4_upvw = var7_upvw.iconsDictionary
	local var20
	for _, v in pairs(var7_upvw.container) do
		if var20 == nil and v.ScreenInsets == Enum.ScreenInsets.TopbarSafeInsets then
			var20 = v
		end
		for _, v_2 in pairs(v.Holders:GetChildren()) do
			if v_2:GetAttribute("IsAHolder") then
				tbl_upvr_2[v_2.Name] = v_2
			end
		end
	end
	local var24_upvw = false
	local any_createStagger_result1_upvr = Utility_upvr.createStagger(0.1, function(arg1_2) -- Line 41
		--[[ Upvalues[2]:
			[1]: var24_upvw (read and write)
			[2]: module_3_upvr (copied, readonly)
		]]
		if not var24_upvw then
		else
			if not arg1_2 then
				module_3_upvr.updateAvailableIcons("Center")
			end
			module_3_upvr.updateBoundary("Left")
			module_3_upvr.updateBoundary("Right")
		end
	end)
	task.delay(1, function() -- Line 51
		--[[ Upvalues[2]:
			[1]: var24_upvw (read and write)
			[2]: any_createStagger_result1_upvr (readonly)
		]]
		var24_upvw = true
		any_createStagger_result1_upvr()
	end)
	var7_upvw.iconAdded:Connect(any_createStagger_result1_upvr)
	var7_upvw.iconRemoved:Connect(any_createStagger_result1_upvr)
	var7_upvw.iconChanged:Connect(any_createStagger_result1_upvr)
	CurrentCamera_upvr:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line 61
		--[[ Upvalues[1]:
			[1]: any_createStagger_result1_upvr (readonly)
		]]
		any_createStagger_result1_upvr(true)
	end)
	var20:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line 64
		--[[ Upvalues[1]:
			[1]: any_createStagger_result1_upvr (readonly)
		]]
		any_createStagger_result1_upvr(true)
	end)
end
function module_3_upvr.getWidth(arg1, arg2) -- Line 69
	local widget = arg1.widget
	local TargetWidth = widget:GetAttribute("TargetWidth")
	if not TargetWidth then
		TargetWidth = widget.AbsoluteSize.X
	end
	return TargetWidth
end
function module_3_upvr.getAvailableIcons(arg1) -- Line 74
	--[[ Upvalues[2]:
		[1]: tbl_upvr_3 (readonly)
		[2]: module_3_upvr (readonly)
	]]
	local var32 = tbl_upvr_3[arg1]
	if not var32 then
		var32 = module_3_upvr.updateAvailableIcons(arg1)
	end
	return var32
end
function module_3_upvr.updateAvailableIcons(arg1) -- Line 82
	--[[ Upvalues[4]:
		[1]: tbl_upvr_2 (readonly)
		[2]: var4_upvw (read and write)
		[3]: tbl_upvr_4 (readonly)
		[4]: tbl_upvr_3 (readonly)
	]]
	local module = {}
	local var41
	for _, v_3 in pairs(var4_upvw) do
		local var43
		if not var43 then
			var43 = tbl_upvr_4[v_3.parentIconUID]
		end
		if var43 and v_3.alignment == arg1 and not tbl_upvr_4[v_3.UID] then
			table.insert(module, v_3)
			var41 += 1
		end
	end
	if var41 <= 0 then
		return {}
	end
	table.sort(module, function(arg1_3, arg2) -- Line 106
		local LayoutOrder_2 = arg1_3.widget.LayoutOrder
		local LayoutOrder = arg2.widget.LayoutOrder
		local parentIconUID_2 = arg1_3.parentIconUID
		local parentIconUID = arg2.parentIconUID
		local var49
		if parentIconUID_2 == parentIconUID then
			if LayoutOrder_2 < LayoutOrder then
				var49 = true
				return var49
			end
			if LayoutOrder < LayoutOrder_2 then
				var49 = false
				return var49
			end
			if arg1_3.widget.AbsolutePosition.X >= arg2.widget.AbsolutePosition.X then
				var49 = false
			else
				var49 = true
			end
			return var49
		end
		if parentIconUID then
			var49 = false
			return var49
		end
		if parentIconUID_2 then
			var49 = true
			return var49
		end
	end)
	tbl_upvr_3[arg1] = module
	return module
end
function module_3_upvr.getRealXPositions(arg1, arg2) -- Line 132
	--[[ Upvalues[3]:
		[1]: tbl_upvr_2 (readonly)
		[2]: Utility_upvr (readonly)
		[3]: module_3_upvr (readonly)
	]]
	if arg1 ~= "Left" then
		local _ = false
		-- KONSTANTWARNING: Skipped task `defvar` above
	else
	end
	local var53 = tbl_upvr_2[arg1]
	local Offset_4 = var53.UIListLayout.Padding.Offset
	if not true or not var53.AbsolutePosition.X then
	end
	local module_2 = {}
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if true then
		Utility_upvr.reverseTable(arg2)
	end
	for i_4 = #arg2, 1, -1 do
		local var57 = arg2[i_4]
		local any_getWidth_result1 = module_3_upvr.getWidth(var57)
		local var59
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not true then
			var59 -= any_getWidth_result1
		end
		module_2[var57.UID] = var59
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if true then
			var59 += any_getWidth_result1
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not true or not Offset_4 then
		end
		var59 += -Offset_4
	end
	return module_2
end
local tbl_upvr = {}
function module_3_upvr.updateBoundary(arg1) -- Line 162
	--[[ Upvalues[6]:
		[1]: tbl_upvr_2 (readonly)
		[2]: module_3_upvr (readonly)
		[3]: tbl_upvr (readonly)
		[4]: var7_upvw (read and write)
		[5]: tbl_upvr_4 (readonly)
		[6]: Utility_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var128 = tbl_upvr_2[arg1]
	local UIListLayout = var128.UIListLayout
	local X_2 = var128.AbsolutePosition.X
	local X_4 = var128.AbsoluteSize.X
	local Offset_3 = UIListLayout.Padding.Offset
	local Offset_2 = UIListLayout.Padding.Offset
	local any_updateAvailableIcons_result1 = module_3_upvr.updateAvailableIcons(arg1)
	local var135 = 0
	local var136 = 0
	for i_5, v_4 in pairs(any_updateAvailableIcons_result1) do
		var135 += module_3_upvr.getWidth(v_4) + Offset_2
		var136 += 1
	end
	if var136 <= 0 then
		do
			return
		end
		local var140
	end
	if arg1 ~= "Central" then
	else
	end
	if arg1 ~= "Left" then
		var140 = false
	else
		var140 = true
	end
	local var141 = not var140
	v_4 = tbl_upvr
	i_5 = v_4[arg1]
	if not i_5 and not true then
		v_4 = #any_updateAvailableIcons_result1
		if 0 < v_4 then
			if var140 then
				v_4 = -9999999
			else
				v_4 = 9999999
			end
			i_5 = var7_upvw.new()
			i_5:setImage(6069276526, "Deselected")
			i_5:setName("Overflow"..arg1)
			i_5:setOrder(v_4)
			i_5:setAlignment(arg1)
			i_5:autoDeselect(false)
			i_5.isAnOverflow = true
			i_5:select("OverflowStart", i_5)
			i_5:setEnabled(false)
			tbl_upvr[arg1] = i_5
			tbl_upvr_4[i_5.UID] = true
		end
	end
	if arg1 == "Left" then
		v_4 = "Right"
	else
		v_4 = "Left"
	end
	local any_updateAvailableIcons_result1_4 = module_3_upvr.updateAvailableIcons(v_4)
	if not var140 or not any_updateAvailableIcons_result1_4[1] or var141 then
		local var143 = any_updateAvailableIcons_result1_4[#any_updateAvailableIcons_result1_4]
	end
	local var144 = tbl_upvr[v_4]
	if not var140 or not (X_2 + X_4) then
		local var145
	end
	if var143 then
		local var146 = module_3_upvr.getRealXPositions(v_4, any_updateAvailableIcons_result1_4)[var143.UID]
		var145 = module_3_upvr
		var145 = var143
		local function INLINED_8() -- Internal function, doesn't exist in bytecode
			var145 = var146 - Offset_3
			return var145
		end
		if not var140 or not INLINED_8() then
			var145 = var146 + var145.getWidth(var145) + Offset_3
		end
		local var147 = var145
	end
	local var148 = "Center"
	local any_getAvailableIcons_result1_2 = module_3_upvr.getAvailableIcons(var148)
	if var140 then
		var148 = 1
	else
		var148 = #any_getAvailableIcons_result1_2
	end
	local var150 = any_getAvailableIcons_result1_2[var148]
	if var150 then
		local var151
		if not var151 then
			local function INLINED_9() -- Internal function, doesn't exist in bytecode
				var151 = any_updateAvailableIcons_result1[var145]
				var145 = #any_updateAvailableIcons_result1
				return var151
			end
			local function INLINED_10() -- Internal function, doesn't exist in bytecode
				var151 = var141
				return var151
			end
			if not var140 or not INLINED_9() or INLINED_10() then
				var151 = any_updateAvailableIcons_result1[1]
			end
			var145 = var150.widget.AbsolutePosition.X
			local X_5 = var151.widget.AbsolutePosition.X
			if not var140 or not (var145 - Offset_3) then
			end
			if not var140 or not (X_5 + module_3_upvr.getWidth(var151)) then
			end
			if var140 then
				if var145 + module_3_upvr.getWidth(var150) + Offset_3 < X_5 then
					var150:align("Left")
					var150.hasRelocatedInOverflow = true
					-- KONSTANTWARNING: GOTO [233] #185
				end
			elseif var141 then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
				if X_5 < var145 + module_3_upvr.getWidth(var150) + Offset_3 then
					var150:align("Right")
					var150.hasRelocatedInOverflow = true
				end
			end
		end
	end
	if i_5 then
		var151 = var147
		var145 = i_5:getInstance("Menu")
		local var153
		local var154
		if var145 and var144 then
			local X = var144.widget.AbsolutePosition.X
			if not var140 or not (X - Offset_3) then
			end
			var154 = var145.AbsoluteCanvasSize
			var154 = var144:getInstance("Menu").AbsoluteCanvasSize.X
			if var154 > var154.X then
			else
			end
			var154 = X_4 / 2
			local var156 = X_2 + var154
			local function INLINED_11() -- Internal function, doesn't exist in bytecode
				var154 = var156 - Offset_3 / 2
				return var154
			end
			if not var140 or not INLINED_11() then
				var154 = var156 + Offset_3 / 2
			end
			var151 = var154
			if true then
				var151 = X + module_3_upvr.getWidth(var144) + Offset_3
			end
			if not var140 or not (var151 - X_2) then
			end
			var153 = X_2 + X_4 - var151
		end
		if var145 then
		end
		var153 = Utility_upvr.round(var153)
		if var145 and var145:GetAttribute("MaxWidth") ~= var153 then
			var145:SetAttribute("MaxWidth", var153)
		end
	end
	for i_6 = #any_updateAvailableIcons_result1, 1, -1 do
		local var157 = any_updateAvailableIcons_result1[i_6]
		local var158 = module_3_upvr.getRealXPositions(arg1, any_updateAvailableIcons_result1)[var157.UID]
		if var140 and var147 <= var158 + module_3_upvr.getWidth(var157) or var141 and var158 <= var147 then
			local var159 = true
		end
	end
	for i_7 = #any_updateAvailableIcons_result1, 1, -1 do
		local var160 = any_updateAvailableIcons_result1[i_7]
		if not tbl_upvr_4[var160.UID] then
			if var159 and not var160.parentIconUID then
				var160:joinMenu(i_5)
			elseif not var159 and var160.parentIconUID then
				var160:leave()
			end
		end
	end
	if i_5.isEnabled ~= var159 then
		i_7 = var159
		i_5:setEnabled(i_7)
	end
	if i_5.isEnabled and not i_5.overflowAlreadyOpened then
		i_5.overflowAlreadyOpened = true
		i_5:select()
	end
end
return module_3_upvr