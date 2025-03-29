--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.screen
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:41
-- Luau version 6, Types version 3
-- Time taken: 0.000413 seconds

local create_upvr = require("../../roblox_packages/vide").create
return function(arg1) -- Line 14
	--[[ Upvalues[1]:
		[1]: create_upvr (readonly)
	]]
	return create_upvr("ScreenGui")({
		Name = arg1.name;
		Enabled = arg1.enabled;
		DisplayOrder = arg1.display_order;
		
		unpack(arg1)
	})
end