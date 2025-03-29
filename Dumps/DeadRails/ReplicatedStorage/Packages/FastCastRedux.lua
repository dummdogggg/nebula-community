--[[
    Script: ReplicatedStorage.Packages.FastCastRedux
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:23
-- Luau version 6, Types version 3
-- Time taken: 0.001163 seconds

local module_upvr = {
	DebugLogging = false;
	VisualizeCasts = false;
}
module_upvr.__index = module_upvr
module_upvr.__type = "FastCast"
module_upvr.HighFidelityBehavior = {
	Default = 1;
	Always = 3;
}
local ActiveCast_upvr = require(script.ActiveCast)
ActiveCast_upvr.SetStaticFastCastReference(module_upvr)
local Signal_upvr = require(script.Signal)
function module_upvr.new() -- Line 107
	--[[ Upvalues[2]:
		[1]: Signal_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	return setmetatable({
		LengthChanged = Signal_upvr.new("LengthChanged");
		RayHit = Signal_upvr.new("RayHit");
		RayPierced = Signal_upvr.new("RayPierced");
		CastTerminating = Signal_upvr.new("CastTerminating");
		WorldRoot = workspace;
	}, module_upvr)
end
function module_upvr.newBehavior() -- Line 119
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return {
		RaycastParams = nil;
		Acceleration = Vector3.new();
		MaxDistance = 1000;
		CanPierceFunction = nil;
		HighFidelityBehavior = module_upvr.HighFidelityBehavior.Default;
		HighFidelitySegmentSize = 0.5;
		CosmeticBulletTemplate = nil;
		CosmeticBulletProvider = nil;
		CosmeticBulletContainer = nil;
		AutoIgnoreContainer = true;
	}
end
local any_newBehavior_result1_upvr = module_upvr.newBehavior()
function module_upvr.Fire(arg1, arg2, arg3, arg4, arg5) -- Line 136
	--[[ Upvalues[2]:
		[1]: any_newBehavior_result1_upvr (readonly)
		[2]: ActiveCast_upvr (readonly)
	]]
	if arg5 == nil then
	end
	local any_new_result1 = ActiveCast_upvr.new(arg1, arg2, arg3, arg4, any_newBehavior_result1_upvr)
	any_new_result1.RayInfo.WorldRoot = arg1.WorldRoot
	return any_new_result1
end
return module_upvr