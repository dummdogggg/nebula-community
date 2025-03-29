--[[
    Script: StarterPlayer.StarterPlayerScripts.TrainReplication
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:16
-- Luau version 6, Types version 3
-- Time taken: 0.000448 seconds

local VisualTrain_upvr = game.Workspace:WaitForChild("VisualTrain")
local Train_upvr = game.Workspace:WaitForChild("Train")
game:GetService("RunService").Heartbeat:Connect(function() -- Line 8
	--[[ Upvalues[2]:
		[1]: VisualTrain_upvr (readonly)
		[2]: Train_upvr (readonly)
	]]
	print(1)
	VisualTrain_upvr:PivotTo(Train_upvr.Leader:GetPivot())
end)