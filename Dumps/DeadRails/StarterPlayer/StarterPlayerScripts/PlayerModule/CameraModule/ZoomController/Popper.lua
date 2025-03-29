--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:01
-- Luau version 6, Types version 3
-- Time taken: 0.008224 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local Players = game:GetService("Players")
local CurrentCamera_upvr = game.Workspace.CurrentCamera
local any_getUserFlag_result1_upvr = require(script.Parent.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserRaycastPerformanceImprovements")
local tan_upvr = math.tan
local rad_upvr = math.rad
local new_upvr = Ray.new
local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.IgnoreWater = true
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
local RaycastParams_new_result1_upvr_2 = RaycastParams.new()
RaycastParams_new_result1_upvr_2.IgnoreWater = true
RaycastParams_new_result1_upvr_2.FilterType = Enum.RaycastFilterType.Include
local function _(arg1) -- Line 31, Named "getTotalTransparency"
	return 1 - (1 - arg1.Transparency) * (1 - arg1.LocalTransparencyModifier)
end
local function _(arg1, arg2) -- Line 35, Named "eraseFromEnd"
	for i = #arg1, arg2 + 1, -1 do
		arg1[i] = nil
	end
end
local var26_upvw
local var27_upvw
local function updateProjection() -- Line 42
	--[[ Upvalues[5]:
		[1]: CurrentCamera_upvr (readonly)
		[2]: rad_upvr (readonly)
		[3]: var26_upvw (read and write)
		[4]: tan_upvr (readonly)
		[5]: var27_upvw (read and write)
	]]
	local ViewportSize = CurrentCamera_upvr.ViewportSize
	var26_upvw = tan_upvr(rad_upvr(CurrentCamera_upvr.FieldOfView) / 2) * 2
	var27_upvw = ViewportSize.X / ViewportSize.Y * var26_upvw
end
CurrentCamera_upvr:GetPropertyChangedSignal("FieldOfView"):Connect(updateProjection)
CurrentCamera_upvr:GetPropertyChangedSignal("ViewportSize"):Connect(updateProjection)
local ViewportSize_3 = CurrentCamera_upvr.ViewportSize
var26_upvw = tan_upvr(rad_upvr(CurrentCamera_upvr.FieldOfView) / 2) * 2
local var30_upvw = var26_upvw
var27_upvw = ViewportSize_3.X / ViewportSize_3.Y * var30_upvw
local NearPlaneZ_upvw = CurrentCamera_upvr.NearPlaneZ
local function playerAdded() -- Line 57
	--[[ Upvalues[2]:
		[1]: NearPlaneZ_upvw (read and write)
		[2]: CurrentCamera_upvr (readonly)
	]]
	NearPlaneZ_upvw = CurrentCamera_upvr.NearPlaneZ
end
CurrentCamera_upvr:GetPropertyChangedSignal("NearPlaneZ"):Connect(playerAdded)
local tbl_upvw = {}
local tbl_upvr_2 = {}
local function _() -- Line 65, Named "refreshIgnoreList"
	--[[ Upvalues[2]:
		[1]: tbl_upvw (read and write)
		[2]: tbl_upvr_2 (readonly)
	]]
	local var39 = 1
	tbl_upvw = {}
	for _, v in pairs(tbl_upvr_2) do
		tbl_upvw[var39] = v
		var39 += 1
	end
end
function playerAdded(arg1) -- Line 74
	--[[ Upvalues[2]:
		[1]: tbl_upvr_2 (readonly)
		[2]: tbl_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	arg1.CharacterAdded:Connect(function(arg1_2) -- Line 75, Named "characterAdded"
		--[[ Upvalues[3]:
			[1]: tbl_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: tbl_upvw (copied, read and write)
		]]
		tbl_upvr_2[arg1] = arg1_2
		local var56 = 1
		tbl_upvw = {}
		for _, v_2 in pairs(tbl_upvr_2) do
			tbl_upvw[var56] = v_2
			var56 += 1
		end
	end)
	arg1.CharacterRemoving:Connect(function() -- Line 79, Named "characterRemoving"
		--[[ Upvalues[3]:
			[1]: tbl_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: tbl_upvw (copied, read and write)
		]]
		tbl_upvr_2[arg1] = nil
		local var64 = 1
		tbl_upvw = {}
		for _, v_3 in pairs(tbl_upvr_2) do
			tbl_upvw[var64] = v_3
			var64 += 1
		end
	end)
	if arg1.Character then
		tbl_upvr_2[arg1] = arg1.Character
		tbl_upvw = {}
		for _, v_4 in pairs(tbl_upvr_2) do
			tbl_upvw[1] = v_4
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local var71
		end
	end
end
local var43 = playerAdded
Players.PlayerAdded:Connect(var43)
Players.PlayerRemoving:Connect(function(arg1) -- Line 91, Named "playerRemoving"
	--[[ Upvalues[2]:
		[1]: tbl_upvr_2 (readonly)
		[2]: tbl_upvw (read and write)
	]]
	tbl_upvr_2[arg1] = nil
	local var76 = 1
	tbl_upvw = {}
	for _, v_5 in pairs(tbl_upvr_2) do
		tbl_upvw[var76] = v_5
		var76 += 1
	end
end)
for _, v_6 in ipairs(Players:GetPlayers()) do
	var43(v_6)
end
tbl_upvw = {}
local var83_upvw = tbl_upvw
for _, v_7 in pairs(tbl_upvr_2) do
	var83_upvw[1] = v_7
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local var87
end
tbl_upvr_2 = nil
local var88_upvw = tbl_upvr_2
local var89_upvw
CurrentCamera_upvr:GetPropertyChangedSignal("CameraSubject"):Connect(function() -- Line 125
	--[[ Upvalues[2]:
		[1]: CurrentCamera_upvr (readonly)
		[2]: var89_upvw (read and write)
	]]
	local CameraSubject = CurrentCamera_upvr.CameraSubject
	if CameraSubject:IsA("Humanoid") then
		var89_upvw = CameraSubject.RootPart
	else
		if CameraSubject:IsA("BasePart") then
			var89_upvw = CameraSubject
			return
		end
		var89_upvw = nil
	end
end)
local function _(arg1) -- Line 136, Named "canOcclude"
	--[[ Upvalues[1]:
		[1]: var88_upvw (read and write)
	]]
	local var94 = false
	if 1 - (1 - arg1.Transparency) * (1 - arg1.LocalTransparencyModifier) < 0.25 then
		var94 = arg1.CanCollide
		if var94 then
			var94 = false
			if var88_upvw ~= (arg1:GetRootPart() or arg1) then
				var94 = not arg1:IsA("TrussPart")
			end
		end
	end
	return var94
end
local tbl_upvr = {Vector2.new(0.4, 0), Vector2.new(-0.4, 0), Vector2.new(0, -0.4), Vector2.new(0, 0.4), Vector2.new(0, 0.2)}
local function getCollisionPoint_upvr(arg1, arg2) -- Line 164, Named "getCollisionPoint"
	--[[ Upvalues[4]:
		[1]: any_getUserFlag_result1_upvr (readonly)
		[2]: RaycastParams_new_result1_upvr (readonly)
		[3]: var83_upvw (read and write)
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
runluau:8340 function astgen
runluau:8357 function astgen_protected
runluau:8418 function decompile_bytecode
runluau:11983 function wrapped
runluau:11991
runluau:12015 function _decompile
runluau:12181 function decompile
runluau:12377

end
local function queryPoint_upvr(arg1, arg2, arg3, arg4) -- Line 202, Named "queryPoint"
	--[[ Upvalues[7]:
		[1]: var83_upvw (read and write)
		[2]: NearPlaneZ_upvw (read and write)
		[3]: any_getUserFlag_result1_upvr (readonly)
		[4]: RaycastParams_new_result1_upvr (readonly)
		[5]: var88_upvw (read and write)
		[6]: RaycastParams_new_result1_upvr_2 (readonly)
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
runluau:8340 function astgen
runluau:8357 function astgen_protected
runluau:8418 function decompile_bytecode
runluau:11983 function wrapped
runluau:11991
runluau:12015 function _decompile
runluau:12181 function decompile
runluau:12377

end
local function queryViewport_upvr(arg1, arg2) -- Line 306, Named "queryViewport"
	--[[ Upvalues[5]:
		[1]: CurrentCamera_upvr (readonly)
		[2]: var27_upvw (read and write)
		[3]: var30_upvw (read and write)
		[4]: NearPlaneZ_upvw (read and write)
		[5]: queryPoint_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	debug.profilebegin("queryViewport")
	local ViewportSize_2 = CurrentCamera_upvr.ViewportSize
	local var105
	for i_9 = 0, 1 do
		for i_10 = 0, 1 do
			local queryPoint_upvr_result1, queryPoint_upvr_result2 = queryPoint_upvr(arg1.p + NearPlaneZ_upvw * ((arg1.rightVector) * ((i_9 - 0.5) * var27_upvw) + (arg1.upVector) * ((i_10 - 0.5) * var30_upvw)), -arg1.lookVector, arg2, CurrentCamera_upvr:ViewportPointToRay(ViewportSize_2.x * i_9, ViewportSize_2.y * i_10).Origin)
			if queryPoint_upvr_result2 < math.huge then
			end
			if queryPoint_upvr_result1 < var105 then
				var105 = queryPoint_upvr_result1
			end
		end
	end
	debug.profileend()
	return var105, queryPoint_upvr_result2
end
local min_upvr = math.min
local function testPromotion_upvr(arg1, arg2, arg3) -- Line 347, Named "testPromotion"
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
		local getCollisionPoint_upvr_result1 = getCollisionPoint_upvr(p, arg1.rightVector * v_8.x + arg1.upVector * v_8.y)
		if queryPoint_upvr(getCollisionPoint_upvr_result1, (p + -arg1.lookVector * arg2 - getCollisionPoint_upvr_result1).Unit, arg2) == math.huge then
			return false
		end
	end
	debug.profileend()
	debug.profileend()
	return true
end
return function(arg1, arg2, arg3) -- Line 396, Named "Popper"
	--[[ Upvalues[4]:
		[1]: var88_upvw (read and write)
		[2]: var89_upvw (read and write)
		[3]: queryViewport_upvr (readonly)
		[4]: testPromotion_upvr (readonly)
	]]
	debug.profilebegin("popper")
	local var118
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var118 = var89_upvw:GetRootPart()
		return var118
	end
	if not var89_upvw or not INLINED() then
		var118 = var89_upvw
	end
	var88_upvw = var118
	var118 = arg2
	local queryViewport_upvr_result1, queryViewport_upvr_result2 = queryViewport_upvr(arg1, arg2)
	if queryViewport_upvr_result2 < var118 then
		var118 = queryViewport_upvr_result2
	end
	if queryViewport_upvr_result1 < var118 and testPromotion_upvr(arg1, arg2, arg3) then
		var118 = queryViewport_upvr_result1
	end
	var88_upvw = nil
	debug.profileend()
	return var118
end