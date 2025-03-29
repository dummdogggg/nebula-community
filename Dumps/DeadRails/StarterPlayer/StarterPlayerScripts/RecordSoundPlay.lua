--[[
    Script: StarterPlayer.StarterPlayerScripts.RecordSoundPlay
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

game.ReplicatedStorage.Remotes.EndDecision.OnClientEvent:Connect(function() --[[ Line: 1 ]]
    game.SoundService.RecordScratch:Play();
end);