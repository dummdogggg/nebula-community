--[[
    Script: Workspace.meanspyrobot.InertiaJumpOLD
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:03
-- Luau version 6, Types version 3
-- Time taken: 0.002094 seconds

local RunService_upvr = game:GetService("RunService")
local Parent_upvr = script.Parent
local Humanoid = Parent_upvr:WaitForChild("Humanoid")
local var4_upvw
local var5_upvw
local var6_upvw
local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
RaycastParams_new_result1_upvr.FilterDescendantsInstances = {Parent_upvr}
local function stayAttached_upvr() -- Line 16, Named "stayAttached"
	--[[ Upvalues[4]:
		[1]: Parent_upvr (readonly)
		[2]: RaycastParams_new_result1_upvr (readonly)
		[3]: var6_upvw (read and write)
		[4]: var5_upvw (read and write)
	]]
	local HumanoidRootPart = Parent_upvr:WaitForChild("HumanoidRootPart")
	local workspace_Spherecast_result1 = workspace:Spherecast(HumanoidRootPart.Position, 2, Vector3.new(0, -50, 0), RaycastParams_new_result1_upvr)
	if not workspace_Spherecast_result1 then
	else
		local Instance = workspace_Spherecast_result1.Instance
		if Instance and Instance:IsA("BasePart") then
			if var6_upvw == Instance then
				HumanoidRootPart.CFrame = Instance.CFrame * var5_upvw:inverse() * HumanoidRootPart.CFrame
				var5_upvw = Instance.CFrame
			else
				var6_upvw = Instance
				var5_upvw = Instance.CFrame
			end
		end
		var6_upvw = nil
		var5_upvw = nil
	end
end
local function _() -- Line 48, Named "startInertia"
	--[[ Upvalues[5]:
		[1]: var5_upvw (read and write)
		[2]: var6_upvw (read and write)
		[3]: stayAttached_upvr (readonly)
		[4]: var4_upvw (read and write)
		[5]: RunService_upvr (readonly)
	]]
	var5_upvw = nil
	var6_upvw = nil
	stayAttached_upvr()
	var4_upvw = RunService_upvr.Heartbeat:Connect(function() -- Line 54
		--[[ Upvalues[1]:
			[1]: stayAttached_upvr (copied, readonly)
		]]
		stayAttached_upvr()
	end)
end
Humanoid.Jumping:Connect(function(arg1) -- Line 63
	--[[ Upvalues[5]:
		[1]: var4_upvw (read and write)
		[2]: var5_upvw (read and write)
		[3]: var6_upvw (read and write)
		[4]: stayAttached_upvr (readonly)
		[5]: RunService_upvr (readonly)
	]]
	if arg1 and not var4_upvw then
		var5_upvw = nil
		var6_upvw = nil
		stayAttached_upvr()
		var4_upvw = RunService_upvr.Heartbeat:Connect(function() -- Line 54
			--[[ Upvalues[1]:
				[1]: stayAttached_upvr (copied, readonly)
			]]
			stayAttached_upvr()
		end)
	end
end)
Humanoid.StateChanged:Connect(function(arg1, arg2) -- Line 74
	--[[ Upvalues[5]:
		[1]: var4_upvw (read and write)
		[2]: var5_upvw (read and write)
		[3]: var6_upvw (read and write)
		[4]: stayAttached_upvr (readonly)
		[5]: RunService_upvr (readonly)
	]]
	if arg2 == Enum.HumanoidStateType.Climbing or arg2 == Enum.HumanoidStateType.Freefall or not var4_upvw then
		var5_upvw = nil
		var6_upvw = nil
		stayAttached_upvr()
		var4_upvw = RunService_upvr.Heartbeat:Connect(function() -- Line 54
			--[[ Upvalues[1]:
				[1]: stayAttached_upvr (copied, readonly)
			]]
			stayAttached_upvr()
		end)
	end
	if arg2 == Enum.HumanoidStateType.Landed or arg2 == Enum.HumanoidStateType.Running then
		if var4_upvw then
			var4_upvw:Disconnect()
			var4_upvw = nil
		end
	end
end)