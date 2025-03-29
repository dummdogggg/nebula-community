--[[
    Script: StarterPlayer.StarterPlayerScripts.WheelMove
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:17
-- Luau version 6, Types version 3
-- Time taken: 0.000586 seconds

print("Helllooo world")
while true do
	task.wait(0.1)
	for _, v in pairs(game:GetService("CollectionService"):GetTagged("WheelBase")) do
		if v:IsDescendantOf(workspace) and v:FindFirstChild("Axel") then
			v.Axel.HingeConstraint.ActuatorType = Enum.ActuatorType.Motor
			local Magnitude = v.Axel.AssemblyLinearVelocity.Magnitude
			local var7 = Magnitude / 1.8
			print(Magnitude, var7)
			v.Axel.HingeConstraint.AngularVelocity = var7 * 10
		end
	end
end