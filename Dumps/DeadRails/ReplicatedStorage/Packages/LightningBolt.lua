--[[
    Script: ReplicatedStorage.Packages.LightningBolt
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:36
-- Luau version 6, Types version 3
-- Time taken: 0.003726 seconds

local clock_upvr = os.clock
local var2_upvw
function DiscretePulse(arg1, arg2, arg3, arg4, arg5, arg6, arg7) -- Line 14
	return math.clamp((arg3) / (2 * arg4) - math.abs((arg1 - arg5 * arg2 + 0.5 * arg3) / arg4), arg6, arg7)
end
function NoiseBetween(arg1, arg2, arg3, arg4, arg5) -- Line 18
	return arg4 + (arg5 - arg4) * (math.noise(arg1, arg2, arg3) + 0.5)
end
function CubicBezier(arg1, arg2, arg3, arg4, arg5) -- Line 22
	return arg1 * (1 - arg5) ^ 3 + arg2 * 3 * arg5 * (1 - arg5) ^ 2 + arg3 * 3 * (1 - arg5) * arg5 ^ 2 + arg4 * arg5 ^ 3
end
local ImageHandleAdornment_upvr = Instance.new("ImageHandleAdornment")
ImageHandleAdornment_upvr.Name = "BoltAdorn"
ImageHandleAdornment_upvr.Image = "http://www.roblox.com/asset/?id=4955566540"
ImageHandleAdornment_upvr.Transparency = 1
ImageHandleAdornment_upvr.Color3 = Color3.new(1, 1, 1)
ImageHandleAdornment_upvr.ZIndex = 0
ImageHandleAdornment_upvr.Size = Vector2.new(0, 0)
local tbl_upvr = {}
local module_upvr = {}
module_upvr.__index = module_upvr
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local var7_upvw
local var8_upvw
function module_upvr.new(arg1, arg2, arg3) -- Line 49
	--[[ Upvalues[8]:
		[1]: module_upvr (readonly)
		[2]: var2_upvw (read and write)
		[3]: LocalPlayer_upvr (readonly)
		[4]: var7_upvw (read and write)
		[5]: var8_upvw (read and write)
		[6]: ImageHandleAdornment_upvr (readonly)
		[7]: clock_upvr (readonly)
		[8]: tbl_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.Enabled = true
	setmetatable_result1.Attachment0 = arg1
	setmetatable_result1.Attachment1 = arg2
	setmetatable_result1.CurveSize0 = 0
	setmetatable_result1.CurveSize1 = 0
	setmetatable_result1.MinRadius = 0
	setmetatable_result1.MaxRadius = 2.4
	setmetatable_result1.Frequency = 1
	setmetatable_result1.AnimationSpeed = 7
	setmetatable_result1.Thickness = 2
	setmetatable_result1.MinThicknessMultiplier = 0.2
	setmetatable_result1.MaxThicknessMultiplier = 1
	setmetatable_result1.MinTransparency = 0
	setmetatable_result1.MaxTransparency = 1
	setmetatable_result1.PulseSpeed = 2
	setmetatable_result1.PulseLength = 1000000
	setmetatable_result1.FadeLength = 0.2
	setmetatable_result1.ContractFrom = 0.5
	setmetatable_result1.Color = Color3.new(1, 1, 1)
	setmetatable_result1.ColorOffsetSpeed = 3
	setmetatable_result1.Parts = {}
	var2_upvw = workspace.CurrentCamera
	if LocalPlayer_upvr.PlayerGui:FindFirstChild("LightningBeams") == nil then
		var7_upvw = Instance.new("ScreenGui")
		var7_upvw.Name = "LightningBeams"
		var7_upvw.ResetOnSpawn = false
		var7_upvw.Parent = LocalPlayer_upvr.PlayerGui
		var8_upvw = Instance.new("Part")
		var8_upvw.Anchored = true
		var8_upvw.Locked = true
		var8_upvw.CanCollide = false
		var8_upvw.CFrame = CFrame.new()
		var8_upvw.Size = Vector3.new(0, 0, 0)
		var8_upvw.Transparency = 1
		var8_upvw.Parent = var7_upvw
		var8_upvw.Name = "AdorneePart"
	end
	local var12 = arg1
	local var13 = arg2
	local WorldPosition = var12.WorldPosition
	local var15 = arg3 or 30
	for i = 1, var15 do
		local CubicBezier_result1 = CubicBezier(WorldPosition, var12.WorldPosition + var12.WorldAxis * setmetatable_result1.CurveSize0, var13.WorldPosition - var13.WorldAxis * setmetatable_result1.CurveSize1, var13.WorldPosition, i / var15)
		local var17
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var17 = CFrame.lookAt(WorldPosition, CubicBezier_result1).Position
			return var17
		end
		if i == var15 or not INLINED() then
			var17 = CubicBezier_result1
		end
		local clone = ImageHandleAdornment_upvr:Clone()
		clone.Parent = var7_upvw
		clone.Adornee = var8_upvw
		setmetatable_result1.Parts[i] = clone
	end
	setmetatable_result1.PartsHidden = false
	setmetatable_result1.DisabledTransparency = 1
	setmetatable_result1.StartT = clock_upvr()
	setmetatable_result1.RanNum = math.random() * 100
	setmetatable_result1.RefIndex = #tbl_upvr + 1
	tbl_upvr[setmetatable_result1.RefIndex] = setmetatable_result1
	return setmetatable_result1
end
function module_upvr.Destroy(arg1) -- Line 127
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	tbl_upvr[arg1.RefIndex] = nil
	for i_2 = 1, #arg1.Parts do
		arg1.Parts[i_2]:Destroy()
		if i_2 % 100 == 0 then
			wait()
		end
	end
end
local Cross_upvr = Vector3.new().Cross
game:GetService("RunService").Heartbeat:Connect(function() -- Line 142
	--[[ Upvalues[4]:
		[1]: tbl_upvr (readonly)
		[2]: clock_upvr (readonly)
		[3]: Cross_upvr (readonly)
		[4]: var2_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local pairs_result1, pairs_result2, pairs_result3 = pairs(tbl_upvr)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [441] 342. Error Block 37 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [441] 342. Error Block 37 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [441.5]
	-- KONSTANTERROR: [5] 5. Error Block 2 end (CF ANALYSIS FAILED)
end)
return module_upvr