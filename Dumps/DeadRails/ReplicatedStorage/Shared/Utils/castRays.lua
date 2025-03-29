--[[
    Script: ReplicatedStorage.Shared.Utils.castRays
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:47
-- Luau version 6, Types version 3
-- Time taken: 0.001647 seconds

local Workspace_upvr = game:GetService("Workspace")
local Players_upvr = game:GetService("Players")
return function(arg1, arg2, arg3, arg4) -- Line 16, Named "castRays"
	--[[ Upvalues[2]:
		[1]: Workspace_upvr (readonly)
		[2]: Players_upvr (readonly)
	]]
	local tbl_2 = {}
	if arg1 then
		table.insert(tbl_2, arg1)
	end
	local RaycastParams_new_result1_2 = RaycastParams.new()
	RaycastParams_new_result1_2.FilterType = Enum.RaycastFilterType.Exclude
	RaycastParams_new_result1_2.IgnoreWater = true
	RaycastParams_new_result1_2.FilterDescendantsInstances = tbl_2
	local module = {}
	for _, v in arg3 do
		local any_Spherecast_result1_2 = Workspace_upvr:Spherecast(arg2, arg4, v, RaycastParams_new_result1_2)
		local tbl_3 = {
			position = arg2 + v;
			normal = v.Unit;
		}
		if any_Spherecast_result1_2 then
			tbl_3.position = any_Spherecast_result1_2.Position
			tbl_3.normal = any_Spherecast_result1_2.Normal
			tbl_3.instance = any_Spherecast_result1_2.Instance
			tbl_3.material = any_Spherecast_result1_2.Material
			local class_Humanoid = any_Spherecast_result1_2.Instance.Parent:FindFirstChildOfClass("Humanoid")
			if class_Humanoid and not Players_upvr:GetPlayerFromCharacter(class_Humanoid.Parent) then
				tbl_3.taggedHumanoid = class_Humanoid
			end
		end
		table.insert(module, tbl_3)
	end
	return module
end