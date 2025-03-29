--[[
    Script: StarterPlayer.StarterPlayerScripts.ContentCreatorMusicMute
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local _ = game.Players.LocalPlayer;
game.TextChatService.ContentCreatorMute.Triggered:Connect(function() --[[ Line: 3 ]]
    game.SoundService.Battle:Stop();
    if game.SoundService.Battle:GetAttribute("Muted") == true then
        game.SoundService.Battle:SetAttribute("Muted", false);
        return;
    else
        game.SoundService.Battle:SetAttribute("Muted", true);
        return;
    end;
end);