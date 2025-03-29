--[[
    Script: StarterGui.ChallengeGui.ChallengeUISet
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:42
-- Luau version 6, Types version 3
-- Time taken: 0.002160 seconds

local var1_upvw = false
local function clearAllTemplates_upvr() -- Line 5, Named "clearAllTemplates"
	for _, v in pairs(script.Parent.ChallengeFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") then
			v:Destroy()
		end
	end
end
local PlayerDataController = require(game:GetService("ReplicatedStorage").Client.Controllers.PlayerDataController)
PlayerDataController.waitForDataLoadAsync()
local ChallengeData_upvr = require(game.ReplicatedStorage.Shared.DataBanks.ChallengeData)
local any_getPlayerDataReplica_result1_upvr = PlayerDataController.getPlayerDataReplica()
game.ReplicatedStorage.Remotes.ChallengeUI.OnClientEvent:Connect(function() -- Line 22
	--[[ Upvalues[4]:
		[1]: var1_upvw (read and write)
		[2]: clearAllTemplates_upvr (readonly)
		[3]: ChallengeData_upvr (readonly)
		[4]: any_getPlayerDataReplica_result1_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if var1_upvw then
	else
		var1_upvw = true
		clearAllTemplates_upvr()
		script.Parent.ChallengeFrame.Visible = true
		local tbl = {}
		for i_2, v_2 in pairs(ChallengeData_upvr) do
			tbl[#tbl + 1] = {
				key = i_2;
				value = v_2.Rewards.Stars;
			}
			local var32
		end
		table.sort(var32, function(arg1, arg2) -- Line 37
			local var34
			if arg1.value >= arg2.value then
				var34 = false
			else
				var34 = true
			end
			return var34
		end)
		for _, v_3 in pairs(var32) do
			local var38 = ChallengeData_upvr[v_3.key]
			local clone = game.ReplicatedStorage.Assets.ChallengeTemplate:Clone()
			clone.Parent = script.Parent.ChallengeFrame.ScrollingFrame
			clone.Title.Text = var38.Title
			clone.Description.Text = var38.Description
			clone.RewardFrame.BondFrame.BondCount.Text = var38.Rewards.Bonds
			clone.RewardFrame.StarFrame.StarCount.Text = var38.Rewards.Stars
			if any_getPlayerDataReplica_result1_upvr.Data.challenges[v_3.key] then
				clone.Completed.TextColor3 = Color3.fromRGB(68, 255, 0)
				clone.Completed.Text = "Completed"
			end
		end
	end
end)
script.Parent.ChallengeFrame.ExitButton.Activated:Connect(function() -- Line 61
	--[[ Upvalues[1]:
		[1]: var1_upvw (read and write)
	]]
	script.Parent.ChallengeFrame.Visible = false
	var1_upvw = false
end)