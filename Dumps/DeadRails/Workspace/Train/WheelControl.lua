--[[
    Script: Workspace.Train.WheelControl
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:43:55
-- Luau version 6, Types version 3
-- Time taken: 0.000963 seconds

local tbl_upvr = {
	Medium = game.ReplicatedStorage.Assets.MediumWheelBase;
	Large = game.ReplicatedStorage.Assets.WheelBaseLarge;
}
local RunService_upvr = game:GetService("RunService")
;(function() -- Line 8, Named "initializeWheels"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: RunService_upvr (readonly)
	]]
	script.Parent.WheelBases:ClearAllChildren()
	for _, v_upvr in pairs(script.Parent.AxelNodes:GetChildren()) do
		local clone_upvr = tbl_upvr[v_upvr.Name]:Clone()
		clone_upvr.Parent = script.Parent.WheelBases
		RunService_upvr.Heartbeat:Connect(function() -- Line 15
			--[[ Upvalues[2]:
				[1]: v_upvr (readonly)
				[2]: clone_upvr (readonly)
			]]
			local any_ToEulerAnglesXYZ_result1, _, _ = clone_upvr:GetPivot():ToEulerAnglesXYZ()
			clone_upvr:PivotTo(v_upvr.CFrame * CFrame.Angles(any_ToEulerAnglesXYZ_result1 - math.rad(v_upvr.AssemblyLinearVelocity.Magnitude / clone_upvr.Radius.Value), 0, 0))
		end)
	end
end)()