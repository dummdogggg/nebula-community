--[[
    Script: ReplicatedStorage.Client.Handlers.ControllerAimAssistHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:18
-- Luau version 6, Types version 3
-- Time taken: 0.002536 seconds

local validateLivingCharacter_upvr = require(game:GetService("ReplicatedStorage").Shared.Utils.TypeValidators.validateLivingCharacter)
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local CurrentCamera_upvr = workspace.CurrentCamera
local var4_upvw = false
local CollectionService_upvr = game:GetService("CollectionService")
local function getAimAssistTarget_upvr() -- Line 23, Named "getAimAssistTarget"
	--[[ Upvalues[4]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: validateLivingCharacter_upvr (readonly)
		[3]: CollectionService_upvr (readonly)
		[4]: CurrentCamera_upvr (readonly)
	]]
	local Character = LocalPlayer_upvr.Character
	local var22
	if not validateLivingCharacter_upvr(Character) then return end
	var22 = nil
	for _, v in CollectionService_upvr:GetTagged("Enemy") do
		if validateLivingCharacter_upvr(v) then
			local HumanoidRootPart_2 = v:FindFirstChild("HumanoidRootPart")
			if not HumanoidRootPart_2 then return end
			if (HumanoidRootPart_2.Position - Character.HumanoidRootPart.Position).Magnitude < 200 then
				if math.deg(math.acos(CurrentCamera_upvr.CFrame.LookVector:Dot((HumanoidRootPart_2.Position - CurrentCamera_upvr.CFrame.Position).Unit))) < 10 then
					var22 = HumanoidRootPart_2
				end
			end
		end
	end
	return var22
end
local function canEnableAimAssist_upvr() -- Line 68, Named "canEnableAimAssist"
	--[[ Upvalues[2]:
		[1]: validateLivingCharacter_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	if not validateLivingCharacter_upvr(LocalPlayer_upvr.Character) then
		return false
	end
	for _, v_2 in LocalPlayer_upvr.Character:GetChildren() do
		if v_2:IsA("Tool") and v_2:HasTag("Weapon") then
			return true
		end
	end
	return false
end
game:GetService("ContextActionService"):BindAction("AimAssist", function(arg1, arg2, arg3) -- Line 84, Named "onAim"
	--[[ Upvalues[1]:
		[1]: var4_upvw (read and write)
	]]
	if arg2 == Enum.UserInputState.Begin then
		var4_upvw = true
	elseif arg2 == Enum.UserInputState.End then
		var4_upvw = false
	end
	return Enum.ContextActionResult.Pass
end, false, Enum.KeyCode.ButtonL2)
game:GetService("RunService").RenderStepped:Connect(function() -- Line 96
	--[[ Upvalues[4]:
		[1]: var4_upvw (read and write)
		[2]: canEnableAimAssist_upvr (readonly)
		[3]: getAimAssistTarget_upvr (readonly)
		[4]: CurrentCamera_upvr (readonly)
	]]
	if var4_upvw then
		if not canEnableAimAssist_upvr() then return end
		local getAimAssistTarget_result1 = getAimAssistTarget_upvr()
		if getAimAssistTarget_result1 then
			local CFrame = CurrentCamera_upvr.CFrame
			CurrentCamera_upvr.CFrame = CFrame.new(CFrame.Position, CFrame.Position + CFrame.LookVector:Lerp((getAimAssistTarget_result1.Position - CFrame.Position).Unit, 0.1))
		end
	end
end)