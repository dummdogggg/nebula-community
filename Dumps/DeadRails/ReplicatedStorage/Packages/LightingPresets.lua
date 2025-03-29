--[[
    Script: ReplicatedStorage.Packages.LightingPresets
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:31
-- Luau version 6, Types version 3
-- Time taken: 0.008574 seconds

local Lighting_upvr = game:GetService("Lighting")
local ._LightingPresets_Properties_upvr = require("./LightingPresets/Properties")
local module_2_upvr = {
	setLighting = function(arg1) -- Line 19, Named "setLighting"
		--[[ Upvalues[2]:
			[1]: Lighting_upvr (readonly)
			[2]: ._LightingPresets_Properties_upvr (readonly)
		]]
		for _, v in Lighting_upvr:GetChildren() do
			if not arg1:FindFirstChild(v.Name) then
				v:Destroy()
			end
		end
		if not arg1:FindFirstChild("Clouds") then
			local class_Clouds_2 = workspace.Terrain:FindFirstChildOfClass("Clouds")
			if class_Clouds_2 then
				class_Clouds_2:Destroy()
			end
		end
		for _, v_2 in ._LightingPresets_Properties_upvr.Lighting do
			local attribute_2 = arg1:GetAttribute(v_2)
			if attribute_2 ~= nil then
				Lighting_upvr[v_2] = attribute_2
			end
		end
		for _, v_3 in arg1:GetChildren() do
			attribute_2 = v_3.Name
			local var63
			if var63 == "Clouds" then
				var63 = workspace.Terrain:FindFirstChild("Clouds")
				if not var63 then
					var63 = Instance.new("Clouds")
					var63.Parent = workspace.Terrain
				end
				for i_4, v_4 in ._LightingPresets_Properties_upvr[v_3.Name] do
					local attribute = v_3:GetAttribute(v_4)
					if attribute ~= nil then
						var63[v_4] = attribute
					end
				end
			elseif ._LightingPresets_Properties_upvr[v_3.ClassName] then
				if not Lighting_upvr:FindFirstChild(v_3.Name) then
					local clone = v_3:Clone()
					clone.Parent = Lighting_upvr
				end
				i_4 = ._LightingPresets_Properties_upvr
				v_4 = v_3.ClassName
				for _, v_14 in i_4[v_4] do
					clone[v_14] = v_3[v_14]
				end
			end
		end
	end;
}
local Linear_upvr = Enum.EasingStyle.Linear
local Out_upvr = Enum.EasingDirection.Out
local TweenService_upvr = game:GetService("TweenService")
function module_2_upvr.tweenLightingAsync(arg1, arg2, arg3, arg4) -- Line 85
	--[[ Upvalues[5]:
		[1]: Lighting_upvr (readonly)
		[2]: Linear_upvr (readonly)
		[3]: Out_upvr (readonly)
		[4]: ._LightingPresets_Properties_upvr (readonly)
		[5]: TweenService_upvr (readonly)
	]]
	for i_5, v_5 in Lighting_upvr:GetChildren() do
		if not arg1:FindFirstChild(v_5.Name) then
			v_5:Destroy()
		end
	end
	if not arg1:FindFirstChild("Clouds") then
		local class_Clouds = workspace.Terrain:FindFirstChildOfClass("Clouds")
		if class_Clouds then
			class_Clouds:Destroy()
		end
	end
	local var93 = arg3
	if not var93 then
		var93 = Linear_upvr
	end
	i_5 = arg4
	if not i_5 then
		i_5 = Out_upvr
	end
	local TweenInfo_new_result1 = TweenInfo.new(arg2, var93, i_5)
	local tbl = {}
	for i_6, var98 in ._LightingPresets_Properties_upvr.Lighting do
		local attribute_6 = arg1:GetAttribute(var98)
		if attribute_6 ~= nil then
			if typeof(attribute_6) == "string" then
				Lighting_upvr[var98] = attribute_6
			else
				tbl[var98] = attribute_6
			end
		end
	end
	if tbl.ClockTime and tbl.ClockTime < Lighting_upvr.ClockTime then
		tbl.ClockTime = nil
		local NumberValue_upvr = Instance.new("NumberValue")
		i_6 = Lighting_upvr
		NumberValue_upvr.Value = i_6.ClockTime
		var98 = "Value"
		function var98() -- Line 136
			--[[ Upvalues[2]:
				[1]: Lighting_upvr (copied, readonly)
				[2]: NumberValue_upvr (readonly)
			]]
			Lighting_upvr.ClockTime = NumberValue_upvr.Value % 24
		end
		i_6 = TweenService_upvr
		i_6 = i_6:Create(NumberValue_upvr, TweenInfo_new_result1, {
			Value = tbl.ClockTime + 24;
		})
		var98 = i_6.Completed
		local any_Connect_result1_upvr = NumberValue_upvr:GetPropertyChangedSignal(var98):Connect(var98)
		local function var100() -- Line 141
			--[[ Upvalues[2]:
				[1]: any_Connect_result1_upvr (readonly)
				[2]: NumberValue_upvr (readonly)
			]]
			any_Connect_result1_upvr:Disconnect()
			NumberValue_upvr:Destroy()
		end
		var98 = var98:Once
		var98(var100)
		var98 = i_6:Play
		var98()
	end
	any_Connect_result1_upvr = Lighting_upvr
	i_6 = TweenInfo_new_result1
	var98 = tbl
	NumberValue_upvr = TweenService_upvr:Create(any_Connect_result1_upvr, i_6, var98):Play
	NumberValue_upvr()
	NumberValue_upvr = arg1:GetChildren()
	local children_6, NONE, NONE_7 = arg1:GetChildren()
	for _, v_7 in children_6, NONE, NONE_7 do
		var100 = v_7.Name
		local var105
		if var105 == "Clouds" then
			var105 = workspace.Terrain:FindFirstChild("Clouds")
			if not var105 then
				var105 = Instance.new("Clouds")
				var105.Parent = workspace.Terrain
			end
			for _, v_8 in ._LightingPresets_Properties_upvr[v_7.Name] do
				local attribute_5 = v_7:GetAttribute(v_8)
				if attribute_5 ~= nil then
					if typeof(attribute_5) == "string" then
						var105[v_8] = attribute_5
					else
						({})[v_8] = attribute_5
					end
				end
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			TweenService_upvr:Create(var105, TweenInfo_new_result1, {}):Play()
		elseif ._LightingPresets_Properties_upvr[v_7.ClassName] then
			if not Lighting_upvr:FindFirstChild(v_7.Name) then
				local clone_2 = v_7:Clone()
				clone_2.Parent = Lighting_upvr
			end
			for _, v_15 in ._LightingPresets_Properties_upvr[v_7.ClassName] do
				local var108 = v_7[v_15]
				if var108 ~= nil then
					if typeof(var108) == "string" then
						clone_2[v_15] = var108
					else
						({})[v_15] = var108
					end
				end
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
			TweenService_upvr:Create(clone_2, TweenInfo_new_result1, {}):Play()
		end
	end
	children_6 = task.wait
	NONE = arg2
	children_6(NONE)
end
function module_2_upvr.createPreset(arg1, arg2) -- Line 214
	--[[ Upvalues[1]:
		[1]: ._LightingPresets_Properties_upvr (readonly)
	]]
	local Configuration_2 = Instance.new("Configuration")
	for i_9, v_9 in arg1 do
		if table.find(._LightingPresets_Properties_upvr.Lighting, i_9) then
			Configuration_2:SetAttribute(i_9, v_9)
		end
	end
	if arg2 then
		for _, v_10 in arg2 do
			v_10.Parent = Configuration_2
		end
	end
	return Configuration_2
end
function module_2_upvr.createPresetFromCurrentSettings() -- Line 234
	--[[ Upvalues[3]:
		[1]: ._LightingPresets_Properties_upvr (readonly)
		[2]: Lighting_upvr (readonly)
		[3]: module_2_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local module_3 = {}
	local module = {}
	for i_11, v_11 in ._LightingPresets_Properties_upvr.Lighting do
		module_3[v_11] = Lighting_upvr[v_11]
	end
	local class_Clouds_3 = workspace.Terrain:FindFirstChildOfClass("Clouds")
	if class_Clouds_3 then
		local Configuration = Instance.new("Configuration")
		Configuration.Name = "Clouds"
		i_11 = nil
		v_11 = nil
		for _, v_12 in ._LightingPresets_Properties_upvr.Clouds, i_11, v_11 do
			Configuration:SetAttribute(v_12, class_Clouds_3[v_12])
			local _
		end
		i_11 = module
		v_11 = Configuration
		table.insert(i_11, v_11)
	end
	for _, v_13 in Lighting_upvr:GetChildren() do
		if v_13:IsA("PostEffect") or v_13:IsA("Atmosphere") or v_13:IsA("Sky") then
			table.insert(module, v_13:Clone())
		end
	end
	return module_2_upvr.createPreset(module_3, module)
end
return module_2_upvr