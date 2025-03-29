--[[
    Script: StarterPlayer.StarterPlayerScripts.RealismClient.FpsCamera
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:33
-- Luau version 6, Types version 3
-- Time taken: 0.008825 seconds

local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local module_upvr = {
	HeadMirrors = {};
	HeadAttachments = {
		FaceCenterAttachment = true;
		FaceFrontAttachment = true;
		HairAttachment = true;
		HatAttachment = true;
	};
	InvalidRotationStates = {
		Swimming = true;
		Climbing = true;
		Dead = true;
	};
	Warn = function(arg1, ...) -- Line 42, Named "Warn"
		warn("[FpsCamera]", ...)
	end;
	Connect = function(arg1, arg2, arg3) -- Line 49, Named "Connect"
		return arg3:Connect(function(...) -- Line 50
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: arg2 (readonly)
			]]
			arg1[arg2](arg1, ...)
		end)
	end;
	IsInFirstPerson = function(arg1) -- Line 58, Named "IsInFirstPerson"
		local CurrentCamera = workspace.CurrentCamera
		if CurrentCamera then
			if CurrentCamera.CameraType.Name == "Scriptable" then
				return false
			end
			local CFrame_3 = CurrentCamera.CFrame
			if (CurrentCamera.Focus.Position - CFrame_3.Position).Magnitude > 1 then
				CFrame_3 = false
			else
				CFrame_3 = true
			end
			return CFrame_3
		end
		return false
	end;
	GetSubjectPosition = function(arg1) -- Line 78, Named "GetSubjectPosition"
		if arg1:IsInFirstPerson() then
			local CameraSubject = workspace.CurrentCamera.CameraSubject
			if CameraSubject and CameraSubject:IsA("Humanoid") then
				local var13
				if var13 < CameraSubject.Health then
					var13 = CameraSubject.Parent
					if var13 then
						var13 = CameraSubject.Parent:FindFirstChild("Head")
					end
					if var13 and var13:IsA("BasePart") then
						local CFrame = var13.CFrame
						return (CFrame * CFrame.new(0, var13.Size.Y / 3, 0)).Position, CFrame.LookVector
					end
				end
			end
		end
		return arg1:GetBaseSubjectPosition()
	end;
	IsValidPartToModify = function(arg1, arg2) -- Line 102, Named "IsValidPartToModify"
		local var32
		if arg2:FindFirstAncestorOfClass("Tool") then
			return false
		end
		if var32:IsA("Decal") then
			var32 = var32.Parent
		end
		if var32 and var32:IsA("BasePart") then
			local class_Accoutrement = var32:FindFirstAncestorWhichIsA("Accoutrement")
			if class_Accoutrement then
				if var32.Name ~= "Handle" then
					local Handle = class_Accoutrement:FindFirstChild("Handle", true)
					if Handle and Handle:IsA("BasePart") then
						var32 = Handle
					end
				end
				for i, v in pairs(var32:GetChildren()) do
					if v:IsA("Attachment") and arg1.HeadAttachments[v.Name] then
						return true
					end
				end
			else
				local var38
				if var32.Name == "Head" then
					var38 = workspace
					var38 = var32.Parent
					if var38 then
						v = "Humanoid"
						var38 = var32.Parent:FindFirstChildOfClass(v)
					end
					if var38 then
						i = var38.CurrentCamera.CameraSubject
						if i == var38 then
							i = true
							return i
						end
					end
				end
			end
		end
		return false
	end;
	MountBaseCamera = function(arg1, arg2) -- Line 147, Named "MountBaseCamera"
		local GetSubjectPosition = arg2.GetSubjectPosition
		arg1.GetBaseSubjectPosition = GetSubjectPosition
		if GetSubjectPosition then
			arg2.GetBaseSubjectPosition = GetSubjectPosition
			arg2.GetSubjectPosition = arg1.GetSubjectPosition
		else
			arg1:Warn("MountBaseCamera - Could not find BaseCamera:GetSubjectPosition()!")
		end
	end;
}
function module_upvr.UpdateTransparency(arg1, ...) -- Line 162
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var42
	if arg1 == module_upvr then
		var42 = false
	else
		var42 = true
	end
	assert(var42)
	arg1:BaseUpdate(...)
	if arg1.ForceRefresh then
		arg1.ForceRefresh = false
		if arg1.SetSubject then
			var42 = workspace
			var42 = arg1:SetSubject
			var42(var42.CurrentCamera.CameraSubject)
		end
	end
end
function module_upvr.SetupTransparency(arg1, arg2, ...) -- Line 179
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var43
	if arg1 == module_upvr then
		var43 = false
	else
		var43 = true
	end
	assert(var43)
	arg1:BaseSetupTransparency(arg2, ...)
	if arg1.AttachmentListener then
		arg1.AttachmentListener:Disconnect()
	end
	arg1.AttachmentListener = arg2.DescendantAdded:Connect(function(arg1_2) -- Line 187
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_2:IsA("Attachment") and arg1.HeadAttachments[arg1_2.Name] then
			if typeof(arg1.cachedParts) == "table" then
				arg1.cachedParts[arg1_2.Parent] = true
			end
			if arg1.transparencyDirty ~= nil then
				arg1.transparencyDirty = true
			end
		end
	end)
end
function module_upvr.MountTransparency(arg1, arg2) -- Line 204
	local Update = arg2.Update
	if Update then
		arg2.BaseUpdate = Update
		arg2.Update = arg1.UpdateTransparency
	else
		arg1:Warn("MountTransparency - Could not find Transparency:Update()!")
	end
	if arg2.IsValidPartToModify then
		arg2.IsValidPartToModify = arg1.IsValidPartToModify
		arg2.HeadAttachments = arg1.HeadAttachments
		arg2.ForceRefresh = true
	else
		arg1:Warn("MountTransparency - Could not find Transparency:IsValidPartToModify(part)!")
	end
	if arg2.SetupTransparency then
		arg2.BaseSetupTransparency = arg2.SetupTransparency
		arg2.SetupTransparency = arg1.SetupTransparency
	else
		arg1:Warn("MountTransparency - Could not find Transparency:SetupTransparency(character)!")
	end
end
local Lighting_upvr = game:GetService("Lighting")
function module_upvr.GetShadowAngle(arg1) -- Line 233
	--[[ Upvalues[1]:
		[1]: Lighting_upvr (readonly)
	]]
	local any_GetSunDirection_result1 = Lighting_upvr:GetSunDirection()
	if any_GetSunDirection_result1.Y < -0.3 then
		any_GetSunDirection_result1 = Lighting_upvr:GetMoonDirection()
	end
	return any_GetSunDirection_result1
end
function module_upvr.MirrorProperty(arg1, arg2, arg3, arg4) -- Line 247
	arg2:GetPropertyChangedSignal(arg4):Connect(function() -- Line 248
		--[[ Upvalues[3]:
			[1]: arg3 (readonly)
			[2]: arg4 (readonly)
			[3]: arg2 (readonly)
		]]
		arg3[arg4] = arg2[arg4]
	end)
end
function module_upvr.AddHeadMirror(arg1, arg2) -- Line 256
	if arg2:IsA("BasePart") and arg1:IsValidPartToModify(arg2) then
		local clone_2_upvr = arg2:Clone()
		clone_2_upvr:ClearAllChildren()
		clone_2_upvr.Locked = true
		clone_2_upvr.Anchored = true
		clone_2_upvr.CanCollide = false
		clone_2_upvr.Parent = arg1.MirrorBin
		for _, v_2 in pairs(arg2:GetChildren()) do
			local var59
			if v_2:IsA("DataModelMesh") then
				var59 = "Scale"
			elseif v_2:IsA("Decal") then
				var59 = "Transparency"
			end
			if var59 then
				local clone = v_2:Clone()
				clone.Parent = clone_2_upvr
				arg1:MirrorProperty(v_2, clone, var59)
			end
		end
		arg1.HeadMirrors[arg2] = clone_2_upvr
		arg1:MirrorProperty(arg2, clone_2_upvr, "Transparency")
		arg2.ChildAdded:Connect(function(arg1_3) -- Line 266, Named "onChildAdded"
			--[[ Upvalues[2]:
				[1]: clone_2_upvr (readonly)
				[2]: arg1 (readonly)
			]]
			local var54
			if arg1_3:IsA("DataModelMesh") then
				var54 = "Scale"
			elseif arg1_3:IsA("Decal") then
				var54 = "Transparency"
			end
			if var54 then
				local clone_3 = arg1_3:Clone()
				clone_3.Parent = clone_2_upvr
				arg1:MirrorProperty(arg1_3, clone_3, var54)
			end
		end)
	end
end
function module_upvr.RemoveHeadMirror(arg1, arg2) -- Line 298
	local var61 = arg1.HeadMirrors[arg2]
	if var61 then
		var61:Destroy()
		arg1.HeadMirrors[arg2] = nil
	end
end
local RunService_upvr = game:GetService("RunService")
function module_upvr.OnRotationTypeChanged(arg1) -- Line 311
	--[[ Upvalues[2]:
		[1]: UserGameSettings_upvr (readonly)
		[2]: RunService_upvr (readonly)
	]]
	local CurrentCamera_upvr = workspace.CurrentCamera
	local var64_upvr
	if var64_upvr then
		var64_upvr = CurrentCamera_upvr.CameraSubject
	end
	if var64_upvr and var64_upvr:IsA("Humanoid") then
		if UserGameSettings_upvr.RotationType == Enum.RotationType.CameraRelative then
			var64_upvr.AutoRotate = false
			RunService_upvr:BindToRenderStep("FpsCamera", 1000, function(arg1_4) -- Line 321
				--[[ Upvalues[4]:
					[1]: var64_upvr (readonly)
					[2]: RunService_upvr (copied, readonly)
					[3]: CurrentCamera_upvr (readonly)
					[4]: arg1 (readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [23] 18. Error Block 39 start (CF ANALYSIS FAILED)
				RunService_upvr:UnbindFromRenderStep("FpsCamera")
				do
					return
				end
				-- KONSTANTERROR: [23] 18. Error Block 39 end (CF ANALYSIS FAILED)
			end)
			return
		end
		var64_upvr.AutoRotate = true
		arg1.MirrorBin.Parent = nil
	end
end
function module_upvr.OnCharacterAdded(arg1, arg2) -- Line 398
	local MirrorBin = arg1.MirrorBin
	if MirrorBin then
		MirrorBin:ClearAllChildren()
		MirrorBin.Parent = nil
	end
	arg1.HeadMirrors = {}
	for _, v_3 in pairs(arg2:GetDescendants()) do
		arg1:AddHeadMirror(v_3)
	end
	arg1:Connect("AddHeadMirror", arg2.DescendantAdded)
	arg1:Connect("RemoveHeadMirror", arg2.DescendantRemoving)
end
local var72_upvw = false
local Players_upvr = game:GetService("Players")
function module_upvr.Start(arg1) -- Line 421
	--[[ Upvalues[3]:
		[1]: var72_upvw (read and write)
		[2]: Players_upvr (readonly)
		[3]: UserGameSettings_upvr (readonly)
	]]
	if var72_upvw then
	else
		var72_upvw = true
		local LocalPlayer = Players_upvr.LocalPlayer
		local Character = LocalPlayer.Character
		local PlayerModule = LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
		local BaseCamera = PlayerModule:FindFirstChild("BaseCamera", true)
		local TransparencyController = PlayerModule:FindFirstChild("TransparencyController", true)
		if BaseCamera and BaseCamera:IsA("ModuleScript") then
			arg1:MountBaseCamera(require(BaseCamera))
		else
			arg1:Warn("Start - Could not find BaseCamera module!")
		end
		if TransparencyController and TransparencyController:IsA("ModuleScript") then
			arg1:MountTransparency(require(TransparencyController))
		else
			arg1:Warn("Start - Cound not find TransparencyController module!")
		end
		arg1:Connect("OnRotationTypeChanged", UserGameSettings_upvr:GetPropertyChangedSignal("RotationType"))
		arg1.MirrorBin = Instance.new("Folder")
		arg1.MirrorBin.Name = "HeadMirrors"
		if Character then
			arg1:OnCharacterAdded(Character)
		end
		arg1:Connect("OnCharacterAdded", LocalPlayer.CharacterAdded)
	end
end
return module_upvr