--[[
    Script: StarterPlayer.StarterCharacterScripts.VelocityTest
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:43
-- Luau version 6, Types version 3
-- Time taken: 0.000883 seconds

local Parent_upvr = script.Parent
local Humanoid_upvr = Parent_upvr:WaitForChild("Humanoid")
local var4_upvw = false
local var5_upvw
game:GetService("RunService").Heartbeat:Connect(function(arg1) -- Line 12
	--[[ Upvalues[4]:
		[1]: Humanoid_upvr (readonly)
		[2]: Parent_upvr (readonly)
		[3]: var4_upvw (read and write)
		[4]: var5_upvw (read and write)
	]]
	local RootPart = Humanoid_upvr.RootPart
	if not RootPart then
	else
		local RaycastParams_new_result1 = RaycastParams.new()
		RaycastParams_new_result1.FilterType = Enum.RaycastFilterType.Exclude
		RaycastParams_new_result1.FilterDescendantsInstances = {Parent_upvr}
		local workspace_Blockcast_result1 = workspace:Blockcast(RootPart.CFrame, RootPart.Size, RootPart.CFrame.UpVector * -4, RaycastParams_new_result1)
		if workspace_Blockcast_result1 then
			var4_upvw = true
			var5_upvw = workspace_Blockcast_result1.Instance
		else
			var4_upvw = false
		end
		if not var4_upvw and var5_upvw then
			if var5_upvw.AssemblyLinearVelocity.Magnitude < 1 then return end
			RootPart.AssemblyLinearVelocity = Vector3.new(var5_upvw.AssemblyLinearVelocity.X, RootPart.AssemblyLinearVelocity.Y, var5_upvw.AssemblyLinearVelocity.Z)
			RootPart.AssemblyAngularVelocity = var5_upvw.AssemblyAngularVelocity
		end
	end
end)