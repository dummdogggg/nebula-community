--[[
    Script: StarterGui.EndScreen.EndDisplay
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:58
-- Luau version 6, Types version 3
-- Time taken: 0.001689 seconds

game.ReplicatedStorage.ReturnTime.Changed:Connect(function(arg1) -- Line 3
	script.Parent.EndFrame.BottomFrame.Visible = true
	script.Parent.EndFrame.BottomFrame.ReturnTime.Text = "Returning in "..game.ReplicatedStorage.ReturnTime.Value.." seconds"
	if arg1 == 0 then
		script.Parent.EndFrame.BottomFrame.ReviveEveryoneButton.Visible = false
	end
end)
game.ReplicatedStorage.ReturningPlayers.Changed:Connect(function(arg1) -- Line 15
	script.Parent.EndFrame.BottomFrame.PlayAgainButton.Text = "Play again with same team ("..arg1..'/'..(#game.Players:GetPlayers())..')'
end)
script.Parent.EndFrame.BottomFrame.PlayAgainButton.Activated:Connect(function() -- Line 21
	game.ReplicatedStorage.Remotes.EndDecision:FireServer(false)
end)
script.Parent.EndFrame.BottomFrame.ReviveEveryoneButton.Activated:Connect(function() -- Line 25
	game.ReplicatedStorage.Remotes.EndDecision:FireServer(true)
end)
local var6_upvw = false
game.ReplicatedStorage.Remotes.EndGame.OnClientEvent:Connect(function(arg1, arg2) -- Line 30
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	local var7
	if var6_upvw then
	else
		var6_upvw = true
		if arg2 then
			script.Parent.EndFrame.TopFrame.TitleLabel.TextColor3 = Color3.fromRGB(61, 194, 0)
			script.Parent.EndFrame.TopFrame.TitleLabel.Text = "You Escaped!"
			var7 = 80000
			script.Parent.EndFrame.BottomFrame.ReviveEveryoneButton.Visible = false
			script.Parent.EndFrame.BottomFrame.PlayAgainButton.Visible = false
		end
		script.Parent.EndFrame.BottomFrame.PlayAgainButton.Text = "Play again with same team ("..game.ReplicatedStorage.ReturningPlayers.Value..'/'..(#game.Players:GetPlayers())..')'
		script.Parent.Enabled = true
		script.Parent.Revolver:Play()
		script.Parent.EndSong:Play()
		game.SoundService.Battle.Volume = 0
		if not var7 then
			script.Parent.EndFrame.TopFrame.FinalDistanceLabel.Visible = false
			return
		end
		script.Parent.EndFrame.TopFrame.FinalDistanceLabel.Text = "Final Distance: "..var7.." m"
	end
end)