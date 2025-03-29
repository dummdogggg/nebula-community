--[[
    Script: StarterPlayer.StarterPlayerScripts.ContentCreatorMusicMute
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:35
-- Luau version 6, Types version 3
-- Time taken: 0.000472 seconds

game.TextChatService.ContentCreatorMute.Triggered:Connect(function() -- Line 3
	game.SoundService.Battle:Stop()
	if game.SoundService.Battle:GetAttribute("Muted") == true then
		game.SoundService.Battle:SetAttribute("Muted", false)
	else
		game.SoundService.Battle:SetAttribute("Muted", true)
	end
end)