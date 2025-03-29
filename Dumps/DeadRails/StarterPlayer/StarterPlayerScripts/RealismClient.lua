--[[
    Script: StarterPlayer.StarterPlayerScripts.RealismClient
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:30
-- Luau version 6, Types version 3
-- Time taken: 0.007948 seconds

local CollectionService_upvr = game:GetService("CollectionService")
local RunService_upvr = game:GetService("RunService")
local Players_upvr = game:GetService("Players")
local Util_upvr = require(script.Util)
local FpsCamera_upvr = require(script.FpsCamera)
local tbl = {
	Rotators = {};
	BindTag = "RealismHook";
	Player = Players_upvr.LocalPlayer;
	SetLookAngles = game:GetService("ReplicatedStorage"):WaitForChild("SetLookAngles");
	Connect = function(arg1, arg2, arg3) -- Line 36, Named "Connect"
		return arg3:Connect(function(...) -- Line 37
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: arg2 (readonly)
			]]
			arg1[arg2](arg1, ...)
		end)
	end;
	AddMotor = function(arg1, arg2, arg3) -- Line 45, Named "AddMotor"
		--[[ Upvalues[1]:
			[1]: Util_upvr (readonly)
		]]
		local Parent_2 = arg3.Parent
		if Parent_2 and Parent_2.Name == "Head" then
			Parent_2.CanCollide = false
		end
		Util_upvr:PromiseValue(arg3, "Active", function() -- Line 55
			--[[ Upvalues[3]:
				[1]: arg3 (readonly)
				[2]: Util_upvr (copied, readonly)
				[3]: arg2 (readonly)
			]]
			local tbl_upvr = {}
			tbl_upvr.Motor = arg3
			tbl_upvr.C0 = arg3.C0
			Util_upvr:PromiseChild(arg3.Part0, arg3.Name.."RigAttachment", function(arg1_2) -- Line 65
				--[[ Upvalues[1]:
					[1]: tbl_upvr (readonly)
				]]
				if arg1_2:IsA("Attachment") then
					tbl_upvr.Origin = arg1_2
					tbl_upvr.C0 = nil
				end
			end)
			arg2.Motors[arg3.Part1.Name] = tbl_upvr
		end)
	end;
	OnLookReceive = function(arg1, arg2, arg3, arg4) -- Line 84, Named "OnLookReceive"
		local var12 = arg1.Rotators[arg2.Character]
		if var12 then
			var12.Pitch.Goal = arg3
			var12.Yaw.Goal = arg4
		end
	end;
	ComputeLookAngle = function(arg1, arg2, arg3) -- Line 98, Named "ComputeLookAngle"
		--[[ Upvalues[1]:
			[1]: FpsCamera_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var18
		if not var18 then
			var18 = workspace.CurrentCamera.CFrame.LookVector
			local var19
		end
		if var18 then
			var19 = arg1.Player
			var19 = var19.Character
			if var19 then
				var19 = var19.Character:FindFirstChild("HumanoidRootPart")
			end
			if var19 then
				if var19:IsA("BasePart") then
					if not FpsCamera_upvr:IsInFirstPerson() then
					end
				end
			end
		end
		if arg3 then
			local var22 = arg3
		end
		return -var19.CFrame.RightVector:Dot(var18) * var22, var18.Y * var22
	end;
	StepValue = function(arg1, arg2, arg3) -- Line 136, Named "StepValue"
		--[[ Upvalues[1]:
			[1]: Util_upvr (readonly)
		]]
		local var23 = arg2.Current or 0
		local Goal = arg2.Goal
		arg2.Current = Util_upvr:StepTowards(var23, Goal, math.min(math.min(1, arg3 * 20 / 3), (math.abs(Goal - var23)) / ((5) / (arg3 * 60))))
		return arg2.Current
	end;
	UpdateLookAngles = function(arg1, arg2) -- Line 153, Named "UpdateLookAngles"
		--[[ Upvalues[4]:
			[1]: Util_upvr (readonly)
			[2]: Players_upvr (readonly)
			[3]: FpsCamera_upvr (readonly)
			[4]: CollectionService_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 93 start (CF ANALYSIS FAILED)
		local any_ComputeLookAngle_result1, any_ComputeLookAngle_result2 = arg1:ComputeLookAngle()
		arg1:OnLookReceive(arg1.Player, any_ComputeLookAngle_result1, any_ComputeLookAngle_result2)
		local os_clock_result1 = os.clock()
		if 0.5 < os_clock_result1 - (arg1.LastUpdate or 0) then
			local any_RoundNearestInterval_result1 = Util_upvr:RoundNearestInterval(any_ComputeLookAngle_result1, 0.05)
			local any_RoundNearestInterval_result1_2 = Util_upvr:RoundNearestInterval(any_ComputeLookAngle_result2, 0.05)
			if any_RoundNearestInterval_result1 ~= arg1.Pitch then
				arg1.Pitch = any_RoundNearestInterval_result1
				arg1.Dirty = true
			end
			if any_RoundNearestInterval_result1_2 ~= arg1.Yaw then
				arg1.Yaw = any_RoundNearestInterval_result1_2
				arg1.Dirty = true
			end
			if arg1.Dirty then
				arg1.Dirty = false
				arg1.LastUpdate = os_clock_result1
				arg1.SetLookAngles:FireServer(any_RoundNearestInterval_result1, any_RoundNearestInterval_result1_2)
			end
		end
		local pairs_result1_2, pairs_result2, pairs_result3_3 = pairs(arg1.Rotators)
		-- KONSTANTERROR: [0] 1. Error Block 93 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [296] 209. Error Block 61 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [296] 209. Error Block 61 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [84] 57. Error Block 9 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [296.15]
		-- KONSTANTERROR: [84] 57. Error Block 9 end (CF ANALYSIS FAILED)
	end;
	MountLookAngle = function(arg1, arg2) -- Line 333, Named "MountLookAngle"
		--[[ Upvalues[1]:
			[1]: Players_upvr (readonly)
		]]
		local Parent = arg2.Parent
		local var38 = Parent
		if var38 then
			var38 = arg1.Rotators[Parent]
		end
		if not var38 then
			local var42_upvw = {
				Motors = {};
				Pitch = {
					Goal = 0;
					Current = 0;
				};
				Yaw = {
					Goal = 0;
					Current = 0;
				};
			}
			if Players_upvr:GetPlayerFromCharacter(Parent) == arg1.Player then
				var42_upvw.SnapFirstPerson = true
			end
			arg1.Rotators[Parent] = var42_upvw
			for _, v in pairs(Parent:GetDescendants()) do
				if v:IsA("Motor6D") then
					arg1:AddMotor(var42_upvw, v)
				end
			end
			var42_upvw.Listener = Parent.DescendantAdded:Connect(function(arg1_3) -- Line 372, Named "onDescendantAdded"
				--[[ Upvalues[2]:
					[1]: arg1 (readonly)
					[2]: var42_upvw (read and write)
				]]
				if arg1_3:IsA("Motor6D") then
					arg1:AddMotor(var42_upvw, arg1_3)
				end
			end)
		end
		return var42_upvw
	end;
	MountMaterialSounds = function(arg1, arg2) -- Line 392, Named "MountMaterialSounds"
		--[[ Upvalues[2]:
			[1]: Util_upvr (readonly)
			[2]: RunService_upvr (readonly)
		]]
		local var47_upvr = arg2.Parent
		if var47_upvr then
			var47_upvr = arg2.Parent:WaitForChild("HumanoidRootPart", 10)
		end
		if not var47_upvr or not var47_upvr:IsA("BasePart") then
		else
			Util_upvr:PromiseChild(var47_upvr, "Running", function(arg1_4) -- Line 400
				--[[ Upvalues[4]:
					[1]: arg2 (readonly)
					[2]: var47_upvr (readonly)
					[3]: RunService_upvr (copied, readonly)
					[4]: arg1 (readonly)
				]]
				-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
				local var49
				if not arg1_4:IsA("Sound") then
				else
					local NumberValue_upvr = Instance.new("NumberValue")
					NumberValue_upvr.Name = "OldPitch"
					NumberValue_upvr.Parent = arg1_4
					NumberValue_upvr.Value = 1
					local function onStateChanged(arg1_5, arg2_2) -- Line 410
						--[[ Upvalues[5]:
							[1]: arg2 (copied, readonly)
							[2]: var47_upvr (copied, readonly)
							[3]: arg1_4 (readonly)
							[4]: NumberValue_upvr (readonly)
							[5]: RunService_upvr (copied, readonly)
						]]
						if arg2_2.Name:find("Running") then
							while arg2:GetState() == arg2_2 do
								local HipHeight = arg2.HipHeight
								if arg2.RigType.Name == "R6" then
									HipHeight = 2.8
								end
								local var52 = HipHeight / 3
								local Magnitude = (var47_upvr.Velocity * Vector3.new(1, 0, 1)).Magnitude
								arg1_4.Volume = math.clamp((Magnitude - 4) / 12 * var52, 0, 1)
								arg1_4.Pitch = (NumberValue_upvr.Value) / (var52 * 15 / Magnitude)
								RunService_upvr.Heartbeat:Wait()
							end
						end
					end
					var49 = "FloorMaterial"
					arg2:GetPropertyChangedSignal(var49):Connect(function() -- Line 433, Named "updateRunningSoundId"
						--[[ Upvalues[3]:
							[1]: arg1 (copied, readonly)
							[2]: arg2 (copied, readonly)
							[3]: arg1_4 (readonly)
						]]
						-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
						local Name = arg2.FloorMaterial.Name
						if not arg1.Sounds[Name] then
							Name = arg1.MaterialMap[Name]
						end
						if arg1.Sounds[Name] then
						end
						arg1_4.SoundId = "rbxassetid://"..arg1.Sounds[Name]
					end)
					arg1_4.EmitterSize = 1
					arg1_4.MaxDistance = 50
					var49 = arg1.Sounds
					var49 = arg2.FloorMaterial.Name
					if not arg1.Sounds[var49] then
						var49 = arg1.MaterialMap[var49]
					end
					if arg1.Sounds[var49] then
					end
					arg1_4.SoundId = "rbxassetid://"..arg1.Sounds[var49]
					arg2.StateChanged:Connect(onStateChanged)
					onStateChanged(nil, Enum.HumanoidStateType.Running)
				end
			end)
		end
	end;
	OnHumanoidAdded = function(arg1, arg2) -- Line 465, Named "OnHumanoidAdded"
		if arg2:IsA("Humanoid") then
			if not arg1.SkipLookAngle then
				arg1:MountLookAngle(arg2)
			end
			if not arg1.SkipMaterialSounds then
				arg1:MountMaterialSounds(arg2)
			end
		end
	end;
}
local Config_upvr = require(script.Config)
function tbl.Start(arg1) -- Line 481
	--[[ Upvalues[4]:
		[1]: Config_upvr (readonly)
		[2]: CollectionService_upvr (readonly)
		[3]: RunService_upvr (readonly)
		[4]: FpsCamera_upvr (readonly)
	]]
	assert(not _G.DefineRealismClient, "Realism can only be started once on the client!")
	_G.DefineRealismClient = true
	for i_2, v_2 in pairs(Config_upvr) do
		arg1[i_2] = v_2
	end
	for _, v_3 in pairs(CollectionService_upvr:GetTagged(arg1.BindTag)) do
		arg1:OnHumanoidAdded(v_3)
	end
	arg1:Connect("UpdateLookAngles", RunService_upvr.Heartbeat)
	arg1:Connect("OnLookReceive", arg1.SetLookAngles.OnClientEvent)
	arg1:Connect("OnHumanoidAdded", CollectionService_upvr:GetInstanceAddedSignal(arg1.BindTag))
	FpsCamera_upvr:Start()
end
if script:IsA("ModuleScript") then
	return tbl
end
assert(script:FindFirstAncestorOfClass("PlayerScripts"), "RealismClient must be a descendant of the PlayerScripts!")
assert(Players_upvr.LocalPlayer, "RealismClient expects a Player on the client to automatically start execution!")
tbl:Start()