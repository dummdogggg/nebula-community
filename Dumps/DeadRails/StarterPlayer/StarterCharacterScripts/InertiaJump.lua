--[[
    Script: StarterPlayer.StarterCharacterScripts.InertiaJump
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:42
-- Luau version 6, Types version 3
-- Time taken: 0.001902 seconds

local Parent_upvr = script.Parent
local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
RaycastParams_new_result1_upvr.FilterDescendantsInstances = {Parent_upvr}
local Humanoid_upvr = Parent_upvr:WaitForChild("Humanoid")
local var6_upvw
local var7_upvw
game:GetService("RunService").PreSimulation:Connect(function() -- Line 22
	--[[ Upvalues[5]:
		[1]: Parent_upvr (readonly)
		[2]: RaycastParams_new_result1_upvr (readonly)
		[3]: Humanoid_upvr (readonly)
		[4]: var6_upvw (read and write)
		[5]: var7_upvw (read and write)
	]]
	local HumanoidRootPart_2 = Parent_upvr:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart_2 then
	else
		local workspace_Raycast_result1 = workspace:Raycast(HumanoidRootPart_2.Position, Vector3.new(0, -50, 0), RaycastParams_new_result1_upvr)
		if not workspace_Raycast_result1 then return end
		local Instance_2 = workspace_Raycast_result1.Instance
		if Instance_2 then
			local var17
			if Instance_2:IsA("BasePart") then
				local any_GetState_result1 = Humanoid_upvr:GetState()
				local var19 = true
				var17 = Enum.HumanoidStateType.Jumping
				if any_GetState_result1 ~= var17 then
					var17 = Enum.HumanoidStateType.Freefall
					if any_GetState_result1 ~= var17 then
						var19 = false
					else
						var19 = true
					end
				end
				if var6_upvw ~= Instance_2 then
					var17 = false
				else
					var17 = true
				end
				if var19 then
					if var17 then
						HumanoidRootPart_2.CFrame = Instance_2.CFrame * var7_upvw:inverse() * HumanoidRootPart_2.CFrame
						var7_upvw = Instance_2.CFrame
					else
						var6_upvw = Instance_2
						var7_upvw = Instance_2.CFrame
					end
				end
				var6_upvw = nil
				var7_upvw = nil
				return
			end
		end
		var6_upvw = nil
		var7_upvw = nil
	end
end)