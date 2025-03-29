--[[
    Script: StarterGui.AntiFling.TextPopup
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:07
-- Luau version 6, Types version 3
-- Time taken: 0.000699 seconds

game.ReplicatedStorage.Remotes.FlingText.OnClientEvent:Connect(function(arg1, arg2) -- Line 1
	local var2 = "Elevation = "
	if arg1 then
		var2 = "Speed = "
	end
	script.Parent.Reason.Text = var2..math.floor(arg2)
	script.Parent.Enabled = true
	task.wait(5)
	script.Parent.Enabled = false
end)