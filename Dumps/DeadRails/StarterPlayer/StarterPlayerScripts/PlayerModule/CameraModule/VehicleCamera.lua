--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:51
-- Luau version 6, Types version 3
-- Time taken: 0.003980 seconds

local tbl_upvr = {0, 15, 30}
local module_upvr_3 = require(script.Parent:WaitForChild("BaseCamera"))
local module_upvr_2 = require(script.Parent:WaitForChild("CameraUtils"))
local module_upvr_4 = require(script:WaitForChild("VehicleCameraConfig"))
local mapClamp_upvr = module_upvr_2.mapClamp
local function _(arg1, arg2) -- Line 31, Named "pitchVelocity"
	return math.abs(arg2.XVector:Dot(arg1))
end
local function _(arg1, arg2) -- Line 36, Named "yawVelocity"
	return math.abs(arg2.YVector:Dot(arg1))
end
local var6_upvw = (1/60)
game:GetService("RunService").Stepped:Connect(function(arg1, arg2) -- Line 42
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	var6_upvw = arg2
end)
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr_3)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new() -- Line 49
	--[[ Upvalues[2]:
		[1]: module_upvr_3 (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr_3.new(), setmetatable_result1_2_upvr)
	setmetatable_result1:Reset()
	return setmetatable_result1
end
local module_upvr = require(script:WaitForChild("VehicleCameraCore"))
local Spring_upvr = module_upvr_2.Spring
function setmetatable_result1_2_upvr.Reset(arg1) -- Line 55
	--[[ Upvalues[5]:
		[1]: module_upvr (readonly)
		[2]: Spring_upvr (readonly)
		[3]: module_upvr_4 (readonly)
		[4]: module_upvr_2 (readonly)
		[5]: tbl_upvr (readonly)
	]]
	arg1.vehicleCameraCore = module_upvr.new(arg1:GetSubjectCFrame())
	arg1.pitchSpring = Spring_upvr.new(0, -math.rad(module_upvr_4.pitchBaseAngle))
	arg1.yawSpring = Spring_upvr.new(0, 0)
	arg1.lastPanTick = 0
	local CurrentCamera = workspace.CurrentCamera
	local var17 = CurrentCamera
	if var17 then
		var17 = CurrentCamera.CameraSubject
	end
	assert(CurrentCamera)
	assert(var17)
	assert(var17:IsA("VehicleSeat"))
	local any_getLooseBoundingSphere_result1, any_getLooseBoundingSphere_result2 = module_upvr_2.getLooseBoundingSphere(var17:GetConnectedParts(true))
	arg1.assemblyRadius = math.max(any_getLooseBoundingSphere_result2, 5)
	arg1.assemblyOffset = var17.CFrame:Inverse() * any_getLooseBoundingSphere_result1
	arg1.gamepadZoomLevels = {}
	for _, v in tbl_upvr do
		table.insert(arg1.gamepadZoomLevels, v * arg1.assemblyRadius / 10)
	end
	arg1:SetCameraToSubjectDistance(arg1.gamepadZoomLevels[#arg1.gamepadZoomLevels])
end
local module_upvr_5 = require(script.Parent:WaitForChild("CameraInput"))
local sanitizeAngle_upvr = module_upvr_2.sanitizeAngle
function setmetatable_result1_2_upvr._StepRotation(arg1, arg2, arg3) -- Line 85
	--[[ Upvalues[4]:
		[1]: module_upvr_5 (readonly)
		[2]: sanitizeAngle_upvr (readonly)
		[3]: module_upvr_4 (readonly)
		[4]: mapClamp_upvr (readonly)
	]]
	local yawSpring = arg1.yawSpring
	local pitchSpring = arg1.pitchSpring
	local any_getRotation_result1 = module_upvr_5.getRotation(arg2, true)
	yawSpring.pos = sanitizeAngle_upvr(yawSpring.pos + -any_getRotation_result1.X)
	pitchSpring.pos = sanitizeAngle_upvr(math.clamp(pitchSpring.pos + -any_getRotation_result1.Y, -1.3962634015954636, 1.3962634015954636))
	if module_upvr_5.getRotationActivated() then
		arg1.lastPanTick = os.clock()
	end
	local var25 = -math.rad(module_upvr_4.pitchBaseAngle)
	if module_upvr_4.autocorrectDelay < os.clock() - arg1.lastPanTick then
		local mapClamp_upvr_result1 = mapClamp_upvr(arg3, module_upvr_4.autocorrectMinCarSpeed, module_upvr_4.autocorrectMaxCarSpeed, 0, module_upvr_4.autocorrectResponse)
		yawSpring.freq = mapClamp_upvr_result1
		pitchSpring.freq = mapClamp_upvr_result1
		if yawSpring.freq < 0.001 then
			yawSpring.vel = 0
		end
		if pitchSpring.freq < 0.001 then
			pitchSpring.vel = 0
		end
		if math.abs(sanitizeAngle_upvr(var25 - pitchSpring.pos)) <= math.rad(module_upvr_4.pitchDeadzoneAngle) then
			pitchSpring.goal = pitchSpring.pos
		else
			pitchSpring.goal = var25
		end
	else
		yawSpring.freq = 0
		yawSpring.vel = 0
		pitchSpring.freq = 0
		pitchSpring.vel = 0
		pitchSpring.goal = var25
	end
	return CFrame.fromEulerAnglesYXZ(pitchSpring:step(arg2), yawSpring:step(arg2), 0)
end
function setmetatable_result1_2_upvr._GetThirdPersonLocalOffset(arg1) -- Line 148
	--[[ Upvalues[1]:
		[1]: module_upvr_4 (readonly)
	]]
	return arg1.assemblyOffset + Vector3.new(0, arg1.assemblyRadius * module_upvr_4.verticalCenterOffset, 0)
end
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
function setmetatable_result1_2_upvr._GetFirstPersonLocalOffset(arg1, arg2) -- Line 152
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local Character_2 = LocalPlayer_upvr.Character
	if Character_2 and Character_2.Parent then
		local Head_2 = Character_2:FindFirstChild("Head")
		if Head_2 and Head_2:IsA("BasePart") then
			return arg2:Inverse() * Head_2.Position
		end
	end
	return arg1:_GetThirdPersonLocalOffset()
end
function setmetatable_result1_2_upvr.Update(arg1) -- Line 166
	--[[ Upvalues[2]:
		[1]: var6_upvw (read and write)
		[2]: mapClamp_upvr (readonly)
	]]
	local CurrentCamera_2 = workspace.CurrentCamera
	local var33 = CurrentCamera_2
	if var33 then
		var33 = CurrentCamera_2.CameraSubject
	end
	local vehicleCameraCore = arg1.vehicleCameraCore
	assert(CurrentCamera_2)
	assert(var33)
	assert(var33:IsA("VehicleSeat"))
	local var35 = var6_upvw
	var6_upvw = 0
	local any_GetSubjectCFrame_result1 = arg1:GetSubjectCFrame()
	local any_GetSubjectRotVelocity_result1 = arg1:GetSubjectRotVelocity()
	local any_StepZoom_result1 = arg1:StepZoom()
	local var5_result1 = mapClamp_upvr(any_StepZoom_result1, 0.5, arg1.assemblyRadius, 1, 0)
	vehicleCameraCore:setTransform(any_GetSubjectCFrame_result1)
	local var40 = CFrame.new(any_GetSubjectCFrame_result1 * arg1:_GetThirdPersonLocalOffset():Lerp(arg1:_GetFirstPersonLocalOffset(any_GetSubjectCFrame_result1), var5_result1)) * vehicleCameraCore:step(var35, math.abs(any_GetSubjectCFrame_result1.XVector:Dot(any_GetSubjectRotVelocity_result1)), math.abs(any_GetSubjectCFrame_result1.YVector:Dot(any_GetSubjectRotVelocity_result1)), var5_result1) * arg1:_StepRotation(var35, math.abs(arg1:GetSubjectVelocity():Dot(any_GetSubjectCFrame_result1.ZVector)))
	return var40 * CFrame.new(0, 0, any_StepZoom_result1), var40
end
function setmetatable_result1_2_upvr.ApplyVRTransform(arg1) -- Line 211
end
return setmetatable_result1_2_upvr