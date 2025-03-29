--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.stories.app.story
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:52
-- Luau version 6, Types version 3
-- Time taken: 0.000520 seconds

local .__state_upvr = require("../state")
local ._____roblox_packages_conch_upvr = require("../../roblox_packages/conch")
local ._____roblox_packages_vide_upvr = require("../../roblox_packages/vide")
local .__app_upvr = require("../app")
return function(arg1) -- Line 7
	--[[ Upvalues[4]:
		[1]: .__state_upvr (readonly)
		[2]: ._____roblox_packages_conch_upvr (readonly)
		[3]: ._____roblox_packages_vide_upvr (readonly)
		[4]: .__app_upvr (readonly)
	]]
	.__state_upvr.opened(true)
	._____roblox_packages_conch_upvr.register_default_commands()
	._____roblox_packages_conch_upvr._.create_local_user()
	return ._____roblox_packages_vide_upvr.mount(function() -- Line 11
		--[[ Upvalues[1]:
			[1]: .__app_upvr (copied, readonly)
		]]
		return .__app_upvr()
	end, arg1)
end