--[[
    Script: StarterGui.TESTER_GUI.LocalScript
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:11
-- Luau version 6, Types version 3
-- Time taken: 0.000629 seconds

local PlaceId = game.PlaceId
local Parent = script.Parent
if game:GetService("RunService"):IsStudio() then
	Parent.Enabled = false
else
	if PlaceId == 98018823628597 or PlaceId == 133377094302868 then
		Parent.Enabled = true
	else
		Parent.Enabled = false
		return
	end
	for _, v in Parent:WaitForChild("ScreenIds"):GetChildren() do
		if v:IsA("TextLabel") then
			v.Text = tostring(game:GetService("Players").LocalPlayer.UserId)
		end
	end
end