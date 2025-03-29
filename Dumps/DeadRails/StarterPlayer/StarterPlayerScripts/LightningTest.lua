--[[
    Script: StarterPlayer.StarterPlayerScripts.LightningTest
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:21
-- Luau version 6, Types version 3
-- Time taken: 0.001678 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LightningBolt_upvr = require(ReplicatedStorage.Packages.LightningBolt)
local LightningSparks_upvr = require(ReplicatedStorage.Packages.LightningBolt.LightningSparks)
local LightningExplosion_upvr = require(ReplicatedStorage.Packages.LightningBolt.LightningExplosion)
local LocalPlayer_upvr = game.Players.LocalPlayer
ReplicatedStorage.Remotes.LightningReplicate.OnClientEvent:Connect(function(arg1, arg2, arg3) -- Line 11
	--[[ Upvalues[4]:
		[1]: LightningBolt_upvr (readonly)
		[2]: LightningSparks_upvr (readonly)
		[3]: LightningExplosion_upvr (readonly)
		[4]: LocalPlayer_upvr (readonly)
	]]
	local clone = game.ReplicatedStorage.Assets.LightningModel:Clone()
	clone.Parent = game.Workspace
	clone.Part1.Position = arg1
	clone.Part2.Position = arg2
	local any_new_result1_2 = LightningBolt_upvr.new(clone.Part1.Attachment1, clone.Part2.Attachment2, 20)
	any_new_result1_2.CurveSize0 = 15.39600717839002
	any_new_result1_2.CurveSize1 = 15.39600717839002
	any_new_result1_2.Color = Color3.fromRGB(193, 217, 255)
	any_new_result1_2.AnimationSpeed = 0.5
	any_new_result1_2.Thickness = 3
	any_new_result1_2.MinRadius = 0
	any_new_result1_2.MaxRadius = 20
	any_new_result1_2.MinThicknessMultiplier = 1
	any_new_result1_2.MaxThicknessMultiplier = 1
	any_new_result1_2.ColorOffsetSpeed = 4
	any_new_result1_2.Frequency = 6
	local any_new_result1 = LightningSparks_upvr.new(any_new_result1_2, 5)
	any_new_result1.MinSpeed = 10
	any_new_result1.MaxSpeed = 20
	any_new_result1.MinDistance = 3
	any_new_result1.MaxDistance = 6
	any_new_result1.MinPartsPerSpark = 9
	any_new_result1.MaxPartsPerSpark = 11
	any_new_result1_2.Enabled = false
	local clone_2 = game.SoundService.Lightning:GetChildren()[Random.new(arg3):NextInteger(1, #game.SoundService.Lightning:GetChildren())]:Clone()
	clone_2.Parent = clone.Part1
	clone_2.PlayOnRemove = true
	clone_2:Destroy()
	local Character = LocalPlayer_upvr.Character
	if Character then
		game.Lighting.ExposureCompensation = math.clamp(4 * (1 - (Character.HumanoidRootPart.Position - arg1).Magnitude / 300), 0, 1.5)
		task.delay(0.25, function() -- Line 51
			game.Lighting.ExposureCompensation = 0
		end)
	end
	for _ = 1, 6 do
		any_new_result1_2.Enabled = true
		task.wait(0.05)
		any_new_result1_2.Enabled = false
		task.wait(0.015)
	end
	task.wait(1)
	any_new_result1_2:Destroy()
	clone:Destroy()
end)