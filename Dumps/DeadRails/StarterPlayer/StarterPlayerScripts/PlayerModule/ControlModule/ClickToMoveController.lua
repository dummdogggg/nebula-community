--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.ClickToMoveController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:34
-- Luau version 6, Types version 3
-- Time taken: 0.048020 seconds

local pcall_result1, pcall_result2 = pcall(function() -- Line 10
	return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding")
end)
local pcall_result1_2, pcall_result2_2 = pcall(function() -- Line 14
	return UserSettings():IsUserFeatureEnabled("UserClickToMoveSupportAgentCanClimb2")
end)
local UserInputService_upvr = game:GetService("UserInputService")
local Players_upvr = game:GetService("Players")
local Workspace_upvr = game:GetService("Workspace")
local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserRaycastPerformanceImprovements")
local var11_upvw = true
local var12_upvw = true
local var13_upvw = false
local var14_upvw = 1
local var15_upvw = 8
local tbl_5_upvr = {
	[Enum.KeyCode.W] = true;
	[Enum.KeyCode.A] = true;
	[Enum.KeyCode.S] = true;
	[Enum.KeyCode.D] = true;
	[Enum.KeyCode.Up] = true;
	[Enum.KeyCode.Down] = true;
}
local LocalPlayer_upvr = Players_upvr.LocalPlayer
local module_upvr = require(script.Parent:WaitForChild("ClickToMoveDisplay"))
local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
local tbl_6_upvr = {}
if not any_getUserFlag_result1_upvr then
	local function FindCharacterAncestor_upvr(arg1) -- Line 65, Named "FindCharacterAncestor"
		--[[ Upvalues[1]:
			[1]: FindCharacterAncestor_upvr (readonly)
		]]
		if arg1 then
			local class_Humanoid = arg1:FindFirstChildOfClass("Humanoid")
			if class_Humanoid then
				return arg1, class_Humanoid
			end
			return FindCharacterAncestor_upvr(arg1.Parent)
		end
	end
	tbl_6_upvr.FindCharacterAncestor = FindCharacterAncestor_upvr
	local function findPlayerHumanoid_upvr(arg1, arg2, arg3) -- Line 77, Named "Raycast"
		--[[ Upvalues[3]:
			[1]: Workspace_upvr (readonly)
			[2]: FindCharacterAncestor_upvr (readonly)
			[3]: findPlayerHumanoid_upvr (readonly)
		]]
		local var32 = arg3
		if not var32 then
			var32 = {}
		end
		local var33 = var32
		local any_FindPartOnRayWithIgnoreList_result1, any_FindPartOnRayWithIgnoreList_result2_2, any_FindPartOnRayWithIgnoreList_result3_2, any_FindPartOnRayWithIgnoreList_result4_2 = Workspace_upvr:FindPartOnRayWithIgnoreList(arg1, var33)
		if any_FindPartOnRayWithIgnoreList_result1 then
			if arg2 then
				local var38
				if any_FindPartOnRayWithIgnoreList_result1.CanCollide == false then
					if any_FindPartOnRayWithIgnoreList_result1 then
						local class_Humanoid_2 = any_FindPartOnRayWithIgnoreList_result1:FindFirstChildOfClass("Humanoid")
						if class_Humanoid_2 then
							var38 = class_Humanoid_2
						else
							local _, FindCharacterAncestor_result2 = FindCharacterAncestor_upvr(any_FindPartOnRayWithIgnoreList_result1.Parent)
							var38 = FindCharacterAncestor_result2
						end
					else
						var38 = nil
					end
					if var38 == nil then
						table.insert(var33, any_FindPartOnRayWithIgnoreList_result1)
						return findPlayerHumanoid_upvr(arg1, arg2, var33)
					end
				end
			end
			return any_FindPartOnRayWithIgnoreList_result1, any_FindPartOnRayWithIgnoreList_result2_2, any_FindPartOnRayWithIgnoreList_result3_2, any_FindPartOnRayWithIgnoreList_result4_2
		end
		return nil, nil
	end
	tbl_6_upvr.Raycast = findPlayerHumanoid_upvr
end
FindCharacterAncestor_upvr = {}
local var42_upvr = FindCharacterAncestor_upvr
function findPlayerHumanoid_upvr(arg1) -- Line 99, Named "findPlayerHumanoid"
	--[[ Upvalues[1]:
		[1]: var42_upvr (readonly)
	]]
	local var43 = arg1
	if var43 then
		var43 = arg1.Character
	end
	if var43 then
		local var44 = var42_upvr[arg1]
		if var44 and var44.Parent == var43 then
			return var44
		end
		var42_upvr[arg1] = nil
		local class_Humanoid_7 = var43:FindFirstChildOfClass("Humanoid")
		if class_Humanoid_7 then
			var42_upvr[arg1] = class_Humanoid_7
		end
		return class_Humanoid_7
	end
end
local var46_upvw
local var47_upvw
local function _() -- Line 123, Named "GetCharacter"
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local var48 = LocalPlayer_upvr
	if var48 then
		var48 = LocalPlayer_upvr.Character
	end
	return var48
end
local var49_upvw
local var50_upvw
local CollectionService_upvr = game:GetService("CollectionService")
local function UpdateIgnoreTag_upvr(arg1) -- Line 127, Named "UpdateIgnoreTag"
	--[[ Upvalues[6]:
		[1]: var47_upvw (read and write)
		[2]: var49_upvw (read and write)
		[3]: var50_upvw (read and write)
		[4]: var46_upvw (read and write)
		[5]: LocalPlayer_upvr (readonly)
		[6]: CollectionService_upvr (readonly)
	]]
	if arg1 == var47_upvw then
	else
		if var49_upvw then
			var49_upvw:Disconnect()
			var49_upvw = nil
		end
		if var50_upvw then
			var50_upvw:Disconnect()
			var50_upvw = nil
		end
		var47_upvw = arg1
		local tbl_4 = {}
		local var57 = LocalPlayer_upvr
		if var57 then
			var57 = LocalPlayer_upvr.Character
		end
		tbl_4[1] = var57
		var46_upvw = tbl_4
		if var47_upvw ~= nil then
			for _, v_6 in ipairs(CollectionService_upvr:GetTagged(var47_upvw)) do
				table.insert(var46_upvw, v_6)
			end
			var49_upvw = CollectionService_upvr:GetInstanceAddedSignal(var47_upvw):Connect(function(arg1_2) -- Line 147
				--[[ Upvalues[1]:
					[1]: var46_upvw (copied, read and write)
				]]
				table.insert(var46_upvw, arg1_2)
			end)
			var50_upvw = CollectionService_upvr:GetInstanceRemovedSignal(var47_upvw):Connect(function(arg1_3) -- Line 151
				--[[ Upvalues[1]:
					[1]: var46_upvw (copied, read and write)
				]]
				for i_7 = 1, #var46_upvw do
					if var46_upvw[i_7] == arg1_3 then
						var46_upvw[i_7] = var46_upvw[#var46_upvw]
						table.remove(var46_upvw)
						return
					end
				end
			end)
		end
	end
end
local function _() -- Line 163, Named "getIgnoreList"
	--[[ Upvalues[2]:
		[1]: var46_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
	]]
	if var46_upvw then
		return var46_upvw
	end
	var46_upvw = {}
	assert(var46_upvw, "")
	local var64 = LocalPlayer_upvr
	if var64 then
		var64 = LocalPlayer_upvr.Character
	end
	table.insert(var46_upvw, var64)
	return var46_upvw
end
local function _(arg1, arg2) -- Line 173, Named "minV"
	return Vector3.new(math.min(arg1.X, arg2.X), math.min(arg1.Y, arg2.Y), math.min(arg1.Z, arg2.Z))
end
local function _(arg1, arg2) -- Line 176, Named "maxV"
	return Vector3.new(math.max(arg1.X, arg2.X), math.max(arg1.Y, arg2.Y), math.max(arg1.Z, arg2.Z))
end
local function getCollidableExtentsSize_upvr(arg1) -- Line 179, Named "getCollidableExtentsSize"
	if arg1 == nil or arg1.PrimaryPart == nil then return end
	assert(arg1, "")
	assert(arg1.PrimaryPart, "")
	for _, v in pairs(arg1:GetDescendants()) do
		if v:IsA("BasePart") and v.CanCollide then
			local vector3 = Vector3.new(v.Size.X / 2, v.Size.Y / 2, v.Size.Z / 2)
			for _, v_2 in ipairs({Vector3.new(vector3.X, vector3.Y, vector3.Z), Vector3.new(vector3.X, vector3.Y, -vector3.Z), Vector3.new(vector3.X, -vector3.Y, vector3.Z), Vector3.new(vector3.X, -vector3.Y, -vector3.Z), Vector3.new(-vector3.X, vector3.Y, vector3.Z), Vector3.new(-vector3.X, vector3.Y, -vector3.Z), Vector3.new(-vector3.X, -vector3.Y, vector3.Z), Vector3.new(-vector3.X, -vector3.Y, -vector3.Z)}) do
				local var81 = arg1.PrimaryPart.CFrame:Inverse() * v.CFrame * v_2
				local const_vector = Vector3.new(math.huge, math.huge, math.huge)
				local const_vector_2 = Vector3.new((-math.huge), (-math.huge), (-math.huge))
				local var84
			end
		end
	end
	local var85 = Vector3.new(math.max(const_vector_2.X, var81.X), math.max(const_vector_2.Y, var81.Y), math.max(const_vector_2.Z, var81.Z)) - Vector3.new(math.min(const_vector.X, var81.X), math.min(const_vector.Y, var81.Y), math.min(const_vector.Z, var81.Z))
	if var85.X < 0 or var85.Y < 0 or var85.Z < 0 then
		return nil
	end
	return var85
end
local var86_upvr = pcall_result1 and pcall_result2
local var87_upvr = pcall_result1_2 and pcall_result2_2
local PathfindingService_upvr = game:GetService("PathfindingService")
local function Pather_upvr(arg1, arg2, arg3) -- Line 214, Named "Pather"
	--[[ Upvalues[15]:
		[1]: var13_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: var42_upvr (readonly)
		[4]: var14_upvw (read and write)
		[5]: var86_upvr (readonly)
		[6]: getCollidableExtentsSize_upvr (readonly)
		[7]: var87_upvr (readonly)
		[8]: PathfindingService_upvr (readonly)
		[9]: var11_upvw (read and write)
		[10]: module_upvr (readonly)
		[11]: var15_upvw (read and write)
		[12]: any_getUserFlag_result1_upvr (readonly)
		[13]: RaycastParams_new_result1_upvr (readonly)
		[14]: var46_upvw (read and write)
		[15]: Workspace_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 112 start (CF ANALYSIS FAILED)
	local module_upvr_2 = {}
	local var141
	if arg3 ~= nil then
		local _ = arg3
	else
	end
	module_upvr_2.Cancelled = false
	module_upvr_2.Started = false
	module_upvr_2.Finished = Instance.new("BindableEvent")
	module_upvr_2.PathFailed = Instance.new("BindableEvent")
	module_upvr_2.PathComputing = false
	module_upvr_2.PathComputed = false
	module_upvr_2.OriginalTargetPoint = arg1
	module_upvr_2.TargetPoint = arg1
	module_upvr_2.TargetSurfaceNormal = arg2
	module_upvr_2.DiedConn = nil
	module_upvr_2.SeatedConn = nil
	module_upvr_2.BlockedConn = nil
	module_upvr_2.TeleportedConn = nil
	module_upvr_2.CurrentPoint = 0
	module_upvr_2.HumanoidOffsetFromPath = Vector3.new(0, 0, 0)
	module_upvr_2.CurrentWaypointPosition = nil
	module_upvr_2.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
	module_upvr_2.CurrentWaypointPlaneDistance = 0
	module_upvr_2.CurrentWaypointNeedsJump = false
	module_upvr_2.CurrentHumanoidPosition = Vector3.new(0, 0, 0)
	module_upvr_2.CurrentHumanoidVelocity = 0
	module_upvr_2.NextActionMoveDirection = Vector3.new(0, 0, 0)
	module_upvr_2.NextActionJump = false
	module_upvr_2.Timeout = 0
	local var143 = LocalPlayer_upvr
	var141 = var143
	if var141 then
		var141 = var143.Character
	end
	if var141 then
		local var144 = var42_upvr[var143]
		if var144 and var144.Parent == var141 then
		else
			var42_upvr[var143] = nil
			local class_Humanoid_8 = var141:FindFirstChildOfClass("Humanoid")
			if class_Humanoid_8 then
				var42_upvr[var143] = class_Humanoid_8
			end
		end
	else
	end
	module_upvr_2.Humanoid = nil
	module_upvr_2.OriginPoint = nil
	module_upvr_2.AgentCanFollowPath = false
	module_upvr_2.DirectPath = false
	module_upvr_2.DirectPathRiseFirst = false
	module_upvr_2.stopTraverseFunc = nil
	module_upvr_2.setPointFunc = nil
	module_upvr_2.pointList = nil
	if module_upvr_2.Humanoid then
		local RootPart_2 = module_upvr_2.Humanoid.RootPart
		local var147
	end
	if RootPart_2 then
		var141 = RootPart_2.CFrame
		module_upvr_2.OriginPoint = var141.Position
		var141 = 5
		var147 = module_upvr_2.Humanoid
		local SeatPart = var147.SeatPart
		if SeatPart then
			var147 = SeatPart:IsA("VehicleSeat")
			if var147 then
				var147 = SeatPart:FindFirstAncestorOfClass("Model")
				if var147 then
					var147.PrimaryPart = SeatPart
					if true then
						var141 = var14_upvw * var147:GetExtentsSize().Y
						module_upvr_2.AgentCanFollowPath = true
						-- KONSTANTERROR: Expression was reused, decompilation is incorrect
						module_upvr_2.DirectPath = true
					end
					var147.PrimaryPart = var147.PrimaryPart
					-- KONSTANTWARNING: GOTO [282] #200
				end
				-- KONSTANTWARNING: GOTO [282] #200
			end
		end
		var147 = nil
		local var150
		if var86_upvr then
			local var151 = LocalPlayer_upvr
			if var151 then
				var151 = LocalPlayer_upvr.Character
			end
			if var151 ~= nil then
				var147 = getCollidableExtentsSize_upvr(var151)
			end
		end
		if var147 == nil then
			var151 = LocalPlayer_upvr
			local var152 = var151
			if var152 then
				var152 = LocalPlayer_upvr.Character
			end
			var147 = var152:GetExtentsSize()
		end
		assert(var147, "")
		var141 = var14_upvw * var147.Y
		if 0 >= module_upvr_2.Humanoid.JumpPower then
		else
		end
		module_upvr_2.AgentCanFollowPath = true
		module_upvr_2.DirectPath = var13_upvw
		module_upvr_2.DirectPathRiseFirst = module_upvr_2.Humanoid.Sit
		var147 = var87_upvr
		if var147 then
			var147 = PathfindingService_upvr
			var147 = var147:CreatePath({
				AgentRadius = var14_upvw * 0.5 * math.sqrt(var147.X * var147.X + var147.Z * var147.Z);
				AgentHeight = var141;
				AgentCanJump = true;
				AgentCanClimb = true;
			})
			module_upvr_2.pathResult = var147
		else
			var147 = PathfindingService_upvr
			local tbl = {}
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			tbl.AgentRadius = var14_upvw * 0.5 * math.sqrt(var147.X * var147.X + var147.Z * var147.Z)
			tbl.AgentHeight = var141
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			tbl.AgentCanJump = true
			var147 = var147:CreatePath(tbl)
			module_upvr_2.pathResult = var147
		end
	end
	function module_upvr_2.Cleanup(arg1_18) -- Line 332
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		if module_upvr_2.stopTraverseFunc then
			module_upvr_2.stopTraverseFunc()
			module_upvr_2.stopTraverseFunc = nil
		end
		if module_upvr_2.BlockedConn then
			module_upvr_2.BlockedConn:Disconnect()
			module_upvr_2.BlockedConn = nil
		end
		if module_upvr_2.DiedConn then
			module_upvr_2.DiedConn:Disconnect()
			module_upvr_2.DiedConn = nil
		end
		if module_upvr_2.SeatedConn then
			module_upvr_2.SeatedConn:Disconnect()
			module_upvr_2.SeatedConn = nil
		end
		if module_upvr_2.TeleportedConn then
			module_upvr_2.TeleportedConn:Disconnect()
			module_upvr_2.TeleportedConn = nil
		end
		module_upvr_2.Started = false
	end
	function module_upvr_2.Cancel(arg1_19) -- Line 361
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		module_upvr_2.Cancelled = true
		module_upvr_2:Cleanup()
	end
	function module_upvr_2.IsActive(arg1_20) -- Line 366
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		local AgentCanFollowPath = module_upvr_2.AgentCanFollowPath
		if AgentCanFollowPath then
			AgentCanFollowPath = module_upvr_2.Started
			if AgentCanFollowPath then
				AgentCanFollowPath = not module_upvr_2.Cancelled
			end
		end
		return AgentCanFollowPath
	end
	function module_upvr_2.OnPathInterrupted(arg1_21) -- Line 370
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		module_upvr_2.Cancelled = true
		module_upvr_2:OnPointReached(false)
	end
	function module_upvr_2.ComputePath(arg1_22) -- Line 376
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		if module_upvr_2.OriginPoint then
			if module_upvr_2.PathComputed or module_upvr_2.PathComputing then return end
			module_upvr_2.PathComputing = true
			if module_upvr_2.AgentCanFollowPath then
				local var156
				if module_upvr_2.DirectPath then
					var156 = {}
					if not module_upvr_2.DirectPathRiseFirst or not Enum.PathWaypointAction.Jump then
					end
					var156[1] = PathWaypoint.new(module_upvr_2.OriginPoint, Enum.PathWaypointAction.Walk)
					var156[2] = PathWaypoint.new(module_upvr_2.TargetPoint, Enum.PathWaypointAction.Walk)
					module_upvr_2.pointList = var156
					var156 = true
					module_upvr_2.PathComputed = var156
				else
					var156 = module_upvr_2
					var156.pathResult:ComputeAsync(module_upvr_2.OriginPoint, module_upvr_2.TargetPoint)
					var156 = module_upvr_2.pathResult:GetWaypoints()
					module_upvr_2.pointList = var156
					var156 = module_upvr_2.pathResult.Blocked
					var156 = var156:Connect(function(arg1_23) -- Line 390
						--[[ Upvalues[1]:
							[1]: module_upvr_2 (copied, readonly)
						]]
						module_upvr_2:OnPathBlocked(arg1_23)
					end)
					module_upvr_2.BlockedConn = var156
					if module_upvr_2.pathResult.Status ~= Enum.PathStatus.Success then
						var156 = false
					else
						var156 = true
					end
					module_upvr_2.PathComputed = var156
				end
			end
			module_upvr_2.PathComputing = false
		end
	end
	function module_upvr_2.IsValidPath(arg1_24) -- Line 398
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		module_upvr_2:ComputePath()
		local PathComputed_2 = module_upvr_2.PathComputed
		if PathComputed_2 then
			PathComputed_2 = module_upvr_2.AgentCanFollowPath
		end
		return PathComputed_2
	end
	module_upvr_2.Recomputing = false
	function module_upvr_2.OnPathBlocked(arg1_25, arg2_8) -- Line 404
		--[[ Upvalues[3]:
			[1]: module_upvr_2 (readonly)
			[2]: var11_upvw (copied, read and write)
			[3]: module_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var159
		if module_upvr_2.CurrentPoint > arg2_8 then
			var159 = false
		else
			var159 = true
		end
		if not var159 or module_upvr_2.Recomputing then
		else
			module_upvr_2.Recomputing = true
			if module_upvr_2.stopTraverseFunc then
				module_upvr_2.stopTraverseFunc()
				module_upvr_2.stopTraverseFunc = nil
			end
			module_upvr_2.OriginPoint = module_upvr_2.Humanoid.RootPart.CFrame.p
			module_upvr_2.pathResult:ComputeAsync(module_upvr_2.OriginPoint, module_upvr_2.TargetPoint)
			module_upvr_2.pointList = module_upvr_2.pathResult:GetWaypoints()
			if 0 < #module_upvr_2.pointList then
				module_upvr_2.HumanoidOffsetFromPath = module_upvr_2.pointList[1].Position - module_upvr_2.OriginPoint
			end
			if module_upvr_2.pathResult.Status ~= Enum.PathStatus.Success then
			else
			end
			module_upvr_2.PathComputed = true
			if var11_upvw then
				local any_CreatePathDisplay_result1_4, any_CreatePathDisplay_result2 = module_upvr.CreatePathDisplay(module_upvr_2.pointList)
				module_upvr_2.stopTraverseFunc = any_CreatePathDisplay_result1_4
				module_upvr_2.setPointFunc = any_CreatePathDisplay_result2
			end
			if module_upvr_2.PathComputed then
				module_upvr_2.CurrentPoint = 1
				module_upvr_2:OnPointReached(true)
			else
				module_upvr_2.PathFailed:Fire()
				module_upvr_2:Cleanup()
			end
			module_upvr_2.Recomputing = false
		end
	end
	local function OnRenderStepped(arg1_26, arg2_9) -- Line 440
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (readonly)
			[2]: var15_upvw (copied, read and write)
		]]
		if module_upvr_2.Started then
			if not module_upvr_2.Cancelled then
				module_upvr_2.Timeout += arg2_9
				if var15_upvw < module_upvr_2.Timeout then
					module_upvr_2:OnPointReached(false)
					return
				end
				module_upvr_2.CurrentHumanoidPosition = module_upvr_2.Humanoid.RootPart.Position + module_upvr_2.HumanoidOffsetFromPath
				module_upvr_2.CurrentHumanoidVelocity = module_upvr_2.Humanoid.RootPart.Velocity
				while module_upvr_2.Started and module_upvr_2:IsCurrentWaypointReached() do
					module_upvr_2:OnPointReached(true)
				end
				if module_upvr_2.Started then
					module_upvr_2.NextActionMoveDirection = module_upvr_2.CurrentWaypointPosition - module_upvr_2.CurrentHumanoidPosition
					if 0.000001 < module_upvr_2.NextActionMoveDirection.Magnitude then
						module_upvr_2.NextActionMoveDirection = module_upvr_2.NextActionMoveDirection.Unit
					else
						module_upvr_2.NextActionMoveDirection = Vector3.new(0, 0, 0)
					end
					if module_upvr_2.CurrentWaypointNeedsJump then
						module_upvr_2.NextActionJump = true
						module_upvr_2.CurrentWaypointNeedsJump = false
						return
					end
					module_upvr_2.NextActionJump = false
				end
			end
		end
	end
	module_upvr_2.OnRenderStepped = OnRenderStepped
	function module_upvr_2.IsCurrentWaypointReached(arg1_27) -- Line 478
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		local var162 = false
		if module_upvr_2.CurrentWaypointPlaneNormal ~= Vector3.new(0, 0, 0) then
			if module_upvr_2.CurrentWaypointPlaneNormal:Dot(module_upvr_2.CurrentHumanoidPosition) - module_upvr_2.CurrentWaypointPlaneDistance >= math.max(1, 0.0625 * -module_upvr_2.CurrentWaypointPlaneNormal:Dot(module_upvr_2.CurrentHumanoidVelocity)) then
				var162 = false
			else
				var162 = true
			end
		else
			var162 = true
		end
		if var162 then
			module_upvr_2.CurrentWaypointPosition = nil
			module_upvr_2.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
			module_upvr_2.CurrentWaypointPlaneDistance = 0
		end
		return var162
	end
	function module_upvr_2.OnPointReached(arg1_28, arg2_10) -- Line 504
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		if arg2_10 and not module_upvr_2.Cancelled then
			if module_upvr_2.setPointFunc then
				module_upvr_2.setPointFunc(module_upvr_2.CurrentPoint)
			end
			local var163 = module_upvr_2.CurrentPoint + 1
			if #module_upvr_2.pointList < var163 then
				if module_upvr_2.stopTraverseFunc then
					module_upvr_2.stopTraverseFunc()
				end
				module_upvr_2.Finished:Fire()
				module_upvr_2:Cleanup()
			else
				local var164 = module_upvr_2.pointList[module_upvr_2.CurrentPoint]
				local var165 = module_upvr_2.pointList[var163]
				local any_GetState_result1_3 = module_upvr_2.Humanoid:GetState()
				local var167 = true
				if any_GetState_result1_3 ~= Enum.HumanoidStateType.FallingDown then
					var167 = true
					if any_GetState_result1_3 ~= Enum.HumanoidStateType.Freefall then
						if any_GetState_result1_3 ~= Enum.HumanoidStateType.Jumping then
							var167 = false
						else
							var167 = true
						end
					end
				end
				if var167 then
					local var168
					if var165.Action ~= Enum.PathWaypointAction.Jump then
						var168 = false
					else
						var168 = true
					end
					if not var168 and 1 < module_upvr_2.CurrentPoint then
						local var169 = var164.Position - module_upvr_2.pointList[module_upvr_2.CurrentPoint - 1].Position
						local var170 = var165.Position - var164.Position
						if Vector2.new(var169.x, var169.z).Unit:Dot(Vector2.new(var170.x, var170.z).Unit) >= 0.996 then
							var168 = false
						else
							var168 = true
						end
					end
					if var168 then
						module_upvr_2.Humanoid.FreeFalling:Wait()
						wait(0.1)
					end
				end
				module_upvr_2:MoveToNextWayPoint(var164, var165, var163)
			end
		end
		module_upvr_2.PathFailed:Fire()
		module_upvr_2:Cleanup()
	end
	function module_upvr_2.MoveToNextWayPoint(arg1_29, arg2_11, arg3_3, arg4) -- Line 567
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (readonly)
			[2]: var87_upvr (copied, readonly)
		]]
		module_upvr_2.CurrentWaypointPlaneNormal = arg2_11.Position - arg3_3.Position
		local var171
		if not var87_upvr or arg3_3.Label ~= "Climb" then
			var171 = Vector3.new(module_upvr_2.CurrentWaypointPlaneNormal.X, 0, module_upvr_2.CurrentWaypointPlaneNormal.Z)
			module_upvr_2.CurrentWaypointPlaneNormal = var171
		end
		var171 = module_upvr_2.CurrentWaypointPlaneNormal
		var171 = 0.000001
		if var171 < var171.Magnitude then
			var171 = module_upvr_2.CurrentWaypointPlaneNormal.Unit
			module_upvr_2.CurrentWaypointPlaneNormal = var171
			var171 = module_upvr_2.CurrentWaypointPlaneNormal:Dot(arg3_3.Position)
			module_upvr_2.CurrentWaypointPlaneDistance = var171
		else
			var171 = Vector3.new(0, 0, 0)
			module_upvr_2.CurrentWaypointPlaneNormal = var171
			var171 = 0
			module_upvr_2.CurrentWaypointPlaneDistance = var171
		end
		if arg3_3.Action ~= Enum.PathWaypointAction.Jump then
			var171 = false
		else
			var171 = true
		end
		module_upvr_2.CurrentWaypointNeedsJump = var171
		var171 = arg3_3.Position
		module_upvr_2.CurrentWaypointPosition = var171
		module_upvr_2.CurrentPoint = arg4
		var171 = 0
		module_upvr_2.Timeout = var171
	end
	local function Start(arg1_30, arg2_12) -- Line 599
		--[[ Upvalues[3]:
			[1]: module_upvr_2 (readonly)
			[2]: module_upvr (copied, readonly)
			[3]: var11_upvw (copied, read and write)
		]]
		if not module_upvr_2.AgentCanFollowPath then
			module_upvr_2.PathFailed:Fire()
		else
			if module_upvr_2.Started then return end
			module_upvr_2.Started = true
			module_upvr.CancelFailureAnimation()
			if var11_upvw and (arg2_12 == nil or arg2_12) then
				local any_CreatePathDisplay_result1, any_CreatePathDisplay_result2_2 = module_upvr.CreatePathDisplay(module_upvr_2.pointList, module_upvr_2.OriginalTargetPoint)
				module_upvr_2.stopTraverseFunc = any_CreatePathDisplay_result1
				module_upvr_2.setPointFunc = any_CreatePathDisplay_result2_2
			end
			if 0 < #module_upvr_2.pointList then
				module_upvr_2.HumanoidOffsetFromPath = Vector3.new(0, module_upvr_2.pointList[1].Position.Y - module_upvr_2.OriginPoint.Y, 0)
				module_upvr_2.CurrentHumanoidPosition = module_upvr_2.Humanoid.RootPart.Position + module_upvr_2.HumanoidOffsetFromPath
				module_upvr_2.CurrentHumanoidVelocity = module_upvr_2.Humanoid.RootPart.Velocity
				module_upvr_2.SeatedConn = module_upvr_2.Humanoid.Seated:Connect(function(arg1_31, arg2_13) -- Line 626
					--[[ Upvalues[1]:
						[1]: module_upvr_2 (copied, readonly)
					]]
					module_upvr_2:OnPathInterrupted()
				end)
				module_upvr_2.DiedConn = module_upvr_2.Humanoid.Died:Connect(function() -- Line 627
					--[[ Upvalues[1]:
						[1]: module_upvr_2 (copied, readonly)
					]]
					module_upvr_2:OnPathInterrupted()
				end)
				module_upvr_2.TeleportedConn = module_upvr_2.Humanoid.RootPart:GetPropertyChangedSignal("CFrame"):Connect(function() -- Line 628
					--[[ Upvalues[1]:
						[1]: module_upvr_2 (copied, readonly)
					]]
					module_upvr_2:OnPathInterrupted()
				end)
				module_upvr_2.CurrentPoint = 1
				module_upvr_2:OnPointReached(true)
				return
			end
			module_upvr_2.PathFailed:Fire()
			if module_upvr_2.stopTraverseFunc then
				module_upvr_2.stopTraverseFunc()
			end
		end
	end
	module_upvr_2.Start = Start
	var141 = module_upvr_2.TargetPoint
	var141 = any_getUserFlag_result1_upvr
	local var177
	if var141 then
		var141 = RaycastParams_new_result1_upvr
		if var46_upvw then
		else
			var46_upvw = {}
			var147 = var46_upvw
			var177 = ""
			assert(var147, var177)
			var147 = var46_upvw
			var177 = LocalPlayer_upvr
			if var177 then
				var177 = LocalPlayer_upvr.Character
			end
			table.insert(var147, var177)
		end
		var141.FilterDescendantsInstances = var46_upvw
		var141 = Workspace_upvr
		var147 = Vector3.new(-0, -50, -0)
		var141 = var141:Raycast(var141 + module_upvr_2.TargetSurfaceNormal * 1.5, var147, RaycastParams_new_result1_upvr)
		if var141 then
			module_upvr_2.TargetPoint = var141.Position
			-- KONSTANTWARNING: GOTO [460] #333
		end
	else
		var141 = Ray.new
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		var141 = var141(var141 + module_upvr_2.TargetSurfaceNormal * 1.5, Vector3.new(0, -50, 0))
		var147 = var141
		if var46_upvw then
		else
			var46_upvw = {}
			assert(var46_upvw, "")
			local var178 = LocalPlayer_upvr
			if var178 then
				var178 = LocalPlayer_upvr.Character
			end
			table.insert(var46_upvw, var178)
		end
		local any_FindPartOnRayWithIgnoreList_result1_4, any_FindPartOnRayWithIgnoreList_result2_4 = Workspace_upvr:FindPartOnRayWithIgnoreList(var147, var46_upvw)
		if any_FindPartOnRayWithIgnoreList_result1_4 then
			module_upvr_2.TargetPoint = any_FindPartOnRayWithIgnoreList_result2_4
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 112 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [460] 333. Error Block 63 start (CF ANALYSIS FAILED)
	var141 = module_upvr_2:ComputePath
	var141()
	do
		return module_upvr_2
	end
	-- KONSTANTERROR: [460] 333. Error Block 63 end (CF ANALYSIS FAILED)
end
local function _() -- Line 664, Named "CheckAlive"
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var42_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var181 = LocalPlayer_upvr
	local var182 = var181
	if var182 then
		var182 = var181.Character
	end
	if var182 then
		local var183 = var42_upvr[var181]
		if var183 and var183.Parent == var182 then
			local _ = var183
		else
			var42_upvr[var181] = nil
			local class_Humanoid_5 = var182:FindFirstChildOfClass("Humanoid")
			if class_Humanoid_5 then
				var42_upvr[var181] = class_Humanoid_5
			end
		end
	else
	end
	var181 = false
	local var186 = var181
	if nil ~= nil then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if 0 >= nil.Health then
			var186 = false
		else
			var186 = true
		end
	end
	return var186
end
local function GetEquippedTool_upvr(arg1) -- Line 669, Named "GetEquippedTool"
	if arg1 ~= nil then
		for _, v_3 in pairs(arg1:GetChildren()) do
			if v_3:IsA("Tool") then
				return v_3
			end
		end
	end
end
local var192_upvw
local var193_upvw
local var194_upvw
local function CleanupPath() -- Line 684
	--[[ Upvalues[3]:
		[1]: var192_upvw (read and write)
		[2]: var193_upvw (read and write)
		[3]: var194_upvw (read and write)
	]]
	if var192_upvw then
		var192_upvw:Cancel()
		var192_upvw = nil
	end
	if var193_upvw then
		var193_upvw:Disconnect()
		var193_upvw = nil
	end
	if var194_upvw then
		var194_upvw:Disconnect()
		var194_upvw = nil
	end
end
local function HandleMoveTo_upvr(arg1, arg2, arg3, arg4, arg5) -- Line 702, Named "HandleMoveTo"
	--[[ Upvalues[6]:
		[1]: var192_upvw (read and write)
		[2]: var193_upvw (read and write)
		[3]: var194_upvw (read and write)
		[4]: GetEquippedTool_upvr (readonly)
		[5]: var12_upvw (read and write)
		[6]: module_upvr (readonly)
	]]
	if var192_upvw then
		if var192_upvw then
			var192_upvw:Cancel()
			var192_upvw = nil
		end
		if var193_upvw then
			var193_upvw:Disconnect()
			var193_upvw = nil
		end
		if var194_upvw then
			var194_upvw:Disconnect()
			var194_upvw = nil
		end
	end
	var192_upvw = arg1
	arg1:Start(arg5)
	var193_upvw = arg1.Finished.Event:Connect(function() -- Line 709
		--[[ Upvalues[6]:
			[1]: var192_upvw (copied, read and write)
			[2]: var193_upvw (copied, read and write)
			[3]: var194_upvw (copied, read and write)
			[4]: arg3 (readonly)
			[5]: GetEquippedTool_upvr (copied, readonly)
			[6]: arg4 (readonly)
		]]
		if var192_upvw then
			var192_upvw:Cancel()
			var192_upvw = nil
		end
		if var193_upvw then
			var193_upvw:Disconnect()
			var193_upvw = nil
		end
		if var194_upvw then
			var194_upvw:Disconnect()
			var194_upvw = nil
		end
		if arg3 then
			local GetEquippedTool_upvr_result1 = GetEquippedTool_upvr(arg4)
			if GetEquippedTool_upvr_result1 then
				GetEquippedTool_upvr_result1:Activate()
			end
		end
	end)
	var194_upvw = arg1.PathFailed.Event:Connect(function() -- Line 718
		--[[ Upvalues[7]:
			[1]: var192_upvw (copied, read and write)
			[2]: var193_upvw (copied, read and write)
			[3]: var194_upvw (copied, read and write)
			[4]: arg5 (readonly)
			[5]: var12_upvw (copied, read and write)
			[6]: module_upvr (copied, readonly)
			[7]: arg2 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
		var192_upvw:Cancel()
		var192_upvw = nil
		-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [8] 8. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [8] 8. Error Block 3 end (CF ANALYSIS FAILED)
	end)
end
local function _(arg1) -- Line 730, Named "ShowPathFailedFeedback"
	--[[ Upvalues[3]:
		[1]: var192_upvw (read and write)
		[2]: var12_upvw (read and write)
		[3]: module_upvr (readonly)
	]]
	if var192_upvw and var192_upvw:IsActive() then
		var192_upvw:Cancel()
	end
	if var12_upvw then
		module_upvr.PlayFailureAnimation()
	end
	module_upvr.DisplayFailureWaypoint(arg1)
end
local StarterGui_upvr = game:GetService("StarterGui")
function OnTap(arg1, arg2, arg3) -- Line 740
	--[[ Upvalues[17]:
		[1]: Workspace_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: var42_upvr (readonly)
		[4]: any_getUserFlag_result1_upvr (readonly)
		[5]: var46_upvw (read and write)
		[6]: RaycastParams_new_result1_upvr (readonly)
		[7]: StarterGui_upvr (readonly)
		[8]: Players_upvr (readonly)
		[9]: var192_upvw (read and write)
		[10]: var193_upvw (read and write)
		[11]: var194_upvw (read and write)
		[12]: Pather_upvr (readonly)
		[13]: HandleMoveTo_upvr (readonly)
		[14]: var12_upvw (read and write)
		[15]: module_upvr (readonly)
		[16]: tbl_6_upvr (readonly)
		[17]: GetEquippedTool_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 176 start (CF ANALYSIS FAILED)
	local var200 = LocalPlayer_upvr
	local var201 = var200
	if var201 then
		var201 = var200.Character
	end
	if var201 then
		local var202 = var42_upvr[var200]
		if var202 and var202.Parent == var201 then
			local _ = var202
		else
			var42_upvr[var200] = nil
			local class_Humanoid_4 = var201:FindFirstChildOfClass("Humanoid")
			if class_Humanoid_4 then
				var42_upvr[var200] = class_Humanoid_4
			end
		end
	else
	end
	-- KONSTANTERROR: [0] 1. Error Block 176 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [37] 31. Error Block 166 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if 0 >= nil.Health then
	else
	end
	-- KONSTANTERROR: [37] 31. Error Block 166 end (CF ANALYSIS FAILED)
end
local function _(arg1) -- Line 850, Named "DisconnectEvent"
	if arg1 then
		arg1:Disconnect()
	end
end
local module_upvr_4 = require(script.Parent:WaitForChild("Keyboard"))
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr_4)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new(arg1) -- Line 861
	--[[ Upvalues[2]:
		[1]: module_upvr_4 (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr_4.new(arg1), setmetatable_result1_2_upvr)
	setmetatable_result1.fingerTouches = {}
	setmetatable_result1.numUnsunkTouches = 0
	setmetatable_result1.mouse1Down = tick()
	setmetatable_result1.mouse1DownPos = Vector2.new()
	setmetatable_result1.mouse2DownTime = tick()
	setmetatable_result1.mouse2DownPos = Vector2.new()
	setmetatable_result1.mouse2UpTime = tick()
	setmetatable_result1.keyboardMoveVector = Vector3.new(0, 0, 0)
	setmetatable_result1.tapConn = nil
	setmetatable_result1.inputBeganConn = nil
	setmetatable_result1.inputChangedConn = nil
	setmetatable_result1.inputEndedConn = nil
	setmetatable_result1.humanoidDiedConn = nil
	setmetatable_result1.characterChildAddedConn = nil
	setmetatable_result1.onCharacterAddedConn = nil
	setmetatable_result1.characterChildRemovedConn = nil
	setmetatable_result1.renderSteppedConn = nil
	setmetatable_result1.menuOpenedConnection = nil
	setmetatable_result1.running = false
	setmetatable_result1.wasdEnabled = false
	return setmetatable_result1
end
function setmetatable_result1_2_upvr.DisconnectEvents(arg1) -- Line 893
	local tapConn = arg1.tapConn
	if tapConn then
		tapConn:Disconnect()
	end
	local inputBeganConn = arg1.inputBeganConn
	if inputBeganConn then
		inputBeganConn:Disconnect()
	end
	local inputChangedConn = arg1.inputChangedConn
	if inputChangedConn then
		inputChangedConn:Disconnect()
	end
	local inputEndedConn = arg1.inputEndedConn
	if inputEndedConn then
		inputEndedConn:Disconnect()
	end
	local humanoidDiedConn_2 = arg1.humanoidDiedConn
	if humanoidDiedConn_2 then
		humanoidDiedConn_2:Disconnect()
	end
	local characterChildAddedConn = arg1.characterChildAddedConn
	if characterChildAddedConn then
		characterChildAddedConn:Disconnect()
	end
	local onCharacterAddedConn = arg1.onCharacterAddedConn
	if onCharacterAddedConn then
		onCharacterAddedConn:Disconnect()
	end
	local renderSteppedConn = arg1.renderSteppedConn
	if renderSteppedConn then
		renderSteppedConn:Disconnect()
	end
	local characterChildRemovedConn = arg1.characterChildRemovedConn
	if characterChildRemovedConn then
		characterChildRemovedConn:Disconnect()
	end
	local menuOpenedConnection = arg1.menuOpenedConnection
	if menuOpenedConnection then
		menuOpenedConnection:Disconnect()
	end
end
function setmetatable_result1_2_upvr.OnTouchBegan(arg1, arg2, arg3) -- Line 906
	if arg1.fingerTouches[arg2] == nil then
		if not arg3 then
			arg1.numUnsunkTouches += 1
		end
	end
	arg1.fingerTouches[arg2] = arg3
end
function setmetatable_result1_2_upvr.OnTouchChanged(arg1, arg2, arg3) -- Line 913
	if arg1.fingerTouches[arg2] == nil then
		arg1.fingerTouches[arg2] = arg3
		if not arg3 then
			arg1.numUnsunkTouches += 1
		end
	end
end
function setmetatable_result1_2_upvr.OnTouchEnded(arg1, arg2, arg3) -- Line 922
	if arg1.fingerTouches[arg2] ~= nil then
		if arg1.fingerTouches[arg2] == false then
			arg1.numUnsunkTouches -= 1
		end
	end
	arg1.fingerTouches[arg2] = nil
end
local GuiService_upvr = game:GetService("GuiService")
function setmetatable_result1_2_upvr.OnCharacterAdded(arg1, arg2) -- Line 930
	--[[ Upvalues[7]:
		[1]: UserInputService_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
		[3]: var192_upvw (read and write)
		[4]: var193_upvw (read and write)
		[5]: var194_upvw (read and write)
		[6]: module_upvr (readonly)
		[7]: GuiService_upvr (readonly)
	]]
	arg1:DisconnectEvents()
	arg1.inputBeganConn = UserInputService_upvr.InputBegan:Connect(function(arg1_32, arg2_14) -- Line 933
		--[[ Upvalues[6]:
			[1]: arg1 (readonly)
			[2]: tbl_5_upvr (copied, readonly)
			[3]: var192_upvw (copied, read and write)
			[4]: var193_upvw (copied, read and write)
			[5]: var194_upvw (copied, read and write)
			[6]: module_upvr (copied, readonly)
		]]
		if arg1_32.UserInputType == Enum.UserInputType.Touch then
			arg1:OnTouchBegan(arg1_32, arg2_14)
		end
		if arg1.wasdEnabled then
			if arg2_14 == false and arg1_32.UserInputType == Enum.UserInputType.Keyboard and tbl_5_upvr[arg1_32.KeyCode] then
				if var192_upvw then
					var192_upvw:Cancel()
					var192_upvw = nil
				end
				if var193_upvw then
					var193_upvw:Disconnect()
					var193_upvw = nil
				end
				if var194_upvw then
					var194_upvw:Disconnect()
					var194_upvw = nil
				end
				module_upvr.CancelFailureAnimation()
			end
		end
		if arg1_32.UserInputType == Enum.UserInputType.MouseButton1 then
			arg1.mouse1DownTime = tick()
			arg1.mouse1DownPos = arg1_32.Position
		end
		if arg1_32.UserInputType == Enum.UserInputType.MouseButton2 then
			arg1.mouse2DownTime = tick()
			arg1.mouse2DownPos = arg1_32.Position
		end
	end)
	arg1.inputChangedConn = UserInputService_upvr.InputChanged:Connect(function(arg1_33, arg2_15) -- Line 954
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_33.UserInputType == Enum.UserInputType.Touch then
			arg1:OnTouchChanged(arg1_33, arg2_15)
		end
	end)
	arg1.inputEndedConn = UserInputService_upvr.InputEnded:Connect(function(arg1_34, arg2_16) -- Line 960
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var192_upvw (copied, read and write)
		]]
		if arg1_34.UserInputType == Enum.UserInputType.Touch then
			arg1:OnTouchEnded(arg1_34, arg2_16)
		end
		local var226
		if arg1_34.UserInputType == var226 then
			var226 = tick()
			arg1.mouse2UpTime = var226
			local Position = arg1_34.Position
			var226 = var192_upvw
			if not var226 then
				if arg1.keyboardMoveVector.Magnitude > 0 then
					var226 = false
				else
					var226 = true
				end
			end
			if arg1.mouse2UpTime - arg1.mouse2DownTime < 0.25 and (Position - arg1.mouse2DownPos).magnitude < 5 and var226 then
				OnTap({Position})
			end
		end
	end)
	arg1.tapConn = UserInputService_upvr.TouchTap:Connect(function(arg1_35, arg2_17) -- Line 977
		if not arg2_17 then
			OnTap(arg1_35, nil, true)
		end
	end)
	arg1.menuOpenedConnection = GuiService_upvr.MenuOpened:Connect(function() -- Line 983
		--[[ Upvalues[3]:
			[1]: var192_upvw (copied, read and write)
			[2]: var193_upvw (copied, read and write)
			[3]: var194_upvw (copied, read and write)
		]]
		if var192_upvw then
			var192_upvw:Cancel()
			var192_upvw = nil
		end
		if var193_upvw then
			var193_upvw:Disconnect()
			var193_upvw = nil
		end
		if var194_upvw then
			var194_upvw:Disconnect()
			var194_upvw = nil
		end
	end)
	local function OnCharacterChildAdded_upvr(arg1_36) -- Line 987, Named "OnCharacterChildAdded"
		--[[ Upvalues[2]:
			[1]: UserInputService_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if UserInputService_upvr.TouchEnabled then
			if arg1_36:IsA("Tool") then
				arg1_36.ManualActivationOnly = true
			end
		end
		if arg1_36:IsA("Humanoid") then
			local humanoidDiedConn = arg1.humanoidDiedConn
			if humanoidDiedConn then
				humanoidDiedConn:Disconnect()
			end
			arg1.humanoidDiedConn = arg1_36.Died:Connect(function() -- Line 995
			end)
		end
	end
	arg1.characterChildAddedConn = arg2.ChildAdded:Connect(function(arg1_37) -- Line 1003
		--[[ Upvalues[1]:
			[1]: OnCharacterChildAdded_upvr (readonly)
		]]
		OnCharacterChildAdded_upvr(arg1_37)
	end)
	arg1.characterChildRemovedConn = arg2.ChildRemoved:Connect(function(arg1_38) -- Line 1006
		--[[ Upvalues[1]:
			[1]: UserInputService_upvr (copied, readonly)
		]]
		if UserInputService_upvr.TouchEnabled then
			if arg1_38:IsA("Tool") then
				arg1_38.ManualActivationOnly = false
			end
		end
	end)
	for _, v_4 in pairs(arg2:GetChildren()) do
		OnCharacterChildAdded_upvr(v_4)
	end
end
function setmetatable_result1_2_upvr.Start(arg1) -- Line 1018
	arg1:Enable(true)
end
function setmetatable_result1_2_upvr.Stop(arg1) -- Line 1022
	arg1:Enable(false)
end
function setmetatable_result1_2_upvr.CleanupPath(arg1) -- Line 1026
	--[[ Upvalues[3]:
		[1]: var192_upvw (read and write)
		[2]: var193_upvw (read and write)
		[3]: var194_upvw (read and write)
	]]
	if var192_upvw then
		var192_upvw:Cancel()
		var192_upvw = nil
	end
	if var193_upvw then
		var193_upvw:Disconnect()
		var193_upvw = nil
	end
	if var194_upvw then
		var194_upvw:Disconnect()
		var194_upvw = nil
	end
end
function setmetatable_result1_2_upvr.Enable(arg1, arg2, arg3, arg4) -- Line 1030
	--[[ Upvalues[6]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var192_upvw (read and write)
		[3]: var193_upvw (read and write)
		[4]: var194_upvw (read and write)
		[5]: UserInputService_upvr (readonly)
		[6]: module_upvr_4 (readonly)
	]]
	if arg2 then
		if not arg1.running then
			if LocalPlayer_upvr.Character then
				arg1:OnCharacterAdded(LocalPlayer_upvr.Character)
			end
			arg1.onCharacterAddedConn = LocalPlayer_upvr.CharacterAdded:Connect(function(arg1_40) -- Line 1036
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				arg1:OnCharacterAdded(arg1_40)
			end)
			arg1.running = true
		end
		arg1.touchJumpController = arg4
		if arg1.touchJumpController then
			arg1.touchJumpController:Enable(arg1.jumpEnabled)
			-- KONSTANTWARNING: GOTO [113] #83
		end
	else
		if arg1.running then
			arg1:DisconnectEvents()
			if var192_upvw then
				var192_upvw:Cancel()
				var192_upvw = nil
			end
			if var193_upvw then
				var193_upvw:Disconnect()
				var193_upvw = nil
			end
			if var194_upvw then
				var194_upvw:Disconnect()
				var194_upvw = nil
			end
			if UserInputService_upvr.TouchEnabled then
				local Character = LocalPlayer_upvr.Character
				if Character then
					for _, v_5 in pairs(Character:GetChildren()) do
						if v_5:IsA("Tool") then
							v_5.ManualActivationOnly = false
						end
					end
				end
			end
			arg1.running = false
		end
		if arg1.touchJumpController and not arg1.jumpEnabled then
			arg1.touchJumpController:Enable(true)
		end
		arg1.touchJumpController = nil
	end
	module_upvr_4.Enable(arg1, arg2)
	if not arg2 or not arg3 then
	end
	arg1.wasdEnabled = false
	arg1.enabled = arg2
end
function setmetatable_result1_2_upvr.OnRenderStepped(arg1, arg2) -- Line 1075
	--[[ Upvalues[1]:
		[1]: var192_upvw (read and write)
	]]
	arg1.isJumping = false
	if var192_upvw then
		var192_upvw:OnRenderStepped(arg2)
		if var192_upvw then
			arg1.moveVector = var192_upvw.NextActionMoveDirection
			arg1.moveVectorIsCameraRelative = false
			if var192_upvw.NextActionJump then
				arg1.isJumping = true
				-- KONSTANTWARNING: GOTO [43] #31
			end
		else
			arg1.moveVector = arg1.keyboardMoveVector
			arg1.moveVectorIsCameraRelative = true
		end
	else
		arg1.moveVector = arg1.keyboardMoveVector
		arg1.moveVectorIsCameraRelative = true
	end
	if arg1.jumpRequested then
		arg1.isJumping = true
	end
end
function setmetatable_result1_2_upvr.UpdateMovement(arg1, arg2) -- Line 1110
	if arg2 == Enum.UserInputState.Cancel then
		arg1.keyboardMoveVector = Vector3.new(0, 0, 0)
	elseif arg1.wasdEnabled then
		arg1.keyboardMoveVector = Vector3.new(arg1.leftValue + arg1.rightValue, 0, arg1.forwardValue + arg1.backwardValue)
	end
end
function setmetatable_result1_2_upvr.UpdateJump(arg1) -- Line 1119
end
function setmetatable_result1_2_upvr.SetShowPath(arg1, arg2) -- Line 1124
	--[[ Upvalues[1]:
		[1]: var11_upvw (read and write)
	]]
	var11_upvw = arg2
end
function setmetatable_result1_2_upvr.GetShowPath(arg1) -- Line 1128
	--[[ Upvalues[1]:
		[1]: var11_upvw (read and write)
	]]
	return var11_upvw
end
function setmetatable_result1_2_upvr.SetWaypointTexture(arg1, arg2) -- Line 1132
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.SetWaypointTexture(arg2)
end
function setmetatable_result1_2_upvr.GetWaypointTexture(arg1) -- Line 1136
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.GetWaypointTexture()
end
function setmetatable_result1_2_upvr.SetWaypointRadius(arg1, arg2) -- Line 1140
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.SetWaypointRadius(arg2)
end
function setmetatable_result1_2_upvr.GetWaypointRadius(arg1) -- Line 1144
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.GetWaypointRadius()
end
function setmetatable_result1_2_upvr.SetEndWaypointTexture(arg1, arg2) -- Line 1148
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.SetEndWaypointTexture(arg2)
end
function setmetatable_result1_2_upvr.GetEndWaypointTexture(arg1) -- Line 1152
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.GetEndWaypointTexture()
end
function setmetatable_result1_2_upvr.SetWaypointsAlwaysOnTop(arg1, arg2) -- Line 1156
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.SetWaypointsAlwaysOnTop(arg2)
end
function setmetatable_result1_2_upvr.GetWaypointsAlwaysOnTop(arg1) -- Line 1160
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.GetWaypointsAlwaysOnTop()
end
function setmetatable_result1_2_upvr.SetFailureAnimationEnabled(arg1, arg2) -- Line 1164
	--[[ Upvalues[1]:
		[1]: var12_upvw (read and write)
	]]
	var12_upvw = arg2
end
function setmetatable_result1_2_upvr.GetFailureAnimationEnabled(arg1) -- Line 1168
	--[[ Upvalues[1]:
		[1]: var12_upvw (read and write)
	]]
	return var12_upvw
end
function setmetatable_result1_2_upvr.SetIgnoredPartsTag(arg1, arg2) -- Line 1172
	--[[ Upvalues[1]:
		[1]: UpdateIgnoreTag_upvr (readonly)
	]]
	UpdateIgnoreTag_upvr(arg2)
end
function setmetatable_result1_2_upvr.GetIgnoredPartsTag(arg1) -- Line 1176
	--[[ Upvalues[1]:
		[1]: var47_upvw (read and write)
	]]
	return var47_upvw
end
function setmetatable_result1_2_upvr.SetUseDirectPath(arg1, arg2) -- Line 1180
	--[[ Upvalues[1]:
		[1]: var13_upvw (read and write)
	]]
	var13_upvw = arg2
end
function setmetatable_result1_2_upvr.GetUseDirectPath(arg1) -- Line 1184
	--[[ Upvalues[1]:
		[1]: var13_upvw (read and write)
	]]
	return var13_upvw
end
function setmetatable_result1_2_upvr.SetAgentSizeIncreaseFactor(arg1, arg2) -- Line 1188
	--[[ Upvalues[1]:
		[1]: var14_upvw (read and write)
	]]
	var14_upvw = arg2 / 100 + 1
end
function setmetatable_result1_2_upvr.GetAgentSizeIncreaseFactor(arg1) -- Line 1192
	--[[ Upvalues[1]:
		[1]: var14_upvw (read and write)
	]]
	return (var14_upvw - 1) * 100
end
function setmetatable_result1_2_upvr.SetUnreachableWaypointTimeout(arg1, arg2) -- Line 1196
	--[[ Upvalues[1]:
		[1]: var15_upvw (read and write)
	]]
	var15_upvw = arg2
end
function setmetatable_result1_2_upvr.GetUnreachableWaypointTimeout(arg1) -- Line 1200
	--[[ Upvalues[1]:
		[1]: var15_upvw (read and write)
	]]
	return var15_upvw
end
function setmetatable_result1_2_upvr.SetUserJumpEnabled(arg1, arg2) -- Line 1204
	arg1.jumpEnabled = arg2
	if arg1.touchJumpController then
		arg1.touchJumpController:Enable(arg2)
	end
end
function setmetatable_result1_2_upvr.GetUserJumpEnabled(arg1) -- Line 1211
	return arg1.jumpEnabled
end
function setmetatable_result1_2_upvr.MoveTo(arg1, arg2, arg3, arg4) -- Line 1215
	--[[ Upvalues[3]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: Pather_upvr (readonly)
		[3]: HandleMoveTo_upvr (readonly)
	]]
	local Character_2 = LocalPlayer_upvr.Character
	if Character_2 == nil then
		return false
	end
	local Pather_result1 = Pather_upvr(arg2, Vector3.new(0, 1, 0), arg4)
	if Pather_result1 then
		if Pather_result1:IsValidPath() then
			HandleMoveTo_upvr(Pather_result1, arg2, nil, Character_2, arg3)
			return true
		end
	end
	return false
end
return setmetatable_result1_2_upvr