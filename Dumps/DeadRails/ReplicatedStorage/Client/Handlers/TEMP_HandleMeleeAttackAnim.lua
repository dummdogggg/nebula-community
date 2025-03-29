--[[
    Script: ReplicatedStorage.Client.Handlers.TEMP_HandleMeleeAttackAnim
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:33
-- Luau version 6, Types version 3
-- Time taken: 0.000499 seconds

require(game:GetService("ReplicatedStorage").Shared.Remotes).Events.TEMP_PlayMeleeAttack.OnClientEvent:Connect(function(arg1, arg2) -- Line 5, Named "onPlayMeleeAttack"
	local class_Animator = arg1:FindFirstChildOfClass("Animator")
	if class_Animator then
		class_Animator:LoadAnimation(arg2):Play()
	else
		warn(`Cannot PlayMeleeAttack; Missing animator: {arg1:GetFullName()}`)
	end
end)