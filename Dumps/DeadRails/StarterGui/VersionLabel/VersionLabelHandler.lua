--[[
    Script: StarterGui.VersionLabel.VersionLabelHandler
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:00
-- Luau version 6, Types version 3
-- Time taken: 0.000628 seconds

local TextLabel = script.Parent:WaitForChild("TextLabel")
local game = game
local var3
if game.PlaceId ~= 133377094302868 then
	game = false
else
	game = true
end
if game then
	var3 = Color3.fromRGB(255, 0, 0)
else
	var3 = Color3.fromRGB(225, 225, 225)
end
TextLabel.TextColor3 = var3
var3 = `v{game:GetService("ReplicatedStorage"):GetAttribute("ServerVersion")}.{game.PlaceVersion}`
TextLabel.Text = var3