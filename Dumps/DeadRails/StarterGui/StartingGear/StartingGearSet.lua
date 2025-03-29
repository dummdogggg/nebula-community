--[[
    Script: StarterGui.StartingGear.StartingGearSet
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:40
-- Luau version 6, Types version 3
-- Time taken: 0.001301 seconds

local PlayerDataController = require(game:GetService("ReplicatedStorage").Client.Controllers.PlayerDataController)
while not PlayerDataController.isPlayerDataLoaded() do
	task.wait()
end
local any_getPlayerDataReplica_result1 = PlayerDataController.getPlayerDataReplica()
local CleanedUpNames_upvr = require(game.ReplicatedStorage.Shared.DataBanks.CleanedUpNames)
local function setStartingGearList_upvr(arg1) -- Line 19, Named "setStartingGearList"
	--[[ Upvalues[1]:
		[1]: CleanedUpNames_upvr (readonly)
	]]
	for _, v in pairs(script.Parent.Frame.Frame:GetChildren()) do
		if v:IsA("Frame") then
			v:Destroy()
		end
	end
	for _, v_2 in arg1 do
		local SOME = script.Parent.Frame.Frame:FindFirstChild(v_2)
		if SOME then
			SOME.CountLabel.Text = 'x'..(SOME:GetAttribute("Count") + 1)
			SOME:SetAttribute("Count", SOME:GetAttribute("Count") + 1)
		else
			local clone = game.ReplicatedStorage.Assets.StartingGearFrame:Clone()
			clone.Parent = script.Parent.Frame.Frame
			clone.Name = v_2
			clone:SetAttribute("Count", 1)
			clone.ItemLabel.Text = CleanedUpNames_upvr[v_2] or v_2
		end
	end
end
setStartingGearList_upvr(any_getPlayerDataReplica_result1.Data.inventory)
any_getPlayerDataReplica_result1:OnSet({"inventory"}, function(arg1, arg2) -- Line 44
	--[[ Upvalues[1]:
		[1]: setStartingGearList_upvr (readonly)
	]]
	setStartingGearList_upvr(arg1)
end)