--[[
    Script: StarterGui.WaitingGui.ExitButton.Exit
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:37
-- Luau version 6, Types version 3
-- Time taken: 0.000711 seconds

local Character = game.Players.LocalPlayer.Character
if not Character then
	Character = game.Players.LocalPlayer.CharacterAdded:Wait()
end
Character.AttributeChanged:Connect(function(arg1) -- Line 4
	if arg1 ~= "Waiting" then
	else
		script.Parent.Parent.Enabled = true
	end
end)
script.Parent.Activated:Connect(function() -- Line 12
	game.ReplicatedStorage.Remotes.Reset:FireServer()
end)