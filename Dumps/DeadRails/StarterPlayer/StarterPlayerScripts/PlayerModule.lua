--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:23
-- Luau version 6, Types version 3
-- Time taken: 0.000686 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new() -- Line 12
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.cameras = require(script:WaitForChild("CameraModule"))
	setmetatable_result1.controls = require(script:WaitForChild("ControlModule"))
	return setmetatable_result1
end
function module_upvr.GetCameras(arg1) -- Line 19
	return arg1.cameras
end
function module_upvr.GetControls(arg1) -- Line 23
	return arg1.controls
end
function module_upvr.GetClickToMoveController(arg1) -- Line 27
	return arg1.controls:GetClickToMoveController()
end
return module_upvr.new()