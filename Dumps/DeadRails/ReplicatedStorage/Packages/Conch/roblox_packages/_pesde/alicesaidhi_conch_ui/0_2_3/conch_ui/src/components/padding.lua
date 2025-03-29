--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.padding
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:15
-- Luau version 6, Types version 3
-- Time taken: 0.000572 seconds

local create_upvr = require("../../roblox_packages/vide").create
return function(arg1) -- Line 16, Named "padding"
	--[[ Upvalues[1]:
		[1]: create_upvr (readonly)
	]]
	local var2 = arg1.padding or 0
	local var3 = arg1.x or var2
	local var4 = arg1.y or var2
	return create_upvr("UIPadding")({
		PaddingLeft = UDim.new(0, arg1.left or var3);
		PaddingRight = UDim.new(0, arg1.right or var3);
		PaddingTop = UDim.new(0, arg1.top or var4);
		PaddingBottom = UDim.new(0, arg1.bottom or var4);
	})
end