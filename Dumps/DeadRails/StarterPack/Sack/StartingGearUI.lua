--[[
    Script: StarterPack.Sack.StartingGearUI
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:43
-- Luau version 6, Types version 3
-- Time taken: 0.000449 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
script.Parent.Equipped:Connect(function() -- Line 4
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	LocalPlayer_upvr.PlayerGui.StartingGear.Enabled = true
end)
script.Parent.Unequipped:Connect(function() -- Line 8
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	LocalPlayer_upvr.PlayerGui.StartingGear.Enabled = false
end)