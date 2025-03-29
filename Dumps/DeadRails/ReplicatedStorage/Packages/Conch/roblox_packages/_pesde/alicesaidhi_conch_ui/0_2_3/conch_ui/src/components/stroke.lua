--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.stroke
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:19
-- Luau version 6, Types version 3
-- Time taken: 0.000427 seconds

local create_upvr = require("../../roblox_packages/vide").create
local .__theme_upvr = require("../theme")
return function(arg1) -- Line 13
	--[[ Upvalues[2]:
		[1]: create_upvr (readonly)
		[2]: .__theme_upvr (readonly)
	]]
	return create_upvr("UIStroke")({
		Thickness = arg1.thickness;
		Color = .__theme_upvr.stroke;
		
		unpack(arg1)
	})
end