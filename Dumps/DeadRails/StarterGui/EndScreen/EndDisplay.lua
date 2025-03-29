--[[
    Script: StarterGui.EndScreen.EndDisplay
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = false;
game.ReplicatedStorage.ReturnTime.Changed:Connect(function(v1) --[[ Line: 3 ]]
    script.Parent.EndFrame.BottomFrame.Visible = true;
    script.Parent.EndFrame.BottomFrame.ReturnTime.Text = "Returning in " .. game.ReplicatedStorage.ReturnTime.Value .. " seconds";
    if v1 == 0 then
        script.Parent.EndFrame.BottomFrame.ReviveEveryoneButton.Visible = false;
    end;
end);
game.ReplicatedStorage.ReturningPlayers.Changed:Connect(function(v2) --[[ Line: 15 ]]
    script.Parent.EndFrame.BottomFrame.PlayAgainButton.Text = "Play again with same team (" .. v2 .. "/" .. #game.Players:GetPlayers() .. ")";
end);
script.Parent.EndFrame.BottomFrame.PlayAgainButton.Activated:Connect(function() --[[ Line: 21 ]]
    game.ReplicatedStorage.Remotes.EndDecision:FireServer(false);
end);
script.Parent.EndFrame.BottomFrame.ReviveEveryoneButton.Activated:Connect(function() --[[ Line: 25 ]]
    game.ReplicatedStorage.Remotes.EndDecision:FireServer(true);
end);
game.ReplicatedStorage.Remotes.EndGame.OnClientEvent:Connect(function(v3, v4) --[[ Line: 30 ]]
    -- upvalues: v0 (ref)
    if v0 then
        return;
    else
        v0 = true;
        if v4 then
            script.Parent.EndFrame.TopFrame.TitleLabel.TextColor3 = Color3.fromRGB(61, 194, 0);
            script.Parent.EndFrame.TopFrame.TitleLabel.Text = "You Escaped!";
            v3 = 80000;
            script.Parent.EndFrame.BottomFrame.ReviveEveryoneButton.Visible = false;
            script.Parent.EndFrame.BottomFrame.PlayAgainButton.Visible = false;
        end;
        script.Parent.EndFrame.BottomFrame.PlayAgainButton.Text = "Play again with same team (" .. game.ReplicatedStorage.ReturningPlayers.Value .. "/" .. #game.Players:GetPlayers() .. ")";
        script.Parent.Enabled = true;
        script.Parent.Revolver:Play();
        script.Parent.EndSong:Play();
        game.SoundService.Battle.Volume = 0;
        if not v3 then
            script.Parent.EndFrame.TopFrame.FinalDistanceLabel.Visible = false;
            return;
        else
            script.Parent.EndFrame.TopFrame.FinalDistanceLabel.Text = "Final Distance: " .. v3 .. " m";
            return;
        end;
    end;
end);