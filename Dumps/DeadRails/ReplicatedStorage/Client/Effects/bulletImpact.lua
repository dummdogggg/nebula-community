--[[
    Script: ReplicatedStorage.Client.Effects.bulletImpact
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:10
-- Luau version 6, Types version 3
-- Time taken: 0.004984 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local tbl_2_upvr = {}
local tbl = {
	soundFolder = SoundService.BulletSounds.Metal;
}
local function effect(arg1, arg2) -- Line 11
	local Sparks = arg1:FindFirstChild("Sparks")
	if Sparks then
		Sparks:Emit(25)
	end
end
tbl.effect = effect
tbl_2_upvr[Enum.Material.Metal] = tbl
local tbl_3 = {
	soundFolder = SoundService.BulletSounds.Wood;
}
local function effect(arg1, arg2) -- Line 22
	local Blood_2 = arg1:FindFirstChild("Blood")
	if Blood_2 then
		Blood_2.Color = ColorSequence.new(arg2.Color)
		Blood_2:Emit(25)
	end
end
tbl_3.effect = effect
tbl_2_upvr[Enum.Material.Wood] = tbl_3
tbl_2_upvr[Enum.Material.DiamondPlate] = tbl_2_upvr[Enum.Material.Metal]
tbl_2_upvr[Enum.Material.WoodPlanks] = tbl_2_upvr[Enum.Material.Wood]
local tbl_4_upvr = {
	soundFolder = SoundService.BulletSounds.Dirt;
	effect = function(arg1, arg2) -- Line 44, Named "effect"
		local Blood = arg1:FindFirstChild("Blood")
		if Blood then
			Blood.Color = ColorSequence.new(arg2.Color)
			Blood:Emit(25)
		end
	end;
}
return function(arg1, arg2) -- Line 54, Named "bulletImpact"
	--[[ Upvalues[3]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: tbl_2_upvr (readonly)
		[3]: tbl_4_upvr (readonly)
	]]
	local clone_2_upvr = ReplicatedStorage_upvr.Assets.BloodAttachholder.BloodAttach:Clone()
	clone_2_upvr.Position = arg2.position
	clone_2_upvr.Parent = workspace.Terrain
	if arg2.taggedHumanoid and arg2.instance then
		local var28 = false
		local instance = arg2.instance
		local class_Model_2 = arg2.instance:FindFirstAncestorOfClass("Model")
		if class_Model_2 then
			if class_Model_2:GetAttribute("BloodColor") then
				clone_2_upvr.Blood.Color = ColorSequence.new(class_Model_2:GetAttribute("BloodColor"))
			end
			local SOME_2 = class_Model_2:FindFirstChild(arg2.instance.Name.."_Armor")
			if SOME_2 then
				local ArmorCoverPercent_2 = SOME_2:GetAttribute("ArmorCoverPercent")
				if not ArmorCoverPercent_2 then
					warn("Armor is missing number Attribute ArmorCoverPercent", SOME_2.Name)
				end
				if Random.new(arg1):NextInteger(0, 100) < ArmorCoverPercent_2 then
					var28 = true
					local class_MeshPart = SOME_2:FindFirstChildWhichIsA("MeshPart", true)
					if class_MeshPart then
						instance = class_MeshPart
					end
				end
			end
		end
		if var28 then
			local var34 = tbl_2_upvr[Enum.Material.Metal]
			local children = var34.soundFolder:GetChildren()
			local clone_3 = children[math.random(1, #children)]:Clone()
			clone_3.PlaybackSpeed = math.random(80, 120) / 100
			clone_3.Parent = clone_2_upvr
			task.wait()
			clone_3:Play()
			var34.effect(clone_2_upvr, instance)
		else
			if arg2.instance.Name == "Head" or arg2.instance.Name == "VisualHead" or not arg2.instance:GetAttribute("SoundCooldown") then
				clone_2_upvr.HeadHit:Play()
				arg2.instance:SetAttribute("SoundCooldown", true)
				task.delay(0.15, function() -- Line 111
					--[[ Upvalues[1]:
						[1]: arg2 (readonly)
					]]
					if arg2.instance:IsDescendantOf(workspace) then
						arg2.instance:SetAttribute("SoundCooldown", false)
					end
				end)
			else
				local Parent_upvr = arg2.taggedHumanoid.Parent
				if not Parent_upvr:GetAttribute("BodyShotCooldown") then
					clone_2_upvr.BodyHit:Play()
					Parent_upvr:SetAttribute("BodyShotCooldown", true)
					task.delay(0.15, function() -- Line 121
						--[[ Upvalues[1]:
							[1]: Parent_upvr (readonly)
						]]
						if Parent_upvr:IsDescendantOf(workspace) then
							Parent_upvr:SetAttribute("BodyShotCooldown", false)
						end
					end)
				else
					clone_2_upvr.BodyHit.Volume = 0.1
					clone_2_upvr.BodyHit:Play()
				end
			end
			Parent_upvr = clone_2_upvr.Blood:Emit
			Parent_upvr(50)
		end
	elseif arg2.instance then
		instance = tbl_2_upvr
		local var40 = instance[arg2.material]
		if not var40 then
			var40 = tbl_4_upvr
		end
		instance = var40.soundFolder:GetChildren()
		local var41 = instance
		Parent_upvr = math.random(1, #var41)
		local clone = var41[Parent_upvr]:Clone()
		Parent_upvr = math.random(80, 120) / 100
		clone.PlaybackSpeed = Parent_upvr
		clone.Parent = clone_2_upvr
		Parent_upvr = task.wait
		Parent_upvr()
		Parent_upvr = clone:Play
		Parent_upvr()
		Parent_upvr = var40.effect
		Parent_upvr(clone_2_upvr, arg2.instance)
	end
	task.delay(1, function() -- Line 152
		--[[ Upvalues[1]:
			[1]: clone_2_upvr (readonly)
		]]
		clone_2_upvr:Destroy()
	end)
end