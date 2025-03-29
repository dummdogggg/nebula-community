--[[
    Script: Workspace.Train.TrainFix
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:43:53
-- Luau version 6, Types version 3
-- Time taken: 0.001363 seconds

return {
	GetClosestRailToPlayer = function() -- Line 5, Named "GetClosestRailToPlayer"
		local var30
		for _, v in pairs(game.Players:GetPlayers()) do
			local Character_2 = v.Character
			if Character_2 then
				for _, v_2 in pairs(game.Workspace.RailSegments:GetChildren()) do
					local Magnitude = (v_2:GetPivot().Position - Character_2.HumanoidRootPart.Position).Magnitude
					if Magnitude < math.huge then
						if Magnitude < 50 then
							return v_2
						end
					end
				end
			end
		end
		return nil
	end;
}