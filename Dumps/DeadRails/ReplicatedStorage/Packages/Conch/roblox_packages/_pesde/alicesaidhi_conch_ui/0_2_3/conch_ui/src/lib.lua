--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.lib
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:25
-- Luau version 6, Types version 3
-- Time taken: 0.001113 seconds

local Players_upvr = game:GetService("Players")
local ._app_upvr = require("./app")
local ._state = require("./state")
local .__roblox_packages_vide_upvr = require("../roblox_packages/vide")
local var5_upvw = false
local opened_upvr = ._state.opened
local ContextActionService_upvr = game:GetService("ContextActionService")
local focused_upvr = ._state.focused
return {
	app = ._app_upvr;
	mount = function() -- Line 12, Named "mount"
		--[[ Upvalues[4]:
			[1]: var5_upvw (read and write)
			[2]: .__roblox_packages_vide_upvr (readonly)
			[3]: ._app_upvr (readonly)
			[4]: Players_upvr (readonly)
		]]
		if var5_upvw then return end
		var5_upvw = true
		return .__roblox_packages_vide_upvr.mount(._app_upvr, Players_upvr.LocalPlayer:WaitForChild("PlayerGui"))
	end;
	opened = opened_upvr;
	bind_to = function(arg1) -- Line 18, Named "bind_to"
		--[[ Upvalues[7]:
			[1]: var5_upvw (read and write)
			[2]: .__roblox_packages_vide_upvr (readonly)
			[3]: ._app_upvr (readonly)
			[4]: Players_upvr (readonly)
			[5]: ContextActionService_upvr (readonly)
			[6]: opened_upvr (readonly)
			[7]: focused_upvr (readonly)
		]]
		if var5_upvw then
		else
			var5_upvw = true
		end
		ContextActionService_upvr:BindAction("Trigger Conch", function(arg1_2, arg2) -- Line 20
			--[[ Upvalues[2]:
				[1]: opened_upvr (copied, readonly)
				[2]: focused_upvr (copied, readonly)
			]]
			if arg2 == Enum.UserInputState.Begin then
				opened_upvr(not opened_upvr())
				focused_upvr(opened_upvr())
			end
		end, false, arg1)
	end;
	conch = require("../roblox_packages/conch");
}