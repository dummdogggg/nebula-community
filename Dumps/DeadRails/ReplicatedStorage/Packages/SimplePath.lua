--[[
    Script: ReplicatedStorage.Packages.SimplePath
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:27
-- Luau version 6, Types version 3
-- Time taken: 0.015922 seconds

local tbl_upvr = {
	TIME_VARIANCE = 0.07;
	COMPARISON_CHECKS = 1;
	JUMP_WHEN_STUCK = true;
}
local function _(arg1, arg2) -- Line 26, Named "output"
	local var2
	if arg1 == error then
		var2 = "SimplePath Error: "
	else
		var2 = "SimplePath: "
	end
	arg1(var2..arg2)
end
local module_upvr = {
	StatusType = {
		Idle = "Idle";
		Active = "Active";
	};
	ErrorType = {
		LimitReached = "LimitReached";
		TargetUnreachable = "TargetUnreachable";
		ComputationError = "ComputationError";
		AgentStuck = "AgentStuck";
	};
}
function module_upvr.__index(arg1, arg2) -- Line 41
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if arg2 == "Stopped" then
		local var9
		if not arg1._humanoid then
			local error = error
			if error == error then
				var9 = "SimplePath Error: "
			else
				var9 = "SimplePath: "
			end
			error(var9.."Attempt to use Path.Stopped on a non-humanoid.")
		end
	end
	if not arg1._events[arg2] or not arg1._events[arg2].Event or arg2 ~= "LastError" or not arg1._lastError or arg2 ~= "Status" or not arg1._status then
	end
	return module_upvr[arg2]
end
local Part_upvr = Instance.new("Part")
Part_upvr.Size = Vector3.new(0.30000, 0.30000, 0.30000)
Part_upvr.Anchored = true
Part_upvr.CanCollide = false
Part_upvr.Material = Enum.Material.Neon
Part_upvr.Shape = Enum.PartType.Ball
local function _(arg1, arg2) -- Line 60, Named "declareError"
	arg1._lastError = arg2
	arg1._events.Error:Fire(arg2)
end
local function createVisualWaypoints_upvr(arg1) -- Line 66, Named "createVisualWaypoints"
	--[[ Upvalues[1]:
		[1]: Part_upvr (readonly)
	]]
	local module = {}
	for _, v in ipairs(arg1) do
		local clone = Part_upvr:Clone()
		clone.Position = v.Position
		clone.Parent = workspace
		local var21
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var21 = Color3.fromRGB(0, 255, 0)
			return var21
		end
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			var21 = Color3.fromRGB(255, 0, 0)
			return var21
		end
		if v ~= arg1[#arg1] or not INLINED() or v.Action ~= Enum.PathWaypointAction.Jump or not INLINED_2() then
			var21 = Color3.fromRGB(255, 139, 0)
		end
		clone.Color = var21
		var21 = table.insert
		var21(module, clone)
	end
	return module
end
local function _(arg1) -- Line 82, Named "destroyVisualWaypoints"
	if arg1 then
		for _, v_2 in ipairs(arg1) do
			v_2:Destroy()
		end
	end
end
local function getNonHumanoidWaypoint_upvr(arg1) -- Line 92, Named "getNonHumanoidWaypoint"
	for i_3 = 2, #arg1._waypoints do
		if 0.1 < (arg1._waypoints[i_3].Position - arg1._waypoints[i_3 - 1].Position).Magnitude then
			return i_3
		end
	end
	return 2
end
local function _(arg1) -- Line 103, Named "setJumpState"
	pcall(function() -- Line 104
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and arg1._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
			arg1._humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
end
local function _(arg1) -- Line 112, Named "move"
	if arg1._waypoints[arg1._currentWaypoint].Action == Enum.PathWaypointAction.Jump then
		pcall(function() -- Line 104
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if arg1._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and arg1._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
				arg1._humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	end
	arg1._humanoid:MoveTo(arg1._waypoints[arg1._currentWaypoint].Position)
end
local function _(arg1) -- Line 120, Named "disconnectMoveConnection"
	arg1._moveConnection:Disconnect()
	arg1._moveConnection = nil
end
local function _(arg1) -- Line 126, Named "invokeWaypointReached"
	arg1._events.WaypointReached:Fire(arg1._agent, arg1._waypoints[arg1._currentWaypoint - 1], arg1._waypoints[arg1._currentWaypoint])
end
local function moveToFinished_upvr(arg1, arg2) -- Line 132, Named "moveToFinished"
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if not getmetatable(arg1) then
	else
		if not arg1._humanoid then
			if arg2 and arg1._currentWaypoint + 1 <= #arg1._waypoints then
				arg1._events.WaypointReached:Fire(arg1._agent, arg1._waypoints[arg1._currentWaypoint - 1], arg1._waypoints[arg1._currentWaypoint])
				arg1._currentWaypoint += 1
			else
				if arg2 then
					local _visualWaypoints_7 = arg1._visualWaypoints
					if _visualWaypoints_7 then
						for _, v_15 in ipairs(_visualWaypoints_7) do
							v_15:Destroy()
						end
					end
					arg1._visualWaypoints = nil
					arg1._target = nil
					arg1._events.Reached:Fire(arg1._agent, arg1._waypoints[arg1._currentWaypoint])
					return
				end
				local _visualWaypoints_6 = arg1._visualWaypoints
				if _visualWaypoints_6 then
					for _, v_16 in ipairs(_visualWaypoints_6) do
						v_16:Destroy()
					end
				end
				arg1._visualWaypoints = nil
				arg1._target = nil
				local TargetUnreachable = arg1.ErrorType.TargetUnreachable
				arg1._lastError = TargetUnreachable
				arg1._events.Error:Fire(TargetUnreachable)
			end
		end
		if arg2 and arg1._currentWaypoint + 1 <= #arg1._waypoints then
			if arg1._currentWaypoint + 1 < #arg1._waypoints then
				arg1._events.WaypointReached:Fire(arg1._agent, arg1._waypoints[arg1._currentWaypoint - 1], arg1._waypoints[arg1._currentWaypoint])
			end
			arg1._currentWaypoint += 1
			if arg1._waypoints[arg1._currentWaypoint].Action == Enum.PathWaypointAction.Jump then
				pcall(function() -- Line 104
					--[[ Upvalues[1]:
						[1]: arg1 (readonly)
					]]
					if arg1._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and arg1._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
						arg1._humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end
				end)
			end
			arg1._humanoid:MoveTo(arg1._waypoints[arg1._currentWaypoint].Position)
			return
		end
		if arg2 then
			arg1._moveConnection:Disconnect()
			arg1._moveConnection = nil
			arg1._status = module_upvr.StatusType.Idle
			local _visualWaypoints_3 = arg1._visualWaypoints
			if _visualWaypoints_3 then
				for _, v_11 in ipairs(_visualWaypoints_3) do
					v_11:Destroy()
				end
			end
			arg1._visualWaypoints = nil
			arg1._events.Reached:Fire(arg1._agent, arg1._waypoints[arg1._currentWaypoint])
			return
		end
		arg1._moveConnection:Disconnect()
		arg1._moveConnection = nil
		arg1._status = module_upvr.StatusType.Idle
		local _visualWaypoints_8 = arg1._visualWaypoints
		if _visualWaypoints_8 then
			for _, v_12 in ipairs(_visualWaypoints_8) do
				v_12:Destroy()
			end
		end
		arg1._visualWaypoints = nil
		local TargetUnreachable_2 = arg1.ErrorType.TargetUnreachable
		arg1._lastError = TargetUnreachable_2
		arg1._events.Error:Fire(TargetUnreachable_2)
	end
end
local function comparePosition_upvr(arg1) -- Line 174, Named "comparePosition"
	local var58
	if arg1._currentWaypoint == var58 then
	else
		local function INLINED_3() -- Internal function, doesn't exist in bytecode
			var58 = arg1._position._count + 1
			return var58
		end
		if (arg1._agent.PrimaryPart.Position - arg1._position._last).Magnitude > 0.07 or not INLINED_3() then
			var58 = 0
		end
		arg1._position._count = var58
		var58 = arg1._agent.PrimaryPart.Position
		arg1._position._last = var58
		var58 = arg1._position
		var58 = arg1._settings.COMPARISON_CHECKS
		if var58 <= var58._count then
			var58 = arg1._settings
			if var58.JUMP_WHEN_STUCK then
				function var58() -- Line 104
					--[[ Upvalues[1]:
						[1]: arg1 (readonly)
					]]
					if arg1._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and arg1._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
						arg1._humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end
				end
				pcall(var58)
			end
			var58 = arg1.ErrorType
			local AgentStuck = var58.AgentStuck
			arg1._lastError = AgentStuck
			var58 = arg1._events.Error:Fire
			var58(AgentStuck)
		end
	end
end
local function findWaypointIndexClosestToAgent_upvr(arg1) -- Line 186, Named "findWaypointIndexClosestToAgent"
	local var64
	for i_4, v_3 in arg1._waypoints do
		if (v_3.Position - arg1._agent.PrimaryPart.Position).Magnitude < math.huge then
		end
	end
	return nil
end
local Players_upvr = game:GetService("Players")
function module_upvr.GetNearestCharacter(arg1) -- Line 205
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	local var74
	for _, v_4 in ipairs(Players_upvr:GetPlayers()) do
		if v_4.Character and (v_4.Character.PrimaryPart.Position - arg1).Magnitude < math.huge then
		end
	end
	return nil
end
local PathfindingService_upvr = game:GetService("PathfindingService")
function module_upvr.new(arg1, arg2, arg3) -- Line 216
	--[[ Upvalues[3]:
		[1]: tbl_upvr (readonly)
		[2]: PathfindingService_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [1] 2. Error Block 31 start (CF ANALYSIS FAILED)
	local var80
	if not arg1:IsA("Model") or not arg1.PrimaryPart then
		-- KONSTANTERROR: [9] 8. Error Block 29 start (CF ANALYSIS FAILED)
		local error_5 = error
		if error_5 == error then
			var80 = "SimplePath Error: "
		else
			var80 = "SimplePath: "
		end
		error_5(var80.."Pathfinding agent must be a valid Model Instance with a set PrimaryPart.")
		-- KONSTANTERROR: [9] 8. Error Block 29 end (CF ANALYSIS FAILED)
	end
	local tbl = {}
	local var83 = arg3
	if not var83 then
		var83 = tbl_upvr
	end
	tbl._settings = var83
	tbl._events = {
		Reached = Instance.new("BindableEvent");
		WaypointReached = Instance.new("BindableEvent");
		Blocked = Instance.new("BindableEvent");
		Error = Instance.new("BindableEvent");
		Stopped = Instance.new("BindableEvent");
	}
	tbl._agent = arg1
	tbl._humanoid = arg1:FindFirstChildOfClass("Humanoid")
	tbl._path = PathfindingService_upvr:CreatePath(arg2)
	tbl._status = "Idle"
	tbl._t = 0
	tbl._position = {
		_last = Vector3.new();
		_count = 0;
	}
	local setmetatable_result1_upvr = setmetatable(tbl, module_upvr)
	for i_6, v_5 in pairs(tbl_upvr) do
		local var90
		local function INLINED_4() -- Internal function, doesn't exist in bytecode
			var90 = v_5
			return var90
		end
		if setmetatable_result1_upvr._settings[i_6] ~= nil or not INLINED_4() then
			var90 = setmetatable_result1_upvr._settings[i_6]
		end
		setmetatable_result1_upvr._settings[i_6] = var90
	end
	setmetatable_result1_upvr._path.Blocked:Connect(function(...) -- Line 247
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		if setmetatable_result1_upvr._currentWaypoint <= ... and ... <= setmetatable_result1_upvr._currentWaypoint + 1 and setmetatable_result1_upvr._humanoid then
			pcall(function() -- Line 104
				--[[ Upvalues[1]:
					[1]: setmetatable_result1_upvr (readonly)
				]]
				if setmetatable_result1_upvr._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and setmetatable_result1_upvr._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
					setmetatable_result1_upvr._humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end)
			setmetatable_result1_upvr._events.Blocked:Fire(setmetatable_result1_upvr._agent, setmetatable_result1_upvr._waypoints[...])
		end
	end)
	do
		return setmetatable_result1_upvr
	end
	-- KONSTANTERROR: [1] 2. Error Block 31 end (CF ANALYSIS FAILED)
end
function module_upvr.Destroy(arg1) -- Line 259
	for i_7, v_6 in ipairs(arg1._events) do
		v_6:Destroy()
	end
	arg1._events = nil
	if rawget(arg1, "_visualWaypoints") then
		local _visualWaypoints_5 = arg1._visualWaypoints
		if _visualWaypoints_5 then
			i_7 = _visualWaypoints_5
			for _, v_7 in ipairs(i_7) do
				v_7:Destroy()
			end
		end
		arg1._visualWaypoints = nil
	end
	arg1._path:Destroy()
	setmetatable(arg1, nil)
	for i_9, _ in pairs(arg1) do
		arg1[i_9] = nil
	end
end
function module_upvr.Stop(arg1) -- Line 274
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var113
	if not arg1._humanoid then
		local error_2 = error
		if error_2 == error then
			var113 = "SimplePath Error: "
		else
			var113 = "SimplePath: "
		end
		error_2(var113.."Attempt to call Path:Stop() on a non-humanoid.")
	else
		var113 = module_upvr
		if arg1._status == var113.StatusType.Idle then
			local function var115(arg1_2) -- Line 280
				warn(debug.traceback(arg1_2))
			end
			if var115 == error then
				var113 = "SimplePath Error: "
			else
				var113 = "SimplePath: "
			end
			var115(var113.."Attempt to run Path:Stop() in idle state")
			return
		end
		arg1._moveConnection:Disconnect()
		arg1._moveConnection = nil
		arg1._status = module_upvr.StatusType.Idle
		local _visualWaypoints_4 = arg1._visualWaypoints
		if _visualWaypoints_4 then
			var113 = _visualWaypoints_4
			for _, v_13 in ipairs(var113) do
				v_13:Destroy()
			end
		end
		arg1._visualWaypoints = nil
		arg1._events.Stopped:Fire(arg1._model)
	end
end
function module_upvr.Run(arg1, arg2) -- Line 291
	--[[ Upvalues[6]:
		[1]: moveToFinished_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: findWaypointIndexClosestToAgent_upvr (readonly)
		[4]: comparePosition_upvr (readonly)
		[5]: createVisualWaypoints_upvr (readonly)
		[6]: getNonHumanoidWaypoint_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if not arg2 then
		if not arg1._humanoid and arg1._target then
			moveToFinished_upvr(arg1, true)
			do
				return
			end
			local var188
		end
	end
	if not arg2 or typeof(arg2) ~= "Vector3" and not arg2:IsA("BasePart") then
		local error_6 = error
		if error_6 == error then
			var188 = "SimplePath Error: "
		else
			var188 = "SimplePath: "
		end
		error_6(var188.."Pathfinding target must be a valid Vector3 or BasePart.")
	end
	local var179
	if os.clock() - arg1._t <= arg1._settings.TIME_VARIANCE and arg1._humanoid then
		var179 = os.clock()
		var188 = arg1._t
		task.wait(var179 - var188)
		local LimitReached = arg1.ErrorType.LimitReached
		arg1._lastError = LimitReached
		var179 = arg1._events
		var188 = LimitReached
		var179.Error:Fire(var188)
		return false
	end
	if arg1._humanoid then
		arg1._t = os.clock()
	end
	local pcall_result1_2, _ = pcall(function() -- Line 314
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		local var182
		local function INLINED_12() -- Internal function, doesn't exist in bytecode
			var182 = arg2
			return var182
		end
		if typeof(arg2) ~= "Vector3" or not INLINED_12() then
			var182 = arg2.Position
		end
		arg1._path:ComputeAsync(arg1._agent.PrimaryPart.Position, var182)
	end)
	local function INLINED_13() -- Internal function, doesn't exist in bytecode
		var188 = Enum.PathStatus.NoPath
		var179 = var188.Status
		var188 = arg1._path
		return var179 == var188
	end
	local function INLINED_14() -- Internal function, doesn't exist in bytecode
		var188 = 2
		var179 = #var188
		var188 = arg1._path:GetWaypoints()
		return var179 < var188
	end
	local function INLINED_15() -- Internal function, doesn't exist in bytecode
		var179 = arg1._humanoid
		return var179
	end
	local function INLINED_16() -- Internal function, doesn't exist in bytecode
		var188 = Enum.HumanoidStateType.Freefall
		var179 = arg1._humanoid:GetState()
		return var179 == var188
	end
	if not pcall_result1_2 or INLINED_13() or INLINED_14() or INLINED_15() and INLINED_16() then
		var188 = arg1._visualWaypoints
		if var188 then
			for _, v_9 in ipairs(var188) do
				v_9:Destroy()
			end
		end
		var179 = nil
		arg1._visualWaypoints = var179
		var179 = task.wait
		var179()
		var188 = arg1.ErrorType
		var179 = var188.ComputationError
		arg1._lastError = var179
		var188 = arg1._events.Error:Fire
		var188(var179)
		var179 = false
		return var179
	end
	var188 = arg1._humanoid
	local function INLINED_17() -- Internal function, doesn't exist in bytecode
		var179 = var188.Active
		var188 = module_upvr.StatusType
		return var179
	end
	if not var188 or not INLINED_17() then
		var188 = module_upvr.StatusType
		var179 = var188.Idle
	end
	arg1._status = var179
	arg1._target = arg2
	var179 = pcall
	function var188() -- Line 334
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1._agent.PrimaryPart:SetNetworkOwner(nil)
	end
	var179(var188)
	var179 = arg1._path:GetWaypoints()
	arg1._waypoints = var179
	var188 = arg1._waypoints
	var179 = #var188
	var188 = 3
	if var188 <= var179 then
		var179 = findWaypointIndexClosestToAgent_upvr
		var188 = arg1
		var179 = var179(var188)
		local function INLINED_18() -- Internal function, doesn't exist in bytecode
			var188 = math.min(var179 + 3, #arg1._waypoints)
			return var188
		end
		if not var179 or not INLINED_18() then
			var188 = 3
		end
		arg1._currentWaypoint = var188
	else
		var179 = 2
		arg1._currentWaypoint = var179
	end
	var179 = arg1._humanoid
	if var179 then
		var179 = comparePosition_upvr
		var179(arg1)
	end
	local _visualWaypoints = arg1._visualWaypoints
	if _visualWaypoints then
		for _, v_10 in ipairs(_visualWaypoints) do
			v_10:Destroy()
		end
	end
	_visualWaypoints = arg1.Visualize
	local var193 = _visualWaypoints
	if var193 then
	end
	arg1._visualWaypoints = createVisualWaypoints_upvr(arg1._waypoints)
	local _humanoid = arg1._humanoid
	if _humanoid then
		_humanoid = arg1._moveConnection
		if not _humanoid then
			_humanoid = arg1._humanoid.MoveToFinished
			_humanoid = _humanoid:Connect(function(...) -- Line 358
				--[[ Upvalues[2]:
					[1]: moveToFinished_upvr (copied, readonly)
					[2]: arg1 (readonly)
				]]
				moveToFinished_upvr(arg1, ...)
			end)
		end
	end
	arg1._moveConnection = _humanoid
	if arg1._humanoid then
		arg1._humanoid:MoveTo(arg1._waypoints[arg1._currentWaypoint].Position)
	elseif #arg1._waypoints == 2 then
		arg1._target = nil
		if arg1._visualWaypoints then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			for _, v_14 in ipairs(arg1._visualWaypoints) do
				v_14:Destroy()
			end
		end
		arg1._visualWaypoints = nil
		arg1._events.Reached:Fire(arg1._agent, arg1._waypoints[2])
	else
		arg1._currentWaypoint = getNonHumanoidWaypoint_upvr(arg1)
		moveToFinished_upvr(arg1, true)
	end
	return true
end
return module_upvr