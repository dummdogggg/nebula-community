--[[
    Script: StarterGui.ChallengeGui.ChallengeCompleteGui
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local _ = game.Players.LocalPlayer;
local l_TweenService_0 = game:GetService("TweenService");
local v2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad);
local v3 = require(game.ReplicatedStorage.Shared.DataBanks.ChallengeData);
game.ReplicatedStorage.Remotes.ChallengeCompleted.OnClientEvent:Connect(function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), l_TweenService_0 (copy), v2 (copy)
    local v5 = v3[v4];
    if not v5 then
        warn("Data not found", v4);
        return;
    else
        script.Parent.ChallengeTemplate.Title.Text = v5.Title;
        script.Parent.ChallengeTemplate.Description.Text = v5.Description;
        script.Parent.ChallengeTemplate.RewardFrame.BondFrame.BondCount.Text = v5.Rewards.Bonds;
        script.Parent.ChallengeTemplate.RewardFrame.StarFrame.StarCount.Text = v5.Rewards.Stars;
        l_TweenService_0:Create(script.Parent.ChallengeTemplate, v2, {
            Position = UDim2.fromScale(0.105, 0.159)
        }):Play();
        task.wait(7);
        l_TweenService_0:Create(script.Parent.ChallengeTemplate, v2, {
            Position = UDim2.fromScale(-0.105, 0.159)
        }):Play();
        return;
    end;
end);