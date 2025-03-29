--[[
    Script: StarterPlayer.StarterPlayerScripts.RbxCharacterSounds
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:38
-- Luau version 6, Types version 3
-- Time taken: 0.005766 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local Players_upvr = game:GetService("Players")
local function _(arg1) -- Line 12, Named "loadFlag"
	local pcall_result1_2, pcall_result2 = pcall(function() -- Line 13
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return UserSettings():IsUserFeatureEnabled(arg1)
	end)
	return pcall_result1_2 and pcall_result2
end
local var17_upvr = "UserSoundsUseRelativeVelocity2"
local pcall_result1_3, pcall_result2_2 = pcall(function() -- Line 13
	--[[ Upvalues[1]:
		[1]: var17_upvr (readonly)
	]]
	return UserSettings():IsUserFeatureEnabled(var17_upvr)
end)
local var22_upvr = "UserFixFreeFallingSound"
function var17_upvr() -- Line 13
	--[[ Upvalues[1]:
		[1]: var22_upvr (readonly)
	]]
	return UserSettings():IsUserFeatureEnabled(var22_upvr)
end
local pcall_result1, pcall_result2_3 = pcall(var17_upvr)
local var21_upvr = pcall_result1 and pcall_result2_3
pcall_result2_3 = pcall
local var23_upvr = "UserNewCharacterSoundsApi3"
function var22_upvr() -- Line 13
	--[[ Upvalues[1]:
		[1]: var23_upvr (readonly)
	]]
	return UserSettings():IsUserFeatureEnabled(var23_upvr)
end
pcall_result2_3 = pcall_result2_3(var22_upvr)
local var20_result1, pcall_result2_3_result2 = pcall_result2_3(var22_upvr)
local var26_upvr = var20_result1 and pcall_result2_3_result2
var20_result1 = {}
local var27_upvr = var20_result1
pcall_result2_3_result2 = {}
local var28 = pcall_result2_3_result2
var23_upvr = "rbxasset://sounds/action_footsteps_plastic.mp3"
var28.SoundId = var23_upvr
var23_upvr = true
var28.Looped = var23_upvr
var27_upvr.Climbing = var28
var28 = {}
local var29 = var28
var23_upvr = "rbxasset://sounds/uuhhh.mp3"
local var30 = var23_upvr
var29.SoundId = var30
var27_upvr.Died = var29
var29 = {}
local var31 = var29
local getRelativeVelocity_upvr
if var21_upvr then
	var30 = "rbxasset://sounds/action_falling.ogg"
else
	var30 = "rbxasset://sounds/action_falling.mp3"
end
var31.SoundId = var30
var31.Looped = true
var27_upvr.FreeFalling = var31
var31 = {}
local var33 = var31
var33.SoundId = "rbxasset://sounds/action_get_up.mp3"
var27_upvr.GettingUp = var33
var33 = {}
local var34 = var33
var34.SoundId = "rbxasset://sounds/action_jump.mp3"
var27_upvr.Jumping = var34
var34 = {}
local var35 = var34
var35.SoundId = "rbxasset://sounds/action_jump_land.mp3"
var27_upvr.Landing = var35
var35 = {}
local var36 = var35
var36.SoundId = "rbxasset://sounds/action_footsteps_plastic.mp3"
var36.Looped = true
var36.Pitch = 1.85
var27_upvr.Running = var36
var36 = {}
local var37 = var36
var37.SoundId = "rbxasset://sounds/impact_water.mp3"
var27_upvr.Splash = var37
var37 = {}
local var38 = var37
var38.SoundId = "rbxasset://sounds/action_swim.mp3"
var38.Looped = true
var38.Pitch = 1.6
var27_upvr.Swimming = var38
var38 = {}
local var39_upvr = var38
local tbl_5 = {}
getRelativeVelocity_upvr = "rbxasset://sounds/action_footsteps_plastic.mp3"
tbl_5.AssetId = getRelativeVelocity_upvr
getRelativeVelocity_upvr = true
tbl_5.Looping = getRelativeVelocity_upvr
var39_upvr.Climbing = tbl_5
local tbl_7 = {}
getRelativeVelocity_upvr = "rbxasset://sounds/uuhhh.mp3"
tbl_7.AssetId = getRelativeVelocity_upvr
var39_upvr.Died = tbl_7
local tbl_4 = {}
if var21_upvr then
	getRelativeVelocity_upvr = "rbxasset://sounds/action_falling.ogg"
else
	getRelativeVelocity_upvr = "rbxasset://sounds/action_falling.mp3"
end
tbl_4.AssetId = getRelativeVelocity_upvr
getRelativeVelocity_upvr = true
tbl_4.Looping = getRelativeVelocity_upvr
var39_upvr.FreeFalling = tbl_4
local tbl_6 = {}
getRelativeVelocity_upvr = "rbxasset://sounds/action_get_up.mp3"
tbl_6.AssetId = getRelativeVelocity_upvr
var39_upvr.GettingUp = tbl_6
local tbl_9 = {}
getRelativeVelocity_upvr = "rbxasset://sounds/action_jump.mp3"
tbl_9.AssetId = getRelativeVelocity_upvr
var39_upvr.Jumping = tbl_9
local tbl_3 = {}
getRelativeVelocity_upvr = "rbxasset://sounds/action_jump_land.mp3"
tbl_3.AssetId = getRelativeVelocity_upvr
var39_upvr.Landing = tbl_3
local tbl_2 = {}
getRelativeVelocity_upvr = "rbxasset://sounds/action_footsteps_plastic.mp3"
tbl_2.AssetId = getRelativeVelocity_upvr
getRelativeVelocity_upvr = true
tbl_2.Looping = getRelativeVelocity_upvr
getRelativeVelocity_upvr = 1.85
tbl_2.PlaybackSpeed = getRelativeVelocity_upvr
var39_upvr.Running = tbl_2
local tbl_8 = {}
getRelativeVelocity_upvr = "rbxasset://sounds/impact_water.mp3"
tbl_8.AssetId = getRelativeVelocity_upvr
var39_upvr.Splash = tbl_8
local tbl = {}
getRelativeVelocity_upvr = "rbxasset://sounds/action_swim.mp3"
tbl.AssetId = getRelativeVelocity_upvr
getRelativeVelocity_upvr = true
tbl.Looping = getRelativeVelocity_upvr
getRelativeVelocity_upvr = 1.6
tbl.PlaybackSpeed = getRelativeVelocity_upvr
var39_upvr.Swimming = tbl
local function _(arg1, arg2, arg3, arg4, arg5) -- Line 100, Named "map"
	return (arg1 - arg2) * (arg5 - arg4) / (arg3 - arg2) + arg4
end
function getRelativeVelocity_upvr(arg1, arg2) -- Line 104, Named "getRelativeVelocity"
	if not arg1 then
		return arg2
	end
	local var49
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var49 = arg1.GroundSensor
		return var49
	end
	if var49 and (not arg1.ActiveController:IsA("GroundController") or not INLINED()) then
		var49 = arg1.ActiveController:IsA("ClimbController")
		if var49 then
			var49 = arg1.ClimbSensor
		end
	end
	if var49 and var49.SensedPart then
		return arg2 - var49.SensedPart:GetVelocityAtPosition(arg1.RootPart.Position)
	end
	return arg2
end
local function _(arg1, arg2) -- Line 121, Named "playSound"
	--[[ Upvalues[1]:
		[1]: var26_upvr (readonly)
	]]
	if not arg2 then
		arg1.TimePosition = 0
	end
	if var26_upvr and arg1:IsA("AudioPlayer") then
		arg1:Play()
	else
		arg1.Playing = true
	end
end
local function _(arg1) -- Line 132, Named "stopSound"
	--[[ Upvalues[1]:
		[1]: var26_upvr (readonly)
	]]
	if var26_upvr and arg1:IsA("AudioPlayer") then
		arg1:Stop()
	else
		arg1.Playing = false
	end
end
local function _(arg1, arg2) -- Line 140, Named "playSoundIf"
	--[[ Upvalues[1]:
		[1]: var26_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 16. Error Block 8 start (CF ANALYSIS FAILED)
	arg1:Play()
	do
		return
	end
	-- KONSTANTERROR: [19] 16. Error Block 8 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 19. Error Block 9 start (CF ANALYSIS FAILED)
	arg1.Playing = arg2
	-- KONSTANTERROR: [23] 19. Error Block 9 end (CF ANALYSIS FAILED)
end
local function _(arg1, arg2) -- Line 152, Named "setSoundLooped"
	--[[ Upvalues[1]:
		[1]: var26_upvr (readonly)
	]]
	if var26_upvr and arg1:IsA("AudioPlayer") then
		arg1.Looping = arg2
	else
		arg1.Looped = arg2
	end
end
local function _(arg1) -- Line 160, Named "shallowCopy"
	local module = {}
	for i, v in pairs(arg1) do
		module[i] = v
	end
	return module
end
local var58_upvr = pcall_result1_3 and pcall_result2_2
local SoundService_upvr = game:GetService("SoundService")
local RunService_upvr = game:GetService("RunService")
local any_new_result1_upvr = require(script:WaitForChild("AtomicBinding")).new({
	humanoid = "Humanoid";
	rootPart = "HumanoidRootPart";
}, function(arg1) -- Line 168, Named "initializeSoundSystem"
	--[[ Upvalues[9]:
		[1]: var58_upvr (readonly)
		[2]: var26_upvr (readonly)
		[3]: SoundService_upvr (readonly)
		[4]: Players_upvr (readonly)
		[5]: var39_upvr (readonly)
		[6]: var27_upvr (readonly)
		[7]: var21_upvr (readonly)
		[8]: getRelativeVelocity_upvr (readonly)
		[9]: RunService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 12. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 12. Error Block 3 end (CF ANALYSIS FAILED)
end)
local tbl_upvr = {}
local function characterAdded_upvr(arg1) -- Line 403, Named "characterAdded"
	--[[ Upvalues[1]:
		[1]: any_new_result1_upvr (readonly)
	]]
	any_new_result1_upvr:bindRoot(arg1)
end
local function characterRemoving_upvr(arg1) -- Line 407, Named "characterRemoving"
	--[[ Upvalues[1]:
		[1]: any_new_result1_upvr (readonly)
	]]
	any_new_result1_upvr:unbindRoot(arg1)
end
for _, v_3 in ipairs(Players_upvr:GetPlayers()) do
	task.spawn(function(arg1) -- Line 411, Named "playerAdded"
		--[[ Upvalues[4]:
			[1]: tbl_upvr (readonly)
			[2]: any_new_result1_upvr (readonly)
			[3]: characterAdded_upvr (readonly)
			[4]: characterRemoving_upvr (readonly)
		]]
		local var64 = tbl_upvr[arg1]
		if not var64 then
			var64 = {}
			tbl_upvr[arg1] = var64
		end
		if arg1.Character then
			any_new_result1_upvr:bindRoot(arg1.Character)
		end
		table.insert(var64, arg1.CharacterAdded:Connect(characterAdded_upvr))
		table.insert(var64, arg1.CharacterRemoving:Connect(characterRemoving_upvr))
	end, v_3)
	local var74
end
Players_upvr.PlayerAdded:Connect(var74)
Players_upvr.PlayerRemoving:Connect(function(arg1) -- Line 425, Named "playerRemoving"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: any_new_result1_upvr (readonly)
	]]
	local var67 = tbl_upvr[arg1]
	if var67 then
		for _, v_2 in ipairs(var67) do
			v_2:Disconnect()
		end
		tbl_upvr[arg1] = nil
	end
	if arg1.Character then
		any_new_result1_upvr:unbindRoot(arg1.Character)
	end
end)