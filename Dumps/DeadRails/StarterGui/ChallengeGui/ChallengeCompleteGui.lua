--[[
    Script: StarterGui.ChallengeGui.ChallengeCompleteGui
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:08
-- Luau version 6, Types version 3
-- Time taken: 0.001023 seconds

local ChallengeData_upvr = require(game.ReplicatedStorage.Shared.DataBanks.ChallengeData)
local TweenService_upvr = game:GetService("TweenService")
local TweenInfo_new_result1_upvr = TweenInfo.new(0.5, Enum.EasingStyle.Quad)
game.ReplicatedStorage.Remotes.ChallengeCompleted.OnClientEvent:Connect(function(arg1) -- Line 8
	--[[ Upvalues[3]:
		[1]: ChallengeData_upvr (readonly)
		[2]: TweenService_upvr (readonly)
		[3]: TweenInfo_new_result1_upvr (readonly)
	]]
	local var5 = ChallengeData_upvr[arg1]
	if not var5 then
		warn("Data not found", arg1)
	else
		script.Parent.ChallengeTemplate.Title.Text = var5.Title
		script.Parent.ChallengeTemplate.Description.Text = var5.Description
		script.Parent.ChallengeTemplate.RewardFrame.BondFrame.BondCount.Text = var5.Rewards.Bonds
		script.Parent.ChallengeTemplate.RewardFrame.StarFrame.StarCount.Text = var5.Rewards.Stars
		TweenService_upvr:Create(script.Parent.ChallengeTemplate, TweenInfo_new_result1_upvr, {
			Position = UDim2.fromScale(0.105, 0.159);
		}):Play()
		task.wait(7)
		TweenService_upvr:Create(script.Parent.ChallengeTemplate, TweenInfo_new_result1_upvr, {
			Position = UDim2.fromScale(-0.105, 0.159);
		}):Play()
	end
end)