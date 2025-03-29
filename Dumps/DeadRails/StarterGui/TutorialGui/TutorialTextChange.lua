--[[
    Script: StarterGui.TutorialGui.TutorialTextChange
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:56
-- Luau version 6, Types version 3
-- Time taken: 0.000930 seconds

local tbl_upvr = {"Drag gold bar to the table to sell it (0/1)", "Buy coal from the general store (0/1)", "Use the coal to refuel the train (0/1)"}
local tbl_upvr_2 = {Vector3.new(128.526, 28.25, 29924.8), Vector3.new(128.526, 28.25, 29800), Vector3.new(56.5270, 28.25, 29886.8)}
if require(game.ReplicatedStorage.Client.Controllers.ActionController.InputCategorizer).getLastInputCategory() == "KeyboardAndMouse" then
	script.Parent.MouseUnlockText.Visible = true
end
local clone_upvr = game.ReplicatedStorage.Assets.ObjectiveMarker:Clone()
clone_upvr.Parent = game.Workspace
local TutorialStep = game.ReplicatedStorage.TutorialStep
if TutorialStep.Value == 4 then
	script.Parent.TutorialText.Visible = false
	clone_upvr:Destroy()
	script.Parent.MouseUnlockText.Visible = false
end
clone_upvr.Position = tbl_upvr_2[TutorialStep.Value]
script.Parent.TutorialText.Text = tbl_upvr[TutorialStep.Value]
TutorialStep.Changed:Connect(function(arg1) -- Line 34
	--[[ Upvalues[3]:
		[1]: clone_upvr (readonly)
		[2]: tbl_upvr_2 (readonly)
		[3]: tbl_upvr (readonly)
	]]
	if arg1 == 4 then
		script.Parent.TutorialText.Visible = false
		clone_upvr:Destroy()
		script.Parent.MouseUnlockText.Visible = false
	else
		clone_upvr.Position = tbl_upvr_2[arg1]
		script.Parent.TutorialText.Text = tbl_upvr[arg1]
	end
end)