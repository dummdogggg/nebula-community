--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.BaseOcclusion
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:42
-- Luau version 6, Types version 3
-- Time taken: 0.001090 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
setmetatable(module_upvr, {
	__call = function(arg1, ...) -- Line 10, Named "__call"
		--[[ Upvalues[1]:
			[1]: module_upvr (readonly)
		]]
		return module_upvr.new(...)
	end;
})
function module_upvr.new() -- Line 15
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return setmetatable({}, module_upvr)
end
function module_upvr.CharacterAdded(arg1, arg2, arg3) -- Line 21
end
function module_upvr.CharacterRemoving(arg1, arg2, arg3) -- Line 25
end
function module_upvr.OnCameraSubjectChanged(arg1, arg2) -- Line 28
end
function module_upvr.GetOcclusionMode(arg1) -- Line 32
	warn("BaseOcclusion GetOcclusionMode must be overridden by derived classes")
	return nil
end
function module_upvr.Enable(arg1, arg2) -- Line 38
	warn("BaseOcclusion Enable must be overridden by derived classes")
end
function module_upvr.Update(arg1, arg2, arg3, arg4) -- Line 42
	warn("BaseOcclusion Update must be overridden by derived classes")
	return arg3, arg4
end
return module_upvr