--[[
    Script: ReplicatedStorage.Packages.LightningBolt.LightningExplosion
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:45
-- Luau version 6, Types version 3
-- Time taken: 0.004653 seconds

local random_state_upvr = Random.new()
local clock_upvr = os.clock
function RandomVectorOffsetBetween(arg1, arg2, arg3) -- Line 9
	--[[ Upvalues[1]:
		[1]: random_state_upvr (readonly)
	]]
	return (CFrame.lookAt(Vector3.new(), arg1) * CFrame.Angles(0, 0, random_state_upvr:NextNumber(0, (-math.pi*2))) * CFrame.Angles(math.acos(random_state_upvr:NextNumber(math.cos(arg3), math.cos(arg2))), 0, 0)).LookVector
end
local tbl_upvr = {}
local module_upvr = {}
module_upvr.__index = module_upvr
local Parent_upvr = require(script.Parent)
local LightningSparks_upvr = require(script.Parent.LightningSparks)
function module_upvr.new(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 20
	--[[ Upvalues[6]:
		[1]: module_upvr (readonly)
		[2]: random_state_upvr (readonly)
		[3]: Parent_upvr (readonly)
		[4]: LightningSparks_upvr (readonly)
		[5]: clock_upvr (readonly)
		[6]: tbl_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.Size = arg2 or 1
	setmetatable_result1.NumBolts = arg3 or 14
	local var16 = arg4
	if not var16 then
		var16 = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(0, 0, 1))
	end
	setmetatable_result1.Color = var16
	var16 = arg5
	local var17 = var16
	if not var17 then
		var17 = Color3.new(0.3, 0.3, 1)
	end
	setmetatable_result1.BoltColor = var17
	setmetatable_result1.UpVector = arg6 or Vector3.new(0, 1, 0)
	local Part = Instance.new("Part")
	Part.Name = "LightningExplosion"
	Part.Anchored = true
	Part.CanCollide = false
	Part.Locked = true
	Part.CastShadow = false
	Part.Transparency = 1
	Part.Size = Vector3.new(0.05000, 0.05000, 0.05000)
	Part.CFrame = CFrame.lookAt(arg1 + Vector3.new(0, 0.5, 0), arg1 + Vector3.new(0, 0.5, 0) + setmetatable_result1.UpVector) * CFrame.lookAt(Vector3.new(), Vector3.new(0, 1, 0)):inverse()
	Part.Parent = workspace.CurrentCamera
	local Attachment = Instance.new("Attachment")
	Attachment.Parent = Part
	Attachment.CFrame = CFrame.new()
	local clone_3 = script.ExplosionBrightspot:Clone()
	local clone_2 = script.GlareEmitter:Clone()
	local clone = script.PlasmaEmitter:Clone()
	local clamped = math.clamp(setmetatable_result1.Size, 0, 1)
	clone_2.Size = NumberSequence.new(clamped * 30)
	clone.Size = NumberSequence.new(clamped * 18)
	clone.Speed = NumberRange.new(clamped * 100)
	clone_3.Parent = Attachment
	clone_2.Parent = Attachment
	clone.Parent = Attachment
	local Color = setmetatable_result1.Color
	if typeof(Color) == "Color3" then
		clone_2.Color = ColorSequence.new(Color)
		clone.Color = ColorSequence.new(Color)
		local Color3_toHSV_result1, _, Color3_toHSV_result3 = Color3.toHSV(Color)
		clone_3.Color = ColorSequence.new(Color3.fromHSV(Color3_toHSV_result1, 0.5, Color3_toHSV_result3))
	else
		clone_2.Color = Color
		clone.Color = Color
		local Keypoints = Color.Keypoints
		for i = 1, #Keypoints do
			local Color3_toHSV_result1_2, _, Color3_toHSV_result3_2 = Color3.toHSV(Keypoints[i].Value)
			Keypoints[i] = ColorSequenceKeypoint.new(Keypoints[i].Time, Color3.fromHSV(Color3_toHSV_result1_2, 0.5, Color3_toHSV_result3_2))
			local var32
		end
		clone_3.Color = ColorSequence.new(var32)
	end
	clone_3.Enabled = true
	clone_2.Enabled = true
	clone.Enabled = true
	local tbl = {}
	i = 1
	for _ = i, setmetatable_result1.NumBolts do
		local tbl_3 = {}
		local tbl_2 = {}
		tbl_3.WorldPosition = Attachment.WorldPosition
		tbl_3.WorldAxis = RandomVectorOffsetBetween(setmetatable_result1.UpVector, 1.1344640137963142, 1.3962634015954636)
		tbl_2.WorldPosition = Attachment.WorldPosition + tbl_3.WorldAxis * random_state_upvr:NextNumber(20, 40) * 1.4 * clamped
		tbl_2.WorldAxis = RandomVectorOffsetBetween(-setmetatable_result1.UpVector, 1.2217304763960306, 1.9198621771937625)
		local any_new_result1_2 = Parent_upvr.new(tbl_3, tbl_2, 10)
		any_new_result1_2.AnimationSpeed = 0
		any_new_result1_2.Color = setmetatable_result1.BoltColor
		any_new_result1_2.PulseLength = 0.8
		any_new_result1_2.ColorOffsetSpeed = 20
		any_new_result1_2.Frequency = 3
		any_new_result1_2.MinRadius = 0
		any_new_result1_2.MaxRadius = clamped * 4
		any_new_result1_2.FadeLength = 0.4
		any_new_result1_2.PulseSpeed = 5
		any_new_result1_2.MinThicknessMultiplier = 0.7
		any_new_result1_2.MaxThicknessMultiplier = 1
		local any_new_result1 = LightningSparks_upvr.new(any_new_result1_2)
		any_new_result1.MinDistance = 7.5
		any_new_result1.MaxDistance = 10
		any_new_result1_2.Velocity = (tbl_2.WorldPosition - tbl_3.WorldPosition).Unit * 0.1 * clamped
		tbl[#tbl + 1] = any_new_result1_2
		local var38
	end
	setmetatable_result1.Bolts = tbl
	setmetatable_result1.Attachment = var38
	setmetatable_result1.Part = Part
	setmetatable_result1.StartT = clock_upvr()
	setmetatable_result1.RefIndex = #tbl_upvr + 1
	tbl_upvr[setmetatable_result1.RefIndex] = setmetatable_result1
	return setmetatable_result1
end
function module_upvr.Destroy(arg1) -- Line 122
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	tbl_upvr[arg1.RefIndex] = nil
	arg1.Part:Destroy()
	for i_3 = 1, #arg1.Bolts do
		arg1.Bolts[i_3] = nil
	end
end
game:GetService("RunService").Heartbeat:Connect(function() -- Line 133
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: clock_upvr (readonly)
	]]
	for _, v in pairs(tbl_upvr) do
		local var47 = clock_upvr() - v.StartT
		local Attachment_2 = v.Attachment
		if var47 < 0.7 then
			if 0.2 < var47 then
				Attachment_2.ExplosionBrightspot.Enabled = false
				Attachment_2.GlareEmitter.Enabled = false
				Attachment_2.PlasmaEmitter.Enabled = false
			end
			for i_5 = 1, #v.Bolts do
				local var49 = v.Bolts[i_5]
				var49.Attachment1.WorldPosition = var49.Attachment1.WorldPosition + var49.Velocity
			end
		else
			v:Destroy()
		end
	end
end)
return module_upvr