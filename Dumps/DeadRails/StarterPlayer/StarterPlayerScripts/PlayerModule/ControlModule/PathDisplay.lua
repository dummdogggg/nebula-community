--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.PathDisplay
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:30
-- Luau version 6, Types version 3
-- Time taken: 0.003340 seconds

local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
local module_upvr = {
	spacing = 8;
	image = "rbxasset://textures/Cursors/Gamepad/Pointer.png";
	imageSize = Vector2.new(2, 2);
}
local tbl_upvw_2 = {}
local tbl_upvw = {}
local Model_upvr = Instance.new("Model")
Model_upvr.Name = "PathDisplayPoints"
local Part = Instance.new("Part")
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
Part.Name = "PathDisplayAdornee"
Part.CFrame = CFrame.new(0, 0, 0)
Part.Parent = Model_upvr
local tbl_upvr = {}
local var10_upvw = 30
for i = 1, var10_upvw do
	local ImageHandleAdornment = Instance.new("ImageHandleAdornment")
	ImageHandleAdornment.Archivable = false
	ImageHandleAdornment.Adornee = Part
	ImageHandleAdornment.Image = module_upvr.image
	ImageHandleAdornment.Size = module_upvr.imageSize
	tbl_upvr[i] = ImageHandleAdornment
end
local function _() -- Line 41, Named "retrieveFromPool"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: var10_upvw (read and write)
	]]
	local _1 = tbl_upvr[1]
	if not _1 then
		return nil
	end
	tbl_upvr[1] = tbl_upvr[var10_upvw]
	tbl_upvr[var10_upvw] = nil
	var10_upvw -= 1
	return _1
end
local function _(arg1) -- Line 52, Named "returnToPool"
	--[[ Upvalues[2]:
		[1]: var10_upvw (read and write)
		[2]: tbl_upvr (readonly)
	]]
	var10_upvw += 1
	tbl_upvr[var10_upvw] = arg1
end
local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserRaycastPerformanceImprovements")
local function renderPoint_upvr(arg1, arg2) -- Line 57, Named "renderPoint"
	--[[ Upvalues[5]:
		[1]: var10_upvw (read and write)
		[2]: tbl_upvr (readonly)
		[3]: any_getUserFlag_result1_upvr (readonly)
		[4]: RaycastParams_new_result1_upvr (readonly)
		[5]: Model_upvr (readonly)
	]]
	local var14
	if var14 == 0 then
		var14 = nil
		return var14
	end
	local _1_2 = tbl_upvr[1]
	if not _1_2 then
		var14 = nil
	else
		tbl_upvr[1] = tbl_upvr[var10_upvw]
		tbl_upvr[var10_upvw] = nil
		var10_upvw -= 1
		var14 = _1_2
	end
	if any_getUserFlag_result1_upvr then
		RaycastParams_new_result1_upvr.FilterDescendantsInstances = {game.Players.LocalPlayer.Character, workspace.CurrentCamera}
		local workspace_Raycast_result1 = workspace:Raycast(arg1 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0), RaycastParams_new_result1_upvr)
		if not workspace_Raycast_result1 then
			return nil
		end
		var14.CFrame = CFrame.lookAlong(workspace_Raycast_result1.Position, workspace_Raycast_result1.Normal)
		var14.Parent = Model_upvr
		return var14
	end
	local workspace_FindPartOnRayWithIgnoreList_result1, workspace_FindPartOnRayWithIgnoreList_result2, workspace_FindPartOnRayWithIgnoreList_result3 = workspace:FindPartOnRayWithIgnoreList(Ray.new(arg1 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0)), {game.Players.LocalPlayer.Character, workspace.CurrentCamera})
	if not workspace_FindPartOnRayWithIgnoreList_result1 then
		return nil
	end
	var14.CFrame = CFrame.new(workspace_FindPartOnRayWithIgnoreList_result2, workspace_FindPartOnRayWithIgnoreList_result2 + workspace_FindPartOnRayWithIgnoreList_result3)
	var14.Parent = Model_upvr
	return var14
end
function module_upvr.setCurrentPoints(arg1) -- Line 89
	--[[ Upvalues[1]:
		[1]: tbl_upvw_2 (read and write)
	]]
	if typeof(arg1) == "table" then
		tbl_upvw_2 = arg1
	else
		tbl_upvw_2 = {}
	end
end
function module_upvr.clearRenderedPath() -- Line 97
	--[[ Upvalues[4]:
		[1]: tbl_upvw (read and write)
		[2]: var10_upvw (read and write)
		[3]: tbl_upvr (readonly)
		[4]: Model_upvr (readonly)
	]]
	for _, v in ipairs(tbl_upvw) do
		v.Parent = nil
		var10_upvw += 1
		tbl_upvr[var10_upvw] = v
	end
	tbl_upvw = {}
	Model_upvr.Parent = nil
end
function module_upvr.renderPath() -- Line 106
	--[[ Upvalues[5]:
		[1]: module_upvr (readonly)
		[2]: tbl_upvw_2 (read and write)
		[3]: tbl_upvw (read and write)
		[4]: renderPoint_upvr (readonly)
		[5]: Model_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 21 start (CF ANALYSIS FAILED)
	module_upvr.clearRenderedPath()
	local var27
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var27 = #tbl_upvw_2
		return var27 == 0
	end
	if not var27 or INLINED() then return end
	var27 = #tbl_upvw_2
	local const_number = 0
	tbl_upvw[1] = renderPoint_upvr(tbl_upvw_2[var27], true)
	local var29 = tbl_upvw
	local _1_3 = var29[1]
	-- KONSTANTERROR: [0] 1. Error Block 21 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [25] 24. Error Block 6 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [25] 24. Error Block 6 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [35] 33. Error Block 28 start (CF ANALYSIS FAILED)
	local var31 = var29 - _1_3
	local magnitude = var31.magnitude
	if magnitude < const_number then
		var27 -= 1
	else
		local renderPoint_result1 = renderPoint_upvr(_1_3 + var31.unit * (const_number - magnitude), false)
		if renderPoint_result1 then
			tbl_upvw[#tbl_upvw + 1] = renderPoint_result1
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	end
	-- KONSTANTERROR: [35] 33. Error Block 28 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [26] 25. Error Block 7 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [61.263163]
	-- KONSTANTERROR: [26] 25. Error Block 7 end (CF ANALYSIS FAILED)
end
return module_upvr