--[[
    Script: ReplicatedStorage.Assets.ObjectiveMarker.BillboardGui.Animate
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:28
-- Luau version 6, Types version 3
-- Time taken: 0.000548 seconds

local TweenService = game:GetService("TweenService")
local TweenInfo_new_result1 = TweenInfo.new(2, Enum.EasingStyle.Linear)
while true do
	TweenService:Create(script.Parent, TweenInfo_new_result1, {
		StudsOffsetWorldSpace = Vector3.new(0, 5, 0);
	}):Play()
	task.wait(2)
	TweenService:Create(script.Parent, TweenInfo_new_result1, {
		StudsOffsetWorldSpace = Vector3.new(0, 4, 0);
	}):Play()
	task.wait(2)
end