--[[
    Script: ReplicatedStorage.Packages._Index.jakeywastaken_imgizmo@3.5.1.imgizmo
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:43:57
-- Luau version 6, Types version 3
-- Time taken: 0.007089 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local Terrain_upvr_2 = workspace:WaitForChild("Terrain")
local Terrain_upvr = workspace:WaitForChild("Terrain")
assert(Terrain_upvr_2, "No terrain object found under workspace")
assert(Terrain_upvr, "No target parent found.")
if not Terrain_upvr:FindFirstChild("AOTGizmoAdornment") then
	local WireframeHandleAdornment_upvw = Instance.new("WireframeHandleAdornment")
	WireframeHandleAdornment_upvw.Adornee = Terrain_upvr_2
	WireframeHandleAdornment_upvw.ZIndex = 1
	WireframeHandleAdornment_upvw.AlwaysOnTop = true
	WireframeHandleAdornment_upvw.Name = "AOTGizmoAdornment"
	WireframeHandleAdornment_upvw.Parent = Terrain_upvr
end
if not Terrain_upvr:FindFirstChild("GizmoAdornment") then
	local WireframeHandleAdornment_upvw_2 = Instance.new("WireframeHandleAdornment")
	WireframeHandleAdornment_upvw_2.Adornee = Terrain_upvr_2
	WireframeHandleAdornment_upvw_2.ZIndex = 1
	WireframeHandleAdornment_upvw_2.AlwaysOnTop = false
	WireframeHandleAdornment_upvw_2.Name = "GizmoAdornment"
	WireframeHandleAdornment_upvw_2.Parent = Terrain_upvr
end
local tbl_upvw = {}
local tbl_5_upvr = {}
local tbl_7_upvr = {}
local tbl_4_upvr = {}
local tbl_6_upvr = {
	AlwaysOnTop = true;
	Color3 = Color3.fromRGB(13, 105, 172);
	Transparency = 0;
}
local tbl_upvr = {}
local function _(arg1, arg2, arg3) -- Line 80, Named "Lerp"
	return arg1 + (arg2 - arg1) * arg3
end
local function deepCopy_upvr(arg1) -- Line 84, Named "deepCopy"
	--[[ Upvalues[1]:
		[1]: deepCopy_upvr (readonly)
	]]
	local module = {}
	for i, v in pairs(arg1) do
		if type(v) == "table" then
			v = deepCopy_upvr(v)
		end
		module[i] = v
	end
	return module
end
local tbl_2_upvr = {
	Enabled = true;
	ActiveRays = 0;
	ActiveInstances = 0;
	Styles = {
		Color = "Color3";
		Transparency = "Transparency";
		AlwaysOnTop = "AlwaysOnTop";
	};
	AOTWireframeHandle = WireframeHandleAdornment_upvw;
	WireframeHandle = WireframeHandleAdornment_upvw_2;
	GetPoolSize = function() -- Line 498, Named "GetPoolSize"
		--[[ Upvalues[1]:
			[1]: tbl_upvr (readonly)
		]]
		local var34 = 0
		for _, v_2 in tbl_upvr do
			var34 += #v_2
		end
		return var34
	end;
	PushProperty = function(arg1, arg2) -- Line 513, Named "PushProperty"
		--[[ Upvalues[3]:
			[1]: tbl_6_upvr (readonly)
			[2]: WireframeHandleAdornment_upvw (read and write)
			[3]: WireframeHandleAdornment_upvw_2 (read and write)
		]]
		tbl_6_upvr[arg1] = arg2
		if arg1 == "AlwaysOnTop" then
		else
			pcall(function() -- Line 520
				--[[ Upvalues[4]:
					[1]: WireframeHandleAdornment_upvw (copied, read and write)
					[2]: arg1 (readonly)
					[3]: arg2 (readonly)
					[4]: WireframeHandleAdornment_upvw_2 (copied, read and write)
				]]
				WireframeHandleAdornment_upvw[arg1] = arg2
				WireframeHandleAdornment_upvw_2[arg1] = arg2
			end)
		end
	end;
	PopProperty = function(arg1) -- Line 531, Named "PopProperty"
		--[[ Upvalues[2]:
			[1]: tbl_6_upvr (readonly)
			[2]: WireframeHandleAdornment_upvw (read and write)
		]]
		if tbl_6_upvr[arg1] then
			return tbl_6_upvr[arg1]
		end
		return WireframeHandleAdornment_upvw[arg1]
	end;
}
function tbl_2_upvr.SetStyle(arg1, arg2, arg3) -- Line 545
	--[[ Upvalues[1]:
		[1]: tbl_2_upvr (readonly)
	]]
	if arg1 ~= nil and typeof(arg1) == "Color3" then
		tbl_2_upvr.PushProperty("Color3", arg1)
	end
	if arg2 ~= nil and typeof(arg2) == "number" then
		tbl_2_upvr.PushProperty("Transparency", arg2)
	end
	if arg3 ~= nil and typeof(arg3) == "boolean" then
		tbl_2_upvr.PushProperty("AlwaysOnTop", arg3)
	end
end
function tbl_2_upvr.DoCleaning() -- Line 561
	--[[ Upvalues[5]:
		[1]: WireframeHandleAdornment_upvw (read and write)
		[2]: WireframeHandleAdornment_upvw_2 (read and write)
		[3]: tbl_upvw (read and write)
		[4]: tbl_upvr (readonly)
		[5]: tbl_2_upvr (readonly)
	]]
	WireframeHandleAdornment_upvw:Clear()
	WireframeHandleAdornment_upvw_2:Clear()
	for _, v_3 in tbl_upvw do
		local ClassName = v_3.ClassName
		if not tbl_upvr[ClassName] then
			tbl_upvr[ClassName] = {}
		end
		v_3:Remove()
		table.insert(tbl_upvr[ClassName], v_3)
	end
	tbl_upvw = {}
	tbl_2_upvr.ActiveRays = 0
	tbl_2_upvr.ActiveInstances = 0
end
local var39_upvw = false
function tbl_2_upvr.ScheduleCleaning() -- Line 577
	--[[ Upvalues[2]:
		[1]: var39_upvw (read and write)
		[2]: tbl_2_upvr (readonly)
	]]
	if var39_upvw then
	else
		var39_upvw = true
		task.delay(0, function() -- Line 584
			--[[ Upvalues[2]:
				[1]: tbl_2_upvr (copied, readonly)
				[2]: var39_upvw (copied, read and write)
			]]
			tbl_2_upvr.DoCleaning()
			var39_upvw = false
		end)
	end
end
function tbl_2_upvr.AddDebrisInSeconds(arg1, arg2) -- Line 596
	--[[ Upvalues[1]:
		[1]: tbl_7_upvr (readonly)
	]]
	local tbl_8 = {"Seconds"}
	tbl_8[2] = arg1
	tbl_8[3] = os.clock()
	tbl_8[4] = arg2
	table.insert(tbl_7_upvr, tbl_8)
end
function tbl_2_upvr.AddDebrisInFrames(arg1, arg2) -- Line 605
	--[[ Upvalues[1]:
		[1]: tbl_7_upvr (readonly)
	]]
	local tbl_3 = {"Frames"}
	tbl_3[2] = arg1
	tbl_3[3] = 0
	tbl_3[4] = arg2
	table.insert(tbl_7_upvr, tbl_3)
end
function tbl_2_upvr.TweenProperties(arg1, arg2, arg3) -- Line 616
	--[[ Upvalues[2]:
		[1]: deepCopy_upvr (readonly)
		[2]: tbl_4_upvr (readonly)
	]]
	local tbl_9_upvr = {}
	tbl_9_upvr.p_Properties = arg1
	tbl_9_upvr.Properties = deepCopy_upvr(arg1)
	tbl_9_upvr.Goal = arg2
	tbl_9_upvr.TweenInfo = arg3
	tbl_9_upvr.Time = 0
	tbl_4_upvr[tbl_9_upvr] = true
	return function() -- Line 630
		--[[ Upvalues[2]:
			[1]: tbl_4_upvr (copied, readonly)
			[2]: tbl_9_upvr (readonly)
		]]
		tbl_4_upvr[tbl_9_upvr] = nil
	end
end
local RunService_upvr = game:GetService("RunService")
local TweenService_upvr = game:GetService("TweenService")
function tbl_2_upvr.Init() -- Line 637
	--[[ Upvalues[10]:
		[1]: RunService_upvr (readonly)
		[2]: tbl_2_upvr (readonly)
		[3]: Terrain_upvr (readonly)
		[4]: WireframeHandleAdornment_upvw (read and write)
		[5]: Terrain_upvr_2 (readonly)
		[6]: WireframeHandleAdornment_upvw_2 (read and write)
		[7]: tbl_4_upvr (readonly)
		[8]: TweenService_upvr (readonly)
		[9]: tbl_7_upvr (readonly)
		[10]: tbl_5_upvr (readonly)
	]]
	RunService_upvr.RenderStepped:Connect(function(arg1) -- Line 638
		--[[ Upvalues[9]:
			[1]: tbl_2_upvr (copied, readonly)
			[2]: Terrain_upvr (copied, readonly)
			[3]: WireframeHandleAdornment_upvw (copied, read and write)
			[4]: Terrain_upvr_2 (copied, readonly)
			[5]: WireframeHandleAdornment_upvw_2 (copied, read and write)
			[6]: tbl_4_upvr (copied, readonly)
			[7]: TweenService_upvr (copied, readonly)
			[8]: tbl_7_upvr (copied, readonly)
			[9]: tbl_5_upvr (copied, readonly)
		]]
		if tbl_2_upvr.Enabled then
			if not Terrain_upvr:FindFirstChild("AOTGizmoAdornment") then
				WireframeHandleAdornment_upvw = Instance.new("WireframeHandleAdornment")
				WireframeHandleAdornment_upvw.Adornee = Terrain_upvr_2
				WireframeHandleAdornment_upvw.ZIndex = 1
				WireframeHandleAdornment_upvw.AlwaysOnTop = true
				WireframeHandleAdornment_upvw.Name = "AOTGizmoAdornment"
				WireframeHandleAdornment_upvw.Parent = Terrain_upvr
				tbl_2_upvr.AOTWireframeHandle = WireframeHandleAdornment_upvw
			end
			if not Terrain_upvr:FindFirstChild("GizmoAdornment") then
				WireframeHandleAdornment_upvw_2 = Instance.new("WireframeHandleAdornment")
				WireframeHandleAdornment_upvw_2.Adornee = Terrain_upvr_2
				WireframeHandleAdornment_upvw_2.ZIndex = 1
				WireframeHandleAdornment_upvw_2.AlwaysOnTop = false
				WireframeHandleAdornment_upvw_2.Name = "GizmoAdornment"
				WireframeHandleAdornment_upvw_2.Parent = Terrain_upvr
				tbl_2_upvr.WireframeHandle = WireframeHandleAdornment_upvw_2
			end
		end
		for i_4 in tbl_4_upvr do
			i_4.Time += arg1
			local var58 = i_4.Time / i_4.TweenInfo.Time
			if 1 < var58 then
				var58 = 1
			end
			local function _(arg1_2, arg2, arg3) -- Line 672, Named "LerpProperty"
				if type(arg1_2) == "number" then
					return arg1_2 + (arg2 - arg1_2) * arg3
				end
				return arg1_2:Lerp(arg2, arg3)
			end
			for i_5, v_4 in i_4.Properties do
				local var59
				if i_4.Goal[i_5] then
					if type(v_4) == "number" then
						var59 = v_4 + (i_4.Goal[i_5] - v_4) * TweenService_upvr:GetValue(var58, i_4.TweenInfo.EasingStyle, i_4.TweenInfo.EasingDirection)
					else
						-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
						var59 = v_4:Lerp(i_4.Goal[i_5], TweenService_upvr:GetValue(var58, i_4.TweenInfo.EasingStyle, i_4.TweenInfo.EasingDirection))
					end
					i_4.p_Properties[i_5] = var59
				end
			end
			if var58 == 1 then
				tbl_4_upvr[i_4] = nil
			end
		end
		for i_6 = #tbl_7_upvr, 1, -1 do
			local var60 = tbl_7_upvr[i_6]
			var58 = var60[2]
			if var60[1] == "Seconds" then
				if var58 < os.clock() - var60[3] then
					i_5 = i_6
					table.remove(tbl_7_upvr, i_5)
				else
					var60[4]()
				end
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if var58 < var60[3] then
					i_5 = i_6
					table.remove(tbl_7_upvr, i_5)
				else
					var60[2] += 1
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					var60[4]()
				end
			end
		end
		for i_7 = #tbl_5_upvr, 1, -1 do
			local _2 = tbl_5_upvr[i_7][2]
			var58 = _2.Enabled
			if var58 then
				var58 = _2.Destroy
				if var58 then
					var58 = table.remove
					var58(tbl_5_upvr, i_7)
				end
				var58 = tbl_5_upvr[i_7][1]:Update
				var58(_2)
			end
		end
	end)
end
function tbl_2_upvr.SetEnabled(arg1) -- Line 744
	--[[ Upvalues[1]:
		[1]: tbl_2_upvr (readonly)
	]]
	tbl_2_upvr.Enabled = arg1
	if arg1 == false then
		tbl_2_upvr.DoCleaning()
	end
end
function tbl_2_upvr.RemoveAdornments() -- Line 755
	--[[ Upvalues[1]:
		[1]: Terrain_upvr (readonly)
	]]
	if Terrain_upvr:FindFirstChild("AOTGizmoAdornment") then
		Terrain_upvr:FindFirstChild("AOTGizmoAdornment"):Destroy()
	end
	if Terrain_upvr:FindFirstChild("GizmoAdornment") then
		Terrain_upvr:FindFirstChild("GizmoAdornment"):Destroy()
	end
end
for _, v_5 in script:WaitForChild("Gizmos"):GetChildren() do
	tbl_2_upvr[v_5.Name] = require(v_5).Init(tbl_2_upvr, tbl_6_upvr, function(arg1) -- Line 66, Named "Request"
		--[[ Upvalues[1]:
			[1]: tbl_upvr (readonly)
		]]
		if not tbl_upvr[arg1] then
			return Instance.new(arg1)
		end
		local popped = table.remove(tbl_upvr[arg1])
		if not popped then
			return Instance.new(arg1)
		end
		return popped
	end, function(arg1) -- Line 55, Named "Release"
		--[[ Upvalues[1]:
			[1]: tbl_upvr (readonly)
		]]
		local ClassName_2 = arg1.ClassName
		if not tbl_upvr[ClassName_2] then
			tbl_upvr[ClassName_2] = {}
		end
		arg1:Remove()
		table.insert(tbl_upvr[ClassName_2], arg1)
	end, function(arg1, arg2) -- Line 46, Named "Retain"
		--[[ Upvalues[1]:
			[1]: tbl_5_upvr (readonly)
		]]
		local tbl = {}
		tbl[1] = arg1
		tbl[2] = arg2
		table.insert(tbl_5_upvr, tbl)
	end, function(arg1) -- Line 50, Named "Register"
		--[[ Upvalues[2]:
			[1]: Terrain_upvr (readonly)
			[2]: tbl_upvw (read and write)
		]]
		arg1.Parent = Terrain_upvr
		table.insert(tbl_upvw, arg1)
	end)
	local var66
end
return var66