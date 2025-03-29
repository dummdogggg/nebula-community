--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch.0.2.3.conch.src.context
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:46
-- Luau version 6, Types version 3
-- Time taken: 0.000688 seconds

local ._state_upvr = require("./state")
return {
	create_command_context = function(arg1, arg2) -- Line 4, Named "create_command_context"
		--[[ Upvalues[1]:
			[1]: ._state_upvr (readonly)
		]]
		assert(not ._state_upvr.command_context[coroutine.running()], "there is already a command context for this thread")
		local tbl = {}
		tbl.executor = arg1
		tbl.invocation_id = arg2
		._state_upvr.command_context[coroutine.running()] = tbl
		return function() -- Line 17
			--[[ Upvalues[1]:
				[1]: ._state_upvr (copied, readonly)
			]]
			._state_upvr.command_context[coroutine.running()] = nil
		end
	end;
	get_command_context = function() -- Line 20, Named "get_command_context"
		--[[ Upvalues[1]:
			[1]: ._state_upvr (readonly)
		]]
		return ._state_upvr.command_context[coroutine.running()]
	end;
}