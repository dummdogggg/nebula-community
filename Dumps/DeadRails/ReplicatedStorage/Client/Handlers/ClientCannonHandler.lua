--[[
    Script: ReplicatedStorage.Client.Handlers.ClientCannonHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:23
-- Luau version 6, Types version 3
-- Time taken: 0.002973 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local var3_upvw = false
local function _(arg1, arg2) -- Line 21, Named "worldCFrameRotationToC1"
	return arg2:Inverse() * arg1.Part0.CFrame * arg1.C0
end
local function shootActionHandler_upvr(arg1, arg2) -- Line 27, Named "shootActionHandler"
	--[[ Upvalues[1]:
		[1]: var3_upvw (read and write)
	]]
	if arg2 == Enum.UserInputState.Begin then
		var3_upvw = true
	elseif arg2 == Enum.UserInputState.End then
		var3_upvw = false
	end
end
local var5_upvw
local ActionService_upvr = require(ReplicatedStorage.Packages.ActionService)
local CurrentCamera_upvr = workspace.CurrentCamera
local RunService_upvr = game:GetService("RunService")
local workspace_GetServerTimeNow_result1_upvw = workspace:GetServerTimeNow()
ReplicatedStorage.Remotes.CannonStart.OnClientEvent:Connect(function(arg1, arg2) -- Line 35
	--[[ Upvalues[8]:
		[1]: var5_upvw (read and write)
		[2]: ActionService_upvr (readonly)
		[3]: shootActionHandler_upvr (readonly)
		[4]: LocalPlayer_upvr (readonly)
		[5]: CurrentCamera_upvr (readonly)
		[6]: RunService_upvr (readonly)
		[7]: workspace_GetServerTimeNow_result1_upvw (read and write)
		[8]: var3_upvw (read and write)
	]]
	if var5_upvw then
		var5_upvw:Disconnect()
		var5_upvw = nil
	end
	if arg1 then
		ActionService_upvr.bindAction("Shoot", shootActionHandler_upvr, Enum.KeyCode.E, Enum.KeyCode.ButtonR2, 1)
		LocalPlayer_upvr.PlayerGui.TurretGui.Enabled = true
		CurrentCamera_upvr.CameraSubject = arg2.CameraPoint
		local RaycastParams_new_result1_upvr = RaycastParams.new()
		RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
		local tbl = {}
		tbl[1] = arg2
		RaycastParams_new_result1_upvr.FilterDescendantsInstances = tbl
		local Value_upvr = arg2:FindFirstChild("Configuration"):FindFirstChild("FireCooldown").Value
		var5_upvw = RunService_upvr.RenderStepped:Connect(function() -- Line 56
			--[[ Upvalues[7]:
				[1]: arg2 (readonly)
				[2]: CurrentCamera_upvr (copied, readonly)
				[3]: RaycastParams_new_result1_upvr (readonly)
				[4]: LocalPlayer_upvr (copied, readonly)
				[5]: workspace_GetServerTimeNow_result1_upvw (copied, read and write)
				[6]: Value_upvr (readonly)
				[7]: var3_upvw (copied, read and write)
			]]
			local LookVector = arg2.VehicleSeat.CFrame.LookVector
			local Position = arg2.PivotPoint.Position
			local Unit_2 = (Position + CurrentCamera_upvr.CFrame.LookVector - Position).Unit
			local var17 = Vector3.new(0, 1, 0)
			local var18
			if 0.99 < math.abs(LookVector:Dot(var17)) then
				var17 = Vector3.new(1, 0, 0)
			end
			local Unit = LookVector:Cross(var17).Unit
			var18 = 0
			var18 = math.rad(arg2.VehicleSeat.Orientation.Y)
			var18 = 0
			var18 = arg2
			local Motor6D = var18.Mount.Motor6D
			var18 = Motor6D.C0
			arg2.Mount.Motor6D.C1 = CFrame.new(Position) * CFrame.Angles(var18, -math.clamp(math.atan2(Unit_2:Dot(Unit), Unit_2:Dot(LookVector)), -0.7853981633974483, 0.7853981633974483), 0) * CFrame.Angles(0, var18, 0) * CFrame.Angles(math.clamp(math.asin(Unit_2:Dot(Unit:Cross(LookVector).Unit)), -0.7853981633974483, 0.7853981633974483) + 0.22689280275926285, 0, var18):Inverse() * Motor6D.Part0.CFrame * var18
			var18 = arg2.Cannon
			var18 = arg2.Cannon.FirePoint.WorldCFrame.LookVector
			var18 = RaycastParams_new_result1_upvr
			local workspace_Raycast_result1 = workspace:Raycast(var18.FirePoint.WorldPosition, var18 * 1000, var18)
			local var22
			if workspace_Raycast_result1 then
				local any_WorldToScreenPoint_result1_2, any_WorldToScreenPoint_result2 = CurrentCamera_upvr:WorldToScreenPoint(workspace_Raycast_result1.Position)
				var22 = UDim2.fromOffset(any_WorldToScreenPoint_result1_2.X, any_WorldToScreenPoint_result1_2.Y)
			else
				any_WorldToScreenPoint_result2 = arg2.Cannon.FirePoint.WorldPosition + arg2.Cannon.FirePoint.WorldCFrame.LookVector * 1000
				local any_WorldToScreenPoint_result1, _ = CurrentCamera_upvr:WorldToScreenPoint(any_WorldToScreenPoint_result2)
				var22 = any_WorldToScreenPoint_result1
				any_WorldToScreenPoint_result2 = UDim2.fromOffset(any_WorldToScreenPoint_result1.X, any_WorldToScreenPoint_result1.Y)
				var22 = any_WorldToScreenPoint_result2
			end
			any_WorldToScreenPoint_result2 = LocalPlayer_upvr.PlayerGui
			any_WorldToScreenPoint_result2.TurretGui.Crosshair.Position = var22
			any_WorldToScreenPoint_result2 = arg2
			if any_WorldToScreenPoint_result2.ClosestAmmo.Value then
				any_WorldToScreenPoint_result2 = LocalPlayer_upvr.PlayerGui.TurretGui
				any_WorldToScreenPoint_result2 = arg2.ClosestAmmo.Value.Ammo.Value
				any_WorldToScreenPoint_result2.Ammo.Text = any_WorldToScreenPoint_result2
			else
				any_WorldToScreenPoint_result2 = LocalPlayer_upvr.PlayerGui.TurretGui
				any_WorldToScreenPoint_result2 = "No Cannon Ammo nearby"
				any_WorldToScreenPoint_result2.Ammo.Text = any_WorldToScreenPoint_result2
			end
			if workspace:GetServerTimeNow() - workspace_GetServerTimeNow_result1_upvw >= Value_upvr - 0.05 then
				any_WorldToScreenPoint_result2 = false
			else
				any_WorldToScreenPoint_result2 = true
			end
			if var3_upvw and not any_WorldToScreenPoint_result2 then
				arg2.Shoot:FireServer(arg2.Cannon.FirePoint.WorldPosition, arg2.Cannon.FirePoint.WorldCFrame.LookVector)
				workspace_GetServerTimeNow_result1_upvw = workspace:GetServerTimeNow()
			end
		end)
	else
		RaycastParams_new_result1_upvr = arg2.PivotPoint.Position
		arg2.Mount.Motor6D.C1 = CFrame.Angles(0, 0, (math.pi/2))
		LocalPlayer_upvr.PlayerGui.TurretGui.Enabled = false
		ActionService_upvr.unbindAction("Shoot")
		CurrentCamera_upvr.CameraSubject = LocalPlayer_upvr.Character.Humanoid
	end
end)