--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.1foreverhd_topbarplus@3.0.2.topbarplus.Features.Themes
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:26
-- Luau version 6, Types version 3
-- Time taken: 0.010929 seconds

local module_upvr = {}
local Utility_upvr = require(script.Parent.Parent.Utility)
function module_upvr.getThemeValue(arg1, arg2, arg3, arg4) -- Line 16
	if arg1 then
		for _, v in pairs(arg1) do
			local unpack_result1, unpack_result2, unpack_result3 = unpack(v)
			if arg2 == unpack_result1 and arg3 == unpack_result2 then
				return unpack_result3
			end
		end
	end
end
function module_upvr.getInstanceValue(arg1, arg2) -- Line 27
	local pcall_result1, pcall_result2 = pcall(function() -- Line 28
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		return arg1[arg2]
	end)
	if not pcall_result1 then
		pcall_result2 = arg1:GetAttribute(arg2)
	end
	return pcall_result2
end
function module_upvr.getRealInstance(arg1) -- Line 37
	if not arg1:GetAttribute("IsAClippedClone") then return end
	local OriginalInstance = arg1:FindFirstChild("OriginalInstance")
	if not OriginalInstance then return end
	return OriginalInstance.Value
end
function module_upvr.getClippedClone(arg1) -- Line 48
	if not arg1:GetAttribute("HasAClippedClone") then return end
	local ClippedClone = arg1:FindFirstChild("ClippedClone")
	if not ClippedClone then return end
	return ClippedClone.Value
end
function module_upvr.refresh(arg1, arg2, arg3) -- Line 59
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if arg3 then
		local any_getThemeValue_result1 = module_upvr.getThemeValue(arg1:getStateGroup(), arg2.Name, arg3)
		if not any_getThemeValue_result1 then
			any_getThemeValue_result1 = module_upvr.getInstanceValue(arg2, arg3)
		end
		module_upvr.apply(arg1, arg2, arg3, any_getThemeValue_result1, true)
	else
		local any_getStateGroup_result1 = arg1:getStateGroup()
		if not any_getStateGroup_result1 then return end
		local tbl = {}
		tbl[arg2.Name] = arg2
		for _, v_10 in pairs(arg2:GetDescendants()) do
			local Collective = v_10:GetAttribute("Collective")
			if Collective then
				tbl[Collective] = v_10
			end
			tbl[v_10.Name] = v_10
		end
		for _, v_11 in pairs(any_getStateGroup_result1) do
			local unpack_result1_2, unpack_result2_2, unpack_result3_2 = unpack(v_11)
			local var37 = tbl[unpack_result1_2]
			if var37 then
				module_upvr.apply(arg1, var37.Name, unpack_result2_2, unpack_result3_2, true)
			end
		end
	end
end
function module_upvr.apply(arg1, arg2, arg3, arg4, arg5) -- Line 92
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var84
	if var84 then
	else
		var84 = nil
		local var85 = arg2
		if typeof(arg2) == "Instance" then
			local tbl_4 = {}
			tbl_4[1] = arg2
			var84 = tbl_4
			var85 = arg2.Name
		else
			var84 = arg1:getInstanceOrCollective(arg2)
		end
		local var87 = arg1.customBehaviours[var85..'-'..arg3]
		for _, v_12 in pairs(var84) do
			local any_getClippedClone_result1_2 = module_upvr.getClippedClone(v_12)
			if any_getClippedClone_result1_2 then
				table.insert(var84, any_getClippedClone_result1_2)
			end
		end
		for _, v_13_upvr in pairs(var84) do
			if arg3 == "Position" and module_upvr.getClippedClone(v_13_upvr) then
				local var95
			elseif arg3 ~= "Size" or not module_upvr.getRealInstance(v_13_upvr) or arg5 or var95 ~= module_upvr.getInstanceValue(v_13_upvr, arg3) then
				if var87 then
					local var87_result1 = var87(var95, v_13_upvr, arg3)
					if var87_result1 ~= nil then
						var95 = var87_result1
						local var97_upvw = var95
					end
				end
				if not pcall(function() -- Line 138
					--[[ Upvalues[3]:
						[1]: v_13_upvr (readonly)
						[2]: arg3 (readonly)
						[3]: var97_upvw (read and write)
					]]
					v_13_upvr[arg3] = var97_upvw
				end) then
					v_13_upvr:SetAttribute(arg3, var97_upvw)
				end
			end
		end
	end
end
function module_upvr.getModifications(arg1) -- Line 152
	local var99
	if typeof(arg1[1]) ~= "table" then
		var99 = {var99}
	end
	return var99
end
function module_upvr.merge(arg1, arg2, arg3) -- Line 161
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local unpacked_value_1_3, unpacked_value_2, unpacked_value_3, unpacked_value_4_2 = table.unpack(arg2)
	local unpacked_value_1, unpacked_value_2_2, _, unpacked_value_4 = table.unpack(arg1)
	if unpacked_value_1_3 == unpacked_value_1 and unpacked_value_2 == unpacked_value_2_2 and module_upvr.statesMatch(unpacked_value_4_2, unpacked_value_4) then
		arg1[3] = unpacked_value_3
		if arg3 then
			arg3(arg1)
		end
		return true
	end
	return false
end
function module_upvr.modify(arg1, arg2, arg3) -- Line 174
	--[[ Upvalues[2]:
		[1]: Utility_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	task.spawn(function() -- Line 182
		--[[ Upvalues[5]:
			[1]: arg3 (read and write)
			[2]: Utility_upvr (copied, readonly)
			[3]: arg2 (read and write)
			[4]: module_upvr (copied, readonly)
			[5]: arg1 (readonly)
		]]
		local var114 = arg3
		if not var114 then
			var114 = Utility_upvr.generateUID()
		end
		arg3 = var114
		arg2 = module_upvr.getModifications(arg2)
		for _, v_2_upvr in pairs(arg2) do
			local unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr, unpacked_value_4_3 = table.unpack(v_2_upvr)
			if unpacked_value_4_3 == nil then
				module_upvr.modify(arg1, {unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr, "Selected"}, arg3)
				module_upvr.modify(arg1, {unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr, "Viewing"}, arg3)
			end
			local any_formatStateName_result1_upvr = Utility_upvr.formatStateName(unpacked_value_4_3 or "Deselected")
			local function _() -- Line 194, Named "nowSetIt"
				--[[ Upvalues[6]:
					[1]: any_formatStateName_result1_upvr (readonly)
					[2]: arg1 (copied, readonly)
					[3]: module_upvr (copied, readonly)
					[4]: unpacked_value_1_2_upvr (readonly)
					[5]: unpacked_value_2_3_upvr (readonly)
					[6]: unpacked_value_3_upvr (readonly)
				]]
				if any_formatStateName_result1_upvr == arg1.activeState then
					module_upvr.apply(arg1, unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr)
				end
			end
			local any_getStateGroup_result1_2_upvr = arg1:getStateGroup(any_formatStateName_result1_upvr)
			;(function() -- Line 199, Named "updateRecord"
				--[[ Upvalues[9]:
					[1]: any_getStateGroup_result1_2_upvr (readonly)
					[2]: module_upvr (copied, readonly)
					[3]: v_2_upvr (readonly)
					[4]: arg3 (copied, read and write)
					[5]: any_formatStateName_result1_upvr (readonly)
					[6]: arg1 (copied, readonly)
					[7]: unpacked_value_1_2_upvr (readonly)
					[8]: unpacked_value_2_3_upvr (readonly)
					[9]: unpacked_value_3_upvr (readonly)
				]]
				for _, v_3 in pairs(any_getStateGroup_result1_2_upvr) do
					if module_upvr.merge(v_3, v_2_upvr, function(arg1_2) -- Line 201
						--[[ Upvalues[7]:
							[1]: arg3 (copied, read and write)
							[2]: any_formatStateName_result1_upvr (copied, readonly)
							[3]: arg1 (copied, readonly)
							[4]: module_upvr (copied, readonly)
							[5]: unpacked_value_1_2_upvr (copied, readonly)
							[6]: unpacked_value_2_3_upvr (copied, readonly)
							[7]: unpacked_value_3_upvr (copied, readonly)
						]]
						arg1_2[5] = arg3
						if any_formatStateName_result1_upvr == arg1.activeState then
							module_upvr.apply(arg1, unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr)
						end
					end) then return end
				end
				local tbl_5 = {unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr, any_formatStateName_result1_upvr}
				tbl_5[5] = arg3
				table.insert(any_getStateGroup_result1_2_upvr, tbl_5)
				if any_formatStateName_result1_upvr == arg1.activeState then
					module_upvr.apply(arg1, unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr)
				end
			end)()
		end
	end)
	return arg3
end
function module_upvr.remove(arg1, arg2) -- Line 219
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	for _, v_4 in pairs(arg1.appearance) do
		for i_5 = #v_4, 1, -1 do
			if v_4[i_5][5] == arg2 then
				table.remove(v_4, i_5)
			end
		end
	end
	module_upvr.rebuild(arg1)
end
function module_upvr.removeWith(arg1, arg2, arg3, arg4) -- Line 232
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	for i_6, v_5 in pairs(arg1.appearance) do
		if arg4 == i_6 or not arg4 then
			for i_7 = #v_5, 1, -1 do
				local var145 = v_5[i_7]
				if var145[1] == arg2 and var145[2] == arg3 then
					table.remove(v_5, i_7)
				end
			end
		end
	end
	module_upvr.rebuild(arg1)
end
function module_upvr.change(arg1) -- Line 248
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	for _, v_6 in pairs(arg1:getStateGroup()) do
		local unpack_result1_3, unpack_result2_3, unpack_result3_3 = unpack(v_6)
		module_upvr.apply(arg1, unpack_result1_3, unpack_result2_3, unpack_result3_3)
	end
end
function module_upvr.set(arg1, arg2) -- Line 258
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local themesJanitor = arg1.themesJanitor
	themesJanitor:clean()
	themesJanitor:add(arg1.stateChanged:Connect(function() -- Line 264
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		module_upvr.change(arg1)
	end))
	local var156
	if typeof(arg2) == "Instance" and var156:IsA("ModuleScript") then
		var156 = require(var156)
	end
	arg1.appliedTheme = var156
	module_upvr.rebuild(arg1)
end
function module_upvr.statesMatch(arg1, arg2) -- Line 274
	local var159 = arg1
	if var159 then
		var159 = string.lower(arg1)
	end
	local var160 = arg2
	if var160 then
		var160 = string.lower(arg2)
	end
	local var161 = true
	if var159 ~= var160 then
		var161 = not arg1
		if not var161 then
			var161 = not arg2
		end
	end
	return var161
end
local Default_upvr = require(script.Default)
function module_upvr.rebuild(arg1) -- Line 281
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: Utility_upvr (readonly)
		[3]: Default_upvr (readonly)
	]]
	local tbl_6_upvr = {"Deselected", "Selected", "Viewing"}
	local appliedTheme_upvr = arg1.appliedTheme
	;(function() -- Line 288, Named "generateTheme"
		--[[ Upvalues[6]:
			[1]: tbl_6_upvr (readonly)
			[2]: module_upvr (copied, readonly)
			[3]: Utility_upvr (copied, readonly)
			[4]: Default_upvr (copied, readonly)
			[5]: appliedTheme_upvr (readonly)
			[6]: arg1 (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		for _, v_7 in pairs(tbl_6_upvr) do
			local tbl_2_upvr = {}
			local function updateDetails(arg1_3, arg2) -- Line 294
				--[[ Upvalues[3]:
					[1]: module_upvr (copied, readonly)
					[2]: Utility_upvr (copied, readonly)
					[3]: tbl_2_upvr (readonly)
				]]
				if not arg1_3 then
				else
					for _, v_14 in pairs(arg1_3) do
						if module_upvr.statesMatch(arg2, v_14[4]) then
							local any_copyTable_result1 = Utility_upvr.copyTable(v_14)
							any_copyTable_result1[5] = v_14[5]
							tbl_2_upvr[v_14[1]..'-'..v_14[2]] = any_copyTable_result1
						end
					end
				end
			end
			if v_7 == "Selected" then
				updateDetails(Default_upvr, "Deselected")
			end
			updateDetails(Default_upvr, "Empty")
			updateDetails(Default_upvr, v_7)
			if appliedTheme_upvr ~= Default_upvr then
				if v_7 == "Selected" then
					updateDetails(appliedTheme_upvr, "Deselected")
				end
				updateDetails(Default_upvr, "Empty")
				updateDetails(appliedTheme_upvr, v_7)
			end
			local var199 = arg1.appearance[v_7]
			if var199 then
				for _, v_8 in pairs(var199) do
					local _5 = v_8[5]
					if _5 ~= nil then
						table.insert({}, {v_8[1], v_8[2], v_8[3], v_7, _5})
					end
				end
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			updateDetails({}, v_7)
			for _, v_9 in pairs(tbl_2_upvr) do
				table.insert({}, v_9)
				local var209
			end
			arg1.appearance[v_7] = var209
		end
		module_upvr.change(arg1)
	end)()
end
return module_upvr