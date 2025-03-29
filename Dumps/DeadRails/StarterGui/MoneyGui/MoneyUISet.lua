--[[
    Script: StarterGui.MoneyGui.MoneyUISet
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:59
-- Luau version 6, Types version 3
-- Time taken: 0.000376 seconds

local leaderstats = game.Players.LocalPlayer:WaitForChild("leaderstats")
script.Parent.Money.Text = '$'..leaderstats.Money.Value
leaderstats.Money.Changed:Connect(function(arg1) -- Line 7
	script.Parent.Money.Text = '$'..arg1
end)