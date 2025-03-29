--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.Invisicam
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:45
-- Luau version 6, Types version 3
-- Time taken: 0.013999 seconds

local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserRaycastUpdateAPI")
local tbl_3_upvr = {
	LIMBS = 2;
	MOVEMENT = 3;
	CORNERS = 4;
	CIRCLE1 = 5;
	CIRCLE2 = 6;
	LIMBMOVE = 7;
	SMART_CIRCLE = 8;
	CHAR_OUTLINE = 9;
}
local tbl_5_upvr = {
	Head = true;
	["Left Arm"] = true;
	["Right Arm"] = true;
	["Left Leg"] = true;
	["Right Leg"] = true;
	LeftLowerArm = true;
	RightLowerArm = true;
	LeftUpperLeg = true;
	RightUpperLeg = true;
}
local tbl_4_upvr = {Vector3.new(1, 1, -1), Vector3.new(1, -1, -1), Vector3.new(-1, -1, -1), Vector3.new(-1, 1, -1)}
local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
local RaycastParams_new_result1_upvr_2 = RaycastParams.new()
RaycastParams_new_result1_upvr_2.FilterType = Enum.RaycastFilterType.Include
local function AssertTypes_upvr(arg1, ...) -- Line 71, Named "AssertTypes"
	local tbl_6 = {}
	local var16
	for _, v in pairs({...}) do
		tbl_6[v] = true
		local var17
		if var16 == "" then
			var17 = ""
		else
			var17 = " or "
		end
		var16 = var16..var17..v
	end
	local type_result1 = type(arg1)
	assert(tbl_6[type_result1], var16.." type expected, got: "..type_result1)
end
local function _(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) -- Line 83, Named "Det3x3"
	return arg1 * (arg5 * arg9 - arg6 * arg8) - arg2 * (arg4 * arg9 - arg6 * arg7) + arg3 * (arg4 * arg8 - arg5 * arg7)
end
local function RayIntersection_upvr(arg1, arg2, arg3, arg4) -- Line 91, Named "RayIntersection"
	local any_Cross_result1 = arg2:Cross(arg4)
	local var20 = arg3.X - arg1.X
	local var21 = arg3.Y - arg1.Y
	local var22 = arg3.Z - arg1.Z
	local Y = arg2.Y
	local var24 = -arg4.Y
	local Y_2 = any_Cross_result1.Y
	local Z = arg2.Z
	local var27 = -arg4.Z
	local Z_5 = any_Cross_result1.Z
	local var29 = arg2.X * (var24 * Z_5 - Y_2 * var27) - -arg4.X * (Y * Z_5 - Y_2 * Z) + any_Cross_result1.X * (Y * var27 - var24 * Z)
	if var29 == 0 then
		return Vector3.new(0, 0, 0)
	end
	local var30 = -arg4.Y
	local Y_5 = any_Cross_result1.Y
	local var32 = -arg4.Z
	local Z_2 = any_Cross_result1.Z
	local Y_4 = arg2.Y
	local Y_3 = any_Cross_result1.Y
	local Z_4 = arg2.Z
	local Z_3 = any_Cross_result1.Z
	local var38 = arg1 + (var20 * (var30 * Z_2 - Y_5 * var32) - -arg4.X * (var21 * Z_2 - Y_5 * var22) + any_Cross_result1.X * (var21 * var32 - var30 * var22)) / var29 * arg2
	local var39 = arg3 + (arg2.X * (var21 * Z_3 - Y_3 * var22) - var20 * (Y_4 * Z_3 - Y_3 * Z_4) + any_Cross_result1.X * (Y_4 * var22 - var21 * Z_4)) / var29 * arg4
	if (var39 - var38).Magnitude < 0.25 then
		return var38 + 0.5 * (var39 - var38)
	end
	return Vector3.new(0, 0, 0)
end
local module_upvr = require(script.Parent:WaitForChild("BaseOcclusion"))
local setmetatable_result1_upvr = setmetatable({}, module_upvr)
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
function setmetatable_result1_upvr.new() -- Line 124
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: tbl_3_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_upvr)
	setmetatable_result1.char = nil
	setmetatable_result1.humanoidRootPart = nil
	setmetatable_result1.torsoPart = nil
	setmetatable_result1.headPart = nil
	setmetatable_result1.childAddedConn = nil
	setmetatable_result1.childRemovedConn = nil
	setmetatable_result1.behaviors = {}
	setmetatable_result1.behaviors[tbl_3_upvr.LIMBS] = setmetatable_result1.LimbBehavior
	setmetatable_result1.behaviors[tbl_3_upvr.MOVEMENT] = setmetatable_result1.MoveBehavior
	setmetatable_result1.behaviors[tbl_3_upvr.CORNERS] = setmetatable_result1.CornerBehavior
	setmetatable_result1.behaviors[tbl_3_upvr.CIRCLE1] = setmetatable_result1.CircleBehavior
	setmetatable_result1.behaviors[tbl_3_upvr.CIRCLE2] = setmetatable_result1.CircleBehavior
	setmetatable_result1.behaviors[tbl_3_upvr.LIMBMOVE] = setmetatable_result1.LimbMoveBehavior
	setmetatable_result1.behaviors[tbl_3_upvr.SMART_CIRCLE] = setmetatable_result1.SmartCircleBehavior
	setmetatable_result1.behaviors[tbl_3_upvr.CHAR_OUTLINE] = setmetatable_result1.CharacterOutlineBehavior
	setmetatable_result1.mode = tbl_3_upvr.SMART_CIRCLE
	setmetatable_result1.behaviorFunction = setmetatable_result1.SmartCircleBehavior
	setmetatable_result1.savedHits = {}
	setmetatable_result1.trackedLimbs = {}
	setmetatable_result1.camera = game.Workspace.CurrentCamera
	setmetatable_result1.enabled = false
	return setmetatable_result1
end
function setmetatable_result1_upvr.Enable(arg1, arg2) -- Line 157
	arg1.enabled = arg2
	if not arg2 then
		arg1:Cleanup()
	end
end
function setmetatable_result1_upvr.GetOcclusionMode(arg1) -- Line 165
	return Enum.DevCameraOcclusionMode.Invisicam
end
function setmetatable_result1_upvr.LimbBehavior(arg1, arg2) -- Line 170
	for i_2, _ in pairs(arg1.trackedLimbs) do
		arg2[#arg2 + 1] = i_2.Position
	end
end
function setmetatable_result1_upvr.MoveBehavior(arg1, arg2) -- Line 176
	for i_3 = 1, 3 do
		local Velocity = arg1.humanoidRootPart.Velocity
		arg2[#arg2 + 1] = arg1.humanoidRootPart.Position + ((i_3 - 1) * arg1.humanoidRootPart.CFrame.lookVector) * (Vector3.new(Velocity.X, 0, Velocity.Z).Magnitude / 2)
	end
end
function setmetatable_result1_upvr.CornerBehavior(arg1, arg2) -- Line 185
	--[[ Upvalues[1]:
		[1]: tbl_4_upvr (readonly)
	]]
	local CFrame = arg1.humanoidRootPart.CFrame
	local Position = CFrame.Position
	local var54 = CFrame - Position
	local var55 = arg1.char:GetExtentsSize() / 2
	arg2[#arg2 + 1] = Position
	for i_4 = 1, #tbl_4_upvr do
		arg2[#arg2 + 1] = Position + (var54) * (var55 * tbl_4_upvr[i_4])
	end
end
function setmetatable_result1_upvr.CircleBehavior(arg1, arg2) -- Line 196
	--[[ Upvalues[1]:
		[1]: tbl_3_upvr (readonly)
	]]
	local var58
	if arg1.mode == tbl_3_upvr.CIRCLE1 then
		var58 = arg1.humanoidRootPart.CFrame
	else
		local CoordinateFrame = arg1.camera.CoordinateFrame
		var58 = CoordinateFrame - CoordinateFrame.Position + arg1.humanoidRootPart.Position
	end
	arg2[#arg2 + 1] = var58.Position
	for i_5 = 0, 9 do
		local var60 = 0.6283185307179586 * i_5
		arg2[#arg2 + 1] = (var58) * (3 * Vector3.new(math.cos(var60), math.sin(var60), 0))
	end
end
function setmetatable_result1_upvr.LimbMoveBehavior(arg1, arg2) -- Line 212
	arg1:LimbBehavior(arg2)
	arg1:MoveBehavior(arg2)
end
function setmetatable_result1_upvr.CharacterOutlineBehavior(arg1, arg2) -- Line 217
	--[[ Upvalues[2]:
		[1]: any_getUserFlag_result1_upvr (readonly)
		[2]: RaycastParams_new_result1_upvr_2 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 25 start (CF ANALYSIS FAILED)
	local unit_2 = arg1.torsoPart.CFrame.upVector.unit
	local unit = arg1.torsoPart.CFrame.rightVector.unit
	arg2[#arg2 + 1] = arg1.torsoPart.CFrame.p
	arg2[#arg2 + 1] = arg1.torsoPart.CFrame.p + unit_2
	arg2[#arg2 + 1] = arg1.torsoPart.CFrame.p - unit_2
	arg2[#arg2 + 1] = arg1.torsoPart.CFrame.p + unit
	arg2[#arg2 + 1] = arg1.torsoPart.CFrame.p - unit
	local var63
	if arg1.headPart then
		var63 = #arg2
		var63 = arg1.headPart.CFrame.p
		arg2[var63 + 1] = var63
	end
	var63 = Vector3.new(0, 0, 0)
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var63 = arg1.torsoPart.Position
		return var63
	end
	if not arg1.torsoPart or not INLINED() then
		var63 = arg1.humanoidRootPart.Position
	end
	local tbl = {arg1.torsoPart}
	if arg1.headPart then
		tbl[#tbl + 1] = arg1.headPart
	end
	local _ = 1
	-- KONSTANTERROR: [0] 1. Error Block 25 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [225] 159. Error Block 16 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [225] 159. Error Block 16 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [132] 86. Error Block 27 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if arg1.camera then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if arg1.camera then
			-- KONSTANTWARNING: GOTO [225] #159
		end
	else
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [225.13]
		if nil then
		end
	end
	-- KONSTANTERROR: [132] 86. Error Block 27 end (CF ANALYSIS FAILED)
end
function setmetatable_result1_upvr.SmartCircleBehavior(arg1, arg2) -- Line 268
	--[[ Upvalues[3]:
		[1]: any_getUserFlag_result1_upvr (readonly)
		[2]: RaycastParams_new_result1_upvr (readonly)
		[3]: RayIntersection_upvr (readonly)
	]]
	local unit_6 = arg1.torsoPart.CFrame.upVector.unit
	local unit_3 = arg1.torsoPart.CFrame.rightVector.unit
	arg2[#arg2 + 1] = arg1.torsoPart.CFrame.p
	arg2[#arg2 + 1] = arg1.torsoPart.CFrame.p + unit_6
	arg2[#arg2 + 1] = arg1.torsoPart.CFrame.p - unit_6
	arg2[#arg2 + 1] = arg1.torsoPart.CFrame.p + unit_3
	arg2[#arg2 + 1] = arg1.torsoPart.CFrame.p - unit_3
	local var70
	if arg1.headPart then
		var70 = arg1.headPart
		arg2[#arg2 + 1] = var70.CFrame.p
	end
	var70 = arg1.camera.CFrame
	local function INLINED_2() -- Internal function, doesn't exist in bytecode
		var70 = arg1.torsoPart.Position
		return var70
	end
	if not arg1.torsoPart or not INLINED_2() then
		var70 = arg1.humanoidRootPart.Position
	end
	local var71 = Vector3.new(0, 0.5, 0) + var70
	var70 = 1
	for i_6 = 1, 24, var70 do
		local var72 = 0.2617993877991494 * i_6 - (math.pi/2)
		local var73 = var71 + (arg1.camera.CFrame - var70.p) * (2.5 * Vector3.new(math.cos(var72), math.sin(var72), 0))
		local var74 = var73 - arg1.camera.CFrame.p
		local var75
		if any_getUserFlag_result1_upvr then
			RaycastParams_new_result1_upvr.FilterDescendantsInstances = {arg1.char}
			var75 = RaycastParams_new_result1_upvr
			local any_Raycast_result1_2 = game.Workspace:Raycast(var71, var73 - var71, var75)
			local var78 = var73
			if any_Raycast_result1_2 then
				local Normal = any_Raycast_result1_2.Normal
				var75 = any_Raycast_result1_2.Position + 0.1 * Normal.unit
				local var80 = var75 - var71
				local unit_5 = var80:Cross(var74).unit:Cross(Normal).unit
				if var80.unit:Dot(-unit_5) < var80.unit:Dot((var75 - arg1.camera.CFrame.p).unit) then
					var78 = RayIntersection_upvr(var75, unit_5, var73, var74)
					if 0 < var78.Magnitude then
						local any_Raycast_result1 = game.Workspace:Raycast(var75, var78 - var75, RaycastParams_new_result1_upvr)
						if any_Raycast_result1 then
							var78 = any_Raycast_result1.Position + 0.1 * any_Raycast_result1.Normal.Unit
							-- KONSTANTWARNING: GOTO [241] #168
						end
					else
						var78 = var75
					end
				else
					var78 = var75
				end
				local any_Raycast_result1_3 = game.Workspace:Raycast(var71, var78 - var71, RaycastParams_new_result1_upvr)
				if any_Raycast_result1_3 then
					var78 = any_Raycast_result1_3.Position - 0.1 * (var78 - var71).unit
				end
			end
			arg2[#arg2 + 1] = var78
		else
			({})[1] = arg1.char
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local any_FindPartOnRayWithIgnoreList_result1_2, any_FindPartOnRayWithIgnoreList_result2_2, any_FindPartOnRayWithIgnoreList_result3 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(var71, var73 - var71), {}, false, false)
			if any_FindPartOnRayWithIgnoreList_result1_2 then
				local var87 = any_FindPartOnRayWithIgnoreList_result2_2 + 0.1 * any_FindPartOnRayWithIgnoreList_result3.unit
				local var88 = var87 - var71
				local unit_4 = var88:Cross(var74).unit:Cross(any_FindPartOnRayWithIgnoreList_result3).unit
				if var88.unit:Dot(-unit_4) < var88.unit:Dot((var87 - arg1.camera.CFrame.p).unit) then
					if 0 < RayIntersection_upvr(var87, unit_4, var73, var74).Magnitude then
						-- KONSTANTERROR: Expression was reused, decompilation is incorrect
						local any_FindPartOnRayWithIgnoreList_result1_3, _, _ = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(var87, RayIntersection_upvr(var87, unit_4, var73, var74) - var87), {arg1.char}, false, false)
						if any_FindPartOnRayWithIgnoreList_result1_3 then
							-- KONSTANTWARNING: GOTO [374] #265
						end
					else
					end
				else
				end
				local any_FindPartOnRayWithIgnoreList_result1, any_FindPartOnRayWithIgnoreList_result2, _ = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(var71, var87 - var71), {arg1.char}, false, false)
				if any_FindPartOnRayWithIgnoreList_result1 then
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				end
			end
			arg2[#arg2 + 1] = any_FindPartOnRayWithIgnoreList_result2 - 0.1 * (var87 - var71).unit
		end
	end
end
function setmetatable_result1_upvr.CheckTorsoReference(arg1) -- Line 403
	if arg1.char then
		arg1.torsoPart = arg1.char:FindFirstChild("Torso")
		if not arg1.torsoPart then
			arg1.torsoPart = arg1.char:FindFirstChild("UpperTorso")
			if not arg1.torsoPart then
				arg1.torsoPart = arg1.char:FindFirstChild("HumanoidRootPart")
			end
		end
		arg1.headPart = arg1.char:FindFirstChild("Head")
	end
end
local Players_upvr = game:GetService("Players")
function setmetatable_result1_upvr.CharacterAdded(arg1, arg2, arg3) -- Line 417
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
	]]
	if arg3 ~= Players_upvr.LocalPlayer then
	else
		if arg1.childAddedConn then
			arg1.childAddedConn:Disconnect()
			arg1.childAddedConn = nil
		end
		if arg1.childRemovedConn then
			arg1.childRemovedConn:Disconnect()
			arg1.childRemovedConn = nil
		end
		arg1.char = arg2
		arg1.trackedLimbs = {}
		arg1.childAddedConn = arg2.ChildAdded:Connect(function(arg1_2) -- Line 433, Named "childAdded"
			--[[ Upvalues[2]:
				[1]: tbl_5_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			if arg1_2:IsA("BasePart") then
				if tbl_5_upvr[arg1_2.Name] then
					arg1.trackedLimbs[arg1_2] = true
				end
				if arg1_2.Name == "Torso" or arg1_2.Name == "UpperTorso" then
					arg1.torsoPart = arg1_2
				end
				if arg1_2.Name == "Head" then
					arg1.headPart = arg1_2
				end
			end
		end)
		arg1.childRemovedConn = arg2.ChildRemoved:Connect(function(arg1_3) -- Line 449, Named "childRemoved"
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1.trackedLimbs[arg1_3] = nil
			arg1:CheckTorsoReference()
		end)
		for _, v_5 in pairs(arg1.char:GetChildren()) do
			if v_5:IsA("BasePart") then
				if tbl_5_upvr[v_5.Name] then
					arg1.trackedLimbs[v_5] = true
				end
				if v_5.Name == "Torso" or v_5.Name == "UpperTorso" then
					arg1.torsoPart = v_5
				end
				if v_5.Name == "Head" then
					arg1.headPart = v_5
				end
			end
		end
	end
end
function setmetatable_result1_upvr.SetMode(arg1, arg2) -- Line 463
	--[[ Upvalues[2]:
		[1]: AssertTypes_upvr (readonly)
		[2]: tbl_3_upvr (readonly)
	]]
	AssertTypes_upvr(arg2, "number")
	for _, v_3 in pairs(tbl_3_upvr) do
		if v_3 == arg2 then
			arg1.mode = arg2
			arg1.behaviorFunction = arg1.behaviors[arg1.mode]
			return
		end
	end
	error("Invalid mode number")
end
function setmetatable_result1_upvr.GetObscuredParts(arg1) -- Line 475
	return arg1.savedHits
end
function setmetatable_result1_upvr.Cleanup(arg1) -- Line 480
	for i_8, v_4 in pairs(arg1.savedHits) do
		i_8.LocalTransparencyModifier = v_4
	end
end
function setmetatable_result1_upvr.Update(arg1, arg2, arg3, arg4) -- Line 486
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 100 start (CF ANALYSIS FAILED)
	local var128
	if not arg1.enabled or not arg1.char then
		return arg3, arg4
	end
	arg1.camera = game.Workspace.CurrentCamera
	if not arg1.humanoidRootPart then
		local class_Humanoid_2 = arg1.char:FindFirstChildOfClass("Humanoid")
		if class_Humanoid_2 and class_Humanoid_2.RootPart then
			arg1.humanoidRootPart = class_Humanoid_2.RootPart
		else
			arg1.humanoidRootPart = arg1.char:FindFirstChild("HumanoidRootPart")
			if not arg1.humanoidRootPart then
				return arg3, arg4
			end
		end
		local var131_upvw
		var131_upvw = arg1.humanoidRootPart.AncestryChanged:Connect(function(arg1_6, arg2_3) -- Line 511
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: var131_upvw (read and write)
			]]
			if arg1_6 == arg1.humanoidRootPart and not arg2_3 then
				arg1.humanoidRootPart = nil
				if var131_upvw then
					if var131_upvw.Connected then
						var131_upvw:Disconnect()
						var131_upvw = nil
					end
				end
			end
		end)
	end
	if not arg1.torsoPart then
		arg1:CheckTorsoReference()
		if not arg1.torsoPart then
			return arg3, arg4
		end
	end
	local tbl_10 = {}
	arg1.behaviorFunction(arg1, tbl_10)
	local tbl_2_upvr = {}
	local function _(arg1_7) -- Line 537, Named "add"
		--[[ Upvalues[2]:
			[1]: tbl_2_upvr (readonly)
			[2]: arg1 (readonly)
		]]
		tbl_2_upvr[arg1_7] = true
		if not arg1.savedHits[arg1_7] then
			arg1.savedHits[arg1_7] = arg1_7.LocalTransparencyModifier
		end
	end
	local function INLINED_4() -- Internal function, doesn't exist in bytecode
		var128 = arg1.headPart.CFrame.p
		return var128
	end
	if not arg1.headPart or not INLINED_4() then
		var128 = tbl_10[1]
	end
	if not arg1.torsoPart or not arg1.torsoPart.CFrame.p then
	end
	-- KONSTANTERROR: [0] 1. Error Block 100 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [131] 91. Error Block 25 start (CF ANALYSIS FAILED)
	local var138 = arg1.camera:GetPartsObscuringTarget({var128, tbl_10[2]}, {arg1.char})[1]
	;({})[var138] = true
	local _, _, _ = pairs(var138:GetChildren())
	-- KONSTANTERROR: [131] 91. Error Block 25 end (CF ANALYSIS FAILED)
end
return setmetatable_result1_upvr