--[[
    Script: ReplicatedStorage.Shared.Utils.bindToInstanceDestroyed
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:52
-- Luau version 6, Types version 3
-- Time taken: 0.000520 seconds

local DestructionHandler_upvr = script.DestructionHandler
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
return function(arg1, arg2) -- Line 10, Named "bindToInstanceDestroyed"
	--[[ Upvalues[2]:
		[1]: DestructionHandler_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	local clone_upvr = DestructionHandler_upvr:Clone()
	clone_upvr.Parent = LocalPlayer_upvr.PlayerScripts
	task.defer(function() -- Line 15
		--[[ Upvalues[3]:
			[1]: clone_upvr (readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
		]]
		clone_upvr.Bind:Fire(arg1, arg2)
	end)
end