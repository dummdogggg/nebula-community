--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRVehicleCamera
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:10
-- Luau version 6, Types version 3
-- Time taken: 0.013224 seconds

local pcall_result1, pcall_result2 = pcall(function() -- Line 9
	return UserSettings():IsUserFeatureEnabled("UserVRVehicleCamera2")
end)
local var4_upvw = pcall_result1 and pcall_result2
local tbl_upvr = {0, 30}
local module_upvr_5 = require(script.Parent:WaitForChild("VRBaseCamera"))
local module_upvr_3 = require(script.Parent:WaitForChild("CameraUtils"))
local module_upvr_2 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraConfig"))
local VRService_upvr = game:GetService("VRService")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local mapClamp_upvr = module_upvr_3.mapClamp
local function _(arg1, arg2) -- Line 46, Named "pitchVelocity"
	return math.abs(arg2.XVector:Dot(arg1))
end
local function _(arg1, arg2) -- Line 51, Named "yawVelocity"
	return math.abs(arg2.YVector:Dot(arg1))
end
local var12_upvw = (1/60)
local setmetatable_result1_upvr = setmetatable({}, module_upvr_5)
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
local RunService_upvr = game:GetService("RunService")
function setmetatable_result1_upvr.new() -- Line 59
	--[[ Upvalues[4]:
		[1]: module_upvr_5 (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: RunService_upvr (readonly)
		[4]: var12_upvw (read and write)
	]]
	local setmetatable_result1 = setmetatable(module_upvr_5.new(), setmetatable_result1_upvr)
	setmetatable_result1:Reset()
	RunService_upvr.Stepped:Connect(function(arg1, arg2) -- Line 64
		--[[ Upvalues[1]:
			[1]: var12_upvw (copied, read and write)
		]]
		var12_upvw = arg2
	end)
	return setmetatable_result1
end
local module_upvr = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraCore"))
local Spring_upvr = module_upvr_3.Spring
function setmetatable_result1_upvr.Reset(arg1) -- Line 72
	--[[ Upvalues[6]:
		[1]: module_upvr (readonly)
		[2]: var4_upvw (read and write)
		[3]: Spring_upvr (readonly)
		[4]: module_upvr_2 (readonly)
		[5]: module_upvr_3 (readonly)
		[6]: tbl_upvr (readonly)
	]]
	arg1.vehicleCameraCore = module_upvr.new(arg1:GetSubjectCFrame())
	if var4_upvw then
		arg1.pitchSpring = Spring_upvr.new(0, 0)
	else
		arg1.pitchSpring = Spring_upvr.new(0, -math.rad(module_upvr_2.pitchBaseAngle))
	end
	arg1.yawSpring = Spring_upvr.new(0, 0)
	if var4_upvw then
		arg1.lastPanTick = 0
		arg1.currentDriftAngle = 0
		arg1.needsReset = true
	end
	local CurrentCamera = workspace.CurrentCamera
	local var24 = CurrentCamera
	if var24 then
		var24 = CurrentCamera.CameraSubject
	end
	assert(CurrentCamera, "VRVehicleCamera initialization error")
	assert(var24)
	assert(var24:IsA("VehicleSeat"))
	local any_getLooseBoundingSphere_result1, any_getLooseBoundingSphere_result2 = module_upvr_3.getLooseBoundingSphere(var24:GetConnectedParts(true))
	arg1.assemblyRadius = math.max(any_getLooseBoundingSphere_result2, 5)
	arg1.assemblyOffset = var24.CFrame:Inverse() * any_getLooseBoundingSphere_result1
	arg1.gamepadZoomLevels = {}
	for _, v in tbl_upvr do
		table.insert(arg1.gamepadZoomLevels, v * arg1.headScale * arg1.assemblyRadius / 10)
	end
	arg1.lastCameraFocus = nil
	arg1:SetCameraToSubjectDistance(arg1.gamepadZoomLevels[#arg1.gamepadZoomLevels])
end
local sanitizeAngle_upvr = module_upvr_3.sanitizeAngle
local module_upvr_4 = require(script.Parent:WaitForChild("CameraInput"))
function setmetatable_result1_upvr._StepRotation(arg1, arg2, arg3) -- Line 112
	--[[ Upvalues[4]:
		[1]: sanitizeAngle_upvr (readonly)
		[2]: module_upvr_4 (readonly)
		[3]: module_upvr_2 (readonly)
		[4]: mapClamp_upvr (readonly)
	]]
	local yawSpring = arg1.yawSpring
	local pitchSpring = arg1.pitchSpring
	yawSpring.pos = sanitizeAngle_upvr(yawSpring.pos + -arg1:getRotation(arg2))
	pitchSpring.pos = sanitizeAngle_upvr(math.clamp(pitchSpring.pos, -1.3962634015954636, 1.3962634015954636))
	if module_upvr_4.getRotationActivated() then
		arg1.lastPanTick = os.clock()
	end
	if module_upvr_2.autocorrectDelay < os.clock() - arg1.lastPanTick then
		local var11_result1_3 = mapClamp_upvr(arg3, module_upvr_2.autocorrectMinCarSpeed, module_upvr_2.autocorrectMaxCarSpeed, 0, module_upvr_2.autocorrectResponse)
		yawSpring.freq = var11_result1_3
		pitchSpring.freq = var11_result1_3
		if yawSpring.freq < 0.001 then
			yawSpring.vel = 0
		end
		if pitchSpring.freq < 0.001 then
			pitchSpring.vel = 0
		end
		if math.abs(sanitizeAngle_upvr(0 - pitchSpring.pos)) <= math.rad(module_upvr_2.pitchDeadzoneAngle) then
			pitchSpring.goal = pitchSpring.pos
		else
			pitchSpring.goal = 0
		end
	else
		yawSpring.freq = 0
		yawSpring.vel = 0
		pitchSpring.freq = 0
		pitchSpring.vel = 0
		pitchSpring.goal = 0
	end
	return CFrame.fromEulerAnglesYXZ(pitchSpring:step(arg2), yawSpring:step(arg2), 0)
end
function setmetatable_result1_upvr._GetThirdPersonLocalOffset(arg1) -- Line 176
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	return arg1.assemblyOffset + Vector3.new(0, arg1.assemblyRadius * module_upvr_2.verticalCenterOffset, 0)
end
function setmetatable_result1_upvr._GetFirstPersonLocalOffset(arg1, arg2) -- Line 180
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local Character = LocalPlayer_upvr.Character
	if Character and Character.Parent then
		local Head_2 = Character:FindFirstChild("Head")
		if Head_2 and Head_2:IsA("BasePart") then
			return arg2:Inverse() * Head_2.Position
		end
	end
	return arg1:_GetThirdPersonLocalOffset()
end
function setmetatable_result1_upvr.Update(arg1) -- Line 194
	--[[ Upvalues[4]:
		[1]: var4_upvw (read and write)
		[2]: var12_upvw (read and write)
		[3]: LocalPlayer_upvr (readonly)
		[4]: VRService_upvr (readonly)
	]]
	if var4_upvw then
		local var36 = var12_upvw
		var12_upvw = 0
		arg1:UpdateFadeFromBlack(var36)
		arg1:UpdateEdgeBlur(LocalPlayer_upvr, var36)
		if VRService_upvr.ThirdPersonFollowCamEnabled then
			local any_UpdateStepRotation_result1, any_UpdateStepRotation_result2 = arg1:UpdateStepRotation(var36)
			return any_UpdateStepRotation_result1, any_UpdateStepRotation_result2
		end
		local any_UpdateComfortCamera_result1, any_UpdateComfortCamera_result2 = arg1:UpdateComfortCamera(var36)
		return any_UpdateComfortCamera_result1, any_UpdateComfortCamera_result2
	end
	return arg1:UpdateComfortCamera()
end
function setmetatable_result1_upvr.addDrift(arg1, arg2, arg3) -- Line 217
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: VRService_upvr (readonly)
	]]
	local function _(arg1_2) -- Line 218, Named "NormalizeAngle"
		arg1_2 = (arg1_2 + 12.566370614359172) % (-math.pi*2)
		local var41 = arg1_2
		if math.pi < var41 then
			var41 -= (-math.pi*2)
		end
		return var41
	end
	local CurrentCamera_4 = workspace.CurrentCamera
	local var43
	if 0.1 < arg1:GetSubjectVelocity().Magnitude then
		local any_GetUserCFrame_result1_2 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
		local var45 = CurrentCamera_4.CFrame * (any_GetUserCFrame_result1_2.Rotation + any_GetUserCFrame_result1_2.Position * CurrentCamera_4.HeadScale)
		local _, any_ToEulerAnglesYXZ_result2, _ = var45:ToEulerAnglesYXZ()
		local _, any_ToEulerAnglesYXZ_result2_2, _ = arg1:GetSubjectCFrame():ToEulerAnglesYXZ()
		local var52 = (any_ToEulerAnglesYXZ_result2 - arg1.currentDriftAngle + 12.566370614359172) % (-math.pi*2)
		if math.pi < var52 then
			var52 -= (-math.pi*2)
		end
		local var53 = var52
		local var54 = (any_ToEulerAnglesYXZ_result2_2 - arg1.currentDriftAngle + 12.566370614359172) % (-math.pi*2)
		if math.pi < var54 then
			var54 -= (-math.pi*2)
		end
		local var55 = var54
		local minimum = math.min(var55, var53)
		local maximum = math.max(var55, var53)
		local var58 = 0
		if 0 < minimum then
			var58 = minimum
		elseif maximum < 0 then
			var58 = maximum
		end
		arg1.currentDriftAngle = var58 + arg1.currentDriftAngle
		local LookVector = CFrame.fromEulerAnglesYXZ(0, arg1.currentDriftAngle, 0).LookVector
		var43 = var43:Lerp(CFrame.new((CurrentCamera_4.CFrame.Position) + (arg3.Position - Vector3.new(LookVector.X, 0, LookVector.Z).Unit * arg1:GetCameraToSubjectDistance()) - var45.Position) * CurrentCamera_4.CFrame.Rotation, 0.01)
	end
	return var43, arg3
end
function setmetatable_result1_upvr.UpdateRotationCamera(arg1, arg2) -- Line 275
	--[[ Upvalues[2]:
		[1]: mapClamp_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	local CurrentCamera_5 = workspace.CurrentCamera
	local var61 = CurrentCamera_5
	if var61 then
		var61 = CurrentCamera_5.CameraSubject
	end
	local vehicleCameraCore = arg1.vehicleCameraCore
	assert(CurrentCamera_5)
	assert(var61)
	assert(var61:IsA("VehicleSeat"))
	local any_GetSubjectCFrame_result1_2 = arg1:GetSubjectCFrame()
	local any_GetSubjectVelocity_result1 = arg1:GetSubjectVelocity()
	local any_GetSubjectRotVelocity_result1 = arg1:GetSubjectRotVelocity()
	local any_GetCameraToSubjectDistance_result1_3 = arg1:GetCameraToSubjectDistance()
	local var11_result1 = mapClamp_upvr(any_GetCameraToSubjectDistance_result1_3, 0.5, arg1.assemblyRadius, 1, 0)
	vehicleCameraCore:setTransform(any_GetSubjectCFrame_result1_2)
	local var68 = arg1:GetVRFocus(any_GetSubjectCFrame_result1_2 * arg1:_GetThirdPersonLocalOffset():Lerp(arg1:_GetFirstPersonLocalOffset(any_GetSubjectCFrame_result1_2), var11_result1), arg2) * vehicleCameraCore:step(arg2, math.abs(any_GetSubjectCFrame_result1_2.XVector:Dot(any_GetSubjectRotVelocity_result1)), math.abs(any_GetSubjectCFrame_result1_2.YVector:Dot(any_GetSubjectRotVelocity_result1)), var11_result1) * arg1:_StepRotation(arg2, math.abs(any_GetSubjectVelocity_result1:Dot(any_GetSubjectCFrame_result1_2.ZVector)))
	if 0.1 < any_GetSubjectVelocity_result1.Magnitude then
		arg1:StartVREdgeBlur(LocalPlayer_upvr)
	end
	return var68 * CFrame.new(0, 0, any_GetCameraToSubjectDistance_result1_3), var68
end
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
function setmetatable_result1_upvr.UpdateStepRotation(arg1, arg2) -- Line 322
	--[[ Upvalues[4]:
		[1]: mapClamp_upvr (readonly)
		[2]: UserGameSettings_upvr (readonly)
		[3]: VRService_upvr (readonly)
		[4]: LocalPlayer_upvr (readonly)
	]]
	local CurrentCamera_6 = workspace.CurrentCamera
	local any_GetSubjectCFrame_result1_3 = arg1:GetSubjectCFrame()
	local any_GetCameraToSubjectDistance_result1 = arg1:GetCameraToSubjectDistance()
	local any_Lerp_result1_2 = arg1:_GetThirdPersonLocalOffset():Lerp(arg1:_GetFirstPersonLocalOffset(any_GetSubjectCFrame_result1_3), mapClamp_upvr(any_GetCameraToSubjectDistance_result1, 0.5, arg1.assemblyRadius, 1, 0))
	local any_GetVRFocus_result1 = arg1:GetVRFocus(any_GetSubjectCFrame_result1_3 * any_Lerp_result1_2, arg2)
	local _, any_addDrift_result2 = arg1:addDrift(any_GetVRFocus_result1:ToWorldSpace(arg1:GetVRFocus(arg1.lastSubjectCFrame * any_Lerp_result1_2, arg2):ToObjectSpace(CurrentCamera_6.CFrame)), any_GetVRFocus_result1)
	local var95 = any_addDrift_result2
	local any_getRotation_result1 = arg1:getRotation(arg2)
	local var97
	if 0 < math.abs(any_getRotation_result1) then
		local any_ToObjectSpace_result1 = var95:ToObjectSpace(var97)
		local var99 = var95 * CFrame.Angles(0, -any_getRotation_result1, 0) * any_ToObjectSpace_result1
		if not UserGameSettings_upvr.VRSmoothRotationEnabled then
			local any_GetUserCFrame_result1 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
			local var101 = any_GetUserCFrame_result1.Rotation + any_GetUserCFrame_result1.Position * CurrentCamera_6.HeadScale
			local var102 = var95 * any_GetSubjectCFrame_result1_3.Rotation
			local any_ToObjectSpace_result1_5 = var102:ToObjectSpace(var97 * var101)
			local arccosine_2 = math.acos(Vector3.new(any_ToObjectSpace_result1_5.X, 0, any_ToObjectSpace_result1_5.Z).Unit:Dot(Vector3.new(0, 0, 1)))
			local any_ToObjectSpace_result1_4 = var102:ToObjectSpace(var99 * var101)
			if math.acos(Vector3.new(any_ToObjectSpace_result1_4.X, 0, any_ToObjectSpace_result1_4.Z).Unit:Dot(Vector3.new(0, 0, 1))) < arccosine_2 then
				if any_getRotation_result1 < 0 then
					arccosine_2 *= -1
				end
				var99 = var95 * CFrame.Angles(0, -arccosine_2, 0) * any_ToObjectSpace_result1
			end
		end
		var97 = var99
	end
	if 0.1 < arg1:GetSubjectVelocity().Magnitude then
		arg1:StartVREdgeBlur(LocalPlayer_upvr)
	end
	if arg1.needsReset then
		arg1.needsReset = false
		VRService_upvr:RecenterUserHeadCFrame()
		arg1:StartFadeFromBlack()
		arg1:ResetZoom()
	end
	if arg1.recentered then
		var97 = var95 * any_GetSubjectCFrame_result1_3.Rotation * CFrame.new(0, 0, any_GetCameraToSubjectDistance_result1)
		arg1.recentered = false
	end
	return var97, var97 * CFrame.new(0, 0, -any_GetCameraToSubjectDistance_result1)
end
function setmetatable_result1_upvr.UpdateComfortCamera(arg1, arg2) -- Line 408
	--[[ Upvalues[4]:
		[1]: var4_upvw (read and write)
		[2]: var12_upvw (read and write)
		[3]: mapClamp_upvr (readonly)
		[4]: LocalPlayer_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 38 start (CF ANALYSIS FAILED)
	local CurrentCamera_3 = workspace.CurrentCamera
	local var107 = CurrentCamera_3
	if var107 then
		var107 = CurrentCamera_3.CameraSubject
	end
	local vehicleCameraCore_2 = arg1.vehicleCameraCore
	assert(CurrentCamera_3)
	assert(var107)
	assert(var107:IsA("VehicleSeat"))
	if not var4_upvw then
		local var109 = var12_upvw
		var12_upvw = 0
	end
	local any_GetSubjectCFrame_result1 = arg1:GetSubjectCFrame()
	local any_GetSubjectRotVelocity_result1_2 = arg1:GetSubjectRotVelocity()
	local any_StepZoom_result1 = arg1:StepZoom()
	local var11_result1_2 = mapClamp_upvr(any_StepZoom_result1, 0.5, arg1.assemblyRadius, 1, 0)
	local any_Lerp_result1_3 = arg1:_GetThirdPersonLocalOffset():Lerp(arg1:_GetFirstPersonLocalOffset(any_GetSubjectCFrame_result1), var11_result1_2)
	vehicleCameraCore_2:setTransform(any_GetSubjectCFrame_result1)
	local any_step_result1 = vehicleCameraCore_2:step(var109, math.abs(any_GetSubjectCFrame_result1.XVector:Dot(any_GetSubjectRotVelocity_result1_2)), math.abs(any_GetSubjectCFrame_result1.YVector:Dot(any_GetSubjectRotVelocity_result1_2)), var11_result1_2)
	if not var4_upvw then
		arg1:UpdateFadeFromBlack(var109)
	end
	if not arg1:IsInFirstPerson() then
		local var117 = CFrame.new(any_GetSubjectCFrame_result1 * any_Lerp_result1_3) * any_step_result1
		if not arg1.lastCameraFocus then
			arg1.lastCameraFocus = var117
			arg1.needsReset = true
		end
		local var118 = var117.Position - CurrentCamera_3.CFrame.Position
		if 0.56 < var118.Unit:Dot(CurrentCamera_3.CFrame.LookVector) and var118.magnitude < 200 and not arg1.needsReset then
			local _ = arg1.lastCameraFocus.p
			local _ = arg1:GetCameraLookVector()
		else
			arg1.lastCameraFocus = arg1:GetVRFocus(any_GetSubjectCFrame_result1.Position, var109)
			arg1.needsReset = false
			arg1:StartFadeFromBlack()
			arg1:ResetZoom()
		end
		if not var4_upvw then
			arg1:UpdateEdgeBlur(LocalPlayer_upvr, var109)
			-- KONSTANTWARNING: GOTO [273] #198
		end
		-- KONSTANTWARNING: GOTO [273] #198
	end
	local var121 = CFrame.new(any_GetSubjectCFrame_result1 * any_Lerp_result1_3) * CFrame.new(any_step_result1.Position, Vector3.new(any_step_result1.LookVector.X, 0, any_step_result1.LookVector.Z).Unit)
	if var4_upvw then
		if 0.1 < arg1:GetSubjectVelocity().Magnitude then
			arg1:StartVREdgeBlur(LocalPlayer_upvr)
			-- KONSTANTWARNING: GOTO [273] #198
		end
	else
		arg1:StartVREdgeBlur(LocalPlayer_upvr)
	end
	-- KONSTANTERROR: [0] 1. Error Block 38 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [273] 198. Error Block 24 start (CF ANALYSIS FAILED)
	do
		return var121 * CFrame.new(0, 0, any_StepZoom_result1), var121
	end
	-- KONSTANTERROR: [273] 198. Error Block 24 end (CF ANALYSIS FAILED)
end
return setmetatable_result1_upvr