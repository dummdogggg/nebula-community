--[[
    Script: ReplicatedStorage.ViewModelControl.Utility.ViewModelController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:30
-- Luau version 6, Types version 3
-- Time taken: 0.004597 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService_upvr = game:GetService("RunService")
local Workspace_upvr = game:GetService("Workspace")
local Constants_upvr = require(ReplicatedStorage.ViewModelControl.Utility.Constants)
local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
local tbl_upvr = {
	Revolver = ReplicatedStorage.ViewModelControl.ViewModels.RevolverViewModel;
	Rifle = ReplicatedStorage.ViewModelControl.ViewModels.RifleViewModel;
	Shotgun = ReplicatedStorage.ViewModelControl.ViewModels.ShotgunViewModel;
	["Sawed-Off Shotgun"] = ReplicatedStorage.ViewModelControl.ViewModels.SawedOffShotgunViewModel;
	Molotov = ReplicatedStorage.ViewModelControl.ViewModels.MolotovViewModel;
	Mauser = ReplicatedStorage.ViewModelControl.ViewModels.MauserViewModel;
	["Holy Water"] = ReplicatedStorage.ViewModelControl.ViewModels.HolyWaterViewModel;
	["Navy Revolver"] = ReplicatedStorage.ViewModelControl.ViewModels.NavyRevolverViewModel;
	["Bolt Action Rifle"] = ReplicatedStorage.ViewModelControl.ViewModels.BoltActionRifleViewModel;
	Electrocutioner = ReplicatedStorage.ViewModelControl.ViewModels.ElectrocutionerViewModel;
}
local LocalPlayer_upvr = game.Players.LocalPlayer
function module_2_upvr.new(arg1) -- Line 32
	--[[ Upvalues[3]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: module_2_upvr (readonly)
	]]
	local Character = LocalPlayer_upvr.Character
	local var9
	if not Character then return end
	local var10 = tbl_upvr[arg1.Name]
	if not var10 then return end
	local clone = var10:Clone()
	local Color = Character["Right Arm"].Color
	clone.RightArm.Color = Color
	clone.LeftArm.Color = Color
	clone.Parent = game.Workspace
	local Animator = clone.AnimationController.Animator
	local Animations = clone.Animations
	var9 = Animations.Hold
	local var15
	var9 = nil
	if Animations:FindFirstChild("Shoot") then
		var15 = Animator:LoadAnimation(Animations.Shoot)
	end
	if Animations:FindFirstChild("Reload") then
		var9 = Animator:LoadAnimation(Animations.Reload)
	end
	local module = {
		enabled = false;
		model = clone;
		stride = 0;
		bobbing = 0;
	}
	module.toolInstance = arg1
	module.handle = arg1.Handle
	module.holdAnim = Animator:LoadAnimation(var9)
	module.shootAnim = var15
	module.reloadAnim = var9
	module.char = Character
	setmetatable(module, module_2_upvr)
	return module
end
local lerp_upvr = require(ReplicatedStorage.ViewModelControl.Utility.lerp)
local CurrentCamera_upvr = Workspace_upvr.CurrentCamera
function module_2_upvr.update(arg1, arg2) -- Line 91
	--[[ Upvalues[4]:
		[1]: Constants_upvr (readonly)
		[2]: lerp_upvr (readonly)
		[3]: CurrentCamera_upvr (readonly)
		[4]: Workspace_upvr (readonly)
	]]
	local var19 = (arg1.handle.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude * Constants_upvr.VIEW_MODEL_BOBBING_SPEED
	arg1.stride = (arg1.stride + var19 * arg2) % (-math.pi*2)
	arg1.bobbing = lerp_upvr(arg1.bobbing, math.min(var19, 1), math.min(arg2 * Constants_upvr.VIEW_MODEL_BOBBING_TRANSITION_SPEED, 1))
	local RaycastParams_new_result1 = RaycastParams.new()
	RaycastParams_new_result1.FilterType = Enum.RaycastFilterType.Exclude
	RaycastParams_new_result1.FilterDescendantsInstances = {arg1.char, arg1.model}
	local var22 = CurrentCamera_upvr.CFrame * Constants_upvr.VIEW_MODEL_OFFSET
	local any_Raycast_result1 = Workspace_upvr:Raycast(var22.Position, var22.LookVector * arg1.model.Configuration.HoldDistance.Value, RaycastParams_new_result1)
	local var24 = Vector3.new(0, 0, 0)
	if any_Raycast_result1 then
		var24 = Vector3.new(0, 0, arg1.model.Configuration.HoldDistance.Value - any_Raycast_result1.Distance - 0.7)
	end
	arg1.model:PivotTo(CurrentCamera_upvr.CFrame * (Constants_upvr.VIEW_MODEL_OFFSET + var24) * CFrame.new(Vector3.new(math.sin(arg1.stride), math.sin(arg1.stride * 2), 0) * Constants_upvr.VIEW_MODEL_BOBBING_AMOUNT * arg1.bobbing))
end
function module_2_upvr.checkForToolInstance(arg1, arg2) -- Line 127
	if not arg2:IsA("BasePart") and not arg2:IsA("Decal") then
	else
		if not arg2:FindFirstAncestorOfClass("Tool") then return end
		table.insert(arg1.toolInstances, arg2)
	end
end
function module_2_upvr.playShootAnimation(arg1) -- Line 142
	arg1.shootAnim:Play()
	arg1.model.Handle.Attachment.Flash:Emit(1)
	arg1.model.Handle.Shoot:Play()
end
function module_2_upvr.playThrowAnimation(arg1) -- Line 150
	arg1.shootAnim:Play()
	task.wait(0.25)
	local Effect = arg1.model.Handle:FindFirstChild("Effect")
	if Effect then
		Effect.Enabled = true
	end
	local BeforeThrowSound = arg1.model.Handle:FindFirstChild("BeforeThrowSound")
	if BeforeThrowSound then
		BeforeThrowSound:Play()
	end
end
function module_2_upvr.playReloadAnimation(arg1, arg2, arg3) -- Line 169
	local reloadAnim = arg1.reloadAnim
	local var30 = (reloadAnim.Length) / (arg3 / arg2)
	arg1.shootAnim:Stop()
	for _ = 1, arg2 do
		arg1.model.Handle.Reload.PlaybackSpeed = math.random(90, 110) / 100
		arg1.model.Handle.Reload:Play()
		reloadAnim:Play(nil, nil, var30)
		reloadAnim.Stopped:Wait()
	end
	arg1.model.Handle.ReloadFinish:Play()
end
function module_2_upvr.cancelReloadAnimation(arg1) -- Line 192
	arg1.reloadAnim:Stop()
end
function module_2_upvr.enable(arg1) -- Line 196
	--[[ Upvalues[3]:
		[1]: RunService_upvr (readonly)
		[2]: Constants_upvr (readonly)
		[3]: Workspace_upvr (readonly)
	]]
	if arg1.enabled then
	else
		arg1.enabled = true
		for _, v in pairs(arg1.toolInstance:GetDescendants()) do
			if v:IsA("BasePart") then
				v.LocalTransparencyModifier = 1
			elseif v:IsA("SurfaceGui") then
				v.Enabled = false
			end
		end
		RunService_upvr:BindToRenderStep(Constants_upvr.VIEW_MODEL_BIND_NAME, Enum.RenderPriority.Camera.Value + 1, function(arg1_2) -- Line 213
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:update(arg1_2)
		end)
		arg1.model.Parent = Workspace_upvr
		arg1.holdAnim:Play()
	end
end
function module_2_upvr.disable(arg1) -- Line 223
	--[[ Upvalues[2]:
		[1]: RunService_upvr (readonly)
		[2]: Constants_upvr (readonly)
	]]
	if not arg1.enabled then
	else
		arg1.enabled = false
		RunService_upvr:UnbindFromRenderStep(Constants_upvr.VIEW_MODEL_BIND_NAME)
		arg1.model.Parent = nil
		arg1.holdAnim:Stop()
	end
end
function module_2_upvr.destroy(arg1) -- Line 235
	arg1:disable()
	arg1.model:Destroy()
end
return module_2_upvr