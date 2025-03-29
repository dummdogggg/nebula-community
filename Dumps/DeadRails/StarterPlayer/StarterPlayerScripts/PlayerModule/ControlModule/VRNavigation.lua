--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.VRNavigation
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:26
-- Luau version 6, Types version 3
-- Time taken: 0.013576 seconds

local VRService_upvr = game:GetService("VRService")
local UserInputService_upvr = game:GetService("UserInputService")
local ContextActionService_upvr = game:GetService("ContextActionService")
local var4_upvw
local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
local function _(arg1) -- Line 42, Named "IsFinite"
	local var7 = false
	if arg1 == arg1 then
		var7 = false
		if arg1 ~= math.huge then
			if arg1 == (-math.huge) then
				var7 = false
			else
				var7 = true
			end
		end
	end
	return var7
end
local function _(arg1) -- Line 46, Named "IsFiniteVector3"
	local x = arg1.x
	local var17
	if x == x then
		var17 = false
		if x ~= math.huge then
			if x == (-math.huge) then
				var17 = false
			else
				var17 = true
			end
		end
	end
	if var17 then
		local y_2 = arg1.y
		var17 = false
		if y_2 == y_2 then
			var17 = false
			if y_2 ~= math.huge then
				if y_2 == (-math.huge) then
					var17 = false
				else
					var17 = true
				end
			end
		end
		if var17 then
			local z = arg1.z
			var17 = false
			if z == z then
				var17 = false
				if z ~= math.huge then
					if z == (-math.huge) then
						var17 = false
					else
						var17 = true
					end
				end
			end
		end
	end
	return var17
end
local BindableEvent_upvr = Instance.new("BindableEvent")
BindableEvent_upvr.Name = "MovementUpdate"
BindableEvent_upvr.Parent = script
coroutine.wrap(function() -- Line 54
	--[[ Upvalues[1]:
		[1]: var4_upvw (read and write)
	]]
	local PathDisplay = script.Parent:WaitForChild("PathDisplay")
	if PathDisplay then
		var4_upvw = require(PathDisplay)
	end
end)()
local module_upvr = require(script.Parent:WaitForChild("BaseCharacterController"))
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new(arg1) -- Line 67
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_2_upvr)
	setmetatable_result1.CONTROL_ACTION_PRIORITY = arg1
	setmetatable_result1.navigationRequestedConn = nil
	setmetatable_result1.heartbeatConn = nil
	setmetatable_result1.currentDestination = nil
	setmetatable_result1.currentPath = nil
	setmetatable_result1.currentPoints = nil
	setmetatable_result1.currentPointIdx = 0
	setmetatable_result1.expectedTimeToNextPoint = 0
	setmetatable_result1.timeReachedLastPoint = tick()
	setmetatable_result1.moving = false
	setmetatable_result1.isJumpBound = false
	setmetatable_result1.moveLatch = false
	setmetatable_result1.userCFrameEnabledConn = nil
	return setmetatable_result1
end
local StarterGui_upvr = game:GetService("StarterGui")
function setmetatable_result1_2_upvr.SetLaserPointerMode(arg1, arg2) -- Line 92
	--[[ Upvalues[1]:
		[1]: StarterGui_upvr (readonly)
	]]
	pcall(function() -- Line 93
		--[[ Upvalues[2]:
			[1]: StarterGui_upvr (copied, readonly)
			[2]: arg2 (readonly)
		]]
		StarterGui_upvr:SetCore("VRLaserPointerMode", arg2)
	end)
end
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
function setmetatable_result1_2_upvr.GetLocalHumanoid(arg1) -- Line 98
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local Character = LocalPlayer_upvr.Character
	if not Character then return end
	for _, v in pairs(Character:GetChildren()) do
		if v:IsA("Humanoid") then
			return v
		end
	end
	return nil
end
function setmetatable_result1_2_upvr.HasBothHandControllers(arg1) -- Line 112
	--[[ Upvalues[1]:
		[1]: VRService_upvr (readonly)
	]]
	local any_GetUserCFrameEnabled_result1_2 = VRService_upvr:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
	if any_GetUserCFrameEnabled_result1_2 then
		any_GetUserCFrameEnabled_result1_2 = VRService_upvr:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand)
	end
	return any_GetUserCFrameEnabled_result1_2
end
function setmetatable_result1_2_upvr.HasAnyHandControllers(arg1) -- Line 116
	--[[ Upvalues[1]:
		[1]: VRService_upvr (readonly)
	]]
	local any_GetUserCFrameEnabled_result1 = VRService_upvr:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
	if not any_GetUserCFrameEnabled_result1 then
		any_GetUserCFrameEnabled_result1 = VRService_upvr:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand)
	end
	return any_GetUserCFrameEnabled_result1
end
function setmetatable_result1_2_upvr.IsMobileVR(arg1) -- Line 120
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	return UserInputService_upvr.TouchEnabled
end
function setmetatable_result1_2_upvr.HasGamepad(arg1) -- Line 124
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	return UserInputService_upvr.GamepadEnabled
end
function setmetatable_result1_2_upvr.ShouldUseNavigationLaser(arg1) -- Line 128
	if arg1:IsMobileVR() then
		return true
	end
	if arg1:HasBothHandControllers() then
		return false
	end
	if not arg1:HasAnyHandControllers() then
		return not arg1:HasGamepad()
	end
	return true
end
function setmetatable_result1_2_upvr.StartFollowingPath(arg1, arg2) -- Line 150
	--[[ Upvalues[1]:
		[1]: BindableEvent_upvr (readonly)
	]]
	currentPath = arg2 -- Setting global
	currentPoints = currentPath:GetPointCoordinates() -- Setting global
	currentPointIdx = 1 -- Setting global
	moving = true -- Setting global
	timeReachedLastPoint = tick() -- Setting global
	local any_GetLocalHumanoid_result1_2 = arg1:GetLocalHumanoid()
	if any_GetLocalHumanoid_result1_2 and any_GetLocalHumanoid_result1_2.Torso and 1 <= #currentPoints then
		expectedTimeToNextPoint = (currentPoints[1] - any_GetLocalHumanoid_result1_2.Torso.Position).magnitude / any_GetLocalHumanoid_result1_2.WalkSpeed -- Setting global
	end
	BindableEvent_upvr:Fire("targetPoint", arg1.currentDestination)
end
function setmetatable_result1_2_upvr.GoToPoint(arg1, arg2) -- Line 167
	--[[ Upvalues[1]:
		[1]: BindableEvent_upvr (readonly)
	]]
	currentPath = true -- Setting global
	local tbl_4 = {}
	tbl_4[1] = arg2
	currentPoints = tbl_4 -- Setting global
	currentPointIdx = 1 -- Setting global
	moving = true -- Setting global
	local any_GetLocalHumanoid_result1_4 = arg1:GetLocalHumanoid()
	timeReachedLastPoint = tick() -- Setting global
	expectedTimeToNextPoint = (any_GetLocalHumanoid_result1_4.Torso.Position - arg2).magnitude / any_GetLocalHumanoid_result1_4.WalkSpeed -- Setting global
	BindableEvent_upvr:Fire("targetPoint", arg2)
end
function setmetatable_result1_2_upvr.StopFollowingPath(arg1) -- Line 183
	currentPath = nil -- Setting global
	currentPoints = nil -- Setting global
	currentPointIdx = 0 -- Setting global
	moving = false -- Setting global
	arg1.moveVector = Vector3.new(0, 0, 0)
end
local PathfindingService_upvr = game:GetService("PathfindingService")
function setmetatable_result1_2_upvr.TryComputePath(arg1, arg2, arg3) -- Line 191
	--[[ Upvalues[1]:
		[1]: PathfindingService_upvr (readonly)
	]]
	local var42
	while not var42 and 0 < 5 do
		var42 = PathfindingService_upvr:ComputeSmoothPathAsync(arg2, arg3, 200)
		local var43 = var42
		if var43.Status == Enum.PathStatus.ClosestNoPath or var43.Status == Enum.PathStatus.ClosestOutOfRange then
			var43 = nil
			do
				return var43
			end
			local var44
		end
		if var44 and var44.Status == Enum.PathStatus.FailStartNotEmpty then
			var44 = nil
		end
		if var44 and var44.Status == Enum.PathStatus.FailFinishNotEmpty then
			var44 = nil
		end
	end
	return var44
end
function setmetatable_result1_2_upvr.OnNavigationRequest(arg1, arg2, arg3) -- Line 218
	--[[ Upvalues[1]:
		[1]: var4_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local x_6 = arg2.Position.x
	local var46
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 6. Error Block 2 start (CF ANALYSIS FAILED)
	var46 = false
	-- KONSTANTERROR: [9] 6. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [12] 8. Error Block 47 start (CF ANALYSIS FAILED)
	if x_6 == (-math.huge) then
		var46 = false
	else
		var46 = true
	end
	-- KONSTANTERROR: [12] 8. Error Block 47 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [16] 11. Error Block 6 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [16] 11. Error Block 6 end (CF ANALYSIS FAILED)
end
function setmetatable_result1_2_upvr.OnJumpAction(arg1, arg2, arg3, arg4) -- Line 264
	if arg3 == Enum.UserInputState.Begin then
		arg1.isJumping = true
	end
	return Enum.ContextActionResult.Sink
end
function setmetatable_result1_2_upvr.BindJumpAction(arg1, arg2) -- Line 270
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 3 start (CF ANALYSIS FAILED)
	arg1.isJumpBound = true
	ContextActionService_upvr:BindActionAtPriority("VRJumpAction", function() -- Line 274
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return arg1:OnJumpAction()
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA)
	do
		return
	end
	-- KONSTANTERROR: [4] 4. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 16. Error Block 7 start (CF ANALYSIS FAILED)
	if arg1.isJumpBound then
		arg1.isJumpBound = false
		ContextActionService_upvr:UnbindAction("VRJumpAction")
	end
	-- KONSTANTERROR: [20] 16. Error Block 7 end (CF ANALYSIS FAILED)
end
function setmetatable_result1_2_upvr.ControlCharacterGamepad(arg1, arg2, arg3, arg4) -- Line 285
	--[[ Upvalues[2]:
		[1]: var4_upvw (read and write)
		[2]: BindableEvent_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 33 start (CF ANALYSIS FAILED)
	if arg4.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
	if arg3 == Enum.UserInputState.Cancel then
		arg1.moveVector = Vector3.new(0, 0, 0)
		return
	end
	if arg3 ~= Enum.UserInputState.End then
		arg1:StopFollowingPath()
		if var4_upvw then
			var4_upvw.clearRenderedPath()
		end
		if arg1:ShouldUseNavigationLaser() then
			arg1:BindJumpAction(true)
			arg1:SetLaserPointerMode("Hidden")
		end
		if 0.22 < arg4.Position.magnitude then
			arg1.moveVector = Vector3.new(arg4.Position.X, 0, -arg4.Position.Y)
			if 0 < arg1.moveVector.magnitude then
				arg1.moveVector = arg1.moveVector.unit * math.min(1, arg4.Position.magnitude)
			end
			arg1.moveLatch = true
			-- KONSTANTWARNING: GOTO [117] #78
		end
	else
		arg1.moveVector = Vector3.new(0, 0, 0)
		if arg1:ShouldUseNavigationLaser() then
			arg1:BindJumpAction(false)
			arg1:SetLaserPointerMode("Navigation")
		end
		if arg1.moveLatch then
			arg1.moveLatch = false
			BindableEvent_upvr:Fire("offtrack")
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 33 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [117] 78. Error Block 19 start (CF ANALYSIS FAILED)
	do
		return Enum.ContextActionResult.Sink
	end
	-- KONSTANTERROR: [117] 78. Error Block 19 end (CF ANALYSIS FAILED)
end
local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserRaycastPerformanceImprovements")
function setmetatable_result1_2_upvr.OnHeartbeat(arg1, arg2) -- Line 328
	--[[ Upvalues[4]:
		[1]: var4_upvw (read and write)
		[2]: any_getUserFlag_result1_upvr (readonly)
		[3]: RaycastParams_new_result1_upvr (readonly)
		[4]: BindableEvent_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local any_GetLocalHumanoid_result1_3 = arg1:GetLocalHumanoid()
	local var87
	if not any_GetLocalHumanoid_result1_3 or not any_GetLocalHumanoid_result1_3.Torso then
	else
		if arg1.moving and arg1.currentPoints then
			local Position_2 = any_GetLocalHumanoid_result1_3.Torso.Position
			local var89 = (currentPoints[1] - Position_2) * Vector3.new(1, 0, 1)
			local magnitude = var89.magnitude
			local var91 = var89 / magnitude
			if magnitude < 1 then
				for i_2, _ in pairs(currentPoints) do
					if i_2 ~= 1 then
					end
				end
				table.remove(currentPoints, 1)
				currentPointIdx = currentPointIdx + 1 -- Setting global
				if #currentPoints == 0 then
					arg1:StopFollowingPath()
					if var4_upvw then
						var4_upvw.clearRenderedPath()
					end
					return
				end
				if var4_upvw then
					var4_upvw.setCurrentPoints(currentPoints)
					var4_upvw.renderPath()
				end
				expectedTimeToNextPoint = (currentPoints[1] - Position_2).magnitude / any_GetLocalHumanoid_result1_3.WalkSpeed -- Setting global
				timeReachedLastPoint = tick() -- Setting global
			else
				if any_getUserFlag_result1_upvr then
					RaycastParams_new_result1_upvr.FilterDescendantsInstances = {game.Players.LocalPlayer.Character, workspace.CurrentCamera}
					local workspace_Raycast_result1_2 = workspace:Raycast(Position_2 - Vector3.new(0, 1, 0), var91 * 3, RaycastParams_new_result1_upvr)
					if workspace_Raycast_result1_2 then
						local var97 = workspace:Raycast(workspace_Raycast_result1_2.Position + var91 * 0.5 + Vector3.new(0, 100, 0), Vector3.new(-0, -100, -0), RaycastParams_new_result1_upvr).Position.Y - Position_2.Y
						if var97 < 6 and -2 < var97 then
							any_GetLocalHumanoid_result1_3.Jump = true
							-- KONSTANTWARNING: GOTO [230] #158
						end
						-- KONSTANTWARNING: GOTO [230] #158
					end
				else
					local tbl_2 = {game.Players.LocalPlayer.Character, workspace.CurrentCamera}
					local workspace_FindPartOnRayWithIgnoreList_result1_2, workspace_FindPartOnRayWithIgnoreList_result2, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(Position_2 - Vector3.new(0, 1, 0), var91 * 3), tbl_2)
					if workspace_FindPartOnRayWithIgnoreList_result1_2 then
						local _, workspace_FindPartOnRayWithIgnoreList_result2_4, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(workspace_FindPartOnRayWithIgnoreList_result2 + var91 * 0.5 + Vector3.new(0, 100, 0), Vector3.new(-0, -100, -0)), tbl_2)
						local var105 = workspace_FindPartOnRayWithIgnoreList_result2_4.Y - Position_2.Y
						if var105 < 6 and -2 < var105 then
							any_GetLocalHumanoid_result1_3.Jump = true
						end
					end
				end
				if expectedTimeToNextPoint + 2 < tick() - timeReachedLastPoint then
					arg1:StopFollowingPath()
					if var4_upvw then
						var4_upvw.clearRenderedPath()
					end
					BindableEvent_upvr:Fire("offtrack")
				end
				var87 = arg1.moveVector:Lerp(var91, arg2 * 10)
			end
		end
		local var106 = var87
		local x_3 = var106.x
		if x_3 == x_3 then
			if x_3 ~= math.huge then
				if x_3 == (-math.huge) then
				else
				end
			end
		end
		if true then
			local y_4 = var106.y
			if y_4 == y_4 and y_4 ~= math.huge then
				if y_4 == (-math.huge) then
				else
				end
			end
			if true then
				local z_3 = var106.z
				if z_3 == z_3 and z_3 ~= math.huge then
					if z_3 == (-math.huge) then
					else
					end
				end
			end
		end
		if true then
			arg1.moveVector = var87
		end
	end
end
function setmetatable_result1_2_upvr.OnUserCFrameEnabled(arg1) -- Line 426
	if arg1:ShouldUseNavigationLaser() then
		arg1:BindJumpAction(false)
		arg1:SetLaserPointerMode("Navigation")
	else
		arg1:BindJumpAction(true)
		arg1:SetLaserPointerMode("Hidden")
	end
end
local RunService_upvr = game:GetService("RunService")
function setmetatable_result1_2_upvr.Enable(arg1, arg2) -- Line 436
	--[[ Upvalues[3]:
		[1]: VRService_upvr (readonly)
		[2]: RunService_upvr (readonly)
		[3]: ContextActionService_upvr (readonly)
	]]
	arg1.moveVector = Vector3.new(0, 0, 0)
	arg1.isJumping = false
	if arg2 then
		arg1.navigationRequestedConn = VRService_upvr.NavigationRequested:Connect(function(arg1_2, arg2_2) -- Line 442
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnNavigationRequest(arg1_2, arg2_2)
		end)
		arg1.heartbeatConn = RunService_upvr.Heartbeat:Connect(function(arg1_3) -- Line 443
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnHeartbeat(arg1_3)
		end)
		ContextActionService_upvr:BindAction("MoveThumbstick", function(arg1_4, arg2_3, arg3) -- Line 445
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			return arg1:ControlCharacterGamepad(arg1_4, arg2_3, arg3)
		end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1)
		ContextActionService_upvr:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
		arg1.userCFrameEnabledConn = VRService_upvr.UserCFrameEnabled:Connect(function() -- Line 449
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnUserCFrameEnabled()
		end)
		arg1:OnUserCFrameEnabled()
		VRService_upvr:SetTouchpadMode(Enum.VRTouchpad.Left, Enum.VRTouchpadMode.VirtualThumbstick)
		VRService_upvr:SetTouchpadMode(Enum.VRTouchpad.Right, Enum.VRTouchpadMode.ABXY)
		arg1.enabled = true
	else
		arg1:StopFollowingPath()
		ContextActionService_upvr:UnbindAction("MoveThumbstick")
		ContextActionService_upvr:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
		arg1:BindJumpAction(false)
		arg1:SetLaserPointerMode("Disabled")
		if arg1.navigationRequestedConn then
			arg1.navigationRequestedConn:Disconnect()
			arg1.navigationRequestedConn = nil
		end
		if arg1.heartbeatConn then
			arg1.heartbeatConn:Disconnect()
			arg1.heartbeatConn = nil
		end
		if arg1.userCFrameEnabledConn then
			arg1.userCFrameEnabledConn:Disconnect()
			arg1.userCFrameEnabledConn = nil
		end
		arg1.enabled = false
	end
end
return setmetatable_result1_2_upvr