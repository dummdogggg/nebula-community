--[[
    Script: ReplicatedStorage.Packages.FastCastRedux.ActiveCast
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:25
-- Luau version 6, Types version 3
-- Time taken: 0.016789 seconds

local module_upvr_3 = {}
module_upvr_3.__index = module_upvr_3
module_upvr_3.__type = "ActiveCast"
local Table_upvr = require(script.Parent.Table)
local var3_upvw
local function _() -- Line 61, Named "GetFastCastVisualizationContainer"
	local FastCastVisualizationObjects = workspace.Terrain:FindFirstChild("FastCastVisualizationObjects")
	if FastCastVisualizationObjects ~= nil then
		return FastCastVisualizationObjects
	end
	local Folder = Instance.new("Folder")
	Folder.Name = "FastCastVisualizationObjects"
	Folder.Archivable = false
	Folder.Parent = workspace.Terrain
	return Folder
end
local function _(arg1) -- Line 79, Named "PrintDebug"
	--[[ Upvalues[1]:
		[1]: var3_upvw (read and write)
	]]
	if var3_upvw.DebugLogging == true then
		print(arg1)
	end
end
function DbgVisualizeSegment(arg1, arg2) -- Line 86
	--[[ Upvalues[1]:
		[1]: var3_upvw (read and write)
	]]
	if var3_upvw.VisualizeCasts ~= true then
		return nil
	end
	local ConeHandleAdornment = Instance.new("ConeHandleAdornment")
	ConeHandleAdornment.Adornee = workspace.Terrain
	ConeHandleAdornment.CFrame = arg1
	ConeHandleAdornment.Height = arg2
	ConeHandleAdornment.Color3 = Color3.new()
	ConeHandleAdornment.Radius = 0.25
	local var7 = 0.5
	ConeHandleAdornment.Transparency = var7
	if workspace.Terrain:FindFirstChild("FastCastVisualizationObjects") ~= nil then
		var7 = workspace.Terrain:FindFirstChild("FastCastVisualizationObjects")
	else
		local Folder_3 = Instance.new("Folder")
		Folder_3.Name = "FastCastVisualizationObjects"
		Folder_3.Archivable = false
		Folder_3.Parent = workspace.Terrain
		var7 = Folder_3
	end
	ConeHandleAdornment.Parent = var7
	return ConeHandleAdornment
end
function DbgVisualizeHit(arg1, arg2) -- Line 100
	--[[ Upvalues[1]:
		[1]: var3_upvw (read and write)
	]]
	local var9
	if var3_upvw.VisualizeCasts ~= true then
		return nil
	end
	var9 = "SphereHandleAdornment"
	local any = Instance.new(var9)
	var9 = workspace.Terrain
	any.Adornee = var9
	any.CFrame = arg1
	var9 = 0.4
	any.Radius = var9
	var9 = 0.25
	any.Transparency = var9
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var9 = Color3.new(0.2, 1, 0.5)
		return var9
	end
	if arg2 ~= false or not INLINED() then
		var9 = Color3.new(1, 0.2, 0.2)
	end
	any.Color3 = var9
	if workspace.Terrain:FindFirstChild("FastCastVisualizationObjects") ~= nil then
		var9 = workspace.Terrain:FindFirstChild("FastCastVisualizationObjects")
	else
		local Folder_2 = Instance.new("Folder")
		Folder_2.Name = "FastCastVisualizationObjects"
		Folder_2.Archivable = false
		Folder_2.Parent = workspace.Terrain
		var9 = Folder_2
	end
	any.Parent = var9
	return any
end
local function _(arg1, arg2, arg3, arg4) -- Line 120, Named "GetPositionAtTime"
	return arg2 + arg3 * arg1 + Vector3.new(arg4.X * arg1 ^ 2 / 2, arg4.Y * arg1 ^ 2 / 2, arg4.Z * arg1 ^ 2 / 2)
end
local function _(arg1, arg2, arg3) -- Line 126, Named "GetVelocityAtTime"
	return arg2 + arg3 * arg1
end
local function GetTrajectoryInfo_upvr(arg1, arg2) -- Line 130, Named "GetTrajectoryInfo"
	local var12
	if arg1.StateInfo.UpdateConnection == nil then
		var12 = false
	else
		var12 = true
	end
	assert(var12, "This ActiveCast has been terminated. It can no longer be used.")
	var12 = arg1.StateInfo
	var12 = var12.Trajectories[arg2]
	local var13 = var12.EndTime - var12.StartTime
	local InitialVelocity_3 = var12.InitialVelocity
	local Acceleration_4 = var12.Acceleration
	return {var12.Origin + InitialVelocity_3 * var13 + Vector3.new(Acceleration_4.X * var13 ^ 2 / 2, Acceleration_4.Y * var13 ^ 2 / 2, Acceleration_4.Z * var13 ^ 2 / 2), InitialVelocity_3 + Acceleration_4 * var13}
end
local function _(arg1) -- Line 143, Named "GetLatestTrajectoryEndInfo"
	--[[ Upvalues[1]:
		[1]: GetTrajectoryInfo_upvr (readonly)
	]]
	local var17
	if arg1.StateInfo.UpdateConnection == nil then
		var17 = false
	else
		var17 = true
	end
	assert(var17, "This ActiveCast has been terminated. It can no longer be used.")
	var17 = arg1
	return GetTrajectoryInfo_upvr(var17, #arg1.StateInfo.Trajectories)
end
local function _(arg1) -- Line 148, Named "CloneCastParams"
	local RaycastParams_new_result1_3 = RaycastParams.new()
	RaycastParams_new_result1_3.CollisionGroup = arg1.CollisionGroup
	RaycastParams_new_result1_3.FilterType = arg1.FilterType
	RaycastParams_new_result1_3.FilterDescendantsInstances = arg1.FilterDescendantsInstances
	RaycastParams_new_result1_3.IgnoreWater = arg1.IgnoreWater
	return RaycastParams_new_result1_3
end
local function _(arg1, arg2, arg3, arg4) -- Line 157, Named "SendRayHit"
	arg1.Caster.RayHit:Fire(arg1, arg2, arg3, arg4)
end
local function _(arg1, arg2, arg3, arg4) -- Line 162, Named "SendRayPierced"
	arg1.Caster.RayPierced:Fire(arg1, arg2, arg3, arg4)
end
local function _(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 167, Named "SendLengthChanged"
	arg1.Caster.LengthChanged:Fire(arg1, arg2, arg3, arg4, arg5, arg6)
end
local function SimulateCast_upvr(arg1, arg2, arg3) -- Line 173, Named "SimulateCast"
	--[[ Upvalues[2]:
		[1]: var3_upvw (read and write)
		[2]: Table_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 137 start (CF ANALYSIS FAILED)
	local var19
	if arg1.StateInfo.UpdateConnection == nil then
		var19 = false
	else
		var19 = true
	end
	assert(var19, "This ActiveCast has been terminated. It can no longer be used.")
	var19 = var3_upvw
	-- KONSTANTERROR: [0] 1. Error Block 137 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 13. Error Block 6 start (CF ANALYSIS FAILED)
	var19 = "Casting for frame."
	print(var19)
	-- KONSTANTERROR: [19] 13. Error Block 6 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 16. Error Block 7 start (CF ANALYSIS FAILED)
	var19 = arg1.StateInfo.Trajectories
	local var20 = var19[#arg1.StateInfo.Trajectories]
	var19 = var20.Origin
	local InitialVelocity_2 = var20.InitialVelocity
	local Acceleration_2 = var20.Acceleration
	local var24 = arg1.StateInfo.TotalRuntime - var20.StartTime
	local var25 = var19 + InitialVelocity_2 * var24 + Vector3.new(Acceleration_2.X * var24 ^ 2 / 2, Acceleration_2.Y * var24 ^ 2 / 2, Acceleration_2.Z * var24 ^ 2 / 2)
	local StateInfo = arg1.StateInfo
	StateInfo.TotalRuntime += arg2
	local var27 = arg1.StateInfo.TotalRuntime - var20.StartTime
	local var28 = var27
	-- KONSTANTERROR: [23] 16. Error Block 7 end (CF ANALYSIS FAILED)
end
local TypeMarshaller_upvr = require(script.Parent.TypeMarshaller)
local RunService_upvr = game:GetService("RunService")
function module_upvr_3.new(arg1, arg2, arg3, arg4, arg5) -- Line 422
	--[[ Upvalues[6]:
		[1]: TypeMarshaller_upvr (readonly)
		[2]: Table_upvr (readonly)
		[3]: RunService_upvr (readonly)
		[4]: module_upvr_3 (readonly)
		[5]: var3_upvw (read and write)
		[6]: SimulateCast_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 52 start (CF ANALYSIS FAILED)
	local var44
	if TypeMarshaller_upvr(arg4) == "number" then
		var44 = arg3.Unit * var44
	end
	if arg5.HighFidelitySegmentSize <= 0 then
		error("Cannot set FastCastBehavior.HighFidelitySegmentSize <= 0!", 0)
	end
	local module_upvr = {}
	module_upvr.Caster = arg1
	local tbl_5 = {
		UpdateConnection = nil;
		Paused = false;
		TotalRuntime = 0;
		DistanceCovered = 0;
		HighFidelitySegmentSize = arg5.HighFidelitySegmentSize;
		HighFidelityBehavior = arg5.HighFidelityBehavior;
		IsActivelySimulatingPierce = false;
		IsActivelyResimulating = false;
		CancelHighResCast = false;
	}
	local tbl = {}
	local tbl_4 = {
		StartTime = 0;
		EndTime = -1;
	}
	tbl_4.Origin = arg2
	tbl_4.InitialVelocity = var44
	tbl_4.Acceleration = arg5.Acceleration
	tbl[1] = tbl_4
	tbl_5.Trajectories = tbl
	module_upvr.StateInfo = tbl_5
	module_upvr.RayInfo = {
		Parameters = arg5.RaycastParams;
		WorldRoot = workspace;
		MaxDistance = arg5.MaxDistance or 1000;
		CosmeticBulletObject = arg5.CosmeticBulletTemplate;
		CanPierceCallback = arg5.CanPierceFunction;
	}
	module_upvr.UserData = {}
	if module_upvr.StateInfo.HighFidelityBehavior == 2 then
		module_upvr.StateInfo.HighFidelityBehavior = 3
	end
	if module_upvr.RayInfo.Parameters ~= nil then
		local Parameters = module_upvr.RayInfo.Parameters
		local RaycastParams_new_result1 = RaycastParams.new()
		RaycastParams_new_result1.CollisionGroup = Parameters.CollisionGroup
		RaycastParams_new_result1.FilterType = Parameters.FilterType
		RaycastParams_new_result1.FilterDescendantsInstances = Parameters.FilterDescendantsInstances
		RaycastParams_new_result1.IgnoreWater = Parameters.IgnoreWater
		module_upvr.RayInfo.Parameters = RaycastParams_new_result1
	else
		module_upvr.RayInfo.Parameters = RaycastParams.new()
	end
	if arg5.CosmeticBulletProvider == nil then
		if module_upvr.RayInfo.CosmeticBulletObject ~= nil then
			module_upvr.RayInfo.CosmeticBulletObject = module_upvr.RayInfo.CosmeticBulletObject:Clone()
			module_upvr.RayInfo.CosmeticBulletObject:PivotTo(CFrame.new(arg2, arg2 + arg3))
			module_upvr.RayInfo.CosmeticBulletObject.Parent = arg5.CosmeticBulletContainer
			-- KONSTANTWARNING: GOTO [251] #151
		end
		-- KONSTANTWARNING: GOTO [251] #151
	end
	if TypeMarshaller_upvr(arg5.CosmeticBulletProvider) == "PartCache" then
		if module_upvr.RayInfo.CosmeticBulletObject ~= nil then
			warn("Do not define FastCastBehavior.CosmeticBulletTemplate and FastCastBehavior.CosmeticBulletProvider at the same time! The provider will be used, and CosmeticBulletTemplate will be set to nil.")
			module_upvr.RayInfo.CosmeticBulletObject = nil
			arg5.CosmeticBulletTemplate = nil
		end
		module_upvr.RayInfo.CosmeticBulletObject = arg5.CosmeticBulletProvider:GetPart()
		module_upvr.RayInfo.CosmeticBulletObject.CFrame = CFrame.new(arg2, arg2 + arg3)
		-- KONSTANTWARNING: GOTO [251] #151
	end
	-- KONSTANTERROR: [0] 1. Error Block 52 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [244] 146. Error Block 38 start (CF ANALYSIS FAILED)
	warn("FastCastBehavior.CosmeticBulletProvider was not an instance of the PartCache module (an external/separate model)! Are you inputting an instance created via PartCache.new? If so, are you on the latest version of PartCache? Setting FastCastBehavior.CosmeticBulletProvider to nil.")
	arg5.CosmeticBulletProvider = nil
	if true then
		local _ = arg5.CosmeticBulletProvider.CurrentCacheParent
	else
	end
	if arg5.AutoIgnoreContainer == true and arg5.CosmeticBulletContainer ~= nil then
		local FilterDescendantsInstances = module_upvr.RayInfo.Parameters.FilterDescendantsInstances
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if Table_upvr.find(FilterDescendantsInstances, arg5.CosmeticBulletContainer) == nil then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			Table_upvr.insert(FilterDescendantsInstances, arg5.CosmeticBulletContainer)
			module_upvr.RayInfo.Parameters.FilterDescendantsInstances = FilterDescendantsInstances
		end
	end
	FilterDescendantsInstances = nil
	local var54 = FilterDescendantsInstances
	if RunService_upvr:IsClient() then
		var54 = RunService_upvr.RenderStepped
	else
		var54 = RunService_upvr.Heartbeat
	end
	setmetatable(module_upvr, module_upvr_3)
	module_upvr.StateInfo.UpdateConnection = var54:Connect(function(arg1_3) -- Line 535
		--[[ Upvalues[3]:
			[1]: module_upvr (readonly)
			[2]: var3_upvw (copied, read and write)
			[3]: SimulateCast_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 5. Error Block 2 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [6] 5. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 6. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 6. Error Block 3 end (CF ANALYSIS FAILED)
	end)
	do
		return module_upvr
	end
	-- KONSTANTERROR: [244] 146. Error Block 38 end (CF ANALYSIS FAILED)
end
function module_upvr_3.SetStaticFastCastReference(arg1) -- Line 619
	--[[ Upvalues[1]:
		[1]: var3_upvw (read and write)
	]]
	var3_upvw = arg1
end
local function ModifyTransformation_upvr(arg1, arg2, arg3, arg4) -- Line 625, Named "ModifyTransformation"
	--[[ Upvalues[2]:
		[1]: GetTrajectoryInfo_upvr (readonly)
		[2]: Table_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Trajectories_2 = arg1.StateInfo.Trajectories
	local var57 = Trajectories_2[#Trajectories_2]
	local var58
	if var57.StartTime == arg1.StateInfo.TotalRuntime then
		if arg2 == nil then
			local InitialVelocity = var57.InitialVelocity
		end
		if arg3 == nil then
			local Acceleration = var57.Acceleration
		end
		if var58 == nil then
			var58 = var57.Origin
		end
		var57.Origin = var58
		var57.InitialVelocity = InitialVelocity
		var57.Acceleration = Acceleration
	else
		var57.EndTime = arg1.StateInfo.TotalRuntime
		if arg1.StateInfo.UpdateConnection == nil then
		else
		end
		assert(true, "This ActiveCast has been terminated. It can no longer be used.")
		local unpack_result1, unpack_result2 = unpack(GetTrajectoryInfo_upvr(arg1, #arg1.StateInfo.Trajectories))
		if InitialVelocity == nil then
		end
		if Acceleration == nil then
		end
		if var58 == nil then
		end
		Table_upvr.insert(arg1.StateInfo.Trajectories, {
			StartTime = arg1.StateInfo.TotalRuntime;
			EndTime = -1;
			Origin = unpack_result1;
			InitialVelocity = unpack_result2;
			Acceleration = var57.Acceleration;
		})
		arg1.StateInfo.CancelHighResCast = true
	end
end
function module_upvr_3.SetVelocity(arg1, arg2) -- Line 671
	--[[ Upvalues[2]:
		[1]: module_upvr_3 (readonly)
		[2]: ModifyTransformation_upvr (readonly)
	]]
	local var64
	if getmetatable(arg1) ~= module_upvr_3 then
		var64 = false
	else
		var64 = true
	end
	assert(var64, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("SetVelocity", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var64 = false
	else
		var64 = true
	end
	assert(var64, "This ActiveCast has been terminated. It can no longer be used.")
	var64 = arg1
	ModifyTransformation_upvr(var64, arg2, nil, nil)
end
function module_upvr_3.SetAcceleration(arg1, arg2) -- Line 677
	--[[ Upvalues[2]:
		[1]: module_upvr_3 (readonly)
		[2]: ModifyTransformation_upvr (readonly)
	]]
	local var65
	if getmetatable(arg1) ~= module_upvr_3 then
		var65 = false
	else
		var65 = true
	end
	assert(var65, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("SetAcceleration", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var65 = false
	else
		var65 = true
	end
	assert(var65, "This ActiveCast has been terminated. It can no longer be used.")
	var65 = arg1
	ModifyTransformation_upvr(var65, nil, arg2, nil)
end
function module_upvr_3.SetPosition(arg1, arg2) -- Line 683
	--[[ Upvalues[2]:
		[1]: module_upvr_3 (readonly)
		[2]: ModifyTransformation_upvr (readonly)
	]]
	local var66
	if getmetatable(arg1) ~= module_upvr_3 then
		var66 = false
	else
		var66 = true
	end
	assert(var66, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("SetPosition", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var66 = false
	else
		var66 = true
	end
	assert(var66, "This ActiveCast has been terminated. It can no longer be used.")
	var66 = arg1
	ModifyTransformation_upvr(var66, nil, nil, arg2)
end
function module_upvr_3.GetVelocity(arg1) -- Line 689
	--[[ Upvalues[1]:
		[1]: module_upvr_3 (readonly)
	]]
	local var67
	if getmetatable(arg1) ~= module_upvr_3 then
		var67 = false
	else
		var67 = true
	end
	assert(var67, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("GetVelocity", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var67 = false
	else
		var67 = true
	end
	assert(var67, "This ActiveCast has been terminated. It can no longer be used.")
	var67 = arg1.StateInfo.Trajectories
	local var68 = var67[#arg1.StateInfo.Trajectories]
	var67 = var68.InitialVelocity + var68.Acceleration * (arg1.StateInfo.TotalRuntime - var68.StartTime)
	return var67
end
function module_upvr_3.GetAcceleration(arg1) -- Line 696
	--[[ Upvalues[1]:
		[1]: module_upvr_3 (readonly)
	]]
	local var69
	if getmetatable(arg1) ~= module_upvr_3 then
		var69 = false
	else
		var69 = true
	end
	assert(var69, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("GetAcceleration", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var69 = false
	else
		var69 = true
	end
	assert(var69, "This ActiveCast has been terminated. It can no longer be used.")
	var69 = arg1.StateInfo.Trajectories
	var69 = var69[#arg1.StateInfo.Trajectories].Acceleration
	return var69
end
function module_upvr_3.GetPosition(arg1) -- Line 703
	--[[ Upvalues[1]:
		[1]: module_upvr_3 (readonly)
	]]
	local var70
	if getmetatable(arg1) ~= module_upvr_3 then
		var70 = false
	else
		var70 = true
	end
	assert(var70, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("GetPosition", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var70 = false
	else
		var70 = true
	end
	assert(var70, "This ActiveCast has been terminated. It can no longer be used.")
	var70 = arg1.StateInfo.Trajectories
	local var71 = var70[#arg1.StateInfo.Trajectories]
	local var72 = arg1.StateInfo.TotalRuntime - var71.StartTime
	local Acceleration_3 = var71.Acceleration
	var70 = var71.Origin + var71.InitialVelocity * var72 + Vector3.new(Acceleration_3.X * var72 ^ 2 / 2, Acceleration_3.Y * var72 ^ 2 / 2, Acceleration_3.Z * var72 ^ 2 / 2)
	return var70
end
function module_upvr_3.AddVelocity(arg1, arg2) -- Line 712
	--[[ Upvalues[1]:
		[1]: module_upvr_3 (readonly)
	]]
	local var74
	if getmetatable(arg1) ~= module_upvr_3 then
		var74 = false
	else
		var74 = true
	end
	assert(var74, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("AddVelocity", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var74 = false
	else
		var74 = true
	end
	assert(var74, "This ActiveCast has been terminated. It can no longer be used.")
	arg1:SetVelocity(arg1:GetVelocity() + arg2)
end
function module_upvr_3.AddAcceleration(arg1, arg2) -- Line 718
	--[[ Upvalues[1]:
		[1]: module_upvr_3 (readonly)
	]]
	local var75
	if getmetatable(arg1) ~= module_upvr_3 then
		var75 = false
	else
		var75 = true
	end
	assert(var75, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("AddAcceleration", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var75 = false
	else
		var75 = true
	end
	assert(var75, "This ActiveCast has been terminated. It can no longer be used.")
	arg1:SetAcceleration(arg1:GetAcceleration() + arg2)
end
function module_upvr_3.AddPosition(arg1, arg2) -- Line 724
	--[[ Upvalues[1]:
		[1]: module_upvr_3 (readonly)
	]]
	local var76
	if getmetatable(arg1) ~= module_upvr_3 then
		var76 = false
	else
		var76 = true
	end
	assert(var76, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("AddPosition", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var76 = false
	else
		var76 = true
	end
	assert(var76, "This ActiveCast has been terminated. It can no longer be used.")
	arg1:SetPosition(arg1:GetPosition() + arg2)
end
function module_upvr_3.Pause(arg1) -- Line 732
	--[[ Upvalues[1]:
		[1]: module_upvr_3 (readonly)
	]]
	local var77
	if getmetatable(arg1) ~= module_upvr_3 then
		var77 = false
	else
		var77 = true
	end
	assert(var77, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("Pause", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var77 = false
	else
		var77 = true
	end
	assert(var77, "This ActiveCast has been terminated. It can no longer be used.")
	var77 = true
	arg1.StateInfo.Paused = var77
end
function module_upvr_3.Resume(arg1) -- Line 738
	--[[ Upvalues[1]:
		[1]: module_upvr_3 (readonly)
	]]
	local var78
	if getmetatable(arg1) ~= module_upvr_3 then
		var78 = false
	else
		var78 = true
	end
	assert(var78, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("Resume", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var78 = false
	else
		var78 = true
	end
	assert(var78, "This ActiveCast has been terminated. It can no longer be used.")
	var78 = false
	arg1.StateInfo.Paused = var78
end
function module_upvr_3.Terminate(arg1) -- Line 744
	--[[ Upvalues[1]:
		[1]: module_upvr_3 (readonly)
	]]
	local var79
	if getmetatable(arg1) ~= module_upvr_3 then
		var79 = false
	else
		var79 = true
	end
	assert(var79, "Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s":format("Terminate", "ActiveCast.new(...)"))
	if arg1.StateInfo.UpdateConnection == nil then
		var79 = false
	else
		var79 = true
	end
	assert(var79, "This ActiveCast has been terminated. It can no longer be used.")
	var79 = arg1.StateInfo
	local Trajectories = var79.Trajectories
	var79 = Trajectories[#Trajectories]
	var79.EndTime = arg1.StateInfo.TotalRuntime
	arg1.StateInfo.UpdateConnection:Disconnect()
	arg1.Caster.CastTerminating:FireSync(arg1)
	arg1.StateInfo.UpdateConnection = nil
	arg1.Caster = nil
	arg1.StateInfo = nil
	arg1.RayInfo = nil
	arg1.UserData = nil
	setmetatable(arg1, nil)
end
return module_upvr_3