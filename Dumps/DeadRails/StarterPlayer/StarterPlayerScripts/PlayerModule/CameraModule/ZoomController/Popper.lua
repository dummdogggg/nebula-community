--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:28
-- Luau version 6, Types version 3
-- Time taken: 0.009501 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local Players = game:GetService("Players")
local module = require(script.Parent.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil"))
local any_getUserFlag_result1_upvr_2 = module.getUserFlag("UserRaycastUpdateAPI")
local var21_upvr = "UserCurrentCameraUpdate"
local any_getUserFlag_result1_upvr = module.getUserFlag(var21_upvr)
if any_getUserFlag_result1_upvr then
	var21_upvr = require(script.Parent.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("CameraWrapper")).new()
else
	var21_upvr = nil
end
if any_getUserFlag_result1_upvr then
	local _
else
end
if any_getUserFlag_result1_upvr then
	var21_upvr:Enable()
end
local tan_upvr = math.tan
local rad_upvr = math.rad
local new_upvr = Ray.new
local RaycastParams_new_result1_upvr_2 = RaycastParams.new()
RaycastParams_new_result1_upvr_2.IgnoreWater = true
RaycastParams_new_result1_upvr_2.FilterType = Enum.RaycastFilterType.Exclude
local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.IgnoreWater = true
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Include
local function _(arg1) -- Line 38, Named "getTotalTransparency"
	return 1 - (1 - arg1.Transparency) * (1 - arg1.LocalTransparencyModifier)
end
local function _(arg1, arg2) -- Line 42, Named "eraseFromEnd"
	for i = #arg1, arg2 + 1, -1 do
		arg1[i] = nil
	end
end
local var30_upvw
local var31_upvw
local var32_upvw
if any_getUserFlag_result1_upvr then
	local function updateProjection() -- Line 52
		--[[ Upvalues[5]:
			[1]: var21_upvr (readonly)
			[2]: rad_upvr (readonly)
			[3]: var32_upvw (read and write)
			[4]: tan_upvr (readonly)
			[5]: var31_upvw (read and write)
		]]
		local any_getCamera_result1 = var21_upvr:getCamera()
		local ViewportSize_2 = any_getCamera_result1.ViewportSize
		var32_upvw = tan_upvr(rad_upvr(any_getCamera_result1.FieldOfView) / 2) * 2
		var31_upvw = ViewportSize_2.X / ViewportSize_2.Y * var32_upvw
	end
	var21_upvr:Connect("FieldOfView", updateProjection)
	var21_upvr:Connect("ViewportSize", updateProjection)
	local any_getCamera_result1_2 = var21_upvr:getCamera()
	local ViewportSize = any_getCamera_result1_2.ViewportSize
	var32_upvw = tan_upvr(rad_upvr(any_getCamera_result1_2.FieldOfView) / 2) * 2
	var31_upvw = ViewportSize.X / ViewportSize.Y * var32_upvw
	var30_upvw = var21_upvr:getCamera().NearPlaneZ
	var21_upvr:Connect("NearPlaneZ", function() -- Line 68
		--[[ Upvalues[2]:
			[1]: var30_upvw (read and write)
			[2]: var21_upvr (readonly)
		]]
		var30_upvw = var21_upvr:getCamera().NearPlaneZ
	end)
else
	local CurrentCamera_upvw = game.Workspace.CurrentCamera
	local function updateProjection() -- Line 74
		--[[ Upvalues[5]:
			[1]: CurrentCamera_upvw (read and write)
			[2]: rad_upvr (readonly)
			[3]: var32_upvw (read and write)
			[4]: tan_upvr (readonly)
			[5]: var31_upvw (read and write)
		]]
		local ViewportSize_5 = CurrentCamera_upvw.ViewportSize
		var32_upvw = tan_upvr(rad_upvr(CurrentCamera_upvw.FieldOfView) / 2) * 2
		var31_upvw = ViewportSize_5.X / ViewportSize_5.Y * var32_upvw
	end
	CurrentCamera_upvw:GetPropertyChangedSignal("FieldOfView"):Connect(updateProjection)
	CurrentCamera_upvw:GetPropertyChangedSignal("ViewportSize"):Connect(updateProjection)
	local ViewportSize_3 = CurrentCamera_upvw.ViewportSize
	var32_upvw = tan_upvr(rad_upvr(CurrentCamera_upvw.FieldOfView) / 2) * 2
	var31_upvw = ViewportSize_3.X / ViewportSize_3.Y * var32_upvw
	var30_upvw = CurrentCamera_upvw.NearPlaneZ
	CurrentCamera_upvw:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() -- Line 88
		--[[ Upvalues[2]:
			[1]: var30_upvw (read and write)
			[2]: CurrentCamera_upvw (read and write)
		]]
		var30_upvw = CurrentCamera_upvw.NearPlaneZ
	end)
end
local tbl_upvw = {}
local tbl_upvr_2 = {}
local function _() -- Line 97, Named "refreshIgnoreList"
	--[[ Upvalues[2]:
		[1]: tbl_upvw (read and write)
		[2]: tbl_upvr_2 (readonly)
	]]
	local var48 = 1
	tbl_upvw = {}
	for _, v in pairs(tbl_upvr_2) do
		tbl_upvw[var48] = v
		var48 += 1
	end
end
local function playerAdded(arg1) -- Line 106
	--[[ Upvalues[2]:
		[1]: tbl_upvr_2 (readonly)
		[2]: tbl_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	arg1.CharacterAdded:Connect(function(arg1_2) -- Line 107, Named "characterAdded"
		--[[ Upvalues[3]:
			[1]: tbl_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: tbl_upvw (copied, read and write)
		]]
		tbl_upvr_2[arg1] = arg1_2
		local var64 = 1
		tbl_upvw = {}
		for _, v_2 in pairs(tbl_upvr_2) do
			tbl_upvw[var64] = v_2
			var64 += 1
		end
	end)
	arg1.CharacterRemoving:Connect(function() -- Line 111, Named "characterRemoving"
		--[[ Upvalues[3]:
			[1]: tbl_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: tbl_upvw (copied, read and write)
		]]
		tbl_upvr_2[arg1] = nil
		local var72 = 1
		tbl_upvw = {}
		for _, v_3 in pairs(tbl_upvr_2) do
			tbl_upvw[var72] = v_3
			var72 += 1
		end
	end)
	if arg1.Character then
		tbl_upvr_2[arg1] = arg1.Character
		tbl_upvw = {}
		for _, v_4 in pairs(tbl_upvr_2) do
			tbl_upvw[1] = v_4
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local var79
		end
	end
end
Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(function(arg1) -- Line 123, Named "playerRemoving"
	--[[ Upvalues[2]:
		[1]: tbl_upvr_2 (readonly)
		[2]: tbl_upvw (read and write)
	]]
	tbl_upvr_2[arg1] = nil
	local var84 = 1
	tbl_upvw = {}
	for _, v_5 in pairs(tbl_upvr_2) do
		tbl_upvw[var84] = v_5
		var84 += 1
	end
end)
for _, v_6 in ipairs(Players:GetPlayers()) do
	playerAdded(v_6)
	local var91
end
tbl_upvw = {}
local var92_upvw = tbl_upvw
for _, v_7 in pairs(tbl_upvr_2) do
	var92_upvw[1] = v_7
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local var96
end
tbl_upvr_2 = nil
local var97_upvw = tbl_upvr_2
local var98_upvw
if any_getUserFlag_result1_upvr then
	var96 = "CameraSubject"
	nil(var96, function() -- Line 158
		--[[ Upvalues[2]:
			[1]: var21_upvr (readonly)
			[2]: var98_upvw (read and write)
		]]
		local CameraSubject = var21_upvr:getCamera().CameraSubject
		if CameraSubject:IsA("Humanoid") then
			var98_upvw = CameraSubject.RootPart
		else
			if CameraSubject:IsA("BasePart") then
				var98_upvw = CameraSubject
				return
			end
			var98_upvw = nil
		end
	end)
else
	CurrentCamera_upvw:GetPropertyChangedSignal("CameraSubject"):Connect(function() -- Line 169
		--[[ Upvalues[2]:
			[1]: CurrentCamera_upvw (read and write)
			[2]: var98_upvw (read and write)
		]]
		local CameraSubject_2 = CurrentCamera_upvw.CameraSubject
		if CameraSubject_2:IsA("Humanoid") then
			var98_upvw = CameraSubject_2.RootPart
		else
			if CameraSubject_2:IsA("BasePart") then
				var98_upvw = CameraSubject_2
				return
			end
			var98_upvw = nil
		end
	end)
end
local function _(arg1) -- Line 181, Named "canOcclude"
	--[[ Upvalues[1]:
		[1]: var97_upvw (read and write)
	]]
	local var105 = false
	if 1 - (1 - arg1.Transparency) * (1 - arg1.LocalTransparencyModifier) < 0.25 then
		var105 = arg1.CanCollide
		if var105 then
			var105 = false
			if var97_upvw ~= (arg1:GetRootPart() or arg1) then
				var105 = not arg1:IsA("TrussPart")
			end
		end
	end
	return var105
end
local tbl_upvr = {Vector2.new(0.4, 0), Vector2.new(-0.4, 0), Vector2.new(0, -0.4), Vector2.new(0, 0.4), Vector2.new(0, 0.2)}
local function getCollisionPoint_upvr(arg1, arg2) -- Line 209, Named "getCollisionPoint"
	--[[ Upvalues[4]:
		[1]: any_getUserFlag_result1_upvr_2 (readonly)
		[2]: RaycastParams_new_result1_upvr_2 (readonly)
		[3]: var92_upvw (read and write)
		[4]: new_upvr (readonly)
	]]
	-- KONSTANTERROR: Failed to generate AST for function `getCollisionPoint`:
runluau:5427: assertion failed!
Traceback:
runluau:5427 function get_guaranteed_destinations
runluau:5469 function will_reach_block
runluau:5918 function astgen
runluau:8357 function astgen_protected
runluau:4639 function expr_function
runluau:7714 function NEWCLOSURE
runluau:7954 function gen_from_insts
runluau:8053 function gen_from_hl_block
runluau:8131 function gen_from_hl_block
runluau:8131 function gen_from_hl_block
runluau:8131 function gen_from_hl_block
runluau:8340 function astgen
runluau:8357 function astgen_protected
runluau:8418 function decompile_bytecode
runluau:11983 function wrapped
runluau:11991
runluau:12015 function _decompile
runluau:12181 function decompile
runluau:12377

end
local function queryPoint_upvr(arg1, arg2, arg3, arg4) -- Line 247, Named "queryPoint"
	--[[ Upvalues[7]:
		[1]: var92_upvw (read and write)
		[2]: var30_upvw (read and write)
		[3]: any_getUserFlag_result1_upvr_2 (readonly)
		[4]: RaycastParams_new_result1_upvr_2 (readonly)
		[5]: var97_upvw (read and write)
		[6]: RaycastParams_new_result1_upvr (readonly)
		[7]: new_upvr (readonly)
	]]
	-- KONSTANTERROR: Failed to generate AST for function `queryPoint`:
runluau:5427: assertion failed!
Traceback:
runluau:5427 function get_guaranteed_destinations
runluau:5469 function will_reach_block
runluau:5918 function astgen
runluau:8357 function astgen_protected
runluau:4639 function expr_function
runluau:7714 function NEWCLOSURE
runluau:7954 function gen_from_insts
runluau:8053 function gen_from_hl_block
runluau:8131 function gen_from_hl_block
runluau:8131 function gen_from_hl_block
runluau:8131 function gen_from_hl_block
runluau:8340 function astgen
runluau:8357 function astgen_protected
runluau:8418 function decompile_bytecode
runluau:11983 function wrapped
runluau:11991
runluau:12015 function _decompile
runluau:12181 function decompile
runluau:12377

end
local function queryViewport_upvr(arg1, arg2) -- Line 350, Named "queryViewport"
	--[[ Upvalues[7]:
		[1]: CurrentCamera_upvw (read and write)
		[2]: any_getUserFlag_result1_upvr (readonly)
		[3]: var21_upvr (readonly)
		[4]: var31_upvw (read and write)
		[5]: var32_upvw (read and write)
		[6]: var30_upvw (read and write)
		[7]: queryPoint_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	debug.profilebegin("queryViewport")
	local lookVector = arg1.lookVector
	local var116
	if any_getUserFlag_result1_upvr then
		lookVector = var21_upvr:getCamera()
	else
		lookVector = CurrentCamera_upvw
	end
	CurrentCamera_upvw = lookVector
	local ViewportSize_4 = CurrentCamera_upvw.ViewportSize
	var116 = math.huge
	for i_9 = 0, 1 do
		for i_10 = 0, 1 do
			local queryPoint_upvr_result1, queryPoint_upvr_result2 = queryPoint_upvr(arg1.p + var30_upvw * ((arg1.rightVector) * ((i_9 - 0.5) * var31_upvw) + (arg1.upVector) * ((i_10 - 0.5) * var32_upvw)), -lookVector, arg2, CurrentCamera_upvw:ViewportPointToRay(ViewportSize_4.x * i_9, ViewportSize_4.y * i_10).Origin)
			if queryPoint_upvr_result2 < math.huge then
			end
			if queryPoint_upvr_result1 < var116 then
				var116 = queryPoint_upvr_result1
			end
		end
	end
	debug.profileend()
	return var116, queryPoint_upvr_result2
end
local min_upvr = math.min
local function testPromotion_upvr(arg1, arg2, arg3) -- Line 393, Named "testPromotion"
	--[[ Upvalues[4]:
		[1]: getCollisionPoint_upvr (readonly)
		[2]: min_upvr (readonly)
		[3]: queryPoint_upvr (readonly)
		[4]: tbl_upvr (readonly)
	]]
	debug.profilebegin("testPromotion")
	local p = arg1.p
	debug.profilebegin("extrapolate")
	for i_11 = 0, min_upvr(1.25, arg3.rotVelocity.magnitude + (getCollisionPoint_upvr(p, arg3.posVelocity * 1.25) - p).Magnitude / arg3.posVelocity.magnitude), 0.0625 do
		local any_extrapolate_result1 = arg3.extrapolate(i_11)
		if arg2 <= queryPoint_upvr(any_extrapolate_result1.p, -any_extrapolate_result1.lookVector, arg2) then
			return false
		end
	end
	debug.profileend()
	debug.profilebegin("testOffsets")
	for _, v_8 in ipairs(tbl_upvr) do
		local getCollisionPoint_result1 = getCollisionPoint_upvr(p, arg1.rightVector * v_8.x + arg1.upVector * v_8.y)
		if queryPoint_upvr(getCollisionPoint_result1, (p + -arg1.lookVector * arg2 - getCollisionPoint_result1).Unit, arg2) == math.huge then
			return false
		end
	end
	debug.profileend()
	debug.profileend()
	return true
end
return function(arg1, arg2, arg3) -- Line 442, Named "Popper"
	--[[ Upvalues[4]:
		[1]: var97_upvw (read and write)
		[2]: var98_upvw (read and write)
		[3]: queryViewport_upvr (readonly)
		[4]: testPromotion_upvr (readonly)
	]]
	debug.profilebegin("popper")
	local var130
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var130 = var98_upvw:GetRootPart()
		return var130
	end
	if not var98_upvw or not INLINED() then
		var130 = var98_upvw
	end
	var97_upvw = var130
	var130 = arg2
	local queryViewport_upvr_result1, queryViewport_upvr_result2 = queryViewport_upvr(arg1, arg2)
	if queryViewport_upvr_result2 < var130 then
		var130 = queryViewport_upvr_result2
	end
	if queryViewport_upvr_result1 < var130 and testPromotion_upvr(arg1, arg2, arg3) then
		var130 = queryViewport_upvr_result1
	end
	var97_upvw = nil
	debug.profileend()
	return var130
end