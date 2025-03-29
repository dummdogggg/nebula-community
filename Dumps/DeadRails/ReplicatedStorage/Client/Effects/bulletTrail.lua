--[[
    Script: ReplicatedStorage.Client.Effects.bulletTrail
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:11
-- Luau version 6, Types version 3
-- Time taken: 0.000843 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local Workspace_upvr = game:GetService("Workspace")
local TweenService_upvr = game:GetService("TweenService")
return function(arg1, arg2) -- Line 7, Named "bulletTrail"
	--[[ Upvalues[3]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: Workspace_upvr (readonly)
		[3]: TweenService_upvr (readonly)
	]]
	local Magnitude = (arg1 - arg2).Magnitude
	local clone_upvr = ReplicatedStorage_upvr.Assets.BulletTrail:Clone()
	clone_upvr.CFrame = CFrame.lookAt(arg1, arg2)
	clone_upvr.StartAttachment.Position = Vector3.new(0, 0, 0)
	clone_upvr.EndAttachment.Position = Vector3.new(0, 0, -Magnitude)
	clone_upvr.Parent = Workspace_upvr
	local any_Create_result1 = TweenService_upvr:Create(clone_upvr.StartAttachment, TweenInfo.new(Magnitude / 400, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		Position = clone_upvr.EndAttachment.Position;
	})
	any_Create_result1:Play()
	any_Create_result1.Completed:Once(function() -- Line 20
		--[[ Upvalues[1]:
			[1]: clone_upvr (readonly)
		]]
		clone_upvr:Destroy()
	end)
end